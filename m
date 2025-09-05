Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F036ACAC581
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 17:12:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.605.1757092324704097025
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 10:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q2NF5pC1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28468443AC;
	Fri,  5 Sep 2025 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1757092323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5sbuoinOFeUhNe4EPavUbawAY9hj4Ab83ssyasMBFu0=;
	b=Q2NF5pC1VIEp5y5knRRlbZ0AWAYLrC/18pUX5qaeb4Y/fWHaehLQ4zgqo3lHTAmA580NVN
	dOD5twa7FsBaPtkQlVyhlfFYpv+GVoba5ewS2K4EMRXiDLbZiydgX89uzMvVM5PU44LcZM
	kqQo4zN+eLeXniDs23E0G5eDdKbXSlmXpxeQVpfuF77uMkmfHEKceHrTe20RS576DI/9Vj
	+QSJ1F71SrtJOMBvLJHRUHfrSmMPm7znBNK0qdxMoLr3YqoFh94iqF7kaHMjGQUrjiKwcp
	kt8E605xPtixzOVyvEtxPfPj7nZ1b6CA7QAr11CG4FtoJ7TSaDV056DQV4/QBg==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [PATCH 5/6] lib: oe: license: Add missing import
Date: Fri,  5 Sep 2025 19:11:53 +0200
Message-ID: <20250905171154.182825-6-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
References: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmrghmvghluceuohhuhhgrrhgruceokhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddukeekfeetgfeltdfgieeugeeggeejieejheekueevhffgffegkefgffeukedvnecukfhppeekkedrudeitddrvddvvddrvddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeitddrvddvvddrvddvledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhto
 hepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprghstggrlhdrvggsvghrhhgrrhgusehsvgdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 17:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223030

From: Joshua Watt <JPEWhacker@gmail.com>

The code in this file uses oe.qa, but it was not imported resulting an
an exception when a license error was detected

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e44cb7c5b7281d614ed51fdec06dad0a7211528a)
Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.com>
---
 meta/lib/oe/license.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 32c77fa204..6f882c3812 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -7,6 +7,7 @@
 
 import ast
 import re
+import oe.qa
 from fnmatch import fnmatchcase as fnmatch
 
 def license_ok(license, dont_want_licenses):
-- 
2.43.0


