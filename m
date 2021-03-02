Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.83])
 by mx.groups.io with SMTP id smtpd.web09.4964.1614666561338443410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 22:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lt83fPft;
 spf=pass (domain: windriver.com, ip: 40.107.68.83, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHzWcemDrmgeI05NPNx6rf7FFGJn69QTHysxs6S0ywwoiKzfP6sp3iEzSbOyfZAFVyK3a8A3/Ai9edZCqPRFaVJOTGMD+eEiaTC2ibVdD6nHosHh0SZGOkAqddKchA8A9cz1UjIq1C/vilUVG1EImMiQKBb1Nadn1zpvtvn5AtbCIJY6F7JvXY61LIy61ukOqgBSoS+1TSVYYs+v4k59dl9eXMJoMbxlI9WtmQWqQZR1nNM4mWHhXx+cCw2fQDf0LGsjHnuhGh/hjf2Vi/9T0I9B534jAIxneCaKNDMLZ3Bts3hKxyNh6ujWNht+AXrwHIpaC2zFWJicI/yONbSqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaz4ITfo0Jq63qI5XwOTsGTs4uljTQaVvfkgFms4/ao=;
 b=cPiM9xAG9lvlJDEprPa7J9qi2K4JseNkGHW/tzW3xTnAwMzRJB94vnMjizHXY2kLrcmo3pLoCq+Do1PqOv2iGaqsreEC7FNKadso2KYfZVjwHMEJ7DIrn/BthAOCZlILZj+XKiBt/26WDUD8Q/Gr9B09uh7qNDIL97sdyLUBoyYCmYBCJ+o1CjWOTpPex1z8CPKvhNBmhhWaYVNIqWrrbLV8rZbzLgcA6kVHwuJ1LSoSw84YXM3QvGinNcQIP+1sF6cQ3/hIRmu6+OFwHONIYE5nmf7o7aneULLq+zYn28bHHWhJz5RAsa9ixR7EW3IoTjO2SMVfCjO4LpgySmnmaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaz4ITfo0Jq63qI5XwOTsGTs4uljTQaVvfkgFms4/ao=;
 b=lt83fPftFvcCnKdrCao4Qt823oqnExYxYkLh6CU8SBfZwlNxSyZ9+68qCefBZKEBTt7MfNM52N6NMnhKeZikZK8r1IY+sdRMloYwzHsLG1ioNiWy68T7MNcIcB5UofEWn33GYN4PywrLLkPeHb8/jJYObiNtRKl6SUiXoictOXA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3216.namprd11.prod.outlook.com (2603:10b6:805:c1::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Tue, 2 Mar
 2021 06:28:59 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 06:28:59 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] cairo: Update 1.16 -> 1.17.4
Date: Tue,  2 Mar 2021 01:28:06 -0500
Message-ID: <20210302062805.9917-2-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302062805.9917-1-yifan.yu@windriver.com>
References: <20210302062805.9917-1-yifan.yu@windriver.com>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BL0PR02CA0112.namprd02.prod.outlook.com
 (2603:10b6:208:35::17) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BL0PR02CA0112.namprd02.prod.outlook.com (2603:10b6:208:35::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Tue, 2 Mar 2021 06:28:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa04f516-0520-4471-b151-08d8dd4476a0
X-MS-TrafficTypeDiagnostic: SN6PR11MB3216:
X-MS-Exchange-MinimumUrlDomainAge: cairographics.org#6441
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB32163DA923F575D3F794AC9A80999@SN6PR11MB3216.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Juhaoxsbq0GYI4T6j/tfGSmbgT4eNuhg9tH7SmJefgG2PgYpSi2x3MglZ+HgE9HGZZySzkGMT1kBRXXCtOjOGCPE3TU6TTPjXkIVW2j5WVB6ac1VWq8bQ/IPZ7QZtkvF/TE43U0YRtNnyIzWxMUynarxV/aT8Xg7ynOu2sr6bAo5zkwjuWR0TH0vmyUCM0TU64iZwnVTcDgXk8Ychsc+XlLQvL8wHgAMhC2W7CLIUarxiv093lfjWxb29l7zW2/iSp2bCpaDVolhfDIOWQgQqfBpo2XrrMjHo2+mFeGBIalzDcuDnju6AhS/O3K26TJO2gwh98KCu9ZRKHjgkY1HESYSYbEmSjI0bQPHQnBreSZIwhPv5kcHz2iuIJkIHPTyeY92y/x1aTZDvlI9HCqYSyL8k6ZrxGBQgFTavXDl52U527+egYJTF6L3xndbHyMCMUoO7CRYa5R89i/jb0z5SKfJ665OMHfS/nen7N6jpFWKCC3zjtic+qYO0xHPaG12yxSOijJMmMxjzBnZwbVV/2OU0bLTVbxLQVhymZZenBoVOwl2I/jtQO2C3ArOfZg4SGEuMCcL9ypVflzmMDAkeIf3ClEl8YL0qx7lIZjucZw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(366004)(136003)(39850400004)(8676002)(478600001)(2616005)(16526019)(26005)(8936002)(6666004)(66476007)(36756003)(83380400001)(1076003)(6916009)(956004)(186003)(6512007)(86362001)(6486002)(5660300002)(52116002)(66556008)(2906002)(6506007)(316002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?rWT/9O4XtY9od0hL6u1EeqLeUWq2g7PqSgatw4Rg073Ow6s4YHD8F1o0YmZA?=
 =?us-ascii?Q?TbFAw7B6H/f+/8bWeco1i/PWJ2C9/OV+qmoVMkFncqq/1WCjGL2l8CwjFw22?=
 =?us-ascii?Q?vFlwRKy87mq+H9Ve+740yWqwq19Osm/gp1RsKc+95dYWBjowOpQCYDxunSpY?=
 =?us-ascii?Q?/NT91qRg48BfKcaKP4HDdlbGlTL10FD6tNZVX3meBXP1XOQoSUxDzgncBlI/?=
 =?us-ascii?Q?SNykBlbt3jNLa0O9cskTpLuiwViBwuhMjScQADYT/zDD/AoBBAOT5g3gtGmK?=
 =?us-ascii?Q?E+F4gQV69bwYYQ2XmSJZ+lVWif497B9HXKky/LCLa13hHE9MGWPjUkyLoqVC?=
 =?us-ascii?Q?rPurb7dxTa3L/hGCPKsYrTm61sg3YaF7MX8QOUd7oA4mujALhHnIFecGPV9P?=
 =?us-ascii?Q?beTDwOAYJTwc8ATJ6UDD8c6+kSMDqN34bb4Vku1jUSHkyVhRojzoR7dcmfR1?=
 =?us-ascii?Q?MhBOkIKIdq7ckBCGWLOBArYd77jRhzapUQ0CF+gZbjWJLd6NFIjqUMrwMZfs?=
 =?us-ascii?Q?kVKiItx27l0+8qJBXALOQMwGp+A8sR45rihJjT2BBvdOZlvOXmSsq5Bizk+S?=
 =?us-ascii?Q?knaICQzptMMjZ+K6x/Uf82UV9TW+xSh8AQ1PKXJpwJ5XMDWe4D/mhIwSryq7?=
 =?us-ascii?Q?62ZpgrmqDxYErOLePZnCFzp+wGi43I/gyeJXvjO44Hv3fmhCruoYDK2LVnJp?=
 =?us-ascii?Q?0SE6VYmtc6wsvF1dttiSGJWsp0SndZ10uGoziJT2n5lA2ef5brAXILOomYz/?=
 =?us-ascii?Q?y7H+Z3OgP0t9vcA4PFc69Bucwcl2zQVC86qTxQrPG4p++4HlUp/k9uyazJEx?=
 =?us-ascii?Q?PtskJLfBu6aEsoohDobQnlf9xgqbxckqtNON9OnqUWQqtdyZbw53RfJA/RoV?=
 =?us-ascii?Q?Cot9kGA3hKaRwVAJz55qJfgRVpD4qtleKmjgXhSx29tu13VOUZLtfOQ++vps?=
 =?us-ascii?Q?q5+Y3n2FyftN2FPGfa9n2H8X7EUFclmXD0lV/NzWjBzeohCIPBUM0o+ZFzdI?=
 =?us-ascii?Q?dEKK07L089XdJKV7h0w24JsNepHibh+LyERmHBiyHSgHyCCPhk75UaodOHIh?=
 =?us-ascii?Q?7gzOAwdE5v73sFtwYE5iVQIlF0aXUocKBRfbedfRoEc/V77AazU3DXQE+Pee?=
 =?us-ascii?Q?+7RUlcTQupD7cRwcUuZ8fWfrGx4JfhVB8IynJ5rnLlQD8osaYXQcaW2hT7dn?=
 =?us-ascii?Q?3FT7+uU3+mFYXFpbokQIaPhAa6TviTLnGH+zBKqfn+WqlXFELzUlgFMFsEIH?=
 =?us-ascii?Q?PhCemxx86aHObuyG9MrwMzU0oBKrxHE6OcLsWeyZGfX1MungrgX/eVasiroG?=
 =?us-ascii?Q?UGcKuOmzaLZjWFNGy5jt0TTu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa04f516-0520-4471-b151-08d8dd4476a0
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 06:28:59.1867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYCC8vG/8UQjDm+hMaECKIhArO7795TtyIBnj0s17RGj3uo5Em+49FILXYC2XA844zdS/jUBchkROOdEV8OTBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3216
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Drop a backported CVE patch:
* CVE-2018-19876

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 .../cairo/cairo/CVE-2018-19876.patch          | 34 -------------------
 .../{cairo_1.16.0.bb =3D> cairo_1.17.4.bb}      |  7 ++--
 2 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
 rename meta/recipes-graphics/cairo/{cairo_1.16.0.bb =3D> cairo_1.17.4.bb} =
(94%)

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch b/meta/=
recipes-graphics/cairo/cairo/CVE-2018-19876.patch
deleted file mode 100644
index 4252a5663b..0000000000
--- a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-CVE: CVE-2018-19876
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Mon, 19 Nov 2018 12:33:07 +0100
-Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in
- cairo_ft_apply_variations
-
-Fixes a crash when using freetype >=3D 2.9
----
- src/cairo-ft-font.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
-index 325dd61b4..981973f78 100644
---- a/src/cairo-ft-font.c
-+++ b/src/cairo-ft-font.c
-@@ -2393,7 +2393,11 @@ skip:
- done:
-         free (coords);
-         free (current_coords);
-+#if HAVE_FT_DONE_MM_VAR
-+        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
-+#else
-         free (ft_mm_var);
-+#endif
-     }
- }
-=20
---=20
-2.11.0
-
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-gra=
phics/cairo/cairo_1.17.4.bb
similarity index 94%
rename from meta/recipes-graphics/cairo/cairo_1.16.0.bb
rename to meta/recipes-graphics/cairo/cairo_1.17.4.bb
index 68f993d7ca..5155cbbf2c 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.17.4.bb
@@ -22,15 +22,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De73e999e0c72=
b5ac9012424fa157ad77"
=20
 DEPENDS =3D "fontconfig glib-2.0 libpng pixman zlib"
=20
-SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.xz \
+SRC_URI =3D "http://cairographics.org/snapshots/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
-           file://CVE-2018-19876.patch \
            file://CVE-2019-6461.patch \
            file://CVE-2019-6462.patch \
           "
=20
-SRC_URI[md5sum] =3D "f19e0353828269c22bd72e271243a552"
-SRC_URI[sha256sum] =3D "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d4=
4be45e66052331"
+SRC_URI[md5sum] =3D "bf9d0d324ecbd350d0e9308125fa4ce0"
+SRC_URI[sha256sum] =3D "74b24c1ed436bbe87499179a3b27c43f4143b8676d8ad237a6=
fa787401959705"
=20
 inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_scri=
pt
=20
--=20
2.29.2

