Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24E3D5B158
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 21:29:05 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.4705.1730150936247555559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QAXBDWYQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f53973fdso4034892e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 14:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730150934; x=1730755734; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaJ5EeXRBzhuCIgKIO0AUyh/m2pCOQI5P30xxR8i7Bk=;
        b=QAXBDWYQgDrRzlDWW9lD7UwtSDyI445KMTMLuB8JWuA8uTDZKbLww8IdGQddG8dFql
         ZQDjMBxfP585hard58VbuK3NlebhlxTtZr28g0WZV9dPrOR4pLsZo1dEucf6EdP6z+8D
         NAML6zNOJKdz2ydoLc0dcPyc8Bz/K2a2iyJpvfbrObMQKWGK4RJ23nZDNHkTYKUGp3pt
         ZzYuBG3DrmvwTNxFvHQblUWh5tNl9vTwvrkUH9RN5+EGBbTIk6FsivkPTSeqQ5Yy3mmc
         vcmBrfoTD5S031ldXaxfTBEODdLsnBolclm5yQIyf1JhkgxSZLAtBfXivsnq4tTg8r0D
         RMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150934; x=1730755734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaJ5EeXRBzhuCIgKIO0AUyh/m2pCOQI5P30xxR8i7Bk=;
        b=lYFFZEEzxUgEEly2Oz8orGZ2HAKamI4qhAQtbdaFkNY/waGWkLXSh4OIHuwF0nIepm
         KKWACYZE+cnTyMzW/GkaUc2t9WHvkby7yyaoFkmmsU+nnGKrE7CpTupBYPks6H/ZFarm
         UaCywlm1uSMwdS7Q61rdSVZzeGeqHEH/tsvTTAl63qk0FK4QpmPSroQ3bgLIGPykevt+
         t/f0UiES1S7in8DfZEM/HhSgjMmMLtCpC0s/CPiOktPgVZe24bLbNbjLT7SEOb5Ps9XO
         NYA5gWf+EqYDDlvSfrmdDUj3K2oxAsyaNsFL9UHHteTgvwEO/6DIDvQhNlkc+cEBVxqQ
         gRwQ==
X-Gm-Message-State: AOJu0YyEMxBqDjOq2hnc7SOtqExmPrCtCikoXlfHq0Y2iOgAwyn/QHKF
	sIVEBn6od9AgnaNEC9m44y+LJYPNFOGOgaEplVQ1z/sM2pw0TVu9Dw0dYx+RSuvAzNyad4TAH9w
	FKXqKZQLg7W2tnrXiQCO02A6av8NNmQ==
X-Google-Smtp-Source: AGHT+IE62csNnTcbfDvty1fJ/5/ZheGRxHlVTGskkjgYHsz1fT1u0IhfEDGEp5cTlOoqyaHlWrPKBUrnr0FemYuvX/Q=
X-Received: by 2002:a05:6512:4013:b0:539:e3a2:3a25 with SMTP id
 2adb3069b0e04-53b47402e0bmr284675e87.18.1730150933727; Mon, 28 Oct 2024
 14:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241026032519.1968518-1-hongxu.jia@windriver.com> <20241026032519.1968518-7-hongxu.jia@windriver.com>
In-Reply-To: <20241026032519.1968518-7-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 28 Oct 2024 15:28:41 -0600
Message-ID: <CAJdd5GZTf=tZDwHS9UFbDUN-XL3seJYxrDwL3YBF-fve2=goHw@mail.gmail.com>
Subject: Re: [oe-core][PATCH 6/6] Add SPDX 3.0 include source case for work-share
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 21:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206467

LGTM, thanks.

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Fri, Oct 25, 2024 at 9:25=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
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

