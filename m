Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.1614.1610057784168633501
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 14:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z427WBZC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id t16so7129117wra.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 14:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qpLIRbh0GkWZGsSMuR0Vb+034uKc0NFU0SkA9QZJDt0=;
        b=Z427WBZCIXmEJ8NQzavNybkyLjNjoAYcH1D7zc9Xk3Nenke3L0inNEnsr2f2GbrIYG
         nBU+/01LV8sYV220Nbi5ddaL1RjchmDKT03kyuGVguOu5YH8AIuKjaWdnfIfJasaVX0w
         qL7ijvCQve5UznXt8DXh2IqP1Rr+B9QwvQQ84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qpLIRbh0GkWZGsSMuR0Vb+034uKc0NFU0SkA9QZJDt0=;
        b=Hw4cJwGTb1Btfcu4OzVWUAcZIZUsoKX5DUZGPIxe8mYtMx2DumyL6GWza7GQ8K7bub
         Ejh2DT0JxQAlnNWOSoMGaAW0wzfaXw9m4w0Eh/Op+E7s8NpK2rx/Itu/trjq4z9ThqeB
         xAfrWyIViSOFIoba0D5iBYOpdCTe7rrAgNZIyK1EO7O5a+U8bYfYsri/xsIFy7I8yfbE
         31z6kF8qpIkjVIysf75l+MnN/neUGeYHPwcyv+CmQP45jjeAKO94DuVuNGmDMgHBBWnF
         a+PbmgeCZeFOZHyK75L3vO1IkmB5AbmOmE5O6i3XD0v/x+qkNLVenc+oc65rm5OOw8lJ
         A1xw==
X-Gm-Message-State: AOAM530dfF8sUXqu3GfdxWagVa3UKcoqr8vRP8LG03KfuWdbP96evEOd
	w/u1Tf4RiMNfTrqDFOl24qwsqw==
X-Google-Smtp-Source: ABdhPJw6Jrl21LfzOx7qGmV2Y1D0XWhUrZiyf1FU7TGwsVeusMJdmoj4EnS0W9kULVYZ4LVwWWEzcQ==
X-Received: by 2002:a5d:470d:: with SMTP id y13mr631187wrq.309.1610057782698;
        Thu, 07 Jan 2021 14:16:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8262:2156:a38b:824c? ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
        by smtp.gmail.com with ESMTPSA id n11sm11654067wra.9.2021.01.07.14.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 14:16:22 -0800 (PST)
Message-ID: <63d70805b829d08faf3e73865ed7f9c2ad9a1366.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][PATCH] bitbake: remove /usr from pseudo ignore paths
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: rnouse@google.com, openembedded-core@lists.openembedded.org
Date: Thu, 07 Jan 2021 22:16:21 +0000
In-Reply-To: <CADVsX8924shMc+PFUQ6jsmnUqsF+VAeRfn0xM+4G406EgvGFCg@mail.gmail.com>
References: <20210107215121.3901938-1-gmouse@google.com>
	 <CADVsX8-dMLvuccRjzU73=-reDjEBRq5PZZ+S6ZeugSvTy-iqog@mail.gmail.com>
	 <CADVsX8924shMc+PFUQ6jsmnUqsF+VAeRfn0xM+4G406EgvGFCg@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-07 at 22:58 +0100, Anton Kachalov via lists.openembedded.org wrote:
> Allow the Yocto's building tree to be placed under /usr.
> 
> Relevant issue: https://github.com/openbmc/openbmc/issues/3724
> 
> Signed-off-by: Anton D. Kachalov <rnouse@google.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Do you really need to build under /usr? We probably should make this
more of a hard error if someone attempts it. I commented on the issue,
could you just remove this from PSEUDO_IGNORE_PATHS locally if you
really have to use /usr?

Cheers,

Richard

