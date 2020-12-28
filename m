Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.47535.1609171988748352346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 08:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LvZmEPM1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id i9so11733002wrc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 08:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2onyfEzO3tT/BOrgOgIT1M3rh2X7m+66sgF4jTK7P90=;
        b=LvZmEPM1P5U8gNgLp/Wa8whtc0b1jPIP2eQltPXigozvq75rmip0S/l6cTb6btBoCY
         JWwmDqFasGcxdWM8dssag5Zt/Q7NajHGcC4UzGd33kXImNiw1K6l/SaUYoo26wbi2pkX
         J/xINY88ptQj0P1BeqobwEgWv34nSs3HLgrFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2onyfEzO3tT/BOrgOgIT1M3rh2X7m+66sgF4jTK7P90=;
        b=eEf22SJhjSt4ZdNWnEu8EWwmhziTxbYV67koyJL9lJhW8TITG58VO17jhjwOhKQgLH
         XjcRMklnD6MLJ99VB0ufcZlJcPrCcDmwFDMRECcI+kl37x9xJGbBvp/GOABZyPwdu7dN
         8ns0wv+5wr6ApKmmv6CxptRbTNSx+3QymVZjsu5FO0/9kOx+shJZOxuhfcSr7i0DiMxC
         Th8ze52aW9pBYfblkUMk5wOUupY7WFaTwsLeN/jIHksCOwa5yZBt1yj2Ph2Gamf9yxe5
         Us+i9CLw9mBFtRGkBao8P8JknvzdAkNEoZkMguRG6z+yzQb2QAx8xqZC7pyTbPGNoIx/
         mBcQ==
X-Gm-Message-State: AOAM531AUIdLAoagzghSziO8/cR6hlzuN71GME2n+4aR4T+as99Nbs1i
	J2eAAQJuTMonXRzB72k2PL7NPQ==
X-Google-Smtp-Source: ABdhPJwEmXADPnIMFToru3YDNtL7PWvLHgmTe+2PMLg5Dp+19IRCdUWlPBysxxYOJCCNkutGafnX0g==
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr51232913wru.201.1609171987090;
        Mon, 28 Dec 2020 08:13:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from a.6.1.b.3.1.d.d.5.8.c.2.d.d.3.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (a.6.1.b.3.1.d.d.5.8.c.2.d.d.3.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:43dd:2c85:dd13:b16a])
        by smtp.gmail.com with ESMTPSA id k6sm20601326wmf.25.2020.12.28.08.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 08:13:06 -0800 (PST)
Message-ID: <8cca552fc163dee37990857f827a7d37767bf33a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rxvt-unicode: use RPROVIDES instead of just PROVIDES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Dec 2020 16:13:04 +0000
In-Reply-To: <20201227234844.2572356-1-dmitry.baryshkov@linaro.org>
References: <20201227234844.2572356-1-dmitry.baryshkov@linaro.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-12-28 at 02:48 +0300, Dmitry Baryshkov wrote:
> Change rxvt-unicode from using PROVIDES to RPROVIDES for
> x-terminal-emulator, since the package provides x-terminal-emulator
> functionality at runtime rather than at build time.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> index b064a63caa66..6ebd3afcb939 100644
> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> @@ -14,7 +14,7 @@ SRC_URI = "
> http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2
>  
>  inherit autotools pkgconfig update-alternatives
>  
> -PROVIDES = "virtual/x-terminal-emulator"
> +RPROVIDES_${PN} = "virtual/x-terminal-emulator"
>  ALTERNATIVE_${PN} = "x-terminal-emulator"
>  ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/rxvt"

This isn't correct, virtual/XXX are build time namespaces designed to
be switched between with PREFERRED_PROVIDER, the package manager
doesn't do what you want/expect with this.

Cheers,

Richard



