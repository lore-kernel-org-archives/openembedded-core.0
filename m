Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FADDC54FB9
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:54:17 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.15154.1700060049387268958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hw+ZWn3X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40a4d04af5cso32206025e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 06:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700060048; x=1700664848; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TQBpyDy4ocN+J7J0Ke1U8c5FqALamR+tRXLePKJ83BM=;
        b=Hw+ZWn3XNUVbGSzhYkix/CICQe5EI1crAEmRS6FxiVN3uEmUSd2F2LY6KsAwVcDy13
         1LxXNeZM6LfM4a9oYiU65ZBKPk6ztBgeUfF1X3bdwwKqCR6/3sMd08saas1t6dTB6dMn
         0tWVApn0VJfxx+XW0zvNF0SePoaYnN/S2A8s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700060048; x=1700664848;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQBpyDy4ocN+J7J0Ke1U8c5FqALamR+tRXLePKJ83BM=;
        b=E1DpX9bfLuVcHmuU1BEIR2vuCpLgVy1SF2YCWPr9I8PIvhCMabm7YMM9HPtyMo7GPb
         3JYU9i++7D0ufbBSplCNRuHPqKu2POtuCSXkNOyVvZldawyfDRWig9Egqh1/qbEP0uXt
         flOxo/JyYytORFiErbx0CmNPK0ATBF372ESDZTNoxT4Z+YViNPsczHBeaHzWKDhchTwR
         UDeCCqXY434TI8tO9rrZUrJu7seZdi1ZemJgdFQHgE+G3SidJGEBzKivaxSf+MfzfYm2
         DS6NXZ3wuGvkQohQaNai0giI2ZGoYJXBVqG7GT9nea8gZRB8n1s0O/gRHOvg6SmnyKm0
         DaPg==
X-Gm-Message-State: AOJu0Yz5m4Xp9Eg8/ePGGQd5TdDPPRo13iLD6UD2NRl6DC7iJWNBIdzY
	zpynQ9rWLuqqmieT9f1etHPdaA==
X-Google-Smtp-Source: AGHT+IEbp7coxcaostlq6kwkfsPOLmdpeZ08z2GCuoVnbZL7aWIBJjeDpVQXxjtPCRrxs1j+kvv1og==
X-Received: by 2002:a05:600c:1c05:b0:40a:5080:724 with SMTP id j5-20020a05600c1c0500b0040a50800724mr8614137wms.20.1700060047638;
        Wed, 15 Nov 2023 06:54:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bbf9:c35a:2291:eb7c? ([2001:8b0:aba:5f3c:bbf9:c35a:2291:eb7c])
        by smtp.gmail.com with ESMTPSA id be14-20020a05600c1e8e00b00401b242e2e6sm21162937wmb.47.2023.11.15.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:54:07 -0800 (PST)
Message-ID: <aca00f120c957c3d576257548cedcd5c75080d0a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8 6/8] devtool: new ide plugin
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Cc: enguerrand.de-ribaucourt@savoirfairelinux.com
Date: Wed, 15 Nov 2023 14:54:06 +0000
In-Reply-To: <f5cf8365d1447f9aa70bb478b66f079a404edf1c.camel@gmail.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-7-adrian.freihofer@siemens.com>
	 <0d980031e13375a78227a7143a1b2c32f14a5d18.camel@linuxfoundation.org>
	 <f5cf8365d1447f9aa70bb478b66f079a404edf1c.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190731

On Wed, 2023-11-15 at 15:01 +0100, adrian.freihofer@gmail.com wrote:
> When it comes to the do_install and other remote debugging related
> tasks, the IDE anyway does not more than calling shell commands. There
> could be a script which calls bitbake -c install and devtool deploy-
> target. It would be slower but still usable. And bitbake could probably
> be optimized to handle this workflow quicker. I agree. I also changed
> my implementation back to work like this.
>=20
> But it is more complicated. When calling bitbake -c install it runs a
> task queue for all the tasks (e.g. do_configure, do_compile..) of the
> recipe. For example, there is no guarantee that only the do_install
> task will be executed. Bitbake always tries to find out if a previous
> task needs to be executed and automatically does so. Since bitbake has
> no information about which step has already be executed by the IDE
> there is a great chance that bitbake does more than necessary. It could
> also happen, that bitbake ignores changes done by the developer in the
> IDE and overules some manual steps. An example of this is that bitbake
> re-compiles everything when a file listed in the CONFIGURE_FILES
> variable is changed. This makes no sense in the IDE context but can be
> important otherwise.

