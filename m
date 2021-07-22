Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.2610.1626984844473153160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 13:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R1reM96X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id q3so85961wrx.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rz3uA5CGYYj4eHsh00w85cqotKBS2xQNyA3XAjfgHSs=;
        b=R1reM96X6F8NbmHq+vsGZ5hf44wbgePkqv7i1zDdHOnEA5vcQceamuhpql44FLSIq+
         HYQSA7wY4eMu+15tT5iqpulOUClt9RVYWubd3GoNDrt2s4xS/vqh3Zj2hwrfIR0pmMHy
         5bzt6G2Ttep6iPo3p9lA3f8CWM1sqOacKAdwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rz3uA5CGYYj4eHsh00w85cqotKBS2xQNyA3XAjfgHSs=;
        b=OPnNpmzpZGIbn4NQBaHizA3EkdPyPhxp75hzdhZj2mlKJnWUt2TBc9o22+By6+el07
         RVGjDI/Pitrn20ibgHhUamyb4FZYTiRigrK5TY+WHspnczxIcPvXHEdgRdGd4+UhtuCh
         l7SHg3CNB3KvNoPWTyuzt/4Qn5tmdNOU8/bhHlztUBg29QorQV6x1BUYGQBc8MJLzFEC
         FKIRr8bd+/8XWW/nHhVsPXTPJHMcAcWIaTZkRSK33Rbc/PpIF+A0HH/ZtaMAqUHb9dU4
         iKrkzgEqpAhhuW1z53xaGE4ymsDodsygzTPGbhQc1fy2neweZrT3WakllFtbH1rFOo0e
         2hYg==
X-Gm-Message-State: AOAM5304vgYrHxd4NlzZCa7TSnz21UxhwTl1MBLkO2vfEh6sbxtx33jo
	5TdPloNbLvxpIscF8CAQ8SZnsQ==
X-Google-Smtp-Source: ABdhPJxMWh3DoYyjNiHlh2+DiE9oiV7Fo1WzUsSrKFR0VdVuSjxD87NBf0gfKiD5nY21GuG0Iod/Aw==
X-Received: by 2002:adf:e4c3:: with SMTP id v3mr1677015wrm.362.1626984843136;
        Thu, 22 Jul 2021 13:14:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8? ([2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8])
        by smtp.gmail.com with ESMTPSA id d8sm32211598wra.41.2021.07.22.13.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:14:02 -0700 (PDT)
Message-ID: <9d9b8223b1a9c83889ad934a97b83864630cca5c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libubootenv: Disable for ppc/ppc64 qemu machines
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jul 2021 21:14:01 +0100
In-Reply-To: <CAMKF1sr0M_Tz066uNr55jGW5pOvDh_i+W9vYor50zB83rHK3Bg@mail.gmail.com>
References: <20210704210740.581650-1-raj.khem@gmail.com>
	 <CAMKF1sqg7QMojTsPo=GSjzpEEb-QwmF8_GNXXj8SaC45wtJ73Q@mail.gmail.com>
	 <CAMKF1sr0M_Tz066uNr55jGW5pOvDh_i+W9vYor50zB83rHK3Bg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-07-22 at 12:34 -0700, Khem Raj wrote:
> ping^2
> 
> Is there any issue with this patch ? If so please let me know

There was an ongoing discussion about whether a patch triggering some of these 
issues should be reverted or not. I was hoping we'd figure that issue out...

Cheers,

Richard

