Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6114.1794231641841910133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0fHrh0Xp;
 spf=pass (domain: est.tech, ip: 52.101.72.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0sKwT8t+SHOTndC+2XQYEoU5Mq1N84CoaaxLbR+tWLb9xsYQnD5pcV96KwVvdUNIDjM7qG8b9yXpSWRTQi9R2t55djtN7OOIRhErzzxSk+9dHIQx/xgc9ombvGsIz8zOHlVbEoLm/BoQYKlJ+x+fiy1YdNm894tsRTOYzMIaKwdy9iLe5nzfvY2ae9AYy1mml2JHUOHb6iR4UG/IBJtnE3BxqCmq3K5GcKBypj7wQHW76asZdVNUAkN56WKNeptKpPNBSjjpBxZNSP37lDg3hpVrhGtgXPnbb5TTFbwuKj9mmstlWeaUl0wEVz23sgs9oDMA2twr3EcjDE9SRVooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZV6886sf82H4tXCau/FgZkGFgeL0WTo4DPGKrxA7r5Q=;
 b=wWajp1IQQptoqPtBCpWZdH+xlCcuCC2n0LMKt/I/EcchZTUIT5D69xjy70zkykfUwH8XbQBLY8W8BvqfgzEaWmQBZpBU1jL4TFjZl9FZsvMBN8ilDxJHjJfGPP1uegKAaleWdpeeiyJnZGX9TMvUrql9olxScJlcz13nPNMD+z/5CoJc5lR5e1vI07aJvhBSrNr0fL0pXrfmpfghFcNYhWcqNVglWKqMgvgkBow9qN2fzMbBxAHZz4u25FMO8L2kgFi4g+RKdX7N//YiWwMaCVHXrb8ntLECDY+iSQaG5dwlAIIm+omSpLYii+/V1CfuMTSsKmqbXFZ4FwpKSneaSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZV6886sf82H4tXCau/FgZkGFgeL0WTo4DPGKrxA7r5Q=;
 b=0fHrh0XpPJJ3fWgCKslzqY+Gxylmv/H8a8ZhTHRCxEbIvYuz5y71MPd8h86j3w1Fs93ca06km41ZF4b1w/pPfQuzGRwkisd0jFw81lKI0AIjBH3gnjU/VVKLSZ/ph8OTdzfCo7ex6uaWbslEDkboZQxcRuS8zMEMnMg4hDPJj77FwfGJoYlyKX01cgGx3IH0fwco8hozp0t7ZgptNBn0avn+VTACn09f8Hdp9M7PtYAAELHruK3WiplfsEZSTZtCGePyVmou8FaE2nbs6WClGSHs/aG/5v5vDCo6f3N5coxAZ9lJyxHFN7/IYCAWnEZQpFYlsAQSLVpgZ+KRTmUkrw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:41 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:41 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/21] xserver-xorg: upgrade 21.1.24 -> 21.1.25
