Return-Path: <alexandre.belloni@free-electrons.com>
X-Greylist: delayed 510 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 Nov 2016 13:12:22 UTC
Received: from mail.free-electrons.com (mail.free-electrons.com [62.4.15.54])
	by mail.openembedded.org (Postfix) with ESMTP id C36E0719AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:12:22 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id 2C7A520C75; Wed, 23 Nov 2016 14:03:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 072CE20C6F;
	Wed, 23 Nov 2016 14:03:52 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 14:03:49 +0100
Message-Id: <20161123130349.25983-1-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] insane: Add aarch64 baremetal mappings to the QA arch test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2016 13:12:27 -0000

Add mappings for aarch64-elf and aarch64_be-elf to binary lookup table
which allows for the generation of baremetal toolchains.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 meta/classes/insane.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a5c93f33ff53..d51e73eaf48f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -63,6 +63,8 @@ def package_qa_get_machine_dict(d):
                         "arm" :       (40,     0,    0,          True,          32),
                       },
             "elf" : {
+                        "aarch64" :   (183,    0,    0,          True,          64),
+                        "aarch64_be" :(183,    0,    0,          False,         64),
                         "i586" :      (3,      0,    0,          True,          32),
                         "x86_64":     (62,     0,    0,          True,          64),
                         "epiphany":   (4643,   0,    0,          True,          32),
-- 
2.10.2


