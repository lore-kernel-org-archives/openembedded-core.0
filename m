Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029F5C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:45 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.4733.1642588903430374047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yh2tfSUP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id n8so4470038wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=u4Sn+PlRLp6T566futUO+lmrglKTcAh2CmeY/DfEcqA=;
        b=Yh2tfSUPF7R/7Pp5Im++nJF+/ijoNGamqsIt8e+bOlPux3albMF2D9l9HVn5D35QRy
         vipwzEQ8lgtNUKAs+1McVzc1c4+fUP6B/zawOZC0WfqUGeBSNvnMueGfWsGtszgGaNTb
         sSeBVLS5mc/u4J1KcxY2a0I5fvJHarpKH9OMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=u4Sn+PlRLp6T566futUO+lmrglKTcAh2CmeY/DfEcqA=;
        b=pQVuaa1kybNaVJ1KnQqHEoNh/W0y4CStD5W4NcEVctKOAlLrZamFEHCCzQfwjO4umz
         pzNInP5zjIcAu+XwavpqLt4iq81ug5AIP6F9L/096e//4iMnlR9h6TgGdTiaQjN1Hx+5
         aXX+otwxB76FXuhxzMxBu7ZH52pUcrHcemy3DjRe+R1uojjxsQS8xK8eG0V5tm5DfRRN
         buAYADArpktKilC05U78USMPasJOektZSi3l/fWu5h5HBJ2/6J6IF47Pr/OKHLb2E6Ra
         6FLIhg6qqELEsSQTrSc0oDhb1PSIeEhOT30VWt1nYIlKFbTO2aQJ4WlLNXspnnTxF7yO
         j7pw==
X-Gm-Message-State: AOAM530JXXG2TlJPnE24wFKwFWs4eD2PupZpzlRZ8QuuGG23t+HV8EZQ
	xOMNgEZVTej2Y9KAOfzTnr/blg==
X-Google-Smtp-Source: 
 ABdhPJwbdCyZZIn7Q3oJUNu+AzY4cr3s9YSPyGSqcnWynU7Lm/VxSs5z3Cz+FK+aWATcENGgNEQ7kw==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr2797333wmj.77.1642588902102;
        Wed, 19 Jan 2022 02:41:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4e1a:65bf:4ced:cc2d?
 ([2001:8b0:aba:5f3c:4e1a:65bf:4ced:cc2d])
        by smtp.gmail.com with ESMTPSA id
 f9sm21943142wry.115.2022.01.19.02.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:41 -0800 (PST)
Message-ID: 
 <acceb76c7b8b83fa32f4a7ba7685b342848c468e.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] iproute2: update 5.15.0 to 5.16.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jan 2022 10:41:38 +0000
In-Reply-To: 
 <CAMKF1srwct2MrLnRnL=vfUJDpZ_wjsGKWpWjX_V0G+UpTbTWoA@mail.gmail.com>
References: <20220118013139.62641-1-changhyeok.bae@gmail.com>
	 <CAMKF1srwct2MrLnRnL=vfUJDpZ_wjsGKWpWjX_V0G+UpTbTWoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160714

On Tue, 2022-01-18 at 10:54 -0800, Khem Raj wrote:
> On Mon, Jan 17, 2022 at 5:31 PM Changhyeok Bae <changhyeok.bae@gmail.com> wrote:
> > 
> > 0001-lib-fix-ax25.h-include-for-musl.patch is the fix for musl and comes
> > from upstream.
> > 
> > Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> > ---
> >  ...0001-lib-fix-ax25.h-include-for-musl.patch | 37 +++++++++++++++++++
> >  ...{iproute2_5.15.0.bb => iproute2_5.16.0.bb} |  3 +-
> >  2 files changed, 39 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch
> >  rename meta/recipes-connectivity/iproute2/{iproute2_5.15.0.bb => iproute2_5.16.0.bb} (64%)
> > 
> > diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch
> > new file mode 100644
> > index 0000000000..338def399e
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch
> > @@ -0,0 +1,37 @@
> > +From 8bced38a941a181f1468fa39541e872e51b6022f Mon Sep 17 00:00:00 2001
> > +From: Sam James <sam@gentoo.org>
> > +Date: Thu, 13 Jan 2022 08:14:13 +0000
> > +Subject: [PATCH] lib: fix ax25.h include for musl
> > +
> > +ax25.h isn't guaranteed to be avilable in netax25/*;
> > +it's dependent on our choice of libc (it's not available
> > +on musl at least) [0].
> > +
> > +Let's use the version from linux-headers.
> > +
> > +[0] https://sourceware.org/glibc/wiki/Synchronizing_Headers
> > +Bug: https://bugs.gentoo.org/831102
> > +
> > +Signed-off-by: Sam James <sam@gentoo.org>
> > +Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> > +
> > +Upstream-Status: Backport
> 
> please mention https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=8bced38a941a181f1468fa39541e872e51b6022f
> here to point to backport link from upstream

Thanks, I tweaked the patch to add that.

Cheers,

Richard


