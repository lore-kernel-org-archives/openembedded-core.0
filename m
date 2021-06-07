Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.33776.1623057222881925264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 02:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F0Up+3yt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so4668006wmq.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jun 2021 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=JUXFTprUIHoFVSbDpNB1Voz2fD93CSKJt8NMHgu4cT0=;
        b=F0Up+3ytIDculZwT8gT4wWVdhAQcE9jvQWdcLN36SdMCgsFcMDYSdanEeFE/QI6cxW
         I5RI4sg+2Z6s4NMnJYKPXlyKn/cp1v19xux2VvpPhA+64fitZ78bzY+Z0vgmSmDsl505
         Ljy24t8Uu4HldhIMYOC2U7au8FcoBo7dDK1vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JUXFTprUIHoFVSbDpNB1Voz2fD93CSKJt8NMHgu4cT0=;
        b=MHu+zeZZ9uKJPZUUNqByORDWljyZHDAoPd42I9qz7f8huWIjPdH6JqbwB4ToRl1opa
         xCwWcT32FCM2Ob930dFDebTSR1PpKs7kFuWaAi0jvYz/ru+0n+Sr4gHaIDLOHgovqTAs
         q9qdrjaJKi7/cxs4EkfHfSg6zxavBUjZ9wK8v387cxtC50zGGUkwXAdTPZgHrIbnTNgU
         +y4HI1N7gkBXU4DmYlBxDr4xKKid1ebOYLM4/cCvyY/B02b9SVclQLwm2xPGU3Qo0usl
         2Aa9Wj0PJQLqDmHYqMM1Rkfk2J4ZVSuQJTej2enkns8GelpvGNVcuP6AGYNUDZAwiDaL
         oUsA==
X-Gm-Message-State: AOAM533TwZb5HrxkKZqNN48NosvXxOLTP8aKZlpdjBL9zUdXVwV7AWz1
	4dS8uTOtB9vj9NO6rE0lL7bXSQ==
X-Google-Smtp-Source: ABdhPJyO6cQdwiPQbAnc8LmDYY/1aa5+5VCR/xqHxfBkRauLDiZPUfkWglKM8OSG0WbLTK2FPVphbg==
X-Received: by 2002:a7b:c210:: with SMTP id x16mr15250577wmi.105.1623057221031;
        Mon, 07 Jun 2021 02:13:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bc28:bf5c:88f3:2d27? ([2001:8b0:aba:5f3c:bc28:bf5c:88f3:2d27])
        by smtp.gmail.com with ESMTPSA id j131sm17253539wma.40.2021.06.07.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 02:13:40 -0700 (PDT)
Message-ID: <a4e98cd42976f5967eb6bac6cdd7405342909ce5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/10] perl: split perl-cross into its own recipe
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 07 Jun 2021 10:13:39 +0100
In-Reply-To: <4b7aa337-ccce-e08e-aab8-04218fff0dec@gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
	 <20210604091458.1381144-5-alex.kanavin@gmail.com>
	 <4b7aa337-ccce-e08e-aab8-04218fff0dec@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-06-07 at 07:29 +0200, Jacob Kroon wrote:
> On 6/4/21 11:14 AM, Alexander Kanavin wrote:
> > As perl and perl-cross need to be updated (and patches rebased)
> > in lockstep, devtool upgrade (and therefore AUH) can't cope with it.
> > Manually updating is still possible, but painful.
> > 
> > Split determinism.patch into perl and perl-cross parts, move the
> > rest of the perl-cross patches.
> > 
> 
> Not sure if this is intentional, but when I build master now I get a new 
> dependency pulled in that is built called "perlcross-native". Given the 
> sound of that name, is that intentional ?

The component is called "perl cross" and this is the native version of it.

It is rather unfortunate naming but technically accurate :/.

Cheers,

Richard

