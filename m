Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.31527.1620036936988517287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 03:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BVOoNzh2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id b11-20020a7bc24b0000b0290148da0694ffso2993451wmj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 03:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=4AAdDfJwf0GEvZAaEXbqxqOJMAu6CwM6qEZSBPOvPZQ=;
        b=BVOoNzh2Nazdd0H012f2XOdUSSLAqjBNn711/eR8YvUzgXobSP4TO1WgE0LodQMG63
         1J9E5nLtXyeXTXNfMbI7sqT2K5DJ6+kyluTej4FemReu/jiPMCrsHiIqNi2fVbeYEqnZ
         z4NwVz9C1dL4+8rMLw2cJTB82MOostoriXbSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4AAdDfJwf0GEvZAaEXbqxqOJMAu6CwM6qEZSBPOvPZQ=;
        b=kbgkFuwjfFcjdKMQ6pm/3n6EdRjcGYyxuiLLgY4qa38/Apa+3OGXfpVq0G/WHVLUIr
         EAuX4iiF69NrmWJGNd/Hw1VQz2jbNhqkMCDrM5/LjC3tMI+rf9+82GJDRV2OYTDHrzPw
         Ql/2nZswyK22sg9b31YVIfPSwidd77h4+7XdmPrw6zCEGDJRgzPtxmszlMz69vkFdM+E
         ccUJzMrbhXoNkP5KPwf0vrO8njioofWivuclxSslEBKQrNBhqw9SFpSYsayXmnfTYREt
         iKlUg78RVBDWl4Ulj+EQHv90j3VFKr2ZXZ7QaNdC8e/Zrz2jFPSNKbhiNdeSR5aTzJn4
         yBvg==
X-Gm-Message-State: AOAM5324zxkdMg+9Hfyh92fPkMwTx28sJt2voqo+Zfj9Wx4AW3OiqdL4
	gJzUmVZ4zRLUKejmkbXU5PeItw==
X-Google-Smtp-Source: ABdhPJxdTLEaXc0ZfrriZtDg3s/O2phdiY0k7z1YrPJysmgEKrrD6olBdZNHFIR+LRHCYY9Q6LO9Lw==
X-Received: by 2002:a7b:ca42:: with SMTP id m2mr20920914wml.67.1620036935434;
        Mon, 03 May 2021 03:15:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2abe:bb29:590f:e028? ([2001:8b0:aba:5f3c:2abe:bb29:590f:e028])
        by smtp.gmail.com with ESMTPSA id l21sm23213282wme.10.2021.05.03.03.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 03:15:34 -0700 (PDT)
Message-ID: <c8638685a3ba0a9e67e1a7731b81b9f3e6992d09.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] testimage: hangs if missing debug-tweaks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 03 May 2021 11:15:33 +0100
In-Reply-To: <a7d93e2b-608f-b5f3-e3fb-16abb2cba514@gmail.com>
References: <20210502201227.3587958-1-akuster808@gmail.com>
	 <f9d76fc95bd43c5418eb5c947c48399f5f15b7a2.camel@linuxfoundation.org>
	 <a7d93e2b-608f-b5f3-e3fb-16abb2cba514@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-05-02 at 23:24 -0700, akuster808 wrote:
> 
> On 5/2/21 4:00 PM, Richard Purdie wrote:
> > On Sun, 2021-05-02 at 20:12 +0000, Armin Kuster wrote:
> > > The only clue is this:
> > > 
> > > WARNING: core-image-minimal-1.0-r0 do_testimage: Couldn't login into serial console as root using blank password
> > > WARNING: core-image-minimal-1.0-r0 do_testimage: The output:
> > > root
> > > Login incorrect
> > > qemux86 login:
> > > Login timed out after 60 seconds
> > > 
> > > Poky (Yocto Project Reference Distro) 3.3+snapshot-65e75bd5d40c10509a3416026e551b7b7111c42a qemux86 /dev/ttyS1
> > > 
> > > qemux86 login: <<< run_serial(): command timed out after 120 seconds without output >>>
> > > 
> > > Hangs here....
> > > 
> > > We should issue a error and quit.
> > What happens if I set IMAGE_FEATURES = "empty-root-password allow-empty-password"?
> Do you expect folks to use undocumented internal only settings? (Just
> added them)

They may be undocumented but we should fix that. We're meant to be replacing
debug-tweaks with more explicit options.

> > Should we disable the serial monitoring if these or debug-tweaks isn't 
> > enabled? 
> Will look into it.

Thanks, I think that would be the better fix here.

> > I'm surprised it causes the image to hang, it should just trigger the
> > warning but continue to work...
> WARNING: core-image-minimal-1.0-r0 do_testimage: Couldn't login into
> serial console as root using blank password
> WARNING: core-image-minimal-1.0-r0 do_testimage: The output:
> root
> Login incorrect
> qemux86 login:
> Login timed out after 60 seconds
> 
> Poky (Yocto Project Reference Distro)
> 3.3+snapshot-65e75bd5d40c10509a3416026e551b7b7111c42a qemux86 /dev/ttyS1
> 
> qemux86 login: <<< run_serial(): command timed out after 120 seconds
> without output >>>
> 
> 
> Currently  1 running tasks (732 of 732)  99%
> > #################################################### |
> 0: core-image-minimal-1.0-r0 do_testimage - 10m15s (pid 879458) <<<<---
> how long should one wait???
> 
> TEST_SUITES = "ssh scp ping"
> 
> not testing much.

That shouldn't happen and we should look into it, worth a bug if you don't
plan to...

Cheers,

Richard

