Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76300C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 12:17:56 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.9834.1743164270495939345
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 05:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H57ia+R+;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86d377306ddso868927241.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 05:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743164269; x=1743769069; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0fyH9Ru/vtZiextZuRy2swX/53SAkUxfcncIxXNY4B4=;
        b=H57ia+R+8qnQuU92mZ1M7f0HsaOZidgvidbpTQKmc3EQqpZYLGmcBsDktyFFp/eCr/
         DnEaIofbRQ2QjUlD4Qy9KiPbp/rFq7gQtY3s2o4EF2kadBUYTaNxC4JWzafm2SemRGrt
         76Wm+dOz+rV0lpHtgOg2NxrupPnQqPj78Vha6QUcfbtV7uqGZUsIZ0U4lbg5FSvC+2pB
         hRWN24WY6L79NqhQePFcU6HBTpO5QLB0AWoNMPoaY9uP0gMxCeA2Fda/6ZZ2TAjfuDES
         C5ngo5oBKqRAmNTYd1HW/MPMCGfILhhD6wvHSC8Qf2G8bY+qi/TlPD0oVV1IZwbO1xRU
         dp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743164269; x=1743769069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fyH9Ru/vtZiextZuRy2swX/53SAkUxfcncIxXNY4B4=;
        b=OXudxYfNVml7WiF261+TNW7+X/h8FH65ISXR2dEUgoWUDfmoRYk8IO+OlZL+D7MlZc
         qOaYkpoUgUHZWB/2vyVALwi4S/PaGfHFAIXKrQJzjFSquJnADSh+vO+ZehApenozrHno
         3aiVBdkVwP7JxvZ4gJ2EmN5orwYhZFmb6A1t1Gt3aemLGRlMKu2JW5576W66cD95+2hA
         YJgdy9AcZ0j2kYYJmbc31u8FJRQvGRypLBK/jX3+S5EukmXfEntPNanHE8V6MNmLU4mV
         zsXkUYcWJ75m6ucGuloAoa2qjSU1Pafajcz/Un3BKajskhrIz/0s4wg48LHzOWgmYsBj
         ZLSA==
X-Forwarded-Encrypted: i=1; AJvYcCUqGY3CIbqqjjRvZmDuuep6Kx83CZ/h4efo46DIqgWTEIe1ZA2t52sW8+DO8xKIPvH8Q2+qY8F/8foXooF25KUoMA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz7Q0MRrfCQ91LGTo3r2K2DX630rOU+tKmrr55dfq0Gx+pSV2Qs
	RXjfWz+HqwP/twS7M9L/aOj5CeqjZH//7sIv42FFOtQeeXD7m0S9vvZLC8efuVgi3mF5QA2D7dQ
	70jGmNJuKxZQCLr2q0x+RXZGYWf0=
X-Gm-Gg: ASbGnctULhewLcHMZ9ExYttfvgJZPaJHJnauLgmJovuLdtslrOs547GgxEyI6mvR84b
	KORzdCfBhVVXtHn6urO2kLwjUq35iJAgwYg7/qTdPM05nLad86nYW9T7nDeBLLZGBLHM7+jKrBP
	RcNA1/FbZ62neXfjm36rxqpvgiwVM=
X-Google-Smtp-Source: AGHT+IFuLHWQJqPhvDEk8uBpu8HfQCnLPSKYzQ0Fm8w2uAR/+chieAmeSLKFlSyc8hUvpVEpexESQ3N4sm0AfVpYrJc=
X-Received: by 2002:a05:6102:b06:b0:4c5:505a:c1f5 with SMTP id
 ada2fe7eead31-4c5870b9ea0mr7800482137.24.1743164268031; Fri, 28 Mar 2025
 05:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250326063647.1941-1-leimaohui@fujitsu.com> <20250326063647.1941-6-leimaohui@fujitsu.com>
 <CANPvuRmESxURWti-HzcQAUpJYSOxm-2bBXzrFgoFOeF438mVrQ@mail.gmail.com>
 <TYCPR01MB11055AC78EB8DC1274163AA3FA0A12@TYCPR01MB11055.jpnprd01.prod.outlook.com>
 <CANPvuRk290dzN4QMw0Q5AD0Z9QX-4cJfgdd6zw1gRFugwJgYuA@mail.gmail.com> <TY3PR01MB11056D22F3B5B036D32E6F22EA0A02@TY3PR01MB11056.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11056D22F3B5B036D32E6F22EA0A02@TY3PR01MB11056.jpnprd01.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 28 Mar 2025 12:17:37 +0000
X-Gm-Features: AQ5f1JqG_D4eu_mFaTb6xaLbu0mqxwXI5gfZgPXv0QaQZTo3Ll3twCG3dxE72zA
Message-ID: <CANPvuRk=ckCayDruCPz9Gu4ZDOr-Rx8DYatHGOdr2ooqMoEEkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 6/7] gstreamer1.0-plugins-{ugly,base,good}:
 upgrade 1.24.12 -> 1.26.0
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fb39c20631660ee2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 12:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213833

--000000000000fb39c20631660ee2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maohui Lei (Fujitsu) <leimaohui@fujitsu.com> escreveu (sexta, 28/03/2025
=C3=A0(s) 03:17):

> >I see some changes on the gst-plugins-bad:
>
> >$ git diff --stat origin/1.26 origin/1.24 $(find | grep
> meson_options.txt)
> > meson_options.txt                                  | 49
> +++++++++++++++++--------------------------------
> > subprojects/gst-devtools/meson_options.txt         |  2 --
> > subprojects/gst-editing-services/meson_options.txt |  4 +---
> > subprojects/gst-plugins-bad/meson_options.txt      | 76
> +++++++++++++++----------------------------------------------------------=
---
>
> Oh, thank you for your carefully reminder
>
> gst-plugins-bad has added support for many plugins
>
> Do I need to add them to PACKAGECONFIG and then explicitly disable them
> in EXTRA_OEMESON?
>
Yes, we should add to PACKAGECONFIG those that have dependencies available
in oe-core or some other layer,
the option should be disabled by default if the dependencies are outside of
oe-core.
For the ones that there are no dependencies we must disable them completely
in the EXTRA_OEMESON.
Finally for the deprecations, they must be removed from the component.

