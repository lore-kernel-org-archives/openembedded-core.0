Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361F6D767FD
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 20:29:10 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.22576.1730406548857897457
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 13:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MdkfUcQl;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53b34ed38easo1283931e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 13:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730406547; x=1731011347; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSYQy78cYZ33ZfKigEL+yguI7sv5YGc+L956HbixLpM=;
        b=MdkfUcQl+RQ0yZmQXJ44OmCOhK/i6v4ul4Xu5yOdKneqH0xCiF0L2Bgi3bZb29802C
         1owe9sUsBUzI77AVms3o+vVeIRs464nK3vL0tuI3EtD8U++vIn/mqTBA/uhwuIsPsLFb
         iNBU/jy1gUKAkUb9jv40ThQbaxIJAKZ7sXeBXvid3NqmnWJPA6rOBeJTeMYQA50Y5dHq
         oojyW+KGT5m+d7YKWfsKdj/7wYMI1Te34+486NMZ5XXhAW+QruK4qr+3mEQKognr6yEF
         4ynEyfpbdx7tlqYG9AD0Tw5GsV1nbIkQ9PgSwTCnne6rxL9CtDv8qelJB+X27NN53Pnh
         njew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730406547; x=1731011347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSYQy78cYZ33ZfKigEL+yguI7sv5YGc+L956HbixLpM=;
        b=P1loCxPQActJYItL40fc6QkPfQ34WmOdKJWA89y+jLEh/cLTtmIgooQE2YaE7Rk0We
         WddF6cgoTY7FdWZbnXamBBAqx83sqsfcmY07MVKvBgWtiP+NjBM4P95k9oMzbufXBMKT
         nChQAnNhHwnTy4TdXjvcYxIf0fepLOt6tozCyZaMZP6iC4XwM3C1eppBdn9+h+4SESUJ
         YICr3Z1ptS91RBTfT0Qdb2lOYFsESgCCEawyc/ONt3VZCn5xaULVNm8X/HJ9yjH61lIr
         nqmv0Etsi7h4l0lsyFogCJyGz56r/Kyu9XjOEIGKKx7uV00GDBn8YO/ItQNK3v+gmsj8
         OIyA==
X-Gm-Message-State: AOJu0YzOkFJk3+ABrCYi5/OftHYwdzaSvfNfTg7ga2rL1/N5bh2b3Cuo
	wl3eiA4JPf85k8H8yEOIUYBGKjBrqQkTOoBHcrOb24HgoEE8M9KnovCbwvnHd07z3aUP1zceBoZ
	Iq2IJvyTKnR6QB+ZLMLqzRcLQqf8XDom/
X-Google-Smtp-Source: AGHT+IG+8IiigciZuhJURmbWLT5qCY5bSnF10Jt9oM2QnxMnyrHRAeVeFZ4cIlyNNgm+C1tWixbsmmOIF9+ezySctCE=
X-Received: by 2002:a05:6512:33d1:b0:539:f705:dbb3 with SMTP id
 2adb3069b0e04-53b348cf8f2mr10996236e87.23.1730406546818; Thu, 31 Oct 2024
 13:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241030050745.3702603-1-hongxu.jia@windriver.com> <20241030050745.3702603-3-hongxu.jia@windriver.com>
In-Reply-To: <20241030050745.3702603-3-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 31 Oct 2024 14:28:54 -0600
Message-ID: <CAJdd5Ga-mzknMqXX_sNt0Yr2cbVe=qbA7BDoA19GQa6_vs8xGg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/6] meta/lib/oe/sbom30.py: correct typo
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 20:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206590

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Oct 29, 2024 at 11:07=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> The isinstance expected 2 arguments
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sbom30.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 8db90f30fd..e3a9428668 100644
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

