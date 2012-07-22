Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1St69g-0005oT-GI
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 02:05:44 +0200
Received: by pbbrq2 with SMTP id rq2so8714813pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 16:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KQz981umj0o7t6ig8dC08sg5e7QIBUf58gRndA3H60I=;
	b=OGzAjqhOglguzrBUxX6M92HwPNE5li8skyVMPcQWXoQWTAwRtd2UaOWP8K7HAKloDr
	KMl0PNjhEj7TAbiSq3+WIfAykmH+hayGQpwqw7qkYUsyshErFEX3SFjQrsIZJ6kWE/9S
	NPnpMdUi0CzMg3EURKJtO3vl23Tc1S7cZcOXFiI8oIFUTAj92ebxL55/5zbGDQOatuht
	IR/uHzXe1VgQxOJOZv5W45CpuJ/iO5CWIDkg8DmW4g1jrTMf0LV6sIJtNQ29pppBZtvU
	24Fy3fDZEmU/fq5Mr4D6ZqzllBKe7BrzTZ94aDsqfI0UY7L3mleJLUMjFEPOl5QF+moy
	LIQQ==
Received: by 10.68.194.6 with SMTP id hs6mr31169153pbc.133.1343001257566;
	Sun, 22 Jul 2012 16:54:17 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id og4sm8706078pbb.48.2012.07.22.16.54.15
	(version=SSLv3 cipher=OTHER); Sun, 22 Jul 2012 16:54:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Jul 2012 16:54:16 -0700
Message-Id: <1343001258-19551-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/3] qemu.bbclass: Map the qemu binary name for powerpc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 00:05:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/qemu.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 68896ce..aead8e2 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -9,5 +9,7 @@ def qemu_target_binary(data):
         target_arch = "i386"
     elif target_arch == "powerpc":
         target_arch = "ppc"
+    elif target_arch == "powerpc64":
+        target_arch = "ppc64"
 
     return "qemu-" + target_arch
-- 
1.7.5.4



