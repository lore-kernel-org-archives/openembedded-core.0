Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B3FC48BD7
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:01:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.13764.1700056881114127963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l3lOuKnA;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-409299277bbso50848495e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 06:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700056879; x=1700661679; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L8Wqbo1UGGLcN5Dp/ZFZmUDsR3RMMTArnzX4Jh0D154=;
        b=l3lOuKnAGpaCtFldrTGPWiAAerzeEdSZJqRNragOBMLaZNGF4iRVzgVpAWYUnry0s0
         gKvWo2uJ+tBUaTPnTb2hIXwcugcR912LN535vL99BuGTlYdPP9TWZFpnADimRKXyvm+j
         6bt6DCewN+PJubghFFl4tbZiCx2ZcQnwl+GmXxVDWNtjXI4hn2kVW4sxKyhmeX8pTrJ0
         /Olt1jgOE/jN0VxltoYtovaoC4HW+wJtQJOX+LZiVDlx5tlO7veJk3I9/eeaL3uNvA2k
         odrevCykoZ3RZTsT27hu/g9gwryM0YrNe4BEzXAMKQ5yJYX9Mvw0rFSyVJnS+/fCqYJD
         Fk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700056879; x=1700661679;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L8Wqbo1UGGLcN5Dp/ZFZmUDsR3RMMTArnzX4Jh0D154=;
        b=dshpHKremsvq/h5woO4ySGoIRdj8FNmSeUM8CpJ8+Z/woUXVFz0c3Z4BrsOjKzXKuo
         eEPYO1si0HpBY4UJd9UHl/htD6+/FA7JWoYz6QiKZiZZgOfz6384x1cHCouJX20rpn91
         40uqRwtqMl0df58HjYrtA+k983M2OfA6llIATJAdDAcsNpNVNnXzuMaLwLGTe3SBREtE
         5nT8i9i+GTpbGRffOKDevszly4mDq+Q/UJYnnDIsoLQwNN3WR1jqmjotK9uryitsX2Oj
         I5b9AUtI+Nsxim4nrzw92NlzPyXZ8FyzCpLakP3mJmIQe4dzlWyaZQbpHkHBd0W60ue9
         wchQ==
X-Gm-Message-State: AOJu0Yz36wVUpq3X9LLmDMYuPUpM51RRpqPG/bmUWIo/e03PwreaD/xB
	3a14Kl0j7W39g4OlTKvjFdQ=
X-Google-Smtp-Source: AGHT+IFAOLCc07glhdCnVi2ne5rYrVbUCu5vHVIOvOQYX4861IjOR+wv2Nk3FfauXNgn+JV1RIRu/g==
X-Received: by 2002:a05:600c:4f03:b0:405:37bb:d942 with SMTP id l3-20020a05600c4f0300b0040537bbd942mr9943076wmq.4.1700056874552;
        Wed, 15 Nov 2023 06:01:14 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:5488:f785:9061:cf6c? ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id q3-20020a05600c46c300b00405442edc69sm21050142wmo.14.2023.11.15.06.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:01:13 -0800 (PST)
Message-ID: <f5cf8365d1447f9aa70bb478b66f079a404edf1c.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v8 6/8] devtool: new ide plugin
From: adrian.freihofer@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: enguerrand.de-ribaucourt@savoirfairelinux.com
Date: Wed, 15 Nov 2023 15:01:12 +0100
In-Reply-To: <0d980031e13375a78227a7143a1b2c32f14a5d18.camel@linuxfoundation.org>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-7-adrian.freihofer@siemens.com>
	 <0d980031e13375a78227a7143a1b2c32f14a5d18.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190599

Hi Richard

First of all, thank you for your review.

