Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.90.1597273305808523641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 16:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MQT2iwmX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id p20so3547091wrf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 16:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rnLntTc5PZXWPu695ja4FM2eoxlEt8sQPWbM549pZi0=;
        b=MQT2iwmXcQ5yjhIOYq2NEZ7pf6VJeDpMm6/KT1/p/vw5kLz4akhqiHMVbxrVDoUAWX
         oALkoC64u8Ok1T8mp6SGI+9RiqBMMJgQKsUCAfR39BdnkFd+cZKAdshBePqiS4tff0Z1
         IrL+7jREvTrtt3DKscPKQjIMfxeAkrLZZ14mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rnLntTc5PZXWPu695ja4FM2eoxlEt8sQPWbM549pZi0=;
        b=E2szmzbtvb4hEg3w96TZ2dqDp0vaEo3yhkcj3aw3IUKxsSPPWwa8q+RKqGAqkGlVe0
         G8fs65yzJQvP+UfR6YPPIW9q6KChzm2Z70uQFOcDup6UzdlRZtGi4Lz5IcDCI5AeUvVz
         5c1WxUhqpGU7VThd7ASc3OGzHzOf7xlP19kudxPEdTcSKIobYTSsPd13Hok/soxXvQdu
         vYRo/leKdPdR3pMI9i0ojjOzUsp6eBruiSADCLE1ouZbhktothdKnU9O9Rbp2VOA8lDl
         0EKkYthqC9HFdKt+60I5UJVlZAHsor+kR6q5D4cy8KO/TctIEpoC+F2NxXohE1eOVhKl
         4O7A==
X-Gm-Message-State: AOAM533DpB8ZIx+9bKhB2AeWTOhWKzcroxhcmIgujIc3SXk7kWptRDy5
	gU3HLUmd+sfmmgUMQ8NoZlfMkA==
X-Google-Smtp-Source: ABdhPJw+L3Uld4e4uRFWMGwGSuXUJ7QoD1W1iQkf5kk2E8cIBRpjP/hZjDbn08G62Yls8wTK94/xqw==
X-Received: by 2002:adf:e6cc:: with SMTP id y12mr1160959wrm.391.1597273304280;
        Wed, 12 Aug 2020 16:01:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.4.a.8.2.9.1.2.1.e.3.5.0.0.0.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.4.a.8.2.9.1.2.1.e.3.5.0.0.0.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:3000:53e1:2192:8a43])
        by smtp.gmail.com with ESMTPSA id 33sm7105365wri.16.2020.08.12.16.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 16:01:43 -0700 (PDT)
Message-ID: <beb12038274a4c2c0e5af09191501f1dd686db46.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libubootenv: uprev to v0.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>, openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com, sergio.prado@toradex.com, 
	max.krummenacher@toradex.com
Date: Thu, 13 Aug 2020 00:01:42 +0100
In-Reply-To: <20200812121715.10548-1-liu.ming50@gmail.com>
References: <20200812121715.10548-1-liu.ming50@gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-12 at 14:17 +0200, Ming Liu wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> Update libubootenv to the latest 0.3 release, which comprises the
> following commits:

Seems to break world builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/2280
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/791

Cheers,

Richard

