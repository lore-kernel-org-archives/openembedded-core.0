Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.178.1615242587551177040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 14:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FF7FM22Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id a18so13080930wrc.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 14:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BEhZ2U6Iu5RpiHQAX2Q2oT0RqrQN8YbIc9E7xckl96c=;
        b=FF7FM22QnHwexBDCklmuX8fmj+CTT0OAbmpBLh10nP8gOzSYAg3wDkuJqLkZrLjJzm
         giP9u/GZAgIwbj1nxlTBgWeu5Mh0i+AMUgOXGMJUQ1+w3SMLAOKRBSkLDaFug0DpfLgu
         K4vpWDhIhsoi4Oj66ewmrHh2XPcq7LlWNjbds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BEhZ2U6Iu5RpiHQAX2Q2oT0RqrQN8YbIc9E7xckl96c=;
        b=aA5VGkfssr/CR6iMIsf9OvFPPBBM8T8CpiybypjwDJHCsmkIhyxBXM7OHjH4Km7dzA
         YdsLz7bUqTzhqvAks1fFCWmjkFdmspQ7POc9csUUkc4uFA7Vazijf1Y6QTDWW7PIyXCV
         Wufe7bn9XBChc2nXC1OUvxmrOYJpK0dga2vajLpSf28lhH/qyOTJTKwKqZ0fjA40aDFT
         69VfHmxS25ifmyei+3ss97aApWbz3e08X/P5lvhuhiiIdQHhgF+aohgDXfeQsNoRkyBa
         TxbGjwaBQjxjxCeQ/XdGhIyhswdOBaLbfLFCiigSbG5ci8/5TFsseyqdogHV6v+qQN0O
         M+sw==
X-Gm-Message-State: AOAM5308P59zWBhuwMjjXumFHsbAfWBhTkB97hB0j1d3BGdqwt6JJHuG
	mI2yT7OXvFGReAYffr5MQw4rRg==
X-Google-Smtp-Source: ABdhPJxLnlaVf1f8gW2Rhvab4hqseRpygrkwFg+QBabniK9PHKVsKm4GvvwzIkOVSTx6ndvTcg6srw==
X-Received: by 2002:a5d:4b06:: with SMTP id v6mr14826671wrq.41.1615242586073;
        Mon, 08 Mar 2021 14:29:46 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from [192.168.1.6] (dan.rpsys.net. [217.169.23.60])
        by smtp.gmail.com with ESMTPSA id z21sm946729wma.29.2021.03.08.14.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 14:29:45 -0800 (PST)
Message-ID: <0db2c5cd53d62ba364d69958e76f377428f7b0b1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 08/24] libdnf: update 0.55.2 -> 0.58.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 08 Mar 2021 22:29:44 +0000
In-Reply-To: <CANNYZj_88i2diRoHSTFpiEVswR-diK3Cuu6c2Nx9SJkovn=MdA@mail.gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
	 <20210228153702.498275-8-alex.kanavin@gmail.com>
	 <9d7090a0-433c-42e0-98b9-9be7dd0c2cba@gmail.com>
	 <CANNYZj_s+=u5bnArB5jvwoUsTR3kz2D_xPtgWivagxEbUy2BHg@mail.gmail.com>
	 <82beb9df-56ea-3081-b502-4fce8a65f4d4@gmail.com>
	 <CANNYZj_88i2diRoHSTFpiEVswR-diK3Cuu6c2Nx9SJkovn=MdA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-01 at 12:53 +0100, Alexander Kanavin wrote:
> On Sun, 28 Feb 2021 at 20:30, Khem Raj <raj.khem@gmail.com> wrote:
> > > Can you send a patch upstream for this please? I have filed a ticket 
> > > which you can reference:
> > > https://github.com/rpm-software-management/libdnf/issues/1146 
> > > <https://github.com/rpm-software-management/libdnf/issues/1146>
> > 
> > This is a review so please fix it as suggested in OE atleast since you 
> > will have test setups I do not have rpm/dnf setups
> > 
> 
> Any fix we do needs to be upstreamable, so can you please write a comment to the upstream ticket?
> They're too telling me I need to send them a patch, and I don't want to send something I don't really
> understand.
> https://github.com/rpm-software-management/libdnf/issues/1146
> 
> Testing is easy: build libdnf with TCLIBC=musl.

I've been holding this in -next since I'd really like to try and match what
happens upstream if we can. Since upstream seem receptive, could we get 
them a pull request open for the replacement for __WORDSIZE and update 
the OE patch too to track things?

Cheers,

Richard


