Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 928327D692
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 22:47:19 +0000 (UTC)
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com
	[10.13.135.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtprelay.synopsys.com (Postfix) with ESMTPS id 8983624E0B25;
	Fri,  5 Apr 2019 15:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1554504440; bh=cYN5VyX1HzMPGHGqXLduLGUljUVHUgUGgiF2Rg9syFs=;
	h=From:To:Cc:Subject:Date:From;
	b=QbDQVLoasiKVuwUf3rYHDOv7N+p1nHdYD39HiDUIhcKSkMkS9ZL726WEpZ0f+RXNb
	SnelXylEyNnqPzm2kS7OKGIb7Ugif9b24srCartKl6aLIf0tckEry7/enF1l59pCxm
	CagFswHzqiXJpxQ/rMeJyFwi5xIIY3/2fDdBpa3IvVHcW147PmoNcADBvaNN2yg9oF
	kmDD+aD5fDPhmcrbR73RmPA8dem3ublA/LUIr8mQRR2ZuKUdKtt7+2qWcCSpdv6i8M
	NvAcL4Ds7B+ivX0sJbfJj6FT6YxdPiQvQjKjl9H0Zt3FWd6UDZz0zsJM8yvFzw1ZvS
	cHpvmNisATiqg==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 9C6FDA006D;
	Fri,  5 Apr 2019 22:47:18 +0000 (UTC)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Apr 2019 01:47:15 +0300
Message-Id: <20190405224715.1321-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>
Subject: [PATCH] busybox: Enable domain search list support
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
X-List-Received-Date: Fri, 05 Apr 2019 22:47:19 -0000

This option is enabled by default in Busybox and becomes
useful in networks with internal resources becasue allows
to use much shorter names.

E.g. instead of "server.internal.company.com" it's possible
to use just "server" if DHCP server is configured with:
---------------------------->8-----------------------
option domain-search "internal.company.com";
---------------------------->8-----------------------

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 493db28e86..0b27fcd4b3 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -989,7 +989,6 @@ CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
-# CONFIG_FEATURE_UDHCP_RFC3397 is not set
 # CONFIG_FEATURE_UDHCP_8021Q is not set
 CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"
 
-- 
2.16.2


