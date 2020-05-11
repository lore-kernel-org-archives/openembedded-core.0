Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.9366.1589192610222550757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 03:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HTCCriyO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id v12so10194493wrp.12
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5lqvde7NJFe9JamP2zvugLsXW5mBZUYkPTCoScAKEsI=;
        b=HTCCriyOCjs2u51C1kbHNyHt9wbBWkwvI73Oay0H9/evniCNGl7HU305P67ZR8OFU2
         yjMtjR4w0Kb9bBY/FXLi4gwG9aGl7DcGsNZnD5ZkAXFyj1UvTDeQMRnbC6doIj415ffC
         FWOdO5TG5fH8LWzClgdRqY67fSC3hGAHSiWE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5lqvde7NJFe9JamP2zvugLsXW5mBZUYkPTCoScAKEsI=;
        b=VBNyphfCRejGQMujPK7kC6hA7THJpMNjPld9m/E+KJUt3RJlImooIRKulb9aveCbX+
         ubpRFNaPP9pCURIh/ruemCL8Tu2Va2zeRnit4/lgjPB5ld9fF/4GSC6qIGNAUj35R4wG
         zqt8B3Dxla/Ajq3HTnfTHYmTIWP/Vg6gZX7HsivGxSR6B92Wl1y9eE9V+QaTb0pw6dpx
         jzLugIW9crtnqGbyIyCvEdQ3UPjrPLw6T+gsGt9TGXk8hl2p9lxI/z07h/1XdupXtGpP
         ftrI4sVedgfimryzx4+WWetKU0y6+f6Q5RaeBqoC5Txwcg8Ct5tJ22bU6g1OBXutnJer
         Ey/A==
X-Gm-Message-State: AGi0PubIZRFmnfMEG1NZvfYpJkvvob9B1NUCKv/nBY/tOBU1hTGHUT3n
	jNQmayoJnWOaP5QtgZ4XaMShNw==
X-Google-Smtp-Source: APiQypIdJXLBnq4NMQPBIQLB5q1RV0RFBdQKu2E9HNcYpu87iZYc7yf2tLKJEy1DrMBq6eSXvJXj8w==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr17933154wrt.7.1589192608543;
        Mon, 11 May 2020 03:23:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a8sm17322458wrg.85.2020.05.11.03.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 03:23:27 -0700 (PDT)
Message-ID: <ba4d2d890257106339088d2e2227af5785af5928.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2 1/2] gcc10: Update to GCC 10.1 Release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2020 11:23:26 +0100
In-Reply-To: <20200510195050.3470835-1-raj.khem@gmail.com>
References: <20200510195050.3470835-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-10 at 12:50 -0700, Khem Raj wrote:
> * Package new gomp header acc_prof.h
> * Package lto-dump which is a new tool in gcc10
> * All Changes are here [1]
> * Porting apps to gcc 10 help is here [2]
> 
> [1] https://gcc.gnu.org/gcc-10/changes.html
> [2] https://gcc.gnu.org/gcc-10/porting_to.html
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Correct SRC_URI checksums

Fails, in gcc, nativesdk-gcc and gcc-cross-canadian.

e.g.

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/1885

(but many more)

I think we may need something like:

https://patchwork.ozlabs.org/project/gcc/patch/20200508131105.170077-1-hjl.tools@gmail.com/

Cheers,

Richard



