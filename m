Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.12134.1611068425787878650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 07:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BZqdCxvB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id m187so38627wme.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 07:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/U1qcn0JdI6wDHnxhoSTzYSsSNp06y+Yz8TDMFmo0Dk=;
        b=BZqdCxvBs/93JZkzu9kyuQzVfIPbRewGvDUFYrJFiVkq8O31SnwUS4MT94Tsz9c58o
         IvoSy2TaEml1XAlgtQ0MNyLtnQLty215iUrhtXLbKpPGFfAPh2MxPlCnGbL1CQ83w5mu
         GawGPCoTr8b0UzIfBrq8OP/YgItB6e5FZEqrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/U1qcn0JdI6wDHnxhoSTzYSsSNp06y+Yz8TDMFmo0Dk=;
        b=Ova78fS7h0yNW+dMgsOS4qEVBevaP/l/U+Nhf8m11XXuPOITXQh/6KymKEpsXRzUTb
         ysuZLdkK1571RlAUYyvfHyB74jMadwlD1AVBGNXBEGAvYd9FwOKnrK1OZNmpKQmGWwwD
         A9AoTc0+seFTVaHt+RMwoGIzgtKkeWw2R9r5ieJP88qT+RpptFAt2yJZOhPWJQqvNcF9
         YWEZ5BuxtASGAKZEPPg6yH42HlbFIfq6/LQShF/Ej780GqV8YqCby00zWLh0v6d7Z5Ox
         nhLpKOyVlfl2S85mkjoqgesMszeOHnIHdHJ4egRHYWNRNFU7285GOmvm4935nno3hlB9
         82Gw==
X-Gm-Message-State: AOAM532ep20egtah+HdIgGHQcdJ1QxJnFORvIkZQ4LVIr/zU/E7WS4Gd
	WIrUnOfrMafO+PYrHno94w6ALg==
X-Google-Smtp-Source: ABdhPJwYG/nLBcZkR+HC0ZzSVxMWcJ2hwLHOb3Hmfbwm1jXg/8m1q4xK9bYEpTvIRRMvTNAAjyKvSQ==
X-Received: by 2002:a1c:a145:: with SMTP id k66mr65692wme.18.1611068424327;
        Tue, 19 Jan 2021 07:00:24 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id s4sm4600260wme.38.2021.01.19.07.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 07:00:23 -0800 (PST)
Message-ID: <4426ee016f6e68b35928428303f2e856c2d3bd05.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/30] enchant2: upgrade 2.2.14 -> 2.2.15
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jan 2021 15:00:21 +0000
In-Reply-To: <adb50d1a2339dea30b615d0d54ee734c525f5a4a.camel@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
	 <2373028965f82731c9ed64b4366ba8ba85c8f35b.camel@linuxfoundation.org>
	 <adb50d1a2339dea30b615d0d54ee734c525f5a4a.camel@intel.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-01-19 at 14:58 +0000, Mittal, Anuj wrote:
> Hi Richard,
> 
> On Tue, 2021-01-19 at 12:41 +0000, Richard Purdie wrote:
> > On Tue, 2021-01-19 at 14:45 +0800, Anuj Mittal wrote:
> > 
> > There seem to be a lot of point version upgrades in this series. How
> > sure are we they are all bugfixes?
> > 
> 
> I am not sure. I didn't check each one of them. They just were the
> latest versions available and tested by this month's AUH run.

Sorry, I got confused and thought that was a gatesgarth branch! :)

They're obviously fine for master, thanks!

Cheers,

Richard

