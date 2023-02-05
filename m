Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A17C636CC
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 14:12:08 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.29276.1675606322881735290
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Feb 2023 06:12:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PKbl6jV9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id j25so4742281wrc.4
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Feb 2023 06:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I2fJLX+8Ug62oibuxKQN5/ehAmbXujApHTcLBIrNPMM=;
        b=PKbl6jV9AxJjDXJG4mZ6J6/Q4APJCseH1DIOtZ4YLSvfk7qMD9+tep1F7qRGrpYFGa
         JN+7FNu3AC21hEAN0we7XmT7VqyKzCuuTnPdIydnwOAKcTWehVl/52A0fO9benIs00Ja
         4wxPAi1AxOuD8D6w1bRYXACwWDNz38R+YiIIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I2fJLX+8Ug62oibuxKQN5/ehAmbXujApHTcLBIrNPMM=;
        b=Ku69Sbr/XPIrggf5umavB75Nhdeh85GMo12u5x/ubx3KWe19+ygIyasyBgIwBvA8TW
         4nOCvsd8Ye23SOeo1Gxvr2IQiH2iLYfN5vmOtj7xZY5jjC7JIYq91f3tjQcuHiKcTn62
         tjPm9z6eAm6KfF6EJETwzl0ji76HviIMNrXQXGDQfbcMe622uc1LOaCBllNWTT70W+Eb
         Zh8Y5Wg/5hH2CWFaVIe62vZL/QiVA9Bh4O+f+QdGUh6o7ftK8FCdkQ5NrnLr44ioI7si
         IOcXil6QADxj5L4xb8S7OMgkBqVoQ9vj1spH5eY+kl8r3OBNgvCyJ+aOu8/sD86pxkcp
         tPlQ==
X-Gm-Message-State: AO0yUKULdi3Itf+hgylt1lHz6W6Sj8mZuQBXJTIP5sFDWShW4FkYIZyQ
	4UOgXarY+/86i0dyE1Urds35pQ==
X-Google-Smtp-Source: AK7set+wnP/ykr1kkacBFQy4is45DPyy7TyMdf790mu5hwXLQM6yyw35z10XZarslEbFmRXs8d/kng==
X-Received: by 2002:a5d:5106:0:b0:2c3:dc62:e682 with SMTP id s6-20020a5d5106000000b002c3dc62e682mr4616523wrt.10.1675606321072;
        Sun, 05 Feb 2023 06:12:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:512e:205c:f28a:2b5b? ([2001:8b0:aba:5f3c:512e:205c:f28a:2b5b])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d4c8c000000b002bfc2d0eff0sm6700295wrs.47.2023.02.05.06.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 06:12:00 -0800 (PST)
Message-ID: <37c8978068ff257016d559e27e513a23a695947a.camel@linuxfoundation.org>
Subject: Re: Re: [OE-core] SPDX 3 and OE-core CycloneDX support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Stewart <alex.stewart@ni.com>, Joshua Watt <JPEWhacker@gmail.com>, 
	Kate Stewart <kstewart@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 05 Feb 2023 14:11:59 +0000
In-Reply-To: <80111487-04f1-0c45-4a8d-bfc927b2a812@ni.com>
References: <6eab52f4-8666-294b-3931-8a111b60627b@ni.com>
	 <a23ee023a5ead9c3d66a69b101a8facca3b3fdbf.camel@linuxfoundation.org>
	 <80111487-04f1-0c45-4a8d-bfc927b2a812@ni.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Feb 2023 14:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176785

