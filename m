Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8255.1627370673262939495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 00:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kio0NQcs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id e25-20020a05600c4b99b0290253418ba0fbso1621412wmp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 00:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Rmp0gMqhEZuvki+4A5XtkNyauImjiy813+/MA0shhhM=;
        b=Kio0NQcslDNb3ulyaWwdW1x1G+jIclRdpgTu1KpakjXR5np9IfDCaVFrMcuovpMeJW
         W/KhRjvgo74RqKrstYh30oW3fMDzJvsO+eop3zOqMA9G3LxuqruawlE6Y3fLbGs8Bx7K
         IkIc+2gNrAe4o/MZTRmcb19K9qabD2zCJPbqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Rmp0gMqhEZuvki+4A5XtkNyauImjiy813+/MA0shhhM=;
        b=T5+48VVsoY9n5XypE/9FdJWgjeygb/3xz+nmc3m00p0wOkdEpbkrzD+BnqVEVj1IYR
         TZTmYYXQy+7DsXNM/7ZBtSHfC97dbw7xhMn3pnh8j4kpR3wX/NpfV+x7tuIQGuOFoEPf
         z6J/k0Sg+10WAsvH6NNCxsfPAUE6XMf67qe4hsXOw1s2cL3e0iT+AQNuXbo0cDB59iAj
         8jvDpHfGymmVKoQtpB6ptkrMwYIwN8qkXpGhxFhCJ+RZnnLoznMeL63qn359/xNjI1rD
         Twop4GsTsk8iZse/i8e6F/P4/QCkvTyM+jiPdrb6lkGlrFyBH2GKN5hN0IQ7xiZLhoZy
         tH1A==
X-Gm-Message-State: AOAM533hECagBpSbl33x7xqhMh0tZTKaptWtDwV4YRhnUl41ipRRjXqR
	hJP1zQP6JImQK/jiVW/2zxLa8Q==
X-Google-Smtp-Source: ABdhPJz330ST6uoVEOgzQLsYoYuaCaS3O7p4GDeSyqwQOhedp809KzMzUCvuQMP/xYX/KRoLAf/gRw==
X-Received: by 2002:a05:600c:4f11:: with SMTP id l17mr11304494wmq.94.1627370671663;
        Tue, 27 Jul 2021 00:24:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8722:e8c0:4ebc:1cd4? ([2001:8b0:aba:5f3c:8722:e8c0:4ebc:1cd4])
        by smtp.gmail.com with ESMTPSA id o2sm1923810wmq.30.2021.07.27.00.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 00:24:31 -0700 (PDT)
Message-ID: <9f1f0b45ad9f4ac2e3dfd873d6274c926ef327b2.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell][PATCH v2 1/3] cmake-native: enabled zstd support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, "Ruslan Babayev (fib)"
 <fib@cisco.com>,  Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Samuli Piippo
	 <samuli.piippo@gmail.com>, Samuli Piippo <samuli.piippo@qt.io>
Date: Tue, 27 Jul 2021 08:24:29 +0100
In-Reply-To: <CAOSpxdZj+whn8ktEPHuFxQUL=1=6bVWtD53N=cSM4waNh28JtQ@mail.gmail.com>
References: <20210723214527.2225841-1-fib@cisco.com>
	 <20210723214527.2225841-2-fib@cisco.com>
	 <CAOSpxdYek8qF+oYVSuTGfzP6zq++f711QHJJur9P=xbrFVEWeQ@mail.gmail.com>
	 <SJ0PR11MB4784D0CF9A35F4D8A63630DBADE89@SJ0PR11MB4784.namprd11.prod.outlook.com>
	 <CAOSpxdZj+whn8ktEPHuFxQUL=1=6bVWtD53N=cSM4waNh28JtQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-07-26 at 14:40 -1000, Steve Sakoman wrote:
> On Mon, Jul 26, 2021 at 12:27 PM Ruslan Babayev (fib) <fib@cisco.com> wrote:
> > 
> > Hi Steve,
> > 
> > Thanks for reviewing the patches. I understand the problem of merging this 
> > patch as is.
> > But Dunfell currently has a host contamination issue on systems with zstd 
> > installed as part of base OS resulting in broken cmake-native recipe. Can 
> > you help bring this up to the attention of the steering committee?
> 
> Perhaps Richard can comment on this.  You are asking for a feature
> change to dunfell that involves modifications in both
> openembedded-core and meta-openembedded. So both technical steering
> committees would need to agree that this is appropriate.

We don't have to go straight to the TSC, the layer maintainers can try and
agree a plan first.

I've added Armin as meta-openembedded maintainer for dunfell.

Context: cmake-native suffers host contamination on dunfell due to zstd being
detected on the host. The upstream cmake community say they don't support 
configuring it without it.

Do we agree we should move zstd from meta-oe to oe-core in dunfell to fix 
this? Should we patch cmake in dunfell to try and use it's own copy of zstd 
internally? The latter is more risky in that we've not tried that and multiple
configures can be 'fun' in builds. Moving the recipe has a different kind of
pain.

Thoughts?

Cheers,

Richard

