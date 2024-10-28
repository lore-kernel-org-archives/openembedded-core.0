Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5190D3E2BF
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 19:47:24 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.2107.1730144836964481202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HpA4Rcjw;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e6c754bdso4216596e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 12:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730144835; x=1730749635; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blNlQL0D9qhzPkDb6X/SmOaSr4HW3Sl+sVDHauLmIQs=;
        b=HpA4RcjwXSJ0Ue+BVdpjdnd9yyNbQcUOGBRYdXUvmavPcL/Jihfys2zrRBX3FQIFOC
         obbL/Xa7ez+WP9IBzSCRnU3Ph4lIhX4D4lKxrbf3GjeREXfXMnMtkknkn9Ap/VhKdkEE
         p5ePzS8Hk7VS9VbddECkqGPWEpskNiKVC2r2IiqsHdumJpjVOLrm2ZezK4TZOMtOPDWL
         e/t+LEBGdYgcSLki7QJwzHWwWFwUY1Aljp3iZF10gyjWkK8RGyPDPuPX+gO9pA4HMj/R
         GIWlAhG5y/g7C9GeZ9evhMSTJT6xRm4bs4ae7opbmoyr3yGgjs2m1K1JZuudUkOwhZQ0
         6NHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730144835; x=1730749635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blNlQL0D9qhzPkDb6X/SmOaSr4HW3Sl+sVDHauLmIQs=;
        b=CBUOl3yMQr6hjdmcjJOqEN4eQyguM17rZi769EqjpkxRrbiI2arT9N/GyGdTcim11y
         4E5Wu5EazLjDirDEHc5VFWdq9GZAkgjbj9AdfeB3knn0xWagXldXofGU4VF3sE6MJPSv
         lBN2A07KoBNVIXSJzAaYV4LJ+jVIMIurN3Kgdmpo5z6NqRW1ptCNVhclMLmPMTo2gtmQ
         qK1eI/mzkMsPRfvct8CUxx80UPsiQ+awu1Mimv3iTheUFoM1FzK833fTeECLSHJIQyNq
         PpfZtdHUq8OGwO4jE3pAgKQ9GgMWwCSxjw9kJg1MBHzo2mMPFOzsEWtN63TseySBqyJb
         XrJw==
X-Gm-Message-State: AOJu0YwduQHcj0ZyyTPm3VKaT+khFnEiCq6q5EckjxDoXLOsGvx3o4k4
	/KHgjC2NSmxtytSWcSTvoqUe7pSGpGGubpbLmfZkITHGO+xV7Q0beAZxhvGlc+2YU30zzleJVYq
	wr3pj/Nd/BOWbtmlAhLH/4L+/UTn3o/Kt
X-Google-Smtp-Source: AGHT+IFitOyY//DVEDOT5unSq+V0t8rtjg5goqp99+EdEKgtbONCaCOM7btxSlaYB761z9dif4uzsAYU7BszOHWaCNM=
X-Received: by 2002:a05:6512:33d5:b0:53a:3a:f4f4 with SMTP id
 2adb3069b0e04-53b348e599cmr3669188e87.31.1730144834776; Mon, 28 Oct 2024
 12:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241026032519.1968518-1-hongxu.jia@windriver.com> <20241026032519.1968518-3-hongxu.jia@windriver.com>
In-Reply-To: <20241026032519.1968518-3-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 28 Oct 2024 13:47:02 -0600
Message-ID: <CAJdd5Ga3e2ZS3rcS_T_e3kMdeeP773YrkLA7aA=QopfKM2R39w@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/6] meta/lib/oe/sbom30.py: correct typo
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 19:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206459

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Fri, Oct 25, 2024 at 9:25=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> The isinstance expected 2 arguments
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sbom30.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 73a957a20c..f4cc1f49dd 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -631,7 +631,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>          sha256_hash =3D bb.utils.sha256_file(path)
>
>          for f in self.by_sha256_hash.get(sha256_hash, []):
> -            if not isinstance(oe.spdx30.software_File):
> +            if not isinstance(f, oe.spdx30.software_File):
>                  continue
>
>              if purposes:
> --
> 2.25.1
>

