Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.41809.1601312620723211091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 10:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jsh7cn3+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id k18so1888366wmj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nMuDX4isl8NzBEoLN/in1EV54XN5Gw/UCbf0yytFl0U=;
        b=Jsh7cn3+sUSTW7xqE+7p56HmRcqFkLDlXzt/Ew1rJdbFyTagoxx11K/hIAmhWdnlwq
         0Zi4UDazWhE771j/31P13f9/hOqPwgp+eW9IDOQIatHn8C12VDsabZ43txVU9MiGp45l
         IPyb6y0QcmZCFXqapBhXCrcztskMqcXQqOgNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nMuDX4isl8NzBEoLN/in1EV54XN5Gw/UCbf0yytFl0U=;
        b=lHzRd8IB6paeuRgQ96xn+TEZ5Y2D8LCVrTiz61Iv3bD7ocPYYUjuoIJM1LfcEzvT88
         Yb17/N4v/GVNqTy5PYBzZ9stAHUIb4Jkw4zvWWHEqT9qlF06rbDxPtoNLH5DiTLsVn7d
         11Eo+BGJx0pw6YEMPziqrUBYS9QMupb/Hd1J2S5rjpflvBYEzYCgo9W2BTrrcM9WKl7+
         SwicA1mC0cUGEdJBcmcYxvjJPdQMArSmKXYZ6ih1uWEUaN7EWXA2vbH+yXd156sdHgRD
         1dJ49WDC4YYzJpw3CpKVjqmXmSEfEpNJA9yoY+a31ZTovVdSvChn15xfQxZvOWZIDJe4
         v4mQ==
X-Gm-Message-State: AOAM533oGf3wo/xy5cZvV1pLdtkI1uc9nFTevlYywRta38/9LCEZxXYl
	fwu1g2OTxRcNi3dsb3qU0wCjZQ==
X-Google-Smtp-Source: ABdhPJyGQ6pbtPH7HI1tpb1rahVVLs2doJtqPLnO4Iey8Y0SMa0prj+HYGcYYP0GpuFBcH/7h+Fq5Q==
X-Received: by 2002:a7b:c241:: with SMTP id b1mr176249wmj.98.1601312619152;
        Mon, 28 Sep 2020 10:03:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.d.f.d.8.7.4.c.e.3.5.3.c.6.0.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.d.f.d.8.7.4.c.e.3.5.3.c.6.0.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6c:353e:c478:dfd1])
        by smtp.gmail.com with ESMTPSA id i14sm2113349wml.24.2020.09.28.10.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 10:03:31 -0700 (PDT)
Message-ID: <984abe180210188313ee5de54f5db384a87eae8c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] staging: Ensure cleaned dependencies are added
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Sep 2020 18:03:29 +0100
In-Reply-To: <CABcZANnFcav_1wexy+OKccEuJ+verxw0yTdEF9YThkP6V9+M3g@mail.gmail.com>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
	 <CABcZANnFcav_1wexy+OKccEuJ+verxw0yTdEF9YThkP6V9+M3g@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-28 at 08:15 -0700, Christopher Larson wrote:
> I'd suggest using parenthesis to clarify the order here. 'a or b and
> c' isn't intuitively clear unless you know the or vs and operator
> precedence.

Good point, I've tweaked that in master-next.

Cheers,

Richard

