Return-Path: <radzy@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83F0960557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 15:18:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7LFI2S5014300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Aug 2015 08:18:02 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.3.206]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0235.001;
	Fri, 21 Aug 2015 08:18:01 -0700
From: "Radzykewycz, T (Radzy)" <radzy@windriver.com>
To: Khem Raj <raj.khem@gmail.com>, "BURTON, ROSS" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCHv2 1/1] screen: Upgrade 4.0.3 -> 4.3.1
Thread-Index: AQHQ214T/RTVAhp3Tk2Wq+uqAD3auZ4VUqw+gACL9ICAAAHbgIAAsXI4
Date: Fri, 21 Aug 2015 15:18:01 +0000
Message-ID: <33006C99F5A5194A9B7A7715DFA3E383DC174F62@ALA-MBB.corp.ad.wrs.com>
References: <cover.1439471616.git.jussi.kukkonen@intel.com>
	<10269744a7e91ddf317b041f70d5810ae5c94c36.1439471616.git.jussi.kukkonen@intel.com>
	<20150818083635.GE2458@jama>
	<CAHiDW_EKTkPcQ+NVP9AocSfvpusiBtwp25rpkTDr5Zn0Ut=A4Q@mail.gmail.com>
	<tor.121455D5F425.1070308@windriver.com>
	<33006C99F5A5194A9B7A7715DFA3E383DC174C19@ALA-MBB.corp.ad.wrs.com>
	<CAJTo0LZJv5pJv+x46LjMa_NzT3hppzfUewHNBZjPa-i_owDdNQ@mail.gmail.com>,
	<CAMKF1sonYtB4VySwxO5r8Fkw4JBC+hQjZEF5ENcHHx1TmLPDsA@mail.gmail.com>
In-Reply-To: <CAMKF1sonYtB4VySwxO5r8Fkw4JBC+hQjZEF5ENcHHx1TmLPDsA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.78]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/1] screen: Upgrade 4.0.3 -> 4.3.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Aug 2015 15:18:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


________________________________________
> From: Khem Raj [raj.khem@gmail.com]       =20
> Sent: Thursday, August 20, 2015 2:41 PM       =20
> To: BURTON, ROSS       =20
> Cc: Radzykewycz, T (Radzy); Patches and discussions about the oe-core lay=
er       =20
> Subject: Re: [OE-core] [PATCHv2 1/1] screen: Upgrade 4.0.3 -> 4.3.1      =
 =20
>       =20
> On Thu, Aug 20, 2015 at 2:34 PM, Burton, Ross <ross.burton@intel.com> wro=
te:       =20
> > Basically you need to have a good reason why oe-core should invest the =
time       =20
> > maintaining both modern screen and ancient screen (4.0.3 was released i=
n       =20
> > 2008).   The easiest solution would be for your distro to maintain a co=
py of       =20
> > ancient screen for people who want screen but also don't want GPLv3.  O=
r,       =20
> > switch to tmux which is BSD licensed.       =20
>       =20
> I think this will be common interest for more than one distro or       =20
> person. It will be good to start moving them into a new layer under      =
 =20
> meta-openembedded repo, something like meta-gplv2-pinned or       =20
> somethings, then users who are interested can prioritize this layer      =
 =20
> over oe-core and there by use these versions easily instead of what      =
 =20
> comes from oe-core.       =20

Thanks.  That sounds like a good approach.

Now to go investigate tmux....

