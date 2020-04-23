Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.2755.1587631696960666623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 01:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dSeYM/V2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id d15so4234433wrx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 01:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=YkZP5khvlNpznE9wakIAPRN7Llr7Mkng3zvtEM/DC7g=;
        b=dSeYM/V2VLMPLt3AGzDtR7ZanT3yspgmgJ8hKEjlysdpD7U6oBa/rslJbHsEQUgUgb
         rNiMdvzAcyW8usfRMEvlBiZm8JQmxU7dsVf5jDQORE2vp20P5uMQDRmHmZdk1HX+C+GE
         kdJKqXKEQguO68TWzlQh0/O4Wj1nJX6g+WHHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YkZP5khvlNpznE9wakIAPRN7Llr7Mkng3zvtEM/DC7g=;
        b=FTCZbyDynYAlEU3fq5hjVe5KYKpPikTJfts2t2CW/+CIJKv3E+jdYZYjoRZgx6AWNj
         tVholHnWPCUvE8iBnvm875aCpTu2Z3zJiUazGfpycGC7CW6tjjsK3WCHH3lGymGPzBE0
         9HktRp4XIssVaQLnrXz8DOkylFc96D1kQbFOok5MD53KDzpmWoFmQmBW1uOotdz5bBjE
         cUWdEQSBGTDrlZMLnB/Ej17fNFZNSlAMaLia4jwvNNGcMo1fYwYiPBszXJuYPwTyxtjs
         kCJZQgkYlObYhsti+y88COQbabFDZBGfPdchAugGEofzALorv1astaG3qN8+ftxOwUUJ
         OvRA==
X-Gm-Message-State: AGi0PuYg2lkFGAc1AjZl3zIOUUeVpJybJbWkdnpjFh2J/TM6HToDXfGs
	y8EdkJlx5F2JRBK0pve0Lte4vw==
X-Google-Smtp-Source: APiQypJuQstP69+jGblwD2Re/s2FHzeiBN3ddqplh/CLQzggsjiNDSID1Mfuxa6pmhWRCOWJ4/xA+g==
X-Received: by 2002:a5d:4b43:: with SMTP id w3mr3733208wrs.208.1587631695467;
        Thu, 23 Apr 2020 01:48:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h17sm2582822wmm.6.2020.04.23.01.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 01:48:14 -0700 (PDT)
Message-ID: <71056775dca8e55bb2724b77c52dd4cfeb743c5f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] xkeyboard-config: upgrade 2.28 -> 2.29
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2020 09:48:13 +0100
In-Reply-To: <20200422200258.84579-3-wangmy@cn.fujitsu.com>
References: <20200422200258.84579-1-wangmy@cn.fujitsu.com>
	 <20200422200258.84579-3-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-04-22 at 13:02 -0700, Wang Mingyu wrote:
> From: Wang Mingyu <wangmy@cn.fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../{xkeyboard-config_2.28.bb => xkeyboard-config_2.29.bb}    | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.28.bb =>
> xkeyboard-config_2.29.bb} (87%)


https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/707

Cheers,

Richard

