Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F850C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 23:01:38 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.3918.1639004496887352979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 15:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fVYMqHUy;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id bu11so3665497qvb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 15:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=krXbl4uIITZQpC/zynTEUH7K+m6Bvw+buej5NaFFIbk=;
        b=fVYMqHUyvrnTDkdHFIVMtYUWroc57JFYPziLNjnvIQHTKpUp4kPfiKNzlkogdQHkAG
         LxSVcglWMAXayYvzlEmqxf6tfUEI3wR8AIjvcxMmNJYepUXoWxSXUmYpiBnmGoll+OdE
         UM6djJ+VkwGHyZuUrjvXNRJ+SWdHLe0ISfwAJ8gddZcRuiZQWyPajLq9QWvElfMB+wVE
         KurNqLPyw2YywyXohdN5vkW1E5GI6MAtoT17sSy2gRUEogbFMY82BuJv/pRRv588StD6
         OsJC4HjVKDwNHYNyprHE/GbSQz2x7FqYWlQKwt6qWHPzijRQqehn9dbiX3Lq2i2MDeR2
         Qo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=krXbl4uIITZQpC/zynTEUH7K+m6Bvw+buej5NaFFIbk=;
        b=ddVSE0ouHGhPDHqL9WlvbzgchL62UgaGi+utEx0qFdwWHegmm8SR8ZnKSTXshvEcdU
         54PXQVDCuj/cuNhl35uORGkzqenKIrJrahND1sm6DeOfhIDletWBtnopdEjqZ5iZaEO2
         HXlPvgG18cmGvXjROT7zvlf5k1w3+aFD0kQd6Oybrk9M3PrLkCZEgoeCHXTuC2E2aTLC
         WLEiWaxCNWSl15jsDkZ7TA/9mbgKLPaRe37U4ohuxldMIEYFZ6GohZaITxPZzpz1eIwf
         3PS7BUCIo3EnM6eVa08gJ2Flbh1y3gHehiO/oCCt4jUIPmEq9vyXK4QmSpArvNYx7umg
         iYTw==
X-Gm-Message-State: AOAM5323nsFtk8Js7JKTxjecPNKbaTIT7pAVTD9DyXo40ivdnA80mEEZ
	TeLQtfLizSBO+14DVB91L6gHCx0JoNfJDgIHKh4=
X-Google-Smtp-Source: 
 ABdhPJzxCltcMffB06l2eQvO2y319xACFaqSINYzTbskdncioQWOzFA0cq+Bg5py/RoeTsSHc4Ff8UNWJ/bmEwY3LBE=
X-Received: by 2002:a05:6214:2429:: with SMTP id
 gy9mr11088503qvb.36.1639004496046;
 Wed, 08 Dec 2021 15:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20211208215947.1979470-1-alex@linutronix.de>
 <20211208215947.1979470-6-alex@linutronix.de>
In-Reply-To: <20211208215947.1979470-6-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Dec 2021 15:01:10 -0800
Message-ID: 
 <CAMKF1sqqgxwq+cV9t8MQG2v86FD0ajdx8+MQJd=+AAAiZwAK9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/29] ruby: update 3.0.2 -> 3.0.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 23:01:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159396

On Wed, Dec 8, 2021 at 2:00 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
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

perhaps not needed ?

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
> View/Reply Online (#159372): https://lists.openembedded.org/g/openembedded-core/message/159372
> Mute This Topic: https://lists.openembedded.org/mt/87599632/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

