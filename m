Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F56ECD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 13:25:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.38295.1725283530214361544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 06:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eOsbgxiJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bb6d3e260so36494885e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 06:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725283528; x=1725888328; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJsLuL5sYQoFTMTMlHqIbMu3QjnckFZ2OzUpIiAhLhw=;
        b=eOsbgxiJp3nUrGtRq+bFq6qFDrTtsg1F/qXwHw6ziCfJXu6EexU6vTmINKcfQgXXM2
         7PDZj6jttuoj6yn16pj36AsLHW2WqZYisPhgqsgtshzv7Go0a1zbP0bn7XAQSXyDcuUw
         Qkm2lukqXd33ftcCcACYvm1hBqTTaOICYxPtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725283528; x=1725888328;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cJsLuL5sYQoFTMTMlHqIbMu3QjnckFZ2OzUpIiAhLhw=;
        b=FMdVJqhr6OfgpJ1s5eHW2C8pJiW/jCboJoT9+zPefZyDvPah3Vvvf8SxQXP/uZTde7
         ypBylcJVX2RAZi5hn7Su6RkmC8myFpeeYS788lz1YxhL8N02k9SLKCvPY6kc5rK3tXZH
         f4nmSrMVyIMBBr2z7V2fMQqhab/D5cX7QBTVocquqvCeIDPY1rINpZCAUi3ddO3Dh+nr
         juQVUncNTtK0CJgjTcRiGk0Rw/viYYoF7mrj+H4ZTsuilgRmyTi0eFP4FIn7NWU2035A
         E4bVawYmNg/SRR0k1DIWS/RGLcc1la3N8YdtudgOA56aFlQDNl6M32p98Y+QH07m++dY
         YnGg==
X-Forwarded-Encrypted: i=1; AJvYcCVmx25kZs7HPxuQajbCQLAJAetaJXSLh4KXgehmtdPIjd812YWB0aiVWLQz33qxBrU4XMSGUu8wLdPI42GY33kmmw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRgkXLV6LL81+eG44xO5OOuJU/ZAiRWiXKTvEJGgMLKCEBP7gO
	TPIJC5bjE6wlDKkHXwgK1KNv+cgXDUArMXz7c5OQ6KXisgfYqo/595m7/2Jx2NA=
X-Google-Smtp-Source: AGHT+IGU/xXpgfTYBuj/zcvWWz2sOC0WonIISqaiAnu5VrucnX0IhIcOS7fe4Ni+g/AlCf5tms+4pw==
X-Received: by 2002:a05:600c:1e05:b0:426:5416:67e0 with SMTP id 5b1f17b1804b1-42be48faa14mr48574245e9.31.1725283528264;
        Mon, 02 Sep 2024 06:25:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ed45:1ec7:2c83:ff6d? ([2001:8b0:aba:5f3c:ed45:1ec7:2c83:ff6d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb85ffbadsm131820645e9.12.2024.09.02.06.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:25:28 -0700 (PDT)
Message-ID: <80a6ff0178502645da085e436b354471e1530739.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 01 Sep
 2024 01:00:01 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Mon, 02 Sep 2024 14:25:27 +0100
In-Reply-To: <20240901111850.70472100436@builder.sakoman.com>
References: <20240901111850.70472100436@builder.sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 13:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204103

On Sun, 2024-09-01 at 01:18 -1000, Steve Sakoman via lists.yoctoproject.org=
 wrote:
> Full list:=C2=A0 Found 0 unpatched CVEs

Much as I wish that were true... :/

Cheers,

Richard