On Mon, 2023-11-06 at 14:24 +0000, Richard Purdie wrote:
> On Wed, 2023-11-01 at 12:01 +0100, Adrian Freihofer wrote:
> > The new devtool ide plugin configures an IDE to work with the eSDK.
> >=20
> > With this initial implementation VSCode is the default IDE.
> > The plugin works for recipes inheriting the cmake or the meson
> > bbclass.
> > Support for more programming languages and build tools may be added
> > in
> > the future.
> >=20
> > Using the plugin in recipe modes:
> > $ devtool modify a-recipe
> > $ devtool ide a-recipe a-image
> > $ code "$BUILDDIR/workspace/sources/a-recipe"
> > Work in VSCode, after installing the proposed plugins
> >=20
> > Using the plugin without a recipe
> > $ devtool ide none a-image
> > vscode where/the/sources/are
> > Use the cross tool-chain which is provided as a cmake-kit.
>=20
> Firstly, we should think carefully about the namespace. "ide" is in
> this patch and I've heard talk about "esdk" elsewhere.
>=20
> The plugin makes some assumptions since it is effectively behaving
> more
> like an SDK than a full build environment. I did wonder if "ide-sdk"
> might be the most appropriate?
>=20
> Somehow we need to ensure users to be aware this uses a single shared
> sysroot which is quite different to a specific single recipe
> environment.

Renamed the plugin to devtool ide-sdk.
>=20
> > The goal of this implementation is to create a configuration for
> > VSCode
> > (or other IDEs) that allows to work on the code of a recipe
> > completely
> > independent from bitbake. bitbake is only called if the
> > configuration or
> > the whole SDK has to be regenerated. But bitbake should not need to
> > be
> > called while working in the IDE. This has two major advantages over
> > calling devtool build from the IDE:
> > - The IDE provides plugins for integration with cmake, for example.
> > =C2=A0 These features are usable, which would not be the case if bitbak=
e
> > or
> > =C2=A0 devtool are called from within the IDE.
> > - It is much faster.
> >=20
> > Many thanks to Enguerrand de Ribaucourt for testing and bug fixing.
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> The main thing worrying me about this plugin/code is the code
> effectively copying and emulating bitbake:
>=20
I see 2 different use cases:
   1. A Yocto developer needs to quickly fix a few lines of code.
      That's where devtool modify, devtool build works perfectly fine.
   2. An application developer needs to develop and maintain a cross
      compiled application as a full time job for many years. That's
      where bitbake is not the right tool for me.

When working with the IDE as an application developer, the IDE should
control all the build steps for the recipe which is in the workspace.
My understanding is that a cross development workflow usually requires
the following steps:
- Setup the SDK (bitbake, devtool)
- configure (IDE)
- compile (IDE)
- run unit tests (on the host with Qemu) (IDE)
- remote debuggging on the target device which includes (IDE)
- do_install (IDE,pseudo)
- deploying the artifacts to the target device (IDE,pseudo)
- start gdbserver on the target device (IDE)
- start GDB on the host device (IDE)
- Update the SDK (bitbake, devtool)

This bullet list shows where I think bitbake should be used and where I
think the IDE should do the job without calling bitbake for the
application development workflow. It's somewhat about separating two
parts of the workflow:
- Application development with an IDE and a static SDK
- Updating the SDK with bitbake.

The main problem with calling bitbake from the IDE is that all the IDE
plugins for handling e.g. cmake, meson, Python, Rust and other build
tools will not work if bitbake is between the IDE and the build tool.
That's why at least the configure and the compile steps must be
controlled by the IDE without bitbake. And that is also the main reason
for a design like devtool ide-sdk has.

When it comes to the do_install and other remote debugging related
tasks, the IDE anyway does not more than calling shell commands. There
could be a script which calls bitbake -c install and devtool deploy-
target. It would be slower but still usable. And bitbake could probably
be optimized to handle this workflow quicker. I agree. I also changed
my implementation back to work like this.

But it is more complicated. When calling bitbake -c install it runs a
task queue for all the tasks (e.g. do_configure, do_compile..) of the
recipe. For example, there is no guarantee that only the do_install
task will be executed. Bitbake always tries to find out if a previous
task needs to be executed and automatically does so. Since bitbake has
no information about which step has already be executed by the IDE
there is a great chance that bitbake does more than necessary. It could
also happen, that bitbake ignores changes done by the developer in the
IDE and overules some manual steps. An example of this is that bitbake
re-compiles everything when a file listed in the CONFIGURE_FILES
variable is changed. This makes no sense in the IDE context but can be
important otherwise.

