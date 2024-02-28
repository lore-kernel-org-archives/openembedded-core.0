Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73616C54E41
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 09:51:53 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.9888.1709113911098704823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 01:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DqIrbigK;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d27fef509eso50999271fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 01:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709113909; x=1709718709; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=efUEJ2/8sZGuadKrgxFIGpcrPhENgeCZ0D599X2ZNw8=;
        b=DqIrbigKMJXzAj7VNll6SutgdqoBZVErZPG9QN+poxMga+aygnV90CJNcQrtFlU4fU
         Iz7cq7J9Y8ligGgqYw5XR+iDOZWSPgGdeDLv49/dPCahOX9PGpkbXjq1abzehmBb7djH
         N9OVOuShfQEjk5WHvVw/pe36GGAacHYosc2z7gNPJnOUrHj05R7iifl00bA0yQBtD0wn
         a9REK044w2CBj3fJQvGPRzwjjfJuWIyZOCLczd1mJKKS2aFMSxilxicCejdqW6CwiFDr
         6/zdCeWoRfG9S6FDcKXtvcAv/nd+fj/WDL5P2WEu4DFajF5ZIsGyrbL9L2c7b8BiEdMW
         L4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709113909; x=1709718709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efUEJ2/8sZGuadKrgxFIGpcrPhENgeCZ0D599X2ZNw8=;
        b=QTeiFmvnH5OR/gpBxn4BCapLWDlErUjmbP1VGSrjHnGXUhqefrD6ewfWSXI/X9PBsn
         f55AB/UlYYf07YXDnJQqI0uAVEPkpjNSsS6W3QY3gUIEL2525ZClGY3LzFfp3HvmIZjy
         Q7T1a3utjjP9XJV/e417Hl6WZqS1+zw/sG/82OylqHed63wmvLj45IKuXNzSPHufPxsH
         8uXkHIrAZti7EV9bVN3BdW7rS5xzvIOBTKsjA/y3SC32oWKU7bBTmE8C305R6B6ub9nL
         d7F4cuwSTZ9ih3oWfEsqnCmv4ErkQCABZv6Ozkl2LMH6Nc6Q7afIFiGIn7o8VQkYaYaH
         VM1w==
X-Gm-Message-State: AOJu0YzgH+YeuPPSL5fyha0Y08xWZJwzFPTM6jNaw4IhyJE+wdkyaBAT
	fq6m45AwyyRXaeDD2d0L5dikIEHHQ/U8Lq1TiMpP2waS62GgD6bX63zHoMzpVUoQ+NFYpaFbIBj
	d1ETs3j8WD52IsLeO5vUZKnPEAko=
X-Google-Smtp-Source: AGHT+IE5xcHaVx4IItt95IQnTbzt7dvsu/qmCin6nD7JJ/7z40hVOJvTybLHhCBq200swRjx0Ff3KAhNM8B+V8MaQcQ=
X-Received: by 2002:a2e:9982:0:b0:2d2:a3ae:b339 with SMTP id
 w2-20020a2e9982000000b002d2a3aeb339mr2471888lji.48.1709113909094; Wed, 28 Feb
 2024 01:51:49 -0800 (PST)
MIME-Version: 1.0
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Feb 2024 10:51:37 +0100
Message-ID: <CANNYZj_6rGajat649zKai4=OWfne8ZCqmoK4COSLkryM24X4Wg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/48] bash-completion: upgrade 2.11 -> 2.12.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 09:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196381

Thank you for sending these patchsets regularly, it's much
appreciated. We struggle to keep up with upstream releases, and this
work helps a lot.

Alex

On Wed, 28 Feb 2024 at 08:33, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update:
>  docs(COPYING): use unmodified upstream license file
>
> Changelog:
>  https://github.com/scop/bash-completion/releases/tag/2.12.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{bash-completion_2.11.bb => bash-completion_2.12.0.bb}   | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/bash-completion/{bash-completion_2.11.bb => bash-completion_2.12.0.bb} (83%)
>
> diff --git a/meta/recipes-support/bash-completion/bash-completion_2.11.bb b/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb
> similarity index 83%
> rename from meta/recipes-support/bash-completion/bash-completion_2.11.bb
> rename to meta/recipes-support/bash-completion/bash-completion_2.12.0.bb
> index 19bc81619f..66f65f565c 100644
> --- a/meta/recipes-support/bash-completion/bash-completion_2.11.bb
> +++ b/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb
> @@ -8,14 +8,13 @@ HOMEPAGE = "https://github.com/scop/bash-completion"
>  BUGTRACKER = "https://github.com/scop/bash-completion/issues"
>
>  LICENSE = "GPL-2.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  SECTION = "console/utils"
>
>  SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
>
> -SRC_URI[md5sum] = "2514c6772d0de6254758b98c53f91861"
> -SRC_URI[sha256sum] = "73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0daf911ac"
> +SRC_URI[sha256sum] = "3eb05b1783c339ef59ed576afb0f678fa4ef49a6de8a696397df3148f8345af9"
>  GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
>
>  PARALLEL_MAKE = ""
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196327): https://lists.openembedded.org/g/openembedded-core/message/196327
> Mute This Topic: https://lists.openembedded.org/mt/104619601/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

