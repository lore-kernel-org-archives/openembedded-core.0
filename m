Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.235.1614185583896338255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 08:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nb0GOfWs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id v1so2545035wrd.6
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 08:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=1zzhdOehbDD+FponR7bGGHlh+Gaa0fPm3NGCfkjDy2E=;
        b=Nb0GOfWsVT3hloaN/01PMTYWxolIHung7T8hlwYXZoK2DUKFtO/u7hOGDDzBtgxqQc
         dpit7KIwC6CdNsR2uy7ssGj62bnfJxraeMB7Su74Do4+sbeKSlOIx/d+7Wf8httWdjnV
         t2Qhn9mU3/HMQlcMMSoWWk/2rqaDEHqHulL90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1zzhdOehbDD+FponR7bGGHlh+Gaa0fPm3NGCfkjDy2E=;
        b=Rm3NZ0/GL/t7UcL675dRE+qdFtfwi90zD3hqqqIVCamyPQQPacrAyGvFs690O3bw5Z
         TDeOHKyCEkvtx0oHrTSEE4p0JRwmxdrQlI3jQNe3Ixh59LIBMQqFQ8125vDMQofIZuj0
         Dh8w8Gm6zDOgq0AYQlK7cmgeNzspasNnEaqAhjjN+DGcWZfhIQhbEeoP8wnV5B1FGFp2
         77DjNBh4JnfJmFPKJ4k0Ohth49sNJknEIRR5KQWYkYiXlqDeu00nnYtWPRviQOiHQ3qW
         3cfhPPBuXMRHn2LUAlJUlUvqVA4EcHx84imMZQRdSFMbIsg/CucM3AZwf1RA+ynoFkzF
         Abyg==
X-Gm-Message-State: AOAM531ZRxcblgUiwuWARiORoKFNyzl9YGKKb/mD7UWtCu7IEAZhBpZW
	JxqnXJ6R9vTyP/2HiBd2MONiKQ==
X-Google-Smtp-Source: ABdhPJyNlbv1HUqJlF3sEMbEwwqPTYLJkD2X7s1ccTHE6aQeseEJxYyW/F6XyFT5S7g7jnpco4PWfw==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr1947115wrw.391.1614185582265;
        Wed, 24 Feb 2021 08:53:02 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4476:47d0:b128:f21a? ([2001:8b0:aba:5f3c:4476:47d0:b128:f21a])
        by smtp.gmail.com with ESMTPSA id t5sm3999293wma.4.2021.02.24.08.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 08:53:02 -0800 (PST)
Message-ID: <cf829317572f060b4e5119aaf2dec12694fe185e.camel@linuxfoundation.org>
Subject: Re: [OE-core] Merge meta-rust to oe-core
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2021 16:53:00 +0000
In-Reply-To: <1666A58EF14596DD.29651@lists.openembedded.org>
References: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
	 <1666A58EF14596DD.29651@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-24 at 09:39 +0000, Richard Purdie via lists.openembedded.org wrote:
> On Tue, 2021-02-23 at 22:01 -0500, Randy MacLeod wrote:
> > Clean-up the merge of meta-rust to oe-core by squashing most of the 
> > meta-rust history so we are left with:
> > 
> >   35da4b252f rust: add a language demo image to test reproducibility
> >   088374371b cargo/rust/rustfmt: exclude from world
> >   7df10d2a22 meta-rust: merge commits
> >   4187796cd6 rust: mv README.md to recipes-devtools/rust/README-rust.md
> >   03b9c60ef4 meta-rust: move code to oe-core from meta-rust layer
> >   2c62874204 libgit2: pull in updates from meta-oe
> >   24cb3db88c libssh2: pull in additional commits from meta-oe
> >   e9a0a3bad2 Add libgit2, libssh2 from meta-oe for rust
> > 
> > The full diffstat is below. (1)
> > 
> > I didn't really notice the scripts shown below since they are mostly harmless.
> > I'll review them and remove them in v2 if they don't make sense for oe-core.
> 
> This is better, thanks. My feedback from a quick glance:
> 
> a) Need maintainer entries for the new recipes

In the interests of moving things forward, I added entries for libgit2
and libssh2 and queued those bits in master-next since they seem
near enough ready.

There are other recipes which will need maintainers entries.

Cheers,

Richard

