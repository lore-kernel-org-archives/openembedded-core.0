Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.4555.1621074721915513892
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EmdP/Qte;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id z19-20020a7bc7d30000b029017521c1fb75so371588wmk.0
        for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 03:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0EJmDiBCDCKYDzJVk9IXNuGY55y/6stdU3cZCeHEu2M=;
        b=EmdP/QteIqCMDmBubnbvWVZ8t4L/4nIIyEJOAlCbHJpUSGevldHQ/qzI62S3zq9fOJ
         vn5ccSLw43akzqJ+KXIgV7mUwhQwtUCLhz5/otIaEoYmPChp+FuZo+HtARb6fFPd3i0G
         fP1ERTNOeripSiZPux/+zg9+CmBPHwkN1x4tmHiBpADxxQ7GeE/YNzuTkiWnynpmueg6
         7pywQ1uY19X0l/TG2ENpnNfWehI3Y1SmuDcDWVeN3XRA/YtvQDh9uu+rHxhJtGQyudE4
         okUsTJMkLNoeKE3/dRKem21qSgLznyWic6ov3BMYyw/YS6yPtdh/8DZbJowkdBae8tWm
         AmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0EJmDiBCDCKYDzJVk9IXNuGY55y/6stdU3cZCeHEu2M=;
        b=njopv2/+t+2uI2PbQj3u9jrfxPMjDJ25j+mDcR/+pompkpPtzV6nz17aTEoXos6/Pa
         WOBar3VaE9VQn3Ci4WARouIFHgqA911k2v7mqTzKnm7V4p+z6kjBI08WXm9Wye9Nus2a
         n9w7pJgTDTp/cbTaCpIyP15DxLiyURLYKeYBhawRZIO88Q8Q5kyGhBcs/EA8OuVGHLLR
         sxiFuLepbI72hPRHEofLdxIK310+orRre0o1x4QzYHKr9jMiy90eVm2Fqydit8XFilZB
         DqGKbBeYbKwP4Ne301OhoviVAGmECW6isrPSIL5aYCVNUjGPUMvHpqP/ujjGMQYaS76v
         UEcg==
X-Gm-Message-State: AOAM533KVn3q/CZcXaX/mDYgO8cvEmhCvZHMtWvAjVNo1pu587lOTWZn
	FNYcikZbLYuq30eYf0UtTiVFVIqJSFE=
X-Google-Smtp-Source: ABdhPJwgtt+JAkW1sTo0ImhvIx8jvrdcyXlNWY4mqoSXwPgnkXjncZrLn8lZd1+9IcsvHur2eP14PQ==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr54336026wmi.87.1621074720449;
        Sat, 15 May 2021 03:32:00 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-155-249.home.otenet.gr. [2.86.155.249])
        by smtp.gmail.com with ESMTPSA id e20sm915594wme.26.2021.05.15.03.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 May 2021 03:32:00 -0700 (PDT)
Subject: Re: [OE-core] is there an easy to prevent *creation* of some recipe's packages?
To: Konrad Weihmann <kweihmann@outlook.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: openembedded-core@lists.openembedded.org
References: <15ece592-a5f2-5ca7-db9c-2fd614ea6eea@crashcourse.ca>
 <AM9PR09MB46423C546EF564C11A177062A8509@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <a7ff2123-a71b-a4d7-abb6-85e17dcfe6e@crashcourse.ca>
 <AM9PR09MB4642F9F7EFE632E2F9E2443BA8509@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <719d9a22-ac63-712a-af92-a187cb65f251@gmail.com>
Date: Sat, 15 May 2021 13:31:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM9PR09MB4642F9F7EFE632E2F9E2443BA8509@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Let me just throw in one idea with respect to Open Source License 
Compliance and packaging - with "traditional" programming languages.

Let's say we ship a product and are in the phase of an Open Source 
License Compliance audit.

We have a couple of interesting issues here

1) Actually we just need to audit the "main package", which is installed 
on the target. Unfortunately we completely lost the connection between 
what's in the various packages and where those things come from. What I 
mean is, that we typically audit the whole source repo, which contains 
e.g. test cases as well, but those test cases don't even end up in the 
target. Which leads to "over reporting".

1.1) Now we could just say we need some license files which are in the 
repo plus the -src or -dbg package, depending on how things are built.
Ideally the debug sources are those which correspond to what's installed 
on the target.

2) What else is kind of lost, or not taken into account with licensing 
is linking. We only see each package/repo individually, but the right 
thing to do would be to look at the combined work.

If we look at the total project just auditing what's actually needed 
would help a lot time-wise as well ;)

Regards

(another) Robert ;)
