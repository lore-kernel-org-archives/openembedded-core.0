Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.6739.1612027033988998682
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jan 2021 09:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ccmTVtlg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id q7so12030763wre.13
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Jan 2021 09:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bxlZdpwOpNAaEBVQHRA9tIfA2esRegccedfuyxE82fA=;
        b=ccmTVtlg+SZJyUuGVcUMeqr9w3WeDXdwsIY48rlEUjF/AtA/RMPZ5ahInNPFXnBTzO
         gaO83zT6ZboNlmCNnlw5jxGcYCX6OAiZrvsZcATl05tijKKqInABJrIFnDSRubnooMz2
         w/iKDWKSMrOFRpADgaEu6gp0Lve070W9tE5Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bxlZdpwOpNAaEBVQHRA9tIfA2esRegccedfuyxE82fA=;
        b=FWrZX5+ArLhB0SzAQZOwNsV/gpzc13VTDlcTG17FsrO3BQLrjst5cYDyLG7qFz8FVP
         s3bYpQayeHTogXI3o7gCrVtyEZLBmqzvqpP91AOEq5M0ErebzFiSifmeSlYbMnxv6e0m
         i/J8oT6oUUSQ4HFgICILBEWcIWWn8fVFln+RZ+bXZ+bSYwLe0W7M/GraPt35EN1T/hrC
         aD4VKC/cqXfUuNogyWsF0j0e4oz3dmd82Ph0+EeO3v4RSNeIAzq+SytjWHXmw85ItqkO
         65e+Xv7t44eDGOXwvv3AdZ3JUhnHUiXmEmmXJHUrqGHZmExy75kb6glhudLoe4/AzAkh
         vdRw==
X-Gm-Message-State: AOAM532MZ4wrwEq1K1hLwgNQSrDsmtaE1Y0c9+NY9R9L7xRlI9ZOLZTW
	hhmBqCGQBWTAS9I3H9LVRMcp9w==
X-Google-Smtp-Source: ABdhPJxWeWcBsH7avhAJ208NTcLkZXj0ntpX/LuEBK3SvYIoNpssbXMeMFn7u3QIaRk7ChqxhjsZTg==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr10638669wru.106.1612027032323;
        Sat, 30 Jan 2021 09:17:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1e22:34f6:7a80:adbb? ([2001:8b0:aba:5f3c:1e22:34f6:7a80:adbb])
        by smtp.gmail.com with ESMTPSA id n16sm15377404wmi.5.2021.01.30.09.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 09:17:11 -0800 (PST)
Message-ID: <dd06d0409cccb1a4bd6728a8b16e8e46b6fbc115.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/5] binutils: Upgrade to 2.36 release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Jon Mason <Jon.Mason@arm.com>
Date: Sat, 30 Jan 2021 17:17:09 +0000
In-Reply-To: <20210130071954.2695419-1-raj.khem@gmail.com>
References: <20210130071954.2695419-1-raj.khem@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-01-29 at 23:19 -0800, Khem Raj wrote:
> Drop backported patches which are already present in 2.36 release
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Failed in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1806

Looks to be at least two issues, the 5.10 kernel doesn't build with it
and maybe that nativesdk-binutils also has the parallel make race?

Cheers,

Richard



