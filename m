Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2785FC52D7C
	for <webhook@archiver.kernel.org>; Sun, 18 Aug 2024 13:55:50 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.189406.1723989342683007434
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Aug 2024 06:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hqXjwB2/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3718b5e9c4fso1639176f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Aug 2024 06:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723989341; x=1724594141; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJeVpa6lXVcgztIo8wI08gR9X8rr02j0QGKGj0MdWNA=;
        b=hqXjwB2/k8cKJ/xQn1SjDEfkWSfZ2kcvD0k2+14FSGASSUD9xqEW8hULxWkeEsamgy
         mj5WScSFHssMT4ZEimeW6hovz9P50KE6kcegK5g0tflytSB6qY1LhC9tDDJcDHKzZr/0
         nI1PP+THKeCvf8G1bhdcwHZLjO5SAKp6N8Um4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723989341; x=1724594141;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GJeVpa6lXVcgztIo8wI08gR9X8rr02j0QGKGj0MdWNA=;
        b=BFXOT4xkoxlE7CCjBZYkfRm+Abp7Bkmopb/cARp6pQud0kMQi0wRZFs7bnvSgU/fNj
         5dwkkVUWD37zhi2YuDUXwSNko8kFamT69gWRNqGgLgzsmeKy5sjmktbNYZsW2iSBpYIk
         TylKK95Ew7fiZMWQEZ7rUVUcmyELp3PylHFr8LqL+zg3y+54dTgbUQxW4HAspVIg7JrM
         cJpewAw9v9jA77jr5jW7t+hbK8/++pdwvEM/riHsiey2r4DMtLU87+EgA65SYUefe8xP
         ZqGU4iCiamEMyPapLyRb2jnnkpVzdspIpQFeGJObsj9SDE+hEKvOaqIP1Bq68b9R+io9
         lbug==
X-Forwarded-Encrypted: i=1; AJvYcCXkuY79BWGchYQoU7ohR4vT/uxiQwDWQJuBY1YQNp38tE/35AquDY0mABo8mQsPK+g0c8IAjbj86BUb+sX/T9BpD3i9Xa7b0pFw+F8xn2ng5/+6SLTwjR7g
X-Gm-Message-State: AOJu0YyxZ8Zcp3qUSkHajxCaMzvql7Lt7FcD/2+k4avp5HJQd6lovQh8
	R1TuNrpsbZWjFCZndrZ7/UfuHCrJUMOFEgH87m4u5g2T3tShJ168jGQDcdCWV+M=
X-Google-Smtp-Source: AGHT+IGS3P2APcU9jnc7KPPmFmpvbPJ6/mbpxmkcFJRJn6hnIWM9SHTmFZ6iIc1LYHZGY79jCuYkMw==
X-Received: by 2002:a5d:6449:0:b0:367:326b:f257 with SMTP id ffacd0b85a97d-3719465dde4mr4776819f8f.33.1723989340929;
        Sun, 18 Aug 2024 06:55:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:363:654:641:dbeb? ([2001:8b0:aba:5f3c:363:654:641:dbeb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189856b07sm8183745f8f.50.2024.08.18.06.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 06:55:39 -0700 (PDT)
Message-ID: <2cdeeae38c7481a74f4f3dc64cdd47694fe8a0d2.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] ovmf: upgrade edk2-stable202402 ->
 edk2-stable202405
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, openembedded-core@lists.openembedded.org
Date: Sun, 18 Aug 2024 14:55:38 +0100
In-Reply-To: <20240816154613.4030253-1-tgamblin@baylibre.com>
References: <20240816154613.4030253-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Aug 2024 13:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203482

On Fri, 2024-08-16 at 11:46 -0400, Trevor Gamblin via lists.openembedded.or=
g wrote:
> Changelog (https://github.com/tianocore/edk2/releases):
>=20
> New Features & Bug Fixes
> - SecurityPkg:Add EFI Device Authentication Signature Database and SPDM
> - CryptoPkg:add additional RSAES-OAEP crypto functions
> - OvmfPkg:Add 5-level paging support
> - OvmfPkg:SEV-SNP Support for running under an SVSM
> - OvmfPkg:RBP register shall be cleared in TDVMCALL
> - OvmfPkg:Harden #VC instruction emulation (CVE-2024-25742)
> - Add SPI bus driver stack
> - NetworkPkg: Predictable TCP ISNs
> - NetworkPkg: Use of a Weak PseudoRandom Number Generator
> - UefiCpuPkg: Add new SmmRelocationLib library
>=20
> Update Notes
> - NetworkPkg SECURITY PATCH CVE-2023-45237 requires the platform to
> =C2=A0 provide the right implementation of the EFI_RNG_PROTOCOL (i.e., us=
ing
> =C2=A0 a GUID that appears in the allowlist) and EFI_HASH2_PROTOCOL. If i=
t is
> =C2=A0 not implemented, the platform will lose the ability to do network
> =C2=A0 boot.
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> =C2=A0meta/recipes-core/ovmf/ovmf_git.bb | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)

I suspect this upgrade is the cause of these selftest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/7021/step=
s/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/7021/step=
s/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7078/step=
s/14/logs/stdio

Cheers,

Richard

