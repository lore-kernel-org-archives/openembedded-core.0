Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.12237.1591272674324855421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 05:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EJ87ntgd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id h5so5821958wrc.7
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=TjbH3WgrnO/WKdsDPfnvEtYU3qbkgkln/pOdkKkrqis=;
        b=EJ87ntgdoo0f5nLaJ1jfQ3Vou9uqeTl5QsLQjeURHfaddXoBTQZ+5aW8fGurnvB/CI
         n5GgTtwoxkkdOyrGPSf2QD5uBdb9mrvouRkd47yoCy7nXS41XPEmYw67t2xHYFBlPZ7g
         uh64DnY4TD2sCqFBuCR3kUY9ZthOLNBXSBvcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TjbH3WgrnO/WKdsDPfnvEtYU3qbkgkln/pOdkKkrqis=;
        b=qW/nl2y9IC7lM2Om8nFU1kIdJE8l5GH7idyyAzis1H62hOQmC3UgQWpZ6XVOSa4F8V
         lUVp+gX6FN35dhDiyxHhdXBOahvDUY+Hyw+g7rV/8h+IYb9jPWNAlqw6KaAS1JV6KJK6
         oY7cx16aNr0im+hi3S52KEcfR15/SjUJnLIv6DkA06Lh8LpGGwv/S8TbeGlRFS1fcjBR
         kzp0FkOtC6PKJ8GcGe2974LlhpV5dk1JhmSeYCi+uPj52Qk+tPyY5ydrwYJoT5hrW/bx
         cw2cGnzdUqrvsxEfxWbgL+GJa7nTvP0rtLJYgZULl18+49NrVdgF0IEjDuTZfsrqF1Kt
         hT5w==
X-Gm-Message-State: AOAM530iyUKxvSb+7qAqIVaXuhiGZKp5vw/luQA+LptSPmkBB9IQwORB
	W6pPPKYln5Q2uqeCHnahKJ704g==
X-Google-Smtp-Source: ABdhPJxYJN4z/cRFAHOzFLHXtPty9/CaGrHOZocJVNUGUijxywYsZcJ30UDlevfYyQXcZVDs1UIpJg==
X-Received: by 2002:a5d:45c2:: with SMTP id b2mr3925065wrs.323.1591272672740;
        Thu, 04 Jun 2020 05:11:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 5sm7182555wmd.19.2020.06.04.05.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 05:11:12 -0700 (PDT)
Message-ID: <faaa5a2d120eacab6825cf079e92aa220dd7b151.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][warrior] pseudo: Fix enum typedef
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 04 Jun 2020 13:11:11 +0100
In-Reply-To: <20200604120349.17455-1-schnitzeltony@gmail.com>
References: <20200604120349.17455-1-schnitzeltony@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-06-04 at 14:03 +0200, Andreas Müller wrote:
> From: Jacob Kroon <jacob.kroon@gmail.com>
> 
> 'pseudo_access_t' is a type, so use typedef.
> 
> Fixes building pseudo with gcc 10 where -fno-common is the default.
> 
> (Backport of OE-Core rev: a7d519f742aadc9110c2401f359254210a784f6b)
> 
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>

Does warrior otherwise work on gcc10 hosts?

Cheers,

Richard

