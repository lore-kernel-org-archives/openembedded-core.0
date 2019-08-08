Return-Path: <pascal.bach@siemens.com>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140073.outbound.protection.outlook.com [40.107.14.73])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA087F324
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 10:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=IS4nlXIjL2xq5lgh5NGhALQEnF46CbUvv0K2zzpqKm2MnqqDiv9j8CCIucn91L+mh3Oz/rp5sSCvI5mIQ/ondDL5PzgMYMo83vDrVnnRjAhj5P7ddgAhZi3UF61hBSWwe8V5saq3TCblNk+FMYJXqZt+JnnQ/c7OoFs3XJcQi1zIpCLoPXCTVKCdfm1+oJDR6BREehb8Sxoik+bP5N0cXYMXmWmi6l8h6SpYpbaWr6feMdaLd+T9z0kof0X4S7LzcXx512VOmYZhfuSeERyRIifyBRPrEvEKUlPJQyqNUmnG+ji6GL4AQapdYRj9PIX9BbkeikA8zy5erUcigCnFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BedL7twXKjOkZpU6kygA2AmUtSsmTQn8hkS3DdU0wM8=;
	b=J0sOSX06hn0ojpROFjMaaMRbXl5AWMrOHqP+kvuFWhqkuMFJvKD6xNBs1VJW0KWdYnTWZF7rTW4zIxXJ4q+UyTXIWd6m6+bxuIP+WKqtActTpJV57zy06pDUh52+/fUU0mrDJgbEQmuoABFgOWSbIPHD+Oow3XJhmQcypA4YCHtWlPKISy09AxEP2EUFnmK4pUHz69Z5al5W+MLQ9MH1Rmj+jsTLGagRbBEZvK9+ncuN/PXHu3Gs0Pzx98qdoMhAT9A7Mv7Kx7kOvuH3tbd2ylE5Lz860rjhjkOdX7vORrS+nyIufvZeK8U6k5b4Sny6u2scObZDGDa+uHINaOdmUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=siemens.com;dmarc=pass action=none
	header.from=siemens.com;dkim=pass header.d=siemens.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=siemens.onmicrosoft.com; s=selector2-siemens-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BedL7twXKjOkZpU6kygA2AmUtSsmTQn8hkS3DdU0wM8=;
	b=WZzAMGqi8t6usLFAaYvSHWAXGV/0pZinR0UfqYelDSsM54w765YMLs9hlz7ERfLxz1a+MrwqtiFGvRr00YrO9Zs0/GoR1Xl/SJYZQqGuercY+KsVUWD5w7YxykZpEh0j8XlzsRkX1buByfaGJeLMjSZkPComjno6fDFWN7p1Wik=
Received: from VE1PR10MB3421.EURPRD10.PROD.OUTLOOK.COM (20.179.31.210) by
	VE1PR10MB2893.EURPRD10.PROD.OUTLOOK.COM (10.255.158.86) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.17; Thu, 8 Aug 2019 10:55:49 +0000
