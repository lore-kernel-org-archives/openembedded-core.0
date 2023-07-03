Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E02EB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 16:02:32 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.37292.1688400147019686354
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jul 2023 09:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XWdBAQKg;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-563439ea4a2so3012207eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 09:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688400146; x=1690992146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hliqk+XPE9dUje34awq9sj3AvSi42xWe4tdhXXPVrgo=;
        b=XWdBAQKgEFZvvlpuZp7elhqv8b2FenzKhraHQfIuRm2urhNJHg8mKoikZD6MtC9VJv
         jtGAcpbGzSUPYXmFTyeHQN0zu10YKf29/Ws5s0sXXHxVSsFPT+FVZe6JYoPrFFpISSoM
         RqaLITy2+/y2hHX9Md6lS5a53mwNTSQdW80Qhy1dwb8Dv/gbx9rFR81Pjuk0/c4a1ThS
         HM8uHvkTKRAUjc0L2Kdvt85pJ9iDvz9vimriZtlbApGZITOC9hrsP8YDdGScn6ye8/a+
         BJwvIYs4abRwSQvXjrwY2LZSXj2jRYx5QH47XX92bfDOpnCnb1LFV8tYPN3LMeWCThHB
         9Nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688400146; x=1690992146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hliqk+XPE9dUje34awq9sj3AvSi42xWe4tdhXXPVrgo=;
        b=IoEtqXGLYMEukUz7Jtba3TLHsIk9O1hvd5M9Q4Vg2HM5PVlyTkw4rZmtfOdjtdkm3Q
         496EIb5EBsTiEcEX9BHBsx7db+TVPUeRL1rGb99XImzRjKcsRRWnItHzhplmBPlk7Jyv
         feDAO1zO+SoZ24aps6N0eunA+cUhzIY/AoPpNcf0dXq6U2qU1+D7ViaezdGoOTFxIdH0
         85hH8JJwDmEEtj9bYyHZuLDyrFqVmMmdLdbLpSpUPTvU210bqH4fu6NXKB6+awVkv8lP
         hyuNqCMuUycyrW41A4+PHWSMazdHX3kOJIZgNOS4TbKRQYMDp4fUwqRIhfOLTEwu87Tu
         JTBw==
X-Gm-Message-State: AC+VfDzPKCShQMiMfXod4kkyIWDpYy74TRzy91kry8fl6z+I67jta9wO
	N1g4182JUwZWuDiHi3YYT2p9fr7fcPzCWOwFMqQ=
X-Google-Smtp-Source: ACHHUZ6vzUeATUFX/8pFAcQaRLj7sAdpan2jI4rFgYgRooLmNtbT0bO9S8AmL+AdhvExYcHVR4pNZE2JwmbCjMpaG94=
X-Received: by 2002:a4a:4149:0:b0:565:93f9:bf97 with SMTP id
 x70-20020a4a4149000000b0056593f9bf97mr7952190ooa.4.1688400146059; Mon, 03 Jul
 2023 09:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230703085205.3129883-1-tim.orling@konsulko.com>
In-Reply-To: <20230703085205.3129883-1-tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Jul 2023 09:01:59 -0700
Message-ID: <CAMKF1src8RpbDRkUw_Zq5o+rsQZj4vz2CN64WSQCOa9En6mogA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-urllib3: upgrade 2.0.2 -> 2.0.3
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 16:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183807

On Mon, Jul 3, 2023 at 1:52=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wrot=
e:
>
> https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#203-2023-06-07
>
> * Allowed alternative SSL libraries such as LibreSSL, while still issuing=
 a
>   warning as we cannot help users facing issues with implementations othe=
r
>   than OpenSSL. (#3020)
> * Deprecated URLs which don't have an explicit scheme (#2950)
> * Fixed response decoding with Zstandard when compressed data is made of
>   several frames. (#3008)
> * Fixed assert_hostname=3DFalse to correctly skip hostname check. (#3051)
>

Thanks for this update, I have reverted the previous upgrade to 2.0.2
since several
recipes in meta-python started failing ptests. I will give this a shot
and see if that
improves the situation.

> License-Update: Removed outdated reference to CONTRIBUTORS.txt
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../{python3-urllib3_2.0.2.bb =3D> python3-urllib3_2.0.3.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-urllib3_2.0.2.bb =3D> pytho=
n3-urllib3_2.0.3.bb} (76%)
>
> diff --git a/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb b/meta=
/recipes-devtools/python/python3-urllib3_2.0.3.bb
> similarity index 76%
> rename from meta/recipes-devtools/python/python3-urllib3_2.0.2.bb
> rename to meta/recipes-devtools/python/python3-urllib3_2.0.3.bb
> index bc1cdb009f4..64b21db86d2 100644
> --- a/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb
> +++ b/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb
> @@ -1,9 +1,9 @@
>  SUMMARY =3D "Python HTTP library with thread-safe connection pooling, fi=
le post support, sanity friendly, and more"
>  HOMEPAGE =3D "https://github.com/shazow/urllib3"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dc2823cb995439c984fd62a973=
d79815c"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D52d273a3054ced561275d4d15=
260ecda"
>
> -SRC_URI[sha256sum] =3D "61717a1095d7e155cdb737ac7bb2f4324a858a1e2e6466f6=
d03ff630ca68d3cc"
> +SRC_URI[sha256sum] =3D "bee28b5e56addb8226c96f7f13ac28cb4c301dd5ea8a6ca1=
79c0b9835e032825"
>
>  inherit pypi python_hatchling
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183798): https://lists.openembedded.org/g/openembedde=
d-core/message/183798
> Mute This Topic: https://lists.openembedded.org/mt/99923355/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

