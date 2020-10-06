Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.14204.1601990850690615021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 06:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gXLwp0V3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id t10so13477133wrv.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 06:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=dOaoZfTdhZHSqQJPCKAHSf67+P3jynBuwPzrUd73qqw=;
        b=gXLwp0V3yC0yyu0v7E1TyCaWYnx77Y+W0GC8aQgwod5mJS1F8yvt0/lcS9r4I3RCuO
         fwAdT0H2jBgng+SIkxgmi4xPVl1+1h3ZcYqql4DKj3ZVxfyPLg0EGkrUk/n4WBuFOD9Q
         CRKlQ5CmW+w6V3aWRXHO6+JM0auAtVblqavEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dOaoZfTdhZHSqQJPCKAHSf67+P3jynBuwPzrUd73qqw=;
        b=K8UXaFzaIi905puEtAR+qZcITuPxzcY/VEv8EMjG6CIJs/103fby6p4zTRlBXoIeey
         JHV3yGaU2FYfw6YHIhySrRuHzJvEntubCz+CIO7OiwMYjTMgpqQ4y5XEIfSNsBX2c2lY
         cjm+YJAdFpif5XxUIEYQP3xhfkdoMydJ2dDANPNu+ywy/wD0H2PLzSYZf4034ZMeJv/l
         rGRheUBBZBd9KTGp51NWpcqDAsLWM3unf1S6wMRcdWxp8cGvUunVGz9mT3sXKcgicxXy
         HCfeHI3gSouJR3ZHogrOksvBv3nRMX1WW0CAOh8kJlX5FSZqZ5bSeUl7lwnJb97dVeic
         eccg==
X-Gm-Message-State: AOAM530o6Qj2U1MurgPeDJ9Ru84wBoYT2grAZleuPSdUE/eTsAuw6DTN
	6IYNoudnFjWLhK+3i/SCvXcAvw==
X-Google-Smtp-Source: ABdhPJzZygQklrR1TiG4LytgYpULM/fu+i+/OUZZClro3J17b9MnusBzjnfiPaD525HahLCS7TxNHA==
X-Received: by 2002:adf:ed09:: with SMTP id a9mr4855978wro.407.1601990849026;
        Tue, 06 Oct 2020 06:27:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id h1sm4422160wrx.33.2020.10.06.06.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 06:27:28 -0700 (PDT)
Message-ID: <7b89c7a13fa964cd4ce706137bbc41592431fea3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "kernel.bbclass: make dependency on lzop-native conditional"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Cc: mfe@pengutronix.de
Date: Tue, 06 Oct 2020 14:27:25 +0100
In-Reply-To: <20201005141838.8559-1-m.felsch@pengutronix.de>
References: <20201005141838.8559-1-m.felsch@pengutronix.de>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-05 at 16:18 +0200, Marco Felsch wrote:
> This reverts commit 1217ddf070261c5fe523729b2a833bd38f1e4ccd.
> 
> This commit breaks compiling if no initramfs is used because the
> kernel image can be compressed too using lzo.

Can we detect if the kernel is due to be compressed with lzo through
any of our configuration variables?

Cheers,

Richard

