Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.92.70.92])
 by mx.groups.io with SMTP id smtpd.web11.224.1589225309352565062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 12:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=Hvj5BSVW;
 spf=pass (domain: outlook.com, ip: 40.92.70.92, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrDhXwF13Sjmu8bnq9IZl4s8fSO7sM90VrhhgX5LHqF9RwPma1cXcgjmLHT9jUQLa4L+OfcJ/xe4JKX+nLflmuXcDWyKTtm967oQJFUcjbtwzZeCgIPDtxamJsl8kyvcsHjFhUVW95g26FoTPXNQTPpQPj/uhBkShWvfDVnyPWCQ8Tjjswr6HGm4ukeVf0L04YDEwL0RPOVwzCB16R6tjKsQF+C77UjGBn8GTmnQIQpxknw6xfa3mPgWZ6l+AkhOCyMRvGlSImmUIAYq5nSY7c0p+BXZ8239PbB9RrPKXa9d8ubJZJV7wUH3IPQRP0zyGAOwZdDTNkE41sWWifnqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYSzboqh+fZyUl80y8sZBVtveGYa8uKhWjkSssNODwk=;
 b=RNTVPGdO+cXem/wLeDM4j0QjGwlTuFRCrEdSO9XAW4wrbM5ZlbKsQFkdhPWUHV9hOsDv21junNMkUSiw0HqvjDgBpHdLyG5aRrhToFSSK4Xr9fuRbFZgNrZjeEBc0/26xhlgZ3/1EzMggC+4hKMmWzBnq0ylWi498t0tGK6q0dnFTJe4pEPrj87qvYoG/7WCdobQjYyq87q5kIvXaNDQwYOHm3UwkOWVw4RHSVP4lUDn2cglyGAsIs03F9OadJgOQjfwgybfO3OMsYjVYmO3+uYZQ8uHF8BtqiiHv/ThJtKYD5vRvtFl2MGTlsY8V20EKITbt3B/rKFkrf2yqdk48g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYSzboqh+fZyUl80y8sZBVtveGYa8uKhWjkSssNODwk=;
 b=Hvj5BSVWB9u7ltPO68UDDszBhBe6ijtPLoEBtDG9ap0xa+jJCJzuBB5djWOCZ9gdqh1ssWVuoS1OPYSPNLL3JlQT+S3H2R/Esg7xvaD61uf7hXj6vs/zZNPXOwLlmcrNmtw6+qfyKuoQoNqnZFQE7gq6WPJQb8qZ/wFlbfU2sFSJ8wngqyb8Lw5FWZn79MDOoseYzLmnNYNp8wxVYzj82fIsJq+/UcAU4CDuGrR+VzCymtkqh0paydV3KVfLbd9N4Wo7JoCuK76jGvtp9GmJdBlDGjSfI2VkIklGAwGuuOaspNO8vG32cCSadadY4kHnjHIy3DRNfw5ZkXYQlE5e8g==
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2a01:111:e400:7e0a::4d) by
 DB5EUR03HT011.eop-EUR03.prod.protection.outlook.com (2a01:111:e400:7e0a::110)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Mon, 11 May
 2020 19:28:27 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0a::4a) by DB5EUR03FT038.mail.protection.outlook.com
 (2a01:111:e400:7e0a::340) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Mon, 11 May 2020 19:28:27 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:66B6A890881F49D0F55D61A20FD8BCCE00E1D59CDC3293B5E492F2FA96A61F94;UpperCasedChecksum:8B62A80DC96246A1E397E7B9ADF946757BD4AC581906068084D9AA6BFEA78B6D;SizeAsReceived:7448;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%6]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 19:28:27 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v4] file: add PACKAGECONFIG for auto options
