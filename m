Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7C0C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 14:30:36 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.23588.1752676228339650724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 07:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c5yWuKY4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C3F642E77;
	Wed, 16 Jul 2025 14:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752676226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kf3ub9SZOULon4ldvBOu5cfxVFvOTpg4zZVXMmEOu4g=;
	b=c5yWuKY44f43qorU+fYfohaKDvgB8isOw9hnzrKMikTTkmo6xk/eZMb9r4qbkkYM1EWuEH
	rWPoP5aKeeKBLnpqTyRB0TyB0ys6+aSnnUQ4lOAtOMOEz7hcMaK9c78GnOp6Fm9KTk9bCs
	d8merxDiXnfluGJBJWNPeoiGMU5RyP+aFCC3r5DZDV4hmT66SudAeKYr/ISq5z5iYFP1Rf
	zeD4uH1b7MKKprlS++ijRGnOKKLD98vBJRJaklMzXEu6Ps6ITvUH2MT1NSfuH2hP5To/MB
	Qv9aIM/0snZaPD/KLjswpS0vOojhQSNRkSACJgGUAGEjdFhIu8DN5vV27O7xxw==
Date: Wed, 16 Jul 2025 16:30:24 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: bruce.ashfield@gmail.com
Cc: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org,
	JPEWhacker@gmail.com, thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com
Subject: Re: [OE-core] [PATCH 1/1] spdx3: Add optional kernel configuration
 export to build_parameter for virtual/kernel
Message-ID: <20250716143024.GA504568@tpx1.home>
References: <20250716090517.481832-1-kamel.bouhara@bootlin.com>
 <20250716090517.481832-2-kamel.bouhara@bootlin.com>
 <aHdwpmxe3-5x1P1e@nuoska>
 <20250716113437.GA491407@tpx1.home>
 <CADkTA4PYcTMOeYyRpDRt8wefnkQEcQkXqustRrS-gczfnig7MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4PYcTMOeYyRpDRt8wefnkQEcQkXqustRrS-gczfnig7MQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepmfgrmhgvlhcuuehouhhhrghrrgcuoehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffueegvedujedufedtheegveekieehuedtueffffdvgeefueegleegkefgtedvkeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeekkedrudeitddrvddvvddrvddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeitddrvddvvddrvddvledphhgvlhhopehtphiguddrhhhomhgvpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegsrhhutggvrdgrshhhfhhivghlugesghhmrghilhdrtghomhdprhgtphhtthhopehmihhkkhhordhrrghpvghliheslhhinhgrrhhordhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheplffrgfghhhgrtghkvghrsehgm
 hgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 14:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220463

