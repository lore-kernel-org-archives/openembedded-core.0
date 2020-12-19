Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.9858.1608389751367920971
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 06:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GFtE/hMm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id y17so6134568wrr.10
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 06:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=mLStwShUTAQb479/oDfxPN2g62g5SX/IMolNTWz7okw=;
        b=GFtE/hMmOG4argoOrX6fCSXRfIKCIksh4MW0r6f68X/itq++dFE6pSmCxrdz5FD1e6
         QJJ1+PPm+RcjnE/0Ij6v/lOmYVGmVb8TErQ1+RKkGUbrImJo7lPeXNFSd7kygVMWhuYv
         1gANN24Z/xOQThxy/6jjmYZfgW2rriMgpafdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mLStwShUTAQb479/oDfxPN2g62g5SX/IMolNTWz7okw=;
        b=Q03+KVmMD4nVV+eR6OhYi07w2436cqFhqFsKEEBQ4KnTzIJnsHpApIXACTa9J4tYm1
         BCpUDWKQgiB4g45CnPog+Ag03IiC/giivF+ajfkYcRPf3zISpn8OvwEiKuDG9+7k5w7T
         SKGfHcjpZBRC5JJvztPEInJ3K/8vP98whb1B0x+2iNgceQojOE7ZowVSA/UUW6804Puj
         dHR623Sax963qwmStPTRJQKaoWFhVNOU3VlzMFj45csHFpzdI70+n+CvBHM7Yh1MXV2x
         mb9jiwG0+ewhuKBBjJv2uKJGjTboP8kkU+L78ebN1PTxys75eMUEQV/DhcXAp35kIf8f
         E9sw==
X-Gm-Message-State: AOAM530RiKp/J0XrjjtnrzpJXwIHVA8vuynT8LLracI/RDYlbZTsMrdk
	8q+40AXMSqdT98WFGXpbVxy7tg==
X-Google-Smtp-Source: ABdhPJypafSvIyceo6yoZIwVEolIi7LS5gTm+ni4upEDUMWQtgvQC+KLTcrxBjUkxbWNe+MPZCPSkA==
X-Received: by 2002:a5d:4242:: with SMTP id s2mr9718831wrr.187.1608389749842;
        Sat, 19 Dec 2020 06:55:49 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id n3sm18140794wrw.61.2020.12.19.06.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 06:55:49 -0800 (PST)
Message-ID: <190234c9f6a3ce6702eebfb9d188a4677d4b94cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/5] systemd: update 246 -> 247
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Luca Bocassi
	 <luca.boccassi@gmail.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 19 Dec 2020 14:55:46 +0000
In-Reply-To: <d6ccfadf560d475bba3e8dae9fe9fde2@XBOX03.axis.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201218094256.3796401-1-luca.boccassi@gmail.com>
	 <165217A789F1A918.13568@lists.openembedded.org>
	 <1652194C9AF53BB2.13568@lists.openembedded.org>
	 <940d5e33d09579fc46372bfedbd0b76ee285a8e9.camel@linuxfoundation.org>
	 <d6ccfadf560d475bba3e8dae9fe9fde2@XBOX03.axis.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 14:09 +0000, Peter Kjellerstedt wrote:
> Now this made me feel really stupid. We have had the following lines
> in our 
> systemd_%.bbappend for years and I never got around to upstream them:

I do worry people have useful fixes lying around :/.

> # FIXME: These are incorrectly determined by meson based on the
> host's
> # /etc/login.defs file. If there is a way to get meson to do the
> right thing
> # when configuring for cross compilation, then that should be
> upstreamed to
> # systemd, otherwise this change should be upstreamed to OE.
> EXTRA_OEMESON += "-Dsystem-uid-max=999 \
>                   -Dsystem-gid-max=999"
> 
> Sorry about that.
> 
> > [rpurdie@centos8-ty-1 ~]$ grep SYS /etc/login.defs
> > SYS_UID_MIN               201
> > SYS_UID_MAX               999
> > SYS_GID_MIN               201
> > SYS_GID_MAX               999
> > 
> > so I think we have our trigger. I have a simply patch to specify
> > defaults in the recipe which I think should resolve this. I'll add
> > it
> > to master-next and see if that helps.
> 
> Looking at your patch in master-next, I believe you should set 
> -Dsystem-alloc-uid-min and -Dsystem-alloc-gid-min to 101 rather than
> 1 
> to match what is in /etc/login.defs.

Good point, I'll tweak accordingly, thanks.

Cheers,

Richard

