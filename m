Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FE8C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 21:37:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.43330.1640727419858703046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Dec 2021 13:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=cdlRbIgO;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id q16so40631576wrg.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Dec 2021 13:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OdetVrmykazynH3Cjc7pLRZ5etczN4QczHjeiGitEfo=;
        b=cdlRbIgOWxW65skNXxYQ4voiLurX4dL9gc0ZgsiK3fHrLKNAZPrIKzY7++rVUoUGK2
         x53WbABft8TkBcKGMqXt98KdmSNnUx+l8jcT/zsQJCJbuhG5VICmLtyTSlWy9jkLntgr
         qLuClM4O+2RpkTYsxclg8Tvjo0Qj6Ub/eFvrzc5nqPjT+KlIup5y/sWTVtYNn0ayf6D9
         p9bzTlEiOf+bRJe2vGtkebIl37cg+f23dXPX6INUbCqdnnLtCK7NwI3Ll/2g8JaMOEuZ
         TuwNiXRFFlLPfJpQmEr1c43okJJLmR5EMPx1LREQ2sDW2s1WzbmAetGcbSPPv2D56WlZ
         qzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OdetVrmykazynH3Cjc7pLRZ5etczN4QczHjeiGitEfo=;
        b=Lq4UzaVZ4tw3QamfFAEYS4BVZwi3mUIhwe49Sgx//MMwAOL5eGctb7OZC2o/jTgZrN
         qOcRWuK5QUieKdjPDFuczZMdX0XoplCenCpwFppX7vR2tqUbkbEdNjpPhSwaUck4ihXT
         1zD4J0rJA7bNyJqNoq6P0XnC/BEt+fWKC/ScVrCaKsjhzwdXMLZS5DeMR6sso9K89saN
         22VuKzMBgAvaXooryEkwC/SPy5DjGUYMFM7uYyIIBe4fCLc+I6djJMeoMGhmEhssGV9J
         lBk7mq8D0I1X7WGTimXJxLuaU84faYmGtvak3Avl0hVGtfWzajZwaviv6JpJwxmgtNgN
         Svbg==
X-Gm-Message-State: AOAM533pV2v6b1WM/3DpQo1v+yqrEWUQdCAfegE/c8QjVawcKMVZrx8J
	E3q5fGeo6e9YLEU+f/uR5L4QhXmFroUZxjFT7hSfhAIcetlONg==
X-Google-Smtp-Source: 
 ABdhPJxaOjOsQTitOCocQCBbiB/mlHjsP1cyHRdtzFo2ZMdIiL6kMiHGCt8xXRlXWNlmzgLwdcZDa5tsyN8/GgNRHI8=
X-Received: by 2002:adf:fc83:: with SMTP id g3mr17830109wrr.405.1640727417943;
 Tue, 28 Dec 2021 13:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20211216050914.90422-1-Qi.Chen@windriver.com>
In-Reply-To: <20211216050914.90422-1-Qi.Chen@windriver.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 28 Dec 2021 21:36:47 +0000
Message-ID: 
 <CAAnfSTus81TLunS18ghDnW_DsX+B01ziUk4m7yBMAKnbkso2wA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] core-image-tiny-initramfs: delete populate_sdk
 task
To: Chen Qi <qi.chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Dec 2021 21:37:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160039

On Thu, 16 Dec 2021 at 05:09, Chen Qi <Qi.Chen@windriver.com> wrote:
> Currently, if we do `bitbake core-image-tiny-initramfs' and then
> install the generated SDK, the following error appears.
>
>   tar: ./sysroots/core2-64-poky-linux/dev/console: Cannot mknod: Operation not permitted
>
> The populate_sdk task does not make much sense for this recipe and
> considering the fact the its SDK cannot be installed, we'd better just
> delete the task.

Feels to me that this is working around a problem instead of fixing the problem.

This happens for -tiny-initramfs because the root fs contains a
populated /dev tree, with device nodes in.  There is no hard
association between "has a static /dev" and "SDKs are meaningless", so
a better fix would be to remove /dev from the SDK entirely, instead of
removing SDKs from one image, when this is a general problem.

Ross

