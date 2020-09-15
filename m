Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.11537.1600170322098765189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 04:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H6mWEGCu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id a17so2965620wrn.6
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 04:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BXhWIUsR66mrMmgWaqJ3fX/AL2MlmZOXbqBCC/6bClo=;
        b=H6mWEGCunX1kYhaXX7cJQ9oRfYb+uQliK6DABYIhR/ytLE7YrRTT+XFlcv8bz/9lV5
         oybT4Zd1tbBQBaAnKTqO3JrS6mXZNDTEqkOG66w3SHbLO5yVA+dEE5yBrK3BffipD6R7
         vgLLjmuGWrj2KSEYh/w3IC5Mh1579U/hPcbAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BXhWIUsR66mrMmgWaqJ3fX/AL2MlmZOXbqBCC/6bClo=;
        b=tJPgPAaJWyN2GVUiv6QwhPI6cdBdb5CSuBcZDVvr1ObtLZSgEgMPLq4O/SXotcxSBv
         pDtY3ssEjkIpURBaAfvwhyqr790xUka2i7RvMUxfZ4I/cCexxblLNMgivznhkdjfa7l5
         99SDrM5SCZ5yDSB0cu0Ut7MRetW/EqOC1/TVRhw6HlLnoEey3PhdzDNElx2tNwmeFaHS
         eQc+1SwJ7KcUx1RdbckPUI+Q4iSXkKBkq2q+97y9KIGfRtoumo2xy3w3Eg/5qQsQXq1A
         FfyZ/HahN0YyQcC6F9AuDPIASEnF0zrMdIOGe9r1qt+fp7waFZLh1PiSnC4VMj14i+Tu
         CftQ==
X-Gm-Message-State: AOAM532/Iufohj8dKLEyPyORhws4oEUaarvr3Fqk/o/d+UxAGrVd21vq
	sLA+gxtgCMmp/b926DzIl1Bw2w==
X-Google-Smtp-Source: ABdhPJxckTyw4pmPJZzWrBf+9AyZabubIo5Ckyr3sXNT0JV8xY4FDEh/mSSbrV9k7PCWWwYP9ZdOJA==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr20188903wrt.23.1600170320467;
        Tue, 15 Sep 2020 04:45:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6142:eacd:f73a:2991])
        by smtp.gmail.com with ESMTPSA id w21sm25904257wmk.34.2020.09.15.04.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 04:45:19 -0700 (PDT)
Message-ID: <d14f6deec304b5d5d7daddc1500dd32e21d00b0c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/6] lttng-modules: backport patches from 2.12.x to fix 5.4.64+ and 5.8.9+ builds
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Jens Rehsack
 <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Sep 2020 12:45:16 +0100
In-Reply-To: <CADkTA4MFzRoKSV6+kBvYvsQ-BfFwt4BJuOj5bPpfQLYbJk_vmg@mail.gmail.com>
References: <cover.1600122415.git.bruce.ashfield@gmail.com>
	 <ced4f4ad5252bcc989f40b54341c0d7a5835bfce.1600122415.git.bruce.ashfield@gmail.com>
	 <486E178E-DCB8-4B23-B199-63231267196E@gmail.com>
	 <CADkTA4MFzRoKSV6+kBvYvsQ-BfFwt4BJuOj5bPpfQLYbJk_vmg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-15 at 07:33 -0400, Bruce Ashfield wrote:
> On Tue, Sep 15, 2020 at 1:44 AM Jens Rehsack <rehsack@gmail.com>
> wrote:
> > 
> > 
> > > Am 15.09.2020 um 00:34 schrieb Bruce Ashfield <
> > > bruce.ashfield@gmail.com>:
> > > 
> > > From: Jens Rehsack <sno@netbsd.org>
> > > 
> > > Backporting the 10 patches since the lttng 2.12.2 release. We'll
> > > drop
> > > them once .3 is released, but for now, we need the fixes to build
> > 
> > Yet another question: there is a stable-2.12 branch ... wouldn't it
> > be reasonable to use this one as upstream source instead of the
> > tarball?
> > 
> 
> We used to do that .. yes. But then the lttng recipe was changed away
> from git to using the tgz.
> 
> I complained at the time (I'm sure it is in the archives for all to
> see), since I'm constantly doing new kernels and have to do this sort
> of exercise.
> 
> The devupstream bbclass allows me to keep moving on my new kernels
> when I need to pick up changes for -dev, and luckily -stable doesn't
> normally need this sort of thing.
> 
> IIRC it was switched to tgz since things like AUH work better with the
> tarballs, but I can't be sure.
> 
> But let's just say that I agree that this recipe is better as a branch
> based, git recipe and not a tgz based recipe. I just haven't waded
> into the discussion to switch it back :)

Perhaps we have a need for both?

Cheers,

Richard

