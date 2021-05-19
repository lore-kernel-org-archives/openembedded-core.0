Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.10222.1621425025311427949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 04:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S7ZhZZka;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id q5so13703043wrs.4
        for <openembedded-core@lists.openembedded.org>; Wed, 19 May 2021 04:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=cermktXfvMKcRLboe4THu3YrWVS9YbpDWN3vgvwlI3o=;
        b=S7ZhZZkaDSLuC4E/eOaQP4fRSPt3beQYCPyZAEPLcZOuZq7qvfqzOUltLoD2MbdXNL
         S2hskrI8KuoMw0CPWgM5imstBiMxpdTeJRiUJ7s1NlmeTvFwmTieCqaEz8bdQXJKI1yl
         R3r+ZCuub0ImBKSf+JhQH5yBTOkkpfFNN+zDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cermktXfvMKcRLboe4THu3YrWVS9YbpDWN3vgvwlI3o=;
        b=p8qE64KiZzPPIgUMOmhC2vw+w+y1WKOOeOXqfnEpBOuaxLagSE0puMjOkOlf+ixE0Z
         C1jlUfV4MGq9+2u8i//Cbg/TKyG9fJp7EjQqC0X4w7uHWA4oojoOeSfvRYQwTLQGlLb3
         KqG2WzmV3R/ffLxnbICzFJflisqoD2x8yPAyvISds6dw7P1dzYnnXpQQb1cIGD/2shMe
         uix3drO2SWufo8LhYj8Lia1yiD7Tr2QtiP3EK3+JUOqWmrLHm2Z7aXnX5VxTWOWhPGqh
         a1W4Y1IXWlrRxsI2S0k4ZCDFB9m3sEU+HTqq2WqoKinJtHQS5LAEtnb5zdhbf10yiUcj
         6beA==
X-Gm-Message-State: AOAM531KWTi79LLMCublzvnJSRkzApr6DiNtJiIccsJCfpbvL0czPfAE
	2+A0I27sb324QzlEe7CrTUFWEA==
X-Google-Smtp-Source: ABdhPJy2XdBUl0FnXVVFpy6uaykiCB9Yz/769dt6Qy/bSYz64+TmRdcNZ6SEMZPtyuwjddjJYhcs9g==
X-Received: by 2002:adf:e6c2:: with SMTP id y2mr13909760wrm.384.1621425023805;
        Wed, 19 May 2021 04:50:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5a03:58fe:8897:9b3? ([2001:8b0:aba:5f3c:5a03:58fe:8897:9b3])
        by smtp.gmail.com with ESMTPSA id x2sm1515566wmc.21.2021.05.19.04.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 04:50:23 -0700 (PDT)
Message-ID: <374744ca7db4b7afb87aa5710e7e47c1be3f08b2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstatesig.py: make it fatal error when sstate manifest isn't found
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, Martin Jansa
	 <Martin.Jansa@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 19 May 2021 12:50:19 +0100
In-Reply-To: <AM9PR09MB4642AC4E6EAC764B936940BAA82B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20210519102302.2674317-1-Martin.Jansa@gmail.com>
	 <AM9PR09MB4642AC4E6EAC764B936940BAA82B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-05-19 at 12:47 +0200, Konrad Weihmann wrote:
> 
> On 19.05.21 12:23, Martin Jansa wrote:
> > * all known issues in this area were fixed, make it fatal that it
> >    cannot be overlooked if someone triggers this issue again
> > 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta/lib/oe/sstatesig.py | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> > index 6cd6e11acc..e86a09b332 100644
> > --- a/meta/lib/oe/sstatesig.py
> > +++ b/meta/lib/oe/sstatesig.py
> > @@ -453,7 +453,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
> >           manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, taskdata, taskname))
> >           if os.path.exists(manifest):
> >               return manifest, d2
> > -    bb.error("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
> > +    bb.fatal("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
> >       return None, d2
> 
> doesn't that make the return statement obsolete? also how can an error 
> be overlooked? It does make the task triggering this issue fail, so how 
> is a fatal better in this case (besides abnormally terminating the task)

This will fail the task rather than just setting the exit code so it should highlight there 
is a real problem to the user.

Cheers,

Richard