Date: Mon,  9 Nov 2026 14:40:16 +0100
Message-ID: <20261109134034.74458-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB8P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf9bcf7-5e25-45d3-27bd-08df3e670c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|260925021911599003|260925021311599003|260925022911599003|11063799006|261021121427099003|56012099006|261021123027099003|261022115727099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261102124527099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: Fc+Z8Xy1ySLsFC9j9fzo3M4zXonUhcbsZKInxvd6GI25iT9kpUAPI3Psb525ZXoG9HLku1hnlk9Sx/2l8StYbR+pZIqnwKvCONtv6L1FmKNURBM46s6c/YIk2macwVQvlPBxe4XAZAoSLrtg1obeYe+Hfs8jsr7sD+iMxLQ7Kh+oo/LvRjtFOX6ONh6P0kJz/BewV9WQJC5XyOMRe8rLFq64BYvfWKsPHwZpOsLCZzEaAD6GA4hQRMQ7DoZm/2fzxgQrxfy2Q21lhnxn5qmCIOotPIY3l3hT3QB1LTRQNLsskbVHh3DjqOVIMe4tovO8oFPHUmTqoVfOqGYw3VkaXM1xpmKwSyJO6zSaFZf53oCHRuIWPw/qwS4JEfeAnu7kBfab5kP+ettkfAGaBxLoefwzAfzDeXW+9F/kKbttXdPkQFjeWN7RJNnp/IqCVzC3fE9DICBO0NPvn+6qc4br52u0qModAYTa5tQ+Lhj+mBVoFEyEDeAOtDQXGT8tmBrNHFoJ0+1WOyG7NeG14zoumVi/ihNMnZoas9bBLukB/zJVDAiAgwqhdXS7CkRT9mPdxwcgNDN+ytMG6ettnqEKWVHxdcxzz4I0vbKY8sLjWgg5AWAGFBS+gZ46EOvmaA7A5/YSp3TYjmbuTCc9mBw/gZdIgnIBXiQmPePX9N6oLRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022115727099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261102124527099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Rjixg2U00EgZLhSi5x2J1gPTAe1c4B0PZNTewDS5uaKSugc9mPLDKqwsLAe?=
 =?us-ascii?Q?noryMv9FWPk5msAMtRbEVEDAVdmSi21Zgc/LHzgZ6iVs/zQ90sMT+R1Rr8gW?=
 =?us-ascii?Q?QzVDy8do5iWofg3V4ZPEkXxL6IXVW4bhWJBy9wQlMvgneHlszLonYmpbmZQM?=
 =?us-ascii?Q?xcHvFtGqnX9rLLU9jxXuznomifCKrewSJJ6sMbEtWCUIYbiQsYFjgfuF/7UM?=
 =?us-ascii?Q?SIsAJ7FLoFuvs12AR9Y4zhfVJm8A398otEGcNoqcQPsb78F7NWfrGQSUrnHz?=
 =?us-ascii?Q?Nds1hhZoUA3nkv00QFwYaU9SN4s7QCUO2BZ9rth+xy/lhNja7jI9xKZFIg5c?=
 =?us-ascii?Q?q3hMj5HznqKUOWmtKgChQaXJ3tl4yKK2bWfk2a9DbyVeuuYutdJC0i0rXmtl?=
 =?us-ascii?Q?r/Q0zHhhCMkVtqEiSEe2nco6jOTTC8Kqc1D5jhMjO2lmg5FIx70Zxk25a3Z7?=
 =?us-ascii?Q?If++pBjUkqpUwNoVWQiNjg80AppbwHmW8Ua/FtjfPoqmm29uiWgrfamaDL4c?=
 =?us-ascii?Q?t+mlzStHasRYqNH8ycKd/NqY0ypeuZMo2QKEOSubQARzMsFLS9dzcoFIkDHM?=
 =?us-ascii?Q?dbdhuXKWrEdzVj0x9zfJ5aBgg08l9+YzQxkBjc/pcfgN2KrEtx7DPKs3CN+o?=
 =?us-ascii?Q?6ZzqWpeALs7V5jsothinSGe9ZmKL91H/1eAhfR4oZS5NUwB53uTk1tmnAeU/?=
 =?us-ascii?Q?5iQJsMTUhdkYrA6QtWHaeEPdDO0JqmvUnzfa2zWEekj70+RXil9ZC8yUKvNS?=
 =?us-ascii?Q?lo95Avn2GSFT+Lgy+02+AisuKYC1dfnTyePlgJR+Yw4WyyitEPjH2rY5nVq1?=
 =?us-ascii?Q?DfyNb4wWWNtx7IBEzMRLq6ee0eNyw3mGdRuKzr0qrrm9eXBVseGp8t2N91qk?=
 =?us-ascii?Q?TBUVkh1xXl1OtulwTD9y8BLJk/1TwWh4IoBUzKJ95jGzQt/3X1KZN457KKvT?=
 =?us-ascii?Q?tkToY0BdlZFypGhdperjIrMB3cDxvRxT0VI0QXi42D2KgAHOmNnksY3EG8SH?=
 =?us-ascii?Q?I8tHBxidj4fANknYe12fr6rWAs9W9BoL3Jj3SVfJT5j0i3V+HDYBCQfDW9lf?=
 =?us-ascii?Q?qQgGWlboa7/4pK4tNanNOvRy0hfGCHqMXDOwpLJ1FP/0oalLAYktTmjARnAd?=
 =?us-ascii?Q?VOBzOFlE9ciB1AexWZfuVQHj3wop0QiRIUDQEMMLYcdOHNQF0695CnMNcCQD?=
 =?us-ascii?Q?VsIRo1vAEW6rvSH2ICo7LeozYUI7aLEb6WQ0tLEFumJ6facK+sek4HC8BPJw?=
 =?us-ascii?Q?i1ug3VI6kHZfWS85yLw6627HNdc9+BnTMSQ8AxgFvuOm2kPwVtWySryHRJUB?=
 =?us-ascii?Q?aby539TukL2cw/rjvexP+fs/U4SXyr5RTy7HDte+sms7XQwasTCr0aU4GUDq?=
 =?us-ascii?Q?btupCHGHIqVUQezD8MgWeTBo63paRK3b/SSAcQ5qsTtvTMUwbMlnKVTcHVih?=
 =?us-ascii?Q?CNHZlswjm3sJYO93lCuMCnnJC7/AQZ600wHJs/hjuqFJfbXy9PpezTpLDHsb?=
 =?us-ascii?Q?VieuIn6OAVJZXMEP4Ayhht0YCKu/xKyy6ZnGblkZ1+h+k1leq7mEny18NzaI?=
 =?us-ascii?Q?37x/obQH/Sd/xcjV3id9JoshYgqarXc8gLcGpjh7ZK0xrybMKrFC+Q+QSimU?=
 =?us-ascii?Q?pkw8ofqpN/zrGx6s8kaxoz+ifThWpn0ACiuSCEQT6NO9KdyksLjxIqTseO8f?=
 =?us-ascii?Q?AavIla41nQ00UZdlTXK308tPHNVy+y9O9ZeiYAzfHEeL6fW1yvmEmYMQ2TOx?=
 =?us-ascii?Q?Nt/DZ1cMpg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf9bcf7-5e25-45d3-27bd-08df3e670c38
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:41.8562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNeXB/+9suk0mzQyemcNyu3ByyHrmHfU1mb+PuQ+DdUEUzgKARGnkjTudeo+WuaChU87iKMKGK3ho3qwFvw8IXJQxdV7nnTzakwaChNy4uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249808
Content-Type: text/plain; charset="utf-8"

