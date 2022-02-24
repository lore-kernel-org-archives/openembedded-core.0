Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8CAC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 11:55:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.9313.1645703702705442924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 03:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DjhXrTWe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 l2-20020a7bc342000000b0037fa585de26so3537244wmj.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 03:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=oB9Kpblq+ZOXxQB1i78qYJoytrStI1g+WpPzEdJ39xw=;
        b=DjhXrTWeOP/+V6TIC/i18bDkJakxf3sXMM/Ge6PfBNked8FJfphRvuPAoMRgcFBCKh
         XvdsRETY6hklgwGzV+Np+IFfXK9Y4XPOOH52698cQfIa327adM2qT8uN7+0+WbWtlmia
         QsxSCrbyG5nvD57OKS8VKTBnnKiX4KXiVRdYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oB9Kpblq+ZOXxQB1i78qYJoytrStI1g+WpPzEdJ39xw=;
        b=gHUk8q7/SxI2ch3choLNt+pV7rI8ESQcC55T0NzJZ9XqKdtM/+v3ea9OoVVEwj+AI8
         JRtGm+y0ssh4RVh/GuVyH5iCMpIcPbeMYLLZ+RMXTEeUo791gDGUiEZFiCvGxsh1HI4O
         HysNntqcjupqRoBHhbPHPJS51S9cShP10ngf0XVOgVUOqKqh99q+ePzzQP6dEcGGko01
         ng84RK8I0jzJVOPFManctpN32MKM36TYFvWO5ac3IYmGsMpgFexWH03k6VnVs/hkzo4B
         s47JAKjPNiagaoCP7eHiodhOKlwJGuEU+qAJFo9fiqcz/FXFHAEgIvxchHZbNLyayI5n
         5ZbA==
X-Gm-Message-State: AOAM5329eBAISvIMc9hyXAdFJiHUTNMa47i/AQNf7i9LokIMAZAg1Ekk
	zSAcD/P1XJ4WMevA2mmaFLASHw==
X-Google-Smtp-Source: 
 ABdhPJycPbR4a/yeUZbP3xYp2GVjFqFWZblNIyXkgX6qTe025DtEOSve5tZq5ymuxj5jkjO7L3TFlQ==
X-Received: by 2002:a1c:a7ca:0:b0:380:e40f:c31a with SMTP id
 q193-20020a1ca7ca000000b00380e40fc31amr2004386wme.85.1645703701097;
        Thu, 24 Feb 2022 03:55:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3d62:f765:e1dc:ad89?
 ([2001:8b0:aba:5f3c:3d62:f765:e1dc:ad89])
        by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b00352cdcdd7b2sm12103140wmq.0.2022.02.24.03.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 03:55:00 -0800 (PST)
Message-ID: 
 <dfc93e2a7babc42e49a6c12dc1b997b388582e2a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libsecret: upgrade 0.20.4 -> 0.20.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Thu, 24 Feb 2022 11:54:59 +0000
In-Reply-To: <1645616774-28994-1-git-send-email-wangmy@fujitsu.com>
References: <1645616774-28994-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 11:55:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162308

On Wed, 2022-02-23 at 19:46 +0800, wangmy wrote:
> determinism.patch
> removed since it's included in 0.20.5
> 
> Changelog:
> =========
>  * Drop autotools-based build [!44]
>  * Use G_GNUC_NULL_TERMINATED where appropriate [!65]
>  * collection, methods, prompt: Port to GTask [!66, !93]
>  * Detect local storage in snaps in the same way as flatpaks [!67]
>  * Add bash-completion for secret-tool [!70, #50, !72]
>  * secret-tool: Add locking capabilities to secret tool [#28, !75]
>  * secret-file-backend: Avoid closing the same file descriptor twice [!78]
>  * Add support for TPM2 based secret storage [!83, !90, !95]
>  * Create default collection after DBus.Error.UnknownObject [!94]
>  * Port documentation to gi-docgen [!101]
>  * GI annotation and documentation fixes [!63, !64, !102, !103, #66]
>  * Build fixes [#54, !62, !68, #59, !73, !77, !82, !84, !85, !88]
>  * Updated translations
> 

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/2653

There is an issue with the documentation changes here.

Cheers,

Richard


