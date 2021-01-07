Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.1352.1610056541167025717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 13:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c9nMg7Eg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id r7so7062053wrc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 13:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=dCJ3HCGP29lDYW54JZ1uxaMqjTRTQXHhk3ZbqrpILl8=;
        b=c9nMg7EgGcD0uIRZMXKXBRMAw0RNwEUgluW5/wIbdRo8RyOAketh4T9se5luWLNv5O
         pUbfnpvDnN26Bbcs11k84lLegvIN+5Gopb6FQ5ynjsXhcZ1ZVUu7tT8S5ZNYgPWob9Qs
         41BIvWvzgbC4I/UHYhIJ6QIxdF3hF4nWau43U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dCJ3HCGP29lDYW54JZ1uxaMqjTRTQXHhk3ZbqrpILl8=;
        b=imVnhR1ExsEseYPsFjr36t6m47SCEfJOp1e+2X+MP52VUVpTUZIj18Bu96rtp3P+dQ
         Wjs+HMzGymdryDilMAoJGZAnxfVdQsxc6nM8YZEdms4KGXcJ9Tf/1mMsEe5Bu/+drR6O
         ocA0KsWQwLvc+x/UwcgX4Sxl2Bnp+u3oVr0LoywEaFCbQiT1BHRi8uF0G5UoQmVhuzAr
         1YPO/a7eMo1EhBuOkrfoVrAaVWglrnbkvAC83IHiHsyjOQa5EJV0xU8ETey1ZPAPYkYo
         jRF/eLglSs0QTuHt0vbIjbmiIb/o54uPUp3N9eWG+1JxPCf1rzzG2UopD1R2C937h2he
         XpAA==
X-Gm-Message-State: AOAM530hgV1MQSUY162dyDSRW/vzmpHmBTndXjgTfLpm6HApo2L9I1bN
	2ZowASSz80YV6QGFl/5naJ5zdg==
X-Google-Smtp-Source: ABdhPJwigknPc5LKFXuuah8oBb+FDzWy6Kz+qIqcyBCv4yzd+Fjrix8CADp8RS8Mz0ng+V9e+UHaZA==
X-Received: by 2002:a5d:4a44:: with SMTP id v4mr638164wrs.106.1610056539704;
        Thu, 07 Jan 2021 13:55:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8262:2156:a38b:824c? ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
        by smtp.gmail.com with ESMTPSA id o124sm9910461wmb.5.2021.01.07.13.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 13:55:39 -0800 (PST)
Message-ID: <1a82dc66535b887eb4611580d7a773eebbef4c43.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 13/22] bash: update 5.0 -> 5.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 07 Jan 2021 21:55:38 +0000
In-Reply-To: <a75c31fd-9617-1bc0-e895-ac40802245ce@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
	 <20201228200436.78130-13-alex.kanavin@gmail.com>
	 <1b8809a765eb36211ecc39a9e096ac207178884d.camel@linuxfoundation.org>
	 <a75c31fd-9617-1bc0-e895-ac40802245ce@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-07 at 12:43 -0600, Joshua Watt wrote:
>  On 1/7/21 11:57 AM, Richard Purdie wrote: 
> > There is a reproducibility issue in bash 5.1:
> 
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210107-8jzr3hc5/packages/diff-html/
> 
> > looks like the issue in in redir.c and I think at a really quick
> > glance, the computation of PIPESIZE. Seems to tbe 0x1000 on some
> > systems and 0x10000 on others.
> 
> > bash 5.1 hasn't merged yet and is in master-next. 
> 
> > If nobody else gets to it I will dig further when I have time but
> > wanted to mention it.
>  
> I looked at this. It appears that bash runs a host program to
> determine the pipe size by writing to a pipe until it gets SIGPIPE
> (builtin/psize.c). I'm not sure why this would result in a different
> size on different hosts... perhaps the pipe size is configurable in
> the kernel? Anyway, I suspect that the fix is to add -
> DHEREDOC_PIPESIZE=4096 to CFLAGS in the recipe.... it's not my
> favorite fix, but the bash configure script does the same thing to
> set the pipe size for FreeBSD.
>  
Thanks, I've queued a patch in master-next for testing.

Cheers,

Richard



