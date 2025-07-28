Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A902CC87FC9
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 13:30:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.81505.1753709454936721759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 06:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cEVhrSgG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCDF3442E3;
	Mon, 28 Jul 2025 13:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753709453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Qxmw8ObNt8LDsH/BzxGKTrx9BZefZaNyvA54TTlJhrs=;
	b=cEVhrSgGl05Wu2hlNm3lbKXXBlxMD01i+oA8/nH1kW1e9r90/J7bbb2Ni1ysN+LLkM1Ko8
	rgcutLuyj2/HuE+zp557CuWGngvCDz/prvGI1+NWx7zyIwYkHwVmSJtxv9irAHiGesUfcv
	B+IxGIlzlGF34SgLDqv1vLxltRw0i01TfKvQ655lf9gzg2qcGkGzc1iWBg+AtqSTC+3axx
	8KSXFM89q3GK6tMvuIAsIbyi6TWwwixsncZT4PB13U0puqq8ChFbFIMfZBDQ6M5LZVw1TA
	eF5tO2YkhmCouBc2DkDRROldr8oxxx9yCa+8G6e8ekDhJ1qmbmQY2K4yB1NVNA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v2 0/2] spdx3: Add optional support for exporting
Date: Mon, 28 Jul 2025 15:30:42 +0200
Message-ID: <20250728133044.39757-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelvddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfgrmhgvlhcuuehouhhhrghrrgcuoehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhfefgveeiteekieekieehiefhiefhvdfffeffkeetgeeigfdtieduieeljedvueenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecukfhppeekkedrudeitddrvddvvddrvddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeitddrvddvvddrvddvledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrr
 hgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 13:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221003

Hi all,

This v2 patch series introduces *optional* support for exporting
build-time configuration metadata into SPDX 3.0 documents.

The goal is to improve traceability and reproducibility in SPDX output,
particularly for security-critical settings.

The series adds support for two types of build metadata:

  1. Linux kernel configuration (.config)
     - Exported as a dedicated build_Build object
     - Each CONFIG_* line becomes a 'DictionaryEntry' in 'build_parameter'
     - Linked to the main recipe build using an 'ancestorOf' relationship
     - Controlled via 'SPDX_INCLUDE_KERNEL_CONFIG' (default: "0")

  2. PACKAGECONFIG feature set
     - Each PACKAGECONFIG feature is recorded as a DictionaryEntry
     - Captures whether a feature is enabled or disabled
     - Stored in the recipe's build_Build.build_parameter
     - Controlled via 'SPDX_INCLUDE_PACKAGECONFIG' (default: "0")

Both features are fully opt-in and have negligible runtime cost when
disabled.

This makes it easy for users to selectively enable metadata export only
when needed; for example, in CI pipelines, security audits, or diffing
builds for regressions.

As discussed in [1], the kernel's .config is a good candidate for
inclusion in SPDX.

The approach follows SPDX modeling by introducing a *separate build object*
for kernel configuration, avoiding overloading the meaning of the main
recipe build. This is linked via a 'ancestorOf' relationship to preserve
traceability.

Similarly, PACKAGECONFIG settings are metadata that can help detect
build-time feature toggles, especially across different configurations
or product variants.

While this doesn't aim to turn SPDX into a full build tracker, it *does*
provide a consistent, machine-readable way to surface relevant build
decisions in SBOMs already being generated.

This approach was validated internally to track hardening flags and
kernel changes.

[1] https://lists.openembedded.org/g/openembedded-core/message/220705


Kamel Bouhara (2):
  kernel.bbclass: Add task to export kernel configuration to SPDX
  spdx30_tasks: Add support for exporting PACKAGECONFIG to SPDX

 meta/classes-recipe/kernel.bbclass   | 62 ++++++++++++++++++++++++++++
 meta/classes/create-spdx-3.0.bbclass | 11 +++++
 meta/lib/oe/spdx30_tasks.py          | 20 +++++++++
 3 files changed, 93 insertions(+)

--
2.43.0


