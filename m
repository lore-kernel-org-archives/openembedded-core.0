Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586A9ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 16:08:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.7996.1663344499609796631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 09:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G3LGoy38;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id bq9so36770807wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=MEs3UT5AegrB6yI4EIgeYVEjsL66oTj9wbfDF24DIwQ=;
        b=G3LGoy38MrpgFzCIYBnzjomBDalt/67b4viskQ0R3Q5l0ZrOpTqKGIKyE37qZk3MJg
         8AtyTKPzNw5Q90d6BIl/A+VCaWBS8Md36vfHMJe5AnzkR20bU218MzD8sGzN1RJKcmwF
         QCnU/g6k6dWfyDN8/ssdM+a2zrBlh9R1cgBO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=MEs3UT5AegrB6yI4EIgeYVEjsL66oTj9wbfDF24DIwQ=;
        b=NGWZL7FVV9Dy3l8yWTmDdXo9uaOWx66sZ1brgRSgWWZZyhWBUUKR8tHhanUiG5bHs7
         7oildM+Mw3txfJheoUDr1U1qaTt1aWdd5WknuXDTh5tHnKxJKy1dsxdMd2OBbKiEe4RS
         8LCRn9xvv7U2ayfaFDaV1jTnETpYW6yLtTAZkHja6n5L4jgmH8eCYO1Hnbt3m49n+m+g
         4HqIVsUe5gl5NVkqkLxQn2x569+hbBvgjeDXb2l/4sxYmG9XBwFmCfBAp9j48x8gdFK9
         NK4niYFzxAGA+050MamMYHBvpJHFGQvNsRlL5jxQTPZlPN1IsVIoodujapV30jm8muxL
         /PAg==
X-Gm-Message-State: ACrzQf0WkK3ZwIYHLoJ2A8hIn7iT4M3u3B/wEH57xV/ZYti2Ul6Wxvgt
	W1SxjzbyQ3VqtOivnhldM1WsHw==
X-Google-Smtp-Source: 
 AMsMyM6vQKcDbwr1JkPbePpco75zTJd8aA960XUx1cMKxSy1/z8DM/t8wihmkOt241OYxVCRI5Mqcw==
X-Received: by 2002:adf:fbd1:0:b0:228:6406:23d8 with SMTP id
 d17-20020adffbd1000000b00228640623d8mr3365273wrs.45.1663344497872;
        Fri, 16 Sep 2022 09:08:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:816c:1950:863b:51c?
 ([2001:8b0:aba:5f3c:816c:1950:863b:51c])
        by smtp.gmail.com with ESMTPSA id
 f18-20020a5d4dd2000000b00228aea99efcsm5427248wru.14.2022.09.16.09.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 09:08:17 -0700 (PDT)
Message-ID: 
 <fa94b3e19e1087d3cf58072e18da4edc102aa802.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Adding more information to the SBOM
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alberto Pianon <alberto@pianon.eu>
Cc: Marta Rybczynska <rybczynska@gmail.com>, OE-core
 <openembedded-core@lists.openembedded.org>,
 openembedded-architecture@lists.openembedded.org, Joshua Watt
 <JPEWhacker@gmail.com>, 'Carlo Piana' <carlo@piana.eu>,
 davide.ricci@huawei.com
Date: Fri, 16 Sep 2022 17:08:16 +0100
In-Reply-To: <10e816efb661938db17c512199720580@pianon.eu>
References: 
	<CAApg2=Q0+GqNVfyhnnadaEhXUB67_vbf5=ukKHdD8xRHqSOptg@mail.gmail.com>
	 <e0ece56dc5b05480313c5eee78a3d31081478687.camel@linuxfoundation.org>
	 <10e816efb661938db17c512199720580@pianon.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 16:08:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170793

On Fri, 2022-09-16 at 17:18 +0200, Alberto Pianon wrote:
> Il 2022-09-15 14:16 Richard Purdie wrote:
> >=20
> > For the source issues above it basically it comes down to how much
> > "pain" we want to push onto all users for the sake of adding in this
> > data. Unfortunately it is data which many won't need or use and
> > different legal departments do have different requirements.
>=20
> We didn't paint the overall picture sufficiently well, therefore our
> requirements may come across as coming from a particularly pedantic
> legal department; my fault :)
>=20
> Oniro is not "yet another commercial Yocto project", we are not a legal
> department (even if we are experienced FLOSS lawyers and auditors, the
> most prominent of whom is Carlo Piana -- cc'ed -- former general counsel
> of FSFE and member of OSI Board).
>=20
> Our rather ambitious goal is not limited to Oniro, and consists in doing
> compliance in the open source way and both setting an example and
> providing guidance and material for others to benefit from our effort.
> Our work will therefore be shared (and possibly improved by others) not
> only with Oniro-based projects but also with any Yocto project. Among
> other things, the most relevant bit of work that we want to share is
> **fully reviewed license information** and other legal metadata about a
> whole bunch of open source components commonly used in Yocto projects.

I certainly love the goal. I presume you're going to share your review
criteria somehow? There must be some further set of steps,
documentation and results beyond what we're discussing here?

