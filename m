Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.2892.1590572944280508935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 02:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sfi8euKk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id x6so9731124wrm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=acXpDXLUWgOWuXjVBaaUndcQy1fQJch6Z+fpidUIZZQ=;
        b=Sfi8euKkkNTMMVoYeA+agRhmcrquJxaTGo119Z0FBOtv2KYTNQ4oJtVVuFD9tSoN6+
         lIVX/ihO0vP3/Ag+dRbEjP6dtN18P10xApca/DZwprNHKz5CrmnplDKCg6if5g4fJjs7
         +pl9xMFr5puDMwCt+qGhleQzG3G3w+Y8vjhyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=acXpDXLUWgOWuXjVBaaUndcQy1fQJch6Z+fpidUIZZQ=;
        b=Soig4fGK4qO8XjNX2vRrQrU/MXC4XOajNAYQ+PTQdCDooQQ0JwslEiKO3k+0pitrsT
         /wpKamh9n4w0Q5gRcylHrvXV+/Ms/IxMZ0IRU5qAkr4PsLH+uv+vsaXtN4Y88n77c3rv
         KoP3Tp+LyTHL/KZ5UfwFpkQMK1ablknYqdGec+As/5fJaxbsANqUp82+IBdfWSmlyI/R
         xGtxLvEPgZjh11RbRucCuinlOjincwzWX+pUCsJzHt03lkHj2904LtljovOQ8Kt0/NRB
         TNlpu3GAmig4n20HdyhFAqJND9qBYCzsVaCbcAERlOaslVEWHR/StKVIh3ZX6wpDwU4g
         9HQQ==
X-Gm-Message-State: AOAM5308qPUWyWMAaZDgLXSCRdcngRcIFOpa/uT3DvSYSYmIy6URqtLP
	DvPI4gZhOYpXB/FArF8+dmb2vQ==
X-Google-Smtp-Source: ABdhPJzdCwVElQ+0iVirfkRrxpRxumGJj2ZwmbE7FZsJZR82D6h0oqAC4mhAm5OQJYOEuO4wIbsgGQ==
X-Received: by 2002:adf:9166:: with SMTP id j93mr22688571wrj.289.1590572942739;
        Wed, 27 May 2020 02:49:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h74sm2404004wrh.76.2020.05.27.02.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 02:49:01 -0700 (PDT)
Message-ID: <b575e6f22a31a360687917d88ba1af929b7c9ab6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] python3-pathtools: add a recipe
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Maxime =?ISO-8859-1?Q?Roussin-B=E9langer?=
 <maxime.roussinbelanger@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2020 10:49:00 +0100
In-Reply-To: <20200526051216.14143-1-maxime.roussinbelanger@gmail.com>
References: <20200526051216.14143-1-maxime.roussinbelanger@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-05-26 at 01:12 -0400, Maxime Roussin-Bélanger wrote:
> Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
> ---
>  .../python/python3-pathtools_0.1.2.bb               | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-pathtools_0.1.2.bb

Should these be in OE-Core or meta-python?

Cheers,

Richard

