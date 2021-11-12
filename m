Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B4BC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 01:36:00 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.9395.1636680958766766438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 17:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o3gqn5pd;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id t34so7090711qtc.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 17:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uuojpb+p0WCg2VwCYYp5DcOnH8TLEhRPxKORxOha0tc=;
        b=o3gqn5pdGOFu/Tw/GHnI+Alc4FWwfsdlGGJOzsw/G4uqmYQ8/PolM2qaZatMcHiLb+
         6Oyokh2ATM+vukDI7otgNQb4TKb0zWHmt+AjHdLIYL679ZHiENvOQwG6J9nPonIk27Ox
         3qnDpDVUD7UIsNTXIfCzwEbUbjatwQp0NYoVjCIxVBm4h54L2B/G7XhCp/JxIniaIsG6
         ffffGHJPB+n+wdWflain3SZpphVWtyWkJ7nMU0PSCm+Nn1UyLYbxdYRtTWY9i4oLad5r
         NyxGEJE2zp2IhBcsH8TKuDIDBaNUMKaNCJFoWBZIDxYhxL2QoON5yzOEEM41QzDDjmGt
         cfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uuojpb+p0WCg2VwCYYp5DcOnH8TLEhRPxKORxOha0tc=;
        b=dJMoKqi1D/ydpfv6Sqe93rP44peAy9yRTOnwXQcx4kj0TkSmcX5rHXyOPBnUqI68Um
         mReVohAaaaZzqj/DBPlNBrb+Pf6OjL1ae83mAVib4LRPvMjdM+nIYBgb5lPF9NyfDZl6
         9dJbVXDwbIrpc5Jc+0zhwL3PmxLjudT+A2Y/KDgR+9XWtr90bK6l0KScgcMgpL8Q5AXZ
         ps3Ivi7O7u8VdCcexPbUgAgeUDV+TNFGn+KxHUB9wsaF5YvRmzwi8hk6X11SpliHh0zF
         Cc/co5ny82DDd2RGKqJzO1+aklawOoMs+NZTNx9+gDs7c9Kyf+BZhDL5FFxCxUtsiHRJ
         VmdA==
X-Gm-Message-State: AOAM532xrdqxXutdfU6oW8VDD5gcEDQUOmYTR0nARLob61UcUnkmhqUW
	VMm2uYseyBYVJSvnobyGnpLvrCl+wI2c4S9XhlE=
X-Google-Smtp-Source: 
 ABdhPJy0qBb9XyYlogeOJAm9+0BGJtRxCnL79Xa2/qAWMqIxANsffISOBVzGET+sMOLk+DqyETtRw6baVFOIgUMs3sY=
X-Received: by 2002:ac8:4e41:: with SMTP id e1mr2551457qtw.116.1636680957829;
 Thu, 11 Nov 2021 17:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20211027090736.2546759-1-alex@linutronix.de>
 <20211027090736.2546759-29-alex@linutronix.de>
In-Reply-To: <20211027090736.2546759-29-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Nov 2021 17:35:31 -0800
Message-ID: 
 <CAMKF1spjC7iPSOfZwoC2Tw1hFTfz18J-grBbmnB2ow+kKkkFow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 29/30] gstreamer1.0-python: do not supply
 unknown g-i options
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 01:36:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158204

On Wed, Oct 27, 2021 at 2:08 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> meson 0.60 turns unknown options into them hard errors, so instead of relying on g-i class
> (where the options are mandatory) add g-i dependencies explicitly.
>

This patch is not needed after merging

https://lists.openembedded.org/g/openembedded-core/topic/patch/86997027?p=,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,86997027,previd=1636678766912195299,nextid=1636633780004461498&previd=1636678766912195299&nextid=1636633780004461498

all we will need is

GIR_MESON_OPTION = ""

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../gstreamer/gstreamer1.0-python_1.18.5.bb          | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
> index 74dd15b3eb..a32805d129 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
> @@ -21,6 +21,14 @@ EXTRA_OEMESON += "-Dlibpython-dir=${libdir}"
>
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> -UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
>
> -inherit meson pkgconfig distutils3-base upstream-version-is-even gobject-introspection features_check
> +inherit meson pkgconfig distutils3-base upstream-version-is-even features_check
> +
> +# Generating introspection data depends on a combination of native and target
> +# introspection tools, and qemu to run the target tools.
> +DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native prelink-native"
> +
> +# Even though introspection is disabled on -native, gobject-introspection package is still
> +# needed for m4 macros.
> +DEPENDS:append:class-native = " gobject-introspection-native"
> +DEPENDS:append:class-nativesdk = " gobject-introspection-native"
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157505): https://lists.openembedded.org/g/openembedded-core/message/157505
> Mute This Topic: https://lists.openembedded.org/mt/86623409/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