I think the challenge will be whether you can publish that review with
sufficient "proof" that other legal departments can leverage it. I
wouldn't underestimate how different the requirements and process can
be between different people/teams/companies.

> To do that in a **scalable and fully automated way**, we need that Yocto
> collects some information that is currently disposed of (or simply not
> collected) at build time.
>=20
> Oniro Project Leader, Davide Ricci - cc'ed - strongly encouraged us to
> seek for feedback from you in order to find out the best way to do it.
>=20
> Maybe organizing a call would be more convenient than discussing
> background and requirements here, if you (and others) are available.

I don't mind having a call but the discussion in this current form may
have an important element we shouldn't overlook, which is that it isn't
just me you need to convince on some of this.

If, for example, we should radically change the unpack/patch process,
we need to have a good explanation for why people need to take that
build time/space/resource hit. If we conclude that on a call, the case
to the wider community would still have to be made.

> > Experience
> > with archiver.bbclass shows that multiple codepaths doing these things
> > is a nightmare to keep working, particularly for corner cases which do
> > interesting things with the code (externalsrc, gcc shared workdir, the
> > kernel and more).
> >=20
> > I had a look at this and was a bit puzzled by some of it.
> >=20
> > I can see the issues you'd have if you want to separate the unpatched
> > source from the patches and know which files had patches applied as
> > that is hard to track. There would be significiant overhead in trying
> > to process and store that information in the unpack/patch steps and the
> > archiver class does some of that already. It is messy, hard and doens't
> > perform well. I'm reluctant to force everyone to do it as a result but
> > that can also result in multiple code paths and when you have that, the
> > result is that one breaks :(.
> >=20
> > I also can see the issue with multiple sources in SRC_URI, although you
> > should be able to map those back if you assume subtrees are "owned" by
> > given SRC_URI entries. I suspect there may be a SPDX format limit in
> > documenting that piece?
>=20
> I'm replying in reverse order:
>=20
> - there is a SPDX format limit, but it is by design: a SPDX package
>    entity is a single sw distribution unit, so it may have only one
>    downloadLocation; if you have more than one downloadLocation, you must
>    have more than one SPDX package, according to SPDX specs;

I think we may need to talk to the SPDX people about that as I'm not
convinced it always holds that you can divide software into such units.
Certainly you can construct a situation where there are two
repositories, each containing a source file which are only ever linked
together as one binary.

> - I understand that my solution is a bit hacky; but IMHO any other
>    *post-mortem* solution would be far more hacky; the real solution
>    would be collecting required information directly in do_fetch and
>    do_unpack

Agreed, this needs to be done at unpack/patch time. Don't underestimate
the impact of this on general users though as many won't appreciate
slowing down their builds generating this information :/.

There is also a pile of information some legal departments want which
you've not mentioned here, such as build scripts and configuration
information. Some previous discussions with other parts of the wider
open source community rejected Yocto Projects efforts as insufficient
since we didn't mandate and capture all of this too (the archiver could
optionally do some of it iirc). Is this just the first step and we're
going to continue dumping more data? Or is this sufficient and all any
legal department should need?

> - I also understand that we should reduce pain, otherwise nobody would
>    use our solution; the simplest and cleanest way I can think about is
>    collecting just package (in the SPDX sense) files' relative paths and
>    checksums at every stage (fetch, unpack, patch, package), and leave
>    data processing (i.e. mapping upstream source packages -> recipe's
>    WORKDIR package -> debug source package -> binary packages -> binary
>    image) to a separate tool, that may use (just a thought) a graph
>    database to process things more efficiently.

I'd suggest stepping back and working out whether the SPDX requirement
of a "single download location" some of this stems from really makes
sense.

> > Where I became puzzled is where you say "Information about debug
> > sources for each actual binary file is then taken from
> > tmp/pkgdata/<machine>/extended/*.json.zstd". This is the data we added
> > and use for the spdx class so you shouldn't need to reinvent that
> > piece. It should be the exact same data the spdx class uses.
> >=20
>=20
> you're right, but in the context of a POC it was easier to extract them
> directly from json files than from SPDX data :) It's just a POC to show
> that required information may be retrieved in some way, implementation
> details do not matter

Fair enough, I just want to be clear we don't want to duplicate this.

>=20
> > I was also puzzled about the difference between rpm and the other
> > package backends. The exact same files are packaged by all the package
> > backends so the checksums from do_package should be fine.
> >=20
>=20
> Here I may miss some piece of information. I looked at files in
> tmp/pkgdata but I couldn't find package file checksums anywhere: that is
> why I parsed rpm packages. But if such checksums were already available
> somewhere in tmp/pkgdata, it wouldn't be necessary to parse rpm packages
> at all... Could you point me to what I'm (maybe) missing here? Thanks!

In some ways this is quite simple, it is because at do_package time,
the output packages don't exist, only their content. The final output
packages are generated in do_package_write_{ipk|deb|rpm}.

You'd probably have to add a stage to the package_write tasks which
wrote out more checksum data since the checksums are only known at the
end of those tasks. I would question whether adding this additional
checksum into the SPDX output actually helps much in the real world
though. I guess it means you could look an RPM up against it's checksum
but is that something people need to do?

Cheers,

Richard





