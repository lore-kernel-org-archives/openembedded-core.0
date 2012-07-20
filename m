Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SsFeS-00024u-RG
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 18:02:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jul 2012 08:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="195590544"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2012 08:50:24 -0700
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 20 Jul 2012 08:50:24 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.44]) by
	ORSMSX151.amr.corp.intel.com ([169.254.7.82]) with mapi id
	14.01.0355.002; Fri, 20 Jul 2012 08:50:23 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Thread-Topic: [PATCH 0/3] linux-yocto: consolidated pull
Thread-Index: AQHNZostkb89UUEamE+XTvyWPgrk1pcyS5oggAB4dYD//41sYA==
Date: Fri, 20 Jul 2012 15:50:23 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0318C6C1@ORSMSX106.amr.corp.intel.com>
References: <cover.1342796935.git.bruce.ashfield@windriver.com>
	<ADD6A3980E8C39419A432FF422031B4C0318C688@ORSMSX106.amr.corp.intel.com>
	<50097BC7.9020501@windriver.com>
In-Reply-To: <50097BC7.9020501@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 0/3] linux-yocto: consolidated pull
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2012 16:02:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@windriver.com]
> Sent: Friday, July 20, 2012 9:10 PM
> To: Kamble, Nitin A
> Cc: richard.purdie@linuxfoundation.org; Wold, Saul; Zanussi, Tom;
> andrea.adami@gmail.com; rpjday@crashcourse.ca; openembedded-
> core@lists.openembedded.org
> Subject: Re: [PATCH 0/3] linux-yocto: consolidated pull
>=20
> On 12-07-20 11:34 AM, Kamble, Nitin A wrote:
> >
> >
> >> -----Original Message-----
> >> From: Bruce Ashfield [mailto:bruce.ashfield@windriver.com]
> >> Sent: Friday, July 20, 2012 8:49 PM
> >> To: richard.purdie@linuxfoundation.org
> >> Cc: Wold, Saul; Zanussi, Tom; Kamble, Nitin A;
> >> andrea.adami@gmail.com; rpjday@crashcourse.ca;
> >> openembedded-core@lists.openembedded.org
> >> Subject: [PATCH 0/3] linux-yocto: consolidated pull
> >>
> >> Richard/Saul,
> >>
> >> I've got some -stable updates, -rt updates and other changes that are
> >> almost done, but I wanted to get these smaller patches out of my queue
> first.
> >>
> >> We have some cleanup patches from Robert P. J. Day and a meta branch
> >> update for EMGD, CONFIG_MTD_NAND_VERIFY_WRITE and kmemcheck.
> >>
> >> I've gone ahead and pushed the emgd update from Nitin, if it requires
> >> re- work, we'll just add more commits to the branch.
> >>
> >> Tom/Nitin: speak up if there's a problem with this!
> >>
> > Bruce,
> >     I notice that in the meta branch you also created patches for commi=
ts
> from the emgd-1.14 branch such as meta/cfg/kernel-
> cache/features/emgd/yocto-emgd-emgd-1.14-driver.patch. So emgd-1.14
> support is available by 2 ways now. 1: By enabling these patches&  2: by
> merging the emgd-1.14 branch. For crownbay it is merging the emgd-1.14
> branch, so these patches from meta directory can not be used.
>=20
> .. and they aren't supposed to be used, are there any BSPs actively inclu=
ding
> the emgd-1.14 feature ? I didn't see any, so I left the patches in the fe=
ature
> description. If a BSP does a git merge of the branch, it shouldn't includ=
e the
> feature, since as you mention, that would push the patches again.
>=20
> It's just providing options, since merging branches isn't always possible=
.
>=20
> >    I don't see any functional issue with this layout, but I am curious =
why
> these patches in meta branch when emgd-1.14 branch can be merged to get
> the same effect.
>=20
> The kernel-cache should always have the raw patches that you find on the
> branches. Some prefer the patches (and don't want to dump the from the
> branches) and they document the commits on the branches.
>=20
> I for one always use the merge, and prefer the branch only commits, but m=
y
> inbox is full from people requesting the raw patches over the years :)
>=20

Bruce,
   Thanks for the clarification. :)
Nitin

> Cheers,
>=20
> Bruce
>=20
> >
> > Thanks,
> > Nitin
> >
> >> Cheers,
> >>
> >> Bruce
> >>
> >> cc: Nitin A Kamble<nitin.a.kamble@intel.com>
> >> cc: Tom Zanussi<tom.zanussi@intel.com>
> >> cc: Andrea Adami<andrea.adami@gmail.com>
> >> cc: Robert P. J. Day<rpjday@crashcourse.ca>
> >>
> >> The following changes since commit
> >> 98a1fd1e734db50380a3a37d35767ccb4cc21f7c:
> >>
> >>    documentation: Config fragment sections updated (2012-07-20
> >> 12:32:54
> >> +0100)
> >>
> >> are available in the git repository at:
> >>    git://git.pokylinux.org/poky-contrib zedd/kernel
> >>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel
> >>
> >> Bruce Ashfield (1):
> >>    linux-yocto/3.4: emgd, mtd nand and kmemcheck fixes
> >>
> >> Robert P. J. Day (2):
> >>    kernel-yocto.bbclass: Fix some obvious typoes in comments.
> >>    kernel-yocto.bbclass: Delete superfluous creation of ${S}/.git
> >>      directory
> >>
> >>   meta/classes/kernel-yocto.bbclass               |    8 ++++----
> >>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
> >>   meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
> >>   3 files changed, 6 insertions(+), 6 deletions(-)
> >>
> >> --
> >> 1.7.5.4
> >



