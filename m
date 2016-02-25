Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 17AC060721
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 08:41:24 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 25 Feb 2016 00:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,497,1449561600"; d="scan'208";a="54455965"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2016 00:41:24 -0800
Received: from irsmsx151.ger.corp.intel.com ([169.254.4.72]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.19]) with mapi id
	14.03.0248.002; Thu, 25 Feb 2016 08:41:23 +0000
From: "Istrate, Daniel AlexandruX" <daniel.alexandrux.istrate@intel.com>
To: "Radzykewycz, Tim O (Wind River)" <radzy@windriver.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] what is the priority of wildcarded .bbappend files?
Thread-Index: AQHRb0NXSXIcONbnK0+QL3oywYG+4587qkgAgAANFACAABY3gIAAAduAgAAA5gCAAAKdgIAAnZyw
Date: Thu, 25 Feb 2016 08:41:22 +0000
Message-ID: <174AD7CFE5F468498ACCFE3FEE0EF1EB14318116@IRSMSX151.ger.corp.intel.com>
References: <20160224152850.164043qmdvkuzbeo@astoria.ccjclearline.com>
	<1629258.jkM8Gdqopn@peggleto-mobl.ger.corp.intel.com>
	<33006C99F5A5194A9B7A7715DFA3E383EB81CFA2@ALA-MBB.corp.ad.wrs.com>,
	<1797799.y7uMzTcXlY@peggleto-mobl.ger.corp.intel.com>
	<33006C99F5A5194A9B7A7715DFA3E383EB81CFBF@ALA-MBB.corp.ad.wrs.com>
In-Reply-To: <33006C99F5A5194A9B7A7715DFA3E383EB81CFBF@ALA-MBB.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjI1NzVmZDAtZTA5NC00OGEyLThkOTktMTQwZGFkNjgyYWMwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6Imx5RFFoSGV4d3NORHZPWnNBU1pEV3VcLytcL1pUNFphcm5cL1ZGMlQ4bVBWVXc9In0=
x-ctpclassification: CTP_IC
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: what is the priority of wildcarded .bbappend files?
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
X-List-Received-Date: Thu, 25 Feb 2016 08:41:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

This might be related to bug 9138 (https://bugzilla.yoctoproject.org/show_b=
ug.cgi?id=3D9138 ) so the bbappend order might not be the expected one.

--Daniel

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Radzykewycz, T (Radzy)
Sent: Thursday, February 25, 2016 01:12
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Christopher Larson <clarson@kergoth.com>; openembedded-core@lists.opene=
mbedded.org
Subject: Re: [OE-core] what is the priority of wildcarded .bbappend files?


________________________________________
On Wednesday, February 24, 2016 3:02 PM, Paul Eggleton said:
> On Wed, 24 Feb 2016 22:59:13 Radzykewycz, T wrote:
> > On Wednesday, February 24, 2016 2:52 PM, Paul Eggleton said:
> > > On Wed, 24 Feb 2016 16:33:04 Robert P. J. Day wrote:
> > > > Quoting Christopher Larson <clarson@kergoth.com>:
> > > > > All appends that apply to a given recipe will be applied to=20
> > > > > that recipe.
> > > > > Order is determined solely by layer priority.
> > > > >
> > > >    wait ... so *all* bbappend files that match a recipe will be app=
lied?
> > > >
> > > > i'm embarrassed that i didn't know that, is that mentioned in=20
> > > > the documentation somewhere?
> > >
> > > Surprisingly we don't currently state this explicitly, though it's=20
> > > implied. We should work this into the relevant part of the bitbake=20
> > > manual and the "Using .bbappend Files" section of the dev manual.=20
> > > Scott could you add that to your todo list?
> >
> > If there is any way to determine the order that the bbappend files=20
> > are included, that would be helpful.  As well as determining what=20
> > order patches will be applied (which is, I suspect, determined in=20
> > part by what order the bbappend files are included)..
>=20
> bitbake-layers show-appends will give you the former. Patches get=20
> applied strictly in the order they appear in SRC_URI, if you have=20
> bbappends that append or prepend that variable that will of course=20
> influence that, but the final value and hence the order should be=20
> visible through bitbake -e recipename
> | less and then search for ^SRC_URI (along with history of how the=20
> | value came
> to be).

I suggest this might be put into the SRC_URI section at https://www.yoctopr=
oject.org/docs/1.6/bitbake-user-manual/bitbake-user-manual.html#var-SECTION
and worded something like this (at the end):

    The order of patch application follows the order that
    the patch files are included in the final SRC_URI value.
    So patches in prepended SRC_URI additions are put before
    other patches that might be contained in the base bb file or
    in other bbappend files, and must not generate differences
    that prevent subsequent patches from applying.

I'm not tied to any particular location in the docs, though, so if it shoul=
d go elsewhere, that's fine with me.

Enjoy!

				-- radzy
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

