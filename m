Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.26340.1594156204900716395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 14:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RmFxB7UW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id f18so643559wml.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 14:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VvLoX89QA1Sa9BnDHkN7jQzDoYJtpsl6+b4CywR8cP8=;
        b=RmFxB7UW84u5krco9qb00eosrWNtbKTKN69h9DV2t2YJ4Z5Lc8bDEqyjL+64OIQUJ9
         J6WQGoCa2w4NqeO9tDI2bZcFg42zZj5TBq2+qoeZYBbW3B0toodnfyKwOMSNxZzGEYOr
         /m986Pf6mrrrAw2YnOXZTzvY1QWDpTFJRnlZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VvLoX89QA1Sa9BnDHkN7jQzDoYJtpsl6+b4CywR8cP8=;
        b=Ii2Cei0bA552f8b9AeiaTxHgUM0E9qbv84s9i08/FrQ9dHPii91f2pu8fr+SLtJ2HI
         ynPby4fO+44GIRCxtXbEAUP6sVIdH0p2FvRS0RcCzcBiUZ6M/kjuaEoELGgoN0OcdSLh
         jnaqt7SPLydDQ66tYDHMN29IlGNJtvJ0om7H35tpWjUgkEnwHbz+2eMTyY4UUgiw4FyC
         qUmWxHIZMoUoHc85yFr1Wv6xpjQxxW8YyJY5088QRSb9R6aW6JTp+vibMHVe8xyFKgiW
         +/YgO6EVvVTWkCCUTpuu/V5vdQWuxE7ZXZ/vO5ppUxXTDVWcdI3ke2zMIAm0AnJVoSR1
         8Nwg==
X-Gm-Message-State: AOAM533nVaK4yxnSiLA5GpMg2GLOOyEuoziiF5YtK2XYGS58mdUk+EUr
	Ag0HrIGK9jXAG7xQwWkC/QXhuQ==
X-Google-Smtp-Source: ABdhPJzXSdDYqQJUvYQw5tQymUxUk1RzmUj5StmiAxwklAWf3FqReAReCB0gS2kCNRlZWsMFevFofA==
X-Received: by 2002:a7b:cb92:: with SMTP id m18mr4216685wmi.94.1594156203554;
        Tue, 07 Jul 2020 14:10:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id k126sm2784098wme.17.2020.07.07.14.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:10:02 -0700 (PDT)
Message-ID: <4380ad1a86fbdf5a181105226230089755dd6b6a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: make dependency on lzop-native conditional
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, "T. Ulrich"
 <timon.ulrich@kabelmail.de>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Timon
	Ulrich <t.ulrich@anapur.de>
Date: Tue, 07 Jul 2020 22:10:01 +0100
In-Reply-To: <CAJ86T=XYCDAD1jG2JTODSc-Oz9JmpPeNd0jXg9aeJbo88pciWw@mail.gmail.com>
References: <20200707092511.7781-1-timon.ulrich@kabelmail.de>
	 <CAJ86T=XYCDAD1jG2JTODSc-Oz9JmpPeNd0jXg9aeJbo88pciWw@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-07-07 at 12:47 -0700, Andre McCurdy wrote:
> On Tue, Jul 7, 2020 at 2:25 AM T. Ulrich <timon.ulrich@kabelmail.de>
> wrote:
> > From: Timon Ulrich <t.ulrich@anapur.de>
> > 
> > a native lzop is only needed when an lzo compressed initramfs is
> > actually present
> 
> Is the logic actually that native lzop is only needed if an lzo
> compressed initramfs is present AND and a plain .cpio or .cpio.gz is
> NOT present?

This patch improves things but as you point out there appears to be
further room for improvement. Not sure how much more ugly implementing
that logic would be and whether its worth it...

Cheers,

Richard

