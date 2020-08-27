Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.14648.1598517799570568859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 01:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zy3TtW+x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id d10so3610150wrw.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 01:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ri2Fff7XIdEbO0ESUU631CST251D+1myRltwHrFR6+c=;
        b=Zy3TtW+x1JAuk1WHyAuI98A87XxLaD9wnCvMcmHay4Zopa9vkN5LPdKMoztJs8oiHD
         VpbYNdZfYfdcCGstGg9rrGtCBcLdbmtVhqfS5cTfjRgyTR+8bICwETPAZwQ2NlexZ0+p
         n1gmeL0Dp052xP1qV3Cs/qcKLVDXeWe2nRbXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ri2Fff7XIdEbO0ESUU631CST251D+1myRltwHrFR6+c=;
        b=kcZWV3XGkiFMyTkrpdCskzaOrQRqzGWCO7TdvM0i9axF5XfYO5zHEY0aZcAqL71NBR
         zPeaXOi2hhxi+y1rCRXYXGmRCrkcVZSCs25k5i78u54hKRtxhMXQ00ShOqw3H0H8GK6q
         BsckLszXT/+ju7+06teJxFQQB1xiWnfo5Tz73Ywv94lWcjsbHNqnxsf0XhlAAEz2TY1c
         5fAVFL2P29/1tcnUfJjJmxIOnXCofoX9daxfp82q3GGuUPDXLWZ7KLCsDWbz5BCkkWz1
         Q2HXplUTMYeYAXteMv6aYByAX/EPRTP2OYoiqNMKfGM1dd4fhJIsCiIQp5G1W52u0Dg7
         Zydg==
X-Gm-Message-State: AOAM531po1jq9LRCHmpVibC1WCAt/9D8G70pTMzp72/g0RFd+RqtqkhD
	y/9adyBdlqz+2B35cxniPDcDkw==
X-Google-Smtp-Source: ABdhPJy3CJV5sDEIBpHafTxQsJzKFIeOxKqYJKv1fS8cvffOruz4pGH7ELoR602dV4X5GiZJwIz3lA==
X-Received: by 2002:adf:d0c5:: with SMTP id z5mr13283584wrh.167.1598517797909;
        Thu, 27 Aug 2020 01:43:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id f3sm3586438wmb.35.2020.08.27.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 01:43:17 -0700 (PDT)
Message-ID: <0d4bd302ffe98c7418087822538b689484c1774b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lttng-tools: Do not build for riscv64
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, Khem Raj <raj.khem@gmail.com>
Cc: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Aug 2020 09:43:13 +0100
In-Reply-To: <CAAnfSTuhGz+wyguPojV_0YYE7VzPS4BZcBqXFu-=FjQAU2emmg@mail.gmail.com>
References: <20200826054101.856417-1-raj.khem@gmail.com>
	 <20200826140046.GJ1638231@joraj-alpa>
	 <94a29731-4335-5ab3-ae62-740f29c7627b@gmail.com>
	 <CAAnfSTuhGz+wyguPojV_0YYE7VzPS4BZcBqXFu-=FjQAU2emmg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-27 at 09:21 +0100, Ross Burton wrote:
> On Thu, 27 Aug 2020 at 03:17, Khem Raj <raj.khem@gmail.com> wrote:
> > > LTTng does not have a hard requirement on lttng-modules (on
> > > paper), when kernel modules
> > > (tracer) is not present kernel tracing is disabled and only
> > > userspace tracing is
> > > available.
> > > 
> > > Was there any report that lttng-ust (userspace tracing) is not
> > > working as
> > > intended on riscv64?
> > 
> > No, but lttng-tools have this as rdep for ptest packages which is
> > not
> > controlled via packageconfig or something.
> 
> Make it a recommends instead?

Those are still fatal from a build providers perspective...

Sounds to me like we should move the conditional skipping in lttng-
modules somewhere lttng-tools can also see it, then use that in the
RDEPENDS_lttng-tools-ptest...

Cheers,

Richard

