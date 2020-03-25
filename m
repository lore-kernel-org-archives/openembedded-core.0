Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.24800.1585173530391331407
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 14:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=zmrl5hqH;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.196, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f196.google.com with SMTP id h14so4409207qke.5
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 14:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=i0rVEhuiiVObjx4kNQGPPPOvsdwlOIR9MtgQIt9OtNA=;
        b=zmrl5hqH/PuIDqu1wx42A7bcjjbHTwNoBjFgpsMNLCOKmYLY+LznAHqhISgGFvHM+p
         puhCiaKyUVnlZ/CPQnIm7A1Z2yn/7tSx1c0WOoCqdzaAIlHLEk5iUwgEiUATrGMeWGvj
         mLei5UrIXCWGjuOruzqH5R8vstF494jyfZpFtwWFGO4Ubg4az6lPXMgxlooLT4UMK9n8
         pSTSaKIkKr54riY7iCx0iK1UC7r/28O/xX6QehKLn5Wx7Dw7uygug3J/zMeFwoo6nVkd
         3EfeWnAieb2FQntG5M48oCC4ssbyWhZGqJPBsfL30gz46TiLxjNTrMgO6lm4VU1q7d9N
         TO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=i0rVEhuiiVObjx4kNQGPPPOvsdwlOIR9MtgQIt9OtNA=;
        b=t12QkTLNqfQaKVbwxZptHrbFIyebd3SKFnXDHBCejA5KjgIOKAc5HG9jWFhgwRKdLT
         WaYgF7emt+muXxbpB5HcUB/lLDflr3K2h7oxRpPlijk4J5ym7AwGBKK+3R7o7FNoE+vg
         E+D4FKxWG2IIR4p47cUvmoE8CbZ1gv8MCoKNBHt5jPlI286rX27Eeihc+/47+u1oR8aS
         Cn57zQnMkp42/eDVZcA3K1mb4Qc+ksxUrp19ErOKqWNttyKjJtwRq3ELvz37zlDHuE8p
         xkqDndSVc9QNpAU1L7ulBAe8WQJ9a3DuucQTRJWGEyHt3nAU7PjJr26VXIUPwp6H/IO0
         Yw2g==
X-Gm-Message-State: ANhLgQ0Q+BPxlEU1zAh23NdgdzKJzDOmufWY5D9W8dPf5q8moerl74dC
	o/4cOqlBoEsJANPSD9sk4OHj+yev0ic5qA==
X-Google-Smtp-Source: ADFU+vu5y8T7H1U6VxKcYME9OWfEFJoe2uhDnC3j1pVArokhHDhgmQZLBw8S8i3DFMGs6CQ9Ba4odA==
X-Received: by 2002:a37:a40e:: with SMTP id n14mr5163662qke.494.1585173529257;
        Wed, 25 Mar 2020 14:58:49 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id h46sm206492qtc.84.2020.03.25.14.58.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 14:58:48 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f172.google.com with SMTP id e11so4370079qkg.9
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 14:58:48 -0700 (PDT)
X-Received: by 2002:a37:9e05:: with SMTP id h5mr4968307qke.71.1585173528090;
 Wed, 25 Mar 2020 14:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
In-Reply-To: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
Date: Wed, 25 Mar 2020 18:58:36 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr3EFtcpu3cxvr4BSw9LkoM+qL-2idSDiMLzu-DGpAbVA@mail.gmail.com>
Message-ID: <CAP9ODKr3EFtcpu3cxvr4BSw9LkoM+qL-2idSDiMLzu-DGpAbVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-gl: The purpose of mesa-gl is to provide for X11 usage
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: "Burton, Ross" <ross.burton@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 25, 2020 at 3:15 PM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> Trying to build mesa-gl without X11 enabled, results in numerous errors
> about being incorrectly configured, such as:
>
>   ERROR: Problem encountered: building dri drivers require at least one windowing system or classic osmesa
>
> After consulting with the author of this recipe, it was clear that it
> was only intended for the X11 use-case, so requring X11 should avoid the
> error message above.
>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>

This is wrong. We ought to add osmesa as fallback and not hard-require X11

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
