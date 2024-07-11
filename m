Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41572C3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 12:09:11 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.10210.1720699740665655118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 05:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DIzI0iab;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96AB91C0003;
	Thu, 11 Jul 2024 12:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720699738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cQ4CLazJff5Y8Nob8A7DUjY9fhYMUGPNxWLR6azGvbU=;
	b=DIzI0iabQ86ScVE8rx9/xDKW2AhH5eNHhh3h0ntGgHYt9YsxEkIw0LSVTbmRWFwd54cRUF
	DghlRU0+64dPuZXktA89n8UHAor5yJzfElsXbtTAnuduOIR3zzzcVlihOELSbte4G2Jz57
	0qcqA3ARqwJVblSBZ/qIFElWQCQfwlQuZPW8ZS3ZmwTYubIQoZAy54ISqyLz9sK2LunEjj
	I6Pb6L7q9w5cvyKcQjoh+qWkpKxmPwovMQzbDo9kXYM8qCKhqOIq9xLN3BWxYlMRZZJKk1
	s9MxGcoen2FhbzybRzcpL00RAJ8NIvU3C0IJcNsDMVQ1vwqmQo/BI9Wvkd4qIg==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] wireless-regdb: upgrade 2024.05.08 -> 2024.07.04
Date: Thu, 11 Jul 2024 14:08:54 +0200
Message-ID: <20240711120854.862932-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 12:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201777

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 ...ireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
index 95e33d9fb1a7..daf5e6dfcd82 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9aee1d86ebebb363b714bec941b2820f31e3b7f1a485ddc9fcbd9985c7d3e7c4"
+SRC_URI[sha256sum] = "9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb"
 
 inherit bin_package allarch
 
-- 
2.45.2


