Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.2014.1612311516524788317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 16:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ejr02VfH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id c127so3715822wmf.5
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 16:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2fTnOtj1AgME2lWi0Lf2NAr2f5JaWbxMTOzkkAsvfRo=;
        b=ejr02VfHdUwxWgZO7s2myfSzA/zcBucLnDe2P1jxcCLNljCtTzbx75lWf+ZSBjNeLP
         kCu1TKVvOWiawbg+Tu9FRq0ww7FMyZUw7Qf2ogHKQ6A208h71gmwNpVtKx2w+ZqI/j9w
         ZboAldPpSozaktH9Sy+aE4TOu7nS9e0Vzwpzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2fTnOtj1AgME2lWi0Lf2NAr2f5JaWbxMTOzkkAsvfRo=;
        b=t9GWXV04WI50+dzke5ECezMFkQ1+JOaJmJFTs2AiljYZCkgDk//9jjLYO8psEjARi4
         g6Cvd+Lekv2MpApjf3VcTPxgtOEYFW2YHxL6e+6KnRCdkmc3oEnEs17UTL9lFMA0/9R2
         za7L7T8TsfBiFZwDsgEp3LQoYbZCw9m5JeYSVEQo0h6AqGgXAxDEEPWevs/XN62kUhMs
         GGzxIItUJLxMvwPAXn88hgClAR/oA1kzmZ6Ko3l5VdX3CIFERcpDIENUG2cVftVaupKt
         q71Qt4mfICfreDJRgNMXCKEXlMNSSUxYB2SuhOQfQeorFGU/GDkK/7/sMqykpsUfZ/tm
         oOBg==
X-Gm-Message-State: AOAM532mqU2N7Dq3fRNIF0wbH9SkUfAUJ9pJxZcTPOWB02NY0LRWf4Rj
	cIkSdD1YSqdoaF8NqYHYeOZ2wQ==
X-Google-Smtp-Source: ABdhPJyV5m2wjrKvg8udOCZhMCzNl1J3HMcqtRL90lSWbMgqF7nd7ei/kJEXvb91IV0yHADwg3DBDg==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr427930wma.76.1612311514878;
        Tue, 02 Feb 2021 16:18:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a910:113:8225:ce6d? ([2001:8b0:aba:5f3c:a910:113:8225:ce6d])
        by smtp.gmail.com with ESMTPSA id b7sm459527wrs.50.2021.02.02.16.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 16:18:34 -0800 (PST)
Message-ID: <5fa25102e09ce1403a6850ade90f9eb107a8c19d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add procps-lib to RDEPENDS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, "Qi.Chen@windriver.com"
	 <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "JPEW.hacker@gmail.com" <JPEW.hacker@gmail.com>
Date: Wed, 03 Feb 2021 00:18:33 +0000
In-Reply-To: <39f0c1745d9a3d31c7256f7851267b49e7f7c3d5.camel@intel.com>
References: <20210120050318.10376-1-Qi.Chen@windriver.com>
	 <165F4E547FA339C3.13584@lists.openembedded.org>
	 <165F4F23A9F2744A.13584@lists.openembedded.org>
	 <260643e582bbeee2748e08e1fd7ebee4adbef888.camel@linuxfoundation.org>
	 <39f0c1745d9a3d31c7256f7851267b49e7f7c3d5.camel@intel.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-02-02 at 02:57 +0000, Mittal, Anuj wrote:
> I see the same failure locally even when using the autobuilder
> configuration so it's probably not related to multilib.
> 
> I guess it's happening because procps was split up recently to have the
> lib installed in a separate package and that didn't result in a rebuild
> of igt-gpu-tools?

It seems related to this. It doesn't seem to happen on a clean build
but in my older TMPDIRs, shlibs2/procps.list seems to be persisting for
some reason and is making the package RDEPEND on procps instead of
procps-libs. I've run out of time today to dig further though...

Cheers,

Richard

