Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22EBC48BD1
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.6697.1650455743372320875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 04:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eaCPT87W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id z5so264428wre.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 04:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=n/twskApE2Uel3s/OazoKuAWmZb187EALw+HJBtYcdY=;
        b=eaCPT87WhC7PYl4Do2IscA2iOEPEOTUvHqhPu9+z4B5pa6sHH2HSmS1eN5bTKLNxvt
         F/7pQ7KiPgHYTo5YyT/vPHDX/UTXanrSsqV6g5GDgq1MF4AHsvXg09k1BetIBSfORpZJ
         rxHKdFvJ51I5B9TdwAcfbcX+SNBbtYZyo8gAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=n/twskApE2Uel3s/OazoKuAWmZb187EALw+HJBtYcdY=;
        b=D5DeoQ85BLH14V2Z73fb2SROScTTurNJJwQiYKqMeVOrElTE6HKaNyDUqNaUN2hMJC
         BCNJD/AeCd7lLqIfHeyJTe7KOL3CDEehcaCslXtra390cC1jlI9EsuAro7W8QI7Fe2S0
         MmALr9/8f8ta7WehK7Hizu5vzrzE68FsQLqoBmNrUg5lNNwiWeCx6hM/Zz/6VvAMiEgy
         I4wpl7VaqNTfLb8bn98lwwSzU6qKLs2UKoFWCobCWRK6DfgMUs7LaUh8HQHMZNg2t/yB
         4+gk1ckdX/BfYFahRlE02+eSqb8N9w3grRei6NXhaHlFReLgL3SIqimPYXoLMXUq604Q
         6wOg==
X-Gm-Message-State: AOAM533quiZIVfVCRBrd53gbYZ038pv0yGtSLxydd8bEnCJCpeQYmCuw
	tMiaUPnWDD0EMNOuM0Fxfrc7vw==
X-Google-Smtp-Source: 
 ABdhPJwfKBGbhMZJi+Mqo5qBD8H5SRsYEDyyTU6vi8gLqHgmmPfAMFcitWSlUdfVq9mPluEOBUv7oA==
X-Received: by 2002:adf:efc8:0:b0:20a:8711:28c1 with SMTP id
 i8-20020adfefc8000000b0020a871128c1mr14634166wrp.181.1650455741987;
        Wed, 20 Apr 2022 04:55:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9745:8b8f:81da:af07?
 ([2001:8b0:aba:5f3c:9745:8b8f:81da:af07])
        by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c3b1400b0038ebbbb2ad2sm21519873wms.44.2022.04.20.04.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 04:55:41 -0700 (PDT)
Message-ID: 
 <a538d9f3740bb71f376f2a67e12c43ed38f1a8d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] xdpyinfo: upgrade 1.3.2 -> 1.3.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 20 Apr 2022 12:55:39 +0100
In-Reply-To: 
 <CAAnfSTs9Lc6OJSXabup15biU6rd=DQB=BSkqYTCtZQLamr-DHg@mail.gmail.com>
References: <1650427819-28266-1-git-send-email-wangmy@fujitsu.com>
	 <1650427819-28266-3-git-send-email-wangmy@fujitsu.com>
	 <CAAnfSTs9Lc6OJSXabup15biU6rd=DQB=BSkqYTCtZQLamr-DHg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164667

On Wed, 2022-04-20 at 11:19 +0100, Ross Burton wrote:
> On Wed, 20 Apr 2022 at 05:10, wangmy <wangmy@fujitsu.com> wrote:
> > temporarily override SRC_URI which is hard-coded in xorg-app-common.inc
> > since new versions of packages use a new compression format - .tar.xz
> 
> Why would this be temporary?  Do you expect xorg to stop using tar.xz,
> or do you expect *every* package to move to .xz?  I don't see either
> happening in the short term, so I'd say the solution here would be to
> parameterise the compression in xorg-app-common.inc.  For now default
> to .gz but in the long run if the majority are .xz that can change.

I've sent a patch which makes it a variable recipes can change.

Cheers,

Richard


