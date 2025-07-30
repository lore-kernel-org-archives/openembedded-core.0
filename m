Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84765C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 08:31:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.30396.1753864275063664617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 01:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ilxsauMi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0C2343365;
	Wed, 30 Jul 2025 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753864273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7mkU7um3jf34QjwPMjaQgywpuV4squ2X1U6PIvbzDhc=;
	b=ilxsauMi1aZb/h4bX85xfoKDDvX+kSwCmsEDKqrSTp0cW6qzoe+CIwFDmaosf/sCWqqdGy
	iLoWyEh/8ET1guvR6bjUd7WSXelJ9zQ4Psdd75Nv8si59POX8Swdx9batMvJJ4DVZXnDTJ
	vIuekLalae6BonOkFC+dx0jr//W1O6RzKBlD5OSePysMl7nnpHF5z9xBRoSFTNig06PfIk
	iWvIrn+D2TaWJNch+kDBMktYDIeX1ofSemLMKWsi17zvWijHutxLfiyit87TD7LWW5zOyb
	QnNjCfcEImU0LeQHuNz93KtjdCPHuD/WpUWTYRcKn8Acpmre6r8veIEKFml+QA==
Date: Wed, 30 Jul 2025 10:31:11 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com
Subject: Re: [PATCH v2 2/2] spdx30_tasks: Add support for exporting
 PACKAGECONFIG to SPDX
Message-ID: <20250730083111.GG12273@tpx1.home>
References: <20250728133044.39757-1-kamel.bouhara@bootlin.com>
 <20250728133044.39757-3-kamel.bouhara@bootlin.com>
 <CAJdd5GbUwXGsL_xM9Ku0kPfvUxMgOgwYc7VxGpW2SfOe_KumjQ@mail.gmail.com>
 <20250729155447.GE12273@tpx1.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250729155447.GE12273@tpx1.home>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefmrghmvghluceuohhuhhgrrhgruceokhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfevgedvgeelgeffjeekvefgkeekieduleeluedvvdeuveejleejteeggefhjeejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeekkedrudeitddrvddvvddrvddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeitddrvddvvddrvddvledphhgvlhhopehtphiguddrhhhomhgvpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehjphgvfihhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrh
 ihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 08:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221108

On Tue, Jul 29, 2025 at 05:54:49PM +0200, Kamel Bouhara wrote:
> On Tue, Jul 29, 2025 at 08:57:53AM -0600, Joshua Watt wrote:
> >    I'm not quite sure about this. The PACKAGECONFIG value is already
> >    captured if you do `SPDX_INCLUDE_BUILD_VARIABLES = "1"`, so having a
> >    explicit way to capture it doesn't seem necessary.
> >    If the build variables are too much data, I'd prefer some way to filter
> >    which ones get included in the SPDX data rather than add special cases
> >    for special variables (for example, maybe `SPDX_INCLUDE_BUILD_VARIABLES
> >    = "1"` include all variables, but `SPDX_INCLUDE_BUILD_VARIABLES =
> >    "PACKAGECONFIG"` would only include the value of PACKAGECONFIG)
>
> Hello Joshua,
>
> You are right, parsing the raw PACKAGECONFIG string isn’t fundamentally
> more complex for most SPDX consumers, especially for diff or comparison
> tooling where raw strings are straightforward to compare.
>
> I’m happy to revise the patch accordingly if that sounds good.
>

Hi Joshua,

I took a closer look at what SPDX_INCLUDE_BUILD_VARIABLES actually exports,
and you're right that PACKAGECONFIG is included but only as a raw,
unevaluated string like:

	{ "key": "PACKAGECONFIG", "value": "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}" }

This doesn't show which features are enabled or disabled, nor does it
reflect the final evaluated configuration. So from a consumer/tooling
perspective, it lacks the granularity needed to understand the actual
build toggles.

That’s why I originally chose to export each PACKAGECONFIG feature
explicitly as a DictionaryEntry, with enabled/disabled values.
It makes feature selection clear and machine-readable, which is especially
helpful when diffing builds.

Given this, would you reconsider accepting the original approach with
structured PACKAGECONFIG export as an optional feature?

Alternatively, I could still integrate this into a filtered variable
export system, but with special logic just for how PACKAGECONFIG is interpreted.

Let me know what you'd prefer to adjust accordingly!

Kamel

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

