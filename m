Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.14293.1597395889476886589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 02:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D5QF0Iy+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id r4so7661263wrx.9
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 02:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=GHm5z376bjGuMEBBxoC0X4VEfjztFc+6uB58Q24mBgA=;
        b=D5QF0Iy+PtenP8r5AZS2JNWL+aehyqBP4fb5Pfsg6BcAWGagPb0RgIt9+Tv03LAzCY
         Kp79xzeIhNTv4Ox4nhFAt8YQgN8jURBcW1j9RJFLQR9UuLkAmzPIKpwmiRwMvKfVFWY3
         mCMMDcmDNQ1I+eCwZAgcu4Gu6KKQOo8GI/W/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GHm5z376bjGuMEBBxoC0X4VEfjztFc+6uB58Q24mBgA=;
        b=llDLg6QVsL9NVf4AUQMHUMnF8OQrkpk8p1MOqi+S2Zwb4AofsYW1BppX8BP9lJNzsN
         aWmcDUpYJZsw4Lce8CPEGW0aOqtdP2vVkUtJD5GqOBNIDaBIO2HukSAd2Jp0BOZU9jgv
         fAbbeCtdW7RZ86VhlJrGLz4Lu8lXIT49+NKK7Ck5ko0//4SAXsGv9KzmBF87qy25jWaH
         U+aOS4W8H8nnERj0wkvOrCQDyPXpR1P1g6t81u1YyivtRB1pf+lFGGlIaqDabCIMNivl
         hmBbJvGgAg95OMkvcm585Mw2rcYA4U4ig8mF9gjmfUp9hG8FDYXat/eccFL6WSqShUHl
         dkaQ==
X-Gm-Message-State: AOAM532uxfHh7OVGGWUo53kshnyuJq3nxJJ3m79+PLCuqTS/PQMxPJLK
	R6zrejCzSCl70TnkihKDDld+BA==
X-Google-Smtp-Source: ABdhPJzxED3Zfb0vKTDPQDMMzet0/EsexArNjbEKeDhWFEBW5RX/hopEXYU8ltlutEeohENXkHYn0Q==
X-Received: by 2002:adf:dfc7:: with SMTP id q7mr1827585wrn.80.1597395888002;
        Fri, 14 Aug 2020 02:04:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:edc4:7dfa:277e:8b29])
        by smtp.gmail.com with ESMTPSA id p6sm13383293wru.33.2020.08.14.02.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 02:04:47 -0700 (PDT)
Message-ID: <defd0b2cb4166a058da0cd779c443b26e44baffb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2 2/2] libubootenv: uprev to v0.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>, Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Stefan Agner
	 <stefan.agner@toradex.com>, sergio.prado@toradex.com, Max Krummenacher
	 <max.krummenacher@toradex.com>
Date: Fri, 14 Aug 2020 10:04:44 +0100
In-Reply-To: <CALatG=7qEqtQZVoEHu=YAWujafJNtpAt1tR5NtKJoKecM6RFEA@mail.gmail.com>
References: <20200813102117.8726-1-liu.ming50@gmail.com>
	 <20200813102117.8726-3-liu.ming50@gmail.com>
	 <20200813190527.GA30737@localhost>
	 <CALatG=7KcQ-wqCVOsLD6_1CfM1F8ibR3RcTm2_G7QRgewh6HbA@mail.gmail.com>
	 <CALatG=7qEqtQZVoEHu=YAWujafJNtpAt1tR5NtKJoKecM6RFEA@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-14 at 10:16 +0200, Ming Liu wrote:
> @Adrian Bunk Sorry, just double checked your comment, are you sure
> "PV = 0.3" without git+SRCPV is a right way to go? This seems is not
> like all other git recipes.

Adrian is correct, if this is 0.3, PV should be 0.3. The addition of
SRCPV is only appropriate if it is some number of git commits past the
0.3 release.

Cheers,

Richard