Received: from VE1PR10MB3421.EURPRD10.PROD.OUTLOOK.COM
	([fe80::fced:5456:5757:c43b]) by
	VE1PR10MB3421.EURPRD10.PROD.OUTLOOK.COM
	([fe80::fced:5456:5757:c43b%3]) with mapi id 15.20.2157.015;
	Thu, 8 Aug 2019 10:55:49 +0000
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: "Bach, Pascal" <pascal.bach@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] cmake: 3.14.5 -> 3.15.1
Thread-Index: AQHVTbcNjqwQiLcdkEyWjX0srd8aKKbxFAfg
Date: Thu, 8 Aug 2019 10:55:48 +0000
Message-ID: <VE1PR10MB3421D0AB96B9FDF8E30D5DB3F5D70@VE1PR10MB3421.EURPRD10.PROD.OUTLOOK.COM>
References: <20190808070040.20333-1-pascal.bach@siemens.com>
In-Reply-To: <20190808070040.20333-1-pascal.bach@siemens.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-document-confidentiality: NotClassified
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=pascal.bach@siemens.com; 
x-originating-ip: [165.225.73.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfd1fb24-ec6a-4b46-ef78-08d71beef903
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:VE1PR10MB2893; 
x-ms-traffictypediagnostic: VE1PR10MB2893:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VE1PR10MB2893AD713F7D152CD5E2E27FF5D70@VE1PR10MB2893.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:216;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(199004)(189003)(55674003)(13464003)(76176011)(6116002)(55236004)(66066001)(186003)(14454004)(7736002)(316002)(8936002)(81166006)(8676002)(6246003)(81156014)(478600001)(66556008)(99286004)(2906002)(6436002)(3846002)(229853002)(53546011)(66946007)(6306002)(66476007)(9686003)(45080400002)(66446008)(11346002)(64756008)(446003)(486006)(7696005)(476003)(25786009)(102836004)(86362001)(26005)(71200400001)(71190400001)(52536014)(55016002)(14444005)(76116006)(110136005)(5660300002)(6506007)(256004)(2501003)(305945005)(74316002)(19627235002)(30864003)(53936002)(33656002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR10MB2893;
	H:VE1PR10MB3421.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: siemens.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 77vs641T78wbvtE1HT8BubskrqSDkY7aFXs7mj1utmXpc4IWZTy4XhIoTxyL8Y71HkAi1suXd1QKWvymPEFb6jnngjVM4Y6F5ZvXp8l2RMFDfyRyTgNKaW3hsrJruBNZwdUkMxqhKMunTs9FIItkPXUDUJHHN0mm41y2+5//VOpAuIGbfVmjPuBEc3vcSmPzUoNT3ybhyZQOYuxCNm4ULdvsPIc5RZOqjAppVKWghHVHEoCPm0zmUlEV9lVwDLzZNcvlA0Sf4gwUqDXtY2tKONfwTl6L/6jAGYUU4fqjgA9JajM9wt4X8UrsAFctZgHY4kv+oHBCauj/sOMrSlkFo2VrTJ9+22EtMgkM0bwE9LZIs/RWbYz4THTt9igboifJ6XbULGBekWaCQW0IE4gidBk5cmANV9XOnM/DJLIjAJU=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd1fb24-ec6a-4b46-ef78-08d71beef903
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 10:55:48.9815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxnpPPsfl59I5sLvTVptr4rW/qQ+pIxxaKOU4p1zS1BwUKiSICaCcPNyruuNjPNOgobOBq3bmcrhcZ14YljGbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB2893
Subject: Re: [PATCH] cmake: 3.14.5 -> 3.15.1
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
X-List-Received-Date: Thu, 08 Aug 2019 10:55:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

CMake 3.15.2 got released in the meantime. I will submit an update to that =
version directly.
Please ignore this patch.

> -----Original Message-----
> From: Pascal Bach <pascal.bach@siemens.com>
> Sent: Donnerstag, 8. August 2019 09:01
> To: openembedded-core@lists.openembedded.org
> Cc: Bach, Pascal (SI BP R&D ZG FW) <pascal.bach@siemens.com>
> Subject: [PATCH] cmake: 3.14.5 -> 3.15.1
>=20
> The patches were refreshed with devtool.
>=20
> I rebuilt all cmake recipes from poky and meta-oe without issue.
>=20
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  ...ake-native_3.14.5.bb =3D> cmake-native_3.15.1.bb} |  0
>  meta/recipes-devtools/cmake/cmake.inc              |  4 +--
>  ...ineSystem-use-oe-environment-vars-to-load.patch | 13 ++++-----
> .../0002-cmake-Prevent-the-detection-of-Qt5.patch  | 33 +++++++++++------
> -----  ...upport-OpenEmbedded-Qt4-tool-binary-names.patch | 11 +++-----
> ...ently-if-system-Qt-installation-is-broken.patch | 11 +++-----
>  .../cmake/{cmake_3.14.5.bb =3D> cmake_3.15.1.bb}     |  0
>  7 files changed, 31 insertions(+), 41 deletions(-)  rename meta/recipes-
> devtools/cmake/{cmake-native_3.14.5.bb =3D> cmake-native_3.15.1.bb}
> (100%)  rename meta/recipes-devtools/cmake/{cmake_3.14.5.bb =3D>
> cmake_3.15.1.bb} (100%)
>=20
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.5.bb
> b/meta/recipes-devtools/cmake/cmake-native_3.15.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake-native_3.14.5.bb
> rename to meta/recipes-devtools/cmake/cmake-native_3.15.1.bb
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-
> devtools/cmake/cmake.inc
> index da3aadcc0a..d818a0116f 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -18,7 +18,7 @@ SRC_URI =3D
> "https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fcma
> ke.org%2Ffiles%2Fv%24&amp;data=3D02%7C01%7Cpascal.bach%40siemens.co
> m%7C5fbdfa316c3a43990ac508d71bce2efa%7C38ae3bcd95794fd4addab42e1
> 495d55a%7C1%7C0%7C637008444669241974&amp;sdata=3DbARXifAFwJwyOW
> CSTZYG2u2STMXSrKyRLKMuytRxnuY%3D&amp;reserved=3D0{CMAKE_MAJOR
> _VERSION}/cmake-${PV}.tar.gz \
>             file://0004-Fail-silently-if-system-Qt-installation-is-broken=
.patch \  "
>=20
> -SRC_URI[md5sum] =3D "a8cbfc3510b95ea686b4059d8b1f765c"
> -SRC_URI[sha256sum] =3D
> "505ae49ebe3c63c595fa5f814975d8b72848447ee13b6613b0f8b96ebda18c06"
> +SRC_URI[md5sum] =3D "fc6ffc06e6c356e8ab55fd353d7c260b"
> +SRC_URI[sha256sum] =3D
> "18dec548d8f8b04d53c60f9cedcebaa6762f8425339d1e2c889c383d3ccdd7f7"
>=20
>  UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
> diff --git a/meta/recipes-devtools/cmake/cmake/0001-
> CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
> b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-
> use-oe-environment-vars-to-load.patch
> index cdeea647fe..3720833d3e 100644
> --- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-
> use-oe-environment-vars-to-load.patch
> +++ b/meta/recipes-devtools/cmake/cmake/0001-
> CMakeDetermineSystem-use-oe
> +++ -environment-vars-to-load.patch
> @@ -1,9 +1,8 @@
> -From 71085723f8028b3e1c4029fc1abe1243ac49ffc6 Mon Sep 17 00:00:00
> 2001
> +From 1e67c3fe52c6c51c00cf1ebb0bfc30c7a5ef9fdb Mon Sep 17 00:00:00
> 2001
>  From: Cody P Schafer <dev@codyps.com>
>  Date: Thu, 27 Apr 2017 11:35:05 -0400
> -Subject: [PATCH 1/5] CMakeDetermineSystem: use oe environment vars to
> load
> - default toolchain file in sdk
> -Organization: O.S. Systems Software LTDA.
> +Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to
> load
> +default  toolchain file in sdk
>=20
>  Passing the toolchain by:
>=20
> @@ -20,12 +19,13 @@ because '-D' options are cache entries themselves.
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Cody P Schafer <dev@codyps.com>
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +
>  ---
>   Modules/CMakeDetermineSystem.cmake | 7 +++++++
>   1 file changed, 7 insertions(+)
>=20
>  diff --git a/Modules/CMakeDetermineSystem.cmake
> b/Modules/CMakeDetermineSystem.cmake
> -index 600d5580e..32d7f1945 100644
> +index dc208c6..e0af4ca 100644
>  --- a/Modules/CMakeDetermineSystem.cmake
>  +++ b/Modules/CMakeDetermineSystem.cmake
>  @@ -81,6 +81,13 @@ else()
> @@ -42,6 +42,3 @@ index 600d5580e..32d7f1945 100644
>   # if a toolchain file is used, the user wants to cross compile.
>   # in this case read the toolchain file and keep the CMAKE_HOST_SYSTEM_*
>   # variables around so they can be used in CMakeLists.txt.
> ---
> -2.18.0
> -
> diff --git a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-
> detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/0002-
> cmake-Prevent-the-detection-of-Qt5.patch
> index 8d2dc10ce5..db229e63e2 100644
> --- a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-
> detection-of-Qt5.patch
> +++ b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-
> detection
> +++ -of-Qt5.patch
> @@ -1,7 +1,8 @@
> -From b4b6e9b1be33213ede3f612e87840c0045824d9e Mon Sep 17 00:00:00
> 2001
> +From 5cb6c86696f842274043e7d406f84b3ead1c36e0 Mon Sep 17 00:00:00
> 2001
>  From: Otavio Salvador <otavio@ossystems.com.br>
>  Date: Wed, 17 Jan 2018 10:02:14 -0200
> -Subject: [PATCH 2/5] cmake: Prevent the detection of Qt5
> +Subject: [PATCH] cmake: Prevent the detection of Qt5
> +
>  Organization: O.S. Systems Software LTDA.
>=20
>  CMake doesn't have dependency on qt4/qt5, so these tests usually fail @@
> -12,6 +13,7 @@ while running the test in cmake)
>  Upstream-Status: Inappropriate [configuration]
>=20
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +
>  ---
>   Source/QtDialog/CMakeLists.txt                     | 2 +-
>   Tests/CMakeLists.txt                               | 2 +-
> @@ -23,12 +25,12 @@ Signed-off-by: Otavio Salvador
> <otavio@ossystems.com.br>
>   7 files changed, 8 insertions(+), 9 deletions(-)
>=20
>  diff --git a/Source/QtDialog/CMakeLists.txt
> b/Source/QtDialog/CMakeLists.txt -index 9ce0323844..06c86d63eb 100644
> +index cb89d19..9e68981 100644
>  --- a/Source/QtDialog/CMakeLists.txt
>  +++ b/Source/QtDialog/CMakeLists.txt
> -@@ -6,7 +6,7 @@ if(POLICY CMP0020)
> -   cmake_policy(SET CMP0020 NEW) # Drop when CMake >=3D 2.8.11 required
> - endif()
> +@@ -3,7 +3,7 @@
> +
> + project(QtDialog)
>   CMake_OPTIONAL_COMPONENT(cmake-gui)
>  -find_package(Qt5Widgets QUIET)
>  +#find_package(Qt5Widgets QUIET)
> @@ -36,10 +38,10 @@ index 9ce0323844..06c86d63eb 100644
>     include_directories(${Qt5Widgets_INCLUDE_DIRS})
>     add_definitions(${Qt5Widgets_DEFINITONS})
>  diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt -index
> ed98d974b0..7adfbc301b 100644
> +index e73b277..91b8b67 100644
>  --- a/Tests/CMakeLists.txt
>  +++ b/Tests/CMakeLists.txt
> -@@ -1342,7 +1342,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=3Ddev -P
> ${CMake_SOURCE_DIR}/Utilities/Release
> +@@ -1348,7 +1348,7 @@
> ${CMake_SOURCE_DIR}/Utilities/Release/push.bash
> +--dir dev -- '${CMake_BUILD_NIGH
>       set(CMake_TEST_Qt5 1)
>     endif()
>     if(CMake_TEST_Qt5)
> @@ -49,7 +51,7 @@ index ed98d974b0..7adfbc301b 100644
>     if(CMake_TEST_Qt5 AND Qt5Widgets_FOUND)
>       add_subdirectory(Qt5Autogen)
>  diff --git a/Tests/Qt4And5Automoc/CMakeLists.txt
> b/Tests/Qt4And5Automoc/CMakeLists.txt
> -index ad74961d9f..a9dd74b151 100644
> +index ad74961..a9dd74b 100644
>  --- a/Tests/Qt4And5Automoc/CMakeLists.txt
>  +++ b/Tests/Qt4And5Automoc/CMakeLists.txt
>  @@ -3,11 +3,11 @@ cmake_minimum_required(VERSION 2.8.12) @@ -67,7
> +69,7 @@ index ad74961d9f..a9dd74b151 100644
>=20
>   set(CMAKE_AUTOMOC ON)
>  diff --git a/Tests/QtAutogen/AutogenGuiTest.cmake
> b/Tests/QtAutogen/AutogenGuiTest.cmake
> -index b76d341a45..a6e0acbafa 100644
> +index b76d341..a6e0acb 100644
>  --- a/Tests/QtAutogen/AutogenGuiTest.cmake
>  +++ b/Tests/QtAutogen/AutogenGuiTest.cmake
>  @@ -22,8 +22,7 @@ if (QT_TEST_VERSION EQUAL 4) @@ -81,7 +83,7 @@
> index b76d341a45..a6e0acbafa 100644
>     set(QT_QTCORE_TARGET Qt5::Core)
>     set(QT_LIBRARIES Qt5::Widgets)
>  diff --git a/Tests/QtAutogen/MacOsFW/CMakeLists.txt
> b/Tests/QtAutogen/MacOsFW/CMakeLists.txt
> -index c08efc47a2..87e25d9391 100644
> +index c08efc4..87e25d9 100644
>  --- a/Tests/QtAutogen/MacOsFW/CMakeLists.txt
>  +++ b/Tests/QtAutogen/MacOsFW/CMakeLists.txt
>  @@ -2,7 +2,7 @@ cmake_minimum_required(VERSION 3.10) @@ -94,10
> +96,10 @@ index c08efc47a2..87e25d9391 100644
>   set(CMAKE_CXX_STANDARD 11)
>   set(CMAKE_RUNTIME_OUTPUT_DIRECTORY
> ${CMAKE_BINARY_DIR}/output/bin)  diff --git
> a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt -
> index 1f3e5c3006..8ed8d6ac54 100644
> +index 69f8162..f389523 100644
>  --- a/Tests/RunCMake/CMakeLists.txt
>  +++ b/Tests/RunCMake/CMakeLists.txt
> -@@ -326,7 +326,7 @@ add_RunCMake_test(configure_file)
> +@@ -334,7 +334,7 @@ add_RunCMake_test(configure_file)
>   add_RunCMake_test(CTestTimeoutAfterMatch)
>=20
>   find_package(Qt4 QUIET)
> @@ -107,7 +109,7 @@ index 1f3e5c3006..8ed8d6ac54 100644
>     add_RunCMake_test(IncompatibleQt)
>   endif()
>  diff --git a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
> b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
> -index 4fccdc418f..b76e1e5313 100644
> +index 4fccdc4..b76e1e5 100644
>  --- a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
>  +++ b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
>  @@ -1,6 +1,6 @@
> @@ -118,6 +120,3 @@ index 4fccdc418f..b76e1e5313 100644
>=20
>   add_executable(mainexe main.cpp)
>   target_link_libraries(mainexe Qt4::QtCore Qt5::Core)
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-
> OpenEmbedded-Qt4-tool-binary-names.patch b/meta/recipes-
> devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-
> binary-names.patch
> index 4f2e84337e..d7d87a5256 100644
> --- a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-
> OpenEmbedded-Qt4-tool-binary-names.patch
> +++ b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-
> OpenEmbedded-
> +++ Qt4-tool-binary-names.patch
> @@ -1,8 +1,7 @@
> -From c783ceeef485c23e13c3d9f0418719cb0e0b86ee Mon Sep 17 00:00:00
> 2001
> +From b003857d3481105c473e2e75bad4e9e2c6e70004 Mon Sep 17 00:00:00
> 2001
>  From: Otavio Salvador <otavio@ossystems.com.br>
>  Date: Thu, 12 May 2011 15:36:03 +0000
> -Subject: [PATCH 3/5] cmake: support OpenEmbedded Qt4 tool binary
> names
> -Organization: O.S. Systems Software LTDA.
> +Subject: [PATCH] cmake: support OpenEmbedded Qt4 tool binary names
>=20
>  The FindQt4 module looks for Qt4 binaries to be able to gather the  path=
s
> used for compilation and also to be using during other processes @@ -20,1=
2
> +19,13 @@ Instead of find_program, _find_qt4_program is now used.
>=20
>  Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +
>  ---
>   Modules/FindQt4.cmake | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>=20
>  diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake -index
> 847a798af..7ad981879 100644
> +index a145b46..7e18243 100644
>  --- a/Modules/FindQt4.cmake
>  +++ b/Modules/FindQt4.cmake
>  @@ -518,7 +518,7 @@ endfunction()
> @@ -54,6 +54,3 @@ index 847a798af..7ad981879 100644
>     _find_qt4_program(QT_DESIGNER_EXECUTABLE Qt4::designer designer-
> qt4 designer4 designer)
>     _find_qt4_program(QT_LINGUIST_EXECUTABLE Qt4::linguist linguist-qt4
> linguist4 linguist)
>=20
> ---
> -2.18.0
> -
> diff --git a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-
> system-Qt-installation-is-broken.patch b/meta/recipes-
> devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-
> broken.patch
> index 6c67dcf104..676e2857d7 100644
> --- a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-
> installation-is-broken.patch
> +++ b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-
> +++ installation-is-broken.patch
> @@ -1,8 +1,7 @@
> -From 9516fc4260f701c6d9db0c341bb36480362e1747 Mon Sep 17 00:00:00
> 2001
> +From d4a78e8739e845c2963666f7ef6a6c7a89827988 Mon Sep 17 00:00:00
> 2001
>  From: Otavio Salvador <otavio@ossystems.com.br>
>  Date: Thu, 5 Jul 2018 10:26:48 -0300
> -Subject: [PATCH 4/5] Fail silently if system Qt installation is broken
> -Organization: O.S. Systems Software LTDA.
> +Subject: [PATCH] Fail silently if system Qt installation is broken
>=20
>  Fixes a regression in behaviour from 2.8.10 to 2.8.11 resulting in the
> following error if the system Qt installation is broken:
> @@ -23,12 +22,13 @@ within the if(QT_QTCORE_FOUND) statement.
>=20
>  Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +
>  ---
>   Modules/FindQt4.cmake | 39 ++++++++++++++++++++-------------------
>   1 file changed, 20 insertions(+), 19 deletions(-)
>=20
>  diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake -index
> 7ad981879..8b6f43cda 100644
> +index 7e18243..497d5c3 100644
>  --- a/Modules/FindQt4.cmake
>  +++ b/Modules/FindQt4.cmake
>  @@ -988,25 +988,26 @@ if (QT_QMAKE_EXECUTABLE AND @@ -77,6 +77,3
> @@ index 7ad981879..8b6f43cda 100644
>=20
>     foreach(QT_MODULE ${QT_MODULES})
>       _QT4_ADJUST_LIB_VARS(${QT_MODULE})
> ---
> -2.18.0
> -
> diff --git a/meta/recipes-devtools/cmake/cmake_3.14.5.bb b/meta/recipes-
> devtools/cmake/cmake_3.15.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake_3.14.5.bb
> rename to meta/recipes-devtools/cmake/cmake_3.15.1.bb
> --
> 2.11.0


