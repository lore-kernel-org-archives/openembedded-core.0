Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D203C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 14:53:54 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.43095.1753109623683277348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 07:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RRTKRdu/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7120443909;
	Mon, 21 Jul 2025 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753109621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uEyji6ZH7fYNNGU+XizUkSd06ihruTne6Bd4gD0dY9w=;
	b=RRTKRdu/uPUR5ZkBEivxB1c4uurlZdrs9okouprXPzzKgID4dcRS8wFJsgjZv7tjpsUoy7
	eQItVVyBTo2WGjFH/xTTaq8Bq/kysyJMII8KMA7uopBprDo3WZ0ND/AnVPWiIb36hkqf1K
	f54dvpRKmXNr1Ntpd63EocsxDwj/klWtMIPmxFB5hRKE+oSC9XV1RKaTsQmVIwVPklhkai
	7eMjHuvPBMMmohxAHaHo8xXTTTRYlWj2zXfo6ssnY5sSGnpWs1QF70ENhzPg2IcU8p6i4X
	/kkWWQQcVwIJkRslxlrmLV4o3CuPSMt4euyVA1rge8nuE972GjAo5lPy/dzcKA==
Date: Mon, 21 Jul 2025 16:53:39 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com
Subject: Re: [PATCH 1/1] spdx3: Add optional kernel configuration export to
 build_parameter for virtual/kernel
Message-ID: <20250721145339.GA632744@tpx1.home>
References: <20250716090517.481832-1-kamel.bouhara@bootlin.com>
 <20250716090517.481832-2-kamel.bouhara@bootlin.com>
 <CAJdd5GYRkptevcv0+4U6fQmVa-MxzB4EbdX=GtfE-21x3rkzEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJdd5GYRkptevcv0+4U6fQmVa-MxzB4EbdX=GtfE-21x3rkzEQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejvdefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepmfgrmhgvlhcuuehouhhhrghrrgcuoehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvteeugfevtdegfeegvddugfejfffhvdeitdekgfehheffteegveevudfhtefgffenucffohhmrghinhepshhpugigfedtrdgsuhhilhgupdhsphgugidrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepkeekrdduiedtrddvvddvrddvvdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeekrdduiedtrddvvddvrddvvdelpdhhvghlohepthhpgidurdhhohhmvgdpmhgrihhlfhhrohhmpehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepjhhpvgifhhgrtghkvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrthhhihgvu
 hdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 14:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220699

On Fri, Jul 18, 2025 at 04:10:31PM -0600, Joshua Watt wrote:
>    Nak, see inline comment below about erasing the recipe variables
>    In general, I'm not too opposed to being able to express this sort of
>    thing in the SPDX (provided it's optional), there already is precedence
>    for it (see SPDX_INCLUDE_BUILD_VARIABLES), and it is more or less
>    intended that SPDX _can_ express these sorts of things (although, just
>    because we can doesn't mean we have to). However, your approach here is
>    incorrect.

Hi Joshua,

>    The primary problem is that you are including the config settings in
>    the recipe Build object; you can't really do that because that recipe
>    Build object (more or less) represents the build of entire "recipe" (up
>    to the point of the do_create_spdx task anyway), and already has a
>    defined meaning for what its build parameters mean (they are the
>    bitbake variables at the time the do_create_spdx is invoked). Adding in
>    the kernel config options to this build changes that meaning and means
>    that you can't infer the meaning of the parameters anymore from the
>    buildType, which is wrong.


OK thanks for clarifying the context around the Build object.

Just to make sure I understand correctly:

The Build object created in create_spdx(d) is intended to represent the
entire bitbake recipe build (up to do_create_spdx), including any tasks
like do_configure, do_compile, etc., but it's still scoped to that
specific recipe, not to the entire image or overall build.

So anything that applies to just a step (like parsing .config for a kernel)
shouldn't be added directly to this object, and should instead go in a
separate Build object linked via a relationship like ancestorOf.

Is that the correct way to interpret it?

>    Instead, what you need to do is create a new build that represents the
>    compile (or configuration) of the kernel, and assign it a unique
>    buildType (or if one already exists for the kernel build with the same
>    meaning, you could use that.... but I doubt that is the case). Since
>    you have a unique buildType, you can then define the kernel config
>    parameters as you have done here for that build and it will be possible
>    to correctly interpret them. The final step is to link the existing
>    build to your new build using the ancestorOf relationship to indicate
>    that your new build is a "sub build" of the parent recipe build.

OK, I've started reworking the patch with that structure in mind.

To create the new build object representing the kernel configuration,
I’m planning to do the following:

   1. Use oe.spdx30.build_Build(...) to create a new Build, with a unique
   buildType like "kernel-configuration".

   2. Populate build_parameter with the parsed .config CONFIG_* values as
   DictionaryEntrys.

   3. Link it to the main recipe Build object via ancestorOf relationship
   like:

	    build_objset.new_relationship(
		[build], # Parent: full recipe build
		oe.spdx30.RelationshipType.ancestorOf,
		[main_recipe_build], # Child: kernel config sub-build
	    )

   4. Set timestamps (seems optional ?)

Does that approach look correct to you, especially the use of ancestorOf
and the new buildType?

Below is an example of spdx snippet obtained with your suggestion:

    {
      "type": "build_Build",
      "spdxId": "http://spdx.org/spdxdocs/linux-yocto-.../kernel-config",
      "creationInfo": "_:CreationInfo220",
      "build_buildType": "kernel-configuration",
      "build_parameter": [
        {
          "type": "DictionaryEntry",
          "key": "CONFIG_CC_VERSION_TEXT",
          "value": "x86_64-oe-linux-gcc (GCC) 13.3.0"
        },
       ...
    }

>    Ideally, this would not live in spdx30_tasks.py, since it's highly
>    specific to the kernel build and I really want to avoid putting
>    everyone's specific reporting requirements in the common code; they
>    need to be more distributed than that (IMHO).

I see your point about keeping spdx30_tasks.py free of recipe-specific
logic, that makes sense from a long-term maintainability standpoint.

That said, I have some doubts about creating a dedicated kernel-spdx.bbclass
just for handling this one case (the .config). It feels a bit heavy unless
we expect additional kernel-specific SPDX processing in the future.

Would a lighter alternative be acceptable, keeping the
kernel build injection behind SPDX_INCLUDE_KERNEL_CONFIG? It would keep
the logic local without needing a new class.

Curious what you'd prefer here, I want to respect the layering without
introducing more complexity than necessary.

Cheers,

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