Since you asked, I reworked my code and went through all these details
again. But at some point my conclusion was again that the complexity of
resolving many build dependencies should not be part of an application
development workflow (no bitbake). The SDK should be static by itself
but easily updated on request (bitbake).=C2=A0The only reaming argument for
calling bitbake which I can see is that this could theoretically become
the one fits all solution some when. But this idea is old and hasn't
materialized yet, which reinforces my assumption that I want to try
something simpler by replicating some lines of code into independent
generated scripts. Maybe later on we could return back to improve
bitbake for this use case as well.

When I look at all this together, I come to the following conclusion:
 * devtool ide-sdk is not ready for merging into poky. There are still
   some open questions. But poky is not the right repository for
   experimental stuff. I'll move the plugin to a separate layer in its
   own git repository and hopefully come back to upstreaming later.
 * Covering the Yocto-centric workflow with devtool modify, devtool
   build and devtool deploy-target is useful for Yocto developers. This
   could be covered by the VSCode bitbake plugin independently of the
   devtool ide-sdk plugin. However, I think that the bitbake plugin
   should not attempt to implement the more complicated application
   development workflow that the devtool ide-sdk plugin attempts to
   address. At some point, an implementation that queries details via
   Tinfoil from Bitbake should be used. But a Tinfoil based
   implementation should be covered by oe-selftest. Otherwise it will
   probably fall apart pretty quickly.
 * To avoid conflicts between the devtool ide-sdk plugin and the VSCode
   plugin, I will remove the generation of devtool build tasks. This
   would allow to have the VSCode plugin generating these tasks without
   conflicts.

>=20
> You say devtool is too slow as it has to start a bitbake server. Are
> there ways we could get bitbake to behave in a fast enough way to
> make
> this work well enough for the IDE so we don't have to duplicate this?
>=20
What we would need is a bitbake option which does not deal with
dependencies. Something like bitbake --run-only-this-task install a-
recipe. But this would be a very strange option for a tool which was
invented to deal with complex dependency situations.

> There are a few things which can be done:
>=20
> a) memory resident bitbake means the start/stop of the server is no
> longer needed

It helps against re-parsing. But it comes with negative side effects: A
bitbake server in mem-res mode does not re-parse the recipes when they
are changed. Is this the expected behavior?

When an IDE starts a bitbake server in mem-res mode, changes to recipes
are ignored by all bitbake instances started in that build folder. This
is very confusing, especially for a user who did not intentionally
start the server in this mode.

>=20
> b) bitbake -b specifying a specific recipe is extremely fast as it
> bypasses any need to parse multiple recipes

The -b also skips the parsing of bbappends. But bbappends are very
important for the use case in general and in particular because the
externalsrc class is injected by a bbappend created by devtool modify.

>=20
> c) could a tinfoil client/daemon persist as a helper for the plugin
> in
> the background to avoid having to fork these bits of code?

Such a client would block the bitbake socket. But the idea is to have a
fast workflow in the IDE and support an SDK update workflow via
bitbake. I am not able to see a simple implementation based on this
idea.

>=20
> I suspect a lot comes down to intent with this code. If the intent is
> that this is "done" and once merged, will stay like this or even
> duplicate more bits as needed in future, I don't think I'm prepared
> to
> take it. If we document clearly that this approach is a WIP and
> ultimately we want to use something directly with bitbake, there are
> probably paths to merging it.
>=20
> I do want to have a clear understanding on what the ultimate goal and
> code would look like.

I will get back to you after I have gained more experience.
Unfortunately, I can't promise that this will be the big breakthrough
at the moment.

Best regards,
Adrian

>=20
> Cheers,
>=20
> Richard
>=20


