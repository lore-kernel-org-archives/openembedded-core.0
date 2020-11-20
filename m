Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.24012.1605871183439628328
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 03:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WJYrnZut;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id a3so9464836wmb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 03:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=W8ig3m0W2YrUPXDlY9kEu03BQrDqZpLPGKpV8zX5Rl4=;
        b=WJYrnZutWrABNaZPZO9H6sjfMFw/GHxykd9GX5muEJHo2p7n8j/dw08wg9AhVFjVwi
         qnS7Ri7eUsgSDvq0YdxVTzOVZpkjP9kK7IBFLFuxMIAgr7/kHUdrYmKhgdahTrqeDUu+
         WOcbqqKUNjz2+VXuWadIzV2zq76Jw/gxzUltA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=W8ig3m0W2YrUPXDlY9kEu03BQrDqZpLPGKpV8zX5Rl4=;
        b=isxRRfkoWect4y5BK6lWpaMH20fUgSMihnUCKnUO8C0F4CdTwIv3cjwiS5qgrHlYll
         0MqoISlU8ojEopHyv7v1PyAngSOTBCR68jxHVv2/awSw6Axgi+RHiwbWxcdY+YI75Zqc
         xMWgQXw1BxQa3E9ZA5wj8v0IaqWzIc1NJ0BUCt8uptDeA28YdkoGI45G3DLQhX0YrCW1
         nCSgXTcsxOJCBmpLKTgkVXyWkgcMvnI8NBVhH7E/x/PQVhzSuK6UvkxbIVqOYAdKXcrU
         782jqw4vmsrua43uGTQzlt7XZWi9I3QOfu2FOzL0qbT+1FbqH1qsKienMGlR5iYqfniC
         beFA==
X-Gm-Message-State: AOAM533HSmO8tAyy6+uPXf724uolJ8tN0lYAswysSJ6vwXXTMKg3qW1C
	PCroFUxLLUOtNOEh3D50eizrnssdDyPS8g==
X-Google-Smtp-Source: ABdhPJzO0UHRiB0h60mAycBwlLziHE/Dt88zt7b/JrV/EHFJOyQknVU2XepvN4VMkASdI+2AcHHYFw==
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr9253337wmb.39.1605871182022;
        Fri, 20 Nov 2020 03:19:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6000:b209:4d60:3b8c])
        by smtp.gmail.com with ESMTPSA id f2sm4837797wre.63.2020.11.20.03.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 03:19:40 -0800 (PST)
Message-ID: <c2a50c2fca652aa36dbb5694df47a939f1c1ae3c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] python-numpy: Add ptest
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: "Orling, Timothy T" <timothy.t.orling@intel.com>, Trevor Gamblin
	 <Trevor.Gamblin@windriver.com>
Date: Fri, 20 Nov 2020 11:19:40 +0000
In-Reply-To: <20201117225428.877691-4-raj.khem@gmail.com>
References: <20201117225428.877691-1-raj.khem@gmail.com>
	 <20201117225428.877691-4-raj.khem@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-11-17 at 14:54 -0800, Khem Raj wrote:
> Since 1.15, numpy have replaced nose with pytest testing framework
> it additionally needs hypothesis and sortedcontainers modules
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/python-numpy/files/run-ptest         | 5 +++++
>  meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 7 +++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/python-numpy/files/run-ptest

This series isn't quite there as it needs python3-pytest and I think
its missing some BBCLASSEXTENDs too.

stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-hypothesis' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pytest' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'python3-pytest' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'python3-numpy' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb RDEPENDS on or otherwise requires it)

Cheers,

Richard

