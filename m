Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.83])
 by mx.groups.io with SMTP id smtpd.web11.10593.1614944118824083685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 03:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=RwilNxHw;
 spf=pass (domain: kpit.com, ip: 40.107.139.83, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9FY2QjK/SY2QiVwUdXi0PdhRKERucF37gnFtF7EatrCiYaCqEjn3PEK4+V2v80NeNy2Jdm9G5yjQVjagvGRFisvJnQ/5krM/21Gw5pWrw96EQXJKSFrgdBdFKJ45a8J6icuS/FlZce+AP4suQkuj+/t2tp7WctZQ/42ZzRF68rApCYT1pLlYxlG0lVfjAHAxXd0T+2gsXbVEQMn1S+jx+YZm0MYTNrWXsF6lolYIkkQkZ6OywCQzZLb3XtofPLd5f8fHqMpqzXjDZV6Dm7JZAxzZlTkxNFZ8IPt+B95uZMe8JucT9VZNFYzxrG0xp62H6v7FTIwHNpZ9i+7cKfweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rGRGJg/BkoL3SkfJuAbf4yedoQ3nTG5YGlNXs/8XmY=;
 b=YiOsx46wjICcFGVxAHr4Ap+B7of1RRRw9sAHre2pKy3DXFblt/RsgJ0M7OJGn0ZLfhVQrJSmBCVPqcsBBf0Sc/AMtc+JY+1RbNb+lufoA3/R2lCn1K0l6BvzerAk0cbxUxw779EeOI1+fXcIt/MP2NLBT2wqLEtvqMbAOtRme8AhGhQb4OVli4Jn61i097g2Fqwo78xHneQh/6+fIvSh6cJuxPUyzd7XcqwvuVonK42VYuh0KCGrQieOkGW0hXMDeafd/wPs9TTAvXFIEXSd1zl/AHvyOc4GtMrXmOfUT/QyzGIn8NoowzbYDEOjuD7xSUTd/3d2cXyLs1/DlT0EIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rGRGJg/BkoL3SkfJuAbf4yedoQ3nTG5YGlNXs/8XmY=;
 b=RwilNxHw4VavjqkXLVS3TfI/qpipDLXw2qQfH2tAGPj4XLpePcErfNb6MIz3zmfTZgFVHj6awNO4BNS5zhy/7UbJ61e9cVu4HmmnsbA2/iBKkhjOyqsrRryODERzxSbTtvhNcGFbTfcYnpwBo5tsBjBm3p0zT/cQisQdWBWGnPg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PNZPR01MB4909.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.21; Fri, 5 Mar
 2021 11:35:06 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277%6]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 11:35:06 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	steve@sakoman.com,
	Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>
