Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.5625.1607345189581081518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 04:46:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TW57lwrV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id x6so8697953wro.11
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 04:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=74t/eMgMabY+07mNuClyLafOrHvIxr74TW4HxvLbWIM=;
        b=TW57lwrVwefRrtmcs4GnJkGjgA8UipwAuqlo8vSlv6ULrnT/WF64iaK8LBbrwlgrDP
         der5FJbBnHrii8Ajl2ubypI5vhUALLwG3aZgOi3X452xHogZhOy4QpxOuSqqgubFQ5zC
         JdUg8thax44bP+m1vN8Qo/c55oz10qrWqk/b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=74t/eMgMabY+07mNuClyLafOrHvIxr74TW4HxvLbWIM=;
        b=PjF2qp6/MSPJpjmHTLweC5/ymqs1j+UhUGNK/wI5QR+TI9Les3Qm039ajkC1Jzpcad
         qi9Y3GJqAGCPFAQsv8SsybTaq6Xbl4IZ/GWiwf7jRAq7gbMZhf6kD1HrAAsGJXlDDX0J
         I0GB/AUEIL4BcThh9FECHU6F6E+GggU+KV/HSIhTD5mH8Wo1oUoav2zM8+lF7noppnmO
         9OZI0masYSPDIcK8xH5eYkGlU3G3uUrNkFb7JoXAzScdt1bJGfzTUvqJwq3d9bEqgjvk
         K+BxEUfiCB7jC2T2WI1OukwkzKD9605XOhDt19Rcf5xhiGMM6HmrR9zX9j/VWyn9ubG0
         e2TQ==
X-Gm-Message-State: AOAM533EcQ6ci2qxvVLj563yjQGhs5On2KzWPsJmxdh8yiH3zzdBF7E3
	+I9HWPr+ACxWiBZ4VEvEAsqPlQ==
X-Google-Smtp-Source: ABdhPJz1sunCtuzNTtAppjqAKEOPY25rvTtnj3Jrr8c7NzEn0Ytdj388GoiAN/p3jImfSZ+fhSz3/Q==
X-Received: by 2002:a5d:4604:: with SMTP id t4mr19026546wrq.411.1607345188090;
        Mon, 07 Dec 2020 04:46:28 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.8.c.0.f.4.1.5.6.b.7.5.c.c.0.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.8.c.0.f.4.1.5.6.b.7.5.c.c.0.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c0cc:57b6:514f:c89])
        by smtp.gmail.com with ESMTPSA id y2sm14712266wrn.31.2020.12.07.04.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 04:46:27 -0800 (PST)
Message-ID: <88d9a9dea0420aa5944c0acba44f14f6eb24d771.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv3 2/5] bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Dec 2020 12:46:25 +0000
In-Reply-To: <CAM9ZRVsX+r31zxDHDNA7BOiBCrGyrwwYJWwMmjdF6p69QScJUg@mail.gmail.com>
References: <cover.1606846217.git.pkj@axis.com>
	 <b7bae6e1633fba206d9c7abad93d79fbe7b0f654.1606846217.git.pkj@axis.com>
	 <CAM9ZRVtVRk2CrBKeG=Ks8a+OPhTPKu6q=HctT39tKyYCbAguFA@mail.gmail.com>
	 <CAM9ZRVsX+r31zxDHDNA7BOiBCrGyrwwYJWwMmjdF6p69QScJUg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-12-07 at 12:04 +0000, Paul Barker wrote:
> On Mon, 7 Dec 2020 at 10:29, Paul Barker <pbarker@konsulko.com>
> wrote:
> To follow up some more: The entries in PSEUDO_IGNORE_PATHS are
> treated
> as string prefixes within pseudo. So if
> "/home/pbarker/Projects/Yocto/meta-linux-mainline" is added to the
> ignore list it will exclude not just
> "/home/pbarker/Projects/Yocto/meta-linux-mainline/build" but also
> ""/home/pbarker/Projects/Yocto/meta-linux-mainline-build".
> 
> I wonder if some more of those entries should have trailing slashes.

In most (all?) cases it was very deliberate FWIW...

Cheers,

Richard

