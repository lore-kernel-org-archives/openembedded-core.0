Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C793DC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 13:42:19 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6770.1745588534949476785
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 06:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BB0ng0Fz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0379A43944;
	Fri, 25 Apr 2025 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745588533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1NM4QXGlKSyyqpqczIgL/1z9/gMI2P4utxL04u1OxsQ=;
	b=BB0ng0FzOR53oVP98P4v21A6i+ZZXTIYDgco9bCPEXjRaUh2y+tMrrr3nbGMfnwWiFcFAv
	ewm/p/KREGO/FztuWfRKgTSKkZiCnN/7jSYxkcxQl9Z4zqEcuJDb5yZti57bkIUstCEPFc
	3JBOvaPssDkCD/1y+rrxiMLa3uBgyQMJg1xFaaK0FtHPSLSfQyx6aRJM70cIB0OREux1sK
	Ox6Yci9BkEUMRjFEnAjR4PDL3qhB5o/cS5IveIQNgjyNiPQs0JL3FCXL04SlpMWKmU7TMn
	Duo+MGUW8lmmV3KJqFvHCAVkXgOHUtFc41J7GLO7z4022oY90oMSBOnD0AX0Mg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 1/2] scripts/cve-json-to-text.py: remove unused options
Date: Fri, 25 Apr 2025 15:40:41 +0200
Message-ID: <20250425134137.4148001-1-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeffueefgedtgedugefhueevudduieelvdekffetfeelhfegteeviedvhfevveefnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrg
 hhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 13:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215473

Remove --all and -a and they are unused in the file.
Remove long options as they don't actually exist when using getopt.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 scripts/cve-json-to-text.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/cve-json-to-text.py b/scripts/cve-json-to-text.py
index 87a5669987..a2eb592f5f 100755
--- a/scripts/cve-json-to-text.py
+++ b/scripts/cve-json-to-text.py
@@ -48,12 +48,9 @@ def parse_args(argv):
     except getopt.GetoptError:
         show_syntax_and_exit(1)
     for opt, arg in opts:
-        if opt in ("-h", "--help"):
+        if opt in ("-h"):
             show_syntax_and_exit(0)
-        elif opt in ("-a", "--all"):
-            show_all = True
-            show_unknown = True
-        elif opt in ("-i", "--input"):
+        elif opt in ("-i"):
             infile = arg
 
 def load_json(filename):

