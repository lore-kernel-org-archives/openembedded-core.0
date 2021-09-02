Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.7427.1630591431829732647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 07:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=E6J0AeDi;
 spf=pass (domain: konsulko.com, ip: 209.85.219.47, mailfrom: trini@konsulko.com)
Received: by mail-qv1-f47.google.com with SMTP id s16so1157710qvt.13
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Sep 2021 07:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UxOsh/RQ7CKHQqTdd0Sqv2xpXSzv1MZoQF/8G9T7/BM=;
        b=E6J0AeDig/JgpXC1oipmxX5zYHVZ/8+Me9f2DcfaWQb7Okd8s947+6E/ZAuC70HQ1W
         iGrEt/hpTVndhy5cls4YE4ZTqzjgg9qyFgNyB9u1Ve8Q8DWH4XsluRlHXOUkEMdpMZ5Y
         DzxG9IG6ZmmY9A+4tfx0ZJErL9G8o22830pPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UxOsh/RQ7CKHQqTdd0Sqv2xpXSzv1MZoQF/8G9T7/BM=;
        b=dR+O3CmKfv2Xfi47gkcGAlfNlevXJMyLc6PMgo0ae9eh+Re1Id9M/VZuvpSoRFGRz3
         LQi+0i/ZXoNsq6dOo2zRByjdt7pt5501RoGQ3ZyLfkNfWRni1EL57JN2ubm7/7uFJL+/
         ROjqXoLyJ+MGV6R81Mvd2rP5BGMBEKZX6T8LTylJ4bTpD/tYYFWmmAmTmHV1CkrZ72R8
         CJLiqQC8nUkx7FAWi3dqxYAcUdkHWRgO5Q2ynr9WNjLIZvYg6vB7AnFk0d08iz03S+al
         ZmQkBq4p/sXvmwqEUBb460S4IR+7BqJJFnDWKC1k49YoVs5ZhePtYOHOZuySSbcZr2uZ
         /4Sw==
X-Gm-Message-State: AOAM532dgEluIPzpzdLbLLimQzH90mCLY8EuRBQV2Bp8SLvuWhblr7GU
	+rtYU7Q2G9wqUSFEj08TNq+/4knvSVLZslLY
X-Google-Smtp-Source: ABdhPJy8+OS7p1+9a+Pel9Qxbrb6LwO+OxFImckPEpvrR10yFDZHQ91bW4TywKfriYI0S/8A9oafGA==
X-Received: by 2002:a0c:b304:: with SMTP id s4mr1591292qve.34.1630591430839;
        Thu, 02 Sep 2021 07:03:50 -0700 (PDT)
Return-Path: <trini@konsulko.com>
Received: from bill-the-cat (2603-6081-7b01-cbda-95b1-4c42-35f4-d991.res6.spectrum.com. [2603:6081:7b01:cbda:95b1:4c42:35f4:d991])
        by smtp.gmail.com with ESMTPSA id r140sm1495227qke.15.2021.09.02.07.03.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 07:03:50 -0700 (PDT)
Date: Thu, 2 Sep 2021 10:03:48 -0400
From: "Tom Rini" <trini@konsulko.com>
To: kristian@klausen.dk
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] wic: Add extra-space argument
Message-ID: <20210902140348.GJ858@bill-the-cat>
References: <20210902131921.3378-1-kristian@klausen.dk>
MIME-Version: 1.0
In-Reply-To: <20210902131921.3378-1-kristian@klausen.dk>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 02, 2021 at 03:19:21PM +0200, Kristian Klausen via lists.openembedded.org wrote:

> This allows extra space to be added after the last partition and is
> especially useful when free space is needed for ex: adding partitions on
> first boot with ex: systemd-repart[1] and the image is tested in QEMU.
> 
> [1] https://www.freedesktop.org/software/systemd/man/systemd-repart.html

Well that's certainly interesting.

> 
> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 7 +++++--
>  scripts/wic                              | 2 ++
>  2 files changed, 7 insertions(+), 2 deletions(-)

Can you add a test case for this?  That'd help also demonstrate how this
would be used over just having a minimal wks file and repart.d conf
files to describe the rest of the system.  Thanks!

-- 
Tom