Date: Mon, 11 May 2020 21:28:06 +0200
Message-ID: <AM7PR05MB6881B011F8D1E181BF2DDD22A8A10@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5P194CA0010.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::20) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200511192806.5135-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.3.100) by AM5P194CA0010.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Mon, 11 May 2020 19:28:26 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200511192806.5135-1-kweihmann@outlook.com>
X-TMN: [bEZhbNm5SoOjXE6YViOY2Bb2tH66GXZU]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 53ef20e7-588c-4488-87f0-08d7f5e17a73
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtwJ7JhG6//8QNmWQabGotoPBB4awsRNqVwmcQHVjPLnlOxH4sLEWrz/1/TqO7Hj6EgccqV07A3KUKz4ZzYLAmeQ8Hf+tDejykJf5mCLYMIXNgbWd4GFk8kTAJnjckL5+o+x9D4wtY7HW3glC29Dxgv08yYuxyIZIhtT3sOrMU3TFMRGISTrb8Coqg7wVpn4c4m/0Ei6MYP+GllLGbTRHbsZApDPxJlPejRQABH2NQ1rQ3vVZiCd0yQSFeQuLNV22XGX/pwAXMvttSYiTYqA86JcT+39knYxErB95U+7uzSUX1YrGrsUhmr9TlATB/jZHjS0iFD7Ss3gfylth32YVICbwEvcYf9WUM5mHjVWqVZLd+IgsmNdiN5vyvVviGQDlTOJeyG3UJSYDGwO6RBxpyFj9xvGSWMmY1snC/jHhwcd0PZ5XfdfkPp3k8Km3F/nhVgLOqG3Kd+JQrhoX7IhKSjahRN2wajpeP40JzVBGAx3plRON93kEIQNZbYYDpjDUBWRlPEbqYI+XmlVr70de2OIGv8h/TcqceSJMInf49z+3whvfuIb89t3cWXIaKSXxA8oCH5txHDHNOOqQMhI5QF9irsAW5JoBzamc0ZWU5LSyHTzNmFlvpiCJ0OmJE1Eb1YovmMsKVxtVCZJ/dicF2LocZrtAU4+NFjUcq6l58OQ0DiQNgM9MwdDpfWwhWIQgFExZ+0Nc+5mZMCUVdjI2/htv805Vxs6/sW5ScjxgSCs1w==
X-MS-TrafficTypeDiagnostic: DB5EUR03HT011:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e/w6iGZ1Q/8T5rZlaVIeJERhwapOevEjoqA6fyzPY+eM21iGGxAYFcbiLQjuiU5SADRvc6/k+wsyu7qbvGejUh0zqh/O6PiCtgiZDeWmZKwlDn8AnV0kXy+n+6JG0hTRRY4iEuuj9kPGyJaITPL1AkumQh/kXj+DK/w6mw4SFppogP50nzeqbZryu2YDEtfa3hWmFNQVygdQjAXcKU4+eQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	py10tw7i7ZVojpOdY+vTvYRIium7GBCXVXXSF58hJkEPuCJXvRw+RbQLww6aRuUK7N33gZsh3jkCnCA52YcvSkO8baxUCNlHAeVcJnjQeBP64b70FQV53FKcjq8BLyHxAGNcUX0LiId5YBE2Me8XXg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ef20e7-588c-4488-87f0-08d7f5e17a73
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 19:28:27.0438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT011
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

A few options of file configure are set to auto, which can lead to
unpredictable effects when something in the sysroot does provide
things that satisfy the autotools checks.
In the worst case this will lead to package-qa failures as libraries are
not set in RDEPENDS but configured for the tool.

To mitigate changes of accidental configure set explicit options via
newly introduced PACKAGECONFIG variables for bzip, lzma and zlib
support, where the default is just zlib, as it was before

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/file/file_5.38.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devtool=
s/file/file_5.38.bb
index b8f09107e8..f5ad568936 100644
--- a/meta/recipes-devtools/file/file_5.38.bb
+++ b/meta/recipes-devtools/file/file_5.38.bb
@@ -8,8 +8,8 @@ SECTION =3D "console/utils"
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;beginline=3D2;md5=3D0251eaec1188b20d9=
a72c502ecfdda1b"
=20
-DEPENDS =3D "zlib file-replacement-native"
-DEPENDS_class-native =3D "zlib-native"
+DEPENDS =3D "file-replacement-native"
+DEPENDS_class-native =3D ""
=20
 SRC_URI =3D "git://github.com/file/file.git"
=20
@@ -18,6 +18,12 @@ S =3D "${WORKDIR}/git"
=20
 inherit autotools update-alternatives
=20
+PACKAGECONFIG ??=3D "zlib"
+PACKAGECONFIG_class-native ??=3D "zlib"
+PACKAGECONFIG[bz2] =3D "--enable-bzlib, --disable-bzlib, bzip2"
+PACKAGECONFIG[lzma] =3D "--enable-xzlib, --disable-xzlib, xz"
+PACKAGECONFIG[zlib] =3D "--enable-zlib, --disable-zlib, zlib"
+
 EXTRA_OECONF +=3D "--disable-libseccomp"
=20
 ALTERNATIVE_${PN} =3D "file"
--=20
2.20.1

