Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34357ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 20:52:37 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.2426.1663188747135314898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 13:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZV6gZjwG;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id dv25so37495724ejb.12;
        Wed, 14 Sep 2022 13:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=u+Wu+BuYq63yJcnT0Yqr4nNG0c5gexhDuhHmbWVDsfI=;
        b=ZV6gZjwGsav+gNXlhZFvCBOEXJnMsv58+Mqn/0EUg8SfdR/6fCcbiKUS318vB4FxHX
         HEOvEGEg0VpROcZyz4FlLH45g780PBg+PB3aekxLmWA2O0PLAupowSfbvFHL3aH/SH3I
         zyKq2BsnyY4qYxzFNanEAAjgAYrRbbB6z1+4KbjI5tmNc56H3TXPUokPZma7WiJSZ3GF
         zaowdF5tgegEbcj8GScXCKi/tK1yIe7wxxV3n/UebcEAu69cGQPfWisbp/4yExShHv7o
         CcrtGxc+hrvy8pHMnPLrvZ7kF5erPdGDp+BgdSLiNXirx6IEqoiOaseCBgRGdgo9VZ/R
         sVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=u+Wu+BuYq63yJcnT0Yqr4nNG0c5gexhDuhHmbWVDsfI=;
        b=Fqd07mOyRoRw+ylYpRw8oVH+uwBaxxdJxNe15T4suAfSbaJ98MnltgeokSH1GhosQF
         h4HGDEFMTmj5VZVvZyHW3KelzFu2H4FoGD1QV378yULR45mJeSu3Vu9UZ0hnEYtQz66p
         sYgUbhfEHSt3mD+/CqTrPpoXbtVe9XykNQDixi/OXt8KNZvtOAt8i5fX9m4FP3B2W3wf
         tuaQE4SGjYCWpm9ODEDm+Ur9jvz3TVEiEF1F3lwCgEAP71mOVH4/aIApSCKbqfH3qVJj
         6jLcHjHATDbIz9Q4s5jjbWNQUUypTiFlMvvXjglORfTL9XBrZFwQDPRGEzs7y7IGAdpE
         vp7Q==
X-Gm-Message-State: ACgBeo2SHGG/7aOcH2acuf27LIzvBqd+P3nbb9/Ua+GL54QjFJTybeye
	Ur2YgQNHzXMrhmIkgzj8RzRPlxQrF77cyH8yGBc=
X-Google-Smtp-Source: 
 AA6agR7zisD1nRBC44vAA6ijYgQvQ4ZJcWHgAkLr1SCOEHIZEVaf8NmHI2P0W+0vhE5mDs196/ewvgAEXgeLvT/X02A=
X-Received: by 2002:a17:907:3f26:b0:77c:2508:3c08 with SMTP id
 hq38-20020a1709073f2600b0077c25083c08mr13838081ejc.532.1663188745387; Wed, 14
 Sep 2022 13:52:25 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAApg2=Q0+GqNVfyhnnadaEhXUB67_vbf5=ukKHdD8xRHqSOptg@mail.gmail.com>
 <CAJdd5GaVFL-GyPrCHKTGn1rBU1-khVN0TnbeYv_Yr0QHUDLwig@mail.gmail.com>
 <b8e93d46f949e84561b74c7ef8506975@pianon.eu>
In-Reply-To: <b8e93d46f949e84561b74c7ef8506975@pianon.eu>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 14 Sep 2022 15:52:14 -0500
Message-ID: 
 <CAJdd5GaVQpkdOdsngM+mbgfPRPycJ7=twz3j7JWRN2sC6ZeS-g@mail.gmail.com>
Subject: Re: [OE-core] Adding more information to the SBOM
To: Alberto Pianon <alberto@pianon.eu>
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 20:52:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170674

