Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.798.1603814024315032812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 08:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E/cXfmOX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id d78so1856382wmd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2pViBxG2NVYGSYa5b7VhV8Pj4uZgkyprho9YYeWm2QA=;
        b=E/cXfmOXX7oFg5aTWzY9+XKNvEmpphJURvskSsifDmfm6BFaYCTcbwfd65B+cFAx3D
         aWHr4Qbkk3+AnaSEpsxJhxyHRhlBg/ngE3gF7UWY5UIzS80gzf17WCi55uOvwZ5+YarB
         1/thj50GoYsCI91hptKt0Y/121l+IHeF6AmHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2pViBxG2NVYGSYa5b7VhV8Pj4uZgkyprho9YYeWm2QA=;
        b=n+8zoHoVDexo7YcNYnXZ4873G7Kte3ptOS3xWwc39AOdxNwgszY/E7RSSVs8bLFCOB
         cx7mGZz4yEAbUTPERS/1saxVhDZu4a4VwirnxpZVrWWe9ND4baDUf8V79LQWe1IuXQr6
         cVfEbviWxSM9LOku6W9qKkWT7OgNcGAe/Qj7UfJFgLu8gZ3sD0k5+SR77e8coI1FYjU7
         zS5g9h1OL3fVooJD/azNyvLwKLRuTq7g9VG1QQWLWJkauEKfXr73ICLs2StAeiTzPC2Q
         6WLvtaFAKPdC4otSP73TBwgkx8qxn/stayjChJbfPBwGzYjnW9QOyK9kXjbNzlDgU8jA
         bm2g==
X-Gm-Message-State: AOAM530uDOG1+aZorlEDwOo88TPrOimUAkCJ/EwBzctbCjgrX6tdoiRG
	aMloD3rbcQc+t7ECVEpLLTT8SA==
X-Google-Smtp-Source: ABdhPJyw+eIgxFJ628FjoHS2pwjG71zPrpOF44BTRsRn98AeFgnv1Y22+mdLT7/gnEwYHcDJDVPs+Q==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr3336943wme.0.1603814022674;
        Tue, 27 Oct 2020 08:53:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id 24sm2324875wmg.8.2020.10.27.08.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 08:53:41 -0700 (PDT)
Message-ID: <9a94719a551dc12209b57d8500c1a28b9639f45d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] grub: fix several CVEs in grub 2.04
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Yongxin Liu
 <yongxin.liu@windriver.com>
Cc: "anuj.mittal@intel.com" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "MacLeod, Randy"
	 <Randy.MacLeod@windriver.com>
Date: Tue, 27 Oct 2020 15:53:41 +0000
In-Reply-To: <CAOSpxda2BNPNBt1sa260DbLQBFj-W8Q_2HcSmQkRXah1WXx=iQ@mail.gmail.com>
References: <1638867317AD6658.17423@lists.openembedded.org>
	 <BYAPR11MB26006BAF0A30835DD46D6475E5160@BYAPR11MB2600.namprd11.prod.outlook.com>
	 <CAOSpxda2BNPNBt1sa260DbLQBFj-W8Q_2HcSmQkRXah1WXx=iQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-10-27 at 04:26 -1000, Steve Sakoman wrote:
> First of all, thanks for helping with CVE's!
> 
> I've been waiting for this to hit master so that I can also take it
> in
> dunfell (which also uses grub 2.04). Richard may just have missed
> this.
> 
> However I notice that in the meantime another patch has hit master
> which also fixes CVE-2020-10713:
> 
> https://git.openembedded.org/openembedded-core/commit/?id=ec6a2258ca27d5709df4fe18d94841332395bcb2
> 
> So you'll need to submit a v2 which takes this into account.
> 
> I look forward to taking this in dunfell!

I think the other patch came in first and was already queued. As Steve
says, could you send a v2 please on top of what was already merged. I'd
also like to see these fixed, thanks!

Cheers,

Richard

