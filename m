Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.107])
 by mx.groups.io with SMTP id smtpd.web10.367.1589142591654842274
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2020 13:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=BVuK3XdH;
 spf=pass (domain: outlook.com, ip: 40.92.90.107, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqYZ3YU7uOSP2n3strGtzTj00RamGAYatwH78iPjTHXGoRcNiHzXpI9+tg0A+1mU2XAq1Xj8LvrQcYuxyiV/0l/dpn5Pjv7v+4lA+zaqkfcd5BiUOMLo79gYsefkLCIMaGkZhHsqQb82zisPw7wz+Xp/dnkiNR6IcKAkVpglJpu4B0c8LL18InRqd7ygf+ILJqXsaLnQZK+++pKM6aA4nsTOTmB5YRkrmATjHh5Pg+kKj6k8/1CCzJ9hL3xop/fTlP/SRshQjJrUnRC16gtKBoX6sUlRODc0bvPJSP8tLTrC4cx+abVLEqREYqqnvKGRYeffw78OCfQ4qETfy5Wx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYSzboqh+fZyUl80y8sZBVtveGYa8uKhWjkSssNODwk=;
 b=QBAbFz0L0iFKdKjW0iHk/vvwMhhwlqWd9FzblGuzFsgT0r1aWnK0fUFLc2VFePnBbpiLfVRefENmqB8RS3H2AVyU1qMUbRPtor6lHqBYADJvdgwRhXHbz7caI8wHEKut3Ln5HDhb/ozm5A/RN+7uljOQ4HqvnF7kzvOofSFJBWnpEdgKJb9Y+u/GW60Zp6PjgsHQu+v9uHs4rSnG01ESNxyLBKTh6OJfyKhTAQCUj0GlA14kFMSXYwrZQovcLWrIPGiYRYzambugYU5BCNZNWUSATg7kiun3FNrADLl6gQOVE/ILrcZf4Lv4jgUYfdh3LeAaqKZLrKKD95ObQ0+Ang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYSzboqh+fZyUl80y8sZBVtveGYa8uKhWjkSssNODwk=;
 b=BVuK3XdHlmykQRQrcl7deDE8sxw5DUIeEld6F/1lZTrIYS8/TGcukodsMVpw+gPkyP6mBbF3vL3xR0zhJpV8GmCCwSuMGE7OKlfzDh/SS31DGW1nIt6daXiIh1nX5+sZFY8LR0o7AXi0uHAwKVWPgkPwOe3pPGC0E1wtExaM17s6PafjhdVu0ueaNwJHA8ax135U5CPGbe4lYQGbXgNITuyMMSL1sr71mQGKiGnQKpoyw6+k0GQ19GkhzdLrdbYnv44HdxDfhbctIAQEymz1TABo4fjuMLhrg4T86OWArQHEAChmDHKlhaGqLcXYJMSE4VWUqxlfI/2/34bh7a24gA==
Received: from AM6EUR05FT044.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::4f) by
 AM6EUR05HT230.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::154)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Sun, 10 May
 2020 20:29:49 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc11::49) by AM6EUR05FT044.mail.protection.outlook.com
 (2a01:111:e400:fc11::425) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Sun, 10 May 2020 20:29:49 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:18D1C6548185BE23D70D6C7A463F4E854906A9E18CDC37D41FD8DB269F911A4A;UpperCasedChecksum:B917ABA788DFF23C2DB56B10A85917906806533256A2221AC5AEE9A1131FC4A9;SizeAsReceived:7468;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%6]) with mapi id 15.20.2979.033; Sun, 10 May 2020
 20:29:49 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v3] file: add PACKAGECONFIG for auto options
Date: Sun, 10 May 2020 22:29:36 +0200
Message-ID: <AM7PR05MB6881E5C621ACD529E1BB4F4CA8A00@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6PR0502CA0069.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::46) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200510202936.9317-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.12.161) by AM6PR0502CA0069.eurprd05.prod.outlook.com (2603:10a6:20b:56::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.29 via Frontend Transport; Sun, 10 May 2020 20:29:49 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200510202936.9317-1-kweihmann@outlook.com>
X-TMN: [/4Nu+P2QqLNWd4oYu/WZw88z9ipAKfvb]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6cb62fd9-fd5a-453f-6775-08d7f520e303
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj1Qpq0GWH60n8yJPkaKBx6MTBhty7oH8337hixglasNAcPPjB0W+DJJsbF1hGcvlJsOzS/9eY2zoAVRtLoxo+ixJb9YIKRDzt+J4rmuObPEDtsbvbkY5tkpHwMJLhJhk6Mo14nz+sdw8nWW4rDJiXiNz+pn86m0iIKD37EjbywI708Q2GtcJF49XcuLMOXmSTBqlJpckrfGqw5j2lfqrJOofNAc7e6FwUrWrMsWELRqdrH5HhtwYdXfDOJxex/lFBU7XUHZ21HXNHQZf/z1rGByuP8KfGWOEE6Gc0t+0z0Yeurwq/bmRy7V8BkQYqh/lZHkqbsjggaEBrEN5Xz26JqV2xrnBI1ZDphC29+WY0FP5FynR3mELK6AAJz+6bS0rLC0Z3BdMJNMOW9Ttohj53EM05p2FDPF2vKsaiqXNQZjfYuVl0e8c2ww6zbnHJeX3vMd+1Q0sn9sDIf1fwehqPREbj7WzuyYrJkA21H9YrOV2IY5mgI/z6HgEYID9khl5NVVFEAu9yiCJoTgrJQKoAbcdqQ2e88gsDd6/Bs9QkrNjKUkOKII5wmgRSkq1L9d4YmP65ZspJxOZrMYH9ZLRVtee9ayUJl+Ho3fdFWYjAVYJ4juwoFYXJ9Zn0Vjpw1/lGlbUsSevmsrDWxnvHmb3UTY0fGxPKER63lajNnX3aKmi3ltGCgn9p+C9quzU7Vg+puMt5B2wCVRbA==
X-MS-TrafficTypeDiagnostic: AM6EUR05HT230:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8X0TxWXUGEHR5yxx+iDOgoghvcO40AkrMEKX2kVOOn/z6Cp3LflylnoZzsEw+gHkq0MxGGDn54n+nU/ELxMbSLpBZfIdirjcw9ut3g9X5nBlFumjVBK8kvIWtAQWuLrd/6FfHmz9hYQD7AhZNhJ0equXE1+W1uIJrK6OnApdd549zwcbdZHbaKjgnhB2E0Uu3aXXoCWtBOeavTvg9KvoHA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	n2bZta0wNPxRY5X3WI/2EcfDLbCdSGnZRD0wiWZLfgcoFUoTVIrzkh52KTB7IByn32wVTn8Yw6HiJCcRUHXuRdelow8qjPndCEtUwe9Q3rLvMzercYZHqjhZsTXQCrumn3OelS81BuoKAPqhnqEL0A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb62fd9-fd5a-453f-6775-08d7f520e303
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2020 20:29:49.5441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT230
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

