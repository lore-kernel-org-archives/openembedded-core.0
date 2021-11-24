Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA4AC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:22:43 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.113.1637767362126954754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TMwbLalq;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id r11so12026247edd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZK/VczQbnbgivHxpmlS/Z7W8BrbgQNn9zEvkgLGe670=;
        b=TMwbLalqRdVEth+VElGh9eE8P3ztpRB6e/vNZzg+ODm+aihhjJcL5Mx0hsw0Mteb07
         HH0G/sYgOzmhdK5iVwCdmDJrr5BS3XsixRGQEVtFuChB/s/yu+3fkXLJWPuXQU2wqAIa
         0x7q/IGJ/slrWIo5Fi65Z6U2znOyTxyf2RG0ea6+WjqhfY/6JDNbXuKF9LQuO3/wOmze
         sV5/lq3LHoBuGXscwB3V4xtNytTgUhRz+85+S4EKae92sL5bCJD0ABBwzOj7NjzwRHpX
         joIav7queO1QIwIE21zqU+rQ3daHFdH49spSJTlVOpaFxGbBhIHfU/IdakVtBh0/nO8F
         3o4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZK/VczQbnbgivHxpmlS/Z7W8BrbgQNn9zEvkgLGe670=;
        b=Cqjl3AyKDHKHG8OCqlcB+IWJ7/Cn/qWTd1lHm1KOOOyyfwseFsLTLrtSKVO9VpH7jS
         QMhe5ywWSFncF/ABYqR0UAFQQO0KklLiZ24z81kle2winP8O0G79QikEIH+/fB5r1S+g
         vtSK57NB/OqqS4Ot30LtAXz9be3nUTm9UW5qlvym8n42K0bv6fatEHJ97BVNCPFghpEg
         ojjwCthTPyVl3JmpZrmQDpw9Sou+3Ac7kM8TQyx1ofCUw9801kAKfwLvGqT9xVYfc0k5
         KyK/09ngmd11xpHPGrHPZF8SgDUX4KISEt7A2Pn420WXNJt/2j0EgwZ35Z6SB33CIZFE
         QguQ==
X-Gm-Message-State: AOAM530T60IaAPmYrQWDui/oZM+7GssLrAl4cxGzImAlwvSoLwpqskoI
	s5eOJev75OPLrTbdPzSzkuNuj0LBSBkiVjXpBIQ=
X-Google-Smtp-Source: 
 ABdhPJz/mpjNdhB0/3bcjfMC0o/+xmr7l1XVm2ezFnruRIZt3a1XZcRaPtycPJP2vn8NqypVOPyKig5EPuFO2lq0GSo=
X-Received: by 2002:a17:906:314e:: with SMTP id
 e14mr21451075eje.165.1637767360348;
 Wed, 24 Nov 2021 07:22:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
 <b3ce9655ef17f09c39e374d234cd494580f92674.1637703810.git.bruce.ashfield@gmail.com>
In-Reply-To: 
 <b3ce9655ef17f09c39e374d234cd494580f92674.1637703810.git.bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Nov 2021 10:22:29 -0500
Message-ID: 
 <CADkTA4OBDxSPK4LzoX4HzCj3BQiLxycMMcOF1RVwK+eNH4qwCw@mail.gmail.com>
Subject: Re: [PATCH 18/20] linux-yocto-dev: introduce dt-validation
 PACKAGECONFIG
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Tim Orling <TicoTimo@gmail.com>,
 Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 15:22:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158719

On Tue, Nov 23, 2021 at 4:58 PM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Add a PACKAGECONFIG to control which type of dt-validation
> is installed (full, or wrapped).
>
> This is currently in linux-yocto-dev, as 5.16 introduces
> the functionality of required dt schema validation.
>
> Other v5.16 providing recipes can use the base functionality
> as they desire (with or without PACKAGECONFIG).
>
> Over time, we can migrate the support the the core
> kernel classes .. in particular when more providers are at
> v5.16+
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index ed94ab2517..858772ba41 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -39,8 +39,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>  DEPENDS += "openssl-native util-linux-native"
>  DEPENDS += "gmp-native libmpc-native"
> -# yaml and dtschema are required for 5.16+ device tree validation
> -DEPENDS += "libyaml-native python3-dtschema-native"
> +
> +# yaml and dtschema are required for 5.16+ device tree validation, libyaml is checked
> +# via pkgconfig, so must always be present, but we can wrap the others to make them
> +# conditional
> +DEPENDS += "libyaml-native"
> +
> +PACKAGECONFIG ??= ""
> +DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', 'python3-dtschema-native', 'python3-dtschema-wrapper-native', d)}"

In my recently updated master, I get the QA warning:

WARNING: linux-yocto-dev-5.16++gitAUTOINC+ac97e62b64_c425b06bc1-r0
do_configure: QA Issue: linux-yocto-dev: invalid PACKAGECONFIG:
dt-validation [invalid-packageconfig]

I can re-work this to use PACKAGECONFIG's rdepends for the full
validation case, and test and add the wrapper rdepends in the
no-validation case, alternatively, I could add a
"dt-validation-inhibit" PACKAGECONFIG, and put the rdepends on the
wrappers there.

I'm open to either, and will pick the first fow now :D

Bruce

>
>  COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
>
> --
> 2.19.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