This above is not for the bad plugins but for every gstreamer component.

Finally thank you for your help and time spent.

Jose

$ git log --oneline 1.24.12..1.26.0
> subprojects/gst-plugins-bad/meson_options.txt
>
> 9a8f3a65a3 nvcodec: Add support for CUDA kernel precompile
>
> 775a2bd26f codec2json: move option to right section
>
> fd54c57260 analyticsoverlay: move option to right section
>
> a830c58139 nvdswrapper: Add NVIDIA DeepStream wrapper plugin
>
> 8fa4c8f2f0 tensordecoders: Move decoder out of the ONNX plugin
>
> 4c82416798 lcevcencoder: Add new LCEVC Encoder plugin
>
> 636690f2aa lcevcdecoder: Add new LCEVC Decoder plugin
>
> a6f18726c1 svtjpegxs: add SVT JPEG XS encoder
>
> 54a6643986 meson: Fix automagic dependency checks in gstvulkan
>
> 84b3a0950d build: Add missing common options that are yielding in
> subprojects
>
> 0ed9c39835 nvcomp: Add nvCOMP library based GPU lossless compression plug=
in
>
> afb62e98c7 cuda: Enable x86 NVMM support again
>
> d68ac0db57 aja: Update to AJA NTV2 17.0.1
>
> 4888a25bac webview2: Add Microsoft WebView2 based web browser source
>
> 6c80d2f5f8 d3d12: Allow building without WGC support
>
> 13c90b606a d3dshader: Add HLSL shader library
>
> f0761a7358 asio: Drop external SDK header dependency
>
>
>
> >I also recommend doing these major updates separately using one commit
> for each component.
>
> OK, got it
>
>
>
>
>
> Lei
>
> *From:* Jose Quaresma <quaresma.jose@gmail.com>
> *Sent:* Thursday, March 27, 2025 8:08 PM
> *To:* Lei, Maohui/=E9=9B=B7 =E8=8C=82=E6=85=A7 <leimaohui@fujitsu.com>
> *Cc:* Anuj Mittal <anuj.mittal@intel.com>;
> openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH v2 6/7]
> gstreamer1.0-plugins-{ugly,base,good}: upgrade 1.24.12 -> 1.26.0
>
>
>
>
>
> Maohui Lei (Fujitsu) <leimaohui@fujitsu.com> escreveu (quinta, 27/03/2025
> =C3=A0(s) 03:18):
>
> >This is a major bump and is a bit strange that there are no new
> packageconfig knobs and also some other deprecation.
>
> Have you checked the meson opinions changes?
>
>
>
> Yes, I have checked the meson_options.txt changes corresponding to the 10
> recipes upgraded this time.
>
>
>
> Although some meson_options.txt have changed, but I think the meson
> options changes do not affect the upgrade this time
>
>
>
> It=E2=80=99s mainly about glibc
>
> 1.  gobject-cast-checks =C3=A0 glibc-debug
>
> 2.  glib-asserts  =C3=A0 glib_assert   * change type from feature to bool=
ean
>
> 3.  glib-checks  =C3=A0 glib_checks  * change type from feature to boolea=
n
>
> However, there is no glib related packageconfig options in our gstreamer
> related recipes,
>
> I mean we haven't meson built these options, so their changes have no
> effect on us
>
>
>
> And I also checked all do_configure logs, no option =E2=80=9Cdeprecated=
=E2=80=9D related
> logs
>
>
>
> Please let me know if further confirmations are needed
>
>
>
> I see some changes on the gst-plugins-bad:
>
> $ git diff --stat origin/1.26 origin/1.24 $(find | grep meson_options.txt=
)
>  meson_options.txt                                  | 49
> +++++++++++++++++--------------------------------
>  subprojects/gst-devtools/meson_options.txt         |  2 --
>  subprojects/gst-editing-services/meson_options.txt |  4 +---
>  subprojects/gst-plugins-bad/meson_options.txt      | 76
> +++++++++++++++----------------------------------------------------------=
---
>  subprojects/gst-plugins-base/meson_options.txt     | 24
> ++++++------------------
>  subprojects/gst-plugins-good/meson_options.txt     | 24
> ++++++------------------
>  subprojects/gst-plugins-ugly/meson_options.txt     | 24
> ++++++------------------
>  subprojects/gst-python/meson_options.txt           |  4 +---
>  subprojects/gst-rtsp-server/meson_options.txt      | 24
> ++++++------------------
>  subprojects/gstreamer/meson_options.txt            | 24
> ++++++------------------
>
> I also recommend doing these major updates separately using one commit fo=
r
> each component.
>
> Jose
>
>
>
>
> userland@pumpkin3:/mnt/test/build_auh/workspace/attic/sources/gstreamer1.=
0.20250326023639$
> git diff devtool-base devtool-base-1.26.0 meson_options.txt
>
> diff --git a/meson_options.txt b/meson_options.txt
>
> index 340fb58..39255cf 100644
>
> --- a/meson_options.txt
>
> +++ b/meson_options.txt
>
> @@ -33,12 +33,6 @@ option('benchmarks', type : 'feature', value : 'auto',
> yield : true)
>
> option('tools', type : 'feature', value : 'auto', yield : true)
>
> option('introspection', type : 'feature', value : 'auto', yield : true,
> description : 'Generate gobject-introspection bindings')
>
> option('nls', type : 'feature', value : 'auto', yield: true, description =
:
> 'Enable native language support (translations)')
>
> -option('gobject-cast-checks', type : 'feature', value : 'auto', yield :
> true,
>
> -       description: 'Enable run-time GObject cast checks (auto =3D enabl=
ed
> for development, disabled for stable releases)')
>
> -option('glib-asserts', type : 'feature', value : 'enabled', yield : true=
,
>
> -       description: 'Enable GLib assertion (auto =3D enabled for
> development, disabled for stable releases)')
>
> -option('glib-checks', type : 'feature', value : 'enabled', yield : true,
>
> -       description: 'Enable GLib checks such as API guards (auto =3D
> enabled for development, disabled for stable releases)')
>
> option('extra-checks', type : 'feature', value : 'enabled', yield : true,
> description : 'Enable extra runtime checks')
>
>
>
> # Common options
>
> @@ -48,3 +42,21 @@ option('package-origin', type : 'string', value :
> 'Unknown package origin', yiel
>
>         description : 'package origin URL to use in plugins')
>
> option('doc', type : 'feature', value : 'auto', yield: true,
>
>         description: 'Enable documentation.')
>
> +option('glib_debug', type : 'feature', value : 'auto', yield : true,
> description : 'Enable GLib debug infrastructure (see docs/macros.txt)')
>
> +option('glib_assert', type : 'boolean', value : true, yield : true,
> description : 'Enable GLib assertion (see docs/macros.txt)',
>
> +  deprecated: {'enabled' : 'true', 'disabled' : 'false', 'auto' :
> 'false'},
>
> +)
>
> +option('glib_checks', type : 'boolean', value : true, yield : true,
> description : 'Enable GLib checks such as API guards (see docs/macros.txt=
)',
>
> +  deprecated: {'enabled' : 'true', 'disabled' : 'false', 'auto' :
> 'false'},
>
> +)
>
> +
>
> +# Deprecated, kept for backward compat
>
> +option('gobject-cast-checks', type : 'feature', value : 'auto', yield :
> true,
>
> +       description: 'Enable run-time GObject cast checks (auto =3D enabl=
ed
> for development, disabled for stable releases)',
>
> +       deprecated: 'glib_debug')
>
> +option('glib-asserts', type : 'feature', value : 'enabled', yield : true=
,
>
> +       description: 'Enable GLib assertion (auto =3D enabled for
> development, disabled for stable releases)',
>
> +       deprecated: 'glib_assert')
>
> +option('glib-checks', type : 'feature', value : 'enabled', yield : true,
>
> +       description: 'Enable GLib checks such as API guards (auto =3D
> enabled for development, disabled for stable releases)',
>
> +       deprecated: 'glib_checks')
>
>
>
> *From:* Jose Quaresma <quaresma.jose@gmail.com>
> *Sent:* Wednesday, March 26, 2025 7:36 PM
> *To:* Lei, Maohui/=E9=9B=B7 =E8=8C=82=E6=85=A7 <leimaohui@fujitsu.com>
> *Cc:* Anuj Mittal <anuj.mittal@intel.com>;
> openembedded-core@lists.openembedded.org; Lei Maohui <
> leihaohui@fujitsu.com>
> *Subject:* Re: [OE-core] [PATCH v2 6/7]
> gstreamer1.0-plugins-{ugly,base,good}: upgrade 1.24.12 -> 1.26.0
>
>
>
> Hi Lei,
>
> This is a major bump and is a bit strange that there are no new
> packageconfig knobs and also some other deprecation.
>
> Have you checked the meson opinions changes?
>
>
>
> Jose
>
> leimaohui via lists.openembedded.org <leimaohui=3D
> fujitsu.com@lists.openembedded.org> escreveu (quarta, 26/03/2025 =C3=A0(s=
)
> 06:37):
>
> From: Lei Maohui <leihaohui@fujitsu.com>
>
> Signed-off-by: Lei Maohui <leihaohui@fujitsu.com>
> ---
>  ...1-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 4 ++--
>  .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch        | 2 +-
>  .../0003-viv-fb-Make-sure-config.h-is-included.patch          | 2 +-
>  ...ns-base_1.24.12.bb =3D> gstreamer1.0-plugins-base_1.26.0.bb} | 2 +-
>  ...ns-good_1.24.12.bb =3D> gstreamer1.0-plugins-good_1.26.0.bb} | 2 +-
>  ...ns-ugly_1.24.12.bb =3D> gstreamer1.0-plugins-ugly_1.26.0.bb} | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-base_1.24.12.bb =3D>
> gstreamer1.0-plugins-base_1.26.0.bb} (98%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-good_1.24.12.bb =3D>
> gstreamer1.0-plugins-good_1.26.0.bb} (97%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-ugly_1.24.12.bb =3D>
> gstreamer1.0-plugins-ugly_1.26.0.bb} (94%)
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00=
312515-get-caps-from-src-pad-when-query-caps.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00=
312515-get-caps-from-src-pad-when-query-caps.patch
> index e35ec026e4..7373bd3e26 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00=
312515-get-caps-from-src-pad-when-query-caps.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00=
312515-get-caps-from-src-pad-when-query-caps.patch
> @@ -1,4 +1,4 @@
> -From e0478a9b3bb1b49c34aaf076152ed8e49cf909e0 Mon Sep 17 00:00:00 2001
> +From bd1436f0027bb09cdcf90386910a497422d9a871 Mon Sep 17 00:00:00 2001
>  From: zhouming <b42586@freescale.com>
>  Date: Wed, 14 May 2014 10:16:20 +0800
>  Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
> @@ -16,7 +16,7 @@ Signed-off-by: zhouming <b42586@freescale.com>
>  diff --git a/gst-libs/gst/tag/gsttagdemux.c
> b/gst-libs/gst/tag/gsttagdemux.c
>  old mode 100644
>  new mode 100755
> -index ef0ff90..53f05c8
> +index 975fe83..df82840
>  --- a/gst-libs/gst/tag/gsttagdemux.c
>  +++ b/gst-libs/gst/tag/gsttagdemux.c
>  @@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject =
*
> parent, GstQuery * query)
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> index 810a4ba676..fc9ad474d9 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> @@ -1,4 +1,4 @@
> -From 1b9887421de593854632571327b4918b880900c6 Mon Sep 17 00:00:00 2001
> +From 1cc876662b7707eb5a2f668654f7921b5642e108 Mon Sep 17 00:00:00 2001
>  From: Mingke Wang <mingke.wang@freescale.com>
>  Date: Thu, 19 Mar 2015 14:17:10 +0800
>  Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb=
-Make-sure-config.h-is-included.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb=
-Make-sure-config.h-is-included.patch
> index 8fa46d809a..06b5bc41ed 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb=
-Make-sure-config.h-is-included.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb=
-Make-sure-config.h-is-included.patch
> @@ -1,4 +1,4 @@
> -From 22a0e3a5288486991a15c48fdcb730eaa6dc08e5 Mon Sep 17 00:00:00 2001
> +From c0c6944eca0c497477aa9f2cec2c83c4ea7a70e5 Mon Sep 17 00:00:00 2001
>  From: Carlos Rafael Giani <crg7475@mailbox.org>
>  Date: Tue, 21 May 2019 14:01:11 +0200
>  Subject: [PATCH] viv-fb: Make sure config.h is included
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.24.12.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.26.0.bb
> similarity index 98%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.24.12.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.26.0.bb
> index f4505d831e..bd0131c647 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.24.12.bb
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.26.0.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
>             file://0003-viv-fb-Make-sure-config.h-is-included.patch \
>             file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "f6efbaa8fea8d00bc380bccca76a530527b1f083e8523eafb3e9b1e18bc653d3"
> +SRC_URI[sha256sum] =3D
> "e23189fbed2ec486690382d1055c19eeaf5aae3e95e2576fc4c884d96a90e69e"
>
>  S =3D "${WORKDIR}/gst-plugins-base-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.24.12.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.26.0.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.24.12.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.26.0.bb
> index 9cc2d462f6..a2c6426c34 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.24.12.bb
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.26.0.bb
> @@ -6,7 +6,7 @@ BUGTRACKER =3D "
> https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
>
>  SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-$=
{PV}.tar.xz
> "
>
> -SRC_URI[sha256sum] =3D
> "d0e66e2f935d1575f6adbef7d0a2b3faba7360344383c51bf0233b39e0489a64"
> +SRC_URI[sha256sum] =3D
> "9e18f139ef69ad0867c2dfbb8fe1d1736d76df11aac83f60e8d3adb1e2eaf03b"
>
>  S =3D "${WORKDIR}/gst-plugins-good-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.24.12.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.26.0.bb
> similarity index 94%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.24.12.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.26.0.bb
> index 75f528216f..f0e42ad8fb 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.24.12.bb
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.26.0.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D " \
>
> https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-$=
{PV}.tar.xz
> \
>              "
>
> -SRC_URI[sha256sum] =3D
> "19ed6eef4ea1a742234fb35e2cdb107168595a4dd409a9fac0b7a16543eee78b"
> +SRC_URI[sha256sum] =3D
> "a86b51c8454a813120848c803421f327d8c07aabcae461e0597cc49398c0fcde"
>
>  S =3D "${WORKDIR}/gst-plugins-ugly-${PV}"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213636):
> https://lists.openembedded.org/g/openembedded-core/message/213636
> Mute This Topic: https://lists.openembedded.org/mt/111912609/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
>
> --
>
> Best regards,
>
>
> Jos=C3=A9 Quaresma
>
>
>
>
> --
>
> Best regards,
>
>
> Jos=C3=A9 Quaresma
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000fb39c20631660ee2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Maohui Lei (Fuj=
itsu) &lt;<a href=3D"mailto:leimaohui@fujitsu.com">leimaohui@fujitsu.com</a=
>&gt; escreveu (sexta, 28/03/2025 =C3=A0(s) 03:17):<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div class=3D"msg-1320808302577018773">





