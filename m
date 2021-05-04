Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.104.1620167538383712058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 15:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VV20ouPL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d4so11012050wru.7
        for <openembedded-core@lists.openembedded.org>; Tue, 04 May 2021 15:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=T2TxDOV4e4FRNUKKQDhQM9+ekxwD22LvMpj+8dv9TcY=;
        b=VV20ouPLpLYMuAG2sWNZyBGEgQnrHP/Oqlm42WhZQdgU6NiDIWhFNgfPWxywQVDc1+
         0yTukw5HBjyKzvioFya3wntjPw1aXsfmElyC5s6fmYUjFb06hYmfKgx2D6AkggNb0DJq
         9M9m+Tx5ml/ZHOuRSzaj4npcB0ijzqZATuC8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T2TxDOV4e4FRNUKKQDhQM9+ekxwD22LvMpj+8dv9TcY=;
        b=FBZQ13Af2tD1Z11B7ZHphFeWw1Mbb5a5kJqxzEwDGTALCZPyCtUk1gjuNHtgLwHR5d
         9YlApTYLfTsxRTDFHcT4LD1wuLeBX4gTQeRP0XBqPT+T22l8JmPE+A4tMtevJ53RZ6vp
         LfDJKZa5nCWn220peio+kxV6kNdz1VMaDd4W/ZAPmR3smyiMKyjw8fA7x8lnYQcyUz+8
         AMefe+W5EuUqk3TqrU28kLMEBcy8/bor2SKmubhSaozmniVgmQ+aXHzUPxsoIrGORXJL
         vtjqv7NN9LFm0Jqumh/vZh5vAHgnFK+uIaxP285cAToefswvF4Kv6Ey+UGDpJmr93GJy
         mBHA==
X-Gm-Message-State: AOAM530PLu9NUqxcXI/Llo7I+sbmBqFnKaRb+AzK4zj8RERJ+kYv0NJa
	fxRTz3QLpgQaqxkITPPRBIyKVw==
X-Google-Smtp-Source: ABdhPJz0zvJwNIJ3k1Datpeo83jD9gaR3RKZitMO1CvtqxC4hfEr72Zgc8pEPKcfxwZGtkFL2EUTeQ==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr34234310wrj.75.1620167536671;
        Tue, 04 May 2021 15:32:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8041:e424:9226:62e7? ([2001:8b0:aba:5f3c:8041:e424:9226:62e7])
        by smtp.gmail.com with ESMTPSA id m11sm17446560wri.44.2021.05.04.15.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 15:32:16 -0700 (PDT)
Message-ID: <5a4091d0cb7b20f7d41e33b67fb5b7502b2e58b4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto] Yocto Project Status WW18`21
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Stephen Jolley
	 <sjolley.yp.pm@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 04 May 2021 23:32:15 +0100
In-Reply-To: <CANNYZj-agAhiswr-8qpsQPQ=hP0Orv5zdLtAEEqcVGTTjhWyPw@mail.gmail.com>
References: <168601d740f4$44e42800$ceac7800$@gmail.com>
	 <CANNYZj-agAhiswr-8qpsQPQ=hP0Orv5zdLtAEEqcVGTTjhWyPw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-05-04 at 18:38 +0200, Alexander Kanavin wrote:
> On Tue, 4 May 2021 at 16:46, Stephen Jolley <sjolley.yp.pm@gmail.com> wrote:
> > We are pleased to announce that our April 2022 release (potentially 3.5) will 
> > be the next LTS as per our original two year schedule. If there are features 
> > desired in the next LTS, now is the time to get them submitted and stabilized
> > ready.
> > 
> 
> What will happen to the current LTS at that point? Will support be cut off, 
> will there be a transition window, or is it currently undefined?

We have discussed extending it but we currently only have the funding for the
originally planned 2 years. Discussions are continuing but since we do all 
agree that the next LTS will start then, we decided to at least let people 
plan against that.

Unless funding/support is secured, dunfell would move to community support
if anyone were willing to step up, or become EOL and replaced by the new LTS.
There would likely be some period of overlap of a few months to transition.

There is also concern about pressuring wider community layers for longer support
cycles which is something we need to think about.

Cheers,

Richard

