Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QBqMN-0006nq-Cl
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 17:27:31 +0200
Received: by iye7 with SMTP id 7so4471265iye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 08:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=MM6KF131Qqj4oKJZAAFAERL8gvaWpGJKQg6adRHZXdg=;
	b=Qz38rExTFQ6OCjiJF+IKhJ+Tvs6IBRmFGRhqmg4iKm/JATOQZxrMBQfGzEB9/mErxg
	kfsjEMDPJ5gGrbg4AmmPIjeMKbJWJda5E91d4I31nvZmTJ7i7I45IQPbUEJ+J50e+b1V
	dI6mEa8+rRLmWPFKu+IQwPWBsRSCZgelGIrDQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=jmR01U5hT+tVBa7Wi5PI+4fXSPLws5/wNP4J43BrtbLdKnw6R7DhvP8vueEIHHoWlG
	c17peWCv/L9bYtEJvkSXJ7JaSIPqO5CY4jokI0sHIWftO9L8p5isLNV7TlH24nUXY2lP
	MDFGBVRV2u+Vd2t83wffjn9OjxFqTekOfUBMU=
Received: by 10.42.225.65 with SMTP id ir1mr5601869icb.264.1303140310080; Mon,
	18 Apr 2011 08:25:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.42.165.73 with HTTP; Mon, 18 Apr 2011 08:24:50 -0700 (PDT)
In-Reply-To: <201104181459.00492.paul.eggleton@linux.intel.com>
References: <1303107421.5518.45.camel@rex>
	<201104181459.00492.paul.eggleton@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 18 Apr 2011 08:24:50 -0700
X-Google-Sender-Auth: 7xZ2_7FWPkxNfulHll2nvXmqqPs
Message-ID: <BANLkTi=6OLfi62ezsKJreGM1bda2HeQkGA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Layer tooling brainstorming
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Apr 2011 15:27:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 18, 2011 at 6:59 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> * Show easily which recipes are being used and which are overridden. We have
> bitbake-layers, but this clearly needs some extension. I think long term we
> would want to be able to analyse overrides accross a set of layers to figure
> out where common stuff in non-core layers needs pushing up to oe-core.

I think we'll definitely need multiple views into the information.

> * Allow layer maintainers to easily pull a version of a recipe into their own
> layer if it's about to be removed from oe-core - with some complicated recipes
> that could be painful/annoying to pick out all the necessary files by hand.

The newcollection class in OE does this.  It's not perfect, but it
gets you 90% of the way there.  I was thinking it may be useful as a
separate script, indeed.

> * Recipe maintenance tools that take advantage of bitbake's parsing logic to
> aid blanket updates (e.g. variable renames). This should help mitigate the
> increased difficulty of having recipes spread out over multiple repositories
> when doing these kinds of updates.

This is non-trivial, but doable given zecke's ast implementation.  I
expect we need an API function in the parse package to parse a
string/file and hand back the AST nodes, which we could then
manipulate, and write code to generate the file back out of the ast.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


