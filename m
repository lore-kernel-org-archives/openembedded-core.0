Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.21806.1589721558043929924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 06:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YIIgA4n+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id y3so8693223wrt.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 06:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=LyJM06FoUM7/JZYwTpkpuiLcA6L287sLBcZwuXOIZYg=;
        b=YIIgA4n+jw38HUp2ZDCoYq7Au3q9jl7c2to+eP2dwLVMe0Izzz1WhOpp8T7pj7vlTm
         evGvcVtoV5JS3fID+/XFdSKB9og7hkdUeTOy3hOMiPe4Lkd44Xf4tkAtSRatis64hlFv
         UtNT5PWw79k0bduhZyoHb2O8ADkqJwuoP0Few=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LyJM06FoUM7/JZYwTpkpuiLcA6L287sLBcZwuXOIZYg=;
        b=i0pgCYthyOghANOBlbXYS4fwIj/xcpr62rYiuLhHIp9avzj2VLDgJP7/y8NkwKe+Rm
         h+/QAG6wLs2WyLQLqGQbjmRNrHj9CHf7amBtAcOp1Nx80HSvF8D4k58luUxMNJtI8NVg
         LF19iQT3mCiwVsajq5xQZcGC7uEYLvJGSGbRCuhh3Z3oai00ObpVyOItFfB60zSZiq4+
         gmkdhqGdA3OUUm4STr5l70zGXBgS3vxDY+grVsV7h0c5bvkird8bMg2nq3BiaEp/rB03
         DuBZzqLrIAxjKuYfpyS99wcEtZsw0spZ5PbmcZM1pBlWCMye74FkQ0v3Co7xxFWw5mfa
         4N6A==
X-Gm-Message-State: AOAM531sA6cahrkSZIkdvBe5tUgHDD1EhtZtDs5fF0zUOfdzWiYzOMAi
	tcCOG5OKMP/RW9E5W1X/PZPJ7g==
X-Google-Smtp-Source: ABdhPJzKFIXLIDhUruSAZY0yiS1rdyf6jkM4caJzcIV/L8oRqna57w1HBdEi58w36AJZb2Q59nXhtQ==
X-Received: by 2002:adf:f783:: with SMTP id q3mr14227564wrp.348.1589721556391;
        Sun, 17 May 2020 06:19:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b18sm11751939wrn.82.2020.05.17.06.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 06:19:15 -0700 (PDT)
Message-ID: <40db772827bd9b923d3604a76413a159dba61575.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] lttng-tools: upgrade to 2.12.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ovidiu Panait <ovidiu.panait@windriver.com>, 
	openembedded-core@lists.openembedded.org, Jonathan Rajotte
	 <jonathan.rajotte-julien@efficios.com>
Date: Sun, 17 May 2020 14:19:14 +0100
In-Reply-To: <160FD1B38339CE5B.23434@lists.openembedded.org>
References: <20200515121106.27860-1-ovidiu.panait@windriver.com>
	 <20200515121106.27860-3-ovidiu.panait@windriver.com>
	 <160FD1B38339CE5B.23434@lists.openembedded.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-17 at 13:49 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Fri, 2020-05-15 at 15:11 +0300, Ovidiu Panait wrote:
> > Upgrade lttng-tools 2.11.2 -> 2.12.0:
> > * drop x32 patch, as it was merged upstream
> > * License-Update: licenses were moved under LICENSES directory and changed in
> >   upstream commit [1]
> > 
> > [1] https://github.com/lttng/lttng-tools/commit/ab5be9fa2eb5ba9600a82cd18fd3cfcbac69169a
> > 
> > Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> > ---
> >  .../lttng/lttng-tools/x32.patch               | 36 -------------------
> >  ...-tools_2.11.2.bb => lttng-tools_2.12.0.bb} | 11 +++---
> >  2 files changed, 5 insertions(+), 42 deletions(-)
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/x32.patch
> >  rename meta/recipes-kernel/lttng/{lttng-tools_2.11.2.bb => lttng-tools_2.12.0.bb} (94%)
> 
> Fails on musl:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1913
> 
> In file included from ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:14,
>                  from ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.c:10:
> ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:17:10: error: unknown type name 'ino_t'; did you mean 'int8_t'?
>    17 |  TP_ARGS(ino_t, ns_ino),
>       |          ^~~~~
> ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:17:10: error: unknown type name 'ino_t'; did you mean 'int8_t'?
>    17 |  TP_ARGS(ino_t, ns_ino),
>       |          ^~~~~
> ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/./tp.h:17:2: error: unknown type name 'ino_t'; did you mean 'int8_t'?
>    17 |  TP_ARGS(ino_t, ns_ino),
>       |  ^~~~~~~
> ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/./tp.h:17:2: error: unknown type name 'ino_t'; did you mean 'int8_t'?
>    17 |  TP_ARGS(ino_t, ns_ino),
>       |  ^~~~~~~

and:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/938
https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/1907

will abort the build as this is going to appear everywhere.

Cheers,

Richard