On Wed, Jul 16, 2025 at 09:30:11AM -0400, Bruce Ashfield via lists.openembedded.org wrote:
>    On Wed, Jul 16, 2025 at 7:34 AM Kamel Bouhara via
>    [1]lists.openembedded.org
>    <kamel.bouhara=[2]bootlin.com@lists.openembedded.org> wrote:
>
>      On Wed, Jul 16, 2025 at 12:28:06PM +0300, Mikko Rapeli via
>      [3]lists.openembedded.org wrote:
>      > Hi,
>      >
>      Hi Mikko,
>      > On Wed, Jul 16, 2025 at 11:05:17AM +0200, Kamel Bouhara via
>      [4]lists.openembedded.org wrote:
>      > > Enhances SPDX Document by extracting kernel build-time
>      configuration settings from '${B}/.config'.
>      > >
>      > > Each CONFIG_* line is parsed and exported as a DictionaryEntry
>      in the build_Build.build_parameter
>      > > section of the SPDX document. This provides better visibility
>      into kernel build behavior and
>      > > configuration, in alignment with the SPDX3 metadata model.
>      > >
>      > > The feature is gated by a new tunable variable:
>      > >
>      > >     SPDX_INCLUDE_KERNEL_CONFIG (default: "1")
>      > >
>      > > Setting this to "0" disables exporting the kernel configuration,
>      which may be useful to improve
>      > > performance or reduce the size of generated SPDX documents.
>      > >
>      > > Example:
>      > >
>      > >     CONFIG_FOO=y  →  { key: "CONFIG_FOO", value: "y" }
>      > >
>      > > This complements existing metadata export features and enables a
>      more complete audit trail of how
>      > > the kernel is built within a given build.
>      >
>      > Why is the kernel so special? All other SW components have build
>      time configs too.
>      >
>      > For information harvesting, a lot of data can be extracted from
>      the build system
>      > but to me it's important that the build system and tools benefit
>      the users
>      > who actually do maintenance and development work. They need to be
>      able to see
>      > what patches get applied, what they fix, what configs are used
>      etc. Extracting
>      > all possible info into some IT management tooling which never
>      directly feeds
>      > back to the build system or developers to actually improve the CVE
>      patch status,
>      > enable security features and updates and fixes for real bugs, is
>      not very useful.
>      >
>      You're absolutely right to question the special handling of the
>      kernel.
>      In this case, the choice was intentional: the kernel’s .config is
>      well-structured,
>      easy to locate, and critical to the system's security and behavior.
>      It's also a central component of the BSP, making it a strong
>      candidate for initial
>      integration when experimenting with build-time metadata capture in
>      SPDX.
>      That said, I fully agree, many other software components also have
>      meaningful
>      build-time configuration (e.g., PACKAGECONFIG, EXTRA_OECONF, cmake
>      flags), and the
>      longer-term goal is to extend support to those as well.
>      Starting with the kernel gives us a good foundation to validate the
>      approach.
>      Importantly, the patch makes this metadata inclusion optional and
>      configurable.
>      It introduces a variable to let users control the granularity of
>      what gets
>      included in the SPDX document. That means teams can choose to
>      include or exclude
>      details like kernel configuration based on their policy, use case,
>      or audit needs.
>      About usefulness to developers, I agree this info only brings value
>      if it
>      integrates back into yocto developers workflows. That’s exactly the
>      direction
>      I’m aiming for, for example, we’ve added support in our SBOM diff
>      tool to compare
>      kernel configuration between builds by parsing CONFIG_* entries.
>      This mostly lets teams audit config changes over time and detect if
>      a
>      some security-hardening option was unintentionally disabled.
>

>    I have the same concerns and opinion on this as Mikko
>    As long as this doesn't add overhead, or becomes mandatory, my
>    objections can
>    be ignored.
>    But generally speaking, I'm opposed to jamming everything into SPDX and
>    using
>    it as a tool for what you are describing above. There are already
>    existing tools that
>    are focused and better at comparing configurations of packages (and the
>    kernel).
>    Turning SPDX into some kind of one-stop-shop and everything-in-one
>    place tool
>    is something I'd object strongly to.  (I do realize you are talking
>    about using some
>    sort of other tool reading the SPDX data, but my objection is just the
>    same if it
>    becomes an absolutely massive monolithic data source).
>    Bruce
>

Hi Bruce,

Thanks for the feedback.

Just to clarify, the goal here isn't to turn SPDX into a one-stop-shop or to
overload it with every piece of build metadata. The intent is to capture a minimal
and focused subset of build-time parameters
(like kernel .config, PACKAGECONFIG, etc.) where:

    - The structure is already well-defined
    - The data is relevant for security or compliance
    - And the cost of extraction is very low

This is fully gated behind an opt-in variable (and could default to disabled).
The idea is not to replace existing tools but rather to provide a structured,
portable format for key metadata, especially in SBOM-driven environments where SPDX
is already part of the process.

In my use case, this metadata is consumed by a targeted diff tool; not treating
SPDX as the end-goal, but more like a transport format. This approach lets us
reuse existing SPDX outputs without interfering with or duplicating the role of
more purpose-built tools.

So I hear you: this shouldn't become bloated, mandatory. The goal is simply to make
sure when people do need to trace how something was built, especially in CI or
audit contexts, they have a consistent hook, and it can be disabled entirely if
not useful.

Cheers,

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

