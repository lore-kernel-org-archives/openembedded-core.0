Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.17465.1604079916615071978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 10:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ghH65483;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id v5so3625003wmh.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 10:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=a7RbF8zcJRyF2RRIzxVino1iGwc8v8+hdWknAP+gwII=;
        b=ghH65483x179oJhrN7mNZDGIYIGNs0HbcD7mdAdZKylVvzJ2MIwTIhM55D6SoLmMZq
         X/kUCbMLpDIJq+sh5R1TvfPYdxcfyubkLXELKqhKy2g7/DAjLzBbPHeE46DUg66fAT3j
         nUFYiv5/1bdvww5JoN/L5HnfAtMXcb1Ld9x9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=a7RbF8zcJRyF2RRIzxVino1iGwc8v8+hdWknAP+gwII=;
        b=nQDprry8yI0tX7RIQUaPfSxKVP86vrskuhfGddUsgLQUlUmgmL2/L+ai603KbDPMQv
         kkHBt6ECxiH+JnpM8Ekids13Ng3RMrT73FbUxRclUH/bh5R8n8XNtWO4b/nRpeoFyA9g
         e6chUhigfNElP2lO9To+Sdltr5u7h5tu839TweBewfA6ljMQagsHQkLwyXF9B2c6qHJq
         vSPQj8srxUV/NR+8YMGymqcgkjZ2hRhNSy6pJpiGRflPVphxNhcNZFEGGkqeqzno6HW+
         6i9bRpqx69nlv3E3ybEiWjXzk4dbK2VrXAQyfNY5pQT0wPzpMl7vVOD4eKRA2+dp1EmG
         U6wQ==
X-Gm-Message-State: AOAM531KI+VuYyT0sgxrMxT51UuujRwd7Ek3bzRvedpN/rGpojrKoo0W
	/bIkPJRwz5bVtw5VFGr56CCEnw==
X-Google-Smtp-Source: ABdhPJyXuBCDqGmenU2E2ZRRo5VFWjl6j+e+pVhjKXC5rQVggBsWl3yZqupHY7kKxJubxRwZvIyeig==
X-Received: by 2002:a1c:5585:: with SMTP id j127mr4129790wmb.90.1604079915107;
        Fri, 30 Oct 2020 10:45:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.f.b.1.1.e.8.3.0.4.2.f.2.4.4.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.f.b.1.1.e.8.3.0.4.2.f.2.4.4.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d442:f240:38e1:1bf4])
        by smtp.gmail.com with ESMTPSA id v189sm5916367wmg.14.2020.10.30.10.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 10:45:14 -0700 (PDT)
Message-ID: <f5f3fe375a9174e401c283431de0fca1634539a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Oct 2020 17:45:12 +0000
In-Reply-To: <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
	 <20201029142806.1830504-6-quaresma.jose@gmail.com>
	 <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
	 <1642964F5C513D13.27950@lists.openembedded.org>
	 <1642987B07D196A5.27950@lists.openembedded.org>
	 <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-30 at 16:47 +0000, Jose Quaresma wrote:
> nasm is present on sysroot
> 
> The build log
> https://errors.yoctoproject.org/Errors/Details/510826/
> 
> Countain:
> 
> NOTE: Direct dependencies are:
> '/home/pokybuild/yocto-worker/qemux86-64-ltp/build/meta/recipes-
> devtools/nasm/nasm_2.15.05.bb:do_populate_sysroot'
> 
> NOTE: Skipping as already exists in sysroot:
> 'nasm'
> 
> I don't have a build it on qemux86-64 and only build on arm
> and on arm it is builded without nasm because -Dasm=disabled
> Otherwise I think everything is correct with this patch

I was able to reproduce by building qemux86-64, it readily fails. The
issue is that it needs nasm-native. If I add nasm-native to the
dependency line it seems to build fine.

I'll add that and retest on the autobuilder. If that works I'll squash
it in.

Cheers,

Richard

