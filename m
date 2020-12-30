Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.6747.1609337543027269551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 06:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MznPq2r/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id y23so4844423wmi.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Dec 2020 06:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zyo6/Emfl+3qwkRVLqihkay+XLr+R5OY8Z3WHnGhe50=;
        b=MznPq2r/GHdAif8DuFNpN02ExpEJFr8f2792bCJNOiF/ZvnwVolBeifogkru51g4uF
         W1Sy8xELP9m0vle/4I6xaZLCmCvtbpuUxvm7/b4cE61k9Af7U2tH2cXiHA5DQs94UKML
         GdeZ4Q4XMVQnesHxiiHR8ac9eEFzWNhub4wpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zyo6/Emfl+3qwkRVLqihkay+XLr+R5OY8Z3WHnGhe50=;
        b=kDfiFKhcFK91CetbEyFWddWBdjIlRgd+a9/Fb1rO2Hwdtq6IsrBsyoIA3Diyx02m+1
         iulqSVmJHxxXnulWDTmQTCax1FGypgERn5p4XMr+ai/4TXt8P+8nbXBmb1jpDxenJiTe
         pttWaw0EDaXzCvsVMAcugFj7pOVqvTn8heXW120Az/Q/vMwr9ThHj5vxAibZ4gTcZp44
         gEH+yIzIcIXyHlMmc4tCQwOe4eISwD76cCl/yS3RwibVzr/Qg2vsmxV+vhlK5XDUwRXJ
         dmGlIG9jB/Sw/vmhpZbTm7NGd4VRTKZCnGDvQiVah8rm/ENNkBU3hwPyFd0zipV4DmL3
         IwGA==
X-Gm-Message-State: AOAM533ivSlyehwOGcyTjmw+SSp81PK7CVbIG0i6LtPQhtuuZqr5FDSE
	LzD2HMleoukMJbUeqVES8bwpiw==
X-Google-Smtp-Source: ABdhPJy5S8WkF4y/QxPC+AnjzzXq6UTuQVWDYhBA3tNQgW5PFRZutav0Ac4xdOAGSz5NuWi7aAZd2g==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr8041300wmc.17.1609337541684;
        Wed, 30 Dec 2020 06:12:21 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.1.0.d.e.9.1.1.f.8.6.d.b.d.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.1.0.d.e.9.1.1.f.8.6.d.b.d.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:3ddb:d68f:119e:d01f])
        by smtp.gmail.com with ESMTPSA id b9sm7977226wmd.32.2020.12.30.06.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 06:12:21 -0800 (PST)
Message-ID: <6ebfbb38156d27a2c222a8d4ac5ec265902adc34.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] autoconf: upgrading to 2.70 FAILED
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton
	 <ross.burton@arm.com>, Ross Burton <ross@burtonini.com>
Cc: Robert Yang <liezhi.yang@windriver.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Dec 2020 14:12:20 +0000
In-Reply-To: <CANNYZj-3HvZVQVUG+BScF6qvT=Qv7=1XOTs0FDj-Xavgt1MLUA@mail.gmail.com>
References: <MADEUP.1650FA40E6DA26AA.26179@lists.openembedded.org>
	 <CANNYZj-3HvZVQVUG+BScF6qvT=Qv7=1XOTs0FDj-Xavgt1MLUA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-12-27 at 08:49 -0500, Alexander Kanavin wrote:
> I wish GNU would just let autotools stagnate and die (non-GNU moving
> to meson in droves should've given them a clue). But here we are:
> first new release of autoconf in 8 years.
> 
> Ross, would you be able to look into updating this?

Ross has a branch with these changes on. I believe in the last rc, they
forced an upgrade of gnulib which basically breakes everything for us
(thanks autotools maintainers).

Fixing the gnulib mess would be the blocker on getting it in, Ross had
done awesome work in pulling the rest together.

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/autoconf270

Cheers,

Richard