<div lang=3D"ZH-CN" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-1320808302577018773WordSection1">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">&g=
t;I see some changes on the gst-plugins-bad:<br>
<br>
&gt;$ git diff --stat origin/1.26 origin/1.24 $(find | grep meson_options.t=
xt) <br>
&gt;=C2=A0meson_options.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
49 +++++++++++++++++--------------------------------<br>
&gt;=C2=A0subprojects/gst-devtools/meson_options.txt =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A02 --<br>
&gt;=C2=A0subprojects/gst-editing-services/meson_options.txt | =C2=A04 +---=
<br>
&gt;=C2=A0subprojects/gst-plugins-bad/meson_options.txt =C2=A0 =C2=A0 =C2=
=A0| 76 +++++++++++++++----------------------------------------------------=
---------<br>
<br>
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">Oh=
, thank you for your carefully reminder<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">gs=
t-plugins-bad has added support for many plugins<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">Do=
 I need to add them to=C2=A0PACKAGECONFIG and then explicitly disable them =
in=C2=A0EXTRA_OEMESON?</span></p></div></div></div></blockquote><div>Yes, w=
e should add to PACKAGECONFIG=C2=A0those that have dependencies available i=
n oe-core or some other layer,</div><div>the option should be disabled by d=
efault=C2=A0if the dependencies are outside=C2=A0of oe-core.</div><div>For =
the ones=C2=A0that there are no dependencies we must disable them completel=
y in the EXTRA_OEMESON.<br>Finally for the deprecations, they must be remov=
ed from the component.</div><div><br>This above is not for the bad plugins =
but for every gstreamer component.<br><br>Finally thank you for your help a=
nd time spent.<br><br>Jose</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div class=3D"msg-1320808302577018773"><div lang=3D"Z=
H-CN" style=3D"overflow-wrap: break-word;"><div class=3D"m_-132080830257701=
8773WordSection1"><p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span=
 lang=3D"EN-US">$ git log --oneline 1.24.12..1.26.0 subprojects/gst-plugins=