On Wed, Sep 14, 2022 at 12:10 PM Alberto Pianon <alberto@pianon.eu> wrote:
>
> Hi Joshua,
>
> nice to meet you!
>
> I'm new to this list, and I've always approached Yocto just from the
> "IP compliance side", so I may miss important pieces of information.
> That
> is why Marta encouraged me and is helping me to ask community feedback.
>
> Il 2022-09-14 16:56 Joshua Watt ha scritto:
> > On Wed, Sep 14, 2022 at 9:16 AM Marta Rybczynska <rybczynska@gmail.com>
> > wrote:
> >>
> >> Dear all,
> >> (cross-posting to oe-core and *-architecture)
> >> In the last months, we have worked in Oniro on using the create-spdx
> >> class for both IP compliance and security.
> >>
> >> During this work, Alberto Pianon has found that some information is
> >> missing from the SBOM and it does not contain enough for Software
> >> Composition Analysis. The main missing point is the relation between
> >> the actual upstream sources and the final binaries (create-spdx uses
> >> composite sources).
> >
> > I believe we map the binaries to the source code from the -dbg
> > packages; is the premise that this is insufficient? Can you elaborate
> > more on why that is, I don't quite understand. The debug sources are
> > (basically) what we actually compiled (e.g. post-do_patch) to produce
> > the binary, and you can in turn follow these back to the upstream
> > sources with the downloadLocation property.
>
> This was also my assumption at the beginning. But then I found that
> there
> are recipes with multiple upstream sources, which may be combined/mixed
> together in recipes' WORKDIR. For instance this one:
>
> https://git.yoctoproject.org/meta-virtualization/tree/recipes-networking/cni/cni_git.bb
>
> SRC_URI = "\
>         git://github.com/containernetworking/cni.git;branch=main;name=cni;protocol=https
> \
>
> git://github.com/containernetworking/plugins.git;branch=release-1.1;destsuffix=${S}/src/github.com/containernetworking/plugins;name=plugins;protocol=https
> \
>
> git://github.com/flannel-io/cni-plugin;branch=main;name=flannel_plugin;protocol=https;destsuffix=${S}/src/github.com/containernetworking/plugins/plugins/meta/flannel
> \
>         "
>
> (The third source is unpacked in a subdir of the second one)
>
>  From here I discovered that we can't assume that the first non-local URI
> is the downloadLocation for all source files, because it is not always
> the case.

This is true, but I think that's more of a problem with the inability
to express multiple download locations in the SPDX, not that we don't
have all the source when we generate the SPDX, correct? I _beleive_
the -dbg package still contains all the source code from all three
URLs?

>
> Moreover, in the context of our project we also needed to find the
> upstream
> sources also for local patches, scripts, etc. added by recipes (i.e. the
> corresponding layers' repos).

Ok, so this makes me wonder: If we implement the better source
extraction in OE core, does that help this problem? Is the primary
problem that you want the unpatched upstream source code files instead
of the patched ones, or is it some other problem?

AFAIK, the -dbg package contains the source code we actually
compiled..... so I have a hard time understanding what's "incorrect"
(or not ideal) about referencing it; but I think I'm missing something
important :)

>
> >
> >>
> >> Alberto has worked on how to obtain the missing data and now has a
> >> POC. This POC provides full source-to-binary tracking of Yocto builds
> >> through a couple of scripts (intended to be transformed into a new
> >> bbclass at a later stage). The goal is to add the missing pieces of
> >> information in order to get a "real" SBOM from Yocto, which should, at
> >> a minimum:
> >
> > Please be a little careful with the wording; SBoMs have a lot of uses,
> > and many of them we can satisfy with what we currently generate; it
> > may not do the exact use case you are looking for, but that doesn't
> > mean it's not a "real" SBoM :)
>
> You are right, sorry! "real" is meant in the context of our project,
> where we need to make our Fossology Audit Team work on "original"
> upstream source packages/repos, for a number of reasons (the main being
> that in Oniro project we have a complex build matrix with a lot of
> available target machines and quite a number of different overrides
> depending on the machine, so when it comes to IP compliance we need to
> aggregate and simplify, otherwise our IP auditors would die :) )
>
> But since our Audit Team, differently from a commercial project,
> is working fully in the open, also other projects may benefit
> from this approach: having fully reviewed file-level license
> data publicly available for quite a number of upstream sources and
> Yocto layers, a complete source-to-binary tracking system would
> enable any Yocto projects to get very detailed license information
> for their images, to automatically detect license incompatibilities
> between linked binary files, etc.