Subject: [meta-oe][dunfell][PATCH] rapidjson: Remove unwanted patches
Date: Fri,  5 Mar 2021 17:04:48 +0530
Message-Id: <1614944088-18647-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [1.186.38.155]
X-ClientProxiedBy: BM1PR0101CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::16) To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (1.186.38.155) by BM1PR0101CA0030.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 11:35:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 34f25631-2f24-4f47-c65e-08d8dfcab95c
X-MS-TrafficTypeDiagnostic: PNZPR01MB4909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB490917CE4BB59061C8930D7AEF969@PNZPR01MB4909.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D0zE44r3w1s0U5k0isO26wiiTjeszgWRXWEaFM3elVlUvjOD2GWvbaCdEtyydab6NDf7wkyPyG4HsDWaOx/nAc87chAU7klPY+6vc1wPeZ7RLdlPtDlFteaW/A3NAf5pw9RjajbSf/Q7rRjqzgFiafkwPo1fOaqdVP/7fewuy8btspBv8Yrh/UFVYXDTXVVhLraGgtzN6/MWNrbCB3k4h2BOC5P8EqPJm5Jijq7frS9E6JFImpHyl3iND4GBGJaBq/5IEkFjiysegeJhY5PJJ6hPNrO8ZsXesx3n1QTGCSKvmIjARaJqHhLmDO7n/NEviuzI1QWx9saMTebTO3F1VHd2YlZcOS0UMlqQ6qrpPuBlJj6JCNBtNG5O++WnqXXHt2fgd2lZ/dRHFIOzN/h6jPuVFE199BHY6cyFPL8m5cGD9j+QjPXvCgM7hjuCjZmKIpVKnCkEk/+OBKmhKkNkKj0Wy029SpKWCQ3/oea9f72d7bsH8R0Frojq/dlGFmRyDbgOxXRE3ge+AAsSyJ7p+UiqGtnt71SM6AYn+eKCmRudD0pEw8RSDWh60By5l9y3rR6jhT6rqtS0OrFwR5IEzDlMMaztLaw+XCmdXeSdXo1L588bW2e+r9rNdyBJTZ5ArhzHY3D8+uDSipyFaq+4i84upy299Hp4V/2hioLtuvxOBMCQ5Y5BOoOTA8oiMAgX4qzsvONeLXYZGukWQ1klhg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(186003)(316002)(6506007)(36756003)(8676002)(55236004)(16526019)(107886003)(478600001)(69590400012)(26005)(66946007)(66556008)(66476007)(5660300002)(8936002)(86362001)(6666004)(1006002)(6486002)(956004)(2616005)(6512007)(66574015)(2906002)(52116002)(4326008)(83380400001)(26123001)(36456004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?i+F2xAObQqVjFgy5LVxG14TrrZcrmrqbVhAcgCGrXgUAxeIjEQAUGRsDCHNd?=
 =?us-ascii?Q?ztkznUI+XecPj4QzyYcsCbKWXW4CZ6YPxQTPhK5OqCFv361DAuQwa2DViOJ/?=
 =?us-ascii?Q?nW92dwSJ1CxlsslTvr5+2xgRRyruIlQfdbAWQIe4f8es71pMOE1xQpXPbu9B?=
 =?us-ascii?Q?Mj5jrR/3svyd99RCp2y1fa0KqBlqlh7nvfvzU9me6HgyJMOa3Oc9pDKX8rWC?=
 =?us-ascii?Q?X+owxCHWnPl+pXGzV0U+mUB/XPLo7ZCITvUFh7lEca0+yWZaiVtmW/7D8nBk?=
 =?us-ascii?Q?CnnpvL9Z6gcNxh9w42R/3X7+Nr+3TMw5lAe1tiX5dpsIp/qmjXGeRSc47nD9?=
 =?us-ascii?Q?x1ShbB60LYyry9klATW2zwaFJY02RxVE2+oXP7yZE3i4y0bv6wlnh5S3bsto?=
 =?us-ascii?Q?cfKg9H9G0XPXSOgJaTlFkj8xFUgOGsgbaKfgcSEM59+zlWg5kzSsMNteYwc0?=
 =?us-ascii?Q?HpnXRm+uvIQeGF+9M5pFTdGI+HhO8ilawH5R3ctfs7Vfo4ufAvpQaH8yhnbA?=
 =?us-ascii?Q?RfScHxtyGZGosOMsDcjK7O3n6JwYrpqXRyLnJ3QVmno/4norBKpD2vQq38X/?=
 =?us-ascii?Q?vF7Nl1kehT5sBoMIyLF/YqcX9cQbIGOa36un3SeguG/y3AOT1USWttUOC+F7?=
 =?us-ascii?Q?MX9ZIpLYJ4EYFlkkPxdzJ37Tk0PbpRdvVHfemQuPoRPT7YTF24FtPwEjD5r4?=
 =?us-ascii?Q?IASprW+4g7iQ6YywQl55mV0DkQqEfqoW5D9ACjeQAiFuVNBbw67qlS1uLROx?=
 =?us-ascii?Q?jDvQQPZZ4aEimP33ucSzVMEpq9e5Zh6DTiiewoyJPYYkaBcvGXcxmuZZKT3N?=
 =?us-ascii?Q?HXzGHZpzTWY1jCzJE2qeoPeSzYnZuHuHfmTGlBHykBzyo6ZHCH8tYtC1FHal?=
 =?us-ascii?Q?32wWDQoPklh5TS34kOQhHTHuBS5K/Vhgsl5SlWHFmNjXuq/g+N0Mdn+AqGcW?=
 =?us-ascii?Q?qr+7UxY0jWHS/HgMDSetfMyz6KAZl1ckj6vp1+jf6B4tCuQOBXMgi4VjhNkn?=
 =?us-ascii?Q?GMXvdZAIWVVLsmvPIhQg+K+XwxVV8VmfhSwewXgxCh9EPjS12POrhvi0ci+G?=
 =?us-ascii?Q?KeKuw0px6rmo003UurY8YpDZqh4DcJlS4O2VBXRVmokKLXv6ia9sl89l2umt?=
 =?us-ascii?Q?ffFvmZlGJmlYv+Ozl9v10BLkQAQyUz69AgZHWhQP4sOO+OtckyuHloydpC8K?=
 =?us-ascii?Q?Y2C2OrEhvr8+BtBUPY0LaQnf+dpOb5G6k79biWXJT5gKGLG842F2U2wCeGgt?=
 =?us-ascii?Q?Cet/mZf5gORLQn9mCPnx5IyxwzSE0i4n16sGhN63UYfTvZHx58g/aa1fX1CE?=
 =?us-ascii?Q?Q0F0cY6GZONvEwEDI49FoMrk?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f25631-2f24-4f47-c65e-08d8dfcab95c
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 11:35:06.1995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfZY9xM1RKZEaQI9fSk/lKli9PgT9rE2Py/o5qZeoaY0VBGxa5BlPZTAdlngkK1a6l5gyUB7qC++P2Sp0aQ4gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4909
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>

rapidjson is upgraded to latest SRCREV so
removing the below patches which are not
applicable:
1.0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
2.remove-march-native-from-CMAKE_CXX_FLAGS.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5aa127af2d3942c9b1dfcd768a8123513a26c53f)
Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
---
 ...ve-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch | 36 ------------------=
