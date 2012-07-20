Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SsFOZ-0001PM-UE
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 17:45:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jul 2012 08:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181423489"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2012 08:34:11 -0700
Received: from orsmsx104.amr.corp.intel.com (10.22.225.131) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 20 Jul 2012 08:34:11 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.44]) by
	ORSMSX104.amr.corp.intel.com ([169.254.3.210]) with mapi id
	14.01.0355.002; Fri, 20 Jul 2012 08:34:10 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [PATCH 0/3] linux-yocto: consolidated pull
Thread-Index: AQHNZostkb89UUEamE+XTvyWPgrk1pcyS5og
Date: Fri, 20 Jul 2012 15:34:09 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0318C688@ORSMSX106.amr.corp.intel.com>
References: <cover.1342796935.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1342796935.git.bruce.ashfield@windriver.com>
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
X-List-Received-Date: Fri, 20 Jul 2012 15:45:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@windriver.com]
> Sent: Friday, July 20, 2012 8:49 PM
> To: richard.purdie@linuxfoundation.org
> Cc: Wold, Saul; Zanussi, Tom; Kamble, Nitin A; andrea.adami@gmail.com;
> rpjday@crashcourse.ca; openembedded-core@lists.openembedded.org
> Subject: [PATCH 0/3] linux-yocto: consolidated pull
>=20
> Richard/Saul,
>=20
> I've got some -stable updates, -rt updates and other changes that are alm=
ost
> done, but I wanted to get these smaller patches out of my queue first.
>=20
> We have some cleanup patches from Robert P. J. Day and a meta branch
> update for EMGD, CONFIG_MTD_NAND_VERIFY_WRITE and kmemcheck.
>=20
> I've gone ahead and pushed the emgd update from Nitin, if it requires re-
> work, we'll just add more commits to the branch.
>=20
> Tom/Nitin: speak up if there's a problem with this!
>=20
Bruce,
   I notice that in the meta branch you also created patches for commits fr=
om the emgd-1.14 branch such as meta/cfg/kernel-cache/features/emgd/yocto-e=
mgd-emgd-1.14-driver.patch. So emgd-1.14 support is available by 2 ways now=
. 1: By enabling these patches & 2: by merging the emgd-1.14 branch. For cr=
ownbay it is merging the emgd-1.14 branch, so these patches from meta direc=
tory can not be used.=20
  I don't see any functional issue with this layout, but I am curious why t=
hese patches in meta branch when emgd-1.14 branch can be merged to get the =
same effect.

Thanks,
Nitin

> Cheers,
>=20
> Bruce
>=20
> cc: Nitin A Kamble <nitin.a.kamble@intel.com>
> cc: Tom Zanussi <tom.zanussi@intel.com>
> cc: Andrea Adami <andrea.adami@gmail.com>
> cc: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> The following changes since commit
> 98a1fd1e734db50380a3a37d35767ccb4cc21f7c:
>=20
>   documentation: Config fragment sections updated (2012-07-20 12:32:54
> +0100)
>=20
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel
>=20
> Bruce Ashfield (1):
>   linux-yocto/3.4: emgd, mtd nand and kmemcheck fixes
>=20
> Robert P. J. Day (2):
>   kernel-yocto.bbclass: Fix some obvious typoes in comments.
>   kernel-yocto.bbclass: Delete superfluous creation of ${S}/.git
>     directory
>=20
>  meta/classes/kernel-yocto.bbclass               |    8 ++++----
>  meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
>=20
> --
> 1.7.5.4



