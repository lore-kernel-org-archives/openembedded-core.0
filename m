Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.7188.1594202035138800671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 02:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XITo/b1l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id r12so48116726wrj.13
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 02:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=s5nycc4ZOLY5Qe6AiORLDowrKubr5tycxvSk55qpXn0=;
        b=XITo/b1lbWjCtpPO8Tfr81geC/c74eoJW4+InCO/kmGeRT9YWRFxby3Ud180F7BPeW
         X7ufs101BYx++KO6YnkpBR6FEwZM9gYdJo2qv7Z9XbdaXuihpQqx4Jw5+iOPg3S7VXNu
         +70NxUKTd/uDbz2fAtIpMSzubqFo5ZaOuyAdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=s5nycc4ZOLY5Qe6AiORLDowrKubr5tycxvSk55qpXn0=;
        b=Q+Jbfk4KD3XWhmAnXioZ09okppVbzluNgw5TvEWkjitOOrNeH72qt2IaVU76c6VXh0
         czuAa5y50tn/81J7+LdkhSUN67Wd8Zer5fcyGJJyHfEjqOJCdjmKXa2mZqMyCxN2V63t
         wkGTZr+FdUceBq7O7/QhOdo5/ihzXp5Qr7/3cXYcOWmp9R01VoAbCEPs8dzRVv2hVQH5
         mhJNgzvPa2Od2iS+gp/4WQ5b3MAYJv17qsW17gZWdoIe7lla3Qqx+zSLv5nTE6ux/9la
         nSWx/dCiAXyAOqiAHm2MU5EMjs3VlC35jr6N+qF8ueEb85C6lPOMQpSykmUXl+2thSGu
         8dBw==
X-Gm-Message-State: AOAM533/nMoS/pHkCUBmf+ninvOndCQiTWCbSiDrMW93DBKsQC+6gdyE
	pmF5PkDw+xjuNtqd/5xpMAkbkw==
X-Google-Smtp-Source: ABdhPJzP+AYbrV90OGEJJAxCP4q16K7WoI89g/5zZ4Cr42+RYG5KzgVIt5BJ5iRpn8An2biA/AFHOA==
X-Received: by 2002:adf:de07:: with SMTP id b7mr62005686wrm.302.1594202033472;
        Wed, 08 Jul 2020 02:53:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j6sm5227251wro.25.2020.07.08.02.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 02:53:52 -0700 (PDT)
Message-ID: <7799b4ab6e0df7ccbee0064a08b34e597da33f75.camel@linuxfoundation.org>
Subject: Re: [OE-core] Patches are stuck in master-next
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 08 Jul 2020 10:53:51 +0100
In-Reply-To: <12184874.L5pGue1uWE@n95hx1g2>
References: <5614347.lOV4Wx5bFT@n95hx1g2>
	 <ec870c18ff3d28d9e0f45f9b128b380dd8b5d668.camel@linuxfoundation.org>
	 <12184874.L5pGue1uWE@n95hx1g2>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-08 at 11:40 +0200, Christian Eggers wrote:
> Am Mittwoch, 8. Juli 2020, 11:20:40 CEST schrieb Richard Purdie:
> > The issue is I still don't really like the eudev one in particular.
> > A
> > native eudev really doesn't make sense and I'm reluctant to
> > encourage
> > people to build such a thing. I suspect you can't convince
> > networkmanager-native to build without it (although I'm not
> > convinced
> > a native libnm is that useful either).
> 
> For NATIVESDK, I need the libs because I deploy a x86 version
> of our embedded application for our internal integration test team.
> Sure, I
> could built two cross SDKs (one for ARM, one for x86), but
> (mis?)using
> NATIVESDK for getting the x86 version of our applications works
> very fine for me.
> 
> For NATIVE, I need the libs for running automatic unit tests on the
> build machine. One could probably ask whether unit tests should
> depend on libraries like libudev or libnm.
> 
> Please let me know, which of the additions (NATIVE / NATIVESDK)
> are welcome. I'm only offering to share my work, I'm also fine
> keeping this in my private layer.

I don't mind taking the libnl change, I can see reasons that could make
sense. I think the eudev change is a little too specific to your use
case and isn't something that makes sense in OE-Core so I think I'd
prefer to not take that one.

If large numbers of people come forward saying they need/use it, we can
reconsider that but we're not seeing that at the moment.

Cheers,

Richard

