Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.16926.1618143445303823119
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Apr 2021 05:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aObUUYNs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id x7so10042016wrw.10
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Apr 2021 05:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MpCZBD0rIQD2DXzRvWTi4ndCzXoKi30FPTzrkMDyHc0=;
        b=aObUUYNseBxYcbukFYm4410F6Uji4n89Cq/F9QUiE/k/Eaq8p3Pt36ehTFg8nB4rVx
         wcAB2h9pso3idAXRoNkuIllOBOUxpDkJdCwIvkvQmCSXxQr9mOajC+o63kcy14zrXwOl
         6vUvY9QjCxJBTEnXiwTL62zhXtKgDGCMCgmhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MpCZBD0rIQD2DXzRvWTi4ndCzXoKi30FPTzrkMDyHc0=;
        b=N38duanDUB5YK3yx7xynWK3I0BlD8Y+vUkQXfM+6GyZhB/pw9l2ynaJDIk1nzMvSeb
         4l/z2eaRZRnSC4AK5Mp0eCO2pr3/rVOSG+4wXOz2bh63HqmPjDRVTFNFkVEaITdprDWH
         sBhfV60w7hJtM6wDdrJhAcVG6GvgDs6HGnI8RVXShwNwW/wbTTrsIJlBX3QyoImoejTI
         3p25s0ps3Tq0tRRkV+Mi6uU9+NlkptCNmFKJ7kJRFpnwr49R01IGVLKwHnOVc8DCsrdS
         tVdNVNbDeAGwt8ZUtUUDRdJ5X75/REVatLEHaMLmjzy022SXW6tydKmLWq9raEEAEFaa
         4oFw==
X-Gm-Message-State: AOAM530or+zsMJiNsDfpMoB4kkZVkthPgyiz1RdbQvSHHPcyXQtCThnN
	ej7ryK7yRj9JYda/2K5jmVDUHA==
X-Google-Smtp-Source: ABdhPJzS1ioGKOQE3ktHWCeK57fuklQ3K6xD6ScW4wspjGk0x7UVA2A0ntgDdTXQ1uOHvufuWSYpWg==
X-Received: by 2002:adf:fccd:: with SMTP id f13mr19408019wrs.222.1618143443689;
        Sun, 11 Apr 2021 05:17:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f26:aac8:608c:a5ca? ([2001:8b0:aba:5f3c:f26:aac8:608c:a5ca])
        by smtp.gmail.com with ESMTPSA id b187sm1891630wmh.17.2021.04.11.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 05:17:23 -0700 (PDT)
Message-ID: <e5b63b5a5c0d8aaeee01a78ac94cf771098a6bc5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] gcc: Upgrade to 10.3.0 bug-fix release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>
Date: Sun, 11 Apr 2021 13:17:19 +0100
In-Reply-To: <20210410084015.4110978-1-raj.khem@gmail.com>
References: <20210410084015.4110978-1-raj.khem@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-04-10 at 01:40 -0700, Khem Raj wrote:
> Drop aarch64 backports which are already upstream
> List of bugs fixed is [1]
> 
> [1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=298084&resolution=FIXED&target_milestone=10.3
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Delete duplicate definition of BINV

Seems to have triggered:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2005/steps/14/logs/stdio

One is an easy fix to the maintainers entry for gcc-source, the other,
a failure in a new selftest for sysroot posioning added by Ross, 
"oe-selftest -r buildoptions.Poisoning.test_poisoning".

Cheers,

Richard

