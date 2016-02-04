Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B181A770C5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:49:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 04 Feb 2016 14:49:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="647391873"
Received: from rravin1x-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.111])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2016 14:49:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 05 Feb 2016 11:49:38 +1300
Message-ID: <1602570.ZxlQ9Ts2Am@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.4-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: benjamin.esquivel@intel.com
Subject: Re: [PATCH v3 00/22] Add Extensible SDK test suite
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
X-List-Received-Date: Thu, 04 Feb 2016 22:49:45 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thu, 04 Feb 2016 16:29:17 An=EDbal Lim=F3n wrote:
> Summary of changes,
>=20
> =09- Add new class called testsdk that now have the tests for SDK and=
 eSDK.
> =09- TestContext -> {Image, SDK, SDKExt}: Remove all duplicate code i=
nside
> =09  testimage and testsdk class move into oeqa/oetest and create cla=
ss per
> =09  type of Test.
> =09- Extensible SDK fixes usage with proxies, when eSDK is configurin=
g it
> =09  executes setscene tasks that needs network acces if was build wi=
th=20
sstate
> mirrors.
>=20
> Testing was made building/running SDK and eSDK for core-image-minimal=
 and
> core-image-sato, also testimage was run in core-image-minimal and
> core-image-sato with QemuRemote and SimpleRemote to ensure that nothi=
ng was
> break.
>=20
> This patchset DEPENDS on bitbake change to export proxies and NEEDS t=
o be
> MERGED before, see: bb/fetch2: Move export_proxies function from wget=
 to
> utils.
>=20
> These v3 is the same of v2 on code only fixes issues of squashing and=
 one
> for don't make reverts in the patch series.
>=20
> The following changes since commit b33e440cc6fbd703e8045d94b806790343=
e72eb6:
>=20
>   libical: Work around hardcoded paths in pkgconfig file (2016-02-04
> 13:09:56 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib alimon/esdk_testsuite_v3
> =20
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dalimon/esd=
k_testsu
> ite_v3
>=20
> An=EDbal Lim=F3n (22):
>   testimage: Modularize helper functions for get test lists.
>   classes/testsdk: Add new class testsdk.
>   classes/testimage: Add defeault inherit for testsdk.
>   populate_sdk_ext: Set TOOLCHAINEXT_OUTPUTNAME.
>   get_test_suites: Add sdkext type for load test suites.
>   classes/testsdk: Add testsdkext task only install.
>   bb/fetch2: Move export_proxies function from wget to utils.
>   classes/testsdk: Add call to export_proxies on testsdkext.
>   toolchain-shar-extract.sh: Add proxy variable to new env.
>   testimage/testsdk: Modularize TestContext.
>   testimage/testsdk: Move get test suites routine inside TestContext.=

>   oetest.py/TestContext: Move loadTests and runTests inside it.
>   classes/testsdk: Add function run_test_context
>   oeqa/oetest: oeSDKTest when run a command redirect env output to nu=
ll
>   classes/testsdk: Add compatibility SDK testsuite to eSDK
>   testsdkext: Add skeleton for support Extensible SDK tests.
>   classes/populate_sdk_ext: Add SDK_EXT_TARGET_MANIFEST and
>     SDK_EXT_HOST_MANIFEST
>   oeqa/oetest: Fix compatibility SDK tests using eSDK.
>   oeqa/sdkext: Add devtool basic tests for eSDK.
>   oeqa/sdkext/devtool.py: Add location test to ensure that devtool is=

>     the eSDK one.
>   classes/testsdk: Add help information on how to run tests.
>   classes/testimage: Fix exportTests function.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

