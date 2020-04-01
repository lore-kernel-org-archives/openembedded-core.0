Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.2493.1585732824190800476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 02:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZednxhO7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id u10so29642576wro.7
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 02:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=0Me2er0jDVN6TRND44VvBjlVk6QSU8ZE9O3N/YtyLD8=;
        b=ZednxhO76PWjPTpQ6tYEyIqR4+sOvla5picoN0y7RhRHT9CwmQX7w/fJO0oQF1ZgPF
         qCgjVZ7FBJ1DqAmMwTTsmtfaYnaeJq0fRnc3O9D+6fhxA+S0ny8Ins1O2S3Nz9M7LSr4
         dWEv9w0cikQNKMJR0soZNtpmOsFK80iUpLRG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0Me2er0jDVN6TRND44VvBjlVk6QSU8ZE9O3N/YtyLD8=;
        b=shyxnUhWSGN836/BhDpARTFLOibhQl9vuMlWwDHVhptn1F0vjEs6KNZTVwXfx7QIbe
         K9kCi4fViuWy4Pnd9mQc7VDzc8jZeAaUxpXMEEkOuTvjWyAzHKkkjzQG/QMW0ORvFxlB
         iRKfkTq5li8gadB71Izcghc4hETAjw5BzUYpH+RwJQXv9Z0zE72TumfeWD9nIVM7D0rN
         SwW/Bua3GWRNrqMr5rRf19feJu229x6kMae+JLvhL8zbrB9Zat6fYIM3p5J9l501rgs/
         zOjRaRyGEdu0tR2Nq0tfpCz+P33bM+yPPHgZWcYlJYiUNHhstnvH/CtuRDneApF1VBAJ
         gSFw==
X-Gm-Message-State: ANhLgQ1z8Vu2uPOWaT7d5S80qofKPdxhwO+MPF+5omrjquhQlXHei2bG
	s9Q2DZu6H834miVTwbJOqNiatg==
X-Google-Smtp-Source: ADFU+vtaBIlpbnchtK8qqhDhzeXZHA++PZJ80RD6RoMPqLj9ho33CBVPw/Q5/x2zG8N/O213NgnOyw==
X-Received: by 2002:adf:df8a:: with SMTP id z10mr23671301wrl.278.1585732822651;
        Wed, 01 Apr 2020 02:20:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v11sm2120353wrm.43.2020.04.01.02.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 02:20:21 -0700 (PDT)
Message-ID: <796ecb1469a1944bb7386c5c6ba9bfe580795057.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] netbase: use git fetcher
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 01 Apr 2020 10:20:20 +0100
In-Reply-To: <1584350653-141457-1-git-send-email-mingli.yu@windriver.com>
References: <1584350653-141457-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-16 at 17:24 +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Use git repo as the the previous URL only stores
> the latest source file and fails to locate the
> source tar file if we don't upgrade timely.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-core/netbase/netbase_6.1.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Breaks reproducible builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/825

Cheers,

Richard

