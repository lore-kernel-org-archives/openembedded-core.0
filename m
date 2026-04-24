Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165B0FE51FC
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 09:57:54 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17551.1777024673266582052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 02:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KKgZy+w2;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so93914005e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777024672; x=1777629472; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVyLeJeZosi7LXOtd4BdsELI+j2ycyTIjMGR/QRfBls=;
        b=KKgZy+w2EYMKNKqvaaw1tjCbSQh+IEDnPaO4WcFjBH/SyA0HM/MTzLIn6da+vLZIHn
         WyZ4Ku7LzQ9VxGf26gxhLvvTWGiY2+24FKdA1Ex4BfEuys50iuo3fXmh/vCS7102Rs8i
         KGUb20HFBjhI1Wuoea090FC3ZWX8de8zj+bgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024672; x=1777629472;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EVyLeJeZosi7LXOtd4BdsELI+j2ycyTIjMGR/QRfBls=;
        b=aFxpcYoTUY/EN49Sw8dtzt4k4kQHJYfe+OsWhqVcDEMaXJL3AT5SoFhEFkfl+lGFYK
         lsYFqrt9OTdjmleELGzVjtn5CUDWlLpMpkJ0uFYzhQua4HhU5wCMLM0U1SL2mbmyNUF6
         7M8NqZYvwoS8HFVpVIjheJ5OyFQnSXs8Iw+wRi70xqpvXjQRVa68gRfCMyTazjI2K9/b
         z8LRRICDZCeJTtulQ+HLOz6JJtF8Cs87XRoOFATZZk3l7jLw9G+LC0fPNXL4ARjMQ86l
         LBHhUZUjOqtjOEnq14qLK4KYzu15T/2oNJ5zsbsua0Q+BHLBEyENcQeowvyWc5CU7ACH
         GKQg==
X-Forwarded-Encrypted: i=1; AFNElJ+QqgMd8h9M+kykDLlccgG2Iz3buQ3AFXhJ2QllYbO3JiHhv93XXrJ/4aJbeucjuJ3+3y8lXfkG7RaKA0byZ/WO8w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxbV79lSzbZY7bIR/XRbAQzwFXVypR7YwMLEM7Bcibfs0XXgh3e
	vg8UUc+PW5TZ04D9UlVAU1PzxILk6vjYxOTVK46USNyNjOjgVlzxX5HwamUb+XMAnAk=
X-Gm-Gg: AeBDieuPlCZaY/uPzCs1eDNO3TFtYeA4WKruglyxMCvQUETe+C9AOIoQe0xrl3g73x3
	pnm7hjeyG/8HcDLxOee94qwCnJWr6Cd/NQJ7ZOVRYekKp5FxKF5wzv7KeUTf9pm57NiqVBEis8A
	sBFF9OZdTg/GssFfvNJ8WJCI17W6ZbVXlR1QA7ArH/EpbVZB3Bfjq9QfGFTprJ4UT+GUWKT8Q4q
	JdrgzVHM9L244sMOXsFqWJAWfm4IoaQYe9fKtrN5TMYbVWUN7RYgEvl10kuq9aoa1aVo2ACVzxL
	m/HMg6YtvUeKCblYe5woMe4jYeaFZ04rp30ynmrerzIcvSFG2FDxmP2VNJwDh5OMcGtSADpz9R/
	XInDyjzCe5Sz9mHiiA/LnEcfQtWzMGY+Ch/SY9VQNhTgvBOLE6NJiNP5MZkcTrDyArWj/hTymEs
	2Q1vBYLVTg8hYsMVMgqM+cvs2cKNejM8jyc8G6B9+CuG5lN8pJSWt2FlFfCVBUc/VPSdj54qkSD
	/Xuuvs6jsQXobR48Yq0KAk/QKjTSSv3xQtJ
