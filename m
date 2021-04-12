Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.30091.1618220727783640463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dGXwiN5P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id e7so3250647wrs.11
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 02:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Oy9ShV+l3D/zCt00ZkuZJFRo/mL9x+y7JVLkVjEqCuo=;
        b=dGXwiN5PqJQaQ71MgsOvB5Jq0Fh2VaFd2xwMMjplW+sk52rJFg8n0bjF8W6KEOK/IV
         uY9dJ6+8sns6MdS0Z7pLaHNF2dila/KRVWFnGd4AsECLvjaKBbc3kusPhegn1XN706Vu
         PgpDAexXGoG7ySjdtrAoBbwvyA9yEdJzCKhjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Oy9ShV+l3D/zCt00ZkuZJFRo/mL9x+y7JVLkVjEqCuo=;
        b=es9vVE9KcbvNpNlPMzTcq3ePsCqmuxNR20KBa/9NvogTTxadZmIumIXX00FAy5WKke
         V/ZrucB4JZur73x7b2BFrGjEHD21/JMXPc1nH3jfDRsDfTExY6B9Gvc+2bACO68t9NHT
         X5NCuvR3XxGJ14bEP56SOcNqMlEYbPwPoHpP9dD/o6mIc9f4jEJUcwL9E6OPEcICZXC1
         Q41oWDmynjVQHqny3k7m6C9m7gyD+aUaGNpRTkqH4ZReb+TvEYZDIqh49zBzBHbaRbNm
         UExcQuMvuR/t23HSf3lZaEPc3XgDoz6l3Bhy5lXYQbTrZ6Y+0VWc88djJAQGu7bXBG37
         GGpA==
X-Gm-Message-State: AOAM53188AHooza1HJk+TmvVTsFTbvQjPPCdx7fJhWCNALpxtc6fzalv
	n0uotTQHOW27ZaVKkkKZ0iLAcg==
X-Google-Smtp-Source: ABdhPJyUvcK6VbRriu0Kzj6SQbFQIbAUa/tLkTUFC5JzAfYzKavNBI2Mxh7uqmXl0CGGVlR/lF4qaw==
X-Received: by 2002:adf:9d81:: with SMTP id p1mr14310621wre.247.1618220726328;
        Mon, 12 Apr 2021 02:45:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4639:d550:9529:c277? ([2001:8b0:aba:5f3c:4639:d550:9529:c277])
        by smtp.gmail.com with ESMTPSA id e13sm17719144wrg.72.2021.04.12.02.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 02:45:25 -0700 (PDT)
Message-ID: <371a2847f4c93515b26990a787394d89f918fdd9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFT][PATCH 0/2] GCC 11 Pre-release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>, Khem Raj
	 <raj.khem@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>, Randy MacLeod
	 <randy.macleod@windriver.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Alejandro Hernandez Samaniego
	 <alhe@linux.microsoft.com>, Ross Burton <ross@burtonini.com>
Date: Mon, 12 Apr 2021 10:45:24 +0100
In-Reply-To: <2e67319e33b141cf9b772dafd87217de@intel.com>
References: <20210330213019.2300696-1-raj.khem@gmail.com>
	 <e0ae7b52770cea4b073f0e5d108af408781066cf.camel@linuxfoundation.org>
	 <CAMKF1spGGNJJ2bKVxjwikTDepYhsbeb0tqScQ2wU5UVGS_3LdA@mail.gmail.com>
	 <2e67319e33b141cf9b772dafd87217de@intel.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-04-12 at 07:08 +0000, Saini, Naveen Kumar wrote:
> (SWAT) Listing remaining failures:
>  
> qemu launch failure testimage:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/3278/steps/14/logs/stdio

This one is quite common now we've moved to tmpfs for qemu. It is probably caused by the
IO copy to tmpfs taking too long. The key message is:

"ERROR: core-image-sato-sdk-1.0-r0 do_testimage: Qemu pid didn't appear in 120 seconds"

and we probably need a bugzilla bug to track that one.
 
> LTP failures: 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1798/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1648/steps/12/logs/stdio

One of those is a duplicate of other LTP failures we've seen. The other is
where the qemuarm64 build ran for more than 36 hours and I ended up stopping
it. That probably also needs a bug, we only see that on arm.

Cheers,

Richard