FWIW I think it would be fine to add an API to tinfoil to execute a
task and only that task ignoring dependencies.

> Since you asked, I reworked my code and went through all these details
> again. But at some point my conclusion was again that the complexity of
> resolving many build dependencies should not be part of an application
> development workflow (no bitbake). The SDK should be static by itself
> but easily updated on request (bitbake).=C2=A0The only reaming argument f=
or
> calling bitbake which I can see is that this could theoretically become
> the one fits all solution some when. But this idea is old and hasn't
> materialized yet, which reinforces my assumption that I want to try
> something simpler by replicating some lines of code into independent
> generated scripts. Maybe later on we could return back to improve
> bitbake for this use case as well.
>=20
> When I look at all this together, I come to the following conclusion:
>  * devtool ide-sdk is not ready for merging into poky. There are still
>    some open questions. But poky is not the right repository for
>    experimental stuff. I'll move the plugin to a separate layer in its
>    own git repository and hopefully come back to upstreaming later.
>  * Covering the Yocto-centric workflow with devtool modify, devtool
>    build and devtool deploy-target is useful for Yocto developers. This
>    could be covered by the VSCode bitbake plugin independently of the
>    devtool ide-sdk plugin. However, I think that the bitbake plugin
>    should not attempt to implement the more complicated application
>    development workflow that the devtool ide-sdk plugin attempts to
>    address. At some point, an implementation that queries details via
>    Tinfoil from Bitbake should be used. But a Tinfoil based
>    implementation should be covered by oe-selftest. Otherwise it will
>    probably fall apart pretty quickly.
>  * To avoid conflicts between the devtool ide-sdk plugin and the VSCode
>    plugin, I will remove the generation of devtool build tasks. This
>    would allow to have the VSCode plugin generating these tasks without
>    conflicts.
>=20
> >=20
> > You say devtool is too slow as it has to start a bitbake server. Are
> > there ways we could get bitbake to behave in a fast enough way to
> > make
> > this work well enough for the IDE so we don't have to duplicate this?
> >=20
> What we would need is a bitbake option which does not deal with
> dependencies. Something like bitbake --run-only-this-task install a-
> recipe. But this would be a very strange option for a tool which was
> invented to deal with complex dependency situations.

We could however implement it via tinfoil, which should also work for
this scenario?

> > There are a few things which can be done:
> >=20
> > a) memory resident bitbake means the start/stop of the server is no
> > longer needed
>=20
> It helps against re-parsing. But it comes with negative side effects: A
> bitbake server in mem-res mode does not re-parse the recipes when they
> are changed. Is this the expected behavior?

Until recently we used to monitor the filesystem with inotify however
there are no ordering guarantees with it so we can't order the
modifications data stream with our own parsing one. We recently ended
up removing it. The IDE can ask bitbake to validate it's caches and if
bitbake is in memory, that is a fast operation.

> When an IDE starts a bitbake server in mem-res mode, changes to recipes
> are ignored by all bitbake instances started in that build folder. This
> is very confusing, especially for a user who did not intentionally
> start the server in this mode.

Can the IDE provide some hints about when bitbake needs to do
something?

> > b) bitbake -b specifying a specific recipe is extremely fast as it
> > bypasses any need to parse multiple recipes
>=20
> The -b also skips the parsing of bbappends. But bbappends are very
> important for the use case in general and in particular because the
> externalsrc class is injected by a bbappend created by devtool modify.

That is a valid concern, we should probably open a bug and think about
that. -b existed long before bbappends did!

> > c) could a tinfoil client/daemon persist as a helper for the plugin
> > in
> > the background to avoid having to fork these bits of code?
>=20
> Such a client would block the bitbake socket. But the idea is to have a
> fast workflow in the IDE and support an SDK update workflow via
> bitbake. I am not able to see a simple implementation based on this
> idea.

I think it would depend on how the client was written. It could close
it's connection let leave the server memory resident?
Cheers,

Richard

