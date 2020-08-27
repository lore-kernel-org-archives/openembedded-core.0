Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.16479.1598526969131600956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HTMfKbfy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id w13so4978286wrk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iTdONiMK/oTMS2uaZZ1GAFp+dpDwrWHc5UjMhMBmdOU=;
        b=HTMfKbfyosat3F0RfJHj+PVYZXHcz2CCSgfqPP7ZJE3v+hveKcRsfj1Ut+z91dyATs
         jQdbHq2e1gRCsKQDd28JvQMiHYGPwCFV4XbmDjnZIU04fn0Y163iR029G5KkrNFDomEY
         dfwGMqeITvGJs0h9rOm0yJg7VztqxDcBXFLks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iTdONiMK/oTMS2uaZZ1GAFp+dpDwrWHc5UjMhMBmdOU=;
        b=cN8XXQXe/sXP+egEMi8tVhMYuhCprQ5HdRf6iFbe7ZltcKk75GWqAgGCEE4r0mayrq
         EEGIPJo/K5coXuT7XSNdMkRU3T3jm/xXb6E12WWcE7+eLmkMEGiGXA8HiEfmuQyS3BNF
         pwzibbcXlPTohq/X8Mj/CAel9jmes2ziG84y5nnOrPpF6kJl9k+OnU+80kGx3EbM7CgE
         buwWqUVb2Bs+scD411mkoxZ/Zom6UkNAH64uA1kTylZ1Eb1tS6xgdq06xPx7ajXk2W01
         /FsPad5Hb6Nt4k1rg8F9pn9uxziQnLIKQjKAei+vwqlpgt8kiTbLCMvV2tLBjzMRuJ9H
         8TQQ==
X-Gm-Message-State: AOAM5311XyyVlwdlx4swlzdrcHGR3tlI6m32FeypnH4v+Ps4a4cbKpdL
	y8JzRa5gesEz0hYXl/kg/5ftvw==
X-Google-Smtp-Source: ABdhPJy5FWd8cfjNB1VS5z5xCW0n3iyt5I/IUN9jOgBUczr7QNPgAdSP2ncflpr4JJYH5nmnpVINfA==
X-Received: by 2002:adf:e94a:: with SMTP id m10mr21353063wrn.249.1598526967537;
        Thu, 27 Aug 2020 04:16:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id j7sm5705269wrw.35.2020.08.27.04.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 04:15:46 -0700 (PDT)
Message-ID: <29340a6552a827b76723211e1ecca06e291fd942.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH] util-linux: Set license for pylibmount sub package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Thu, 27 Aug 2020 12:15:44 +0100
In-Reply-To: <162EF00E1775189E.30808@lists.openembedded.org>
References: <20200826161345.1792249-1-adrian.freihofer@siemens.com>
	 <162EF00E1775189E.30808@lists.openembedded.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-26 at 22:54 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Wed, 2020-08-26 at 18:13 +0200, Adrian Freihofer wrote:
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> >  meta/recipes-core/util-linux/util-linux_2.36.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.bb
> > index 2fac9793a2..7476e60784 100644
> > --- a/meta/recipes-core/util-linux/util-linux_2.36.bb
> > +++ b/meta/recipes-core/util-linux/util-linux_2.36.bb
> > @@ -6,12 +6,13 @@ disk partitioning, kernel message management, filesystem creation, and system lo
> >  
> >  SECTION = "base"
> >  
> > -LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
> > +LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause & LGPLv3+"
> >  LICENSE_${PN}-libblkid = "LGPLv2.1+"
> >  LICENSE_${PN}-libfdisk = "LGPLv2.1+"
> >  LICENSE_${PN}-libmount = "LGPLv2.1+"
> >  LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
> >  LICENSE_${PN}-libuuid = "BSD-3-Clause"
> > +LICENSE_${PN}-pylibmount = "LGPLv3+"
> >  
> 
> I have a feeling this resulted in meta-gplv2 breakage:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/2371
> 
> which we need to figure out before this can merge.
> 
> I also wondered how come to not have this license listed in LICENSE in
> the first place :(

Its confirmed, it also caused selftest breakage:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1295
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1283
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1279
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1300

Cheers,

Richard