-
 .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 40 ------------------=
----
 2 files changed, 76 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake=
-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
 delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/remove-mar=
ch-native-from-CMAKE_CXX_FLAGS.patch

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove=
-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch b/meta-oe/recipes-devtools/ra=
pidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.=
patch
deleted file mode 100644
index 745f5d0..0000000
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardco=
ded-CMAKECONFIG_INSTALL_DIR-path.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8d272e53a4d1dc405e08ce2dd50159c58f4451e9 Mon Sep 17 00:00:00 2001
-From: Ruslan Bilovol <rbilovol@cisco.com>
-Date: Thu, 24 Jan 2019 18:11:39 +0200
-Subject: [PATCH] CMake: remove hardcoded CMAKECONFIG_INSTALL_DIR path
-
-Currently this path is hardcoded to lib/cmake.
-Some distributions have different library path (like lib64).
-So reuse LIB_INSTALL_DIR for that to make CMAKECONFIG_INSTALL_DIR
-configurable and usable in such distros.
-
-Upstream-Status: Backport [https://github.com/Tencent/rapidjson/commit/8d2=
72e53a4d1dc405e08ce2dd50159c58f4451e9]
-
-Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7c60407..0275672 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -199,9 +199,9 @@ CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_N=
AME}ConfigVersion.cmake.in
-     ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake @ONLY)
-
- # ... for the install tree
--SET( CMAKECONFIG_INSTALL_DIR lib/cmake/${PROJECT_NAME} )
-+SET( CMAKECONFIG_INSTALL_DIR ${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME} )
- FILE( RELATIVE_PATH REL_INCLUDE_DIR
--    "${CMAKE_INSTALL_PREFIX}/${CMAKECONFIG_INSTALL_DIR}"
-+    "${CMAKECONFIG_INSTALL_DIR}"
-     "${CMAKE_INSTALL_PREFIX}/include" )
-
- SET( ${PROJECT_NAME}_INCLUDE_DIR "\${${PROJECT_NAME}_CMAKE_DIR}/${REL_INC=
LUDE_DIR}" )
---
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-nati=
ve-from-CMAKE_CXX_FLAGS.patch b/meta-oe/recipes-devtools/rapidjson/rapidjso=
n/remove-march-native-from-CMAKE_CXX_FLAGS.patch
deleted file mode 100644
index cf3e16e..0000000
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from=
-CMAKE_CXX_FLAGS.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 827155e5e659b2a5065b00d701bc59b57feab2bf Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Mon, 19 Dec 2016 01:37:11 -0800
-Subject: [PATCH] remove -march=3Dnative from CMAKE_CXX_FLAGS
-
-Not appropriate when cross compiling.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: git/CMakeLists.txt
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/CMakeLists.txt
-+++ git/CMakeLists.txt
-@@ -51,10 +51,10 @@ endif(CCACHE_FOUND)
-
- if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
-     if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "powerpc" OR ${CMAKE_SYSTEM_PRO=
CESSOR} STREQUAL "ppc64" OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "ppc64le")
--      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=3Dnative")
-+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
-     else()
-       #FIXME: x86 is -march=3Dnative, but doesn't mean every arch is this=
 option. To keep original project's compatibility, I leave this except POWE=
R.
--      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=3Dnative")
-+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
-     endif()
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")
-     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal -Wconvers=
ion -Wsign-conversion)
-@@ -84,7 +84,7 @@ elseif (CMAKE_CXX_COMPILER_ID MATCHES "C
-       set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=3Dnative")
-     else()
-       #FIXME: x86 is -march=3Dnative, but doesn't mean every arch is this=
 option. To keep original project's compatibility, I leave this except POWE=
R.
--      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=3Dnative")
-+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
-     endif()
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror -Wno-mi=
ssing-field-initializers")
-     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal -Wconvers=
ion -Wimplicit-fallthrough -Weverything)
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
