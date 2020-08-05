Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.4809.1596625853818155807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 04:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A/kZgGdv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id g8so5439479wmk.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 04:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XXQJfgmVmPumnh+oDlQHee+dWIn3btv1rQDbI3IiSdY=;
        b=A/kZgGdvZWgi6gC2MjB0VGG9rFAMZuChjrQXZA332sVHbzxjpj6JzTuLkFvaUlGw1L
         dzPLe27wEMNwAAuWD/iFDLW7/I96NJncnPUB9mtkMP6hGWXqse1jiDJSv34noyqHWDko
         hAcQWO80hBj9zgK26FuukMLGtZMnrIoVn2Akc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XXQJfgmVmPumnh+oDlQHee+dWIn3btv1rQDbI3IiSdY=;
        b=JEMMH5O+tDAqa5NKbXd0yixsa8S+WSg2Kr/Qcc+v3p6B2/yMhTBwMlo2pT/c4oKFQS
         C4bT+jeGlFtfZWu1ozrndkLzzIz5C2ByMDlpO0BgTtSB8nQs07iFEmStruGInUZBWnPD
         LaTM8Ou/1Zk+8BSXw83eZuHpLWihcOIpwqUi+q6ZbmUH/OE6HzT2g+od6YxwYj5Cb43J
         S2pKS1HuSHwudy/wwQfy7QWUYjjyV4bvP5lFMn+CQdTl1RbmhWIirHuyOlwGCeA/wwO6
         dhUddDF8SNfNsRjZKMeAPxdYgPTcAKPH8idCQVtRpd27NA+fcqeCQ45emgmIJopxnKiY
         CS2Q==
X-Gm-Message-State: AOAM533ymNZAQryIdYqQhCOwbt7LRDEuerW4xfwsmHKV2nSbvrPDhZXi
	1EFU/zdiCv9Rp1D3CFP+20FvhQ==
X-Google-Smtp-Source: ABdhPJzXxHAtWZQz/aBt785Aw7kGbhPMNLWkiqCYS45QWOZAeV5uyezg6Jo6a5QImsrVkO/qbvVFYg==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr2879424wma.33.1596625852368;
        Wed, 05 Aug 2020 04:10:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7059:b67:8944:2881])
        by smtp.gmail.com with ESMTPSA id k15sm2323389wrp.43.2020.08.05.04.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 04:10:51 -0700 (PDT)
Message-ID: <7af01e4c3d12d960a7c8820f773f77658d6d59e5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/4] kernel/yocto: conslidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com, "Mittal, Anuj" <anuj.mittal@intel.com>, Ross
 Burton <ross@burtonini.com>, Jon Mason <Jon.Mason@arm.com>, Kevin Hao
 <kexin.hao@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Wed, 05 Aug 2020 12:10:51 +0100
In-Reply-To: <16285A84D29254CC.27500@lists.openembedded.org>
References: <cover.1594989620.git.bruce.ashfield@gmail.com>
	 <16285A84D29254CC.27500@lists.openembedded.org>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-05 at 12:06 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2020-07-17 at 08:56 -0400, bruce.ashfield@gmail.com wrote:
> > Here's my latest set of patches.
> > 
> > For 5.4: a -stable update, and -rt bug fix
> > 
> > For the build: a tweak to the config generation (as reported
> > and discussed on the mailing list)
> > 
> > For 5.8 (aka the next reference kernel): a fix for devsrc and
> > on target kernel building. With this tweak, I have all of the
> > refrences booting and passing most tests on 5.8, so we are in
> > good shape on that front. I'll be doing libc-headers testing
> > next.
> > 
> > I ran these through the AB and local testing, no issues popped
> > up, except a warning on qemuarm-alt in my last run. It was
> > about a console login and didn't look related to the change,
> > but I'm keeping my eye on it.
> 
> Thanks, I ran this combined with Khem's binutils change through the
> autobuilder and your changes are likely fine but we need more work to
> get binutils in. Basically:
> 
> * meta-arm needs to add the kernel patch for perf
> * meta-intel needs to add the kernel patch for perf
> * the hardware BSPs need to add the kernel patch for perf
> 
> I've added a few maintainers/people to the address list to try and
> sort
> that out. Who is going to handle the hardware platforms?

Sorry, the url for the failing builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1231

The kernel tweak needed for binutils 2.35:

http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/?h=v5.4/standard/base&id=1fe4ee7f680c3f69f620d68a5d2f7341e8db693b

Cheers,

Richard

