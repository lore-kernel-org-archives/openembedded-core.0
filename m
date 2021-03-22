Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.77])
 by mx.groups.io with SMTP id smtpd.web08.9384.1616396939045552371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 00:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=UrULpLKD;
 spf=pass (domain: kpit.com, ip: 40.107.138.77, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt2bSrMw525DzEL9fcimta87nhZH1gC+IoDjUUkJMPXHxGkNzpOGVzjLSC44jn9izPdo3M8oUscmtvMnDsVuu6YKY5TguRYTyFtTWwYZX4AzOYMZT2kFo6AIKte6OlFoKNZnZ58viGgtViUgn9C1Da6+UnDfcJjY300vlzUficxrj+k1E/zuNYbf0vJYAl4IjoAkuyYRpvMtlz8m5lJaxt6edxrpxvS2TYTbU5u2wrV5RlrXeYHCcy/INnLOe3ikLPmfH7vdnH27k4w2Dvg6vbq1rIp4qyPn4TsHOTzU7QzzWInMqnTHf47N8Ck7qSlmIRgOii6V7hXsFT0qMTPmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMniAzFYgur7ZmH9Dr/JKOXPHseus/vtBP2HX/ha0CI=;
 b=acnsvWSNEsi8ezpxv3m10QXM61IWqevYlzB8d0A8PFb0clcrfiaQvYSvkgLbzyWmNIqtdHIp20UTPrlFEiHdn2tX1Ypxf2gg48VbWNohkmS5AwG4wAom/Na0TLjSqLZFr+k/qfbluFC18KXTz8ah5qWSaXEEzhskYMIEj2eC39yKOaXV4xBgVXSG6R8E7DQRIVJ32eU4jxgEztOFHLc4awKi8OfCBv+fs67jwByIQm4B/S5nULpegE41ZNXyK3wUWToezm0njDSSP6wsBuwvqlrjmGNO9Rk2PLNS1DMg3qF5y6BrShzOH3Rgke4GR8qtVVWBrlSCoctqh+zdw4niwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMniAzFYgur7ZmH9Dr/JKOXPHseus/vtBP2HX/ha0CI=;
 b=UrULpLKDuClWVN5I54PAFFVlHzM4wFMxME2ujBF+xFsRTpAbLHizuKpxXy2+4LtfXwoQGioAbsbrj2E2SUMOi0Z/4mj9nRBZfu5iY00AgOouBCvtrN2HgNNpzjfXimwAOkuHKdDANgtAZsbmZahwZZOtMjM29XUD/2bqiWG0ZVo=
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN2PR01MB5142.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:41::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 07:08:50 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277%6]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 07:08:50 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [meta-oe][dunfell][PATCH] rapidjson: Remove unwanted patches
Thread-Topic: [meta-oe][dunfell][PATCH] rapidjson: Remove unwanted patches
Thread-Index: AQHXEbOXEQd28NnGxEiBKGA5042oY6qPsLim
Date: Mon, 22 Mar 2021 07:08:50 +0000
Message-ID: 
 <PN2PR01MB4410F4A658E90CFB1CA4A3DFEF659@PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM>
