Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6F9B76B3D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 09:11:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 440VxZ1Hftz3T
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 10:11:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1550135474;
	bh=woSygiPhKsjDpGL4JY/AM5cEJnPiF+HSFMz+gPbhnc8=;
	h=From:To:Subject:Date:From;
	b=ITNqC0NqJW6wzObHbBvnC/tbLUUUm+V1XMH1yMwRmhTwHN3Eznl3mITKU1q5KsB3m
	LiVM3n7rTceqjB+KReix25B9+p7DEQIZ+GTSC4/KYZ3EtFgoaSD0n3AQMHvB4i0DGM
	3LEgThaN0r/jGUXO7UOJr5fcedjlnMju+c+pApShgRiiJvrj7AbrcjlELBoqVk3S0x
	9WfoWGA59tbXIHtrfiD9uiPGocTcPhqgxWPpyYw2Q8ZbB4DE1ruxI8oXFN1Kg6nGfH
	gUd/XCd3u8vfIFSvR91KNM5RCeJf7UAXQ1mf7TaF14hqVLzQQmRtl5KV4TlGz4/ZXw
	92mejUc9u6BPF4Jqcmv+CdvdRUjtLh5HlvKlc9N0l6J5FvatJIxwmpAF2fGZoUFo2l
	y2KnKwoPstgBJyGQI07loOY6YyE4dBRSZYwlsnPaxx9kFv8O14DX4QVC6R0k9OJCS8
	eR/aQSU1Qmzjqe1qFfBjJNS1Nwc9ZQIsy7JfTWxYHja+WnErKzUDcw5ryb1hX0nWru
	bixF5WhavmKLkAacFCj6BTQY0UObbIZNclN/d9SFz3/JrHUh1ReCHAKpJx2ihpBPxC
	S092AFOzBYEwCCS8RjBljcPL1mM3L62MxSoxt5KSb3Mre1+8USX86WOZy+QeJSMRop
	wwSQkDM17xicr5KetVCqGGpY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 11:11:13 +0200
Message-Id: <20190214091113.26691-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bind: Move nsupdate to bind-utils
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
X-List-Received-Date: Thu, 14 Feb 2019 09:11:14 -0000

This is a client tool that is usually not used one the same
machine as the DNS server.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/bind/bind_9.11.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5.bb b/meta/recipes-connectivity/bind/bind_9.11.5.bb
index 21e979fd9c..11990ee27e 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5.bb
@@ -119,7 +119,7 @@ CONFFILES_${PN} = " \
 	"
 
 PACKAGE_BEFORE_PN += "${PN}-utils"
-FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/mdig"
+FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/mdig ${bindir}/nsupdate"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
 
-- 
2.11.0


