Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040E3C83F34
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 01:42:13 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.3063.1752889327809560204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 18:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K693/wR9;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-710e344bbf9so25507877b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 18:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752889327; x=1753494127; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsSm27zLMyIVw4H1CQwmhHY9VX5dJ4F7QoPfnVvK51E=;
        b=K693/wR9i69uLELzv6oyLkw2w9oIIItjS5hFNYorlf8eEwKHgTaf3Rzllixfrb+XL+
         k2QC+UzmOIIFYWsNbHg/lLlOTSNs4HNAQc7oc88swwCJdOMEB2SFELLdZ+Xal0OU67pM
         l+2T/qjBkXN29BVZw3mrXtRBti3N7qz/TObTn66xTQzcHRDfNlF0MI9ptJEvZX9rBChK
         wYavoNXi9Rc+4j+N3DUCM5rmQShB1/hBaCklB07x7L3VoFio5RL17NIOGPpAsBtGKcQp
         Su5ZSmRAhr8xD2KCq+aQvx8yZ/Le3IWFoMQ5vY+9BMdVva+jNlYxbJM3taMp9G3FEXRi
         jujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752889327; x=1753494127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsSm27zLMyIVw4H1CQwmhHY9VX5dJ4F7QoPfnVvK51E=;
        b=vv90zaSiC0FlGtQ+zFi+zLNgGjVFmoKSk41zfMXemWq27JjimNwZ1RG39IEIhAGZN7
         HPYOC0FAoVsdsoJYcUEuThEmHhTZLfp1j5t5t5yslo2NGvKBeLIgWUutK13AsTh/5mbD
         VIw/AmOLJBaXnToXiDs4nGb1Msz9dJrI0H6Cid+PXgeIJcc018ITpLV2xl/T7I58724P
         +6pjZHI+kEtSLB+kLc+NGisgZKJ/1CjaMvJojTixjJ6FhyS3//qWMp8q96XA8u648iJP
         dj7Qa9XZbw+sOYM1MJrqvHOhX+1WAA75O/9wrO+EWCjGBqR0diDM3+tjNd1k1mspQL1T
         HJqQ==
X-Gm-Message-State: AOJu0Yz4KlXLrXEo9r2nZce6gJ2MqeFDo3Gx4wBe3KB7sxefWaD2ly5Z
	eTsAEnB6ABr42nGZxF5rngRgHtQCiEAAw4Fj2g5IeBXrbEIKH/n/ahZyUWPwqi/hnPkplVqCFWX
	XYhdwi1IqGcxXYaRiMQj18ndf5NJ4dCjbWhY0
X-Gm-Gg: ASbGncsKU012IFju026WfZlTiFwbvxXA3sydCLzSO2HhujfhCyPIuZSlfZNADr+fGj1
	mRoSVgoHjknbxadjeLZQ856un7qFzsMuF72BGxs2PYqsYx9U1Z4R3T86q6xURNqDqLBNmm1kbFC
	XkU6iYTLlJ2fXChGK8tln9zRLgnS4hczfMCsA/Ay9KSbjbprydAWiK7fkpu/9n7+wtM++y9cz8j
	AkWB8vEu/0Aa/fL
X-Google-Smtp-Source: AGHT+IEiFMN5QMcUfcXyEzWn06ywSuKHBAkae4h+wtyx3NNDgWF6bcNZh3ipB3Nuxeh6Rl9ij3reHPwdGGwfTHIvqT0=
X-Received: by 2002:a05:690c:6288:b0:719:4ef4:ff33 with SMTP id
 00721157ae682-7194ef51399mr70896437b3.21.1752889326557; Fri, 18 Jul 2025
 18:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250718151017.3153315-1-ross.burton@arm.com>
In-Reply-To: <20250718151017.3153315-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Jul 2025 18:41:40 -0700
X-Gm-Features: Ac12FXyluMXqY-M33cemvJlyahJ18ccrbCl7L3aJnSMKbQHwzoIXvYi2zSYLeBM
Message-ID: <CAMKF1so=FcHd4ioR6POqTc7VvK-LAxEpndWZBohomnqKtQtZFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] cmake: drop CCACHE_COMPILERCHECK
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Jul 2025 01:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220608

On Fri, Jul 18, 2025 at 8:10=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> This variable controls how ccache determines if the cache is valid or not
> for a given compiler.
>
> By default, ccache looks at the mtime of the compiler binary.
>

this may become interesting when compiler binary is used from sstate
built on another machine, it might be identical binary
but mtime maybe different.

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/ccache.bbclass | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> index 01e9816c706..5ce23e50f34 100644
> --- a/meta/classes/ccache.bbclass
> +++ b/meta/classes/ccache.bbclass
> @@ -42,9 +42,6 @@ CCACHE_NATIVE_RECIPES_ALLOWED ?=3D ""
>  # in different builds.
>  export CCACHE_BASEDIR ?=3D "${TMPDIR}"
>
> -# Used for sharing cache files after compiler is rebuilt
> -export CCACHE_COMPILERCHECK ?=3D "%compiler% -dumpspecs"
> -
>  export CCACHE_CONFIGPATH ?=3D "${COREBASE}/meta/conf/ccache.conf"
>
>  export CCACHE_DIR ?=3D "${CCACHE_TOP_DIR}/${MULTIMACH_TARGET_SYS}/${PN}"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220599): https://lists.openembedded.org/g/openembedde=
d-core/message/220599
> Mute This Topic: https://lists.openembedded.org/mt/114222596/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

