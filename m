Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293C8C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 13:15:28 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.11705.1663679722568347336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 06:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P8zeVpoz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id n10so4166601wrw.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 06:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=J11L+g3LcJF1p64bJgiSv0/DD0Mfpvtwl3jia3KNnXM=;
        b=P8zeVpozaU9RoNY/AWB61h0uyBj4u3cr0/xznRsPjMDdIQ0bUfj5HIipaYZ3/C1Bor
         UuxG1mTJk2vnDyQP4lGyM1ptSKCaDVoI+bUVED6Ksy9m5w7Wi9VZTqNXKD9njEPhkNBa
         xm2K1JyOkqWIdDNVLGEGA6k1aXm5rZ+xPqugo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=J11L+g3LcJF1p64bJgiSv0/DD0Mfpvtwl3jia3KNnXM=;
        b=c8MhO8xcMT0MZSeWUm7qWlCmh1ajIfZwtm3ak35N1mUWy8cToLTYQ5CSd/8+b/8VXs
         aorBeHbUnsBMRxyNlgja/T6jxuSgrZMK+0ij/a3HkaQqq0B9Wo73TdDnLf2p15TqL3F6
         jGZ+6qHrVUiG8FpCqucSE5e6Z4a4mFfv61JVTh5dXS0XFW8el+v+s/VDz8eRej18kOo8
         Dcuk6nG6iH8dN/dtHv+EgG7Ffh+4wIQzZEgK/GzmHB222mm/nY7FZ29Zd1VIisugjJY7
         +D10zumVCkX7qAra3tMlUwX4Ljowx7nqjN0XCf2faBWMMTDgIQijjC6wZ2uGGNDGGUab
         U9KA==
X-Gm-Message-State: ACrzQf0zFm1Mh6H8A/Cq2rhBNdl+WT/iT4cppEOOY7FQkf4S0La78Ufv
	jqjYH9WDNJqK9YauH1ZUrW0XWw==
X-Google-Smtp-Source: 
 AMsMyM42ccQEbBlmeqTHLVp1ETN8vwfN3aabbMZXrsAm/GtyPUiI/n8P7OSEWJWU+ma/MIS+v0y6lQ==
X-Received: by 2002:a05:6000:2c9:b0:22a:f261:a81e with SMTP id
 o9-20020a05600002c900b0022af261a81emr9883619wry.458.1663679720656;
        Tue, 20 Sep 2022 06:15:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d363:331f:b5a4:a50a?
 ([2001:8b0:aba:5f3c:d363:331f:b5a4:a50a])
        by smtp.gmail.com with ESMTPSA id
 k5-20020adfe8c5000000b00226f39d1a3esm1632554wrn.73.2022.09.20.06.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 06:15:20 -0700 (PDT)
Message-ID: 
 <d3e256b0ec9e3d88731a8d1fb307a7e8dfa4e533.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Adding more information to the SBOM
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Carlo Piana <carlo@piana.eu>
Cc: Alberto Pianon <alberto@pianon.eu>, Marta Rybczynska
 <rybczynska@gmail.com>,  OE-core
 <openembedded-core@lists.openembedded.org>,
 "openembedded-architecture@lists.openembedded.org"
 <openembedded-architecture@lists.openembedded.org>, Joshua Watt
 <JPEWhacker@gmail.com>, davide ricci <davide.ricci@huawei.com>
Date: Tue, 20 Sep 2022 14:15:19 +0100
In-Reply-To: <1061592967.5114533.1663597215958.JavaMail.zimbra@piana.eu>
References: 
	<CAApg2=Q0+GqNVfyhnnadaEhXUB67_vbf5=ukKHdD8xRHqSOptg@mail.gmail.com>
	 <e0ece56dc5b05480313c5eee78a3d31081478687.camel@linuxfoundation.org>
	 <10e816efb661938db17c512199720580@pianon.eu>
	 <fa94b3e19e1087d3cf58072e18da4edc102aa802.camel@linuxfoundation.org>
	 <1061592967.5114533.1663597215958.JavaMail.zimbra@piana.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 13:15:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170901

