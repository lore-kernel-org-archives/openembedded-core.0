Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.6552.1627821902302049285
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 05:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aVVy1Ray;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d8so18023139wrm.4
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Aug 2021 05:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=HLIIY0BlKMQdEZ03MQEBAzFflTE+8EeGKTRkHn5GVTM=;
        b=aVVy1Rayo0gGyVMSFl0Kkmzd5oDyuGi8GfjN1qKtHAHpQg0WpTsELcrTr3ziMLjtXd
         NiEkdU4opTlHoPge59gif/ZGrj9/ir/1phHkNSoQW/hUaVP1NHQd+mCGplxMvzaDpl/A
         ijahcnYjFZCFuwwRPdTwt4hzpNzCIH0bS8Kvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HLIIY0BlKMQdEZ03MQEBAzFflTE+8EeGKTRkHn5GVTM=;
        b=Cwo/HW/57ts8DCY7GHMiUyCA1kcLLWapMUHyKs74ubK5YggbVXrzO6HzYwb0+hORCQ
         m0FGD37ExJTQPRgQzPVW6Ve8pY/1LE67AhYd/3yrwoIj7m8tSmyIGlJXkzcieOxW5e9P
         VUwh3o+oOAyL6VIyAaT3j8vSPFqhMLu9RfhrYfrAXem4uZCvQefIs+O9dTIPInmcxCz3
         UV0Dm9l37JfREJXinJDsC8AW/rjmh2tXHhtfQ4MSiKxKD13XzTLHJzYsNicXtSOx8LJt
         MgraeFu1448uBAQ1EFDoRXDuIf10b5OfzPDrYIeLsr3Yzuj0ccvBgyO/Oo4HJjycrirS
         of1g==
X-Gm-Message-State: AOAM531ppBnF8UeCAguVMV30U3IXShTblQ8i/mJUmM9MEQeO6AArLm7A
	RkGDesFiUWeRi39Z0xsmpeyxZg==
X-Google-Smtp-Source: ABdhPJymhadrIwHvpnA7JTzeNOCn3fPkPz/9G8wy5uqw/YHBOZCI785G650HnIjIuQE0t+wWI4tF4A==
X-Received: by 2002:a5d:5644:: with SMTP id j4mr13250335wrw.66.1627821900724;
        Sun, 01 Aug 2021 05:45:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9bc2:7fed:cd2f:1c0f? ([2001:8b0:aba:5f3c:9bc2:7fed:cd2f:1c0f])
        by smtp.gmail.com with ESMTPSA id l5sm8932739wrc.90.2021.08.01.05.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 05:45:00 -0700 (PDT)
Message-ID: <87bff30fe6f1c3b66d845bfa66ce6d556697b387.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: update 11.1 -> 11.2
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, bero@lindev.ch, 
	openembedded-core@lists.openembedded.org
Date: Sun, 01 Aug 2021 13:44:57 +0100
In-Reply-To: <3e853dae-7a3b-ddeb-dc61-d0956259e5ff@gmail.com>
References: <20210729235242.1230800-1-bero@lindev.ch>
	 <3e853dae-7a3b-ddeb-dc61-d0956259e5ff@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-07-30 at 10:45 -0700, Khem Raj wrote:
> Thanks Bero, this looks good, we also need to bump GCCVERSION in
> meta/conf/distro/include/tcmode-default.inc

Since this is a point release, that doesn't need bumping in this 
specific case.

> and RECIPE_MAINTAINER_pn-gcc-source-11.1.0 to 
> RECIPE_MAINTAINER_pn-gcc-source-11.2.0 in 
> meta/conf/distro/include/maintainers.inc

I added that tweak on tis occasion since the rest of the patch tested ok.

Cheers,

Richard

