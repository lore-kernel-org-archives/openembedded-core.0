Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.1195.1610094233594211874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 00:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IkpxoC9k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id c133so7103552wme.4
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Jan 2021 00:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=G4tqaYuRbenGjcCG31rErUeXaGDAqb7nRZyDPzY2ZUM=;
        b=IkpxoC9k7L/A8MsCa9eoE/FlSihz/gQW1F6tZSJdHJsG9sNmFuqKiUSiRgCXXOiJhI
         Iw1udm4jaduGPd5Dsqnun4wGEiG71wXKEMK21kbISe5U/LM4MllB2OXjygUomTMQVknC
         jlswxj9BtYtMp3Dp9Rx71p7e48RJUHXxajUFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=G4tqaYuRbenGjcCG31rErUeXaGDAqb7nRZyDPzY2ZUM=;
        b=tgR+XJriLOiiJ7kLZeZXX0p7ICOI0JQlkgUSrL9lY27Zu1vIJk6zLjQ1areUj5bg8+
         H2VrX4yfexVWLncJ6ovvpHx4ISjVV1O/M4X8FfAN6oXXLPB0rQkbijDf4wXQ3GKYQOdd
         u0QQ5a5nnx78uEiSiPIAMS7wXVTTQJ7yHtYztno3/cQK/HU83+EYUVueNr7bW0gHVe2+
         YiJIPYT6RW6Yi7N+4yQgBb9k6yvrTtG+H3zU52hp30VFYvAbSB07KGAM2UJJHwh1Dmnx
         hfEGACn9vaBNpjMg40EiKp5sDpCFduqDe9t9wHWnZEaSM+1b5R8NEMpFN0NZFo9qi7Pa
         80Dw==
X-Gm-Message-State: AOAM531OKWwtUpYtFgO+Mcl+QQbY8G7+NlPl8Xsxb1McudaL1LzvudvV
	HvNR8c33H952FT2sAeqkaykslQ==
X-Google-Smtp-Source: ABdhPJxcPc74aBvsbPsS4H1vs2YZnpmqUSp1CXhbD3srxlqc4Rz967m1zd37FhnydPeZhU1UClUbQA==
X-Received: by 2002:a1c:7d58:: with SMTP id y85mr2019243wmc.50.1610094231914;
        Fri, 08 Jan 2021 00:23:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8262:2156:a38b:824c? ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
        by smtp.gmail.com with ESMTPSA id o23sm13119111wro.57.2021.01.08.00.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 00:23:51 -0800 (PST)
Message-ID: <5f94d003548fc2d0208b02d62773489507d03a99.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] buildtools-tarball: Add nativesdk-ccache
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de, JPEWhacker@gmail.com
Cc: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 08 Jan 2021 08:23:49 +0000
In-Reply-To: <X/gODKFF9WGz8e8w@korppu>
References: <cover.1609934927.git.liezhi.yang@windriver.com>
	 <0f8505614d5562aa94dea17eb6beea772c25e1d3.1609934927.git.liezhi.yang@windriver.com>
	 <0dbe9f701d6c6344adb0561e10dc2aed8ddb4b7a.camel@linuxfoundation.org>
	 <c37107e5-a877-8b85-46b8-c984466c31a6@windriver.com>
	 <3966f6f4c6c748f36c73bfccaaa36fdea6b34e63.camel@linuxfoundation.org>
	 <8eb45b12-acb2-ce3e-c821-3c381c1107f7@windriver.com>
	 <CAJdd5GYhJPMBc3nfiAA5aBm0wZyzYUuab_gR2pRCtcGfss6row@mail.gmail.com>
	 <X/gODKFF9WGz8e8w@korppu>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-01-08 at 07:47 +0000, Mikko.Rapeli@bmw.de wrote:
> On Thu, Jan 07, 2021 at 10:12:54AM -0600, Joshua Watt wrote:
> > We had the same problem with icecream and solved it by building in a docker
> > container with the version of ice cream that we wanted FWIW.
> > 
> > Alternatively, I think it's possible to roll your own buildtools that has
> > ccache?
> 
> Yea, it's a long standing best practice that an LXC or docker container
> or buildtools tarball must be used to get reproducible builds in
> CI systems and on developers machines with random Linux distros and
> versions. Host contamination issues have reduced considerably
> in recent years, thanks for all fixes, but I still can't recommend
> mixing builds from different Linux distros when developing yocto
> based products.

Whilst this has been an issue I am quite proud of the work we've done
with the autobuilder to detect and resolve reproducibility issues which
has now been extended to world builds, i.e. apart from a small subset
of known issues (~65 packages), OE-Core is fully reproducible over all
out tested distros.

Whilst containers are a way of avoiding such issues, I think some of
the recent issues would even have caused differences between containers
(though kernel config or the geo of nameservers).

I appreciate that it hasn't been extended beyond OE-Core as yet but
think it does show what is possible and that there aren't that many
issues, certainly the core and tools are in a strong position.

Cheers,

Richard

