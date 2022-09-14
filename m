Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96786C6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 14:56:49 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.378.1663167404592260242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 07:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QOIhAyxc;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id u9so35417230ejy.5;
        Wed, 14 Sep 2022 07:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QWQo92DcsGjzsSroZ67B18tpuHZdxi3HygPRoLx8OQ8=;
        b=QOIhAyxcShVU+EEd/IY3dhVv7OUYGFhIe57R5ir0btQqPjb9vqwPt6BW7e8NgCpKYW
         a2W9jqTHkcmk1X/utu2CblzDlIRjLSeiAfl4wy/vIIR0p4khIyjooKfCel55VDgqYQim
         jzr4gMOWiWAua5Gfstd4qNOi9KiwBmqkW+XivegpnL8B1vrxUOEvIXrpEIeZ+W1UVrzC
         BlHmDxA/6dzGTRICIdOg2Q3rwopxcxPg6UJWUMGlXeDwb7CcyGTR+SmDM/WYIej5ug7F
         JsgW8D+TewUwGhnG81hTwflX6T3t+HCu4kt8Cp2gxruXgwNPvy09sdmwjZEJsvQaRgqB
         JZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QWQo92DcsGjzsSroZ67B18tpuHZdxi3HygPRoLx8OQ8=;
        b=64+hoPyIZGr/uE+bjpudfysqorhkQAP2YgGvZtwq9QCm5bg/4UFHB4GelS2Z4thDt8
         RdyWrWRlGcZkTvooikenk9phS4wXZEfUU1Iruz+V3eHjVwfuXxaY5RcIHsH1I1+tpeqp
         gLG4BSTTmFuyGUlJgG5bGxrPXqteRdQzvUdyYtRFYKDMGVkUIOaqHLyqOamWmE0CsuTd
         c+khqjiC05QF6HFv3h1KgT+zhD0WGYvhBBih8dTmpFcgkphxyTxBAaWSTJISPmSc3256
         V/yxR+yzzuZlLH7zsX01MT58reduwY+8h/D0DzRYdOAlnKaw2SzqHX+JWA6X9SWIG6DW
         yuWw==
X-Gm-Message-State: ACgBeo2Vf4FQghPqUNcqJ3QTq/PAHyJ1dBzhDQ9tHEISslIwUCjLZmDG
	ZtWL7gepJOsCVZdwhyf3Fkf+v7hO6NHf0iOJBl0=
X-Google-Smtp-Source: 
 AA6agR7HmkCHiKJwsr0RI4HWS/PaMN0BfwuudD2l1eIYOEBLhzGaL3wf0WtxM88jZjIIWe8SHbe05dniLDy9K2C7MVs=
X-Received: by 2002:a17:907:a48:b0:77c:51b0:5aeb with SMTP id
 be8-20020a1709070a4800b0077c51b05aebmr13122009ejc.61.1663167402905; Wed, 14
 Sep 2022 07:56:42 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAApg2=Q0+GqNVfyhnnadaEhXUB67_vbf5=ukKHdD8xRHqSOptg@mail.gmail.com>
In-Reply-To: 
 <CAApg2=Q0+GqNVfyhnnadaEhXUB67_vbf5=ukKHdD8xRHqSOptg@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 14 Sep 2022 09:56:31 -0500
Message-ID: 
 <CAJdd5GaVFL-GyPrCHKTGn1rBU1-khVN0TnbeYv_Yr0QHUDLwig@mail.gmail.com>
Subject: Re: Adding more information to the SBOM
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 14:56:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170660

On Wed, Sep 14, 2022 at 9:16 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> Dear all,
> (cross-posting to oe-core and *-architecture)
> In the last months, we have worked in Oniro on using the create-spdx
> class for both IP compliance and security.
>
> During this work, Alberto Pianon has found that some information is
> missing from the SBOM and it does not contain enough for Software
> Composition Analysis. The main missing point is the relation between
> the actual upstream sources and the final binaries (create-spdx uses
> composite sources).

I believe we map the binaries to the source code from the -dbg
packages; is the premise that this is insufficient? Can you elaborate
more on why that is, I don't quite understand. The debug sources are
(basically) what we actually compiled (e.g. post-do_patch) to produce
the binary, and you can in turn follow these back to the upstream
sources with the downloadLocation property.

>
> Alberto has worked on how to obtain the missing data and now has a
> POC. This POC provides full source-to-binary tracking of Yocto builds
> through a couple of scripts (intended to be transformed into a new
> bbclass at a later stage). The goal is to add the missing pieces of
> information in order to get a "real" SBOM from Yocto, which should, at
> a minimum:

Please be a little careful with the wording; SBoMs have a lot of uses,
and many of them we can satisfy with what we currently generate; it
may not do the exact use case you are looking for, but that doesn't
mean it's not a "real" SBoM :)

>
> - carefully describe what is found in a final image (i.e. binary files
> and their dependencies), since that is what is actually distributed
> and goes into the final product;
> - describe how such binary files have been generated and where they
> come from (i.e. upstream sources, including patches and other stuff
> added from meta-layers); provenance is important for a number of
> reasons related to IP Compliance and security.
>
> The aim is to become able to:
>
> - map binaries to their corresponding upstream source packages (and
> not to the "internal" source packages created by recipes by combining
> multiple upstream sources and patches)
> - map binaries to the source files that have been actually used to
> build them - which usually are a small subset of the whole source
> package
>
> With respect to IP compliance, this would allow to, among other things:
>
> - get the real license text for each binary file, by getting the
> license of the specific source files it has been generated from
> (provided by Fossology, for instance), - and not the main license
> stated in the corresponding recipe (which may be as confusing as
> GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause & BSD-4-Clause, or
> even worse)

IIUC this is the difference between the "Declared" license and the
"Concluded" license. You can report both, and I think
create-spdx.bbclass can currently do this with its rudimentary source
license scanning. You really do want both and it's a great way to make
sure that the "Declared" license (that is the license in the recipe)
reflects the reality of the source code.

> - automatically check license incompatibilities at the binary file level.
>
> Other possible interesting things could be done also on the security side.
>
> This work intends to add a way to provide additional data that can be
> used by create-spdx, not to replace create-spdx in any way.
>
> The sources with a long README are available at
> https://gitlab.eclipse.org/eclipse/oniro-compliancetoolchain/toolchain/tinfoilhat/-/tree/srctracker/srctracker
>
> What do you think of this work? Would it be of interest to integrate
> into YP at some point? Shall we discuss this?

This seems promising as something that could potentially move into
core. I have a few points:
 - The extraction of the sources to a dedicated directory is something
that Richard has been toying around with for quite a while, and I
think it would greatly simplify that part of your process. I would
very much encourage you to look at the work he's done, and work on
that to get it pushed across the finish line as it's a really good
improvement that would benefit not just your source scanning.
 - I would encourage you to not wait to turn this into a bbclass
and/or library functions. You should be able to do this in a new
layer, and that would make it much clearer as to what the path to
being included in OE-core would look like. It also would (IMHO) be
nicer to the users :)

>
> Marta and Alberto

