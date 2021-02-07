Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.27472.1612736971629843722
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 14:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f95F/dvE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id o10so11142582wmc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 14:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=MnxQOeyI8ZXpovska/DgrcXOK3j4UOdC287Y6WhaEWQ=;
        b=f95F/dvEhCKJpaK7tPkUTy1aHxTc8vQqg/cjDT9OBTKb3Vr0rI6S3CzglxwNWkD9Y1
         w4mgHwkqoC4udzTQAIVFavGtMvO6WjDjb+6zChzdvv8BabWTyRmw5KeXEnu3bxTlqqhm
         1plbaJYtE2rxDIEyWI8lYmdEjwoWOm2BEn7/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MnxQOeyI8ZXpovska/DgrcXOK3j4UOdC287Y6WhaEWQ=;
        b=HpSQ4e7FIsJoV3sNUfYyr32XnKSa/7799V3kYVkBAUIwp+fMprjCJjXpU0SgNhJv58
         n3eNktS8h13538qMw6u66gcuE48ByRfo6xszwxejc3mkqTII1YVtWBhck9wfSXNAXh5+
         jI6/r3/Z80eJOT2U2JCmlv5hbJqBUQR7yP411DiYffC+myRc6ETMXXXBCC9uO4bksTJf
         M+h5MbHofA7HY/EhW6t+wrjlWki2L4PeHF+wb3xur4i+jgp5Ybs9NVJU0BRlnmRX3gmF
         2KBT9UsJQqEvacMyAZTykxtaoYCRiwBHaT0LqTKkkQcI++Jnj5z/n7NHOlkyw6H6bNCg
         XEaA==
X-Gm-Message-State: AOAM532Rn0Dez/Zvo4qkq4kszoa8+S/qjFhiuyuajx0R28Iv2HKKYB+f
	RveiBLtZ8IQQmA9Z8s8xygAKAvugVCWdlA==
X-Google-Smtp-Source: ABdhPJxIxINKexakg5xYicp5N5Cv1SPp0205lvUKMy+e56LhpVeH6hLSkYbkGTxt/uBU9lOvd1y6nw==
X-Received: by 2002:a1c:2e04:: with SMTP id u4mr12222200wmu.79.1612736970117;
        Sun, 07 Feb 2021 14:29:30 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ff1a:4654:ede1:462c? ([2001:8b0:aba:5f3c:ff1a:4654:ede1:462c])
        by smtp.gmail.com with ESMTPSA id o18sm9579428wmp.19.2021.02.07.14.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 14:29:29 -0800 (PST)
Message-ID: <049ee90a7c772d3b4850d6c2d97160c0e8538273.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 07 Feb 2021 08:00:01 AM HST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Sun, 07 Feb 2021 22:29:28 +0000
In-Reply-To: <20210207180401.2979D960302@nuc.router0800d9.com>
References: <20210207180401.2979D960302@nuc.router0800d9.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-02-07 at 08:04 -1000, Steve Sakoman wrote:
> Branch: master
> 
> New this week:
> CVE-2018-12433: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
> CVE-2018-12438: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *

> Removed this week:
> CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
> CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *

I think I'm seeing a bug in the tool here. Note that 2018-12433 and
2018-12438 are marked as applying to both openssl and libgcrypt so the
tool is bouncing between them...

Cheers,

Richard