References: <1614944088-18647-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
In-Reply-To: <1614944088-18647-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [1.186.38.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 251a2dd8-9248-412f-0b00-08d8ed015876
x-ms-traffictypediagnostic: PN2PR01MB5142:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PN2PR01MB514238F8DAFB404B641BD752EF659@PN2PR01MB5142.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hm8af4FTTXYDDA0oSKuLXVimaQJlOVXvRPZV74ZgH3qJFZI7YdsWZ6bmiUgxl0lC2BKhLs5WivW14XnRCj3SYqa/Ohb5aTVnxBB5aZPHmNIEGGuxx1ZMwEt44srbnIGqcyly5xHSn+FO2OG8RPqYVmff1yrkhQ/ntZPFCo0DvgBEg4A0En0ep4yEmGH/Nl3+v1ipMQEYrTKLBbiwmGU8TLwdpHrelte+mL+lfHmsjKJVzPmFygMUqoUwXzHbUXE8VB69ElBJHeAOK8fVb5lrvy7DgMkL6PF32L2MJsh0KkYji9Gf0nKkeijDGMEBNbA6zAQBIjKSVxaLgt5myaFEFDgdULGTWmrPcnjH1PhlsmgJ3vGcPbFngO4OhmNo3/YrkwS/vqPXWyz7HO/CGxXD3aRvjaJJiIsa8nwvk7i4PJqFxmEmmYYov7demOFuGYTkqROD1J1VyvNeMClfAWxXP8OKkP6hi+ymLv1bmDVA3OSG05C7/43oOnCitkTplS/si2Qs/XZjZTAP32L5wSIhccOhbJzSeSYOeqnLj3cDoxukdoVqw0U8vIioiKg9owiw/SXS0zfe8JQphSh9MSK68OKiGO1vggTm7gz8vm+Faift7KfUPkwkulIN2Ws+ogGkMtyWNMpKTm0Z+GJLNZUyjx3PmGN5EzDbdvITqwQplTw4hCW7kijd0IKjNEIXSbSp
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(33656002)(66574015)(4326008)(7696005)(316002)(38100700001)(53546011)(110136005)(55236004)(52536014)(54906003)(6506007)(8676002)(71200400001)(83380400001)(66946007)(91956017)(166002)(5660300002)(19627405001)(76116006)(26005)(186003)(86362001)(55016002)(66556008)(66446008)(8936002)(64756008)(2906002)(66476007)(9686003)(478600001)(26123001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 0NAWtkvOsNn9R/OVmzMBm3FipRy39DddEItIXf4U/+CaRhzSiKPrMe2I5Ui0yPU5lDPcGkSnpYeoXp4bpdTDdxtq5+Ds+G0nvfbYJJzm2vtVqT2YZT8kx8mZUyNFpL71eTbm8u8rDD7MCPC5Nuc2aUCG9X1CxLNESRXsgsmbmVdVeaYlIAuIjkLheXvpXXZr4PQ6wM4Ol2x/xA3IHyrS7mU/sWTBwm9iQYij2W1fvO3kkjgj0HZygVsPgIr2idRvZA3pD64ZzUgEigBmDPVzY5PWj1T16VIJbZBpA9CBdquzE8GQN78wylH2uEtgcFm2bV8QEmlGVbuQMbKDFm90jbAK1juJ4bftaZJhO4QORPQt2XsBxYdBrAfLhV6W9aGCc6Ny+atlaZUpuMSfYbPFMCXArOEn2g8KJykO9AgGVLqimMCQby/JjxSwXvFSr2ffYEDgknanZOj02S9odMPLiOaMJGRFdBilIZkTYTiAIQA4K9YM+buYWc6SYSZmEkmnTUtwttaPHcjw9ncgc/5JtOalzo09hP4GlrQ/q5AmlXuVYsD8tcHUqL8Gp+C603bTBTSkqfbSdKrOyvMnHwcBotm/TpKF7irb2MbUvkK7LUys3oDbZd6Vi55A2l5qzOd2DQ+4PJlaudpGFzM2ooRQ5StRKDFcNxSkTBmbURFB9uYnzDfAS4p7lmOFQoR0N8xZNodweVHfTxxedOXvulY8wA==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 251a2dd8-9248-412f-0b00-08d8ed015876
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 07:08:50.4729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdsqJlTyl4PeoPKGfK0ZnJE/Gtm9FgTj1BAe0hhoxwUBWUd6YI8qdkokWFyj8xaFUQ9gzQzYu4L80zD/2Bd0pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB5142
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_PN2PR01MB4410F4A658E90CFB1CA4A3DFEF659PN2PR01MB4410INDP_"

--_000_PN2PR01MB4410F4A658E90CFB1CA4A3DFEF659PN2PR01MB4410INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Can you please confirm when this patch will get merge in dunfell branch as =
the changes are already merged in master branch.


Thanks & Regards,

Harprit Bhandari

________________________________
From: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Sent: 05 March 2021 17:05
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; steve@sakoman.com <steve@sako=
man.com>; Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Subject: [meta-oe][dunfell][PATCH] rapidjson: Remove unwanted patches

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

--_000_PN2PR01MB4410F4A658E90CFB1CA4A3DFEF659PN2PR01MB4410INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"margin:0px;font-size:12pt"><span style=3D"margin:0px;font-fa=
mily:Calibri, Helvetica, sans-serif">Hi,</span></span>
<div style=3D"margin:0px;font-size:12pt"><br>
</div>
<div style=3D"margin:0px;font-size:12pt"><span style=3D"margin:0px;font-fam=
ily:Calibri, Helvetica, sans-serif">Can you please confirm when this patch =
will get merge in dunfell</span><span style=3D"margin:0px;font-family:Calib=
ri, Helvetica, sans-serif;color:rgb(50, 49, 48);background-color:rgb(250, 2=
49, 248);display:inline !important">&nbsp;branch
 as the changes are already merged in master branch.</span></div>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<meta content=3D"text/html; charset=3DUTF-8">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0; margin-bottom=
:0">Thanks &amp; Regards,</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0; margin-bottom=
:0">Harprit Bhandari<br>
</p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Harpritkaur Bhandari =
&lt;Harpritkaur.Bhandari@kpit.com&gt;<br>
<b>Sent:</b> 05 March 2021 17:05<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br=
>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; steve@sakoman.co=
m &lt;steve@sakoman.com&gt;; Harpritkaur Bhandari &lt;Harpritkaur.Bhandari@=
kpit.com&gt;<br>
<b>Subject:</b> [meta-oe][dunfell][PATCH] rapidjson: Remove unwanted patche=
s</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Harpritkaur Bhandari &lt;harpritkaur.bhandar=
i@kpit.com&gt;<br>
<br>
rapidjson is upgraded to latest SRCREV so<br>
removing the below patches which are not<br>
applicable:<br>
1.0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch<br>
2.remove-march-native-from-CMAKE_CXX_FLAGS.patch<br>
<br>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
(cherry picked from commit 5aa127af2d3942c9b1dfcd768a8123513a26c53f)<br>
Signed-off-by: Harpritkaur Bhandari &lt;Harpritkaur.Bhandari@kpit.com&gt;<b=
r>
---<br>
&nbsp;...ve-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch | 36 -------------=
------<br>
&nbsp;.../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 40 -------------=
---------<br>
&nbsp;2 files changed, 76 deletions(-)<br>
&nbsp;delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/0001-=
CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch<br>
&nbsp;delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/remov=
e-march-native-from-CMAKE_CXX_FLAGS.patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove=
-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch b/meta-oe/recipes-devtools/ra=
pidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.=
patch<br>
deleted file mode 100644<br>
index 745f5d0..0000000<br>
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardco=
ded-CMAKECONFIG_INSTALL_DIR-path.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 8d272e53a4d1dc405e08ce2dd50159c58f4451e9 Mon Sep 17 00:00:00 2001<br>
-From: Ruslan Bilovol &lt;rbilovol@cisco.com&gt;<br>
-Date: Thu, 24 Jan 2019 18:11:39 +0200<br>
-Subject: [PATCH] CMake: remove hardcoded CMAKECONFIG_INSTALL_DIR path<br>
-<br>
-Currently this path is hardcoded to lib/cmake.<br>
-Some distributions have different library path (like lib64).<br>
-So reuse LIB_INSTALL_DIR for that to make CMAKECONFIG_INSTALL_DIR<br>
-configurable and usable in such distros.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/Tencent/rapidjson=
/commit/8d272e53a4d1dc405e08ce2dd50159c58f4451e9">https://github.com/Tencen=
t/rapidjson/commit/8d272e53a4d1dc405e08ce2dd50159c58f4451e9</a>]<br>
-<br>
-Signed-off-by: Ruslan Bilovol &lt;rbilovol@cisco.com&gt;<br>
----<br>
- CMakeLists.txt | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index 7c60407..0275672 100644<br>
---- a/CMakeLists.txt<br>
-+++ b/CMakeLists.txt<br>
-@@ -199,9 +199,9 @@ CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_N=
AME}ConfigVersion.cmake.in<br>
-&nbsp;&nbsp;&nbsp;&nbsp; ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config=
Version.cmake @ONLY)<br>
- <br>
- # ... for the install tree<br>
--SET( CMAKECONFIG_INSTALL_DIR lib/cmake/${PROJECT_NAME} )<br>
-+SET( CMAKECONFIG_INSTALL_DIR ${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME} )<b=
r>
- FILE( RELATIVE_PATH REL_INCLUDE_DIR<br>
--&nbsp;&nbsp;&nbsp; &quot;${CMAKE_INSTALL_PREFIX}/${CMAKECONFIG_INSTALL_DI=
R}&quot;<br>
-+&nbsp;&nbsp;&nbsp; &quot;${CMAKECONFIG_INSTALL_DIR}&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp; &quot;${CMAKE_INSTALL_PREFIX}/include&quot; )<br>
- <br>
- SET( ${PROJECT_NAME}_INCLUDE_DIR &quot;\${${PROJECT_NAME}_CMAKE_DIR}/${RE=
L_INCLUDE_DIR}&quot; )<br>
--- <br>
-1.9.1<br>
-<br>
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-nati=
ve-from-CMAKE_CXX_FLAGS.patch b/meta-oe/recipes-devtools/rapidjson/rapidjso=
n/remove-march-native-from-CMAKE_CXX_FLAGS.patch<br>
deleted file mode 100644<br>
index cf3e16e..0000000<br>
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from=
-CMAKE_CXX_FLAGS.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From 827155e5e659b2a5065b00d701bc59b57feab2bf Mon Sep 17 00:00:00 2001<br>
-From: Andre McCurdy &lt;armccurdy@gmail.com&gt;<br>
-Date: Mon, 19 Dec 2016 01:37:11 -0800<br>
-Subject: [PATCH] remove -march=3Dnative from CMAKE_CXX_FLAGS<br>
-<br>
-Not appropriate when cross compiling.<br>
-<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Signed-off-by: Andre McCurdy &lt;armccurdy@gmail.com&gt;<br>
----<br>
- CMakeLists.txt | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-Index: git/CMakeLists.txt<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/CMakeLists.txt<br>
-+++ git/CMakeLists.txt<br>
-@@ -51,10 +51,10 @@ endif(CCACHE_FOUND)<br>
- <br>
- if (&quot;${CMAKE_CXX_COMPILER_ID}&quot; STREQUAL &quot;GNU&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL &quot;power=
pc&quot; OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL &quot;ppc64&quot; OR ${CMAKE=
_SYSTEM_PROCESSOR} STREQUAL &quot;ppc64le&quot;)<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S} -mcpu=3Dnative&quot;)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S}&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; else()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #FIXME: x86 is -march=3Dnative, but d=
oesn't mean every arch is this option. To keep original project's compatibi=
lity, I leave this except POWER.<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S} -march=3Dnative&quot;)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S}&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; endif()<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAGS} -Wal=
l -Wextra -Werror&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wf=
loat-equal -Wconversion -Wsign-conversion)<br>
-@@ -84,7 +84,7 @@ elseif (CMAKE_CXX_COMPILER_ID MATCHES &quot;C<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX=
_FLAGS} -mcpu=3Dnative&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; else()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #FIXME: x86 is -march=3Dnative, but d=
oesn't mean every arch is this option. To keep original project's compatibi=
lity, I leave this except POWER.<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S} -march=3Dnative&quot;)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S}&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; endif()<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAGS} -Wal=
l -Wextra -Werror -Wno-missing-field-initializers&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wf=
loat-equal -Wconversion -Wimplicit-fallthrough -Weverything)<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PN2PR01MB4410F4A658E90CFB1CA4A3DFEF659PN2PR01MB4410INDP_--
