Return-Path: <chee.yang.lee@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B01286064E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 11:21:28 +0000 (UTC)
IronPort-SDR: dWXU7uTfz7jHA2pwbUTk9oOKN9K7Vbbw61xfc2g1iIOEx6joV0I8DWcPa1QRaZMeYXPdUnNURu
	V2lvPIyUvLVw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	20 Mar 2020 04:21:29 -0700
IronPort-SDR: jRPsYcYA7JYH++qwf82+OhMKYClHkE4MT9TPcHQkRkk8uJ5p0F5k3aInT/lW/HnXS/0gZqQYI7
	h623sqRXWTcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,284,1580803200"; d="scan'208";a="237206903"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
	by fmsmga007.fm.intel.com with ESMTP; 20 Mar 2020 04:21:29 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
	fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Fri, 20 Mar 2020 04:21:29 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
	FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Fri, 20 Mar 2020 04:21:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
	edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Fri, 20 Mar 2020 04:21:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=K9novZYAXOvt7Ahee+C2DB96yfJVofD2MqYRLbR4TNn/8KxOEEDZQYZyqMHxjoSI3DOw3ws7VvhDAnHlCWjGYiw0yDQQDUwJkF50a+9/6KRvVfJY2GIqRw60YHimU/TdvqgNKpEzxXLMs8LcJk+UV3bc0FrOHypifgskZYW1sKZFYCA8LOO4d4LDtjx0zDZlvRAn0DzIjdgW76p6OZGZCa5ncsZZAm1diPlJRrWHBjQKCNxjQLWcvGZrrLH27MKZjf5xQptPj9TWZKTBWy8kdfDdRLTa3lUhIpMKeHaEwhMExRMLGVEHJOAWgjY3+RdnEqVGb2NzzPzf3R6hSk1ldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KwxqdcDkdzeI0CZh6r/QIkZcESd2e8x+pX1gH/FtadQ=;
	b=hDUebntpguMR7vP3IuoMawcsr1t8t4VKoXgVJRd/qh++CHX5Q0GvUIbXzgmdWGAtWjrVFqgqjVgSAncPdVltriPa7s5nf8LJFtTJau2YVKTQ6x9KqijEPy7ebBUphJVTcP7FKDnPmLVfiGU8Fh5hCauSZQag3RN5nsyF9aKwKeTV0lNDkvHUmo4qLjjpep8TkTG5ZWZIgvJovOsQPf5jgRVAl2uSgGO3SMdAfby28QlIAxepyDB2OelLlfvxjoHWpGErgiw2u+k1nUO9TI+kmhYN1sg6PjBxm0j2RsPlxw98tr0c6Mp0a8bnVOq+Hk04C2CCLgurrKBn/W5VQF6nvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com; 
	dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector2-intel-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KwxqdcDkdzeI0CZh6r/QIkZcESd2e8x+pX1gH/FtadQ=;
	b=PSbeUkTVIRVbHPHmoNSezqOFDSnY7Ph91lL7UunM1TXOrVh9H99pOfCaJGtNf52CoGVf8dhVbNXtILd3V/NlMdNaQtkqLSuZJ3KyrcEfAjCKcShw7rf4LuE8TKWMLbC6YFK61y2lwKykTJQIXDZZ0zv4fzyj3q9WA04efAyhHDQ=
Received: from BL0PR11MB3521.namprd11.prod.outlook.com (2603:10b6:208:7b::32)
	by BL0PR11MB3524.namprd11.prod.outlook.com (2603:10b6:208:73::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22;
	Fri, 20 Mar 2020 11:21:27 +0000
Received: from BL0PR11MB3521.namprd11.prod.outlook.com
	([fe80::8878:3402:9c41:fe6d]) by
	BL0PR11MB3521.namprd11.prod.outlook.com
	([fe80::8878:3402:9c41:fe6d%5]) with mapi id 15.20.2793.023;
	Fri, 20 Mar 2020 11:21:27 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH][zeus] virglrenderer : fix CVE-2019-18388
