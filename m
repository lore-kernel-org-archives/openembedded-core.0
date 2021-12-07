Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C51C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 15:57:32 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.68631.1638892651121589820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 07:57:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AM8zTFIK;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id o17so14738564qtk.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 07:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YUcFLNZEhN/wW3s0H6WAvGdZZyUGyXRel7tH1RyrSlo=;
        b=AM8zTFIKzQrbJXxP1LtLA4sAE7rgdOo9+QSUmDbZKLMg9DK6n0lFkHxBjTxd0hjd9M
         OiX/uuAjxfGa8s3kLkBnoPRuXrFH4nHd4zrgIAiaDo8fGW1L18nYkGIkExpdaCjLhmKn
         JiVWJrz4487oKry2lV3tajXa2PrQWr1bxdtL1SdS36d0RJvikfGaH22QRLZtCi5xxYJG
         puIuDaaOW108/6FWvYUKzacNcJ7v8sh6qgC9T0ISKZid5HtBgtNhouLUxRTnlAI/x3+E
         iVi2YrHNo68M5DmUUOEwjNc8kH/QbcCLw7vhTBMXw2i1qcpYTMxo0oaIhPd7rxJdlwnK
         nSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YUcFLNZEhN/wW3s0H6WAvGdZZyUGyXRel7tH1RyrSlo=;
        b=N1ayjipC2bvTPoyrwt5Ya5F9/sBsLo2ihfDAQuAet6bsLRuj+XLwim3KqFXm6fzr1R
         ce7L3anb6vxXtN3iivoMU8QAXnlohwUyXv4PH5RDNUCGoPeQfNUwlciLyBwBeVxn1K0H
         c1X8dqZnq0QSgSp4AVD78935uzqAOujKJa57tEep9CgM3Syk2JOTTXZdyyJ5UIIghX60
         Yi3UAFs+ndodmkAHom93OFKk5T3YK4S6WA4XVwtuHK6PhI9RtfQoMxYC5orHHjk5FlM+
         OQ7oW0RD7eB66v6QSoPbzsE0vG1o2uxPs6mEi8Qhp1Fgli3ELp/8YlCHske5LOFi5+Sj
         4jOA==
X-Gm-Message-State: AOAM530bMQZUM5np/C6lJ0KXv1H9c9z9BKBRKjpUKRI7Q9uh9AdtYmeE
	KwhtkqX70RyAES+cOGxIwh8CKzswvrdqrU8tVq0=
X-Google-Smtp-Source: 
 ABdhPJxJhoJ+GK3/zxmGgFTkIh/F5J6u0cpB5CmkiXhTGc9Wz/z5u8DRoHWWhVL0fV3uXUdyjMPSAmJqMvZwTWSapvk=
X-Received: by 2002:aed:30a3:: with SMTP id 32mr49119975qtf.660.1638892650040;
 Tue, 07 Dec 2021 07:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20211207130703.3196805-1-alex@linutronix.de>
 <20211207130703.3196805-15-alex@linutronix.de>
In-Reply-To: <20211207130703.3196805-15-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Dec 2021 07:57:03 -0800
Message-ID: 
 <CAMKF1so8LTZALn5Fg_o=zKUL6+oBa+Hds0rf5eXH4Fj_ebjrbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/16] ruby: update 3.0.2 -> 3.0.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 15:57:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159310

On Tue, Dec 7, 2021 at 5:07 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Do not tweak a file that is no longer installed.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/ruby/{ruby_3.0.2.bb => ruby_3.0.3.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/ruby/{ruby_3.0.2.bb => ruby_3.0.3.bb} (93%)
>
> diff --git a/meta/recipes-devtools/ruby/ruby_3.0.2.bb b/meta/recipes-devtools/ruby/ruby_3.0.3.bb
> similarity index 93%
> rename from meta/recipes-devtools/ruby/ruby_3.0.2.bb
> rename to meta/recipes-devtools/ruby/ruby_3.0.3.bb
> index 2abf504d91..73bea9e089 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.0.3.bb
> @@ -13,7 +13,7 @@ SRC_URI += " \
>             file://0006-Make-gemspecs-reproducible.patch \
>             "
>
> -SRC_URI[sha256sum] = "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d98c3f2bc3bef7e6f1"
> +SRC_URI[sha256sum] = "3586861cb2df56970287f0fd83f274bd92058872d830d15570b36def7f1a92ac"
>
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> @@ -67,6 +67,7 @@ do_install:append:class-target () {
>  }
>
>  do_install_ptest () {
> +    set -x

I guess this is a remnant of debugging. Perhaps not needed here

>      cp -rf ${S}/test ${D}${PTEST_PATH}/
>
>      install -D ${S}/tool/test/runner.rb ${D}${PTEST_PATH}/tool/test/runner.rb
> @@ -83,8 +84,6 @@ do_install_ptest () {
>          -i ${D}${PTEST_PATH}/test/erb/test_erb_command.rb
>
>      cp -r ${S}/include ${D}/${libdir}/ruby/
> -    test_case_rb=`grep rubygems/test_case.rb ${B}/.installed.list`
> -    sed -i -e 's:../../../test/:../../../ptest/test/:g' ${D}/$test_case_rb
>  }
>
>  PACKAGES =+ "${PN}-ri-docs ${PN}-rdoc"
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159300): https://lists.openembedded.org/g/openembedded-core/message/159300
> Mute This Topic: https://lists.openembedded.org/mt/87564011/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