-bad/meson_options.txt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">9a8f3a65a3 nvcodec: Add support for CUDA kernel pr=
ecompile<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">775a2bd26f codec2json: move option to right sectio=
n<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">fd54c57260 analyticsoverlay: move option to right =
section<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">a830c58139 nvdswrapper: Add NVIDIA DeepStream wrap=
per plugin<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">8fa4c8f2f0 tensordecoders: Move decoder out of the=
 ONNX plugin<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">4c82416798 lcevcencoder: Add new LCEVC Encoder plu=
gin<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">636690f2aa lcevcdecoder: Add new LCEVC Decoder plu=
gin<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">a6f18726c1 svtjpegxs: add SVT JPEG XS encoder<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">54a6643986 meson: Fix automagic dependency checks =
in gstvulkan<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">84b3a0950d build: Add missing common options that =
are yielding in subprojects<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">0ed9c39835 nvcomp: Add nvCOMP library based GPU lo=
ssless compression plugin<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">afb62e98c7 cuda: Enable x86 NVMM support again<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">d68ac0db57 aja: Update to AJA NTV2 17.0.1<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">4888a25bac webview2: Add Microsoft WebView2 based =
web browser source<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">6c80d2f5f8 d3d12: Allow building without WGC suppo=
rt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">13c90b606a d3dshader: Add HLSL shader library<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">f0761a7358 asio: Drop external SDK header dependen=
cy<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;I also recommend=C2=A0doing=
 these major updates=C2=A0separately using one=C2=A0commit for each compone=
