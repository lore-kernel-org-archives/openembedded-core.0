Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.1963.1607986839495631915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 15:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O7asnqmd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d26so4809603wrb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 15:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8j9LWlnZemfyvQisophi+V1KORdAwQtNqvlcs0HofyI=;
        b=O7asnqmdmBmz7TbGxGGAH7UnAnapxw/vtP/PN5ZASzSXxBkZ+3Sgb4r78EkIE/ggvP
         p6cvNDHSNC8GTZL+sxv7FqewqLXQWoR7vA6S11xN2fOYxd2R2R+oeE8v4E3a2rARjmp3
         PA0aaV+3I8LsDbV2mJhGPQfOiT4Y1LN4SrXew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8j9LWlnZemfyvQisophi+V1KORdAwQtNqvlcs0HofyI=;
        b=OZBbncXBSI0sKgs9qjlBvHVbAM8UCRJyoHo+V+qZE/d1BSQ82ShFVfjGHfPgntgQAx
         SR95yJSbN9yHJcrryNDmuu2o+3qqXbXVKut1Bq4YGfjOsmo79xpYoQO6SY6UUr1ls5z+
         FPRJ6pCmp06PBAPE5ujfDi3r7ZmArWpBtbHUgIP+98GEZJWqUb3/pCOs/f051b3djZ5J
         vtlR4VOexTG6ZQT4A4yrIBcVIFhHIimxZEx8rLQ6AkyCVgDIjefiScKT7YPteUgjTu6y
         bYtlLKeWIboI/kE6g/IVeLMlzyOSFotREwyDMNxKQhayeqRsqsVaKG/INloOKjMvzADD
         bpsQ==
X-Gm-Message-State: AOAM531+NOmA+TGJJ3K0b6IYhIUxjhhAobP550G2sV8hgYnlF8zWA4wS
	hItze3ED0SNpuYykQhcHz5rM/g==
X-Google-Smtp-Source: ABdhPJzfbt/xwuSbu95wSXrGbnplEMR+zUllR1T6Nj3X6oExYL41PEp6Lu0YE+fxLhlb4WFwlK/JAw==
X-Received: by 2002:adf:e541:: with SMTP id z1mr31176357wrm.143.1607986837571;
        Mon, 14 Dec 2020 15:00:37 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id f9sm7224117wrh.9.2020.12.14.15.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 15:00:37 -0800 (PST)
Message-ID: <042a1ec25c85b52dee25696ad1bd5393f39ff9dd.camel@linuxfoundation.org>
Subject: Re: [OE-core] I wish to drop my recipe maintainer duties
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Tanu Kaskinen <tanuk@iki.fi>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Dec 2020 23:00:34 +0000
In-Reply-To: <CANNYZj_xWix4a3eyFwCC1r8e+NieqJdKF7c184kfBS4RBQND4Q@mail.gmail.com>
References: <e4085caa6fe95c5d09a23a850fe8748c93323af4.camel@iki.fi>
	 <CANNYZj_xWix4a3eyFwCC1r8e+NieqJdKF7c184kfBS4RBQND4Q@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-12-14 at 20:16 +0100, Alexander Kanavin wrote:
> Unassigned is the way to go, yes. All recipe updates (or failed
> attempts to do so) are nowadays posted here, so they can be picked up
> by anyone interested.
> 
> Thanks for your work (of the highest quality), and totally
> understandable that you don't want to spend time on something you do
> not use.

Seconded, your maintainer work has been of high quality and much
appreciated, thanks!

Patches for things are most welcome as ever as your audio knowledge is
much better than mine and many others.

Cheers,

Richard

