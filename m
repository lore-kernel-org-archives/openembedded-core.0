Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22B4C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 09:33:19 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.7071.1643880798486631582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 01:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gKtQU+S3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id n8so1462456wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 01:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=eff1N+52iANolcE/tHHcP6ebaLg+t2+ue8cnOWBh+IQ=;
        b=gKtQU+S3ylNzFtv3db2iCFABQLQYavGQhF6bYcXaq3gFOdgbD8R1Zgzc+ns7JscWUR
         PszDbzzr2xm7mGnSnUUYL6lfgmuZhgh/zXC32PuAgLln2hklaLs6mRi8VIq1SgM7R7G3
         ou3fLNIPDDDQAKjlg+e0b2h8OvxBWcMoCqKes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eff1N+52iANolcE/tHHcP6ebaLg+t2+ue8cnOWBh+IQ=;
        b=SZh6lmuW6l4iNPNi9QW87SkZFq5BeGER4fZMEE67c3+UZwlH834tu/Gi7vmHTeedzu
         YXfsLooEv+WvMS99oNlZTfIXFOL4F2mnK16L0fCFtyzjagAwDaCgglTweLV9M1aU6aNS
         M9qfMUfenA0nZusJm7wNn11azMi3MACBZG3Z5DllNJUt0H2pt4cZdFKjpSQtAQQ0yJRz
         nY0ELw+sdlIiluZhyoUhD1aYKdtuUvadTgTTUKUmWJNTKLxMyv8nIysTtvCcdkjYDJ+E
         dcTXz9RmJHBwdtkOLpsEPyVi3KfUncmhBQDJVbCaoVabgkwvD0i2+th8ivaYZswdbILJ
         w+Ew==
X-Gm-Message-State: AOAM532iHT4vIjX4xEMNRKrr0yA02tOreC+KSEeXJuUcTE/A5FNxwAlS
	VuL1yQCwbCncdQyrmA/sX4kSYg==
X-Google-Smtp-Source: 
 ABdhPJyUyGaOvNoBfVOsG5SJTP5u1N2uGhWzmr1Q13tdA2bD/92J1G74FZVn+TZO8ok+pRpK7muwGQ==
X-Received: by 2002:a05:600c:1443:: with SMTP id
 h3mr9697218wmi.37.1643880796877;
        Thu, 03 Feb 2022 01:33:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e772:7635:2207:1103?
 ([2001:8b0:aba:5f3c:e772:7635:2207:1103])
        by smtp.gmail.com with ESMTPSA id
 i2sm8370696wmq.23.2022.02.03.01.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 01:33:16 -0800 (PST)
Message-ID: 
 <658c99c273e0884b2247a0cc4bd27df276a2c9b6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 03/33] gdb: update 11.1 -> 11.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 03 Feb 2022 09:33:14 +0000
In-Reply-To: <20220202230651.GI26229@denix.org>
References: <20220202182758.919991-1-alex@linutronix.de>
	 <20220202182758.919991-3-alex@linutronix.de>
	 <20220202230651.GI26229@denix.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 09:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161271

On Wed, 2022-02-02 at 18:06 -0500, Denys Dmytriyenko wrote:
> https://git.openembedded.org/openembedded-core/commit/?id=f24c2bf93a9549ae5a21ce378a7bf47ef052ad65
> 
> I realize these are in master-next and haven't been merged to master yet. 
> Richard mentioned there are some issues with one of the autobuilder nodes 
> and hence master-next is taking longer to test lately.

There have been a few issues:

a) there is a nasty reproducibility failure which highlighted a hash equivalence
bug which is blocking one patch. It took a while to work out the cause though
and know which patch was causing the issues. Joshua and I have talked about a
fix on irc and one the team call on Tuesday, it isn't an easy one.

b) The Centos Stream workers pulled in a problem change which broke builds. When
that number of builds start failing, we can't trust the test run results which
makes it hard to know which patches to merge.

c) I've been unwell over the last few days and you've noticed my productivity
dip, I wasn't fixing the autobuilder issues or the hash issues as quickly as I
may have done usually. Similarly patch review slowed and so on. I did prioritise
meetings, status reports and so on but had limited energy to do everything.

For a), I'll send out some patches I have which seem to be working.

Once a) was understood, for b) I could merge some patches by multiple runs and
averaging but that is slow. We'll drop the number of stream workers we have in
the autobuilder as I'm not happy with the issues introduced and the lack of
response to fixing them. There is a make hang issue on stream that is unresolved
since November and we may drop all the workers if we can't figure that out, not
sure yet. Alex did help debug some of this yesterday which has unblocked us
(thanks).

For c), I'm hopefully recovering. It is a warning/reminder to people that we do
need other people stepping up and helping. I do my best but I am one person and
I can't change that.

> I don't believe bombarding Richard with duplicate patches improves his 
> productivity. :) On his behalf I'm asking for a bit more patience and 
> understanding...

Thanks, I know you've my interests at heart here :). Alex's series is a little
different in that he is rounding up the remaining AUH output and it can overlap
with what people send due to the review and testing timescales. I do prioritise
anything from others over what Alex has in a series like this, unless there is
some reason to do otherwise. Alex and I both have agreed that but it probably
isn't obvious on the list.

I do sometimes wish he'd rebase it before sending but that then doesn't
represent what he tested so there are pros and cons to that and skipping
overlapping patches isn't a huge deal. I can/will drop anything that doesn't
apply and let Alex sort it ;-).

Usually we don't see as much of this as things run faster. As things slowed down
it did make it more visible.

Cheers,

Richard


