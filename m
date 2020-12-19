Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.7253.1608374024786988730
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 02:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=URpYMJFp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id v14so5184694wml.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 02:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=KK6DcmefOTiOQX8gkPi2F5Ei5qC4b/lIwPSPNg2cVMk=;
        b=URpYMJFp3uwufNlikfiBOZ8+B+AvK+LbRXsfrBDHHyFIuGHvcq84IVMHKu5nvkbmuf
         7gXGtd8dj09M7Cgm0UX9AiOt+uv8DXG2iPIK+yYx5UkaxtRhNHyIyNRoOOqPyfBhfqBK
         mPOxGPworu3FdrpkhCaUgDmCLhsRqi9+MVsA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KK6DcmefOTiOQX8gkPi2F5Ei5qC4b/lIwPSPNg2cVMk=;
        b=CfKwfioYAOb5/8wDYDZEPOrt2NwePoNSsI/MXzwH4WqJQxJfik6+/zAJY9qZaOv+O3
         Z2pIw/fHN/m8/XZpOhV/aNjPBE5JsunOd3y5kOKVIuDjM2eChOEKryh0ksVahaTnSjIw
         D/0dT+Ofp1TgUrsJBoz2PJbx7NmnVpnQ8fUkKo4/bOYywUIjLFvmT+ImFjeuhSfHdupe
         yi/W60s6Zj61I7MaZJ6tLF/A8JmJBwe6wrx/JVDu2/qe0wFARykUtbs4qO9i+PyfEahK
         L9EbShPJQJEF6qLmYvLM4E12XzoTM2HFayuPUBtwlFo6/no2J6BVp7HnnFAMPEWs63d/
         KgtQ==
X-Gm-Message-State: AOAM530/2Z9Fc3zfhMuSOp3YKqcmKBPXowUgB3e7M4Nn3gqAUO+w+BMZ
	V9ER6mQ75Adu8a5vFDtroQGv1w==
X-Google-Smtp-Source: ABdhPJzZKBnB9rs++NN8Th56g1HAHpAv0nM30w0Trr59ZGZ3PHdNII9NKCI4tf5AttgEEUKmoCiFPw==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr7597566wmk.70.1608374023033;
        Sat, 19 Dec 2020 02:33:43 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id i7sm18053627wrv.12.2020.12.19.02.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 02:33:42 -0800 (PST)
Message-ID: <d99eeb3827bb4c66c423dd40a4bf321dda36ed4b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/5] systemd: update 246 -> 247
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2020 10:33:39 +0000
In-Reply-To: <20201218094256.3796401-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201218094256.3796401-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-12-18 at 09:42 +0000, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Update systemd to v247.2.
> Add rule for new oomd dbus conf and for new pam.d
> conf directory in /usr/lib|lib64.
> Drop selinux-hook-handling-to-enumerate-nexthop.patch,
> merged upstream.
> Drop 0001-meson-Fix-reallocarray-check.patch,
> merged upstream.
> Refresh musl patches.
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> NOTE: the musl build has only been build-tested, and only on x86_64.
> The glibc build has been built and runtime-tested on x86_64 and
> arm64.
> 
> v3: Updated to 247.2 and dropped another patch that was merged and
>     one from v1 that is was merged too.
>     Added ${nonarch_libdir}/pam.d to FILES to fix build failure
>     with multilib due to QA warning.

Thanks, the reproducibility issue is unfortunately still there:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1662/steps/14/logs/stdio

(there is a second issue there from other patches in master-next too).

We do need a green build to be able to merge so this may depend on
someone else looking into that reproducibility issue. I did try and
give some hints in my previous email, I'd need to look at the code to
be able to give any more pointers.

Cheers,

Richard