On Mon, 2022-09-19 at 16:20 +0200, Carlo Piana wrote:
> thank you for a well detailed and sensible answer. I certainly cannot
> speak on technical issues, although I can understand there are
> activities which could seriously impact the overall process and need
> to be minimized.
>=20
>=20
> > On Fri, 2022-09-16 at 17:18 +0200, Alberto Pianon wrote:
> > > Il 2022-09-15 14:16 Richard Purdie wrote:
> > > >=20
> > > > For the source issues above it basically it comes down to how much
> > > > "pain" we want to push onto all users for the sake of adding in thi=
s
> > > > data. Unfortunately it is data which many won't need or use and
> > > > different legal departments do have different requirements.
> > >=20
> > > We didn't paint the overall picture sufficiently well, therefore our
> > > requirements may come across as coming from a particularly pedantic
> > > legal department; my fault :)
> > >=20
> > > Oniro is not "yet another commercial Yocto project", we are not a leg=
al
> > > department (even if we are experienced FLOSS lawyers and auditors, th=
e
> > > most prominent of whom is Carlo Piana -- cc'ed -- former general coun=
sel
> > > of FSFE and member of OSI Board).
> > >=20
> > > Our rather ambitious goal is not limited to Oniro, and consists in do=
ing
> > > compliance in the open source way and both setting an example and
> > > providing guidance and material for others to benefit from our effort=
.
> > > Our work will therefore be shared (and possibly improved by others) n=
ot
> > > only with Oniro-based projects but also with any Yocto project. Among
> > > other things, the most relevant bit of work that we want to share is
> > > **fully reviewed license information** and other legal metadata about=
 a
> > > whole bunch of open source components commonly used in Yocto projects=
.
> >=20
> > I certainly love the goal. I presume you're going to share your review
> > criteria somehow? There must be some further set of steps,
> > documentation and results beyond what we're discussing here?
>=20
> Our mandate (and our own attitude) is precisely to make everything as
> public as possible.
>=20
> We have published already about it
> https://gitlab.eclipse.org/eclipse/oniro-compliancetoolchain/toolchain/do=
cs/-/tree/main/audit_workflow
>=20
> The entire review process is made using GitLab's issues and will be
> made public.

I need to read into the details but that looks like a great start and
I'm happy to see the process being documented!

Thanks for the link, I'll try and have a read.

> We have only one reservation concerning sensitive material
> in case we found something legally problematic (to comply with
> attorney/client privilege) or security-wise critic (in which case we
> adopt a responsible disclosure principle and embargo some details).

That makes sense, it is a tricky balancing act at times.

> > I think the challenge will be whether you can publish that review with
> > sufficient "proof" that other legal departments can leverage it. I
> > wouldn't underestimate how different the requirements and process can
> > be between different people/teams/companies.
>=20
> Speaking from a legal perspective, this is precisely the point. It is
> true that we want to create a curated database of decisions, which as
> any human enterprise is prone to errors and correction and therefore
> we cannot have the last word. However, IF we can at least point to a
> unique artifact and give its exact hash, there will be no need to
> trust us, that would be open to inspection, because everybody else
> could look at the same source we have identified and make sure we
> have extracted all the information.

I do love the idea and I think it is quite possible. I do think this
does lead to one of the key details we need to think about though.

From a legal perspective I'd imagine you like dealing with a set of
files that make up the source of some piece of software. I'm not going
to use the word "package" since I think the term is overloaded and
confusing. That set of files can all be identified by checksums. This
pushes us towards wanting checksums of every file.

Stepping over to the build world, we have bitbake's fetcher and it
actually requires something similar - any given "input" must be
uniquely identifiable from the SRC_URI and possibly a set of SRCREVs.

Why? We firstly need to embed this information into the task signature.
If it changes, we know we need to rerun the fetch and re-obtain the
data. We work on inputs to generate this hash, not outputs and we
require all fetcher modules to be able to identify sources like this.

In the case of a git repo, the hash of a git commit is good enough. For
a tarball, it would be a checksum of the tarball. Where there are patch
local files, we include the hashes of those files.

The bottom line is that we already have a hash which represents the
task inputs. Bugs happen, sure. There are also poor fetchers, npm and
go present challenges in particular but we've tried to work around
those issues.

What you're saying is that you don't trust what bitbake does, so you
want all the next level of information about the individual files.

In theory we could put the SRC_URI and SRCREVs into the SPDX as the
source (which could be summarised into a task hash) rather than the
upstream url. It all depends which level you want to break things down
to.

I do see a case for needing the lower level info as in review, you are
going to want to know the delta to the last review decisions. You also
prefer having a different "upstream" url form for some kinds of checks
like CVEs. It does feel a lot like we're trying to duplicate
information and cause significant growth of the SPDX files without an
actual definitive need.

