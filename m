Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.1304.1590530758523632343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 15:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bV3qpuVm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id n5so1162494wmd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 15:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=CDB5t71tnZdH+jJIk07iquM57c3/zbiDJJTuuL0R+U0=;
        b=bV3qpuVm8NsG393EPlZAA4JjVVveNlFXXDVt28wiegunZDFLulqyQt8DIABGWysSW8
         zOopFaaejyHvHFPXuM9K9x6aWokyjzohoYnv+MhCsKYYZsdkptcddEScLO2lGGdmiAGG
         uOM0kK7M8ieeNXjMU9pwOBPte/xZZfrnUvEJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CDB5t71tnZdH+jJIk07iquM57c3/zbiDJJTuuL0R+U0=;
        b=nJSLz9vGrvtzWYLQ8XrT4Pw61sViie39q1UZa9ZzgGJ3CY/nANqlzzgz0H5PyqGD3A
         7JkXwwzpqAi+MzWl23fvIni2HJEJjrqT1x51e6zc7qzJ8ayUpWO2YgL4dpCOP160BTQh
         8ap7ndENw/ZsDpa8TFMK6ZcEAjR8YW0plH/eJrqAxl6j3jzsbyXNgBDD9diZcForSIq+
         LZponJ2VzkZD/MZ+vGZw54cQ/4Dz+N+fvrC7nwoyi7zTrRCkIk71Chlke9Fslf/HXNj0
         TZs/o0sT8uoszNeEQL+ST3o9GI8fQh6fSBg8MFa8je5oU/V3pSkuOjW7Sr87F5BtReJV
         lxdw==
X-Gm-Message-State: AOAM530vNjprYN8sHkI5C39OFVRitjtalEDCVQpYOS8QU3J40J7DNiv2
	ggkWCaHQQYOEmwGrasKMfS25pA==
X-Google-Smtp-Source: ABdhPJxEDeF/hcSugYG/dfVCID3HYX02fwU3yI99rgD5d6ZoucnjypRERXRWSYbvLFN7h+M7aLi/dg==
X-Received: by 2002:a05:600c:2614:: with SMTP id h20mr1204990wma.155.1590530756970;
        Tue, 26 May 2020 15:05:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id i3sm1019269wrm.83.2020.05.26.15.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 15:05:56 -0700 (PDT)
Message-ID: <d8fb73d69e2ce700fdcddf5a90ee810563a7b7be.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] multilib/recipes: Use new RecipePostKeyExpansion event
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jeremy Puhlman <jpuhlman@mvista.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 26 May 2020 23:05:55 +0100
In-Reply-To: <64ca506f-b276-0a4b-4f90-55433aeb2df6@mvista.com>
References: <20200521110914.2202188-1-richard.purdie@linuxfoundation.org>
	 <64ca506f-b276-0a4b-4f90-55433aeb2df6@mvista.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-26 at 08:45 -0700, Jeremy Puhlman wrote:
> For master I this looks great. We have been bitten in various edge
> cases by this in the past. You mentioned
> pushing it on to dunfell. I a little leary at this point, but if we
> are going to its kind of now or never. My feeling
> is there will be some fallout(which is perfectly fine on master, a
> little questionable on a stable release) in other
> layers.

Right, I tend to agree that its probably too invasive for dunfell...

I've posted a tweaked v2 of the patch which fixes some regressions this
version had.

Cheers,

Richard