Thread-Index: AQHV/o6pbBtVoHENHkiBXXU5Vj+cJahRK91w
Date: Fri, 20 Mar 2020 11:21:27 +0000
Message-ID: <BL0PR11MB35216FE4731CA221676EAC2AB9F50@BL0PR11MB3521.namprd11.prod.outlook.com>
References: <1584691602-12741-1-git-send-email-chee.yang.lee@intel.com>
In-Reply-To: <1584691602-12741-1-git-send-email-chee.yang.lee@intel.com>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chee.yang.lee@intel.com; 
x-originating-ip: [192.198.147.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a1e5611-7ce9-4d5a-2633-08d7ccc0d51a
x-ms-traffictypediagnostic: BL0PR11MB3524:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR11MB3524B4D286C3756B7ECD5997B9F50@BL0PR11MB3524.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 03484C0ABF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(136003)(366004)(376002)(346002)(199004)(478600001)(966005)(66946007)(66476007)(76116006)(8936002)(66556008)(81156014)(8676002)(81166006)(33656002)(64756008)(66446008)(5660300002)(26005)(110136005)(186003)(71200400001)(55016002)(86362001)(316002)(52536014)(2906002)(6506007)(9686003)(7696005)(53546011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR11MB3524;
	H:BL0PR11MB3521.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GirviNBBNEzwBfBUX45GGGQOKDERZ2dETnZaGK9SyNLs8OfsqE6u0NkdfofeCNm2ZqTAShFUEK9JAbtEMjCqj39OJxV2cN+O0SFhW5emkgREq02G1wj6dU0Zkj29J7ZSz8D0aRJBfj6H4Ls1bWQbwLxrtTCm3cYO3EkF6UNe2IsVqOoJ14w9EyJVDkCMJ7UadN/S1o/f7RUrfRpnxQJevwucZ726eCyDQi/HTVVcG5NrR+iiRQJNiovzwpiNKvZIZ05ZiAZ1K+CkJkMPn/Z6Gye10KwdT99KGvs4b6WboMzmaVXDGt3lKxACmqahCp9TKDbHHTYNXHcamZ/rsyokeVWyovHVwp+yw5aKdGygQWYRcZNIeyJlf9UZ5hiYHVkA5wBCjyhSM8VUTcYfriDaNvGBpf5iLQktIWY417X/mwr5K+a3y993G/zG7xXafKxYrMq5oBE8jPUxwv2ymjFSSwsTR34ji0Q7DYOnP81hfJQawRKgBjoJDMjCRNSCnurb38C0Zmu+fQYxEkGYFU/rhQ==
x-ms-exchange-antispam-messagedata: t3zro9941+o9c7EN8yeCdq8N67aB2DR51O2WK1Lqu88cKPTeRWgQRC7BQEge6vihD7tzO25PDF2WUrtWx6u2WPWW24WFDG3sc7SPz/GLvxZIqOvPi9btNXwhMJoWhfxPnUjmJCesPSe5VFfgJ99a3A==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1e5611-7ce9-4d5a-2633-08d7ccc0d51a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2020 11:21:27.5813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6kbxsO4eOnmrvNvJuFDIA9xBKy+X93rCgnzhNJ0wO2oozuT/u7s49YoKdZTMavUjMj8BgoeAsS9bohEqDZHIuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3524
X-OriginatorOrg: intel.com
Subject: Re: [PATCH][zeus] virglrenderer : fix CVE-2019-18388
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
X-List-Received-Date: Fri, 20 Mar 2020 11:21:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch, it is causing compilation error.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> On Behalf Of chee.yang.lee@intel.com
Sent: Friday, March 20, 2020 4:07 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH][zeus] virglrenderer : fix CVE-2019-18388

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../virglrenderer/CVE-2019-18388.patch             | 141 +++++++++++++++++=
++++
 .../virglrenderer/virglrenderer_0.8.0.bb           |   3 +-
 2 files changed, 143 insertions(+), 1 deletion(-)  create mode 100644 meta=
/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18388.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-183=
88.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18388=
.patch
new file mode 100644
index 0000000..43563e4
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18388.p
+++ atch
@@ -0,0 +1,141 @@
+From 0d9a2c88dc3a70023541b3260b9f00c982abda16 Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Thu, 10 Oct 2019 09:42:25 +0200
+Subject: [PATCH] vrend: Check resource creation more thoroughly
+
+While we are at it:
+  - free memory if texture allocation fails
+
+Closes #144
+Closes #145
+Closes #146
+
+v2: Move the error string creation to extra patch (Emil)
+v3: Fix whitespace errors (Emil) and one logic error
+
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+
+Upstream-Status: Backport=20
+[https://gitlab.freedesktop.org/virgl/virglrenderer/commit/0d9a2c88dc3a
+70023541b3260b9f00c982abda16]
+CVE: CVE-2019-18388
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+---
+ src/vrend_renderer.c | 58 ++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 56 insertions(+), 2 deletions(-)
+
+diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c index=20
+0c6b5efd..1fb657b7 100644
+--- a/src/vrend_renderer.c
++++ b/src/vrend_renderer.c
+@@ -6044,6 +6044,8 @@ static int check_resource_valid(struct=20
+vrend_renderer_resource_create_args *args
+=20
+    if (args->format >=3D VIRGL_FORMAT_MAX)
+       return -1;
++   bool format_can_texture_storage =3D has_feature(feat_texture_storage) =
&&
++         (tex_conv_table[args->format].flags &=20
++ VIRGL_TEXTURE_CAN_TEXTURE_STORAGE);
+=20
+    /* only texture 2d and 2d array can have multiple samples */
+    if (args->nr_samples > 0) {
+@@ -6061,15 +6063,18 @@ static int check_resource_valid(struct vrend_rende=
rer_resource_create_args *args
+       /* buffer and rect textures can't have mipmaps */
+       if (args->target =3D=3D PIPE_BUFFER || args->target =3D=3D PIPE_TEX=
TURE_RECT)
+          return -1;
++
+       if (args->last_level > (floor(log2(MAX2(args->width, args->height))=
) + 1))
+          return -1;
+    }
++
+    if (args->flags !=3D 0 && args->flags !=3D VIRGL_RESOURCE_Y_0_TOP)
+       return -1;
+=20
+-   if (args->flags & VIRGL_RESOURCE_Y_0_TOP)
++   if (args->flags & VIRGL_RESOURCE_Y_0_TOP) {
+       if (args->target !=3D PIPE_TEXTURE_2D && args->target !=3D PIPE_TEX=
TURE_RECT)
+          return -1;
++   }
+=20
+    /* array size for array textures only */
+    if (args->target =3D=3D PIPE_TEXTURE_CUBE) { @@ -6088,6 +6093,9 @@=20
+static int check_resource_valid(struct vrend_renderer_resource_create_args=
 *args
+       if (!has_feature(feat_texture_array))
+          return -1;
+    }
++   if (format_can_texture_storage && !args->width) {
++      return -1;
++   }
+=20
+    if (args->bind =3D=3D 0 ||
+        args->bind =3D=3D VIRGL_BIND_CUSTOM || @@ -6124,11 +6132,55 @@=20
+static int check_resource_valid(struct vrend_renderer_resource_create_args=
 *args
+           args->target =3D=3D PIPE_TEXTURE_CUBE_ARRAY) {
+          if (args->depth !=3D 1)
+             return -1;
++         if (format_can_texture_storage && !args->height) {
++            return -1;
++         }
+       }
+       if (args->target =3D=3D PIPE_TEXTURE_1D ||
+           args->target =3D=3D PIPE_TEXTURE_1D_ARRAY) {
+          if (args->height !=3D 1 || args->depth !=3D 1)
+             return -1;
++         if (args->width > vrend_state.max_texture_2d_size) {
++            return -1;
++         }
++      }
++
++      if (args->target =3D=3D PIPE_TEXTURE_2D ||
++          args->target =3D=3D PIPE_TEXTURE_RECT ||
++          args->target =3D=3D PIPE_TEXTURE_2D_ARRAY) {
++         if (args->width > vrend_state.max_texture_2d_size ||
++             args->height > vrend_state.max_texture_2d_size) {
++            return -1;
++         }
++      }
++
++      if (args->target =3D=3D PIPE_TEXTURE_3D) {
++         if (format_can_texture_storage &&
++             (!args->height || !args->depth)) {
++            return -1;
++         }
++         if (args->width > vrend_state.max_texture_3d_size ||
++             args->height > vrend_state.max_texture_3d_size ||
++             args->depth > vrend_state.max_texture_3d_size) {
++            return -1;
++         }
++      }
++      if (args->target =3D=3D PIPE_TEXTURE_2D_ARRAY ||
++          args->target =3D=3D PIPE_TEXTURE_CUBE_ARRAY ||
++          args->target =3D=3D PIPE_TEXTURE_1D_ARRAY) {
++         if (format_can_texture_storage &&
++             !args->array_size) {
++            return -1;
++         }
++      }
++      if (args->target =3D=3D PIPE_TEXTURE_CUBE ||
++          args->target =3D=3D PIPE_TEXTURE_CUBE_ARRAY) {
++         if (args->width !=3D args->height) {
++            return -1;
++         }
++         if (args->width > vrend_state.max_texture_cube_size) {
++            return -1;
++         }
+       }
+    }
+    return 0;
+@@ -6458,8 +6510,10 @@ int vrend_renderer_resource_create(struct vrend_ren=
derer_resource_create_args *a
+       vrend_create_buffer(gr, args->width);
+    } else {
+       int r =3D vrend_renderer_resource_allocate_texture(gr, image_oes);
+-      if (r)
++      if (r) {
++         FREE(gr);
+          return r;
++      }
+    }
+=20
+    ret =3D vrend_resource_insert(gr, args->handle);
+--
+2.24.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb b/m=
eta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
index e91ccc6..0480d90 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
@@ -11,7 +11,8 @@ SRC_URI =3D "git://anongit.freedesktop.org/virglrenderer =
\
            file://CVE-2019-18390.patch \
            file://CVE-2019-18391.patch \
            file://CVE-2020-8002.patch  \
-           "
+           file://CVE-2019-18388.patch \ "
=20
 S =3D "${WORKDIR}/git"
=20
--
2.7.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

