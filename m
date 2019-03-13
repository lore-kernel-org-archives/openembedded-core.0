Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD8E7C65C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 20:56:04 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id C4382182005;
	Wed, 13 Mar 2019 16:56:05 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id vrKyIai1RyD8; Wed, 13 Mar 2019 16:56:05 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 230ADABFF1;
	Wed, 13 Mar 2019 16:56:05 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 230ADABFF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552510565;
	bh=OsZQ99+jXFx8sf3YTKCWlS8qH1o0PgThhETmWwOmgyg=;
	h=From:To:Date:Message-Id;
	b=HvonNEaY1wmtIvzzvSKpisr8l9iryiP+q42dNIczjZNtQZBVkMzTPjr5iOA6TwSKZ
	mE0185pVQRJNUzOuwcdaEtf7UvWbWPbpy8T2ELjHLK4C4gasvA5Gk1eWaxnaQ2Q8ed
	NK3zP9DN+Tv7SOpL8Zjd1H5PqGw0iL3za08yEezCJfi5V6DQacceZ3rTeEwpM6q1EY
	a/VRA9r1ArVrf0vbskFlhhw3vzw2zjRCUOgnCZpop4fce3xeat02ADoYGAle+ArzoJ
	SztL1p3RzmaJu+bK1skOLOF+0HAVOqeHRzDqqaDCa4y5sbf9Ui47BKDZc6U8hjXs0w
	IUdo86LZcS+PA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id ELH0mACGDMbV; Wed, 13 Mar 2019 16:56:05 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id F0AEFABFE3;
	Wed, 13 Mar 2019 16:56:04 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 20:55:53 +0000
Message-Id: <20190313205555.10007-1-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
Subject: [Thud][PATCH 1/3] lttng-ust: update to 2.10.3
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
X-List-Received-Date: Wed, 13 Mar 2019 20:56:04 -0000

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 .../lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
index d79a47931c..b5c43200d6 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
@@ -23,8 +23,8 @@ PE = "2"
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://lttng-ust-doc-examples-disable.patch \
           "
-SRC_URI[md5sum] = "4863cc2f9f0a070b42438bb646bbba06"
-SRC_URI[sha256sum] = "07cc3c0b71e7b77f1913d5b7f340a78a9af414440e4662712aef2d635b88ee9d"
+SRC_URI[md5sum] = "ffcfa8c1ba9a52f002d240e936e9afa2"
+SRC_URI[sha256sum] = "9e8420f90d5f963f7aa32bc6d44adc1e491136f687c69ffb7a3075d33b40852b"
 
 CVE_PRODUCT = "ust"
 
-- 
2.17.1


