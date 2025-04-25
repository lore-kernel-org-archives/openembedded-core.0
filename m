Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C1CC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 16:43:01 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.10934.1745599372274439180
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 09:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RV7uExSq;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8fce04655so25740606d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 09:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745599371; x=1746204171; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLbhC15j4jXuHq8tNf7UlMy5P5SS+W9W0elF3H4xzEo=;
        b=RV7uExSq3je+hIPwhR+sqTHhoTSydOIMGRuSDb2M9uVq839wDanH0NAsEExFpYwPDA
         iorGDeKeaZ7BzfXIo3HyfqniJpk5RuSz7NEmD9y7+GkkPTr0HLhXQT7WdGeEixM7h/GY
         BLLlDQoSfSUhLIpWbGp/l9yVl10e083UW5/F5ITaCH3guqu0JvZBibrhCTf+YWSIaWZe
         7qUNzhu40jbSOniwiZexa4QfOkC62CJVCdkw+6Hps/ENE2HGDIEAzeYBX2xKIe8xVVVJ
         ab6T5SXcA4n9VJlhZzp6zr/gnxk0t3K6gJ7/LjEoo09p0l5B1MHeFqLP9nTnYYez76j9
         kjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745599371; x=1746204171;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLbhC15j4jXuHq8tNf7UlMy5P5SS+W9W0elF3H4xzEo=;
        b=bZk93A94hqwmL61amU/dOZ2SZGYeAtPYC1XNMfEQyr/n0hTFdSeQIWVUJBIoQ8njGH
         wPo56SpO1CLfrh6Tz7ZMAlMazUGYohHwIbQ7DixCGvYLoFm48fY3WbyKobbi+/R5q8Qw
         F+8ZZyJEcNmzyEu/rTCGmDVh4eEsLoAjQtF74Q473UyzYazDYkpSPtd+5ovT8Ow5u3vW
         ZGRPM4Y8ob9aEKg91jVDKZ1nGwU95Wvj2l7vuSEePEUS42bP4bzMDSjHP4VyM9MewJjW
         G1L0ZgLBUp8uuSE70dLHtWG2LABozzm57Uo8KEv4ccbXuiK/ME9jzIQZgozGJAHXqV/L
         4eIw==
X-Gm-Message-State: AOJu0YzL6hSBf5b4us/JEEo7vNrq6mv9KZRQp0A7/82qMFdHE2dku7CI
	FRMAjQKn0lo10WzfmJtG5yfW2Lv9BPEDfxGY1aDzt1gXU9VSAa6/
X-Gm-Gg: ASbGncviGVpvZDY6CNuQYUMCMLz29R5ud2uw+PnpKXZwrfxajCGCSYdKjmq39U2f4W6
	xlNVFBKvAMc37zTeMESrSxZSKY/cpamf6xwcdb2udly9BOl3OX0Xn5zRLIDuNt1s6sgZrlTtlVz
	NNqBGOoT/l4j8GN3B/1gAOhJzokqx4ugXbwDfzMtc0s2/C3XYE7/G7m2its0qd6g/gkDetOU6wW
	2N3B901vCXULex664mnxUf7oaH6dAye8rTNAsH1dk7rXWWxRIxsXbzVVEsIT3C+Q0826GrzhZFH
	nk83qQkLC71UsPP8722j2Px9p8NxGpAfz13jHGVCK8lTSxCzbsojDh/5ZWINZm7NkFCm
X-Google-Smtp-Source: AGHT+IHW3KzsT0MuJOT5wdl3Xa5zsSU5eTA/OTWvRZxwIQZfKoCk1hJnY1L8ejmXUQLOfKgl5g0Paw==
X-Received: by 2002:ad4:5dea:0:b0:6e8:fbb7:6764 with SMTP id 6a1803df08f44-6f4cba64508mr53634166d6.45.1745599371131;
        Fri, 25 Apr 2025 09:42:51 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0ad4382sm23840086d6.125.2025.04.25.09.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:42:48 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:42:46 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] systemd-systemctl-native: disable meson's
 auto-features
Message-ID: <20250425164246.GA554@localhost>
References: <20250423135226.5535-1-twoerner@gmail.com>
 <CANNYZj-qO0jngKgSDGoUSsCsFvafJJgq_Q611HCAZcf-oVTH2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANNYZj-qO0jngKgSDGoUSsCsFvafJJgq_Q611HCAZcf-oVTH2Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 16:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215484

On Wed 2025-04-23 @ 05:00:42 PM, Alexander Kanavin wrote:
> This sounds like something that should be in meson.bbclass, rather
> than one specific recipe?

As an experiment I moved the --auto-features=disabled flag to the
meson.bbclass. Unsurprisingly when doing a world build of oe-core a bunch of
additional recipes fail. Surprisingly the list is not as long as I would have
thought:
	gconf (+native)
	efivar
	libfm
	consolekit
	cairo (+native)
	pulseaudio

I'm working through the list to discover which features are being
auto-detected rather than explicitly set. For each feature I'm adding a
PACKAGECONFIG, then enabling it by default.

If I can get through the above list successfully then I'll have a v2 to send.
Realistically I should do the same exercise with meta-oe before sending a v2.

> Alex
> 
> On Wed, 23 Apr 2025 at 15:52, Trevor Woerner via
> lists.openembedded.org <twoerner=gmail.com@lists.openembedded.org>
> wrote:
> >
> > Disable meson's ability to analyze the entire host's system to determine which
> > features to enable. Which features are enabled should be limited to the
> > features that are explicitly enabled, not simply discovered.
> >
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb b/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
> > index 041a040a2654..591a1747d63a 100644
> > --- a/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
> > +++ b/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
> > @@ -8,7 +8,7 @@ inherit pkgconfig meson native
> >
> >  MESON_TARGET = "systemctl:executable"
> >  MESON_INSTALL_TAGS = "systemctl"
> > -EXTRA_OEMESON += "-Dlink-systemctl-shared=false"
> > +EXTRA_OEMESON += "-Dlink-systemctl-shared=false --auto-features=disabled"
> >
> >  # Systemctl is supposed to operate on target, but the target sysroot is not
> >  # determined at run-time, but rather set during configure
> > --
> > 2.44.0.501.g19981daefd7c
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#215309): https://lists.openembedded.org/g/openembedded-core/message/215309
> > Mute This Topic: https://lists.openembedded.org/mt/112414248/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

