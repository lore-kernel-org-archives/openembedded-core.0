Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.280.1603123044909045445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 08:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jqz/7loq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id z22so298502wmi.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 08:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6bSt36bhIByb5FONlvRbejuiPbzDGQxG1Exuyl7+mWM=;
        b=Jqz/7loqeL2OhVPe3yNQZB3zGMfqYPqByxH9AhfddgwCZuavgsY/A3xwge6Qlpa2TG
         ES+UzYtCvpNx84uLQYvDni3WjYkIyIMBSplyBfU9UqzW76cbF9TrbqRd5mtxgmnI+2F0
         kGE9Zig8Qwzuk2N/F5tra/J+476KQ+ReRfFCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6bSt36bhIByb5FONlvRbejuiPbzDGQxG1Exuyl7+mWM=;
        b=sLflBI1+MKRIAedDUnp2/W6FKZTuyTOUxWEJugMRUEzWMJ+YNkhY2we3vGW1kmc30r
         mJMNNuso/0tqDXIlEdTpzzAjJLPXD0UNlnxk0hW1GLmvpGx3ss5VWcrzncxvm/YhiOTI
         iQFEaZyTVMokjNECBzw+zeX0iiYQB9f2J7cETX2Njo/zvwcsded0FASRaj2NDgUpDIRe
         VP1tjhlqP7BUVvhyU78Snx8yEPYdPRLV8VMWEi75vUSslAdQyeA1NNdGzfnsfkWqpG6r
         feXDwM1Otc/kw3FhLgAD2yKvzW2iV6PKIRAlwhx0KEThf8ZmHlex15MiR52Et8OTDtOU
         ns+w==
X-Gm-Message-State: AOAM531okUN/ugqdi4do77CkwJkWcThxYp4lMJG1HW+dNdAFJE9u5BSv
	WCk2dxx8L9ldSo+XgS6m93109wegcbqjkQ==
X-Google-Smtp-Source: ABdhPJyQRerxnpz9V8CpWSNYwVgSzv9MF0uuwYRrc+N+8KMpE2SGxYjrVwujAKL4jpW8J2TsJe7Wog==
X-Received: by 2002:a1c:e309:: with SMTP id a9mr89041wmh.90.1603123043191;
        Mon, 19 Oct 2020 08:57:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.c.4.c.b.d.d.d.d.1.e.7.a.1.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.c.4.c.b.d.d.d.d.1.e.7.a.1.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1c1a:7e1d:dddb:c4ce])
        by smtp.gmail.com with ESMTPSA id l1sm247133wrb.1.2020.10.19.08.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 08:57:22 -0700 (PDT)
Message-ID: <09b163b9eb3b9e17c7bc06f69d2c35c4d2cedabf.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for dunfell on Sun 18 Oct 2020 12:15:01 AM HST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Mon, 19 Oct 2020 16:57:22 +0100
In-Reply-To: <20201018101813.DC7D29601F8@nuc.router0800d9.com>
References: <20201018101813.DC7D29601F8@nuc.router0800d9.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-10-18 at 00:18 -1000, Steve Sakoman wrote:
> Branch: dunfell
> 
> New this week:
> 
> Removed this week:
> CVE-2015-8666: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8666 *
> CVE-2016-1568: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-1568 *
> CVE-2016-2391: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2391 *
> CVE-2016-2857: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2857 *
> CVE-2016-2858: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2858 *
> CVE-2016-4001: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4001 *
> CVE-2016-4020: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4020 *
> CVE-2016-4964: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4964 *
> CVE-2016-5126: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5126 *
> CVE-2016-5337: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5337 *
> CVE-2016-5338: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5338 *
> CVE-2016-6351: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6351 *
> CVE-2016-6490: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6490 *
> CVE-2016-6833: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6833 *
> CVE-2016-6834: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6834 *
> CVE-2016-6836: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6836 *
> CVE-2016-6888: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6888 *
> CVE-2016-7116: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7116 *
> CVE-2016-7155: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7155 *
> CVE-2016-7156: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7156 *
> CVE-2016-7157: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7157 *
> CVE-2016-7170: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7170 *
> CVE-2016-7421: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7421 *
> CVE-2016-7422: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7422 *
> CVE-2016-7423: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7423 *
> CVE-2016-7466: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7466 *
> CVE-2016-7995: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7995 *
> CVE-2016-8576: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8576 *
> CVE-2016-8577: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8577 *
> CVE-2016-8669: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8669 *
> CVE-2016-9102: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9102 *
> CVE-2016-9103: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9103 *
> CVE-2016-9105: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9105 *
> CVE-2016-9106: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9106 *

I wasn't meaning to sound negative in my other email btw, this is a
great reduction to see, thanks Steve!

Cheers,

Richard


