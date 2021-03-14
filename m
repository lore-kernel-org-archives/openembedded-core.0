Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.8207.1615739467859000121
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 09:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hpK7DYWy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id b9so4491519wrt.8
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 09:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RuAghHkB+iwgmS2+redjNgCzqDcGST/QxCT4c425P/U=;
        b=hpK7DYWyclExwPss/Uz6YEN6O4zXAS+xn0WW5WFOis4X8W+gRUtwp7kggrtTZV0DBz
         +1MlL+CEDGPYcPs5kMZKJnZ8t0o45EFEEbQWoZ6q+OglP9G/FYPMQ86+VxhzsXv3cjJ2
         3l8oQHVZsLd+6oP80L1/QTtzotb7qzIQX2tUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RuAghHkB+iwgmS2+redjNgCzqDcGST/QxCT4c425P/U=;
        b=WFZ6u8PNhEZUeFIOGdcLRuxni4NaS7D08frg0vk8aDcibiGfJDEGI7VTd/iqmJW4xH
         8dtmot/mDKZ/JNh5GVyaegk4ea4EMOtyhta8kESBOinP5AlRgL+FdigN6McGgmdpyKsM
         iJpP3Q7tqSEjFnnTG5ewYtcfe2UeuthdcRatW9nOerwJ6D4CMcM55LdYqE4MCZX4Dl28
         k6GzT+XJ/huarKRK4IGzRKjOSroxjfgb7dNFat4CKCtK0FNbqAEVStvn61ZZ2cbzNj3V
         tLRvo3AMa6ng+lYdcNTVp4RSo05g6MlPw36lz2lPbMh9DXVE7YMmVM8Mc0qelvBerreG
         625w==
X-Gm-Message-State: AOAM531i+hUimygwqGXjoFyvNfanKf8WUpcoGOwE+qWzgkH8xwxmAP+o
	nn4H80DeULZD0Ngf7PpmMVBBaw==
X-Google-Smtp-Source: ABdhPJxdSyC0XenYzCoxOK8kHf+oNPVhJ6rA6x42vNRfUsbrza7S1knnmSfoF/rKkPOH68LzobJMBw==
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr23169659wrz.11.1615739466231;
        Sun, 14 Mar 2021 09:31:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9c7e:acfa:71fe:22ea? ([2001:8b0:aba:5f3c:9c7e:acfa:71fe:22ea])
        by smtp.gmail.com with ESMTPSA id p12sm15612652wrx.28.2021.03.14.09.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:31:06 -0700 (PDT)
Message-ID: <729a07918ea4baec2608d1f462c4a4bdcd593551.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] go-dep: Remove
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Sun, 14 Mar 2021 16:31:05 +0000
In-Reply-To: <20210312062107.1549935-4-raj.khem@gmail.com>
References: <20210312062107.1549935-1-raj.khem@gmail.com>
	 <20210312062107.1549935-4-raj.khem@gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-11 at 22:21 -0800, Khem Raj wrote:
> go-dep was an effort for dependency management before go modules, which
> since 2020 has been deprecated in favor of go modules. Since its not
> developed any longer and go mdules is officially supported, this should
> be retired from OE-core as well.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
> ---
>  meta/classes/godep.bbclass                    |      8 -
>  meta/conf/distro/include/maintainers.inc      |      1 -
>  meta/lib/oeqa/selftest/cases/reproducible.py  |      1 -
>  .../0001-Add-support-for-mips-mips64.patch    |     54 -
>  ...bolt_riscv64-Add-support-for-riscv64.patch |     33 -
>  meta/recipes-devtools/go/go-dep_0.5.4.bb      |     30 -
>  7 files changed, 145701 deletions(-)
>  delete mode 100644 meta/classes/godep.bbclass
>  delete mode 100644 meta/recipes-devtools/go/go-dep/0001-Add-support-for-mips-mips64.patch
>  delete mode 100644 meta/recipes-devtools/go/go-dep/0001-bolt_riscv64-Add-support-for-riscv64.patch
>  delete mode 100644 meta/recipes-devtools/go/go-dep_0.5.4.bb

So we also need to remove the go-dep tests?

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1950/steps/14/logs/stdio

If so, is there some other go test we could replace them with?

Cheers,

Richard