xserver 21.1.25
Xi: clean up gesture sprite traces in WindowGone
Xi: add bounds check for barrier events in input_constrain_cursor
dix: remove passive grabs referencing a device on removal
present: unlink notifies from window list in present_clear_window_notifies
glx: validate dataBytes against cmdlen in RenderLarge first request
Xi: validate modifier values in ProcXIPassiveUngrabDevice
randr: fix size and offset in RRChangeProviderProperty PrependMode
xkb: fix CheckKeySyms overwriting request-range symsPerKey entries
xkb: widen size_syms, num_syms, size_acts, num_acts to unsigned int
xkb: allocate names->keys to MAP_LENGTH in XkbAllocNames
xkb: NULL text pointer after free in _CheckSetDoodad error path
glamor: Set `need_free_region` immediately after pixman region allocation
xf86: mark wasset unused in xf86UnblockSIGIO() compatibility wrapper
xkb: Keep the group counts of a loaded keymap in range
xkb: Never recompute a keymap's group count down to zero
xkb: Default to one group whenever a keymap reports none
xkb: Guard XkbAdjustGroup() against a keymap with no groups
damage: Unlink a damage from the list it was actually inserted on
meson: check cpu_family() instead of cpu()
meson: Fix build on FreeBSD/powerpc*
RegionValidate: Fix double free of badreg->data on the error path
Xi: byte-swap XIQueryDevice ScrollClass flags
Xi: byte-swap DeviceChanged valuator and scroll data
meson: only install dri3.h if building dri3 support
Handle -Wimplicit-fallthrough warnings from gcc 16.1
xf86: handle malloc failure in DoSubstitution()
exa: silence -Wold-style-declaration warning from gcc 16
test: silence -Wanalyzer-null-argument warnings in strndup tests
xf86: silence -Wanalyzer-possible-null-dereference warning in parser
xf86: prevent passing NULL pointer as strcat() destination
xf86: prevent passing NULL pointer as strcpy destination
xkb: Fix -Wcalloc-transposed-args warning in _XkbCopyGeom()
enhance: popen-fdopen-error-handling
xorg.conf.man: Fix escape sequence typo
config/udev: guard against NULL subsystem in fallback bus id
xfree86: set GPU screen FB/DGA defaults on runtime hotplug
Fix use-after-free caused by duplicate glyphs in one glyphset
fb: Don't widen the planemask over padding bits when ROOTLESS_SAFEALPHA is =
set
xquartz/GL: Log failures on the indirect GLX make-current path
modesetting: Check for NULL mode_output before printing warning message
ci: Prevent duplicate pipelines for MRs
gitlab CI: add workflow rules
xquartz: Activate the app via xp_window_activate() in -set_front_process:

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...1-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 2 +-
 .../{xserver-xorg_21.1.24.bb =3D> xserver-xorg_21.1.25.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.24.bb =3D> xs=
erver-xorg_21.1.25.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBu=
s.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/x=
org-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-=
hardwar.patch
index 14831b1a9b9..a8f02d85f6c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use=
-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use=
-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From d387580194e91ad73f896a9669757612c8601c92 Mon Sep 17 00:00:00 2001
+From 2822e2e7a32ea1c42db5877cab23d2a33ac9c290 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb b/m=
eta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.25.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.25.bb
index 8d7f9ae14d2..b875efdebe1 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.25.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
=20
 SRC_URI +=3D " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-ha=
rdwar.patch"
-SRC_URI[sha256sum] =3D "1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac=
55f3f5ce3984af"
+SRC_URI[sha256sum] =3D "6ad4e3c7b59a309b32c92e5c15ce1267110f9e13f1ac78da62=
361a628da1a0eb"
=20
 # These extensions are now integrated into the server, so declare the migr=
ation
 # path for in-place upgrades.
