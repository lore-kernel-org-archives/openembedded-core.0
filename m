Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.47])
 by mx.groups.io with SMTP id smtpd.web08.791.1609817862687106578
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 19:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=b9gEpdP+;
 spf=pass (domain: windriver.com, ip: 40.107.93.47, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgyiMC2064VDN6MYUvgA3sitwknTwlChdqE1+zLdqBvsCb76iWUI/13viI9VcUllKOQ+oVogMTyP1+OE63knEcyDb4HFptqgTcxwfndPo8KngQcfVEk/ShJNs23r9lJflbjFQCqh40AW4LEVsnH60iz9UCBOywmaR+tykYgVOEMax6IsF1imPkyW5IyPf+k0KXc6bcuNWvUOLbokXDLrM0LdWWcfoOwRSkKx0/dyeyJN5hFj2mEDyaqW5i2NIGtOuNfET1BKRLqCkSOSl0UJmVw7Ty1qT0b+NC1owlHWUCJRkfdDLkxcUBLG11viER9fLSxik+lCkfGEfNQmsewKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO4QQ++5oI2jIhhF4L/6oPTejta+9emBBCNHE3QhNOw=;
 b=Px6yWYvrAnL7KA15b0zU3u7WSSKvdADzpJpsUF9yNs3ZAOYgBSTF9hlZdAVGU9tWoTTy+SoTipkJNO4c8W4L7tiwGUgYLggG5Y2wT3LAchd+xezIeA9UWCzilUBcZCJfqfrZe8VoVbM88LCTqCawYriWX5/BkUGmOLZnJ6xrV8r2AtNCZA/FFkGvFQTcCDIjYNStC1ppHSNM3nzpjFCZ48zLWn/yGSg1Yx6F6RT9ITCEelvS0XIKZrjXiF98gVOpbCX0FyAcdlguJ+rbQWt4hgJnY9Df0c+GW97sbAWT9MojhtYMzfH0uFmaLNvGTZj4vpH0fG4IcD2m3JxhoJ5EgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO4QQ++5oI2jIhhF4L/6oPTejta+9emBBCNHE3QhNOw=;
 b=b9gEpdP+uD48Gp6YwBNkZeXfIvnBidbnUrl9fmoEsaT7P6dvqV+zKdOoJZLNRMdC7AZGPJDHTEpWpFfTPRHzsJZb4ZaIEWB6ZCLeWWVR6J4gS4LmpEZyVopE/HD5g9O+IW23/mXhHOh2HWsUwkoiRONRPVzRrJ51faJH+JU4kVU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB2029.namprd11.prod.outlook.com (2603:10b6:300:27::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 03:37:40 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 03:37:40 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org,
	armccurdy@gmail.com,
	tanuk@iki.fi
Subject: [PATCH v2] pulseaudio: define -mfloat-abi=softfp for CC on armv5
Date: Tue,  5 Jan 2021 11:37:19 +0800
Message-ID: <20210105033719.809-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <CAJ86T=VZtAHf2cP==VnVK1mM4XEY+DaJqyokmzPfCzGT0UvwAQ@mail.gmail.com>
References: <CAJ86T=VZtAHf2cP==VnVK1mM4XEY+DaJqyokmzPfCzGT0UvwAQ@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YTOPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::20) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YTOPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Tue, 5 Jan 2021 03:37:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4991294-91b2-4ac2-e4e4-08d8b12b40b2
X-MS-TrafficTypeDiagnostic: MWHPR11MB2029:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB20295CE3D6D772DC79704255F1D10@MWHPR11MB2029.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BdFEhRqho0qk91mpJc7H9dSHzgJiLkA1AYHBZKZBnTzzULNcEmlqQ3Fjw0o9tBwoU0k4B/nIQJUK10b4aQGd3KeRMZpUdfQ9khrwnrs5yAIoYJM+NQa2B6J67b8TZ6AQJXElSRjUCh2JWI/JT0sRaMRI/aIiSHlT+Hl8/GpccWCbh7UNYMBnBeLcqRunRnuw2KZ+2Kh98GF44u63fmE5HsVhsDnCV61n934c3yP38AwpDxjFfMruHdMvqYbXwo9Rugsx1WS8BsI1gCZaCUiOyZXvd4d7rJNQzK77Boy04UHj6W6vP6VDV8Rua8w6+UYJE3Eyw8QgSwP1AXtEZw+q/lQ7i4efiAW7MP4CtrLHNhUiuL0a42bdT+rIUbOPfWI9O+JN2AqVtz73BlrWLPqsZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(396003)(136003)(376002)(6506007)(83380400001)(6666004)(8676002)(1076003)(956004)(2616005)(8936002)(316002)(52116002)(66476007)(186003)(16526019)(36756003)(6486002)(66946007)(5660300002)(2906002)(478600001)(86362001)(6512007)(26005)(9686003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4MTFp9Hy2QI3WkMqVGAJRQFS4sX6DRk8rWUEUCiz+sZJY1XIkWBQ/eks3qiw?=
 =?us-ascii?Q?gFfILsvDJuw4e3NsW8/amxYOqkRwfy6yFasDLacvpgg1R9n80itoCbmvTYyW?=
 =?us-ascii?Q?wMAEG6GGQKRe3GpKgi28cVUeqkaOY9vz93wifm5fWbfMJ5UUaQOcJvgnU0za?=
 =?us-ascii?Q?QyZSEeC/3grCuBn1GtSe+BzNmwRtADnvIm+yRP80OZBmdoCFZMY64sEaMTgw?=
 =?us-ascii?Q?+xduxKDQW8YMK3G1OIWTcDRN+KadxQefr0Ypw7bqdbND1ZIRBFZwOFzYdmem?=
 =?us-ascii?Q?IS4n3RhH+n6dcV3qTvUKIRWiomNhioGOpB0asI0AQHLzuizUyHJXjOn/sGEo?=
 =?us-ascii?Q?qHjawn98xlT497s4JW7UClxl2YmPa9meryvi4B+jAGRvoLn3g+KqgxkPstTh?=
 =?us-ascii?Q?1/zSTJqXtZPdv+bIwlNchHq80uM5VJoQ4DZwcwaff9XqfYaYbpJ7qT02XUfG?=
 =?us-ascii?Q?VX+eCZNP1+vaGAo23P0UUr3Fn52YXsr529jelEzuPqVJesxV7ct8xnYrKs3a?=
 =?us-ascii?Q?yj6JmzCu+FSBqmceIwSYIYiJnmVpHk2Zq5aP8Uu2GD8ss/nPdJo3i4uFKqJZ?=
 =?us-ascii?Q?JDBU5kI/i6oxaUOzBIIdcYYx+XQ+pG+bTQCwPEBB6g6ilyVQSPrWWY3e9ksh?=
 =?us-ascii?Q?PuMSCiUNTdhQwxB85VQJuBFb2170h0rlUA0qmnR+QysqbVkQj5xh5Turbisr?=
 =?us-ascii?Q?4QS0Mzj955dWDFx8VRZ4jhWV0EgaUka7eeOi3B7CvbMbLp7AOaKFgwcZO+KU?=
 =?us-ascii?Q?6nVh70CfuiUsa8TvCF4B/C/4BYPvo5wWILI2mMo0iIV77wFWRkcSMxWO34F3?=
 =?us-ascii?Q?kiah4DLljPe473QVK+TxHKX38DHSZRuUbNW9ju2mwyfH/bt68/Fvjuzh8l/+?=
 =?us-ascii?Q?30UVwReAZoHR5keZZuuHAuah3vtIyLsF9S9J12+kRAdTu5yzkgLVHJa1+sio?=
 =?us-ascii?Q?m30Mhp3XykIkC1/c19pcO0HWAua/047bWU0Pf1VbRBuVZ53QPCXJLLjJabme?=
 =?us-ascii?Q?KMCP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 03:37:39.8876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: a4991294-91b2-4ac2-e4e4-08d8b12b40b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQPwHjijXS8e4fSc0lh5dAVz5OjDSeujsQj56z0A8tZh9qfmEwvCTJNMY5ttvLw9OT08iMnTaFblB9PBjB9e1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2029
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After pulseaudio upgrades from 13.0 to 14.0, it also switches from autotool=
s
to meson. In autotools, there is --disable-neon-opt option for disabling NE=
ON
optimizations, but there is no counterpart in meson.

And the meson build system adds -mfpu=3Dneon at the end of the compiler com=
mand
line which overrids any earlier -mfpu options and result below build failur=
e
on armv5:

| /prj/tmp-glibc/work/armv5e-wrs-linux-gnueabi/pulseaudio/14.0-r0/recipe-sy=
sroot-native/usr/lib/arm-wrs-linux-gnueabi/gcc/arm-wrs-linux-gnueabi/10.2.0=
/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with=
 the soft-float ABI.  Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard=
"
|  31 | #error "NEON intrinsics not available with the soft-float ABI.  Ple=
ase use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard"
      |  ^~~~~
| ../pulseaudio-14.0/src/pulsecore/mix_neon.c: In function 'pa_mix_ch2_s16n=
e_neon':
| ../pulseaudio-14.0/src/pulsecore/mix_neon.c:38:9: error: unknown type nam=
e 'int32x4_t'; did you mean 'int32_t'?
|   38 |         int32x4_t sum0, sum1;

Define -mfloat-abi=3Dsoftfp for CC on armv5 to fix the above issue.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc
index e40b8c1c40..761e4f74dc 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -123,6 +123,11 @@ PACKAGECONFIG[ipv6] =3D "-Dipv6=3Dtrue,-Dipv6=3Dfalse,=
"
 PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,"
=20
 export TARGET_PFPU =3D "${TARGET_FPU}"
+# workaround build failure on qemuarmv5 as the neon optimizations is
+# enabled by default and no option to disable neon with meson build
+# system
+CC_append_armv5 =3D " -mfloat-abi=3Dsoftfp"
+export CC
=20
 set_cfg_value () {
 	sed -i -e "s/\(; *\)\?$2 =3D.*/$2 =3D $3/" "$1"
--=20
2.26.2

