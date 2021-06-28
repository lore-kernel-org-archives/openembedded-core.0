Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.7961.1624865018528787738
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 00:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fJlFnbN2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id w13so10662912wmc.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 00:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=4TYph5FeA9Iy8mH3Z/YoDWQvoI4JWaxd37d+Q+XP0iE=;
        b=fJlFnbN2Tdt9Fy59lYt4i+ht+8+2Z6QWiK21KlCEuY2NUySTWpSkD5XHDaQE6DHIal
         oyEhwGtnsJIMdeu9hal2qsE9lQs0YS3tK0Qn8cdtlO8HX8Bin/MXU6HL+CXrqzQDEAo+
         kglVuhn6cnXjvq3V9ApxftoHFsEDL+ti81w1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=4TYph5FeA9Iy8mH3Z/YoDWQvoI4JWaxd37d+Q+XP0iE=;
        b=PlwHejdhlud6A50x0bk5EmgL7YtlBTXdMoHxjN2oLCrOy5mQXPZ/ODyOEzSxmXteVm
         P6aKJE4TrC7UWNuyjCgAvIfCCcOB6L/lJuaBxSHymMbPMFPngAsuLR3aPU1Rdlz63j1b
         L6geEnY3hu6vNmaLDKIzWhUmrB0+NBLprhjiLZRRj+71tCHd498hB1oicwjAKtK20t83
         SAflZlF5qC7HQyO+IMv+0ijpvzhqrlehchRfkB2SkfC7Mx49Sv95HngqHNlvjobT8q3z
         YBmOXXHD7vNXbXW9bAA29mV8eHHutUS6INdo0Wh9qYyqWyTkQ5mSkQYV+G7TMGu5F/h1
         gCPQ==
X-Gm-Message-State: AOAM532lGjCtcpy8daFjSkq6CYBGPfi8QFL2qBrxFWu61THwBebRstmT
	waLxUVn8hrZCbO1uEQbYlhFdCQ==
X-Google-Smtp-Source: ABdhPJyS4FX6fyRabNaZQqKkSZxZOlQuoP7x3NOEf/w0eDmqrwnzB7F3bPoOnh/wMddjjTfG1AlOXA==
X-Received: by 2002:a7b:c410:: with SMTP id k16mr24187451wmi.28.1624865017016;
        Mon, 28 Jun 2021 00:23:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6f48:4aa9:490d:a26? ([2001:8b0:aba:5f3c:6f48:4aa9:490d:a26])
        by smtp.gmail.com with ESMTPSA id y4sm13677838wrw.71.2021.06.28.00.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 00:23:36 -0700 (PDT)
Message-ID: <eb4def6008fbb03a36417b5dcb9e42f1d3675498.camel@linuxfoundation.org>
Subject: glibc 2.34 upgrade pre-release testing
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jun 2021 08:23:33 +0100
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Khem,

I put the branch in for testing:

https://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/glibc-2.34

which resulted in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2292

Mainly looks like an issue running on target test builds not being 
able to find pthread. Also nativesdk patch fuzz.

Cheers,

Richard

