Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.14209.1597529429427416802
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 15:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ahTb/EZ7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id r2so11358203wrs.8
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 15:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=jx+2ydPbeZ69R0YHSj6R7/4tmxEdEfXaKy9qm8evNBI=;
        b=ahTb/EZ7OUUVKsH91rcMvGxRoi20s84sSv8/cBkJELIDb9xHk55DTe23DVSQLUVlPW
         eq4TAAy/bLZe1pa8pO+yX0d5UxAGvvumJJU11EqNtcY1sh7XKBk9wY17h8clk+Lre3i4
         68DbDudYTdfJ853Y6ca05sqGZZoaNA2HH2ty8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jx+2ydPbeZ69R0YHSj6R7/4tmxEdEfXaKy9qm8evNBI=;
        b=hquaaCOG6kwG30F2b7qM4pQ91GpAEuZFaaiDxIm61lxT8nNgLKGVcKiuMKtcarWseM
         ynfkiWJldo62ERORjC3ZbrkESecjWGfEWxXYcH7RNc0wjtby+QfEdOazaI4PduLzrnA6
         dUI1Ct57zemQ1DtEaCuv2gg5bSOrCsoDbeqAf2qVjP0jHiQUHOS13buLBLiHdF3MSMYp
         DrYf3npqdtZOlnIMbizVP9nErF2g59F74L2BjTf2o+w2qynHGc9NEYWa0YLfzpg3O8ak
         Jgin/et176dIjhdnj7PGvkTrfnu5dlRCgVr5mvXvedqNrd8X/3+9YL7rScRGUqoBO8T0
         EPlQ==
X-Gm-Message-State: AOAM532v7GHtPzDgbF118R25F0ZXV+/2aFe0uM3ikkdej0Gm5t4nG7MU
	DJ9G/nqme9xsuEmb8/fIMyRdnQ==
X-Google-Smtp-Source: ABdhPJwhY1/sYYfysSLuLR3zm5KWWrf80i2x5juHODN01j8OSRLTrv1Hv/FB2R8q3T+LadyKMpDqaA==
X-Received: by 2002:a5d:4907:: with SMTP id x7mr8955739wrq.166.1597529427857;
        Sat, 15 Aug 2020 15:10:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:edc4:7dfa:277e:8b29])
        by smtp.gmail.com with ESMTPSA id z8sm22379743wmf.42.2020.08.15.15.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2020 15:10:27 -0700 (PDT)
Message-ID: <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 15 Aug 2020 23:10:26 +0100
In-Reply-To: <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
References: <20200804082019.76320-1-jacob.kroon@gmail.com>
	 <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
	 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com>
	 <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
	 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-04 at 23:17 -0700, Khem Raj wrote:
> here is a recent build with clang11 which also switched to using
> -fno-common and errors are pretty much same you will see with gcc10
> with this patch to revert the -fcommon defaults.
> 
> https://errors.yoctoproject.org/Errors/Build/107234/?limit=100
> 
> I was waiting for upstream packages to get fixed before switching the
> defaults back to -fno-common.

Khem requested I revisit this. I see at least:

a) perf failures pretty much everywhere
b) kexec-tools in no-x11 build
c) cpio build failures in testimage

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1264

the world builds haven't completed yet.

So looks much better but still a few things need fixes.

Cheers,

Richard


