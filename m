Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D837C433EF
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 21:46:24 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.21676.1652651176702538057
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 14:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hw8BtSqp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 v191-20020a1cacc8000000b00397001398c0so1053278wme.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 14:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=kit/kg0TI8af5h6Snn9uedebxl8FHKNXw8cGuLXerHw=;
        b=hw8BtSqpO/vlzO6Ev7lU0fwXTdfA3SSKfn6BYikMPH+CYy+zRVdEiQHev+Gp97lFGs
         5dn7pnkl8YdU/ISLVDa1WKOQdsFzl10DBMm9fL9XYQ3OsiOnFt7ZmahCxqVLabFjFtKS
         GnLPBUL7Q9p3g5HHX3aieNinlmlH0YUIcoNyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=kit/kg0TI8af5h6Snn9uedebxl8FHKNXw8cGuLXerHw=;
        b=kEN/bSMBld4scCXD1pEoEU1I3f4UbZu2GxfR0lPQcdzKd7CDR/++6Wa/dXaGa1XhxS
         p9db1aHosiCWuj3Cer8RkCYJEE7gqOrKFNGsv31BVZa9HJ5UDnR6zOrDjTO7jxng/FkV
         zhv+zFY3/hXGE1QCO4CcPJtWtypDYk3mCbz9Tp4pB+3q5HIl05U99zROKNiSzualcYaS
         FlJ7A79XfpH0M4awvCoM+gxJmlrwgfG3r+HdVSZP0cYec3st8KKreBTc58Of3aBsK7o9
         lgp5OFSK+aX0xr5MNBy/ZzoG+lrB2ucGoXzolWcuuwdML0z4DA3NcXs5ucfaVAxRtOXz
         k33g==
X-Gm-Message-State: AOAM5326NMMIOSUbT7RQ14BFcyur1N4O70XYFrokXegr1vht/jVpVETE
	sku3lPfeZPkS2qTC5NH+e0bH+w==
X-Google-Smtp-Source: 
 ABdhPJys93gdX3Pm0yA7ZOCWYQ/z+JDfs1y42JH9rEQzqE0qTsaFpP/tYM8rlLmgW5/kTgB1EYi7Ag==
X-Received: by 2002:a7b:ce0a:0:b0:394:41e:2517 with SMTP id
 m10-20020a7bce0a000000b00394041e2517mr24867896wmc.135.1652651175320;
        Sun, 15 May 2022 14:46:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:907b:5576:ab63:2b17?
 ([2001:8b0:aba:5f3c:907b:5576:ab63:2b17])
        by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c500e00b00394708a3d7dsm11645136wmr.15.2022.05.15.14.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 14:46:14 -0700 (PDT)
Message-ID: 
 <d5f96822345d8ac0eaee74a5a4169a4882b397a9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone] [PATCH 1/1] mmc-utils: upgrade to latest
 revision
From: richard.purdie@linuxfoundation.org
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Alexander Kanavin
	 <alex@linutronix.de>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sun, 15 May 2022 22:46:13 +0100
In-Reply-To: <16EF654890391C3F.10172@lists.openembedded.org>
References: <20220515124346.8095-1-liu.ming50@gmail.com>
	 <20220515124346.8095-2-liu.ming50@gmail.com>
	 <16EF654890391C3F.10172@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 21:46:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165659

On Sun, 2022-05-15 at 22:42 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Sun, 2022-05-15 at 14:43 +0200, liu.ming50@gmail.com wrote:
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >=20
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit d98b06c9c6f480de1e5167bfe8392e39300fc02c)
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
>=20
> Why does kirkstone need this though?

Sorry, you cc'd me on the patch but not the cover letter which meant
this sorted badly in my mail folders but I noticed the cover letter
now.

You mention a compile failure in the cover letter, it would probably be
useful to give a little more info about the kind of compile failure
given we've not seen this anywhere else?

Cheers,

Richard

