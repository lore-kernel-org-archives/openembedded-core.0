Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.873.1608142045511913899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 10:07:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NpDX7stn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id q18so16568385wrn.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 10:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=AC9PrxUSx6zYCoDHDuncIAU25U11sZxA7jZvQckcXu8=;
        b=NpDX7stn1yxz4mr2Mp4sYIfj4GeQxCXNGF/uXw2pFSiciNnRHaHRSfREnnNdh2ngYA
         BUaT5JROdXsrBA2n1nOua0WctjXEPo46aU8drWhCJccWdQyKEuvfog6xPqMbIQOSM4A6
         446qQv9OJVTTjSXeIKS8PeG8DxnQdc4gFO3SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AC9PrxUSx6zYCoDHDuncIAU25U11sZxA7jZvQckcXu8=;
        b=nZwL4UFU1ZFIGflquqhBxOsVIiCleJ2CNMzGJvWtzTCORQSWeTRfeLY/+VJ4D0IMfl
         LOUZQISbGwxmhaSn7SHoG87DIZ9OkUxe9iHVokqccoZcx8KC4EUbpVaAqOqtbtv0+YVo
         axNyaEzq/ia+pSbBIrwJJTRa3DMhtI1pRgtOKru8yxP8tzkwfTaCQ8h9UnUUtzEygkQy
         aE3ow5Z7quOn8JxiE3ZpDOsz13cQ61G/eWe5GNPCgjEQz+XcND/xTT17xlK+2VRESbk7
         y0WYdB79Ely/vTyfAQb6fjV1tvD+fyxUcVigGywp/hIQgv6gF2yoCZV/tmiKk48JaONk
         +WrA==
X-Gm-Message-State: AOAM532S5DAoLQ+DyYNox57jl3EPknuIAgCWNCsD4gYiyPwomGZs+STO
	RqJxG8uCBHlugVa0Z2nbtFJWDQ==
X-Google-Smtp-Source: ABdhPJwFzof3WkNa8+K9pBG5GPHfdRWabLeF6saN3DXVL42AQNr0mn4INKhQNZEU4UfXY7TK1FSAAg==
X-Received: by 2002:adf:8145:: with SMTP id 63mr7994739wrm.8.1608142043987;
        Wed, 16 Dec 2020 10:07:23 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id t1sm4439168wro.27.2020.12.16.10.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 10:07:23 -0800 (PST)
Message-ID: <7d16bf791179cc0e90fd0172e984eeeacb065112.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/5] systemd: update 246 -> 247
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2020 18:07:21 +0000
In-Reply-To: <20201214123457.122655-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201214123457.122655-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-12-14 at 12:34 +0000, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Update systemd to v247.1.
> Add rule for new oomd dbus conf and for new pam.d
> conf directory in /usr/lib.
> Drop selinux-hook-handling-to-enumerate-nexthop.patch,
> merged upstream.
> Backport 0001-meson-set-cxx-variable-before-using-it.patch
> from v247-stable to fix builds without C++.
> Refresh musl patches.
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> NOTE: the musl build has only been build-tested, and only on x86_64.
> The glibc build has been built and runtime-tested on x86_64 and
> arm64.

[sorry, hit send early when writing]

Unfortunately there is still something not quite right in this patchset
as it failed again during testing. There are a few different problems:

meta-intel in systemd-boot:

https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1016

a reproducibility issue in oe-selftest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1651
(which did happen last time as well on centos but I don't think was
reported on the list, sorry)

These urls may help understand why its not reproducible:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/packages/diff-html/
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/

(looks like the uid of messagebus is changing at a really quick glance)

and a build issue in world-lsb:

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/1189

At the top of the logs you can see the configuration that is being used
for a given build, so for example in the last one, the key difference
to some of the other builds might be any one of:

DISTRO = "poky-altcfg"
DISTRO_FEATURES_append = ' api-documentation'
require conf/multilib.conf
MULTILIBS = 'multilib:lib32'
DEFAULTTUNE_virtclass-multilib-lib32 = 'x86'
QEMU_USE_KVM = 'True'
INHERIT += 'testimage'
SDK_EXT_TYPE = 'minimal'
SDK_INCLUDE_TOOLCHAIN = '1'

but given its a pam error, I'd strongly suspect the DISTRO = "poky-
altcfg" would be the likely trigger.

Cheers,

Richard








