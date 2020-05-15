Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.2605.1589583160685295170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 15:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fc5T7U4M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id v12so5189517wrp.12
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 15:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VUwKA7TXnp5CXUUZDXq2zP/fwSnMw1bOFhJhSspWIS8=;
        b=fc5T7U4M/SxrG7wf2brKJzShvNUgLhdmp3qqpAk8MlphpI0tJjUb4fZ2yqc01EPzwC
         fNDHxECIWBAVsmJ5313iFZbBgpb3yNl7Sfx87SqyWJWW/G69VBzhMeysd+DLj2abeeuw
         k9FHXLl7zUAmlypiIhMHVvUHro/tBPxSESpkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VUwKA7TXnp5CXUUZDXq2zP/fwSnMw1bOFhJhSspWIS8=;
        b=mSu0UbPS+OV/QIslTZ/7WX4nvhSX9R/nBhhQP5329qKl1U1hgWGt3ZudvIclR0XaRl
         oXAhxd/txaFActe+Wj1AWcQD/7eRp9hssl+A238z+yviVcWLBWwvBMULAH8rmjmCbvbC
         tgF0CghqZf2BzKLEBFwGCqdcZJOa0IZ03tDDnostvuVz+wMQ7CHzChx+wIO51tqVmVMh
         2jLEoh7qGhnaIgL8ul36kV7KN/EXXSuEL3Cc2xteHBFiUz96OsqR83/klE91Og+8xpL4
         T94q1FCH3nOSvVCAJhPJeB002CdCcD9xI17TqC0a7tKufPHOzhGBoq2LyDX513ju7u/l
         Dyhw==
X-Gm-Message-State: AOAM533fh8tPqH2oCubsrH1ukf29JzVTA3Oc8r0H6ye0YIgmDkfF+tHb
	1Bb+NpsDfhu3ZNvDYoWgIDcrtA==
X-Google-Smtp-Source: ABdhPJyeD5gs5DoT7PEdK8y+KwOsT0xQLU8VQwT7BYTe64OaykYZmZ21j5ouRuuzDLTDhFCPKPvDpA==
X-Received: by 2002:a5d:4e41:: with SMTP id r1mr6508741wrt.420.1589583159143;
        Fri, 15 May 2020 15:52:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id k13sm5249931wmj.40.2020.05.15.15.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 15:52:38 -0700 (PDT)
Message-ID: <3980f6412be2ad2dfd84a03016f9ba089b3406e4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] libsecret: upgrade 0.20.1 -> 0.20.3 / port to meson
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andreas M?ller <schnitzeltony@gmail.com>, Denys Dmytriyenko
	 <denis@denix.org>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Fri, 15 May 2020 23:52:37 +0100
In-Reply-To: <CALbNGRQq3yiEEoNkzUSFE7Z=H8iJ6E_Ja7DTFz8Pp346xd7otQ@mail.gmail.com>
References: <20200430214203.26595-1-schnitzeltony@gmail.com>
	 <20200430214203.26595-2-schnitzeltony@gmail.com>
	 <CA+chaQc1rS1EJw9B0Rov1DyDok2AT0tX4hGZcMOPOshHb=r5nQ@mail.gmail.com>
	 <160F50EDD3A6B1F2.685@lists.openembedded.org>
	 <160F519E3DB5CDF9.29809@lists.openembedded.org>
	 <CALbNGRSf9iwrBgGAqZ2GMPOX8hXoZu_JGQ7qt8Y5+M6N7n6ozg@mail.gmail.com>
	 <20200515215933.GG11927@denix.org>
	 <CALbNGRQRwbEd0QhPEpCPRMWiDCwC8_Owi67opUkrXinRqC7D6w@mail.gmail.com>
	 <20200515222132.GH11927@denix.org>
	 <CALbNGRQq3yiEEoNkzUSFE7Z=H8iJ6E_Ja7DTFz8Pp346xd7otQ@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-05-16 at 00:33 +0200, Andreas M?ller wrote:
> On Sat, May 16, 2020 at 12:21 AM Denys Dmytriyenko <denis@denix.org>
> wrote:
> > 
> > Has nothing to do with your name, but with your mail server and
> > DMARC policy.
> > 
> > Many of us are in the same situation, and we learned to live with
> > it, if
> > cannot change it. Moreover, layer maintainers actually have to
> > change names
> > like that back to normal manually before applying patches...
> I consider this a a not acceptable waste of time and not acceptable -
> so I'll go 3. for oe-core.
> 
> @Khem Should I stop contributing in meta-openembedded either due to
> extra efforts caused?

I think there are two potential issues. I suspect the missing Umlaut is
configuration of your groups.io account. I did reply about it once
before and was surprised you hadn't fixed it. If you login in there and
set your name correctly I think that should fix part of the issue.

The "via lists.openembedded.org" is something only you see, not the
rest of us and is due to DMARC and other anti-spam and anti-spoofing
measures most email systems are now requiring. I see the same thing for
my own posts on mailing lists. There is nothing we can do about that,
it depends on the settings for the domain you're sending from and you
won't control the gmail.com policy!

Cheers,

Richard



