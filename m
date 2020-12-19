Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.7631.1608377505724722622
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 03:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YsaC7Tbr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id n16so7454873wmc.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 03:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qBL8S86wG/Lrgnas6UXGE75XzT9LiwDLZoel3ypJRuE=;
        b=YsaC7Tbr2MBfw1dMoxzcBo/yn+t7mep/CuC2i1H3x5yOtr0zCeoZLbCx0N/SjhyHKf
         G6R+V1MkF1KXYb6LU4lUlZBWMkUskW3JmJPPEA+tL3DABof/rLR41ZYw+gQabRkXzV6m
         wcXQFltxakXKN8SgQ0llbXZlrUuFAXKX/EaWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qBL8S86wG/Lrgnas6UXGE75XzT9LiwDLZoel3ypJRuE=;
        b=drI5peF96SS0VuzjMZt3mhqhFtD2ExAwvwaNKYgI5Lt4QpJHH2VyJBneuCnXX/D8ay
         HsKveI8qEKo2shpuHRI92S3dQBJtMw9byira721DuTr21yqymdtGcMRV6W7YQg1ygC7T
         T1ejzU0CtvVZl9dBN2n0mBGL/CXIRBM722nhxcpjAJIIj74NLSd75NEQGnJ5sUBgGkCm
         N1bZkeX/1NQSwFUclsbMqOard68MieEj5hZMf/X8vbkDhocdLSKx3D78wBXwzvkqj0P7
         L8eDOW1CmHspe0nOpYEmJMMoE/Nn8BmMxwEd40TrX4JLtmn9UFRAx491TSzJ1XDMcqcG
         M26g==
X-Gm-Message-State: AOAM530HIra3brrUXXmG1B91npjTXdZshuLj6dKaxC8YrO8kYWp+3SQw
	UrwJOBxZRC3L49aoxKPHN/7tQQ==
X-Google-Smtp-Source: ABdhPJzsCm5EPNr/YdtGFSY+xOLWeYAWYE2PW+RUq0cJwCZmW5PnkL0Yzo+pRw0zriEEQTF9SCcBVg==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr7846275wmc.139.1608377504102;
        Sat, 19 Dec 2020 03:31:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id l11sm18185076wrt.23.2020.12.19.03.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 03:31:43 -0800 (PST)
Message-ID: <faff0743666a4ef199d2902a1611a83ee5c2a4a9.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/8] linux-yocto: consolidated pull requesrt
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org, Paul Eggleton
	 <bluelightning@bluelightning.org>
Date: Sat, 19 Dec 2020 11:31:43 +0000
In-Reply-To: <cover.1607958349.git.bruce.ashfield@gmail.com>
References: <cover.1607958349.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce,

On Mon, 2020-12-14 at 10:09 -0500, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> 5.10 dropped this morning, so I'm switching over to the libc-headers
> and reference kernel upgrade (5.4 and 5.10 will be in master, with
> 5.8 being dropped).
> 
> But since that will take a bit to sort out, I wanted to send my queue
> of patches for other fixes/versions.
> 
> I didn't pick up any issues with local testing, so hopefully this
> won't
> cause any problems.
> 
> I have the lttng-modules patch from a previous send repeated here,
> since
> it may be easier to take it as part of the bulk update. I checked
> just a few minutes ago, and there isn't a new tagged version of the
> modules yet, so we still need the backported patches for 5.10+
> builds.

I was able to merge part of the series but there were some warnings
that came up:

meta-intel:
https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1020
poky-tiny:
https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/3105

so I've deferred the kernel tooling bit until we can figure these out.
That means several other patches which depended on that also couldn't
make it in.

Cheers,

Richard

