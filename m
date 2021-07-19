Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.308.1626712664806756681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 09:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qX3LHBVm;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.44, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f44.google.com with SMTP id o30-20020a05600c511eb029022e0571d1a0so370536wms.5
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 09:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pkQ5GYYy/dVjj5IkWLbec/dToeLHNu+C/ijje6QaxY8=;
        b=qX3LHBVmcVp9zPO+TlQdiSRCYtOe4asvNSPj5Q4eUirz1SDcVcf5SXfBihms0yYVUm
         8jnU9aVb/ZL7SYHT1mhjd+TvqJZGb8XguOhNoWvj0cbK/qy02yd/xCIMu/rF/x8wWCrP
         BYreZdLfKtAdxgkbVhv/MBdIdj6OwckDEDIB8E5eMjl9M5HjR4iCe9XwTxjMA94LjMAX
         YNGSWU+nSuvKXrCcqEUejicMC83bpRssSdSHxNvT6jGVRTinNraSY2nq6fIt0qcwuiAW
         MNgxGldoO0Ebq5StwLms/GfWvf+4Etdl4hu7XA7aRznbxsT5RYIe9wHvK6xVNNMNqJ8d
         5AKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pkQ5GYYy/dVjj5IkWLbec/dToeLHNu+C/ijje6QaxY8=;
        b=CUtOCEH7YWG9s5VDba1IBattoMby1y/Z4Z3QSRP+66V467Fbw0Hv4AByEK3lMXrVg+
         gN7mB9AC/VXLyZPdQvorcK+TJG7nu8mc0XCTEZ3T6+e0FyDUJ+xTSPPPOjqtwvT7P1oz
         zfwJymDWBwRo6DlA4ZFabrVOZwJzNAraaSxs2ek0veYg1Vm1nZqJjGodm3eVEebP2msW
         +dzzl6Xb929XF4UMDIfAkeoyTopkZUoVF1jidjrIPNl/HUT9ys+iOxzNzWeb/Ughztuj
         XlmoliPY8ELJYCMqOcAfgDuwHWU3l6kc1XxEh7SnXlmBApNJG02L4i9qeQYJpDDbF0f6
         B3uQ==
X-Gm-Message-State: AOAM533RqE7VYziCr6+7lVAiPkxHuUd+C5WiEp4dLMT9awXNQ7oV5b15
	E+lzjV3PMFV2OFBvKHpABOUBQfiOiJJwOhH4Rk4g1w==
X-Google-Smtp-Source: ABdhPJzcVgrZ4C14KJzP41S4v77kMHXaGkjb5ZTK9Dlhx0limWKcQY6/hfWoXQQOKhzWo7wBwRMP2oeUXLcxjJjzKZA=
X-Received: by 2002:a7b:c958:: with SMTP id i24mr32847936wml.177.1626712663229;
 Mon, 19 Jul 2021 09:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626652989.git.timothy.t.orling@intel.com> <CA+chaQcn3SPu=vf+iXCAbAOS=Azyukgit9HCNKUO5L_A6dqOOQ@mail.gmail.com>
In-Reply-To: <CA+chaQcn3SPu=vf+iXCAbAOS=Azyukgit9HCNKUO5L_A6dqOOQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 19 Jul 2021 06:37:32 -1000
Message-ID: <CAOSpxdaDjkNHS+MV_QzWHXT+QWMHZciXL6jYVq_7JihyELramQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 0/1] libxml2: Update to 2.9.12
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Tony Tascioglu <tony.tascioglu@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Tim Orling <timothy.t.orling@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 18, 2021 at 9:34 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> Does it have compatible ABI with 2.9.10 currently in dunfell? Unfortunately
> https://abi-laboratory.pro/index.php?view=timeline&l=libxml2
> ends with 2.9.10 version, but previous patchfix releases were also often incompatible, so if 2.9.12 changes are even bigger, it might cause issues for people with prebuilt binaries on dunfell.

I downloaded the toolset used to generate the ABI compatibility
reports and ran the test for libxml2.

Sadly 2.9.11 is not 100% compatible with 2.9.10 (though 2.9.12 *is*
100% compatible with 2.9.11)

2.9.11 is given a 96.9% compatibility score against 2.9.10, with one
added symbol (xmlPopOutputCallbacks ( )), 2 medium severity data type
issues, 3 low severity data type issues, and 1 low severity symbol
issue. If anyone is interested I can send you the report.

So it seems that this version upgrade isn't a good candidate for dunfell.

Steve
