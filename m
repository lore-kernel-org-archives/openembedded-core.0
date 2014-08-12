Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4B36F65C70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 18:30:16 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id q107so10110068qgd.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=knsmTSnZbaZRQtYvcVuTJ9VYPJsWA6RvWgwcVkUA5yc=;
	b=IhQK536+ymWfZxRb8Zv2GhdedcGzs1DrHYwm8rBrbkDeXDfm9ngODYxJxu3CxTqDsZ
	yAav19ZpGc/yyCowh9a7GXw+NKQ2ECajSBu2AZdjDshSr0mcapixQ9ULC/xQclY7eweQ
	AWILwsVeGPCMGCNeMZPQihU3C62xgTdKvE4xevIQ9PfHIyEEbfvthTTxzu/nZSC77wt0
	C6Au4x4m5sDKZRHVLLGd2yyg+9jltzawVqjw6uOaxgaZBEz7p0HH7GXeoFKMwDzcdqG9
	sjfRUm87UA7xB1KbV/Qg7QaGl3MwV13wa3x+EgITUWrLxNk+bfVLHPLDp46CxMVb9+UM
	sdBQ==
X-Received: by 10.140.22.137 with SMTP id 9mr9230431qgn.4.1407868217889;
	Tue, 12 Aug 2014 11:30:17 -0700 (PDT)
Received: from localhost.localdomain
	(pool-108-44-82-131.ronkva.east.verizon.net. [108.44.82.131])
	by mx.google.com with ESMTPSA id y8sm27626652qaf.33.2014.08.12.11.30.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 11:30:16 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Aug 2014 14:30:10 -0400
Message-Id: <1407868210-16957-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] powertop : Update SRC_URI to match current path on server.
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
X-List-Received-Date: Tue, 12 Aug 2014 18:30:25 -0000

The url is now uses https and there is a slight change on the path. No
isgn of checksum changes.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-kernel/powertop/powertop_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/powertop/powertop_2.6.1.bb b/meta/recipes-kernel/powertop/powertop_2.6.1.bb
index 58216c2..877b2d5 100644
--- a/meta/recipes-kernel/powertop/powertop_2.6.1.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.6.1.bb
@@ -6,7 +6,7 @@ DEPENDS = "ncurses libnl pciutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.tar.gz"
+SRC_URI = "https://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "4391e7b0af854ecf722cdf712f24b631"
 SRC_URI[sha256sum] = "034cde6d5bb433fe0d29251d5cde5d4c2948abf05fe29ef10966b659331b20e4"
-- 
1.8.3.1


