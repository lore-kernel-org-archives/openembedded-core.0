Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.9872.1612363158451829143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 06:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JVMKCgux;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id c4so21883527wru.9
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 06:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=tGzCR0DsUKLmgdgPODJnJMCyjEGaoI+oybZ8QprCKK4=;
        b=JVMKCguxxuQrZx2uD2iD1ED8iMhkjOYeUN0AS+DJk0xCxhSDycHdlNWybhsp6kPjT8
         2iLxccOLmu6GB1dN1+sNmgx1C91YsgK2Gkzq2WYsYcDIpvAV7pesuYJFER1Kb4mb3/lc
         9OJC9W6o/ZSt8SJYtvazdbXTw+CKQsO4S+4Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tGzCR0DsUKLmgdgPODJnJMCyjEGaoI+oybZ8QprCKK4=;
        b=Cl1L5Q3X49BODxVOIRBuQtehfJPEwNtqvcCsVWts/1CAXVnWzk76pbRF2ArLwETCQ+
         EKiilM4g/VNj9W/TPsSasQ7cTkiTTuqj6FxaeV+/PGflhs8MgO02bCOUPWbnMSuKnrL/
         6zVvOlro1J6KuQwOs00HYqTLO2lazhcApQg7kZGPWUqwbk7xuH+kb6W925zZx0cCmRSJ
         h6159StX+O6AHo+VL+9wI1Rb1dRppbmH5+Sc1yAgr8QT20Q45KcoPVEqJsBYx9VW05pw
         pKlDlo7VaECi9mOAUOgV8tXNQJmxxQ6OIBZ2pvDsJMTQg2Z9RxhF4DYQdrxMB6UQhKm0
         5scQ==
X-Gm-Message-State: AOAM532nW73eWwhvM0X2v0avetQy0DaFIdl0gIqvkldjfyKFcgxvxzo8
	pTsnY541+bRvTexsPEl5auaJ5Q==
X-Google-Smtp-Source: ABdhPJwu2/eCg/xUKr6dMCv3v8TqRs9fU5twFuBIf2nS4hHlvz8NvQVtXENWb8lwTGkYesMeuSmkuQ==
X-Received: by 2002:adf:8b41:: with SMTP id v1mr3813501wra.282.1612363156897;
        Wed, 03 Feb 2021 06:39:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a910:113:8225:ce6d? ([2001:8b0:aba:5f3c:a910:113:8225:ce6d])
        by smtp.gmail.com with ESMTPSA id q24sm2903413wmq.24.2021.02.03.06.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 06:39:16 -0800 (PST)
Message-ID: <67021164a90fc306800636a55aec26a69eca033d.camel@linuxfoundation.org>
Subject: Re: [PATCH 8/8] linux-yocto/5.10: binutils 2.36 fixues
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
  "Mittal, Anuj" <anuj.mittal@intel.com>
Date: Wed, 03 Feb 2021 14:39:13 +0000
In-Reply-To: <9da75cbd42a281f7c06bda22c3765966fe9a9ca3.1612322536.git.bruce.ashfield@gmail.com>
References: <cover.1612322536.git.bruce.ashfield@gmail.com>
	 <9da75cbd42a281f7c06bda22c3765966fe9a9ca3.1612322536.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-02-02 at 22:24 -0500, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Integrating the following commit(s) to linux-yocto/5.10:
> 
>     cdca78778415 objtool: Fix seg fault with Clang non-section symbols
>     d3287798bd88 x86/entry: Emit a symbol for register restoring thunk
> 
> With these, build issues with binutils 2.36 are resolved
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.10.bb               |  2 +-
>  .../linux/linux-yocto-tiny_5.10.bb             |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb  | 18 +++++++++---------
>  3 files changed, 12 insertions(+), 12 deletions(-)

Thanks. I think to catch all the binutils issues, we need to also
update genericx86-64:

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/3016

but otherwise looks good.

Cheers,

Richard

