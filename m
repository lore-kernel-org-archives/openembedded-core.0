Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.10834.1610556098249642481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 08:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=uLgu8RBe;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: ESJYc70tnn1GjiXIt1Comcnj1rwoID057EJBeseRfqSIi1cI9elhr1DNH4hLlmx4ma4W/pE+dV
 pBLsL2iNyAaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="239771934"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; 
   d="scan'208";a="239771934"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2021 08:41:37 -0800
IronPort-SDR: KDy+kq3YQwzwDGNXBfSm9PMAxxQVv/VFA2Xt8y7BRSaSO0PrGHWXAlAaVF/xfC0GYcP9M3YJRR
 kc066pxUM/7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; 
   d="scan'208";a="499319620"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga004.jf.intel.com with ESMTP; 13 Jan 2021 08:41:37 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 Jan 2021 08:41:37 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 Jan 2021 08:41:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 13 Jan 2021 08:41:36 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 13 Jan 2021 08:41:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLbJMfwv9Zxq+ir6+GLSZf4/RR5gnn3ZNhQCtlJRuVLxJ67a7zyMhgAlikPZ/fQ8chPPehbfDA9VADCHN/c2SFe7XCp1R+ze/7ZXc1674fA4zltwKGdLevKCfpQ4f83KzyVBEUsGIvdgmJtcxdKbQ5hNUpN7pVJH6Ax9+sFOKsDdqFPvD4d+rr8ltydy/ZOdJDH56nWizLU6lyP40m3WIuKjKife5zEAnN1qc2Ta+8QreMhB6FLfmkNK37PZTQZYHeGOYIc+/g614q+94Muk8S4EQgDwxM1nOAqX0EDI7f9xxu4Cz6AQjV7q4lBTrpSrTOsvq1VCI/4A0sE+wvTHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tR50+Xz3xxv4aTEaJicHpeqByU9Ml0KjvP7xcLsCTfc=;
 b=Hup36u1q333aH9UqCwJeRj4yovwIwpSF3JRZgVMfej0ZU5SVim/xAEK8yzwERJLAWOioEZRDSMBaZFlKrFe1c71ShtASsPasqp+/pgHcpfo8SJRWtA6l5Ulz09ILZenf1NhBlVDhI1ubdn5VchHtcxkSoj7CPF+ui7gZiFZrmmHsLDWR06cMVKoKAQ2f+7mlLP4eitbtgMlZ1cwgRwGNSCDxXHgdzp//d7tLrSfN9Y+h7B2kCOC4ovoYSegHY45l3ACa4gaY9MDqkiw/CetyLJpDXnqD1QS+AdK8o+tIYLmxuLOKQR+jc1iojJx4pHvJtjs3MZ5c5crwtjqF4Vwyeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tR50+Xz3xxv4aTEaJicHpeqByU9Ml0KjvP7xcLsCTfc=;
 b=uLgu8RBeDqm/5qtc+RIkjB+Qnbq6h01gDdZPceQ0W5F+KFD+o5pX8pR8cM30lMj+OY1TVa+czT5ZvKYwbtaLBReieKuIh7KbOf9QgtJHnEp+r11tS7+n17xuRJMlvK2aq2UM/sY2M2Y9EepCoGkb1F9oRUmnrd05CUUqRpSlJ74=
Received: from DM5PR11MB1993.namprd11.prod.outlook.com (2603:10b6:3:12::18) by
 DM6PR11MB4441.namprd11.prod.outlook.com (2603:10b6:5:200::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.9; Wed, 13 Jan 2021 16:41:34 +0000
Received: from DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::1091:a42d:eb3b:aed9]) by DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::1091:a42d:eb3b:aed9%5]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 16:41:34 +0000
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][gatesgarth] ffmpeg: Fix CVE-2020-35964, CVE-2020-35965
Thread-Topic: [OE-core] [PATCH][gatesgarth] ffmpeg: Fix CVE-2020-35964,
 CVE-2020-35965
