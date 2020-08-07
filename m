Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.6196.1596836112752833918
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 14:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LoCtGlTr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id a14so2889816wra.5
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 14:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zpU3vlPay6h9ofXU/FtIhkWDOneM5cR22HOn6Qlm5Ec=;
        b=LoCtGlTr+dZZ5lh57f0YQ+emXUhO4LbUI7TPvHEbRZCUXc4v0JoZFe1iSWAZ8hH5DD
         4YkoDK2utGEcGJGkK+gKv2wy9Q/J5Lb243Mx3+8dtJdE0SYvx81Mvy8ZkBsp2NlIbqql
         EmfeAuYkUYunzN82jkEsuZDc9UEDqN6Z5T4Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zpU3vlPay6h9ofXU/FtIhkWDOneM5cR22HOn6Qlm5Ec=;
        b=VyCAZ9L8E6IqUSS409/kE/tM2J+ha5Le7O5wfBoNFXHN47W8hDWuiOQLkblyoBSz0k
         toQgJuKKNeC0t6PjZ7GwXUFcBRnD6GioPjIiA/hZ9jbJBSHRK44Jj03F4QvyX9t6mtWY
         gl5gxDJ/li4kXcGwW3zxfZ8fE6Jtfb3mMndwrO03bbECI02Bvmp5adQciKugZ9g4GDi8
         d/KJMOkI3I9N1a/qNindKH0tsoJmv+dO9EuqgI3ZUKYVyB3p0nXu7wHN+9ek187UfrL4
         FP6n/WJW3nWNF5AnQ9nq8YPR0jgaebYi2ZsmbqyZEE4sZQyltecTy1cx/XjFX1RdXY2s
         x2uw==
X-Gm-Message-State: AOAM530mREL0Rr4Ltn1oqI36bCS4VNOAa5UASsF4C6ec//xARWxYPDnn
	49rOukDrBTiyLaJ0G6Su7MpEzw==
X-Google-Smtp-Source: ABdhPJyh16BnczyqfheqMR9e0zTL+2H7h5e2uRnH3o8OXLVzuGRKmVBUEDWrsjpUQEdO63czP5Dl2w==
X-Received: by 2002:adf:f347:: with SMTP id e7mr12861895wrp.243.1596836111181;
        Fri, 07 Aug 2020 14:35:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f98f:bfec:7aa3:2ba9])
        by smtp.gmail.com with ESMTPSA id g16sm11415352wrs.88.2020.08.07.14.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 14:35:10 -0700 (PDT)
Message-ID: <030c97779b17a187b80e9d5817bdc9074dc55740.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] kernel-fitimage: build configuration for image tree when dtb is not present
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Usama Arif <usama.arif@arm.com>, openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Fri, 07 Aug 2020 22:35:07 +0100
In-Reply-To: <9d97ca08-04a6-6029-7a39-c96aad082fa0@arm.com>
References: <16238590BAEEF4BF.5706@lists.openembedded.org>
	 <9d97ca08-04a6-6029-7a39-c96aad082fa0@arm.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-06 at 15:16 +0100, Usama Arif wrote:
> Hi,
> 
> I had submitted patches for both the documentation of kernel-fitimage 
> in yocto mega manual as well as test for kernel-gitimage in oeqa.
> Just wanted to check if there were any review comments for this patch
> to progress?

Sorry, I'm a bit backlogged after the infrastructure issues earlier in
the week. At a quick glance the patch looks good, I'll queue for
testing.

Thanks for doing this (and the docs update), its much appreciated and
will ultimately ensure these use cases stay working!

Cheers,

Richard

