Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.19169.1588494156756081138
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 01:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eEz+89KA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id d15so17130647wrx.3
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ir8It+DHYlfjzYMvbrlwO+HxfwrDECNeeGFgQSvirpM=;
        b=eEz+89KA7YrrWffdCP0DftWuwgPaKvm8MW8ltrUEI9l5qmXHjmEW71cKPz5NQaAzVl
         DLCTCUz4rzT2uZ+rFfoMebpB0dCt9F3LYXs/qOh8AQNbYx5AEn7WnrWU61hFWDTgmDPl
         NVIq32NQaov0xOqixRbHzl5ysXl4Rsq91mTcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ir8It+DHYlfjzYMvbrlwO+HxfwrDECNeeGFgQSvirpM=;
        b=UK3CPua2K75r74DwvdZOxiKJTuqx8rFs6WfZzQYAeEqJQJ0wDIEPBLIVsms7FZlLcv
         roUmEk7F7a97IMYXGmUsGQ2lOkoN25DgdfN1hU2rlBcNg1g8jWwTmNs5ZfcKiNKDOncm
         e+efg3gpRqTV6ebP8SzwS7H2CW7RBT3AR5f7UrqmGeCniWEbIO+hhjYtRpQJkV6bdNMx
         z1z85nFJhVg+4GdmmsihyurRY7YG36Sz/sPSBUIumXellErnA6lo6dLlI8EyzpquiCDI
         +LKv7X/HHoJpMvaRFOox2xuca6XgsmxBzlLSEqiZth26h9n04jMQjzARCQ7/VGUmEZwA
         y1bg==
X-Gm-Message-State: AGi0PuYchccqQCkF9XM0Dq6t+b91DvVxDQ17pFFiqZkPVdOYGchbeBvR
	xkVbtrFBjD6A0E/ItByy9yzVEpNYmTA=
X-Google-Smtp-Source: APiQypJn5VUso5vgxoAddS5IIXLCtrGJ4+G45RYnqcTRtcDz0tVY7zd4sroCzW/Fbrq+rZAELO9EVg==
X-Received: by 2002:a05:6000:108e:: with SMTP id y14mr14139132wrw.292.1588494150581;
        Sun, 03 May 2020 01:22:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b85sm7778884wmb.21.2020.05.03.01.22.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 01:22:30 -0700 (PDT)
Message-ID: <f2661a61f4e661f58e4873bbe5efee4ef40e68cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] libnotify: upgrade 0.7.8 -> 0.7.9 / port to meson
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 03 May 2020 09:22:29 +0100
In-Reply-To: <20200430214203.26595-1-schnitzeltony@gmail.com>
References: <20200430214203.26595-1-schnitzeltony@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-04-30 at 23:42 +0200, Andreas M?ller wrote:
> From [1]:
> New in 0.7.9
> ============
> * Fixed linking in darwin [Iain, Marco; !5]
> * Added man page for notify-send [Jan; !6]
> * Dropped autotools [Jan; !11]
> 
> [1] 
> http://ftp.gnome.org/pub/gnome/sources/libnotify/0.7/libnotify-0.7.9.news
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  .../{libnotify_0.7.8.bb => libnotify_0.7.9.bb}     | 14 +++++++++++-
> --
>  1 file changed, 11 insertions(+), 3 deletions(-)
>  rename meta/recipes-gnome/libnotify/{libnotify_0.7.8.bb =>
> libnotify_0.7.9.bb} (59%)

Looks like there is something that needs tweaking when api-documention
is enabled as a DISTRO_FEATURE:

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/470

Cheers,

Richard