Thread-Index: AQHW6creZcAjLRSUgUCz73QUXRNA16olwjhA
Date: Wed, 13 Jan 2021 16:41:34 +0000
Message-ID: <DM5PR11MB199313CD10CED3EFEE61F8E8DEA90@DM5PR11MB1993.namprd11.prod.outlook.com>
References: <1659D82CE05AD697.26130@lists.openembedded.org>
In-Reply-To: <1659D82CE05AD697.26130@lists.openembedded.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [115.164.89.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72220122-847d-4703-d5e9-08d8b7e216d9
x-ms-traffictypediagnostic: DM6PR11MB4441:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB44419E0AC956D9C468856BF8DEA90@DM6PR11MB4441.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:62;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NuslKkgyQJZcoMQi7JbtVDKVwGsiiAYR7pNd8YtHnFW3tAG/4lvXdAqEHoPhuAg9cZh4GaXGWApPqwF4MjeCaV8q4/aeti/2KXeDgJP/Jwf4iUr39uGOxxM2IK+3IT3frmC6n+Dx5IYg2YCjciYmm+oKSy1kI9T/+nwQz2H6t45E/8oCJ0iarSGpyy/CL8ayY9I87zd6ckZ6X6lr6fCS4szLGeWg4TxoqjnDQwXsGqkDfZgdx7W5MJGylRcqVlE1DzXzDmyhkZt72Xj1BcWbhjIgEldbFQ+DgAUFvB+xzIfoUZaNNZrPWZGqzLG4F/pm9wlR+BBsxAqbWkf9T3ICJDnUIktBG+30B4ivEfWE+av2+/CMT7aU7BcsLvDT/tP5ANM+TCpBFYO8l8+Zgks1XFItsIQi+EjuT0ccNOgSKifTlZtJ0LUDO+fNonIpoaDk2OacznduvmPY8R9PwVeKi1fgxsdv5NDq4R8pwOpDUhzaadAh10UJUcOjQH2lNOTLh9dI643+GBqrJVziTryuBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(83380400001)(66946007)(15188155005)(8936002)(66476007)(966005)(55236004)(66556008)(2906002)(110136005)(52536014)(16799955002)(26005)(186003)(6506007)(66446008)(55016002)(8676002)(86362001)(71200400001)(33656002)(9686003)(7696005)(76116006)(53546011)(478600001)(5660300002)(316002)(64756008)(19623215001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?EwbmJWZ43fzBHn0Gw7G0krbgbVoBeZ1bmnLtRLObeeFcqOoiD52ZeTz7eseX?=
 =?us-ascii?Q?Z1UOo88kL8toTGhNU+A8RMD6kG80TY/7TRZILOQ7JBNxhrOU3ZEZiYWszBdh?=
 =?us-ascii?Q?LoDz60siRykFXzXusU/C7j983YAOEVvNgvcfdqhl6lAt65bqKf631CN8yNP4?=
 =?us-ascii?Q?FYGqrhRESM4V2Gp7wxDOXsxmSQ+1ujWgn8Po0uimjHd+CrPZLxLIGFuow6Nb?=
 =?us-ascii?Q?iCW//CLQfzr3UUya4ivnqJetysYzSdkMeP7DWhDOMe5eZvxNpC9qzCLADNpv?=
 =?us-ascii?Q?OGPv3DufGRmkZNWF2uv1vrv5uBQCWgkx2IR5ONpOYIkuTslpD6ea0F4JOYhY?=
 =?us-ascii?Q?b1dmdakY6bsFMkwBnxLjxoN517HnirB/hjN5u3yDbO4aQLutpD2SznOEpdlU?=
 =?us-ascii?Q?miPohhTcXDqkjS7B4MuhZTuxdWg33Yxou74G54M/Sy1lXcUIC/Snk/850TpX?=
 =?us-ascii?Q?56njMP3MWGppSoYr9+asBXp2JINodiO/9W+T/OTnASlqXYgSNXYbBsD9iDs+?=
 =?us-ascii?Q?BSP4EuGRHuwWiAL982Li/IpHDz6tuVQNGmEV2SgcEZTLvnkurqKv8zyFtC8O?=
 =?us-ascii?Q?FCSQt+a/ltYFPA+QwFe0LQUils3WXgmxZ1Ca25MU3ClWMLaTNw9l1S54f6cn?=
 =?us-ascii?Q?K/JJ+mTSjCU4azAWYIG91BXjDNFDmn2fmDI6dTHf2Q5w+kb26Jsi9C1Qjk+g?=
 =?us-ascii?Q?Rp8HM+p+AciNciHQG4C2DHqPx/TIHro/lH0wXlDWAEFJFkamx+vRJq4YPVLa?=
 =?us-ascii?Q?Zs7fKdVvLl215UmMXO/buO7HIn2HUxhWyibWRkPC9f1MVST0b6f8ZGWNCeFS?=
 =?us-ascii?Q?NPodg9b4liubOwUqvNrX8KQZ2vavGe88g2ftWH913rbyA3tdaofkdHzw3RDu?=
 =?us-ascii?Q?7h2OE3aHgWb+3odN/58oUQBODVjDiFW+brPH/GgpRFCOu9ujS9xDCmQptsGL?=
 =?us-ascii?Q?OJgP96HGB0OOO5+RixScizONDrJWTrzaOmb07Va9baM=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72220122-847d-4703-d5e9-08d8b7e216d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 16:41:34.5842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zbOW6MQMKUgivrzkx+cFb1hf8Qe8aV4j6w2B/ytrEGZ0uPqTPfZnxd/sjgPIUsvXGr3Rn5FX1DYPT72x/rvGL+ms1k3hEGBZn9leAMJ0LeqZTuisADX6wRuxDZSfkfuI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4441
Return-Path: khairul.rohaizzat.jamaluddin@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this. Wrongly sent.

Thank you & Kind regards,
Khairul

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Jamaluddin, Khairul Rohaizzat
Sent: Thursday, January 14, 2021 12:40 AM
To: openembedded-core@lists.openembedded.org
Cc: Jamaluddin, Khairul Rohaizzat <khairul.rohaizzat.jamaluddin@intel.com>
Subject: [OE-core] [PATCH][gatesgarth] ffmpeg: Fix CVE-2020-35964, CVE-2020=
-35965

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

Backport the CVE patches from upstream:
https://github.com/FFmpeg/FFmpeg/commit/27a99e2c7d450fef15594671eef4465c8a1=
66bd7
https://github.com/FFmpeg/FFmpeg/commit/3e5959b3457f7f1856d997261e6ac672bba=
49e8b

CVE:
CVE-2020-35964
CVE-2020-35965

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@i=
ntel.com>
---
 .../ffmpeg/ffmpeg/CVE-2020-35964.patch             | 68 ++++++++++++++++++=
++++
 .../ffmpeg/ffmpeg/CVE-2020-35965.patch             | 28 +++++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb     |  2 +
 3 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.pa=
tch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.pa=
tch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch b/m=
eta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch
new file mode 100644
index 0000000..eaee3a9
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch
@@ -0,0 +1,68 @@
+From 27a99e2c7d450fef15594671eef4465c8a166bd7 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Wed, 28 Oct 2020 20:11:54 +0100
+Subject: [PATCH] avformat/vividas: improve extradata packing checks in
+ track_header()
+
+Fixes: out of array accesses
+Fixes:=20
+26622/clusterfuzz-testcase-minimized-ffmpeg_dem_VIVIDAS_fuzzer-65812003
+38288640
+
+Found-by: continuous fuzzing process=20
+https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+---
+ libavformat/vividas.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/libavformat/vividas.c b/libavformat/vividas.c index=20
+83d0ed116787..46c66bf9a0ae 100644
+--- a/libavformat/vividas.c
++++ b/libavformat/vividas.c
+@@ -28,6 +28,7 @@
+  * @sa http://wiki.multimedia.cx/index.php?title=3DVividas_VIV
+  */
+=20
++#include "libavutil/avassert.h"
+ #include "libavutil/intreadwrite.h"
+ #include "avio_internal.h"
+ #include "avformat.h"
+@@ -379,7 +380,7 @@ static int track_header(VividasDemuxContext *viv,=20
+AVFormatContext *s,  uint8_t *
+=20
+         if (avio_tell(pb) < off) {
+             int num_data;
+-            int xd_size =3D 0;
++            int xd_size =3D 1;
+             int data_len[256];
+             int offset =3D 1;
+             uint8_t *p;
+@@ -393,10 +394,10 @@ static int track_header(VividasDemuxContext *viv, AV=
FormatContext *s,  uint8_t *
+                     return AVERROR_INVALIDDATA;
+                 }
+                 data_len[j] =3D len;
+-                xd_size +=3D len;
++                xd_size +=3D len + 1 + len/255;
+             }
+=20
+-            ret =3D ff_alloc_extradata(st->codecpar, 64 + xd_size + xd_si=
ze / 255);
++            ret =3D ff_alloc_extradata(st->codecpar, xd_size);
+             if (ret < 0)
+                 return ret;
+=20
+@@ -405,9 +406,7 @@ static int track_header(VividasDemuxContext *viv,=20
+AVFormatContext *s,  uint8_t *
+=20
+             for (j =3D 0; j < num_data - 1; j++) {
+                 unsigned delta =3D av_xiphlacing(&p[offset], data_len[j])=
;
+-                if (delta > data_len[j]) {
+-                    return AVERROR_INVALIDDATA;
+-                }
++                av_assert0(delta <=3D xd_size - offset);
+                 offset +=3D delta;
+             }
+=20
+@@ -418,6 +417,7 @@ static int track_header(VividasDemuxContext *viv, AVFo=
rmatContext *s,  uint8_t *
+                     av_freep(&st->codecpar->extradata);
+                     break;
+                 }
++                av_assert0(data_len[j] <=3D xd_size - offset);
+                 offset +=3D data_len[j];
+             }
+=20
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch b/m=
eta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch
new file mode 100644
index 0000000..b3ecc45b
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch
@@ -0,0 +1,28 @@
+From 3e5959b3457f7f1856d997261e6ac672bba49e8b Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 24 Oct 2020 22:21:48 +0200
+Subject: [PATCH] avcodec/exr: Check ymin vs. h
+
+Fixes: out of array access
+Fixes:=20
+26532/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_EXR_fuzzer-5613
+925708857344
+Fixes:=20
+27443/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_EXR_fuzzer-5631
+239813595136
+
+Found-by: continuous fuzzing process=20
+https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+---
+ libavcodec/exr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/exr.c b/libavcodec/exr.c index=20
+e907c5c46401..8b701d1cd298 100644
+--- a/libavcodec/exr.c
++++ b/libavcodec/exr.c
+@@ -1830,7 +1830,7 @@ static int decode_frame(AVCodecContext *avctx, void =
*data,
+     // Zero out the start if ymin is not 0
+     for (i =3D 0; i < planes; i++) {
+         ptr =3D picture->data[i];
+-        for (y =3D 0; y < s->ymin; y++) {
++        for (y =3D 0; y < FFMIN(s->ymin, s->h); y++) {
+             memset(ptr, 0, out_line_size);
+             ptr +=3D picture->linesize[i];
+         }
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_4.3.1.bb
index 37647e8..f902b08 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
@@ -26,6 +26,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee4d=
69f5fce4486a80fdaf4a4263 \  SRC_URI =3D "https://www.ffmpeg.org/releases/${=
BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://0001-libavutil-include-assembly-with-full-path-from-sour=
c.patch \
+           file://CVE-2020-35964.patch \
+           file://CVE-2020-35965.patch \
            "
 SRC_URI[sha256sum] =3D "ad009240d46e307b4e03a213a0f49c11b650e445b1f8be0dda=
2a9212b34d2ffb"
=20
--
2.7.4