Ok, so let me see if I can follow what you want here:
 1) Your Audit Team scans some open source repository, and generates
some sort of license report for it
 2) You do a Yocto build that builds that repository
 3) You want to link the SBoM generated by Yocto back to the report
from the Audit Team; specifically, you want be able to trace binaries
in the system back to the original source code from Audit Team report?

Currently #3 is difficult because
 1) Yocto only reports one SRC_URI in the SBoM
 2) Binary are tracked back to the as the patched source code (in the
-dbg packages), so the checksums may not match the original upstream
source code
Any other reasons?

>
> >
> >>
> >> - carefully describe what is found in a final image (i.e. binary files
> >> and their dependencies), since that is what is actually distributed
> >> and goes into the final product;
> >> - describe how such binary files have been generated and where they
> >> come from (i.e. upstream sources, including patches and other stuff
> >> added from meta-layers); provenance is important for a number of
> >> reasons related to IP Compliance and security.
> >>
> >> The aim is to become able to:
> >>
> >> - map binaries to their corresponding upstream source packages (and
> >> not to the "internal" source packages created by recipes by combining
> >> multiple upstream sources and patches)
> >> - map binaries to the source files that have been actually used to
> >> build them - which usually are a small subset of the whole source
> >> package
> >>
> >> With respect to IP compliance, this would allow to, among other
> >> things:
> >>
> >> - get the real license text for each binary file, by getting the
> >> license of the specific source files it has been generated from
> >> (provided by Fossology, for instance), - and not the main license
> >> stated in the corresponding recipe (which may be as confusing as
> >> GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause & BSD-4-Clause, or
> >> even worse)
> >
> > IIUC this is the difference between the "Declared" license and the
> > "Concluded" license. You can report both, and I think
> > create-spdx.bbclass can currently do this with its rudimentary source
> > license scanning. You really do want both and it's a great way to make
> > sure that the "Declared" license (that is the license in the recipe)
> > reflects the reality of the source code.
> >
>
> The issue is with components like util-linux, which contains a lot of
> sub-components subject to different licenses; util-linux recipe's
> license is "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause &
> BSD-4-Clause", but from such information one cannot tell if a particular
> binary file generated from util-linux is subject to GPL, LGPL, or
> BSD-3|4-clause.
>
> Of course, being able to track upstream sources to binaries at file
> level would be useless if one doesn't have file-level license
> information;
> but since Scancode and Fossology (and our Audit Team) may provide such
> information, such tracking may become super-useful, in our opinion.

We also implement (and report) some rudimentary license scanning in
Yocto, but we only look for "SPDX-License-Identifier" tags



>
>
> >> - automatically check license incompatibilities at the binary file
> >> level.
> >>
> >> Other possible interesting things could be done also on the security
> >> side.
> >>
> >> This work intends to add a way to provide additional data that can be
> >> used by create-spdx, not to replace create-spdx in any way.
> >>
> >> The sources with a long README are available at
> >> https://gitlab.eclipse.org/eclipse/oniro-compliancetoolchain/toolchain/tinfoilhat/-/tree/srctracker/srctracker
> >>
> >> What do you think of this work? Would it be of interest to integrate
> >> into YP at some point? Shall we discuss this?
> >
> > This seems promising as something that could potentially move into
> > core. I have a few points:
> >  - The extraction of the sources to a dedicated directory is something
> > that Richard has been toying around with for quite a while, and I
> > think it would greatly simplify that part of your process. I would
> > very much encourage you to look at the work he's done, and work on
> > that to get it pushed across the finish line as it's a really good
> > improvement that would benefit not just your source scanning.
>
> Thanks for the suggestion, could you point me to Richard's work?
> I'll surely look into it.
>
> >  - I would encourage you to not wait to turn this into a bbclass
> > and/or library functions. You should be able to do this in a new
> > layer, and that would make it much clearer as to what the path to
> > being included in OE-core would look like. It also would (IMHO) be
> > nicer to the users :)
>
> Understood :)
>
> I'm the newbie here, so any other suggestion is warmly welcome.
>
> Regards,
>
> Alberto

