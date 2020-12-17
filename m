Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.12316.1608225910051899144
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 09:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XIhKdjiR;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id v14so6238196wml.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 09:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=A/RH5rhE3+IMs9B3BI5LqYxVzPc4qvfZi6Pb0A9PdVQ=;
        b=XIhKdjiRL2x2G/8jEA+SXEru2MprDCpiAi0lQi9lS9Y4Sw8KEWPg7OAfhTKv0SRFAU
         lfNi8IHtY9LzYSVv6thmRxY1hof2w8sOQHv8YBOiKhRMf1ClFS9Shv9D8+U/wzxXkhUE
         6I7/io+L6w86RqBmLJeg2fJJNLtf7MsV8rsCXcB2fhQHh8iRdPIXHPoIqe8HCUwrlLrD
         gN71eD1qLOvvIvNgCyEZ396c9VDCNW9jnoKvZPyy52zRVDyS1AFxoVdf/pMf+nwmqKeo
         baLz7tDEDQ0cn9NsFJUyKunOoHduvnBI3VqM2s7gbT97Z/axpoMTNHeLQliLQYZUCz7P
         nHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=A/RH5rhE3+IMs9B3BI5LqYxVzPc4qvfZi6Pb0A9PdVQ=;
        b=NN1RloO+iYuhNaorXFYuwcYPZGHWaD3BMD5dt/EP5BnVBV5p+Z01ANWRTiOJWlVJ79
         laOsGyUpcUE5CUyEKy2H8lRlOfmfPqp2txFakfzCagPnvZWTBRwYNninm5rADpvRfknN
         1GlhbU/h9IwT+GDCqTvxJ0G3zfg26oRgQ/B/zwcVBPZXJgH+9Suw8sk6QqELox/tCkZD
         xs08rH1d5sX/FfZ/gTLkJ3gPTN5IWQtD43R5jCDcCNhqu8H8W0UfXQQ/KVNLHoyiAp9K
         D0cRpdlDBbfo/4gKYHd7NKNpZ1olCkVgQTT+KYPO1UW5OCLkmgwpWtj4xpqLQE67ObiY
         1H4A==
X-Gm-Message-State: AOAM530rp7JmW5Ci9SD9ErnZFj6KVJ1y703HaQ2lhwaJMyuJO89//YPs
	q01g9FM9v/fDtwVl89ZI57o=
X-Google-Smtp-Source: ABdhPJzLvKHbcm4AOCx4bZfR8Qd+nnYp1NF23S1QMBU4BEEI2JLErBku1ZPTSDvwWq8fExDKIGjy7w==
X-Received: by 2002:a05:600c:2219:: with SMTP id z25mr375804wml.27.1608225908547;
        Thu, 17 Dec 2020 09:25:08 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id s1sm9759528wrv.97.2020.12.17.09.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 09:25:07 -0800 (PST)
Message-ID: <68d3174ccafddf0732e553e408e8b1c5c62a095f.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/5] systemd: update 246 -> 247
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2020 17:25:07 +0000
In-Reply-To: <7d16bf791179cc0e90fd0172e984eeeacb065112.camel@linuxfoundation.org>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201214123457.122655-1-luca.boccassi@gmail.com>
	 <7d16bf791179cc0e90fd0172e984eeeacb065112.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-12-16 at 18:07 +0000, Richard Purdie wrote:
> On Mon, 2020-12-14 at 12:34 +0000, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > Update systemd to v247.1.
> > Add rule for new oomd dbus conf and for new pam.d
> > conf directory in /usr/lib.
> > Drop selinux-hook-handling-to-enumerate-nexthop.patch,
> > merged upstream.
> > Backport 0001-meson-set-cxx-variable-before-using-it.patch
> > from v247-stable to fix builds without C++.
> > Refresh musl patches.
> > 
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > NOTE: the musl build has only been build-tested, and only on x86_64.
> > The glibc build has been built and runtime-tested on x86_64 and
> > arm64.
> 
> [sorry, hit send early when writing]
> 
> Unfortunately there is still something not quite right in this patchset
> as it failed again during testing. There are a few different problems:
> 
> meta-intel in systemd-boot:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1016

Looking into this, thanks

> a reproducibility issue in oe-selftest:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1651
> (which did happen last time as well on centos but I don't think was
> reported on the list, sorry)
> 
> These urls may help understand why its not reproducible:
> 
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/packages/diff-html/
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/
> 
> (looks like the uid of messagebus is changing at a really quick glance)

Given your follow-up message about host contamination, is there
anything I can do here to fix it/mitigate it, or is it a CI issue?

> and a build issue in world-lsb:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/1189
> 
> At the top of the logs you can see the configuration that is being used
> for a given build, so for example in the last one, the key difference
> to some of the other builds might be any one of:
> 
> DISTRO = "poky-altcfg"
> DISTRO_FEATURES_append = ' api-documentation'
> require conf/multilib.conf
> MULTILIBS = 'multilib:lib32'
> DEFAULTTUNE_virtclass-multilib-lib32 = 'x86'
> QEMU_USE_KVM = 'True'
> INHERIT += 'testimage'
> SDK_EXT_TYPE = 'minimal'
> SDK_INCLUDE_TOOLCHAIN = '1'
> 
> but given its a pam error, I'd strongly suspect the DISTRO = "poky-
> altcfg" would be the likely trigger.

ERROR: systemd-1_247.1-r0 do_package: QA Issue: systemd: Files/directories were installed but not shipped in any packa
ge:
  /usr/lib/pam.d
  /usr/lib/pam.d/systemd-user

But the recipe has:

FILES_${PN} = " ${base_bindir}/* \
               <...>
               ${libdir}/pam.d/ \

Shouldn't that match? Did I use the wrong variable?

Thanks!

-- 
Kind regards,
Luca Boccassi