X-Received: by 2002:a05:600c:3553:b0:48a:52f2:a0f1 with SMTP id 5b1f17b1804b1-48a52f2a5f0mr249430975e9.18.1777024671481;
        Fri, 24 Apr 2026 02:57:51 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5d27d6casm44630945e9.27.2026.04.24.02.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:57:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 11:57:50 +0200
Message-Id: <DI1AO7MBSEFG.SVPI5YNXXZ44@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] systemd-analyze: add SVG scaling
 and detailed timestamps
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <mail2szahir@gmail.com>, <openembedded-core@lists.openembedded.org>,
 <zahir.basha@kpit.com>
X-Mailer: aerc 0.20.0
References: <20260424092433.3222272-1-zahir.basha@partner.bmwgroup.com>
In-Reply-To: <20260424092433.3222272-1-zahir.basha@partner.bmwgroup.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 09:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235855

On Fri Apr 24, 2026 at 11:24 AM CEST, aszh07 via lists.openembedded.org wro=
te:
> From: Zahir Hussain <zahir.basha@kpit.com>
>
> Enhance the `plot` command with two new options for better visualization:
>  `--scale-svg=3D<FACTOR>`: Scales the x-axis to improve plot readability.
>  `--detailed`: Adds activation timestamps to the SVG output.
>
> This is a backport of the following upstream commit:
> https://github.com/systemd/systemd/commit/1592d2f900c25251ece2670c71d9578=
06f48216b
>
> This improves the readability of boot analysis plots when dealing
> with complex or high-density timing data.
>
> Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>

Hello,

Sorry but this a new feature and is excluded by policy from stable
branches.

Regards,