You could equally put in a mapping between a fetch task checksum and
the checksums of all the files that fetch task would expand to if run
(it should always do it deterministicly).

> To be clearer, we are not discussing here the obligation to provide
> the entire corresponding source code as with *GPLv3, but rather we
> are seeking to establish the *provenance* of the software, of all
> bits (also in order to see what patch has been applied by who and to
> close which vulnerability, in case).

My worry is that by not considering the obligation, we don't cater for
a portion of the userbase and by doing so, we limit the possible
adoption.

> Provenance also has a great impact on "reproducibility" of legal work
> on sources. If we are not able to tell what has gone into our package
> from where (and this may prove hard and require a lot of manual - and
> therefore error-prone - work especially in case of complex Yocto
> recipes using f.e. crate/cargo or npm(sw) fetchers), we (lawyers and
> compliance specialists) are at a great disadvantage proving we have
> covered all our bases.

I understand this more than you realise as we have the same problem in
the bitbake fetcher and have spent a lot of time trying to solve it. I
won't claim we're there for some of the modern runtimes and I'd love
help in both explaining to the upstream projects why we need this and
help to technically fix the fetchers so these modern runtimes work
better.

> This is a very good point, and I can vouch that this is really
> important, but maybe you are reading too much in here: at this stage,
> our goal is not to convince anyone to radically change Yocto tasks to
> meet our requirements, but it is to share such requirements and their
> rationale, collect your feedback and possibly adjust them, and also
> to figure out the least impactful solution to meet them (possibly
> without radical changes but just by adding optional functions in
> existing tasks).

"optional functions" fill me with dread, this is the archiver problem I
mentioned.

One of the things I try really hard to do is to have one good way of
doing things rather than multiple options with different levels of
functionality. If you give people choices, they use them. When
someone's build fails, I don't want to have to ask "which fetcher were
you using? Did you configure X or Y or Z?". If we can all use the same
code and codepaths, it means we see bugs, we see regressions and we
have a common experience without the need for complex test matrices.

Worst case you can add optional functions but I kind of see that as a
failure. If we can find something with low overhead which we can all
use, that would be much better. Whether it is possible, I don't know
but it is why we're having the discussion. This is why I have a
preference for trying to keep common code paths for the core though.

> > > - I understand that my solution is a bit hacky; but IMHO any other
> > >    *post-mortem* solution would be far more hacky; the real solution
> > >    would be collecting required information directly in do_fetch and
> > >    do_unpack
> >=20
> > Agreed, this needs to be done at unpack/patch time. Don't underestimate
> > the impact of this on general users though as many won't appreciate
> > slowing down their builds generating this information :/.
>=20
> Can't this be made optional, so one could just go for the "old" way
> without impacting much? Sorry I'm stepping where I'm naive.

See above :).

>=20
> >=20
> > There is also a pile of information some legal departments want which
> > you've not mentioned here, such as build scripts and configuration
> > information. Some previous discussions with other parts of the wider
> > open source community rejected Yocto Projects efforts as insufficient
> > since we didn't mandate and capture all of this too (the archiver could
> > optionally do some of it iirc). Is this just the first step and we're
> > going to continue dumping more data? Or is this sufficient and all any
> > legal department should need?
> >=20
>=20
> I think that trying to give all legal departments what they want
> would prove impossible. I think the idea here is more to start
> building a collectively managed database of provenance and licensing
> data, with a curate set of decision for as many packages available as
> possible. This way that everybody can have some good clue -- and
> increasingly a better one -- as to which license(s) apply to which
> package, removing much of the guesswork that is required today.

It makes sense and is a worthy goal. I just wish we could key this off
bitbake's fetch task checksum rather than having to dump reams of file
checksums!

> We ourselves reuse a lot of information coming from Debian's machine-
> readable information, sometimes finding mistakes and opening issues
> upstream. That helped us to cut the licensing harvesting information
> and review by a great deal.

This does explain why the bitbake fetch mechanism would be a struggle
for you though as you don't want to use our fetch units as your base
component (which is why we end up struggling with some of the issues).

In the interests of moving towards a conclusion, I think what we'll end
up needing to do is generate more information from the fetch and patch
tasks, perhaps with a json file summary of what they do (filenames and
checksums?). That would give your tools data to feed them, even if I'm
not convinced we should be dumping more and more data into the final
SPDX files.

Cheers,

Richard



