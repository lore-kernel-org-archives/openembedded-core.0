Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936BDC83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 11:34:45 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.19994.1752665681750272969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 04:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ky3ocRle;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2932944975;
	Wed, 16 Jul 2025 11:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752665679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8OGJkCXvbReG8pfBBcYD9/oFdrUXDV+5fE3jGN+FlA=;
	b=Ky3ocRle9nY/4npKGaA3cnwfYIGP3R0jxnCFEMLrodz8NMubAb+2+skR1B0kH5pA0qzYdy
	wGQK5w8o+31Q66QxPGj5IYxmZg9E15LboaDtuD+oLGs9NAaE1Z4fq6oLkzp+SHkJnTB2Yv
	ilf1OSxloIdUm67LdiUVRF37K2rb/nJmSq2EXXMZH3GI1+3NcqOCbkt8dNDcUVf7Zwx9rr
	m7zJx+mOSymlmKhUalRF5jhsqrYeaKeM3+pdUPu19FOx4UhoKdlpYvN7iDu0tK8fPVMJyH
	zdUiUwGssYFaKw/91/HRLTzGR2iSJ3vlH0kOO5x23WE6mP3gN+1OMm4HnhXFjw==
Date: Wed, 16 Jul 2025 13:34:37 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com, mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com
Subject: Re: [OE-core] [PATCH 1/1] spdx3: Add optional kernel configuration
 export to build_parameter for virtual/kernel
Message-ID: <20250716113437.GA491407@tpx1.home>
References: <20250716090517.481832-1-kamel.bouhara@bootlin.com>
 <20250716090517.481832-2-kamel.bouhara@bootlin.com>
 <aHdwpmxe3-5x1P1e@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHdwpmxe3-5x1P1e@nuoska>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepmfgrmhgvlhcuuehouhhhrghrrgcuoehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffueegvedujedufedtheegveekieehuedtueffffdvgeefueegleegkefgtedvkeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeekkedrudeitddrvddvvddrvddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeitddrvddvvddrvddvledphhgvlhhopehtphiguddrhhhomhgvpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehmihhkkhhordhrrghpvghliheslhhinhgrrhhordhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheplffrgfghhhgrtghkvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhis
 egsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 11:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220447

On Wed, Jul 16, 2025 at 12:28:06PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> Hi,
>

Hi Mikko,

> On Wed, Jul 16, 2025 at 11:05:17AM +0200, Kamel Bouhara via lists.openembedded.org wrote:
> > Enhances SPDX Document by extracting kernel build-time configuration settings from '${B}/.config'.
> >
> > Each CONFIG_* line is parsed and exported as a DictionaryEntry in the build_Build.build_parameter
> > section of the SPDX document. This provides better visibility into kernel build behavior and
> > configuration, in alignment with the SPDX3 metadata model.
> >
> > The feature is gated by a new tunable variable:
> >
> >     SPDX_INCLUDE_KERNEL_CONFIG (default: "1")
> >
> > Setting this to "0" disables exporting the kernel configuration, which may be useful to improve
> > performance or reduce the size of generated SPDX documents.
> >
> > Example:
> >
> >     CONFIG_FOO=y  →  { key: "CONFIG_FOO", value: "y" }
> >
> > This complements existing metadata export features and enables a more complete audit trail of how
> > the kernel is built within a given build.
>
> Why is the kernel so special? All other SW components have build time configs too.
>
> For information harvesting, a lot of data can be extracted from the build system
> but to me it's important that the build system and tools benefit the users
> who actually do maintenance and development work. They need to be able to see
> what patches get applied, what they fix, what configs are used etc. Extracting
> all possible info into some IT management tooling which never directly feeds
> back to the build system or developers to actually improve the CVE patch status,
> enable security features and updates and fixes for real bugs, is not very useful.
>

You're absolutely right to question the special handling of the kernel.
In this case, the choice was intentional: the kernel’s .config is well-structured,
easy to locate, and critical to the system's security and behavior.
It's also a central component of the BSP, making it a strong candidate for initial
integration when experimenting with build-time metadata capture in SPDX.

That said, I fully agree, many other software components also have meaningful
build-time configuration (e.g., PACKAGECONFIG, EXTRA_OECONF, cmake flags), and the
longer-term goal is to extend support to those as well.

Starting with the kernel gives us a good foundation to validate the approach.

Importantly, the patch makes this metadata inclusion optional and configurable.
It introduces a variable to let users control the granularity of what gets
included in the SPDX document. That means teams can choose to include or exclude
details like kernel configuration based on their policy, use case, or audit needs.

About usefulness to developers, I agree this info only brings value if it
integrates back into yocto developers workflows. That’s exactly the direction
I’m aiming for, for example, we’ve added support in our SBOM diff tool to compare
kernel configuration between builds by parsing CONFIG_* entries.
This mostly lets teams audit config changes over time and detect if a
some security-hardening option was unintentionally disabled.

> If some information is in the build system, then developers can read it from there
> also when doing reviews and audits. For kernel, the -dev binary package has the
> effective config after build has completed.
>

I believe, SPDX provides a more structured, standardized, and portable format that makes
it easy to expose and reuse this data in CI pipelines, and when publishing SBOMs
externally. It becomes a central source that avoids custom parsing or packaging
assumptions and integrates well with tooling for compliance, vulnerability tracking
and auditing.

Thanks again for the feedback.

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