On Sat, 2023-02-04 at 15:47 -0600, Alex Stewart wrote:
> On 2/3/23 17:06, Richard Purdie wrote:
> > On Fri, 2023-02-03 at 12:26 -0600, Alex Stewart wrote:
> > > Hey Josh,
> > >=20
> > > I have been roadmapping SBOM generation for NI's yocto distro and hav=
e a
> > > few open questions about the future of SPDX and the create-spdx bbcla=
ss.
> > > Since your name seems to be attached to both of those, I figure you
> > > might have the best insight here.
> > >=20
> > > Also posting to the OE-core ML so that this discussion can help other
> > > members.
> > >=20
> > >=20
> > > 1. SPDX 3 timeline. I hear that SPDX 3 is going to be a complete rewr=
ite
> > > of the spec, with more support for modern SBOM discussion topics like
> > > VEX and more comprehensive vulnerability tracking. And it also seems =
to
> > > me that the timeline for its release is very behind schedule [1], but
> > > still in active development. Can you give a SWAG for how close that n=
ew
> > > spec is to completion? Are we months away or years?
> > >=20
> > > 2. If/when SPDX 3 support is released, is it to be assumed that the S=
PDX
> > > facilities in OE core are going to be upgraded to handle it?
> > Assuming someone does the work, which is likely, yes. We did namespace
> > the class in master to prepare for that.
> >=20
> > > 3. The rest of my org is interested in CycloneDX as our common SBOM
> > > format. Have there been any discussions about supporting CDX SBOMs in
> > > OE-core? Any blockers there; or is it something that my org could aut=
hor
> > > and upstream if we decide to go that route?
> > At this point OpenEmbedded/Yocto Project has decided to go the SPDX
> > route for various reasons.
>=20
> Are those reasons documented somewhere?
>=20
> Something about CDX rubs me the wrong way (besides it being named like=
=20
> an off-brand printer company), but I can't put my finger on what. So if=
=20
> there are technical reasons that it is less desirable for the OE=20
> usecase, I'd like to know about them.

I think I share that same feeling but it is hard to put a finger on
why.

I'm not sure anything was documented but there was a discussion by the
TSC when we made the decision. Some rough random thoughts:

* SPDX did go the extra step of becoming an ISO standard

* We (as a community) have much better contacts with the=C2=A0SPDX=C2=A0
  community. It is a fellow Linux Foundation project.

* We already were using SPDX license identifiers so this is a natural=C2=A0
  progression/alignment.

* Looking at the CDX repositories and mailing lists, the discussions=C2=A0
  and contributions do look to be from a much smaller ecosystem

* SPDX are interested in engaging with us, which as Joshua mentions,=C2=A0
  does have benefits. If we run into challenges, we can=C2=A0likely=C2=A0se=
ek=C2=A0
  help. We're actively involved with 3.0 which means we can hopefully=C2=A0
  ensure it works well for us.

Both specifications do encode roughly the same information so the
project alignment with SPDX and the "social" aspects likely tipped the=C2=
=A0
balance.

> My understanding is that CDX has better support for embedding=20
> vulnerability (+VEX) and attestation elements into its DOM, which is=20
> something that our Aero-Def customers will be interested in. I suppose I=
=20
> can build workflows to add that information after converting the OE-SPDX=
=20
> document to CDX, but I'd like to integrate the whole thing into an OE=20
> build, if possible.

I think CDX added VEX information in the last year or so and SPDX plans
to do so in their 3.0. I have had the feeling it is due soon.

> > I'm not sure I want to see two formats being
> > added directly to the core, the better solution would likely be to
> > translate the SPDX output into CycloneDX if/as needed.
>=20
> I'm concerned about the lossiness of that conversion. Based on the=20
> CDX-SPDX mapping document in the cdx2spdx tool repo [1], they seem=20
> roughly compatible. But I haven't been able to find a clean tool which=
=20
> converts the other direction, nor a mapping document for the SPDX->CDX=
=20
> pathway.

You could take that different ways but it could mean people aren't
finding a need to convert SPDX to CDX, meaning SPDX is working for
them.


I don't really want to have two partially implemented SBoM mechanisms
in YP/OE so I'd probably suggest any CDX code was a separate layer at
this point. If there is actual missing capability, I'd be asking SPDX
to resolve it :)

Cheers,

Richard

(copying Kate Stewart to the discussion)


