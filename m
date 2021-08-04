Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.12065.1628096671958826479
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 10:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KtvG9+HU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id k4so3070105wrc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CuImdiNBQGDMx8hm/6YO0M3/Qx2MBuVDvdD/5DqadyI=;
        b=KtvG9+HUi51Qw7LbX5lKOErute2i6J8SOlyOA99x0Ccju/lPa7uaEs/U6kpyggS3HV
         7AVBm+0U73ej2nW6FlrVJamtu3JfNpjKRO95uYDwhGHAaSl5uLMUvZUpuqwJGda0Hm/p
         AlXvsM4UlnaSCkpLEzZOC3hVGaq5aGPa63EwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CuImdiNBQGDMx8hm/6YO0M3/Qx2MBuVDvdD/5DqadyI=;
        b=JaXNNefrCUIraAK+GYfrpKAPsP98qya+oTzhTGo+XZtvOeMCSneqy6dc4vz8dawp/P
         4mKwakZa+nFsCS/A7+M63r1cJtBnq38Dc7cC2wuhszE3vR1YUWZBtbuRF/5kQN2sPrqF
         Ir6hAfMTtj0th5VicKBaXvTYY6zYAIKmWTmlFvsC0F2mPvcJNReA66x0sMioR8Sky+jz
         Fm5VBJPCMl8OF4UPgsiKgobrxAlJe5xeGV0tu5PSLXNYlz1OEoXgNdyeX4/Nm5eLX1fb
         jOb42lcOs/dA5YVtbEaj3LKdUhkDk8dl53UFWJhERMSMJiAN7OJH84syUyeurotn9Eku
         sivg==
X-Gm-Message-State: AOAM530HsGjMIHqOPmpKBZxelV2fDcag3y8sjFdWi5S3xFT+DVbP2dB1
	23XhZSILk41O8WO95OcJ7PQoRA==
X-Google-Smtp-Source: ABdhPJws/b+NPJEgyeD5fLfQtteTuQpn6XqYOsnxPaV9f2m8v06jHs90/Zax9cDH92Ytp4WMl/H6Jg==
X-Received: by 2002:adf:facb:: with SMTP id a11mr387583wrs.192.1628096670338;
        Wed, 04 Aug 2021 10:04:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa? ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id n3sm2863934wmi.0.2021.08.04.10.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 10:04:29 -0700 (PDT)
Message-ID: <f5b4b10b3e15b813bf5d360a3eebfb27d3dc4f1b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] convert-overrides.py: handle few more cases of overrides
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Martin Jansa
 <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 04 Aug 2021 18:04:27 +0100
In-Reply-To: <20210804160714.GW1528@denix.org>
References: <1628040485-45946-1-git-send-email-denis@denix.org>
	 <1628040485-45946-2-git-send-email-denis@denix.org>
	 <3abc2853445a6f54a68cca95a87ee63925bf1588.camel@linuxfoundation.org>
	 <CA+chaQfComiP6AtnyhFbcqbhxzjD8epMuxSbdDNYibDGjFtPOA@mail.gmail.com>
	 <20210804160714.GW1528@denix.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-04 at 12:07 -0400, Denys Dmytriyenko wrote:
> On Wed, Aug 04, 2021 at 04:29:45PM +0200, Martin Jansa wrote:
> > Yes, I see the same in meta-oe and meta-webosose.
> > 
> > It's easy to spot false translations in incremental conversion where the
> > diff is relatively small, but doing initial conversion on big layer with
> > this change already included might be more painful.
> > 
> > On Wed, Aug 4, 2021 at 12:31 PM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > 
> > > On Tue, 2021-08-03 at 21:28 -0400, Denys Dmytriyenko wrote:
> > > > Add task-configure and few more supported values of TARGET_OS override.
> > > > 
> > > > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > > > ---
> > > >  scripts/contrib/convert-overrides.py | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/scripts/contrib/convert-overrides.py
> > > b/scripts/contrib/convert-overrides.py
> > > > index 6505b18..23f63a2 100755
> > > > --- a/scripts/contrib/convert-overrides.py
> > > > +++ b/scripts/contrib/convert-overrides.py
> > > > @@ -36,9 +36,10 @@ vars = vars + ["mipsarch", "x86-x32", "mips16e",
> > > "microblaze", "e5500-64b", "mip
> > > >  vars = vars + ["class-native", "class-target", "class-cross-canadian",
> > > "class-cross", "class-devupstream"]
> > > >  vars = vars + ["tune-",  "pn-", "forcevariable"]
> > > >  vars = vars + ["libc-musl", "libc-glibc",
> > > "libc-newlib","libc-baremetal"]
> > > > -vars = vars + ["task-compile", "task-install", "task-clean",
> > > "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
> > > > +vars = vars + ["task-configure", "task-compile", "task-install",
> > > "task-clean", "task-image-qa", "task-rm_work", "task-image-complete",
> > > "task-populate-sdk"]
> > > >  vars = vars + ["toolchain-clang", "mydistro", "nios2", "sdkmingw32",
> > > "overrideone", "overridetwo"]
> > > >  vars = vars + ["linux-gnux32", "linux-muslx32", "linux-gnun32",
> > > "mingw32", "poky", "darwin", "linuxstdbase"]
> > > > +vars = vars + ["linux", "linux-gnueabi", "elf", "eabi"]
> > > 
> > > I have reservations about linux and elf being here since this does lead to
> > > a lot of false translations for OE-Core. Since OE-Core is now translated I
> > > guess that isn't the driving factor so I'll probably take this but it is
> > > worth
> > > being aware of.
> > > 
> > > I did just have to retest a translation of core so I now need to filter all
> > > these out the diff...
> 
> Should I re-submit with 'linux' and 'elf' removed?

I think given OE-Core isn't alone with the issue, that may be wise. I can tweak 
the patch if you want?

Cheers,

Richard

