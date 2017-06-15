Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E6965783D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 1A8FD2E162
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Vyz9cLFF1vWl
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 3906F2E265
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 267961E079
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BB181E060
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 10214B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v5FFc0Kk014215
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:00 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v5FFc0BJ014214
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Jun 2017 17:38:00 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 17:37:51 +0200
Message-Id: <96febf7a71181a925559e8dd8890cd3c5ee915cd.1497540930.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497540930.git.pkj@axis.com>
References: <cover.1497540930.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 04/11] linux-firmware: Avoid a dependency on python-core
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
X-List-Received-Date: Thu, 15 Jun 2017 15:38:02 -0000

Remove the check_whence.py script since it is only needed to validate
the WHENCE file, and only if explicitly running `make check`.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 4558dafdac..53089f2767 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -210,6 +210,9 @@ do_install() {
 	# Remove pointless bash script
 	rm ${D}${nonarch_base_libdir}/firmware/configure
 
+	# Remove python script used to check the WHENCE file
+	rm ${D}${nonarch_base_libdir}/firmware/check_whence.py
+
 	# Libertas sd8686
 	ln -sf libertas/sd8686_v9.bin ${D}${nonarch_base_libdir}/firmware/sd8686.bin
 	ln -sf libertas/sd8686_v9_helper.bin ${D}${nonarch_base_libdir}/firmware/sd8686_helper.bin
-- 
2.12.0