nt.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">OK, got it<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">Lei<u></u><u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Jose Quaresma &lt;<a href=3D=
"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com<=
/a>&gt;
<br>
<b>Sent:</b> Thursday, March 27, 2025 8:08 PM<br>
<b>To:</b> Lei, Maohui/</span><span style=3D"font-size:11pt">=E9=9B=B7</spa=
n><span style=3D"font-size:11pt;font-family:Calibri,sans-serif">
</span><span style=3D"font-size:11pt">=E8=8C=82=E6=85=A7</span><span lang=
=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans-serif"> &lt;<a =
href=3D"mailto:leimaohui@fujitsu.com" target=3D"_blank">leimaohui@fujitsu.c=
om</a>&gt;<br>
<b>Cc:</b> Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=
=3D"_blank">anuj.mittal@intel.com</a>&gt;; <a href=3D"mailto:openembedded-c=
ore@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.opene=
mbedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH v2 6/7] gstreamer1.0-plugins-{ugly,bas=
e,good}: upgrade 1.24.12 -&gt; 1.26.0<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Maohui Lei (Fujitsu) &lt;<a hre=
f=3D"mailto:leimaohui@fujitsu.com" target=3D"_blank">leimaohui@fujitsu.com<=
/a>&gt; escreveu (quinta, 27/03/2025 =C3=A0(s) 03:18):<u></u><u></u></span>=
</p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;This is a major bump and is=
 a bit strange=C2=A0that there are no new packageconfig knobs and also some=
 other deprecation.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Have you checked=C2=A0the meson=
 opinions changes?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">Yes, I have checked the meson_options.txt changes =
corresponding to the 10 recipes upgraded this time.</span><span lang=3D"EN-=
US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">Although some meson_options.txt have changed, but =
I think the meson options changes do not affect the upgrade this time</span=
><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">It</span><span style=3D"font-size:11pt;font-family=
:=E7=AD=89=E7=BA=BF">=E2=80=99<span lang=3D"EN-US">s mainly about glibc</sp=
an></span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"m_-1320808302577018773m-4190508588908468095msolistparagraph" st=
yle=3D"margin-left:42pt">
<u></u><span lang=3D"EN-US"><span>1.<span style=3D"font:7pt &quot;Times New=
 Roman&quot;">=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-size:11pt;fo=
nt-family:=E7=AD=89=E7=BA=BF">gobject-cast-checks
</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Wingdings">=
=C3=A0</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=
=AD=89=E7=BA=BF"> glibc-debug</span><span lang=3D"EN-US"><u></u><u></u></sp=
an></p>
<p class=3D"m_-1320808302577018773m-4190508588908468095msolistparagraph" st=
yle=3D"margin-left:42pt">
<u></u><span lang=3D"EN-US"><span>2.<span style=3D"font:7pt &quot;Times New=
 Roman&quot;">=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-size:11pt;fo=
nt-family:=E7=AD=89=E7=BA=BF">glib-asserts =C2=A0</span><span lang=3D"EN-US=
" style=3D"font-size:11pt;font-family:Wingdings">=C3=A0</span><span lang=3D=
"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF"> glib_asser=
t=C2=A0=C2=A0
 * change type from feature to boolean</span><span lang=3D"EN-US"><u></u><u=
></u></span></p>
<p class=3D"m_-1320808302577018773m-4190508588908468095msolistparagraph" st=
yle=3D"margin-left:42pt">
<u></u><span lang=3D"EN-US"><span>3.<span style=3D"font:7pt &quot;Times New=
 Roman&quot;">=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-size:11pt;fo=
nt-family:=E7=AD=89=E7=BA=BF">glib-checks =C2=A0</span><span lang=3D"EN-US"=
 style=3D"font-size:11pt;font-family:Wingdings">=C3=A0</span><span lang=3D"=
EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF"> glib_checks=
=C2=A0
 * change type from feature to boolean</span><span lang=3D"EN-US"><u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">However, there is no glib related packageconfig op=
