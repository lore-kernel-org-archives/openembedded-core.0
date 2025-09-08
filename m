Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1922ACAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 09:01:43 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.8447.1757322091857622123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 02:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=QY9Jwv+9;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 13EC3C8F1E8
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Sep 2025 09:01:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98C7D6061A;
	Mon,  8 Sep 2025 09:01:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98BB0102F1C66;
	Mon,  8 Sep 2025 11:01:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757322089; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nyplwNaaI5P2fzMqDbFVLcJhOmxrSXWusWxqkUOIZ5M=;
	b=QY9Jwv+9JOrKoNb25ag24JntcUvTaiM4c3nN1wqJp+DP8cgrM4VQHzNI+hXQfhgswnIEj+
	ibndRDfdQTkUk3s/o5vGluHiNtl3IAEWMd4biwu/sj8ZjSdSVbL+Dq84hrAgB/C3pEE7p3
	DyoBnmjg2HfngphWqSg7fEqMCchPzKY82DuHJk5rt3VlTIzifEh6uTKmtyGVytzR6eL0m+
	1St+QVd9dRB0BSdTnHtOkhhCZ+qQ45hXM9QgzVTkBxPdB5409fpabsSgOhPr+XgUtIIDlo
	25Xn2r1fKJ20OfKSssfL+ZcS4YIJPKJuEe294l0CK9AiWPnoTwRXFKr0a9mPsA==
Date: Mon, 8 Sep 2025 11:01:22 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>, mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
	Pascal Eberhard <pascal.eberhard@se.com>
Subject: Re: [PATCH 0/6] backport: SPDX 3.0 support to Scarthgap
Message-ID: <mwdzemgsgy4ukf5x7xfjsatfqoq27nq54fddaoxnjvpiztlcpr@xjo4wkk7ahes>
References: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
 <CAJdd5GbX8GT+k+YkSkFiB=dk4ChfhFcVeENk-O4-NR+x7EMjqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJdd5GbX8GT+k+YkSkFiB=dk4ChfhFcVeENk-O4-NR+x7EMjqg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 09:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223060

On Sat, Sep 06, 2025 at 11:02:26AM -0600, Joshua Watt wrote:
> On Fri, Sep 5, 2025 at 11:11=E2=80=AFAM Kamel Bouhara <kamel.bouhara@bo=
otlin.com>
> wrote:
>
> > Hello,
> >

Hi Joshua,

> > This series backports SPDX 3.0 support from the upstream Walnascar
> > branch to Scarthgap, along with a few additional local fixes to ensur=
e
> > correct integration.
> >
> > The primary motivation for this series is to bring full SPDX 3.0 supp=
ort
> > to the latest Yocto Project LTS release, Scarthgap, which will contin=
ue
> > to receive maintenance updates until 2028.
> >
> > This ensures that long-term supported releases can benefit from the
> > latest SPDX standard for license and compliance tracking.
> >
> > These changes are also in line with discussions at the Yocto Project
> > Summit in Amsterdam, where the need for up-to-date SPDX support in LT=
S
> > releases was highlighted.
> >
> > The backport introduces SPDX 3.0 document support, SDK and image
> > integration, and related helpers. It also brings over tasks, classes,
> > and library code from upstream.
> >
> > Feedback is particularly welcome on:
> >   - The correctness and completeness of the backport
> >   - Whether the local fixes should be adjusted or further refined
> >
>
> Interesting. This backport isn't as bad as I initially thought it might=
 be,
> thanks for putting it together! I'll look it over more closely to make =
sure
> it seems alright

Thanks for the quick review and the feedback!

I hesitated to do cherry-picking and finally chose to backport every
SPDX3 related class and library in one patch to have a clean and coherent
backport. For related functionality (like the license refactoring and
image manifest), I used cherry-picks.

>
> We had originally stated that we wouldn't backport this in OE core, and
> would prefer to use a mix in layer.... that said, it is probably the nu=
mber
> one request I've gotten any time I talk about SPDX, a lot of people are
> pretty interested in having this, and there are a lot of advantages to
> doing it in OE core, so perhaps we can discuss that more.

I also think that this belongs in OE core, LTS releases are used in
production for many years, and SPDX3 adds significant value for
compliance and SBOM requirements.

Regarding the suggestion of using a mixin layer: I=E2=80=99m not entirely=
 clear
on how meta-lts-mixins would apply here. According to the documentation,
mixin layers are thin and specific-purpose, maintained by the community,
and not tested by the Yocto Project. SPDX3, on the other hand, is a
fundamental part of license compliance infrastructure, and its
maintenance should remain unchanged and part of OE-Core to ensure
stability and testing across all LTS users.

>
> The one thing I can tell right away that you are missing is the test co=
de;
> if this does go into OE core, backport of the test cases will be requir=
ed
> also.

I did a quick check, and my plan is to cherry-pick the following commits
from upstream to bring in the SPDX3 test coverage:

	838d64c096 spdx 3.0: Rework how SPDX aliases are linked
	14f534f15f lib: oeqa: spdx: Add tests for extra options
	ccd6dde301 oeqa/selftest: Add SPDX 3.0 include source case for work-shar=
e
	b1d2309b3a selftest: spdx: Add SPDX 3.0 test cases

This should provide equivalent test coverage to Walnascar. Does that
approach work for you?

Thanks !
Kamel

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

