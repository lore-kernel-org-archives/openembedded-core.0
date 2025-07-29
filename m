Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291B6C87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 15:54:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.11561.1753804491724186371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 08:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LFMDNTvF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C0E144282;
	Tue, 29 Jul 2025 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753804489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ES2OkRJq3W3deVn0MQN5Us3oDOuPqbZ6y6CYVbGPvcc=;
	b=LFMDNTvFFPp/gBGDptXzYZEJy30FuQ1nEjacjvGrV9P19CxS3KJTP8B5THicOVvPux1dND
	tVxz1RPHBNm/9WBFkMgnU/i6dW7NwRoz47y6bhzklFXbfVaIlhj7anGYJVYMuX3LFCeIeR
	DNaVN8Sc4HiK+8yZxoUGn3HyteuvRfLxVylx5JnmAtdzpOMAozTTL2zZ3ozmVsb35wgMS/
	LV1wZykIGMgrGtwEe1iVFzMlo8vmZnVk7VLcEI8g9dV3V361O0fia5AKEokma2fjMXmzAI
	BQae5lElmRpCtf5L2A979ps2ItTLhnE/tDGZtEcmMvBJr9+VEXttNGvter+5Ww==
Date: Tue, 29 Jul 2025 17:54:47 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com
Subject: Re: [PATCH v2 2/2] spdx30_tasks: Add support for exporting
 PACKAGECONFIG to SPDX
Message-ID: <20250729155447.GE12273@tpx1.home>
References: <20250728133044.39757-1-kamel.bouhara@bootlin.com>
 <20250728133044.39757-3-kamel.bouhara@bootlin.com>
 <CAJdd5GbUwXGsL_xM9Ku0kPfvUxMgOgwYc7VxGpW2SfOe_KumjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJdd5GbUwXGsL_xM9Ku0kPfvUxMgOgwYc7VxGpW2SfOe_KumjQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelheegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefmrghmvghluceuohhuhhgrrhgruceokhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfevgedvgeelgeffjeekvefgkeekieduleeluedvvdeuveejleejteeggefhjeejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrieefrddvtddvrdegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrieefrddvtddvrdegtddphhgvlhhopehtphiguddrhhhomhgvpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehjphgvfihhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghls
 egsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 15:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221082

On Tue, Jul 29, 2025 at 08:57:53AM -0600, Joshua Watt wrote:
>    I'm not quite sure about this. The PACKAGECONFIG value is already
>    captured if you do `SPDX_INCLUDE_BUILD_VARIABLES = "1"`, so having a
>    explicit way to capture it doesn't seem necessary.
>    If the build variables are too much data, I'd prefer some way to filter
>    which ones get included in the SPDX data rather than add special cases
>    for special variables (for example, maybe `SPDX_INCLUDE_BUILD_VARIABLES
>    = "1"` include all variables, but `SPDX_INCLUDE_BUILD_VARIABLES =
>    "PACKAGECONFIG"` would only include the value of PACKAGECONFIG)

Hello Joshua,

You are right, parsing the raw PACKAGECONFIG string isn’t fundamentally
more complex for most SPDX consumers, especially for diff or comparison
tooling where raw strings are straightforward to compare.

I’m happy to revise the patch accordingly if that sounds good.

Cheers,
Kamel

>    On Mon, Jul 28, 2025 at 7:30 AM Kamel Bouhara
>    <[1]kamel.bouhara@bootlin.com> wrote:
>
>      Introduce the SPDX_INCLUDE_PACKAGECONFIG variable, which when
>      enabled causes
>      PACKAGECONFIG features to be recorded in the SPDX document as build
>      parameters.
>      Each feature is recorded as a DictionaryEntry with key
>      PACKAGECONFIG:<feature>
>      and value enabled or disabled, depending on whether the feature is
>      active in
>      the current build.
>      This makes the build-time configuration more transparent in SPDX
>      output and
>      improves reproducibility tracking.
>      This makes the build-time configuration more transparent in SPDX
>      output and
>      improves reproducibility tracking. In particular, it allows
>      consumers of the
>      SBOM to identify enabled/disabled features that may affect security
>      posture
>      or feature set.
>      Signed-off-by: Kamel Bouhara <[2]kamel.bouhara@bootlin.com>
>      ---
>       meta/classes/create-spdx-3.0.bbclass |  5 +++++
>       meta/lib/oe/spdx30_tasks.py          | 20 ++++++++++++++++++++
>       2 files changed, 25 insertions(+)
>      diff --git a/meta/classes/create-spdx-3.0.bbclass
>      b/meta/classes/create-spdx-3.0.bbclass
>      index 15c31ba9a3..6125e8b547 100644
>      --- a/meta/classes/create-spdx-3.0.bbclass
>      +++ b/meta/classes/create-spdx-3.0.bbclass
>      @@ -56,6 +56,11 @@ and each CONFIG_* value will be included in the
>      Build.build_parameter list as Di
>       items. Set to '0' to disable exporting kernel configuration to
>      improve performance or reduce \
>       SPDX document size."
>      +SPDX_INCLUDE_PACKAGECONFIG ??= "0"
>      +SPDX_INCLUDE_PACKAGECONFIG[doc] = "If set to '1', each
>      PACKAGECONFIG feature is recorded in the \
>      +build_Build object's build_parameter list as a DictionaryEntry with
>      key \
>      +'PACKAGECONFIG:<feature>' and value 'enabled' or 'disabled'"
>      +
>       SPDX_IMPORTS ??= ""
>       SPDX_IMPORTS[doc] = "SPDX_IMPORTS is the base variable that
>      describes how to \
>           reference external SPDX ids. Each import is defined as a key in
>      this \
>      diff --git a/meta/lib/oe/spdx30_tasks.py
>      b/meta/lib/oe/spdx30_tasks.py
>      index c352dab152..d708715981 100644
>      --- a/meta/lib/oe/spdx30_tasks.py
>      +++ b/meta/lib/oe/spdx30_tasks.py
>      @@ -815,6 +815,26 @@ def create_spdx(d):
>                   sorted(list(build_inputs)) +
>      sorted(list(debug_source_ids)),
>               )
>      +    if d.getVar("SPDX_INCLUDE_PACKAGECONFIG", True) != "0":
>      +        packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
>      +        all_features = (d.getVarFlags("PACKAGECONFIG") or
>      {}).keys()
>      +
>      +        if all_features:
>      +            enabled = set(packageconfig)
>      +            all_features_set = set(all_features)
>      +            disabled = all_features_set - enabled
>      +
>      +            for feature in sorted(all_features):
>      +                status = "enabled" if feature in enabled else
>      "disabled"
>      +                build.build_parameter.append(
>      +                    oe.spdx30.DictionaryEntry(
>      +                        key=f"PACKAGECONFIG:{feature}",
>      +                        value=status
>      +                    )
>      +                )
>      +
>      +            bb.note(f"Added PACKAGECONFIG entries: {len(enabled)}
>      enabled, {len(disabled)} disabled")
>      +
>           oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes",
>      deploydir)
>      --
>      2.43.0
>
> References
>
>    1. mailto:kamel.bouhara@bootlin.com
>    2. mailto:kamel.bouhara@bootlin.com

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

