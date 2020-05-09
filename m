Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.40])
 by mx.groups.io with SMTP id smtpd.web12.5050.1589058525456116109
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 14:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=aZxMIYGm;
 spf=pass (domain: outlook.com, ip: 40.92.89.40, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lP4ZViH1d9gTvxchyi7IWmt5SByHOZo+RpYgLBl//X+FKrSpEwIgqJDy65Ft+JJ5Ch3/k0vJytgsa47pyiHkR4vLmTAu25F8iN6ICQV3OVDriyvzmtj2fzZHDeFmEhn+oK8xkKok/rqv4QuH0JRCWNE96muyuE/Nx2kGFTlGGmDv9zkmvB96MjvlRlU6YGJBob1HWLbdKrFns6a8Wlm7dUG3jRiruqBPjZZ7vTjCmcwxJInzm6ccQ4CkLuObEO3XEhTkDZXTMO0a9OagwRO6Yn+1B1VTa/DRT7LYXnq+ZsTx5NtY06I30f272OPgxmitjo0R7t3NzL1yMmHhm7qfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07Ena++L2Wrwe7CAhv7bOJQxFy/r0PGHgJijOabuuho=;
 b=V8fP1pPM2qst/7lb+IWNNZ1TFlhVl5mHiUNxgksQzHOvYkjKxR7l7f7msNx81A8uURs9kmAwavmPmwhomG7zn1iWyMzAGwY5ykvGSsJIp9GBotKw06RvIV3uLUgiwSH03PkU2l2cW6NnocxhTTePiGEduIkEw3hXQJjRjt9KCgnqfKNYlz97PLB6uSHnxrOmvPtVex1j1u4ecstmKdzCmgloDC/aDqO2Z8IDCqwsc4gOEPhFQyFYuiRrUOmDSrzh7+kTOlfhXzmQ8KxaPAREuuUirrMpYZpMf/aOZlvS5oZi0p22Aqr57Mlu7jbh9jn/pHexXz7velukp3rBwqdW8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07Ena++L2Wrwe7CAhv7bOJQxFy/r0PGHgJijOabuuho=;
 b=aZxMIYGm3mjhIWS3xsdoB+AJMTuotdfQtW70X9LL9ZovatGz0toexPOXXc99KovKRU7+IKF8a9gCRZewEsGqBzlyDxoyjxqeU4mJv1pgBTJW3LFfoFe8wxf1bMd5EmvrEyL08kZGJMbNa9ZSSmpCotvLmL4n8//ls3u/gLXBYyGNPHC2bKBHpS4YsR0KIcauKTlYT3ulXUuuX7qaK1YsQtpNB37VP0cwgtPyZIJ+J4FNJWffcKUreYYL75EDfsVKjh02vYpl2PoK0qL2d83161w2Jwl2y6SXFmbfe+DXP+cp8mc+xnZNzVzOP4pVPfkROZsAW9DrxIxfMtAZLEGRpw==
Received: from VI1EUR05FT029.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::45) by
 VI1EUR05HT238.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::431)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Sat, 9 May
 2020 21:08:43 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::47) by VI1EUR05FT029.mail.protection.outlook.com
 (2a01:111:e400:fc12::382) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Sat, 9 May 2020 21:08:43 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:19EE50E6B32F0D1E40C6CB79F34794B7343780A9A34ED8BB0C2509F463D8E987;UpperCasedChecksum:0E8D3CA3C780CBDE009BEBD08A7E7142A5C8FF1B97CE8CFF1096B6614356DC18;SizeAsReceived:7468;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%6]) with mapi id 15.20.2979.033; Sat, 9 May 2020
 21:08:43 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2] file: add PACKAGECONFIG for auto options
