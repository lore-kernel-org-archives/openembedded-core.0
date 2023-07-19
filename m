Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B12EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 14:59:27 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.16038.1689778764733841845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 07:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Z++AuB79;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3142a9ff6d8so6938263f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689778763; x=1690383563;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIUP/5Wj4e+D7BjGzP8fY2RPvyxIJjogCb2uK+evzEw=;
        b=Z++AuB79d3Q8/a6oFVsjIpbrmwXwH8+72V40GFaEmPnTNT+Z4gySe3aVJ7A69QthNP
         AJ7ISv3edsS98kyS0oYNYWMueSF00rE2l6tJPDfoGp4twau1/LJVbqKAwCPiqW9aeZXH
         1yBe/hQc57U0ffrUUbJorDrkYQlAZEWG50lX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689778763; x=1690383563;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gIUP/5Wj4e+D7BjGzP8fY2RPvyxIJjogCb2uK+evzEw=;
        b=jfIlNHklWluYz/q+8tlMf3GIXUdwsoMirT7V7joX3Cp9Hp1STnbQtVCw+Fv92Ort+F
         0iZRnmZzlha55GQfisl4P7Q+q0X0psVXcoSkcEOl6CeaqDk/gefG9IydwinLlSKxbf2e
         EO/5B2+yqA4UyXGABWPnY4GPIRYwhox8XFS6u+D1TdXIPeIaKLWnmQsHl8eeP+157tW7
         bMRujYDZ/sH6boStZ6OIgJR43pLmRNQ0CftdfSIQFGn2xJM22a13CDLsTUQHIgBQiXIt
         189POjSlmbgzD3dqANodeEJwYf3nPgCf9G29nct8HaY2dRgBWgpEtaETi6fEa1zrVwB9
         S8DA==
X-Gm-Message-State: ABy/qLavPamXvkx5vrIaOkbUV5MP92WxoFIEfK6SPhtcvQBZz+6JXP8e
	/hIknZ1TYIWT6+i7yQ4jNh33cg==
X-Google-Smtp-Source: APBJJlGlPAkMXfUVft+2MIi3aq+RvuBlhMdysVQc63bbRR0VBF81TsdaPG2aMoVPAzj7/nVMoMh/Dg==
X-Received: by 2002:adf:f9ca:0:b0:314:1fdc:796d with SMTP id w10-20020adff9ca000000b003141fdc796dmr67704wrr.70.1689778762999;
        Wed, 19 Jul 2023 07:59:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6248:d29c:dec5:5723? ([2001:8b0:aba:5f3c:6248:d29c:dec5:5723])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c00c600b003fbb5142c4bsm1912872wmm.18.2023.07.19.07.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:59:22 -0700 (PDT)
Message-ID: <876539c8d1df0587046f1e75b6fff36235d50640.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC 0/1] Add bblock helper script
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julien Stephan <jstephan@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2023 15:59:21 +0100
In-Reply-To: <20230719142758.84540-1-jstephan@baylibre.com>
References: <20230719142758.84540-1-jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 14:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184586

Hi,

Thanks for looking at this, I think it could become a really useful and
well used extension to bitbake!

On Wed, 2023-07-19 at 16:27 +0200, Julien Stephan wrote:
> I am currently working on bug #13425 and I would like to post my wip
> script as an RFC to get feedback on it, before going further in the
> development.
>=20
> The script `script/bblock` can be used with the following command:
>=20
> bblock [list of recipes to lock]
>=20
> Here is a summary of what is currently implemented:
> * can lock several recipes at once
> * on first execution bblock will append `require bblock.inc` in
>   `build/conf/auto.conf` (creates `auto.conf` if it doesn't exist)
> * on first execution creates the file `build/conf/bblock.inc` with a
>   dedicated header and:
> 	 - adds SIGGEN_LOCKEDSIGS_TYPES +=3D "t-bblock"
> 	 - adds SIGGEN_LOCKEDSIGS_TASKSIG_CHECK =3D "warn" to display warning bu=
t
> 	   do not stop the build
> * loops over all recipes to lock and adds entry with latest "do_compile"
>   signature in `conf/bblock.inc`, such as: SIGGEN_LOCKEDSIGS_t-bblock +=
=3D "bc:do_compile:e233cd793137a92dd575a417a2877e324ce526c4dc4a7db652abb951=
2f406f1f"
>=20
> Limitations:
> * only gets do_compile signature for now as a POC
> * `bblock reset [list of recipes]` not yet implemented
> * no check if a recipe is already locked
>=20
> Steps to test the script:
> bitbake bc --> generate a signature for bc's tasks
> bblock bc
> # modify do_compile in bc recipe to force signature change
> bitbake bc --> throws the following warning: `WARNING: The bc:do_compile =
sig is computed to be 680bd6c291bf88e379e0c405a773cf5f81851e1a52570398cefd0=
196000ac1ef, but the sig is locked to e233cd793137a92dd575a417a2877e324ce52=
6c4dc4a7db652abb9512f406f1f in SIGGEN_LOCKEDSIGS_t-bblock`

Ideally we should just be able to run bblock bc without any previous
commands and it would lock the file.

We may want to note that some recipes are locked somehow too so the
user realises this if they leave a build and come back to it later,
forgetting what they did (a bit like the -f option leaves a warning on
later builds to remind the user).

To simplify things, I think it would be reasonable to add a bblock.inc
file unconditionally in our core configuration so that it is always
included if present, just to make the tool easier since I think this
will be a common use.

Also, you're going to need to think about package architectures.
Imagine I change MACHINE and then try "bitbake bc", it probably
shouldn't be locked any more, it certainly shouldn't try and match the
previous locked values as in most cases they will be different.

This is why if you do a "bitbake core-image-minimal -S none" and look
at the loacked-sigs.inc file, you'll see sections like:

SIGGEN_LOCKEDSIGS_t-allarch=20
SIGGEN_LOCKEDSIGS_t-x86-64=C2=A0
SIGGEN_LOCKEDSIGS_t-x86-64-v3
SIGGEN_LOCKEDSIGS_t-qemux86-64

and a list of types:

SIGGEN_LOCKEDSIGS_TYPES:qemux86-64 =3D "t-all t-allarch t-qemux86-64 t-x86-=
64 t-x86-64-v3"

This means the locks only apply to specific package architectures,
which allows you to change MACHINE.
>=20
> I also have a point I would like to discuss: I only get signature for
> do_compile for the POC but wondering what should I do here:
> * have a set of predefined task to lock, in that case how to choose the
>   tasks?

I think by default bblock would lock all tasks for a recipe? It might
take a task option to allow a specific task to be specified?

> * compute the list of all available tasks for a given recipe and get
>   signature for all? Is there a way to get such list without using
>   `infoil.build_targets(pn, "listtasks", handle_events=3DTrue)` as this
>   will start bitbake, takes some time and requires some processing of
>   the output

We may need to add some API to bitbake to get this information. The
task hashes do need a full task graph to compute so it isn't a simple
operation with a cold cache.

> * add an option for the user to specify the task he wants to lock? (this
>   may be useful to add anyway)

Yes, I think that would make sense.

> My branch is available here [1]
>=20
> Am I going into the right direction?

I think you've made a good start, yes!

Cheers,

Richard


