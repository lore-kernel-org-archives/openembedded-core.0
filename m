Return-Path: <angelo@sysam.it>
Received: from sysam.it (ec2-18-194-220-216.eu-central-1.compute.amazonaws.com
	[18.194.220.216])
	by mail.openembedded.org (Postfix) with ESMTP id E369D79357
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 13:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sysam.it (Postfix) with ESMTP id B609D205CB;
	Thu,  4 Oct 2018 13:29:58 +0000 (UTC)
Received: from sysam.it ([127.0.0.1])
	by localhost (sysam.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6Roptc-26S4; Thu,  4 Oct 2018 13:29:57 +0000 (UTC)
Received: from localhost.localdomain
	(host70-5-dynamic.16-79-r.retail.telecomitalia.it [79.16.5.70])
	by sysam.it (Postfix) with ESMTPSA id 9A12A205C3;
	Thu,  4 Oct 2018 13:29:57 +0000 (UTC)
From: Angelo Dureghello <angelo@sysam.it>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 15:29:50 +0200
Message-Id: <20181004132953.3568-2-angelo@sysam.it>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181004132953.3568-1-angelo@sysam.it>
References: <20181004132953.3568-1-angelo@sysam.it>
Cc: Angelo Dureghello <angelo@sysam.it>
Subject: [PATCH 1/4] siteinfo: define data for m68k
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
X-List-Received-Date: Thu, 04 Oct 2018 13:29:58 -0000

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 meta/classes/siteinfo.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 24585d5842..411e70478e 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -33,6 +33,7 @@ def siteinfo_data_for_machine(arch, os, d):
         "i686": "endian-little bit-32 ix86-common",
         "ia64": "endian-little bit-64",
         "lm32": "endian-big bit-32",
+        "m68k": "endian-big bit-32",
         "microblaze": "endian-big bit-32 microblaze-common",
         "microblazeeb": "endian-big bit-32 microblaze-common",
         "microblazeel": "endian-little bit-32 microblaze-common",
-- 
2.11.0


