Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.1881.1585073000582933121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 11:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gbyy/lY3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id b12so4272644wmj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 11:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EiutYhZ/z2SulX4XGfPMNvAfzh9yIP1nkqmHmbMhsP8=;
        b=gbyy/lY3OtshrKc1l7Ff/Sr9Zlpc/hrms3tRgmwwRv3omANBabe+ohwKkicPz8bL1q
         9VVktrFwBd9xHbqXdCIuD8LaEFBn9Ka4rQkRDtGfVnQS08fuZnbmwW/4VC3xMBLrAD6U
         3ly3HHZqfO3UiyfsI2BYKWAIyPAz3xVUPAefU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EiutYhZ/z2SulX4XGfPMNvAfzh9yIP1nkqmHmbMhsP8=;
        b=bDbXDLJ1kPJ5Hq8odIwQmhjJ+tRHuwtIkxSRYrusYV4su+Y46xl4mWqu1y1lYogore
         FpA4O6EHoEo/nX/ZL1og0AahZWZ4trpxzjgcUBvB70oHKF2GsDhloAt1GWf+tYQcqHov
         Guoby31eE8XTZljK6b4EH9YpKpYP/YpoaD2zZ86JQHr8Ft6x6F10u4BvA+kYAWcPOs6i
         dR0j6eW+LxHbFCN1OSkAgklYjX/OOdO/pb7W8Ez0I2YScu2Yg6iQQOW7HL1XOBTwdC5J
         0tP2S0VFizkOdhEy4GNiMb5dZJ2qWcj6+/TkuGlLyLJ+c3aZSsPgMkmo5k3a7hsktr5J
         Kglg==
X-Gm-Message-State: ANhLgQ0mDybcMhSDdvxWiuoBT/QTDxDRDklRo2MAM53enGA8bfflo2di
	xIjbKnkIXoiCn/2ALdQDeSVzVg==
X-Google-Smtp-Source: ADFU+vtI6d/D5aerOyM5Taho8Cu1cQVP/B+h1jQWJcu7oVg87SAX+0URsdj1T0W9pEUbDRx2wecEbQ==
X-Received: by 2002:a7b:c0d3:: with SMTP id s19mr6765459wmh.19.1585072998120;
        Tue, 24 Mar 2020 11:03:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b203sm5379878wmc.45.2020.03.24.11.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 11:03:17 -0700 (PDT)
Message-ID: <5e1f58719f8835201ddcd82bb19af555f5c2dcc2.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] security_flags.inc: fix flags missing from SDK toolchain
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Antoine Manache <a.manache@gmail.com>, Tom Hochstein
 <tom.hochstein@nxp.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2020 18:03:15 +0000
In-Reply-To: <CAMu9SpJmwRw9gmCJS4NkdhMuyNdVij_-C4AsyeLs+zb6+pV2fA@mail.gmail.com>
References: <20200324170259.3206-1-tom.hochstein@nxp.com>
	 <CAMu9SpJmwRw9gmCJS4NkdhMuyNdVij_-C4AsyeLs+zb6+pV2fA@mail.gmail.com>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-24 at 18:25 +0100, Antoine Manache wrote:
> I've already sent this patch few months ago but not taken into
> account yet.

Can someone explain more about the issue here please?

Shouldn't these flags be added to the SDK toolchain environment files
rather than coded into the compiler? Why aren't they being coded in? or
is gcc being misconfigured?

Cheers,

Richard

