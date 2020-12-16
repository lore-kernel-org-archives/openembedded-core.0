Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.721.1608141482092967494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 09:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bEm/sj+w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d13so5800310wrc.13
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 09:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=PLbvXGJRYgLCP+YUd2e3P5gqn3aik0A8OGkor8SmUhg=;
        b=bEm/sj+wZv9WikGDgSzICVdjs7fglPZWhZ/8MC4bshfX7LuEhTXpOVH4NGve1jxES2
         ZwHaDkRynL2ubopShV8Yr5swWEWAKal1q/5RSjoUuuD51ZdD8cWCG+9/4aMqHPoIJAHU
         sHOmXEeNvTEofg4ZvLOFCTaRUbsOEwsUDmrh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PLbvXGJRYgLCP+YUd2e3P5gqn3aik0A8OGkor8SmUhg=;
        b=Sm96AM33k0GCi3RNcn+7qH29wr8f0Cc5lle7zn6h1/pyR3472tc88OMHgSUsb6gSCn
         KJ/OwZkexN3lEK/NwdQAWvhOjSsi4X6mRRYBtNwGhYGhAlddzwv8mxgB8MQqMcF1G6vR
         qHxLhuXuSqFeiAs/otiELo9iZbfJMAMvXQOcnLI7lNxjt409nuHNpM2ZqoxYmjpY5Z7o
         gUk3lpAPC7jBc7224QM4XYOdJk0hO25MwhMTISNjyun16aYaQZ7u3GGNf3ZC6YVKhLTH
         s5Ii7xPBpAvxlyUxdG2R2X5I/ixvfWkpFQLmSmWMeqR7cU7tq/tTNWKjkh37Ycnm8RkQ
         FIlA==
X-Gm-Message-State: AOAM533++qQTmBWEK9j0xkdZMxUsl8fgjTVsmHrVrQf/EUkDcg2pRfB2
	9J0VJw0UYPufxvgP5Ib9fKn3Fg==
X-Google-Smtp-Source: ABdhPJyP5L+IuyAmE4ZJg3GSjVxRk9ac2lLG3HBLAdKmWXPB5Y+WKhR3ZoeEoHr9AKGzrd8tkXd+ow==
X-Received: by 2002:adf:8b15:: with SMTP id n21mr38929112wra.426.1608141480461;
        Wed, 16 Dec 2020 09:58:00 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id z8sm3690377wmg.17.2020.12.16.09.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 09:57:59 -0800 (PST)
Message-ID: <4f103b688ffbc0fadb100c7a9c88a3ecacf26a9c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/5] systemd: update 246 -> 247
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2020 17:57:59 +0000
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

Unfortunately there is still something not quite right in this patchset
as it failed again during testing. There are a few different problems:

meta-intel in systemd-boot:

