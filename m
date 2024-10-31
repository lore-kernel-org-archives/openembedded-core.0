Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E4DE6895C
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 20:35:10 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.22577.1730406903844942459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 13:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H/rzs6Na;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f58c68c5so2574313e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 13:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730406902; x=1731011702; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSpSXZ8OMaTm+EN2lg4LTMolqSHSW3j9UO1HDuWe7MY=;
        b=H/rzs6Naf9009qCgM7uv72SMgpU9dxuaxeHd6MjcxSSDwcyBqDoAPgGvdc9b1pgxbr
         ka5eGv4VyPIgW8QMo4t0l5uhW3Ryo4I01wMQGYlCR4BzWV+Qe9ZPANUyHwJ1QfnDubze
         koPFzM6XgtbDrGOZoUeiRydK5n0KY9azjHTLpo0wgCqFABINl63CkglSItp3V2tEF3TB
         Ull5GWD/4NujNTvCoDgLZLyzY4vuTdf1nW5iV1K8uKt3cpQMVjERCOhAEpESeT2deDbe
         +xmQzhahTytK7xt8ADCCrAC6EHT1CMCOykREkyQy1urYNkbPfZ6eh/BJUkHjIxe7j0bF
         N6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730406902; x=1731011702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSpSXZ8OMaTm+EN2lg4LTMolqSHSW3j9UO1HDuWe7MY=;
        b=CzxXd9TfH/8yybH1kdX1W85fmLGSy+6Afhw/LkMFnWsx2wCTEZYw3k6sNpiFLcvBz0
         6vT2TuviqVq7jpZtkkEk5lPWskuRFckjfBKOAkNU0ZT8mH+k/vebJvczrNgZDoM96G0S
         KRnxeCZ0xVF7+4OQaHhj1KUG8GXhAb6iLALSLzMGLqpUUBDbUHjjDMd0GsT68LC7H1sI
         jIT6vfvWIY7xlwFcZWi+SVCdOvbJdsRPLBlpCCnixhtceCJ+MUjpMboohNG137cZAJOU
         ZNUDEwtEx7tFFcNMh/ZNebKWuslL0pA327fxmAICj1fdkPkskgB34yqKJ2As6LuRuc0d
         RT/A==
X-Gm-Message-State: AOJu0Ywlx14NwtmO+Bbj7cGav4Aff+Kw8XyKSO2yTiB7j8Gyt9Hz4P/x
	7c4+kLVxIWoJoUyS+MnNDbRVcT5PqdBxXltFABa4XjS3e/+ikGPeiko2KAhWVW6lclYgAW9AVWI
	dAE9p7Jrank8QI094DyiF7t44q/k=
X-Google-Smtp-Source: AGHT+IE1YnyadeNoV02CKxqeRtu8Jv3QbBgrRoCGua9ws0v6zeaMQ9JJgMDi4vo7WAu0UHjR8ceE2Jif3PT1IJQbn/c=
X-Received: by 2002:a05:6512:3da8:b0:538:9e1e:b06f with SMTP id
 2adb3069b0e04-53d65df23b5mr1216018e87.27.1730406901790; Thu, 31 Oct 2024
 13:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241030050745.3702603-1-hongxu.jia@windriver.com> <20241030050745.3702603-7-hongxu.jia@windriver.com>
In-Reply-To: <20241030050745.3702603-7-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 31 Oct 2024 14:34:49 -0600
Message-ID: <CAJdd5GbjC1ucUKKiHXTN0KHXeXwDrLwxJLWFO_8O0TtiT43Grg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 6/6] oeqa/selftest: Add SPDX 3.0 include source
 case for work-share
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 20:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206594

Excellent! Thanks for adding a test case

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Oct 29, 2024 at 11:07=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> Build gcc and check gcc-14.2.0/README in objset is available
>
> $ oe-selftest -r spdx.SPDX30Check.test_gcc_include_source
> ...
> 2024-10-26 01:24:57,063 - oe-selftest - INFO - test_gcc_include_source (s=
pdx.SPDX30Check.test_gcc_include_source)
> 2024-10-26 01:28:24,204 - oe-selftest - INFO - The spdxId of gcc-14.2.0/R=
EADME in gcc.spdx.json is http://spdx.org/spdxdocs/gcc-f2eaeb0d-b54b-53ba-8=
99a-8c36c21139bf/88d5068ffd41e5ea6b4e0dd390b23bf499bb2b6674a41e09eaf2a887ec=
ed16c8/sourcefile/42
> 2024-10-26 01:28:26,369 - oe-selftest - INFO -  ... ok
> 2024-10-26 01:28:33,315 - oe-selftest - INFO - --------------------------=
--------------------------------------------
> 2024-10-26 01:28:33,316 - oe-selftest - INFO - Ran 1 test in 216.457s
> 2024-10-26 01:28:33,316 - oe-selftest - INFO - OK
> 2024-10-26 01:28:45,254 - oe-selftest - INFO - RESULTS:
> 2024-10-26 01:28:45,254 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check=
.test_gcc_include_source: PASSED (209.31s)
> 2024-10-26 01:28:45,260 - oe-selftest - INFO - SUMMARY:
> 2024-10-26 01:28:45,260 - oe-selftest - INFO - oe-selftest () - Ran 1 tes=
t in 216.457s
> 2024-10-26 01:28:45,260 - oe-selftest - INFO - oe-selftest - OK - All req=
uired tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/spdx.py | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
> index be595babb3..8384070219 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -110,6 +110,7 @@ class SPDX3CheckBase(object):
>                      "SDKMACHINE",
>                      "SDK_DEPLOY",
>                      "SPDX_VERSION",
> +                    "SSTATE_PKGARCH",
>                      "TOOLCHAIN_OUTPUTNAME",
>                  ],
>                  target_name,
> @@ -136,6 +137,34 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
):
>              "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/base-files.spdx.j=
son",
>          )
>
> +
> +    def test_gcc_include_source(self):
> +        import oe.spdx30
> +
> +        objset =3D self.check_recipe_spdx(
> +            "gcc",
> +            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/gcc.spdx.json",
> +            extraconf=3Dtextwrap.dedent(
> +                """\
> +                SPDX_INCLUDE_SOURCES =3D "1"
> +                """
> +            ),
> +        )
> +
> +        gcc_pv =3D get_bb_var("PV", "gcc")
> +        filename =3D f'gcc-{gcc_pv}/README'
> +        found =3D False
> +        for software_file in objset.foreach_type(oe.spdx30.software_File=
):
> +            if software_file.name =3D=3D filename:
> +                found =3D True
> +                self.logger.info(f"The spdxId of {filename} in gcc.spdx.=
json is {software_file.spdxId}")
> +                break
> +
> +        self.assertTrue(
> +            found,
> +            f"Not found source file {filename} in gcc.spdx.json\n"
> +        )
> +
>      def test_core_image_minimal(self):
>          objset =3D self.check_recipe_spdx(
>              "core-image-minimal",
> --
> 2.25.1
>

