Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web08.8911.1603270819196919188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 02:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e4/aodIQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: petr.vorel@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id u8so2105218ejg.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2020 02:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=6tLg4+F/bDK0lHr5bLI48RxHQ4pQp1B0nUTGeBGJJmM=;
        b=e4/aodIQi6OQ3cgojirdmuZkua7dAhZXLPQypik2BSEpkX6exzhDy3qZt0x1fgqsbi
         F40fhmAeOrwAGx2XiOhznf8Tk9kveWMg59JtJ9ufTsy9sGwFFcHI4DripWyCkTQumyWW
         xgNLkdlTTTkmgcm1LeYMdq4cpxIE2FegUD8xjAMShmfQy6qYRqpLdQ/vc6xMAEbuBg9D
         Wwk83RHrGorpUEJa3m94hzGhRMRwMzB1s4kGF14+nd7yh6q2B0I6fm6PfLqfkpEfyix7
         QVByByGFKskZ5HFk4/3Tx44yGOvP9iwIGVqnkNFYAY3HyVa+DFg+lGuSd1B2W1QpEm5M
         Vi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=6tLg4+F/bDK0lHr5bLI48RxHQ4pQp1B0nUTGeBGJJmM=;
        b=js6gAtRfq6SuidVG6/zHHvyPcthESuk1VCpZ3kVq7n29AvuVOMcfzDlj94I6gc/bo6
         5NH7AYPhBa5+RE1BJtdvATALDK9j4QUI1GLAT77p03ZzufaoJelI8hrgCtUBP3hzRDQM
         ESs79tekX8Fo1//bvjd2e8+w1xlDpbznMfbnN1wsGvDzqzWIzO2p0AHokXXk4z8IXNC8
         k5P9SSsBgrC8GXQisLjZQOnyLeMX0JpD2pOeZmq6ZUrr48uBngmhCUtLMebkPBzNJiNW
         y6AX9Nbjstf7HO58lr/YG727sceF1zCA+iQPwD0GjrQyRUOjSFHVrEqGKUYbLmqFxAfq
         z1DQ==
X-Gm-Message-State: AOAM531Wgu167C8IGgxQDKxwy+yRC1bRXOZi0vAnQPP/DVoj4WM77th+
	IzpYLMFXCoAyk7+9hydvqJM=
X-Google-Smtp-Source: ABdhPJzdJ/50kaGEf8/x1mIrYUcQ3v2h+TYgwpUMLKkIXmhYXB+7ipxRfloA3lEdBumTvj1XJugz6g==
X-Received: by 2002:a17:906:6d0c:: with SMTP id m12mr2417115ejr.498.1603270817695;
        Wed, 21 Oct 2020 02:00:17 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from x230 ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id ba6sm1685379edb.61.2020.10.21.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 02:00:17 -0700 (PDT)
Date: Wed, 21 Oct 2020 11:00:15 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
	Anuj Mittal <anuj.mittal@intel.com>, He Zhe <zhe.he@windriver.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Yi Zhao <yi.zhao@windriver.com>,
	Daniel =?iso-8859-2?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [PATCH v4 1/1] ltp: Update to 20200930
Message-ID: <20201021090015.GA4194@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20201020200945.3089-1-petr.vorel@gmail.com>
 <CAMKF1soztA23jZxjfmvU5Yc5BWAhYV4qen412ZcTdwjjkVDxyg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soztA23jZxjfmvU5Yc5BWAhYV4qen412ZcTdwjjkVDxyg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

> > Dropped patches (not applicable)
> > * 0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch

> these tests still hang on musl and seems to be incorrect. So I would
> suggest to keep this patch on until the tests are fixed.
Could you please rebase it to current master?
These tests have been completely rewritten and I have no time investigate it
further. Ideally please send a new patch to upstream (LTP mailing list).

Kind regards,
Petr
