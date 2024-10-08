Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5283CEF16C
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 13:11:21 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.8823.1728393080176915292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 06:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QYSDWZ7h;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37cdb42b29dso3544400f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728393078; x=1728997878; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxDIbaiyV6UZzzUVQkBnW7LmKfglR/TMx2zEu4RkURY=;
        b=QYSDWZ7h+P1zRhIFNZ7yaKhmHmyjO31zxxE6sdaZW/rR7b7i3jKG5jOU8ez8P3FhA+
         qIusV3ybWRgcw3gykl7V6WWTNvz011Kzw8p87j/efyX9kVkQziC+hSDPOPr17sPSeney
         WP/uSou4GqOhqK/a40rwwWzsuw83zoijuB9wgWX9XaGDcnFgoJHIZ/z18QfVMpP/emF+
         TLJycEdtEvMh0K6OeHTQ5VfOmCSxp1dYv1aD3JXwTHoWbfSS+IJ8cTqHw/qYnbGeofhU
         mikW0LdhPJj3xt027n1QJn6EDj2wLWhZVMslJRx2WYmuY5orVFPSPVY5kckrZGwHrmkD
         3URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393078; x=1728997878;
        h=content-transfer-encoding:cc:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BxDIbaiyV6UZzzUVQkBnW7LmKfglR/TMx2zEu4RkURY=;
        b=vLF5O7IRDSqWIX5YGMY0G4zYMYoPm7TNl/6FSSKQ5rJxgm0oLrkdaiue7skRzt1/cC
         QvogZTHUM4QCVWnk31IYFY8bJD2DOAQpqFiCRBuaWmaMoYPqpk1aLzNoc0CUVnCOqER5
         joxEqwrLoVR5hDPv9THry4hrdnsvQBDskiLAE0lvLV7Nhg0rxk7vduwGLAcRpsl1fXRz
         9JZoBnea87XWLKw85jhTarI4lsq8fTK29xFE1ImfAyrW5I94+mqgsXTmRRZP1yrYEVFB
         dlRwTMwJe2YcdhLA+VqyBFITmt/u0SZi03C4XFre6FFXnjUH/ESe4hytC/ZitC/co/l8
         M9wA==
X-Gm-Message-State: AOJu0Yw9l3j4JWkM28KaOofZT0qVX77GchMmJ4+simkLRNlPAgsD+ujO
	N/ZGzdpwaAxpR0tOXtji7ZZoszccFtBNSvz0mKK34UV17/VLdyUz4CRruQ==
X-Google-Smtp-Source: AGHT+IFmRXGTW8ZGo78O8+OfscsNziJT6cHVddSNlKNpxMbuN0WJIg1D7yb+1200FU8GA/QY1b+mrg==
X-Received: by 2002:a05:6000:1b09:b0:37c:cc05:3bf8 with SMTP id ffacd0b85a97d-37d0e6d8386mr9132474f8f.9.1728393077950;
        Tue, 08 Oct 2024 06:11:17 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691a541sm8106280f8f.34.2024.10.08.06.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 06:11:17 -0700 (PDT)
Message-ID: <8d4ad42e-eed1-46c0-a255-2fef4462ae96@gmail.com>
Date: Tue, 8 Oct 2024 15:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: [styhead] gcc 14.2 fails to build for
 cortexa15t2hf-neon-poky-linux-gnueabi
Cc: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 13:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205290

Hi,

I have observed a gcc recipe build failure in the meta-mono CI here under styhead:
https://github.com/DynamicDevices/meta-mono/actions/runs/11232177725/job/31223236463?pr=231#logs

The meta-mono CI uses the cortexa15t2hf-neon-poky-linux-gnueabi for its ARM32 builds.

Is it a known issue?

Thanks in advance,
Zoltán Böszörményi


