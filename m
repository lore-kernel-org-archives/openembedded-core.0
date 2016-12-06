Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8F03E71A50
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:54:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2016 13:54:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; 
	d="asc'?scan'208";a="1068817606"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.142])
	([10.219.5.142])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2016 13:54:40 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <5847341E.1020006@linux.intel.com>
Date: Tue, 6 Dec 2016 15:56:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
Subject: Re: [PATCH 00/32] OEQA Framework Refactor & Improvements
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
X-List-Received-Date: Tue, 06 Dec 2016 21:54:40 -0000
X-Groupsio-MsgNum: 90362
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ppORtJDm12d1BJOUAX2GF80QRMrGcOOdE"

--ppORtJDm12d1BJOUAX2GF80QRMrGcOOdE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/06/2016 03:43 PM, An=C3=ADbal Lim=C3=B3n wrote:
> This patchset is related to OEQA Framework for details read the RFC sen=
d to the
> Openembedded architecture ML.

Architecture thread,

http://lists.openembedded.org/pipermail/openembedded-architecture/2016-De=
cember/000351.html


>=20
> The following changes since commit 9e63f81c78e284c9b325fe04a1b59e61c7ad=
8a1a:
>=20
>   bitbake: ast: remove BBVERSIONS support (2016-11-30 15:48:10 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib alimon/oeqa_sdk_migration
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dalimon/oeq=
a_sdk_migration
>=20
> An=C3=ADbal Lim=C3=B3n (28):
>   oeqa/core: Add base OEQA framework
>   oeqa/core: Add loader, context and decorator modules
>   oeqa/core/decorator: Add support for OETestDepends
>   oeqa/core/decorator: Add support for OETestDataDepends and
>     skipIfDataVar
>   scripts/oe-test: Add new oe-test script
>   oeqa/core/context: Add support of OETestContextExecutor
>   oeqa/core/cases: Add example test cases
>   oeqa/core: Add README
>   oe/data: Add export2json function
>   classes/rootfs-postcommands: Add write_image_test_data
>   classes/populate_sdk_base: Add write_sdk_test_data to postprocess
>   oeqa/core: Change name of d to td
>   oeqa/utils/path: Add remove_safe function
>   oeqa: Move common files to oeqa/files instead of runtime only
>   oeqa/sdk: Move test cases inside cases directory
>   oeqa/{runtime,sdk}/files: Move testsdkmakefile from runtime to sdk
>     module
>   oeqa/sdk: Add case and context modules for the SDK component
>   classes/testsdk: Migrates testsdk.bbclass to use new OESDKTestContext=

>   oeqa/utils: Move targetbuild to buildproject module
>   oeqa/utils: {Target,SDK,}BuildProject remove dependency of bb
>   oeqa/sdk/cases: Migrate tests to the new OEQA framework
>   classes/testsdk: Remove the need of TEST_LOG_DIR variable
>   oeqa/sdkext: Move test cases inside cases directory
>   oeqa/sdkext: Adds case and context modules.
>   classes/testsdk: Migrate to use the new OESDKExtTestContext
>   oeqa/sdkext/cases: Migrate test case to new OEQA framework
>   oeqa/runtime: Fix TargetBuildProject instances
>   oeqa: Fix files handling on runtime tests.
>=20
> Mariano Lopez (4):
>   oeqa/core: Add utils module for OEQA framework
>   oeqa/core/decorator: Add support for OETestID and OETestTag
>   oeqa/core/decorator: Add support for OETimeout decorator
>   oeqa/core: Add tests for the OEQA framework
>=20
>  meta/classes/populate_sdk_base.bbclass             |   9 +-
>  meta/classes/rootfs-postcommands.bbclass           |  18 ++
>  meta/classes/testexport.bbclass                    |   5 +
>  meta/classes/testimage.bbclass                     |   4 +
>  meta/classes/testsdk.bbclass                       | 162 ++++++++-----=
-
>  meta/lib/oe/data.py                                |  28 +++
>  meta/lib/oeqa/core/README                          |  38 ++++
>  meta/lib/oeqa/core/__init__.py                     |   0
>  meta/lib/oeqa/core/case.py                         |  46 ++++
>  meta/lib/oeqa/core/cases/__init__.py               |   0
>  meta/lib/oeqa/core/cases/example/data.json         |   1 +
>  meta/lib/oeqa/core/cases/example/test_basic.py     |  20 ++
>  meta/lib/oeqa/core/context.py                      | 225 +++++++++++++=
+++++++
>  meta/lib/oeqa/core/decorator/__init__.py           |  71 +++++++
>  meta/lib/oeqa/core/decorator/data.py               |  36 ++++
>  meta/lib/oeqa/core/decorator/depends.py            |  94 +++++++++
>  meta/lib/oeqa/core/decorator/oeid.py               |  23 ++
>  meta/lib/oeqa/core/decorator/oetag.py              |  24 +++
>  meta/lib/oeqa/core/decorator/oetimeout.py          |  25 +++
>  meta/lib/oeqa/core/exception.py                    |  14 ++
>  meta/lib/oeqa/core/loader.py                       | 235 +++++++++++++=
++++++++
>  meta/lib/oeqa/core/runner.py                       |  76 +++++++
>  meta/lib/oeqa/core/tests/__init__.py               |   0
>  meta/lib/oeqa/core/tests/cases/data.py             |  20 ++
>  meta/lib/oeqa/core/tests/cases/depends.py          |  38 ++++
>  .../oeqa/core/tests/cases/loader/invalid/oeid.py   |  15 ++
>  .../oeqa/core/tests/cases/loader/valid/another.py  |   9 +
>  meta/lib/oeqa/core/tests/cases/oeid.py             |  18 ++
>  meta/lib/oeqa/core/tests/cases/oetag.py            |  18 ++
>  meta/lib/oeqa/core/tests/cases/timeout.py          |  18 ++
>  meta/lib/oeqa/core/tests/common.py                 |  35 +++
>  meta/lib/oeqa/core/tests/test_data.py              |  51 +++++
>  meta/lib/oeqa/core/tests/test_decorators.py        | 135 ++++++++++++
>  meta/lib/oeqa/core/tests/test_loader.py            |  86 ++++++++
>  meta/lib/oeqa/core/tests/test_runner.py            |  38 ++++
>  meta/lib/oeqa/core/utils/__init__.py               |   0
>  meta/lib/oeqa/core/utils/misc.py                   |  37 ++++
>  meta/lib/oeqa/core/utils/path.py                   |  19 ++
>  meta/lib/oeqa/core/utils/test.py                   |  71 +++++++
>  meta/lib/oeqa/{runtime =3D> }/files/test.c           |   0
>  meta/lib/oeqa/{runtime =3D> }/files/test.cpp         |   0
>  meta/lib/oeqa/{runtime =3D> }/files/test.pl          |   0
>  meta/lib/oeqa/{runtime =3D> }/files/test.py          |   0
>  meta/lib/oeqa/oetest.py                            |  92 +-------
>  meta/lib/oeqa/runtime/buildcvs.py                  |   9 +-
>  meta/lib/oeqa/runtime/buildgalculator.py           |   8 +-
>  meta/lib/oeqa/runtime/buildiptables.py             |   8 +-
>  meta/lib/oeqa/runtime/gcc.py                       |   4 +-
>  meta/lib/oeqa/runtime/perl.py                      |   2 +-
>  meta/lib/oeqa/runtime/python.py                    |   2 +-
>  meta/lib/oeqa/runtime/utils/__init__.py            |   0
>  meta/lib/oeqa/runtime/utils/targetbuildproject.py  |  33 +++
>  meta/lib/oeqa/sdk/__init__.py                      |   3 -
>  meta/lib/oeqa/sdk/case.py                          |  12 ++
>  meta/lib/oeqa/sdk/{ =3D> cases}/buildcvs.py          |  15 +-
>  meta/lib/oeqa/sdk/{ =3D> cases}/buildgalculator.py   |  28 ++-
>  meta/lib/oeqa/sdk/{ =3D> cases}/buildiptables.py     |  16 +-
>  meta/lib/oeqa/sdk/cases/gcc.py                     |  43 ++++
>  meta/lib/oeqa/sdk/cases/perl.py                    |  27 +++
>  meta/lib/oeqa/sdk/{ =3D> cases}/python.py            |  25 ++-
>  meta/lib/oeqa/sdk/context.py                       | 133 ++++++++++++
>  .../oeqa/{runtime =3D> sdk}/files/testsdkmakefile    |   0
>  meta/lib/oeqa/sdk/gcc.py                           |  36 ----
>  meta/lib/oeqa/sdk/perl.py                          |  28 ---
>  meta/lib/oeqa/sdk/utils/__init__.py                |   0
>  meta/lib/oeqa/sdk/utils/sdkbuildproject.py         |  45 ++++
>  meta/lib/oeqa/sdkext/__init__.py                   |   3 -
>  meta/lib/oeqa/sdkext/case.py                       |  21 ++
>  meta/lib/oeqa/sdkext/{ =3D> cases}/devtool.py        |  49 +++--
>  meta/lib/oeqa/sdkext/{ =3D> cases}/sdk_update.py     |  14 +-
>  meta/lib/oeqa/sdkext/context.py                    |  21 ++
>  meta/lib/oeqa/utils/buildproject.py                |  52 +++++
>  meta/lib/oeqa/utils/targetbuild.py                 | 135 ------------
>  scripts/oe-test                                    |  98 +++++++++
>  74 files changed, 2282 insertions(+), 442 deletions(-)
>  create mode 100644 meta/lib/oeqa/core/README
>  create mode 100644 meta/lib/oeqa/core/__init__.py
>  create mode 100644 meta/lib/oeqa/core/case.py
>  create mode 100644 meta/lib/oeqa/core/cases/__init__.py
>  create mode 100644 meta/lib/oeqa/core/cases/example/data.json
>  create mode 100644 meta/lib/oeqa/core/cases/example/test_basic.py
>  create mode 100644 meta/lib/oeqa/core/context.py
>  create mode 100644 meta/lib/oeqa/core/decorator/__init__.py
>  create mode 100644 meta/lib/oeqa/core/decorator/data.py
>  create mode 100644 meta/lib/oeqa/core/decorator/depends.py
>  create mode 100644 meta/lib/oeqa/core/decorator/oeid.py
>  create mode 100644 meta/lib/oeqa/core/decorator/oetag.py
>  create mode 100644 meta/lib/oeqa/core/decorator/oetimeout.py
>  create mode 100644 meta/lib/oeqa/core/exception.py
>  create mode 100644 meta/lib/oeqa/core/loader.py
>  create mode 100644 meta/lib/oeqa/core/runner.py
>  create mode 100644 meta/lib/oeqa/core/tests/__init__.py
>  create mode 100644 meta/lib/oeqa/core/tests/cases/data.py
>  create mode 100644 meta/lib/oeqa/core/tests/cases/depends.py
>  create mode 100644 meta/lib/oeqa/core/tests/cases/loader/invalid/oeid.=
py
>  create mode 100644 meta/lib/oeqa/core/tests/cases/loader/valid/another=
=2Epy
>  create mode 100644 meta/lib/oeqa/core/tests/cases/oeid.py
>  create mode 100644 meta/lib/oeqa/core/tests/cases/oetag.py
>  create mode 100644 meta/lib/oeqa/core/tests/cases/timeout.py
>  create mode 100644 meta/lib/oeqa/core/tests/common.py
>  create mode 100755 meta/lib/oeqa/core/tests/test_data.py
>  create mode 100755 meta/lib/oeqa/core/tests/test_decorators.py
>  create mode 100755 meta/lib/oeqa/core/tests/test_loader.py
>  create mode 100755 meta/lib/oeqa/core/tests/test_runner.py
>  create mode 100644 meta/lib/oeqa/core/utils/__init__.py
>  create mode 100644 meta/lib/oeqa/core/utils/misc.py
>  create mode 100644 meta/lib/oeqa/core/utils/path.py
>  create mode 100644 meta/lib/oeqa/core/utils/test.py
>  rename meta/lib/oeqa/{runtime =3D> }/files/test.c (100%)
>  rename meta/lib/oeqa/{runtime =3D> }/files/test.cpp (100%)
>  rename meta/lib/oeqa/{runtime =3D> }/files/test.pl (100%)
>  rename meta/lib/oeqa/{runtime =3D> }/files/test.py (100%)
>  create mode 100644 meta/lib/oeqa/runtime/utils/__init__.py
>  create mode 100644 meta/lib/oeqa/runtime/utils/targetbuildproject.py
>  create mode 100644 meta/lib/oeqa/sdk/case.py
>  rename meta/lib/oeqa/sdk/{ =3D> cases}/buildcvs.py (59%)
>  rename meta/lib/oeqa/sdk/{ =3D> cases}/buildgalculator.py (45%)
>  rename meta/lib/oeqa/sdk/{ =3D> cases}/buildiptables.py (58%)
>  create mode 100644 meta/lib/oeqa/sdk/cases/gcc.py
>  create mode 100644 meta/lib/oeqa/sdk/cases/perl.py
>  rename meta/lib/oeqa/sdk/{ =3D> cases}/python.py (46%)
>  create mode 100644 meta/lib/oeqa/sdk/context.py
>  rename meta/lib/oeqa/{runtime =3D> sdk}/files/testsdkmakefile (100%)
>  delete mode 100644 meta/lib/oeqa/sdk/gcc.py
>  delete mode 100644 meta/lib/oeqa/sdk/perl.py
>  create mode 100644 meta/lib/oeqa/sdk/utils/__init__.py
>  create mode 100644 meta/lib/oeqa/sdk/utils/sdkbuildproject.py
>  create mode 100644 meta/lib/oeqa/sdkext/case.py
>  rename meta/lib/oeqa/sdkext/{ =3D> cases}/devtool.py (73%)
>  rename meta/lib/oeqa/sdkext/{ =3D> cases}/sdk_update.py (69%)
>  create mode 100644 meta/lib/oeqa/sdkext/context.py
>  create mode 100644 meta/lib/oeqa/utils/buildproject.py
>  delete mode 100644 meta/lib/oeqa/utils/targetbuild.py
>  create mode 100755 scripts/oe-test
>=20


--ppORtJDm12d1BJOUAX2GF80QRMrGcOOdE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYRzQgAAoJEGJqcE9h3glgnAYQAJ8Y2foxQX0q3/0XzV6Maf8H
d1XmqMF9ScL8FsxjByTc7LhYpID9pltazjMJ5z1jqiEbHsHKLeHmDD9cDFIj1e4n
A/vejP6ztsiKbNKqtbclKQP5vY1GeZOXIzHj4MTjGkUfbGJHTz/JitN5unsE9V0C
Y2zwHK61q07H53yu6fdnuKVdHuFgKfX2vnBXLEnh8dTI2ZjQDPftu/OR2RYWp+vI
x7Ngr81dFNYtEcG6DE57WohErTFJ5wSqRKa8tqscOpLpbUY1t192CXJlN3eEIApi
3DJD1ytKOWDlvyIBkCqi5RrBcAX3v2IRbzefPXpD8i7srHKn1MopPVxJJE/EqX7D
q0JZ2m67PI4z+7x0dAKRBBwcq/gwzJw49r5ypSS7U/YfXiCSMP55xPbA4+cZA5vJ
PuMiHnBmYv8vaX1GzB2dBOyYDHMoiKd6RyQ/QZZLZvSeTdzdhVt0xhIXdB0ivkND
Gcf1oaqyQlL7Q+4ZIo2uMqxBhAmEYZlhIUb3wakIxHIPDno6332Wuy32I20N2v7H
6kno+PZ7hokP74sEmjD1iOipFzBE9AAUGoTQdVnRUj0rgHXhdfgjubk6oUdjjH3B
o+vAKQs1ODvWD8sZNX4uufXrjn00jYr3ThaSkwYobI6eH8ht9NrAdBiNMr2edwCr
I4m8vsrSX1nlZm2JI8Me
=+TbT
-----END PGP SIGNATURE-----

--ppORtJDm12d1BJOUAX2GF80QRMrGcOOdE--