tions in our gstreamer related recipes,</span><span lang=3D"EN-US"><u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">I mean we haven&#39;t meson built these options, s=
o their changes have no effect on us</span><span lang=3D"EN-US"><u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">And I also checked all do_configure logs, no optio=
n
</span><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=E2=80=
=9C<span lang=3D"EN-US">deprecated</span>=E2=80=9D<span lang=3D"EN-US"> rel=
ated logs</span></span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">Please let me know if further confirmations are ne=
eded</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">I =
see some changes on the gst-plugins-bad:<br>
<br>
$ git diff --stat origin/1.26 origin/1.24 $(find | grep meson_options.txt) =
<br>
=C2=A0meson_options.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 49 +=
++++++++++++++++--------------------------------<br>
=C2=A0subprojects/gst-devtools/meson_options.txt =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A02 --<br>
=C2=A0subprojects/gst-editing-services/meson_options.txt | =C2=A04 +---<br>
=C2=A0subprojects/gst-plugins-bad/meson_options.txt =C2=A0 =C2=A0 =C2=A0| 7=
6 +++++++++++++++----------------------------------------------------------=
---<br>
=C2=A0subprojects/gst-plugins-base/meson_options.txt =C2=A0 =C2=A0 | 24 +++=
+++------------------<br>
=C2=A0subprojects/gst-plugins-good/meson_options.txt =C2=A0 =C2=A0 | 24 +++=
+++------------------<br>
=C2=A0subprojects/gst-plugins-ugly/meson_options.txt =C2=A0 =C2=A0 | 24 +++=
+++------------------<br>
=C2=A0subprojects/gst-python/meson_options.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A04 +---<br>
=C2=A0subprojects/gst-rtsp-server/meson_options.txt =C2=A0 =C2=A0 =C2=A0| 2=
4 ++++++------------------<br>
=C2=A0subprojects/gstreamer/meson_options.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 24 ++++++------------------<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">I =
also recommend=C2=A0doing these major updates=C2=A0separately using one=C2=
=A0commit for each component.<br>
<br>
Jose<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"><a href=3D"mailto:userland@pumpkin3:/mnt/test/buil=
d_auh/workspace/attic/sources/gstreamer1.0.20250326023639$" target=3D"_blan=
k">userland@pumpkin3:/mnt/test/build_auh/workspace/attic/sources/gstreamer1=
.0.20250326023639$</a>
 git diff devtool-base devtool-base-1.26.0 meson_options.txt</span><span la=
ng=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">diff --git a/meson_options.txt b/meson_options.txt=
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">index 340fb58..39255cf 100644</span><span lang=3D"=
EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">--- a/meson_options.txt</span><span lang=3D"EN-US"=
><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+++ b/meson_options.txt</span><span lang=3D"EN-US"=
><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">@@ -33,12 +33,6 @@ option(&#39;benchmarks&#39;, ty=
pe : &#39;feature&#39;, value : &#39;auto&#39;, yield : true)</span><span l=
ang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">option(&#39;tools&#39;, type : &#39;feature&#39;, =
value : &#39;auto&#39;, yield : true)</span><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">option(&#39;introspection&#39;, type : &#39;featur=
e&#39;, value : &#39;auto&#39;, yield : true, description : &#39;Generate g=
object-introspection
 bindings&#39;)</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">option(&#39;nls&#39;, type : &#39;feature&#39;, va=
lue : &#39;auto&#39;, yield: true, description : &#39;Enable native languag=
e support (translations)&#39;)</span><span lang=3D"EN-US"><u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">-option(&#39;gobject-cast-checks&#39;, type : &#39=
;feature&#39;, value : &#39;auto&#39;, yield : true,</span><span lang=3D"EN=
-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=
 &#39;Enable run-time GObject cast checks (auto =3D enabled for development=
, disabled for stable releases)&#39;)</span><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">-option(&#39;glib-asserts&#39;, type : &#39;featur=
e&#39;, value : &#39;enabled&#39;, yield : true,</span><span lang=3D"EN-US"=
><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=
 &#39;Enable GLib assertion (auto =3D enabled for development, disabled for=
 stable releases)&#39;)</span><span lang=3D"EN-US"><u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">-option(&#39;glib-checks&#39;, type : &#39;feature=
&#39;, value : &#39;enabled&#39;, yield : true,</span><span lang=3D"EN-US">=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=
 &#39;Enable GLib checks such as API guards (auto =3D enabled for developme=
nt, disabled for stable releases)&#39;)</span><span lang=3D"EN-US"><u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">option(&#39;extra-checks&#39;, type : &#39;feature=
&#39;, value : &#39;enabled&#39;, yield : true, description : &#39;Enable e=
xtra runtime checks&#39;)</span><span lang=3D"EN-US"><u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"># Common options</span><span lang=3D"EN-US"><u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">@@ -48,3 +42,21 @@ option(&#39;package-origin&#39;=
, type : &#39;string&#39;, value : &#39;Unknown package origin&#39;, yiel</=
span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 descrip=
tion : &#39;package origin URL to use in plugins&#39;)</span><span lang=3D"=
EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">option(&#39;doc&#39;, type : &#39;feature&#39;, va=
lue : &#39;auto&#39;, yield: true,</span><span lang=3D"EN-US"><u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 descrip=
tion: &#39;Enable documentation.&#39;)</span><span lang=3D"EN-US"><u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+option(&#39;glib_debug&#39;, type : &#39;feature&=
#39;, value : &#39;auto&#39;, yield : true, description : &#39;Enable GLib =
debug infrastructure
 (see docs/macros.txt)&#39;)</span><span lang=3D"EN-US"><u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+option(&#39;glib_assert&#39;, type : &#39;boolean=
&#39;, value : true, yield : true, description : &#39;Enable GLib assertion=
 (see docs/macros.txt)&#39;,</span><span lang=3D"EN-US"><u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0 deprecated: {&#39;enabled&#39; : &#39;true=
