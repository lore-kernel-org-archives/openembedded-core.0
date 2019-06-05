Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 29D2E7D3B6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 06:11:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45JdjL10mSz3H
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 08:11:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559715110;
	bh=iDJE3UdxJLT49Udhoj/kRCh9Sf7L1Ua4V1uTzACKcSQ=;
	h=From:To:Subject:Date:From;
	b=UJofOS65QHcuKPvmfhgsxLQJ8C8NDL4AwAINAJyJd6+Who6UEP5RXPPvBq8+9Uoqg
	p4zWq8ObDP9ICamJABTl2kcfMiQAVYScqByqgwWiR+NtrGY3Jmqi5K7U/34z/0BUgB
	4YP4418Nv1RmQ0lH39sHqIZNV1u3N3xm40uEoF5xaEcV9rNhHQUx+pjOu1zeUBULZ0
	kXC0xjFu3Irz4su4U02Lg+lICCwhq/R6Enw5pAUuzoLu13i1x0/PyBf6X1SpZHZ6or
	R43B59tEBHcsUFE7zPKKgbA0nyyVjRPlG0wUGDwLceskfk7sjxLN8m5nnRAuP+0LhY
	psXkdAtLZ+SXKbDlK9+G2XViutKuUY/7bD+hha1XyCwau/4W9Ajom7zIF5uiQsSgE6
	M1GXFwfTlQy7eOq1ap2uOx/PnGgvghj8YwG5U3Dh5yCqY+o3N21uPqnCNAiHsMqpUB
	wyHTruaeeHW9S8OJD04ia0YJQjdRfsrBL/xBOLwfotIrAsBeZ3FYunbdar2yNg+o1A
	iHz/uwBrdqLHKrA8Ex8sEZMXE+hl9ZgE0x8TiPvl2KzRxevkAqz3BIXcsm9h7EoljJ
	qpiIvPs9BwfUIkOJAyWEMAecSDeRtKj4EeY8grG0n9V/sfIh4T+v8woa4vByN6LRtO
	xVAavWCodwLKFWmHHyWQGhcw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2019 09:11:49 +0300
Message-Id: <20190605061149.25100-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] vte: Fix the license information
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
X-List-Received-Date: Wed, 05 Jun 2019 06:11:51 -0000

Several files that are part of libvte (e.g. src/widget.cc)
are licensed LGPLv3+.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/vte/vte_0.56.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vte/vte_0.56.1.bb b/meta/recipes-support/vte/vte_0.56.1.bb
index 3585e9ce57..702436b368 100644
--- a/meta/recipes-support/vte/vte_0.56.1.bb
+++ b/meta/recipes-support/vte/vte_0.56.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Virtual terminal emulator GTK+ widget library"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
-LICENSE = "GPLv3 & LGPLv2.1+"
-LICENSE_libvte = "LGPLv2.1+"
+LICENSE = "GPLv3 & LGPLv3+ & LGPLv2.1+"
+LICENSE_libvte = "LGPLv3+"
 
 LIC_FILES_CHKSUM = " \
     file://COPYING.GPL3;md5=2f31b266d3440dd7ee50f92cf67d8e6c \
-- 
2.17.1


