Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9009.1629631182579149329
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 04:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AHPi+RVF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id e5so4986091wrp.8
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 04:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8bX7hCdr5iJdT3QWQ0hINfbO8CYo9Xkp0I8OBpRIbUQ=;
        b=AHPi+RVFJa6n/Q6v8TcP1AK9vep47tPGyh4whT3SPAgtTVGh9vHjEQOiY5TIvsencz
         XIxM7YLZRv4kJ5q14WLTeOr3hSuhO+O0Fg7C1V/Ald7IxR9mytUjykd0lGpdFE3iWHIv
         1yVlldGIGpdsgRW/AxhdBRU9EcE45MX18Xcv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8bX7hCdr5iJdT3QWQ0hINfbO8CYo9Xkp0I8OBpRIbUQ=;
        b=hPZP5ljIN6o5piRR5WBO7IrHILRvJSzdWoygxqIQwrkQ5HsDCYTIAyacERx4LoHaIl
         v4j3yRQ1DR3hNxglmrNJDl/702udMPaMGdGaeve4L5Eo+Ym1R0MpamhwOYQOr/XwC4qI
         TPsoMcse4cEkMkw+N0HHm/dwD0Jj9K/LJexrSgOljS1ce2m2ucvas1F2UFYB2DU/JekO
         unEpxraSvZGRcK+nsi7Hq+LYtaBqrb8xM67bEFk1VObewHGzhKtpBTO7z4+kr1McHIKX
         9W+9vDCHhrbtZ1aLTfoBcUoGstbaHWvQLOvVSgKzULCuekkI8PVxPkPfA8WLQKfNvIGi
         WKiw==
X-Gm-Message-State: AOAM5320XWptA5qfxQdKPKIX58cduy6d+nuwQAsiiFGTlXflxtczcEJE
	Z6X0CZC80MbPTpsNLks35qD/Ig==
X-Google-Smtp-Source: ABdhPJypcqAQ3epZHVxLBtxMh/oxryQOPQphUb+wcy8BNW75i2nQbu+kfDR52PQaaW1uwY/uEmwMOQ==
X-Received: by 2002:a5d:58cd:: with SMTP id o13mr8231921wrf.421.1629631181034;
        Sun, 22 Aug 2021 04:19:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9821:d2f9:6401:2f3c? ([2001:8b0:aba:5f3c:9821:d2f9:6401:2f3c])
        by smtp.gmail.com with ESMTPSA id d145sm15273528wmd.3.2021.08.22.04.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 04:19:40 -0700 (PDT)
Message-ID: <87dacc6ecc7af109db0039894254c77b43ae8323.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io, 
 cardoe@cardoe.com, dev@codyps.com, tylerwhall@gmail.com, Khem Raj
 <raj.khem@gmail.com>, vinay.kumar@blackfigtech.com,
 saul.wold@windriver.com,  martin.jansa@gmail.com, paul@pbarker.dev, Trevor
 Gamblin <trevor.gamblin@windriver.com>, anbelski@linux.microsoft.com, Vinay
 Kumar <vinay.m.engg@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Sun, 22 Aug 2021 12:19:37 +0100
In-Reply-To: <fed5f2e5-000c-b7be-1d0e-2dc26afa6bd5@windriver.com>
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
	 <20210813151947.55142-1-vinay.m.engg@gmail.com>
	 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
	 <169C1FA457B99CA0.23238@lists.openembedded.org>
	 <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
	 <169D3274AAECC435.19323@lists.openembedded.org>
	 <fed5f2e5-000c-b7be-1d0e-2dc26afa6bd5@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-08-21 at 23:12 -0400, Randy MacLeod wrote:
> On 2021-08-20 10:48 p.m., Randy MacLeod wrote:
> With a patch from Richard, and the http_proxy check removed,
> $ git diff | grep "^[+-]"
>  --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
>  +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
>  -http_proxy = "http://example.com/"
>  +http_proxy = ""
>  
> we have fixed the oe-selftest that was failing.
>  Any volunteers to stub out the http[s]_proxy code in cargo ?
> I've written up a commit log that could use some review and pushed an update
> to:
>    
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-17-2021-a
> 


I'm not sure you need to change cargo, I think if you remove the bit in the
bbclass that injects http_proxy, the tests are ok. That will perhaps break
anyone using proxies but for now, I think that is a reasonable step of getting
this moved forward?

I think there is one selftest issue left which is a multilib one.

Cheers,

Richard


