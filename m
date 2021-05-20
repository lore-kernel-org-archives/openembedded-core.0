Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.330.1621534195779270274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 11:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AbkS1Qc1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id t206so9748509wmf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 11:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=n7zQGOl8xCsSUMuyA8SdHQac4CfzSy+JMIRAyyy8bpQ=;
        b=AbkS1Qc1wStocDaDe84WeVAGHcpPulrTQYaOyal7K6Jahr0O83C2odRsPOgWiId1vU
         8AZ/apJYwGei11JESREX9yf6BnLT6Uo+ofHoyIkMb2S+UDP6+S+Zb5FqGy+F6dQ2YZAf
         9RWGyBdkIGvsWOkf364vyTsIbViexgi9Ut+ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=n7zQGOl8xCsSUMuyA8SdHQac4CfzSy+JMIRAyyy8bpQ=;
        b=KG18dPfVL3Fetk/bRtHpZoiz62BfkqGGnoPOZNoCiHjp6+J8ZJQ/PR/blvv+xeaf4q
         G76DvE0R1tb6hK8SVkcdM85117MuxvvaetFi9w4YCWMSqShdz3/h4OVO0FdQZfAgNvJq
         HUbHFCsMaFqjZ3+Qdbh/Ld3XjxxqTU1WutrfVo4q8Kt4ie+vRQXHgqsAa6Y2434ihxkJ
         xxH06fsVpOD52+5+Ep2xqVxklU86RK2lMsduAlhiXYLlO4gXr//0szEXVtMgakScxD7L
         MosotZuk4tcKd6GJu2zMXuGzcvYoGQrG7vaorDHbQVeCue/o4CP979VXzx38mNAw3mA9
         vzdw==
X-Gm-Message-State: AOAM533KntnYArN17Po2vrYG4AWJIewfVRXsmeFg+a9WaEzlgd2UUxOz
	9O0yBv2niNt7Km9T1POQh5+fRA==
X-Google-Smtp-Source: ABdhPJxKIrqAsaC8pLNNRE+D+UgIORRYmFgSP6M/pQWQaJ+10Fec3ig0Usyn655c6MRLYxCG6HtzMg==
X-Received: by 2002:a7b:c016:: with SMTP id c22mr5268034wmb.96.1621534194168;
        Thu, 20 May 2021 11:09:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:56da:83e7:85fe:8f81? ([2001:8b0:aba:5f3c:56da:83e7:85fe:8f81])
        by smtp.gmail.com with ESMTPSA id t17sm3818828wrp.89.2021.05.20.11.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 11:09:53 -0700 (PDT)
Message-ID: <8a5d37690356e7c9e063ca098e2ed532d9702da2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libxml2: upgrade 2.9.10 -> 2.9.12
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Cc: Jon Mason <Jon.Mason@arm.com>
Date: Thu, 20 May 2021 19:09:52 +0100
In-Reply-To: <1621468435-21509-5-git-send-email-wangmy@fujitsu.com>
References: <1621468435-21509-1-git-send-email-wangmy@fujitsu.com>
	 <1621468435-21509-5-git-send-email-wangmy@fujitsu.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-05-20 at 07:53 +0800, wangmy wrote:
> CVE-2019-20388.patch
> CVE-2020-24977.patch
> CVE-2020-7595.patch
> fix-python39.patch
> removed since they are included in 2.9.12
> 
> refresh 0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
> and libxml-m4-use-pkgconfig.patch
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...he-python-tests-if-python-is-enabled.patch | 33 +++----
>  .../libxml/libxml2/CVE-2019-20388.patch       | 37 --------
>  .../libxml/libxml2/CVE-2020-24977.patch       | 41 --------
>  .../libxml/libxml2/CVE-2020-7595.patch        | 36 -------
>  .../libxml/libxml2/fix-python39.patch         | 94 -------------------
>  .../libxml2/libxml-m4-use-pkgconfig.patch     | 29 +++---
>  .../{libxml2_2.9.10.bb => libxml2_2.9.12.bb}  | 14 +--
>  7 files changed, 35 insertions(+), 249 deletions(-)
>  delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
>  delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
>  delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
>  delete mode 100644 meta/recipes-core/libxml/libxml2/fix-python39.patch
>  rename meta/recipes-core/libxml/{libxml2_2.9.10.bb => libxml2_2.9.12.bb} (88%)

Fails on the autobuilder in testing in ptest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1815/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2104/steps/12/logs/stdio

Cheers,

Richard