Date: Sat,  9 May 2020 23:08:25 +0200
Message-ID: <AM7PR05MB68811EB3A3AFB3B8C6876C4EA8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR0701CA0053.eurprd07.prod.outlook.com
 (2603:10a6:203:2::15) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200509210825.15288-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.10.191) by AM5PR0701CA0053.eurprd07.prod.outlook.com (2603:10a6:203:2::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend Transport; Sat, 9 May 2020 21:08:43 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200509210825.15288-1-kweihmann@outlook.com>
X-TMN: [G/XlGg9y/BgA3V3olZSceXFRj7qJM5if]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f0caf14d-e151-48c6-4876-08d7f45d27c7
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj2Q73utyfsDK2vwNnj/5KzdbECYFtZI7IpfMtOvrIv7sHV54OcVLKR/NxjXc/NKti4UyGTpPAUx8VcalhWG0goATJFquhzFphuonNxJpEKbFuoJS3qm9gCCCvi+LGtyNjIaYfUJZZ60S8wXq4muudRp5Ly1lQrIZy8+iiZURbBMP0inMlX61Qy6XMKLT0ualeWwiFsgsY/AA5le+jT3vBlPX0rt0Z5lLbUKYL/s4DNKAcLY/yU48zvNiJyDX9++L0uZ7WlIbjzilcgUmSZ/TU1+d1Op4dYmmwDFPIwvTqKzHD5HvJF/7j4HM9AqXH/do0SvSXxDG9Q8tMPP7dOx8+G97kNX074by7nsVvYzhwMCwA16C8Let2j2f632AW0h0s+LE1+ex4DI+q65w923rexh1/+mKA2DFhA0ASxLxzr8WPp1c6UrqI+P/c5Pu8wdesATZTCOEUapSfDKMKWffb9VVMA933IDFz0F3XlYZwGH5eX9Za8FOMNnd45qYADAd3nHr77lUxe6m51niMICw5T/pQhWuFHAriXAa/FUeq/MAkjX/nX+sspQT4pwRTDF1xjo3TjseafoqwyX2tG2NC1d2ZWpkiZ09SYQ8OcKit0x3NgpBrJFj2XgxINjhr2W4iNgE0fTY9FZ/WgJxiAmfVMUvvmAGd663YNjr5Qx9sG/2TvfNcnlyEkRcorLjMuPEPwjyoPRYBc6gA==
X-MS-TrafficTypeDiagnostic: VI1EUR05HT238:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	697l0+pwiOzdyuNsgpnusyUrae0PHNYGBv2LwLNgjl88yHBeLZi2t08gZwMClhgLHtV7Juohwu5TW0vRVnotY2fmqtxTF+WMpE6jTyklraHcB/bz30Rek7qx3hkozn/TlTEULm+xuah1bFf0F3Nm63oYN8lG4MWIkSU/Fcl1EP2b9+O69Mzj8MqOTHJV1Kacb73ut4PFOWA6fOya6KnfIQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	gaMEUgxUqMnCa/f2nZhznvh5qtwWP4p1uyEWANdKpcsbWR5fJ4lnR0a8KwsG+V5sJVTooSW1/vkUSHp+032C5/XzrhMR5btMJ3OYebXpsXssJx+UDHKqZnf4ss9I6A9q/ys5gvml8qoeNVt90Sc3FQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0caf14d-e151-48c6-4876-08d7f45d27c7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 21:08:43.4703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT238
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

A few options of file configure are set to auto, which can lead to
unpredictable effect when something in the sysroot does provide
things that satisfy the autotools checks.
In the worst case this will lead to package-qa failure as libraries are
not set in RDEPENDS but configured for the tool.

To mitigate changes of accidental configure set explicit options via
newly introduced PACKAGECONFIG variables for bzip, lzma and zlib
support, where the default is just zlib, as it was before

changes v2:

- add explicit enable options

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/file/file_5.38.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devtool=
s/file/file_5.38.bb
index b8f09107e8..e528d84cdd 100644
--- a/meta/recipes-devtools/file/file_5.38.bb
+++ b/meta/recipes-devtools/file/file_5.38.bb
@@ -8,7 +8,7 @@ SECTION =3D "console/utils"
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;beginline=3D2;md5=3D0251eaec1188b20d9=
a72c502ecfdda1b"
=20
-DEPENDS =3D "zlib file-replacement-native"
+DEPENDS =3D "file-replacement-native"
 DEPENDS_class-native =3D "zlib-native"
=20
 SRC_URI =3D "git://github.com/file/file.git"
@@ -18,6 +18,11 @@ S =3D "${WORKDIR}/git"
=20
 inherit autotools update-alternatives
=20
+PACKAGECONFIG ??=3D "zlib"
+PACKAGECONFIG[bz2] =3D "--enable-bzlib,--disable-bzlib,bzip2"
+PACKAGECONFIG[lzma] =3D "--enable-xzlib,--disable-xzlib,xz"
+PACKAGECONFIG[zlib] =3D "--enable-zlib,--disable-zlib,zlib"
+
 EXTRA_OECONF +=3D "--disable-libseccomp"
=20
 ALTERNATIVE_${PN} =3D "file"
--=20
2.20.1

