Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.4212.1628324467423921345
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Aug 2021 01:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dresearch-fe-de.20150623.gappssmtp.com header.s=20150623 header.b=2FrqAYUa;
 spf=pass (domain: dresearch-fe.de, ip: 209.85.208.54, mailfrom: sledz@dresearch-fe.de)
Received: by mail-ed1-f54.google.com with SMTP id k9so16561003edr.10
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Aug 2021 01:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=/u8fer+yv0vPYGnM7R9Oo/TGI/Xtrlwr/OSW3GXU5cc=;
        b=2FrqAYUatU3EwM+xlkzItNiS0FmsjXwbSSbzBzHXqVNzgnaD0gk3Lx6BzB682a4e8x
         XHc4dG1Y4/0d2IBMplqidMEX3mnRWKFrQhyrs8x2tEcpx+2XH6FSNOsRIcEUC9M3BqkD
         YvMU+WyjdyGfxrJ45IpNREIJmb2XHALWaOnemV7brjvWjGX7euMDEYZiqSWnnlN3hzv3
         3x3JuU3Rvg9dCUIzSaJwpat7FTIPa5zSH8mI2frEJ+NC3sy7AeYg+F14uoZuPV8vNlfr
         g/QY3Gv7+2+dxMqclLpr/0Xgpri0OBONF2TpJN4qpYAeHm1EQMdqEFuMX7GLweLjB3TY
         18Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=/u8fer+yv0vPYGnM7R9Oo/TGI/Xtrlwr/OSW3GXU5cc=;
        b=CF4g0Ix/TdZ0i6sutBQ/U430OY85ksFbozYCQ2olC7167YyFdPVdhYkKiOYL7KKQoP
         yIaRhIBSFZ8LxLSthkKVd1FZaITfeHsjASEXM23tbDTFPF4ovprBfdKYLeBr3/4KH1AP
         UbIgsEDTEIph9EGXQyjM6nNG1DH77WolZ2vtNJ20NHIBGF1uYntl7mn8FW1A5CJVecC0
         TCvDomU1Myt4d4OqFswKHIQCr5GRKATqyuRs0kZBwmJiV9jbu+1bqBJVdVU4ZdMF4cNI
         hlLNXkfgv4XH2NzbzBpgBCKqWNLZyI9tYaWcSyAbYKnu3jxIKKidOQGHNp42z4mSN11J
         ctlA==
X-Gm-Message-State: AOAM532TT2e9TI9vJDPXodW/+oONj6zYoehd//fqBZ5gpH5v88FGnFxr
	PLGuCWbYnI8SBKJalaw1WMV09g==
X-Google-Smtp-Source: ABdhPJzQ949s2WtgnxS9qg4zSf9sZUnc1mDJqokDMKfcqPYq4ccyQPIXUckHnGrAEA+OYsgvKYj+pA==
X-Received: by 2002:aa7:db95:: with SMTP id u21mr17604856edt.152.1628324465544;
        Sat, 07 Aug 2021 01:21:05 -0700 (PDT)
Return-Path: <sledz@dresearch-fe.de>
Received: from ?IPv6:2001:bf0:c080:401::1? (recycler.deck1.zone42.org. [2001:bf0:c080:401::1])
        by smtp.gmail.com with ESMTPSA id f19sm258765edt.44.2021.08.07.01.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Aug 2021 01:21:05 -0700 (PDT)
From: "Steffen Sledz" <sledz@dresearch-fe.de>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>, Adrian Bunk <bunk@stusta.de>,
 Yi Zhao <yi.zhao@windriver.com>, Otavio Salvador <otavio@ossystems.com.br>,
 Khem Raj <raj.khem@gmail.com>
Subject: GPSD time will jump back 1024 weeks at after week=2180 (23-October-2021)
Message-ID: <ec96b538-d04d-e7ea-a9b5-e2f998c6b569@dresearch-fe.de>
Date: Sat, 7 Aug 2021 10:21:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a dirty gpsd bug (see https://gitlab.com/gpsd/gpsd/-/issues/144) which is fixed in the latest version 3.23 from yesterday.

Is anyone already working on updating the bitbake recipe accordingly?
