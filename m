Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.8069.1596812940788094192
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 08:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gwkHFPrb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id 9so2018660wmj.5
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2URvIUzhE9TVsTEJJ+Kej7qkU3xIWrTylxCedb5W44U=;
        b=gwkHFPrbTlUoCzFB7nzW22sOBwUKcaK6TzU9yy/55eGsMrPW+u4nGne9Xb/+jh0pdi
         R9mmD0aORfbwgx3zzyHYaYkB27FwSmTNzgzRHyn8tAQ0f8dqmSPuJzStwmcDrXDLqHxA
         6qReuNYQs4R3oyxOYu9RSCrSrWMhE8WVojCM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2URvIUzhE9TVsTEJJ+Kej7qkU3xIWrTylxCedb5W44U=;
        b=M72IYSBXG8vry8LkEnM1OYPb6DaSe0Vuhova0kaLrCh1CT/hX5dc7ru11EFhNX38Xj
         K28EeQdgZYFhLl2kQTJr3BlYBb+oSpY1mv44ykpxsjsP2ZEE9KhqEXvMMw1cNVaDKD9e
         PEz5Ip3VkCEdnxAZQ4DFX1lplLqnruhu4DdFK51MlcQKtKTkfV/AgT+uLdmRleMEzQDQ
         lgwnZtNaJm/l7VzyT2x6lV+hXtIDrCoitirTjFufUePlyMbLQCOWYSTP4whPwsAjrmqg
         z5XyTNPsZaDvPit4ckwTkeeBfRH6O63YCsK65w2Ln/s2enErfSI93MmWdNZxshsBTCas
         QJ2A==
X-Gm-Message-State: AOAM533/8UrYHAeOfciIxZhB3FunvFzbSCQ19Cw6rLL+wICA6qagdxZq
	ex8EXVMpKFJ4qdKH+K+oSK8wVw==
X-Google-Smtp-Source: ABdhPJwuzq9m3ugKLxPJDd3EaoCz1g7fYeIxai3EoFVS3yU/AhpYSvdc5t3VR2ungAltr1y+Nza8NQ==
X-Received: by 2002:a1c:c1:: with SMTP id 184mr13981399wma.105.1596812939296;
        Fri, 07 Aug 2020 08:08:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f98f:bfec:7aa3:2ba9])
        by smtp.gmail.com with ESMTPSA id j24sm11646414wrb.49.2020.08.07.08.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 08:08:58 -0700 (PDT)
Message-ID: <e12d8db71892e6e8b32c897af382a5fcba1bee20.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCH] systemd: fix codesonar warnings
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Amitanand N Chikorde <Amitanand.Chikorde@kpit.com>, "raj.khem@gmail.com"
	 <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Anuj Chougule
	 <Anuj.Chougule@kpit.com>, Aditya Tayade <Aditya.Tayade@kpit.com>
Date: Fri, 07 Aug 2020 16:08:57 +0100
In-Reply-To: <MAXPR01MB34089A990650B474A09C851BFD490@MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM>
References: <1596790670-25319-1-git-send-email-Amitanand.Chikorde@kpit.com>
	,<57532ca51c2af5673966e242c4c5414441707429.camel@linuxfoundation.org>
	 <MAXPR01MB34089A990650B474A09C851BFD490@MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-07 at 14:45 +0000, Amitanand N Chikorde wrote:
> The patch is having 8 fixes of which only 1 is applicable to upstream
> systemd. 

This implies the issues are in patches that Yocto Project is applying?

If that is the case, why aren't we fixing those patches rather than
what amounts to patching of patches?

> The applicable fix is up-streamed to systemd project ( pull request  
> https://github.com/systemd/systemd/pull/16625 ), it is merged into
> upstream systemd master branch.
> 
> We need to upstream all of the systemd codesonar fixes.
> 
> Moved patch file to path "poky/meta/recipes-core/systemd/systemd/"
> and will be sending the patch file to openembedded-core mailing list.

Moving the patch is a good first step but lets fix the problematic
patches and have the changes included in the recipe too please.

Cheers,

Richard

