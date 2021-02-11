Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.12115.1613064915667719909
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 09:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HBz4Y68i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id l17so4734858wmq.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 09:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=cLPb8JKCRufSQO55aTj5UhKqN/nFmRG2TtJBmDq/Pxk=;
        b=HBz4Y68iHZAf9OlCUpOCCU3quyv/EkOwGfeok3gURMT0fyE5UjcUllWnq4hKEH9liG
         Zo6N2Haa9nz0yv8kvch+yZoU39UOI9lVD0km2HOS0KVbAURAl6XgYkVrvXBMOTVw6L1S
         rrM6ICrDjLQoLWlm2+X1AMplo4KOyVKNfhkm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cLPb8JKCRufSQO55aTj5UhKqN/nFmRG2TtJBmDq/Pxk=;
        b=LOu0FA8nSbU3RbQa3zY/bePDjmxYgEwNGACFYSXVqU9E/44N7hynAqVkjbdt9/LtXu
         bXyKK0GeFZCVdf5nmUTNOlLmlbTGEmaOxvljRfb8B+BpCPz5t60QX48J5n1b0pz0Jcbq
         G41Nf6cHLnm+nSr61y9s0nhTLu4OVHULQkRXCIzzWSzgTVo14EJw98wGTq62t3hef6ou
         dIFIN41Jah/XqtEmfedw0WIdC3i2gXvJCcPYhd5W697I5fio7xjtrgOz7Ue/Wthc4w2W
         R/i8+85qFxtjLFq/NGQHkPrG6ixJDW+Fl7h3oRkPNM9zTHicg7JPiV6m8GTbFMiVCLYa
         J9sQ==
X-Gm-Message-State: AOAM533qKHw+87pqvzSCfor9e4xwv664NbhK2ADOHGxLy5rhMAKXQAS9
	fEhR3rHYBfzU81QVYmPkIksMRg==
X-Google-Smtp-Source: ABdhPJxnQA7WNWXNG0gXP5vNPounA8VnyXd+cwAsTm7oOWRklzNh1xZuljahPZZ/0TVmJoD/Sjs6aw==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr6257703wmc.39.1613064913862;
        Thu, 11 Feb 2021 09:35:13 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1f44:6379:818:1e61? ([2001:8b0:aba:5f3c:1f44:6379:818:1e61])
        by smtp.gmail.com with ESMTPSA id u14sm10236971wmq.45.2021.02.11.09.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 09:35:13 -0800 (PST)
Message-ID: <9459dafafdf8f16b49a190dbf1711492b9daa3f8.camel@linuxfoundation.org>
Subject: Re: [gatesgarth][PATCH 00/35] pull request (cover letter only)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2021 17:35:11 +0000
In-Reply-To: <cover.1613058232.git.anuj.mittal@intel.com>
References: <cover.1613058232.git.anuj.mittal@intel.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-11 at 23:46 +0800, Anuj Mittal wrote:
> Please merge these changes in gatesgarth.
> 
> Thanks,
> 
> Anuj
> 
> The following changes since commit c63feb7e062750ef9d1fcfd6ee16f1d220f8a369:
> 
>   strace: increase ptest timeout duration 120->240s (2021-02-05 23:34:49 +0000)
> 
> are available in the Git repository at:
> 
>   git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next
> 
> Alexander Kanavin (5):
>   python3: split python target configuration into own class
>   python3-pycairo: use python3targetconfig
>   distutils3-base.bbclass: use python3targetconfig
>   meta: drop _PYTHON_SYSCONFIGDATA_NAME hacks
>   gpgme: use python3targetconfig
> 
> Anuj Mittal (2):
>   sudo: fix CVE-2021-23240
>   sudo: fix CVE-2021-3156
> 
> Awais Belal (1):
>   kernel.bbclass: fix deployment for initramfs images
> 
> Bruce Ashfield (3):
>   linux-yocto/5.4: update to v5.4.90
>   linux-yocto-rt/5.4: fix 5.4-stable caused build breakage
>   linux-yocto/5.4: update to v5.4.94
> 
> Chen Qi (1):
>   systemd: change /bin/nologin to /sbin/nologin
> 
> Dorinda (1):
>   sanity.bbclass: Check if PSEUDO_IGNORE_PATHS and paths under pseudo
>     control overlap
> 
> Kamel Bouhara (2):
>   npm.bbclass: make shrinkwrap file optional
>   recipetool: create: only add npmsw url if required
> 
> Khem Raj (1):
>   python3targetconfig.bbclass: Make py3 dep and tasks only for target
>     recipes
> 
> Lee Chee Yang (2):
>   openssl: set CVE_VERSION_SUFFIX
>   wic/selftest: test_permissions also test bitbake image
> 
> Martin Jansa (1):
>   image_types.bbclass: tar: use posix format instead of gnu
> 
> Michael Halstead (2):
>   uninative: Upgrade to 2.10
>   yocto-uninative.inc: version 2.11 updates glibc to 2.33

2.11 isn't safe yet, its causing failures so I'd suggest sticking to
2.10 until we have 2.12.

Cheers,

Richard

