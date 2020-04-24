Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.6354.1587737297828349791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2020 07:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XmZwfW8g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id k13so10983250wrw.7
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2020 07:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:in-reply-to:references:date:mime-version
         :user-agent:content-transfer-encoding;
        bh=XfWrtCNSVLBFaRiAMF6MZ3+3VsCRd9aBNc4UNqNkG3o=;
        b=XmZwfW8g7FTrbQQH9U93jiLuwA9BUwZZt2scFdJNwFMZ6hXvQ9nxbCDUk490G7lieE
         H5JWlFvvISJmr85Po0lT1T6CPJNKHVt2PhyjS1SE1t3AbpAAZe4eiok06BgmOYhm6i1y
         OQG2IjsyE4B85OwVga+gIXsc4OoaJsUgYnMZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:in-reply-to
         :references:date:mime-version:user-agent:content-transfer-encoding;
        bh=XfWrtCNSVLBFaRiAMF6MZ3+3VsCRd9aBNc4UNqNkG3o=;
        b=OAd7TRfZOqlJ+kfWycIY/5Toh8Do9Z91vWFlCrzxvbB4Lcp+QCQxcfOmb1hjEDEEFd
         /uT7/f9eff7RfqwP9dFkSu0U+CsAEZgMfkCDtaq6Y1wk5WcD8tpqbTWs9YibkFhqQxOb
         BVw/Xt/o/+z9HbfOBUvzzqe0d2Ds+pBsuHbMRi8dCrcLeaZYxb55IhUh8OF5hXsW8/2h
         xTYqueq4QBk3dP45lc3x1Ni49sAmiDXL0iRh7FUgJ6/B+IvE7EXA7/dJH+02wtMvebR/
         iZThIJhu2/TKxwPbePvbp1Iml3WBTt3GndADl5levL0CVfcrUQl9E7EwiWHyKxp6Ahrd
         ciPA==
X-Gm-Message-State: AGi0PuaTvC/T5pacbE/VpNU9P4CeyXBCly6s8wz1y3eGYu+VmD23WT1e
	fJ9F0BAxlxfHl/eq01HIV00LMg==
X-Google-Smtp-Source: APiQypLeOGUmpeSMW2d+rqCmm+VpSVWCcThgkUFj2OxQf3z59nqTlsVFnZ5/XY+AbyvVxFeaNJbujA==
X-Received: by 2002:a5d:4248:: with SMTP id s8mr11059562wrr.216.1587737296318;
        Fri, 24 Apr 2020 07:08:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id x18sm8249004wrs.11.2020.04.24.07.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 07:08:15 -0700 (PDT)
Message-ID: <adfc124fd7a2a538eacdbed44eab2cd67c6bf4f6.camel@linuxfoundation.org>
Subject: Re: [OE-core] Changing DISTRO_FEATURES / build directory
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
In-Reply-To: <SN1PR12MB248000E2856984F4FEAB95708BD00@SN1PR12MB2480.namprd12.prod.outlook.com>
References: 
	<SN1PR12MB2480D4132DF632E5161532E38BD30@SN1PR12MB2480.namprd12.prod.outlook.com>
	 <f73b90e0d744276d6929bb39518a962dc07e3e4b.camel@linuxfoundation.org>
	 <SN1PR12MB248000E2856984F4FEAB95708BD00@SN1PR12MB2480.namprd12.prod.outlook.com>
Date: Fri, 24 Apr 2020 15:07:01 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.36.1-2 
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-04-24 at 13:59 +0000, chris.laplante@agilent.com wrote:
> > > So, is changing DISTRO_FEATURES but not changing the build
> > > directory
> > > expected to work?
> > 
> > Should work but has bugs.
> > 
> > There were some fixed around the thud/zeus timeframe.
> > 
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=13702
> > 
> > is a recently reported one that has patches in master-next (both to
> > fix and
> > add a test case).
> > 
> > Is there a failure with reproducer you have? Which release?
> 
> I haven't encountered any bugs yet, no. I am working on adding some
> custom DISTRO_FEATURES to our distro. I was trying to convince myself
> whether vardeps are necessary for DISTRO_FEATURES, and couldn't
> decide. For instance, if I have:
> 
>     do_unpack_append() {
>         echo "${@bb.utils.contains("DISTRO_FEATURES", "my-feature",
> "true", "false", d)}" >> ${S}/whatever
>     }
> 
> bitbake-dumpsigs on the do_unpack sigdata reveals that
> DISTRO_FEATURES is *not* part of the task dependencies. So I was
> wondering if I needed to do:
> 
>     do_unpack[vardeps] += "DISTRO_FEATURES"
> 
> but looking around poky and meta-openembedded, I don't see anyone
> else doing that kind of thing. 
>
> The interesting thing is that the bitbake-dumpsig does have some
> special looking DISTRO_FEATURES output, such as:
> 
>     DISTRO_FEATURES{usrmerge} = Unset
>     DISTRO_FEATURES{my-feature} = Set
> 
> So it seems there is some DISTRO_FEATURES specific processing?
>
> It's also unclear to me whether the signature code is able to
> understand bb.utils.contains and automatically pluck out the fact
> that DISTRO_FEATURES should be accounted for. 

"contains" has special magic where it caches the specific value
presence rather than the whole string. I'd therefore recommend using
the contains functions where at all possible for that reason.

Cheers,

Richard



