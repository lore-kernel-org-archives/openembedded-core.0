Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.29939.1618221293512177868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d0zHSVYi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id 12so12250818wrz.7
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=W9GlOFTr8Uk+spwCUwlHZk4/obQ9c5UIpRyJe3Kju10=;
        b=d0zHSVYick8CUl61OXnqpvm52LTl9fJF2Gel9TFkWxVIjsFcP/spzC52OvMjExhfY6
         13I+K1TkB2b/4cGesGpjCYt9q0kl1VeQrlCST3Qfou5SFDun8qXbvkcIkL0w2nQ902ap
         sDwk7agVLxbv3YLm6etIcM/S+rgIyqYSOasKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=W9GlOFTr8Uk+spwCUwlHZk4/obQ9c5UIpRyJe3Kju10=;
        b=T0TbDMJbZhAA4w5cCiziEerVrwmt35UVi3Q2kxl2sx46l3WUfkOBjsiOGsSl7o41pE
         6bn92tgLuRvXuy9TWQH4LtcufkLNtFFAWB8o6ISLYWtf/0DKwbRJP82q1DONzN8sQG4M
         8wAPnQYO7L/iyoCsAg0kgYd5WpQFiDID2uc2cm5mbOA8GuuZPrF+EgBBMt3tlYxpmmf2
         b7KPWdhy6sOC58VpQZ6VUmg6Exh/vZApM9V9sNqBxhHJ8af3cbGb9UNEq8s65MglQrwX
         zqBz+jrwxSu3QopOcxWs2IWrYmlhRfyE41ueX1R5lUOCkXki1LV9poAeoVDBtDGB8ZQy
         tnzg==
X-Gm-Message-State: AOAM532hWcebYjUeRwr/x5Hqe0xJNt8SaciEkFpw908z+sJTVpZXIs6k
	ekh9gRDk/V1BB765ZrjxI6KxbA==
X-Google-Smtp-Source: ABdhPJyXZSeCOW9q1i7aJK3p7uD70D9URLsKZHTGK00mYy3+kxc/5jSTKuXJmnUrAAA1+Ezk65ZZCA==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr30341676wru.381.1618221291997;
        Mon, 12 Apr 2021 02:54:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4639:d550:9529:c277? ([2001:8b0:aba:5f3c:4639:d550:9529:c277])
        by smtp.gmail.com with ESMTPSA id u3sm4565849wmp.42.2021.04.12.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 02:54:51 -0700 (PDT)
Message-ID: <b5a702f99841616420c8d82b013fd91aa0c11d9d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] gcc: Upgrade to 10.3.0 bug-fix release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Apr 2021 10:54:50 +0100
In-Reply-To: <CAMKF1spL71KJfmpPT7F09gc=RB8NPgKFRewAtHhj7bFNp-H8Sg@mail.gmail.com>
References: <20210411202746.388822-1-raj.khem@gmail.com>
	 <dd4c72b2aaf48cb7f015030e232bc2641e38f2ef.camel@linuxfoundation.org>
	 <CAMKF1spL71KJfmpPT7F09gc=RB8NPgKFRewAtHhj7bFNp-H8Sg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-04-11 at 16:20 -0700, Khem Raj wrote:
> On Sun, Apr 11, 2021 at 3:12 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Sun, 2021-04-11 at 13:27 -0700, Khem Raj wrote:
> > > Drop aarch64 backports which are already upstream
> > > List of bugs fixed is [1]
> > > 
> > > [1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=298084&resolution=FIXED&target_milestone=10.3
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > v2: Fix BINV
> > > v3: Fix maintainer entry to use PV
> > >     Fix include poison patch which was old version
> > 
> > Not sure we can put PV into a maintainer's entry like that as it is in the global
> > namespace, it isn't gcc specific.
> 
> I checked it with bitbake -e and seems to be effective.
> 

"bitbake -e" didn't show the correct thing for me so I tweaked the patch
in master-next.

> > I also couldn't get this patch to apply, is it on a branch somewhere?
> > ]
> 
> Its on kraj/gcc11 branch on contrib tree
> 
> https://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc11

Thanks, I've queued up another test run.

Cheers,

Richard

