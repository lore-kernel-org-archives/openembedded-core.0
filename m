Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9183.1617974826935781613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 06:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bEEOd9Ml;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id g18-20020a7bc4d20000b0290116042cfdd8so4752854wmk.4
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 06:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=sm0qablWXmcm5qH3ILy/zg7YD9ny+NBT/VLZln0ouq4=;
        b=bEEOd9MleLU4kpiGtoI19iEnAR12xT9QxBnUbwmGeCivEkDMO9fn7SpWj6BeWfsKht
         qP2Kxl4r/dYRZOhCCukjP9jspeotVhNyDmVz+/K6qdZcTfpYf3rTOncDriAOQBCZ2uYX
         lZocslly9lrXNFTdLLvJk/rIx0dOupjosCinw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sm0qablWXmcm5qH3ILy/zg7YD9ny+NBT/VLZln0ouq4=;
        b=Vx0xP67Ewve0qsINNCv2csXb5r+bKN3eXEV66Fv1sn97ngRacrvsfbgaIhGIA2IHSA
         aVwzjU72MYfRhNIM0GxrlN+PukgDvXlaLJN49lTOKiTnBFtGDvpuEF221uYzfzAytrab
         U5Sbnzo36fj/+QEO87Hxo4uHs2eMsPUm5/dW2PnPTvuZtQLGyDuAD5HHhM1TYTy7vTiJ
         cPN6DNHAW6rYq6BHfSxdEP24itlIBDbszxx/Z3l6VcwV5eUWv3TXd5gxIXTdX9oIH7TC
         /xLKQRCyn6QvNqqjWdFanCUyVBzB3ouU26fNbAQBFGYtm1KRKGsHKK2629z0nJHO+IYn
         5Psw==
X-Gm-Message-State: AOAM530IfKXxyZPDQJX6N0pWi5pR1za7qKpvvir48bpYqoufzH4I+dHB
	vI/rvU1G+E1UKqclDMPG1qjCUQ==
X-Google-Smtp-Source: ABdhPJxibDTQqcgUTFQiBLyn7WRdqOelc9O2+Fl6g8aO4BJljVM4tLApghR/IflhzmW7Rtlmessbiw==
X-Received: by 2002:a05:600c:3541:: with SMTP id i1mr13802978wmq.97.1617974825374;
        Fri, 09 Apr 2021 06:27:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:434b:3ea0:b8b8:6ecc? ([2001:8b0:aba:5f3c:434b:3ea0:b8b8:6ecc])
        by smtp.gmail.com with ESMTPSA id x1sm4664756wro.66.2021.04.09.06.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 06:27:05 -0700 (PDT)
Message-ID: <f1cdbaa3f50b68f4519ba919385f9c068df57dc3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] terminal: Fix tmux new-session on older tmux versions (<1.9)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: pbbudny@amazon.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 09 Apr 2021 14:27:04 +0100
In-Reply-To: <db9c2955d3904d79b1dc38ed2e655260@EX13D38UWB003.ant.amazon.com>
References: <db9c2955d3904d79b1dc38ed2e655260@EX13D38UWB003.ant.amazon.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-04-08 at 18:09 +0000, Budny, Peter via lists.openembedded.org wrote:
> `tmux new -c` fails on tmux older than 1.9, when that flag was added.
> We can omit the flag for older versions of tmux, and the working
> directory gets set even without it.
> ---
>  meta/lib/oe/terminal.py | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)

Thanks for the patch, could you resend with a Signed-off-by line though 
please?

Also, a minor tweak to the prefix in the shortlog to "lib/oe/terminal:"
would be great since it needs resending.

Cheers,

Richard

