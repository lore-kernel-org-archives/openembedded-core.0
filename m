Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.70.1615845095656885552
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 14:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z/WOznXP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so262135wml.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 14:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XzAJOYY1N9O3VTPyJrLNkVa5Bg31Owa1tjj85GRUuG0=;
        b=Z/WOznXPWPDWBz595N7u9EP9RNSu8CN0mLqOIhbM6SuPsT14Hf9TrO+kgABOAvCW6p
         g/d4WqeEciSEYE4s82ezOrmQvV6JsaGFuIvU+G27y6mzABjFBD7DvZtoDWZ+Gw6Gi1EH
         Z824DuaoPMFrV2gTZ4FCp0WDiUARD4WLnTgag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XzAJOYY1N9O3VTPyJrLNkVa5Bg31Owa1tjj85GRUuG0=;
        b=thSvwZJw+XQjUlxQnR30IqEjW94YknRtBhQz1h5nZPq2PW3UAtE19MVfWxbhoj4CLg
         6ozVqRDGNvYhi/u1s3WaYD6KwcGQ6yT6FQSMMw28DQNSS/wpbqQ9u1cplFNvmfiHM4KA
         flJtj+baE10wSalUbZm08OLTLT/BfsgtHEmb4nAqlW7iPUpTy6Etozqzy8ym6ylbj08Z
         mbv6tiYUBDzHslKXoOQfoFuzrBvPjqpiRp8N/NEAR+11ox1/zKMQ/AZKoQNB9gNo8Xbb
         X6PH24zYeq9x8mIxyk4PXwz0hjZ8hA7X0Cht9sQWYJk2NnCbT05CXkOd4w+liG4QLw9w
         rVGw==
X-Gm-Message-State: AOAM533fu5HmN47GanUVpD4B69ozkFVXF8RuxBBQ+SWVSfnCe11jig+k
	rLPzbcUCC3123s84msVpTjjXMg==
X-Google-Smtp-Source: ABdhPJxKJLQeqopVnUxf6z/0LJrNJMv+LbIu+pSO25NoYkd4f/S0PkO20vcJnwHwDdpw660sla9SKQ==
X-Received: by 2002:a05:600c:4146:: with SMTP id h6mr1652062wmm.32.1615845093969;
        Mon, 15 Mar 2021 14:51:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1452:a8a7:f5e8:db32? ([2001:8b0:aba:5f3c:1452:a8a7:f5e8:db32])
        by smtp.gmail.com with ESMTPSA id z3sm20038414wrw.96.2021.03.15.14.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 14:51:33 -0700 (PDT)
Message-ID: <eb829949abe227556ae2d4ef8c0e11f6141508d9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Luca Boccassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org, bluelightning@bluelightning.org
Date: Mon, 15 Mar 2021 21:51:29 +0000
In-Reply-To: <166C88B2CBAB1BAF.20509@lists.openembedded.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210311150959.782186-1-luca.boccassi@gmail.com>
	 <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
	 <96cb1cfec8dca5eeca800aa238cab4912701621e.camel@gmail.com>
	 <307a85e26da1a6fb90c274da8dbb5fbea457a156.camel@linuxfoundation.org>
	 <764f13d7a09be6a0d992651ca0f95b9180284544.camel@gmail.com>
	 <82b8349fa9de8918ddcb70993e438d9795de4700.camel@linuxfoundation.org>
	 <20210315135555.hlkwmj4yj5ugw2he@jama>
	 <166C88B2CBAB1BAF.20509@lists.openembedded.org>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-15 at 13:57 +0000, Richard Purdie via lists.openembedded.org wrote:
> On Mon, 2021-03-15 at 14:55 +0100, Martin Jansa wrote:
> > On Mon, Mar 15, 2021 at 12:21:37PM +0000, Richard Purdie wrote:
> > > On Mon, 2021-03-15 at 11:50 +0000, Luca Boccassi wrote:
> > > > On Mon, 2021-03-15 at 10:49 +0000, Richard Purdie wrote:
> > > > > On Mon, 2021-03-15 at 10:44 +0000, Luca Boccassi wrote:
> > > > > > On Sun, 2021-03-14 at 22:10 +0000, Richard Purdie wrote:
> > > > > > > On Thu, 2021-03-11 at 15:09 +0000, luca.boccassi@gmail.com wrote:
> > > > > > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > > > > > 
> > > > > > > > Recently util-linux gained an (optional) build dependency on libcryptsetup.
> > > > > > > > But libcryptsetup build-depends on util-linux for blkid (optional, can be disabled)
> > > > > > > > and uuid (mandatory).
> > > > > > > > Split out util-linux-uuid in a different recipe to break the cycle.
> > > > > > > > 
> > > > > > > > https://github.com/karelzak/util-linux/pull/898
> > > > > > > > 
> > > > > > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > > > > 
> > > > > > > Unfortunately I noticed we had a performance regression in buildtimes in 
> > > > > > > recent changes. The closest I have this narrowed down to so far:
> > > > > > > 
> > > > > > > https://autobuilder.yocto.io/pub/non-release/20210314-14/testresults/buildperf-ubuntu1604/perf-ubuntu1604_master_20210314181831_d42487bf52.html
> > > > > > > 
> > > > > > > suggests it may be this change. I have more tests queued to confirm
> > > > > > > that definitively, if so we'll have to figure out why as this shouldn't
> > > > > > > really happen, its an 8% regression :(.
> > > > > > 
> > > > > > Very strange that a single recipe could do that - is there something
> > > > > > wrong in the new .bb that I missed and could cause this?
> > > > > 
> > > > > I'm wondering if it is because we're building util-linux twice now and
> > > > > there is some key choke point in the dependency chain. I have no evidence
> > > > > for that yet, it is just speculation though.
> > > > 
> > > > With the autoconf options I've set, on my laptop it takes 32s to do
> > > > configure + make -j2. Most of that is autoconf - make -j2 takes 8s.
> > > > 
> > > > Only 3 libraries are built with this combination: libcommon.a,
> > > > libtcolors.a, and libuuid.a/so. No executables or anything else is
> > > > built. It doesn't look like libtcolors is actually needed, I'll see if
> > > > I can prepare a patch to skip it, but I don't think it will buy more
> > > > than 1s, it's just two object files.
> > > > 
> > > > The good news is that meson support is about to land upstream, which
> > > > should be significantly faster than autoconf + make:
> > > > 
> > > > https://github.com/karelzak/util-linux/commits/topic/meson
> > > 
> > > Meson definitely improves the speed! I was wondering if it was from
> > > configure for example.
> > > 
> > > I now have more performance test results in (takes time to interleave 
> > > them with testing of master):
> > > 
> > > https://autobuilder.yocto.io/pub/non-release/20210315-1/testresults/buildperf-ubuntu1604/perf-ubuntu1604_master_20210315005048_6bb1621815.html
> > > 
> > > and I think this means it isn't from the util-linux change but one of 
> > > another three. I'm not entirely convinced those changes could do this
> > > but it is what the data says. 
> > > 
> > > I've queued more bisection to narrow it down from there...
> > 
> > BTW: this split also needs manual cleanup in the TMPDIR, right?
> 
> It shouldn't. The system should spot that util-linux has changed and uninstall
> it from the sysroots as it goes. There is something not working right there :(

I was wrong about that, the system doesn't have code for this, it has code for
the sysroots but not for other sstate tasks.

I think this is an oversight and we need to simplify things and make this cleanup
happen pre-build, much like the "unreachable" tasks cleanup happens today. If we
do make this happen, we probably need to add parallelism as the number of stale
sstate tasks being cleaned could be substantial.

Cheers,

Richard