&#39;, &#39;disabled&#39; : &#39;false&#39;, &#39;auto&#39; : &#39;false&#3=
9;},</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+)</span><span lang=3D"EN-US"><u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+option(&#39;glib_checks&#39;, type : &#39;boolean=
&#39;, value : true, yield : true, description : &#39;Enable GLib checks su=
ch as API guards
 (see docs/macros.txt)&#39;,</span><span lang=3D"EN-US"><u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0 deprecated: {&#39;enabled&#39; : &#39;true=
&#39;, &#39;disabled&#39; : &#39;false&#39;, &#39;auto&#39; : &#39;false&#3=
9;},</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+)</span><span lang=3D"EN-US"><u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+</span><span lang=3D"EN-US"><u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+# Deprecated, kept for backward compat</span><spa=
n lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+option(&#39;gobject-cast-checks&#39;, type : &#39=
;feature&#39;, value : &#39;auto&#39;, yield : true,</span><span lang=3D"EN=
-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=
 &#39;Enable run-time GObject cast checks (auto =3D enabled for development=
, disabled for stable releases)&#39;,</span><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deprecated: =
&#39;glib_debug&#39;)</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+option(&#39;glib-asserts&#39;, type : &#39;featur=
e&#39;, value : &#39;enabled&#39;, yield : true,</span><span lang=3D"EN-US"=
><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=
 &#39;Enable GLib assertion (auto =3D enabled for development, disabled for=
 stable releases)&#39;,</span><span lang=3D"EN-US"><u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deprecated: =
&#39;glib_assert&#39;)</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+option(&#39;glib-checks&#39;, type : &#39;feature=
&#39;, value : &#39;enabled&#39;, yield : true,</span><span lang=3D"EN-US">=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=
 &#39;Enable GLib checks such as API guards (auto =3D enabled for developme=
nt, disabled for stable releases)&#39;,</span><span lang=3D"EN-US"><u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deprecated: =
&#39;glib_checks&#39;)</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></=
span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Jose
 Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">=
quaresma.jose@gmail.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, March 26, 2025 7:36 PM<br>
<b>To:</b> Lei, Maohui/</span><span style=3D"font-size:11pt">=E9=9B=B7</spa=
n><span style=3D"font-size:11pt;font-family:Calibri,sans-serif">
</span><span style=3D"font-size:11pt">=E8=8C=82=E6=85=A7</span><span lang=
=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans-serif"> &lt;<a =
href=3D"mailto:leimaohui@fujitsu.com" target=3D"_blank">leimaohui@fujitsu.c=
om</a>&gt;<br>
<b>Cc:</b> Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=
=3D"_blank">anuj.mittal@intel.com</a>&gt;;
<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blan=
k">openembedded-core@lists.openembedded.org</a>; Lei Maohui &lt;<a href=3D"=
mailto:leihaohui@fujitsu.com" target=3D"_blank">leihaohui@fujitsu.com</a>&g=
t;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2 6/7] gstreamer1.0-plugins-{ugly,bas=
e,good}: upgrade 1.24.12 -&gt; 1.26.0</span><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Lei,<br>
<br>
This is a major bump and is a bit strange=C2=A0that there are no new packag=
econfig knobs and also some other deprecation.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Have you checked=C2=A0the meson=
 opinions changes?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">Jo=