> ---
>  ...temd-analyze-Add-svg-scaling-options.patch | 167 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |   1 +
>  2 files changed, 168 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-systemd-analyz=
e-Add-svg-scaling-options.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0023-systemd-analyze-Add-s=
vg-scaling-options.patch b/meta/recipes-core/systemd/systemd/0023-systemd-a=
nalyze-Add-svg-scaling-options.patch
> new file mode 100644
> index 0000000000..9bae1654d2
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0023-systemd-analyze-Add-svg-scal=
ing-options.patch
> @@ -0,0 +1,167 @@
> +From 6f1af79ed9515771113ea5b39ac7b267cac66dc7 Mon Sep 17 00:00:00 2001
> +From: rajmohan r <rajmohan.r@kpit.com>
> +Date: Thu, 8 Aug 2024 15:09:35 +0530
> +Subject: [PATCH] systemd-analyze: Add svg scaling options
> +
> ++ Scale the x-axis of the resulting plot by a factor (default 1.0)
> ++ Add activation timestamps to each bar
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/159=
2d2f900c25251ece2670c71d957806f48216b]
> +
> +comment: refresh the patch according to source code and Changes to=20
> +test/units/TEST-65-ANALYZE.sh do not take effect because the file
> +is not available in the source code.
> +
> +Signed-off-by: rajmohan r <rajmohan.r@kpit.com>
> +Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
> +---
> + man/systemd-analyze.xml               | 18 ++++++++++++++++++
> + shell-completion/bash/systemd-analyze |  2 +-
> + src/analyze/analyze-plot.c            |  7 ++++++-
> + src/analyze/analyze.c                 | 17 +++++++++++++++++
> + src/analyze/analyze.h                 |  2 ++
> + 5 files changed, 42 insertions(+), 2 deletions(-)
> +
> +diff --git a/man/systemd-analyze.xml b/man/systemd-analyze.xml
> +index 35ad8435f4f..9a7998b3f6d 100644
> +--- a/man/systemd-analyze.xml
> ++++ b/man/systemd-analyze.xml
> +@@ -1499,6 +1499,24 @@ NR NAME                SHA256
> +         <xi:include href=3D"version-info.xml" xpointer=3D"v255"/></list=
item>
> +       </varlistentry>
> +=20
> ++      <varlistentry>
> ++        <term><option>--scale-svg=3D<replaceable>FACTOR</replaceable></=
option></term>
> ++
> ++        <listitem><para>When used with the <command>plot</command> comm=
and, the x-axis of the plot
> ++        can be stretched by FACTOR (default: 1.0).</para>
> ++
> ++        <xi:include href=3D"version-info.xml" xpointer=3D"v255"/></list=
item>
> ++      </varlistentry>
> ++
> ++      <varlistentry>
> ++        <term><option>--detailed</option></term>
> ++
> ++        <listitem><para>When used with the <command>plot</command> comm=
and, activation timestamps
> ++        details can be seen in SVG plot.</para>
> ++
> ++        <xi:include href=3D"version-info.xml" xpointer=3D"v255"/></list=
item>
> ++      </varlistentry>
> ++
> +       <xi:include href=3D"standard-options.xml" xpointer=3D"help" />
> +       <xi:include href=3D"standard-options.xml" xpointer=3D"version" />
> +       <xi:include href=3D"standard-options.xml" xpointer=3D"no-pager" /=
>
> +diff --git a/shell-completion/bash/systemd-analyze b/shell-completion/ba=
sh/systemd-analyze
> +index 1fde67218b9..781cb1572e2 100644
> +--- a/shell-completion/bash/systemd-analyze
> ++++ b/shell-completion/bash/systemd-analyze
> +@@ -196,7 +196,7 @@ _systemd_analyze() {
> +=20
> +     elif __contains_word "$verb" ${VERBS[PLOT]}; then
> +         if [[ $cur =3D -* ]]; then
> +-            comps=3D'--help --version --system --user --global --no-pag=
er --json=3Doff --json=3Dpretty --json=3Dshort --table --no-legend'
> ++            comps=3D'--help --version --system --user --global --no-pag=
er --json=3Doff --json=3Dpretty --json=3Dshort --table --no-legend --scale-=
svg --detailed'
> +         fi
> +     fi
> +=20
> +diff --git a/src/analyze/analyze-plot.c b/src/analyze/analyze-plot.c
> +index 81fc25b31e0..70a903e0db1 100644
> +--- a/src/analyze/analyze-plot.c
> ++++ b/src/analyze/analyze-plot.c
> +@@ -12,7 +12,7 @@
> + #include "unit-def.h"
> + #include "version.h"
> +=20
> +-#define SCALE_X (0.1 / 1000.0) /* pixels per us */
> ++#define SCALE_X (0.1 * arg_svg_timescale / 1000.0) /* pixels per us */
> + #define SCALE_Y (20.0)
> +=20
> + #define svg(...) printf(__VA_ARGS__)
> +@@ -30,6 +30,9 @@
> +                 svg("</text>\n");                                      =
 \
> +         } while (false)
> +=20
> ++#define svg_timestamp(b, t, y) \
> ++        svg_text(b, t, y, "%u.%03us", (unsigned)((t) / USEC_PER_SEC), (=
unsigned)(((t) % USEC_PER_SEC) / USEC_PER_MSEC))
> ++
> +=20
> + typedef struct HostInfo {
> +         char *hostname;
> +@@ -358,6 +361,8 @@ static int produce_plot_as_svg(
> +         svg_bar("generators", boot->generators_start_time, boot->genera=
tors_finish_time, y);
> +         svg_bar("unitsload", boot->unitsload_start_time, boot->unitsloa=
d_finish_time, y);
> +         svg_text(true, boot->userspace_time, y, "systemd");
> ++        if (arg_detailed_svg)
> ++                svg_timestamp(false, boot->userspace_time, y);
> +         y++;
> +=20
> +         for (; u->has_data; u++)
> +diff --git a/src/analyze/analyze.c b/src/analyze/analyze.c
> +index 021de65bdbf..457f9e59cc8 100644
> +--- a/src/analyze/analyze.c
> ++++ b/src/analyze/analyze.c
> +@@ -99,6 +99,8 @@ RuntimeScope arg_runtime_scope =3D RUNTIME_SCOPE_SYSTE=
M;
> + RecursiveErrors arg_recursive_errors =3D _RECURSIVE_ERRORS_INVALID;
> + bool arg_man =3D true;
> + bool arg_generators =3D false;
> ++double arg_svg_timescale =3D 1.0;
> ++bool arg_detailed_svg =3D false;
> + char *arg_root =3D NULL;
> + static char *arg_image =3D NULL;
> + char *arg_security_policy =3D NULL;
> +@@ -271,6 +273,9 @@ static int help(int argc, char *argv[], void *userda=
ta) {
> +                "     --profile=3Dname|PATH     Include the specified pr=
ofile in the\n"
> +                "                             security review of the uni=
t(s)\n"
> +                "     --table                 Output plot's raw time dat=
a as a table\n"
> ++               "     --scale-svg=3DFACTOR      Stretch x-axis of plot b=
y FACTOR (default: 1.0)\n"
> ++               "     --detailed              Add more details to SVG pl=
ot,\n"
> ++               "                             e.g. show activation times=
tamps\n"
> +                "  -h --help                  Show this help\n"
> +                "     --version               Show package version\n"
> +                "  -q --quiet                 Do not emit hints\n"
> +@@ -319,6 +324,8 @@ static int parse_argv(int argc, char *argv[]) {
> +                 ARG_TABLE,
> +                 ARG_NO_LEGEND,
> +                 ARG_TLDR,
> ++                ARG_SCALE_FACTOR_SVG,
> ++                ARG_DETAILED_SVG,
> +         };
> +=20
> +         static const struct option options[] =3D {
> +@@ -353,6 +360,8 @@ static int parse_argv(int argc, char *argv[]) {
> +                 { "table",            optional_argument, NULL, ARG_TABL=
E            },
> +                 { "no-legend",        optional_argument, NULL, ARG_NO_L=
EGEND        },
> +                 { "tldr",             no_argument,       NULL, ARG_TLDR=
             },
> ++                { "scale-svg",        required_argument, NULL, ARG_SCAL=
E_FACTOR_SVG },
> ++                { "detailed",         no_argument,       NULL, ARG_DETA=
ILED_SVG     },
> +                 {}
> +         };
> +=20
> +@@ -546,6 +555,14 @@ static int parse_argv(int argc, char *argv[]) {
> +                         arg_cat_flags =3D CAT_TLDR;
> +                         break;
> +=20
> ++                case ARG_SCALE_FACTOR_SVG:
> ++                        arg_svg_timescale =3D strtod(optarg, NULL);
> ++                        break;
> ++
> ++                case ARG_DETAILED_SVG:
> ++                        arg_detailed_svg =3D true;
> ++                        break;
> ++
> +                 case '?':
> +                         return -EINVAL;
> +=20
> +diff --git a/src/analyze/analyze.h b/src/analyze/analyze.h
> +index 8a9528c0d3b..ddd4ad547c7 100644
> +--- a/src/analyze/analyze.h
> ++++ b/src/analyze/analyze.h
> +@@ -28,6 +28,8 @@ extern RuntimeScope arg_runtime_scope;
> + extern RecursiveErrors arg_recursive_errors;
> + extern bool arg_man;
> + extern bool arg_generators;
> ++extern double arg_svg_timescale;
> ++extern bool arg_detailed_svg;
> + extern char *arg_root;
> + extern char *arg_security_policy;
> + extern bool arg_offline;
> diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-c=
ore/systemd/systemd_255.21.bb
> index 87e186bbfa..2d5badb489 100644
> --- a/meta/recipes-core/systemd/systemd_255.21.bb
> +++ b/meta/recipes-core/systemd/systemd_255.21.bb
> @@ -29,6 +29,7 @@ SRC_URI +=3D " \
>             file://0002-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0003-timedated-Respond-on-org.freedesktop.timedate1.Se=
tNT.patch \
>             file://0008-implment-systemd-sysv-install-for-OE.patch \
> +           file://0023-systemd-analyze-Add-svg-scaling-options.patch \
>             "
> =20
>  # patches needed by musl


--=20
Yoann Congal
Smile ECS


