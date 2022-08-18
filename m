Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BBAC00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 09:27:50 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.39750.1660814868146566575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 02:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KL2CuHLL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id z16so1014540wrh.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 02:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=WF1rQX8Iu5nLcO6x8zfCldB+K1cewnG1oVX1Es2YS/k=;
        b=KL2CuHLLxnq/dFvKLYx3K4qrdClJjHvgRqxtA14zTE5KZ6jQm56tfz+joLFr6ZXNxY
         Iu+2qrmHsFqvmJ4kK1WIXghoG0sRxG+neBe5BzIc7bR9aXa9tkRI6nCSkeF9wGeke/Mn
         P8Vah1nTY00hN0yZc5vzu5XeGXm+AFLuwVXuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=WF1rQX8Iu5nLcO6x8zfCldB+K1cewnG1oVX1Es2YS/k=;
        b=rSQ+T8VDZYaPoxKhLA7fMKl90ivN1lc1dTJ/QWq8lh411oyNA8agPwn+Z0//WbNJn4
         LGIyzRbDkBGzOiGdCPCBfR/x4RbkkI9ObK83uQzWOgWWwui1K6aUSMGGwNLSTzs6woBI
         nBXe3a45RRIChVtuuEDFRlhxYZwB/++sjFFYg9i4Nr6F/USTiuGcJGXBNvsp1PIDGNl6
         7m0N4fVot635zR4u1Nvjm1nrW4HzUuwda4OWbTOA5aNIy0DWkoSvUV+GOIIYNt482WIp
         qhiP+b4rnoIGpVvaDx+JWEygcYTC36wi4THY+XD7n+7Hm39JRWRkxne1rfNBOcg0OtSe
         FuqA==
X-Gm-Message-State: ACgBeo3Mn4F5uDEdGZ6S0aLirfT6/6uO1J2mKZ5bE23y+K27XJGumCgj
	PI4glFzi4vWoq9oZg+nsxNYV0A==
X-Google-Smtp-Source: 
 AA6agR71d/VYfGbvug0A23fc6cbsHzIlCEfpQSbQnrn7M0alvzNdugBUM3FiZ9bW2TsDmuTU0VEtAg==
X-Received: by 2002:adf:fbc7:0:b0:220:6004:18ca with SMTP id
 d7-20020adffbc7000000b00220600418camr1082293wrs.632.1660814866482;
        Thu, 18 Aug 2022 02:27:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bfd7:4d1c:d13d:975?
 ([2001:8b0:aba:5f3c:bfd7:4d1c:d13d:975])
        by smtp.gmail.com with ESMTPSA id
 y6-20020a056000108600b002250f9abdefsm1079120wrw.117.2022.08.18.02.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 02:27:45 -0700 (PDT)
Message-ID: 
 <65b62446fc6c2c3d873ca6113f590be95ee27bf8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/5] meta/files: add layer setup JSON schema
 and example
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Joshua Watt
	 <JPEWhacker@gmail.com>, Alexander Kanavin <alex@linutronix.de>
Date: Thu, 18 Aug 2022 10:27:45 +0100
In-Reply-To: 
 <CANNYZj8vXyK0erJ9AGBSiUsuskKXCUY6PPGiZshOf-0Gcak-fA@mail.gmail.com>
References: <20220817131023.4093773-1-alex@linutronix.de>
	 <20220817131023.4093773-2-alex@linutronix.de>
	 <bff578854db1852bc0891463e6eecd3c892876bd.camel@linuxfoundation.org>
	 <CANNYZj-1c9cd1Q9LodoxrMxkhBTbOTdg3gb=TVyVdWJ6inMO4w@mail.gmail.com>
	 <d3d5ec04d1b0caec5f0e8f7578e40b3f055e10d9.camel@linuxfoundation.org>
	 <CANNYZj8vXyK0erJ9AGBSiUsuskKXCUY6PPGiZshOf-0Gcak-fA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 09:27:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169518

On Thu, 2022-08-18 at 10:24 +0200, Alexander Kanavin wrote:
> On Thu, 18 Aug 2022 at 00:27, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > It does, thanks. I'm just not sure we're quite in the right place with
> > things. I know in your other reply you say we have to start somewhere
> > and we can change things. I also know the screaming if we try and
> > remove something later...
>=20
> Right, I'm going to make the following changes:
> - machine/distro/config-template stuff gets dropped from the schema
> and tools - I am convinced now that it can be discovered through other
> means :-)
> - config template location gets standardized (perhaps in
> conf/templates/), default template in oe-core moves to
> conf/templates/default/
> - add a plugin abstraction for the layer setup writers, move the json
> writer to a plugin
>=20
> Anything else?

I think that is a good plan and lets us move forward. If it turns out
we need to extend the json, we can. Incrementally extending if/as
needed is the safer path forward.

That would just leave the details of the template layout. I think what
you have above is probably fine. I'm just wondering how it fits with
something else I've been worrying about, e.g. how to add config
fragments to be used on the autobuilder.

The intent is the user could add something like:

require conf/yocto-autobuilder/x32.inc

or

require conf/yocto-autobuilder/multilib-mipsn32.inc

and similar to their local.conf and more easily replicate
configurations.

With those, I could add to OE-Core or meta-yocto. I'm leaning towards
core, just so people can see the testing configs more easily but I know
people don't like yocto mentions in core and whether or not it is too
higher a level in conf, not sure.

Anyway, I think it is tangential to what you're working on which is
good and stops me worrying. I left this in here just to write it out
somewhere.

I would like to see if we can switch the eSDK to use the json format
btw. I suspect that may be one of your next steps? :)

Cheers,

Richard