se<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">leimaohui via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> &lt;leimaohui=3D<a href=3D"mailto:fujitsu.com@lists.openembedde=
d.org" target=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt; escreve=
u (quarta, 26/03/2025
</span>=C3=A0<span lang=3D"EN-US">(s) 06:37):<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">Fr=
om: Lei Maohui &lt;<a href=3D"mailto:leihaohui@fujitsu.com" target=3D"_blan=
k">leihaohui@fujitsu.com</a>&gt;<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leihaohui@fujitsu.com" targ=
et=3D"_blank">leihaohui@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...1-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 4 ++-=
-<br>
=C2=A0.../0002-ssaparse-enhance-SSA-text-lines-parsing.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../0003-viv-fb-Make-sure-config.h-is-included.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0...<a href=3D"http://ns-base_1.24.12.bb" target=3D"_blank">ns-base_1.=
24.12.bb</a> =3D&gt;
<a href=3D"http://gstreamer1.0-plugins-base_1.26.0.bb" target=3D"_blank">gs=
treamer1.0-plugins-base_1.26.0.bb</a>} | 2 +-<br>
=C2=A0...<a href=3D"http://ns-good_1.24.12.bb" target=3D"_blank">ns-good_1.=
24.12.bb</a> =3D&gt;
<a href=3D"http://gstreamer1.0-plugins-good_1.26.0.bb" target=3D"_blank">gs=
treamer1.0-plugins-good_1.26.0.bb</a>} | 2 +-<br>
=C2=A0...<a href=3D"http://ns-ugly_1.24.12.bb" target=3D"_blank">ns-ugly_1.=
24.12.bb</a> =3D&gt;
<a href=3D"http://gstreamer1.0-plugins-ugly_1.26.0.bb" target=3D"_blank">gs=
treamer1.0-plugins-ugly_1.26.0.bb</a>} | 2 +-<br>
=C2=A06 files changed, 7 insertions(+), 7 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-base_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.=
24.12.bb</a> =3D&gt;
<a href=3D"http://gstreamer1.0-plugins-base_1.26.0.bb" target=3D"_blank">gs=
treamer1.0-plugins-base_1.26.0.bb</a>} (98%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-good_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.=
24.12.bb</a> =3D&gt;
<a href=3D"http://gstreamer1.0-plugins-good_1.26.0.bb" target=3D"_blank">gs=
treamer1.0-plugins-good_1.26.0.bb</a>} (97%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-ugly_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.=
24.12.bb</a> =3D&gt;
<a href=3D"http://gstreamer1.0-plugins-ugly_1.26.0.bb" target=3D"_blank">gs=
treamer1.0-plugins-ugly_1.26.0.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
01-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-=
multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-f=
rom-src-pad-when-query-caps.patch<br>
index e35ec026e4..7373bd3e26 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR=
00312515-get-caps-from-src-pad-when-query-caps.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR=
00312515-get-caps-from-src-pad-when-query-caps.patch<br>
@@ -1,4 +1,4 @@<br>
-From e0478a9b3bb1b49c34aaf076152ed8e49cf909e0 Mon Sep 17 00:00:00 2001<br>
+From bd1436f0027bb09cdcf90386910a497422d9a871 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: zhouming &lt;<a href=3D"mailto:b42586@freescale.com" target=3D"=
_blank">b42586@freescale.com</a>&gt;<br>
=C2=A0Date: Wed, 14 May 2014 10:16:20 +0800<br>
=C2=A0Subject: [PATCH] ENGR00312515: get caps from src pad when query caps<=
br>
@@ -16,7 +16,7 @@ Signed-off-by: zhouming &lt;<a href=3D"mailto:b42586@free=
scale.com" target=3D"_blank">b42586@freescale.com</a>&gt;<br>
=C2=A0diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttag=
demux.c<br>
=C2=A0old mode 100644<br>
=C2=A0new mode 100755<br>
-index ef0ff90..53f05c8<br>
+index 975fe83..df82840<br>
=C2=A0--- a/gst-libs/gst/tag/gsttagdemux.c<br>
=C2=A0+++ b/gst-libs/gst/tag/gsttagdemux.c<br>
=C2=A0@@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObje=
ct * parent, GstQuery * query)<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
02-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-pa=
rsing.patch<br>
index 810a4ba676..fc9ad474d9 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssap=
arse-enhance-SSA-text-lines-parsing.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssap=
arse-enhance-SSA-text-lines-parsing.patch<br>
@@ -1,4 +1,4 @@<br>
-From 1b9887421de593854632571327b4918b880900c6 Mon Sep 17 00:00:00 2001<br>
+From 1cc876662b7707eb5a2f668654f7921b5642e108 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Mingke Wang &lt;<a href=3D"mailto:mingke.wang@freescale.com" ta=
rget=3D"_blank">mingke.wang@freescale.com</a>&gt;<br>
=C2=A0Date: Thu, 19 Mar 2015 14:17:10 +0800<br>
=C2=A0Subject: [PATCH] ssaparse: enhance SSA text lines parsing.<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
03-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gs=
treamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-include=
d.patch<br>
index 8fa46d809a..06b5bc41ed 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-=
fb-Make-sure-config.h-is-included.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-=
fb-Make-sure-config.h-is-included.patch<br>
@@ -1,4 +1,4 @@<br>
-From 22a0e3a5288486991a15c48fdcb730eaa6dc08e5 Mon Sep 17 00:00:00 2001<br>
+From c0c6944eca0c497477aa9f2cec2c83c4ea7a70e5 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.org" =
target=3D"_blank">crg7475@mailbox.org</a>&gt;<br>
=C2=A0Date: Tue, 21 May 2019 14:01:11 +0200<br>
=C2=A0Subject: [PATCH] viv-fb: Make sure config.h is included<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-base_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.2=
4.12.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer=
1.0-plugins-base_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.2=
6.0.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-base_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.24=
.12.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-base_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.26.0.=
bb</a><br>
index f4505d831e..bd0131c647 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-base_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.24.12.bb=
</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-base_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.26.0.bb</=
a><br>
@@ -11,7 +11,7 @@ SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedeskto=
p.org/src/gst-plugins-base/gst-plugins-ba" target=3D"_blank">https://gstrea=
mer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-viv-fb-Make-sure-conf=
ig.h-is-included.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-ssaparse-enhance-SSA-=
text-lines-parsing.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;f6efbaa8fea8d00bc380bccca76a530527b1f083e8523=
eafb3e9b1e18bc653d3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e23189fbed2ec486690382d1055c19eeaf5aae3e95e25=
76fc4c884d96a90e69e&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-base-${PV}&quot;<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-good_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.2=
4.12.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer=
1.0-plugins-good_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.2=
6.0.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-good_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.24=
.12.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-good_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.26.0.=
bb</a><br>
index 9cc2d462f6..a2c6426c34 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-good_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.24.12.bb=
</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-good_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.26.0.bb</=
a><br>
@@ -6,7 +6,7 @@ BUGTRACKER =3D &quot;<a href=3D"https://gitlab.freedesktop.=
org/gstreamer/gst-plugins-good/-/issues" target=3D"_blank">https://gitlab.f=
reedesktop.org/gstreamer/gst-plugins-good/-/issues</a><br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/src/gs=
t-plugins-good/gst-plugins-good-$%7BPV%7D.tar.xz" target=3D"_blank">https:/=
/gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.=
xz</a>&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;d0e66e2f935d1575f6adbef7d0a2b3faba7360344383c=
51bf0233b39e0489a64&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9e18f139ef69ad0867c2dfbb8fe1d1736d76df11aac83=
f60e8d3adb1e2eaf03b&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-good-${PV}&quot;<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-ugly_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.2=
4.12.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer=
1.0-plugins-ugly_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.2=
6.0.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-ugly_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.24=
.12.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-ugly_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.26.0.=
bb</a><br>
index 75f528216f..f0e42ad8fb 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-ugly_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.24.12.bb=
</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-ugly_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.26.0.bb</=
a><br>
@@ -15,7 +15,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gstreame=
r.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-$%7BPV%7D.tar.xz" t=
arget=3D"_blank">https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst=
-plugins-ugly-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;19ed6eef4ea1a742234fb35e2cdb107168595a4dd409a=
9fac0b7a16543eee78b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a86b51c8454a813120848c803421f327d8c07aabcae46=
1e0597cc49398c0fcde&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-ugly-${PV}&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#213636): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/213636" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/213636</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111912609/505=
2612" target=3D"_blank">
https://lists.openembedded.org/mt/111912609/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>=
]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></span></p>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br clear=3D"all">
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_-1320808302577018773m-4190508588908=
468095gmailsignatureprefix"><span lang=3D"EN-US">--
</span></span><span lang=3D"EN-US"><u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best regards,<u></u><u></u></sp=
an></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
Jos</span>=C3=A9<span lang=3D"EN-US"> Quaresma<u></u><u></u></span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br clear=3D"all">
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_-1320808302577018773gmailsignaturep=
refix"><span lang=3D"EN-US">-- </span>
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best regards,<u></u><u></u></sp=
an></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
Jos=C3=A9 Quaresma<u></u><u></u></span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</d=
iv></div></div></div>

--000000000000fb39c20631660ee2--

