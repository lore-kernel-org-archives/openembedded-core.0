Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.4455.1601028298520551083
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 03:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fXxds10Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id x14so2888565wrl.12
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 03:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1SjFycUMSWnBw/VkPamvhiUOh3gHUd2fRMaR0fz4t6s=;
        b=fXxds10YbRv6FblXOBD1QNDNE/sNPbnuYO5F/exoJrovvv1aSfK5NwaxIG3l/3YRhC
         omp9mbyE7uSm57Szcr3/ARzq90dgmFT3at8D9xRS7t5ImKtak97gNvtPnKijbES4qeeM
         jStypean1xJr/xl4v2VBeFlv3DUKbQA/FA9p0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1SjFycUMSWnBw/VkPamvhiUOh3gHUd2fRMaR0fz4t6s=;
        b=kpKBRBKw2JGOEOkVaMVw4kUybUA/KFnV+fN0sQjlidSRsS6GsEbQX2spBuH4xSEMh6
         OuI18rNw9J1krUXAW1ft1JUKJ3LL04rqYIaAxY+IEeUElcaSC5Eo6hVSOZv11US2/lPe
         NCkmTP6crYYEuAL1FBqj6WELyoFJ5nyIoZVBx44qKmHyk73J9L+F0h5Ck7sP9wfxdbWf
         HisQovDvYxQ+kx3kUoZ0pd2SSdFZQ3BKIUTyThw6Q4Mlz8SUh1c5+PcGKAaucX4KaZl5
         1eqsmxrkhm1xc8I1gpPeDl3f/OzCEqI+HycuNvtUJ/0Bk+HtG1XpxxPbEXvxvFb7Uj4s
         gFoA==
X-Gm-Message-State: AOAM531jNWXOHxtumXqmtEyohxQe8h2Qdgnrp5lUJdHCndwEj2KWsl+b
	MIM72HX7/gUh/TK1vdhN4yVYnw==
X-Google-Smtp-Source: ABdhPJz4FLDfpPYeyuugjE6L3AkLa+i0aarU1Uu0AGBZGmf0SwU0GWrEi1k0JfF85uejyMSYNyFYSA==
X-Received: by 2002:adf:e852:: with SMTP id d18mr3855329wrn.40.1601028296840;
        Fri, 25 Sep 2020 03:04:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:90bc:6f26:fb38:5724])
        by smtp.gmail.com with ESMTPSA id k8sm2420065wma.16.2020.09.25.03.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 03:04:56 -0700 (PDT)
Message-ID: <3769dd36559fcbe0a9b792f963b6732b2312209d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssh: Allow enable/disable of rng-tools recommendation on sshd
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, Otavio Salvador
	 <otavio.salvador@gmail.com>
Cc: OpenEmbedded Core Mailing List
 <openembedded-core@lists.openembedded.org>,  Otavio Salvador
 <otavio@ossystems.com.br>
Date: Fri, 25 Sep 2020 11:04:55 +0100
In-Reply-To: <CAAnfSTvrT7_40JPPpeNM7eJouLK7e0VELGRMHgd-VjKSfa+y5Q@mail.gmail.com>
References: <20200924195800.4164634-1-otavio@ossystems.com.br>
	 <CAAnfSTvrT7_40JPPpeNM7eJouLK7e0VELGRMHgd-VjKSfa+y5Q@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-25 at 10:58 +0100, Ross Burton wrote:
> On Thu, 24 Sep 2020 at 20:58, Otavio Salvador <
> otavio.salvador@gmail.com> wrote:
> > We are adding a new PACKAGECONFIG option ('rng-tools') to control
> > if we
> > wish the openssh-sshd to RRECOMMENDS the 'rng-tools' package. We
> > are
> > enabling it by default so there is no behavior change.
> 
> Is this fundamentally because many targets now have hardware RNGs
> that
> the kernel is using, and so rng-tools serves no purpose?
> 
> This was originally added with data from iMX6 (oe-core
> 9b01375236e19e3366c58877c4154d7c71632984) and I'm curious if this
> followup is related to other improvements that have been made to iMX6
> since. Is there a better user space tool, or is the kernel using the
> hardware RNG out of the box?
> 
> I ask because I'm strongly tempted to argue that we should be
> assuming
> that a RNG is available and let BSPs turn this on if required.

BSPs probably shouldn't be changing openssh configuration individually.
I have merged the patch since I think it is good that we have a
configuration option for it though. Its more appropriate for a DISTRO
to set.

How we could make this configurable on a machine basis is an open
question...

Cheers,

Richard

