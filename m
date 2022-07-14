Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85273C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:42:49 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.4113.1657773766650417471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iPLx4mFa;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id oy13so1322360ejb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l6+Bgbs18p/5z5HdV7F6IxlAnJn3JlkCoxeYAuqwQ+o=;
        b=iPLx4mFaE7u8Lycvwq7DpO1OJUFK55Ms0kQYTqHZP9jCGnje3Oy3fWUNo2h33yWcAY
         j9MEDqkPosFIR4WCmX5EnXhSFklnLO8iIX4h8P4NFblu3L2YiUMCojo2fKikNsP2X/pO
         R2vSSL3dWOdG0G7e9/mocyuaCAnlp3bBfu0myN1fzCDGs21xNKfc6JuX5D/XLwcRQGTb
         2B/UiVIfJzI1qA2TrCcr18m27cO7l8+zzwrCW3gseEXrEqDTgSwIpX9HA7+qauA56C6y
         Mim1AU7e1vw67oai3kkRiEqHyCSvz39BS3aZS7MttG596++OcDVWME+McbCIoM1TqogF
         fpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l6+Bgbs18p/5z5HdV7F6IxlAnJn3JlkCoxeYAuqwQ+o=;
        b=ZpzyL4HPFK0JusqgJiGPKmmliqVmGdyiAW4XkrjdBEFMrshmfe96kXgWzs9WsQGtPY
         khmCpw6a1pGGNtpdocaiqEpooF3SYRE6W5Jsvik3w8FqzIDsqSRa1IEEYMfk+LhJNWKr
         OC6uC/aLg5KpxXgaSBtz7Y0XOP70ZaOA3gxJaT4nC8ZDblZ8s9bVGvFxadndRUoHnwqf
         YZsZjHlvLozzTVoQ19VKYKzmU7YXZqlImAM9T5Ds7w0ZKPydp/v3Smz2S4h1neXm/M5l
         zKPBeqj4oGrWXGd6HWX4tTQZCoaPopEOjm6Mh/4cUCaF0+o4COg4VyxhgHe5UGbd61l/
         ZXxQ==
X-Gm-Message-State: AJIora+kBfQDe2K1snga5tGfdfK2k3N7m/g+f3N0Dqc0GNra8vIkcQ4c
	QylbEOf68KzaD9K1XU2+6WEUW0oQ1MC+nYbJLlDsQw==
X-Google-Smtp-Source: 
 AGRyM1ufTonyC1QL3mIomrcJpb81r944bfFUUDsCS1aEwY1979Q4g9U6rXOc/h1vBo36MlZyD8+X06NwYcDlYLC6sBA=
X-Received: by 2002:a17:907:6d8b:b0:72b:5f51:a9e7 with SMTP id
 sb11-20020a1709076d8b00b0072b5f51a9e7mr7007028ejc.628.1657773764580; Wed, 13
 Jul 2022 21:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657772638.git.steve@sakoman.com>
 <17019818268B4DB5.31059@lists.openembedded.org>
In-Reply-To: <17019818268B4DB5.31059@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 13 Jul 2022 18:42:32 -1000
Message-ID: 
 <CAOSpxdad4+XpE-kWSbuWYu8YptOx-nDFthiuEPUcyBrx+dMpkw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 01/27] ruby: add PACKAGECONFIG for capstone
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:42:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168025

At this point I've only seen this on kirkstone, but I suspect it is
only a matter of time before we see it on master too. So we should
probably consider this for master too.

Steve

On Wed, Jul 13, 2022 at 6:36 PM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Autobuilder workers were non-deterministically enabling capstone
> depending on whether the worker had libcapstone installed.
>
> Add PACKAGECONFIG for capstone with default off, since ruby does not
> require capstone support.
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-devtools/ruby/ruby_3.1.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/ruby/ruby_3.1.2.bb b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
> index 38ba46731b..6fc1f53b18 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.1.2.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
> @@ -25,6 +25,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
>  # rdoc is off by default due to non-reproducibility reported in
>  # https://bugs.ruby-lang.org/issues/18456
>  PACKAGECONFIG[rdoc] = "--enable-install-rdoc,--disable-install-rdoc,"
> +PACKAGECONFIG[capstone] = "--with-capstone=yes, --with-capstone=no"
>
>  EXTRA_OECONF = "\
>      --disable-versioned-paths \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167998): https://lists.openembedded.org/g/openembedded-core/message/167998
> Mute This Topic: https://lists.openembedded.org/mt/92373433/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

