Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.2327.1588581061339916222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 01:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CZG/vTVo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id x18so19862348wrq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 01:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=094104/jxmzY3XVXwqIYH8ZciFoNdy7xwgBNQpj4Gak=;
        b=CZG/vTVoGBlTPDfj/maHYz/1wr1YxU7i2ccMK1XXQqLI2kgHU5kZd9cwyrM57iS9XU
         t/zwdTuEnf7NrVrNPjwJqIh3FDW1w7y4eFZZLew2QoU1ZMyhOocH5L5jXgno8tHZKI3Y
         QhHVLfENAT2wnxi6a0V5FO4enPkbnrs+BEfxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=094104/jxmzY3XVXwqIYH8ZciFoNdy7xwgBNQpj4Gak=;
        b=N8LocSM9NZuXKutqceC/7tVN8aVTTbq8H2obnQRA5dU1Nr4apNQKstF83TIVP6XCdF
         BMhnN2FMsdBOshUyG57no5QK6bAdDczdWRDqROHOQyaUZ4QnNB77J98IvFLHNQCs533i
         87KJTbzPGxPZZSJUiTLrvSkQonD/oQwbOgTeAoKbk6QKlNYoiQGpv6MfPvQ5LUuVoDAh
         kSdXGiE6/VByfp76zmlyuxBRoJSmNTW1rOjkYbJCHslhjfiYBSeDOUnCdyX/DFA1julN
         6y5j2aI2BwhoclYC6Ox1bcdPpFCIbOX/vRzbeuFjXLHg90Pfq52UJoqv8tbVCbPix77U
         z9Lw==
X-Gm-Message-State: AGi0PuZ7hwy3nQagfcGupHkzb+cwiqayZKRccrSdk8QRVlLEA1g8iDnu
	9mZ0RE6Flq7SQOs5khV7DpGQkg==
X-Google-Smtp-Source: APiQypIWEmt4JwKj68P86DABb9QmP35f6Gbxe/1EvQpDTjsBJVv0Gm9EOlRpRD4J7QCEuC3qMylLUw==
X-Received: by 2002:adf:b301:: with SMTP id j1mr17664349wrd.221.1588581059624;
        Mon, 04 May 2020 01:30:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z15sm16648751wrs.47.2020.05.04.01.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 01:30:58 -0700 (PDT)
Message-ID: <70c6d988d291d1e2953d4b57cc9e88c146785d14.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
Date: Mon, 04 May 2020 09:30:57 +0100
In-Reply-To: <cover.1588520452.git.bruce.ashfield@gmail.com>
References: <cover.1588520452.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce,

On Sun, 2020-05-03 at 11:44 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Hi all,
> 
> Here are the -stable updates I've collected since m3 of dunfell. I
> ran things through the autobuilder, and no new kernel issues were
> picked up.
> 
> The -dev bump is good for master, while all of the 5.4-stable bumps
> are good for both master and dunfell.

I pulled these into master-next and saw reproducibility issues. I
wondered why your test build didn't show it, turns out it also did:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/1024

2020-05-04 05:18:46,863 - oe-selftest - INFO - ======================================================================
2020-05-04 05:18:46,863 - oe-selftest - INFO - FAIL: reproducible.ReproducibleTests.test_reproducible_builds (subunit.RemotedTestCase)
2020-05-04 05:18:46,863 - oe-selftest - INFO - ----------------------------------------------------------------------
2020-05-04 05:18:46,864 - oe-selftest - INFO - testtools.testresult.real._StringException: 

AssertionError: The following deb packages are missing or different: /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-36044/reproducibleB/tmp/deploy/deb/./qemux86_64/kernel-module-kheaders-5.4.38-yocto-standard_5.4.38+git0+f405543442_6cb5b11e83-r0_amd64.deb
The following ipk packages are missing or different: /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-36044/reproducibleB/tmp/deploy/ipk/./qemux86_64/kernel-module-kheaders-5.4.38-yocto-standard_5.4.38+git0+f405543442_6cb5b11e83-r0_qemux86_64.ipk

master-next was:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/900

and friends.

Cheers,

Richard

