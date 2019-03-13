Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id EAD7C7C6A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 20:53:53 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 3CF92ABF29;
	Wed, 13 Mar 2019 16:53:55 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id lbkcMsE2bfhX; Wed, 13 Mar 2019 16:53:54 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 81547ABF20;
	Wed, 13 Mar 2019 16:53:54 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 81547ABF20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552510434;
	bh=kHN9FwIjPFWTh1xibRDg4AfWo/YQcWnuzOBrhyTZ/q0=;
	h=From:To:Date:Message-Id;
	b=TcczcqqUZ4Kj6JkPvs6EUTNePq2CuA400Nc3PB5Aj5Gx7hlnIPCozNi6ag7ZpXJLA
	ZbeXyggpYD9GNz4bG6xoxZs2ReBhFuc/oLYpFIx0oH3EdafdtdeoozrBbLm6db824H
	P+mg0jZr5zRRJMCszoxTlMEEx1NtAWJ1yHfRmmLCcm2+sC0uakFD0bBKywGM+mMjgf
	0SgbCB/Y9IzTGrYbZVogAWYO5f4/VJJyyKRmzi7YIODCWPVd9U2LhOA422gnXU0SJi
	aQu96U0Ud5DrHaI0dehteqJskZ38bqBN8j9+Mk3kMX5g2kVnsjT0nPBJS03o6jT3D8
	442xqk14/Dz5g==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id moeU2sei9lVG; Wed, 13 Mar 2019 16:53:54 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 556CEABF17;
	Wed, 13 Mar 2019 16:53:54 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 20:53:32 +0000
Message-Id: <20190313205332.9674-3-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190313205332.9674-1-jonathan.rajotte-julien@efficios.com>
References: <20190313205332.9674-1-jonathan.rajotte-julien@efficios.com>
Subject: [Sumo][PATCH 3/3] lttng-tools: update to 2.9.11
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
X-List-Received-Date: Wed, 13 Mar 2019 20:53:54 -0000

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 .../lttng/{lttng-tools_2.9.5.bb => lttng-tools_2.9.11.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.9.5.bb => lttng-tools_2.9.11.bb} (97%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb b/meta/recipes-kernel/lttng/lttng-tools_2.9.11.bb
similarity index 97%
rename from meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.9.11.bb
index 93626dd4b5..1cbbf8763c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.9.11.bb
@@ -32,8 +32,8 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "051224eb991aee07f8721ff1877d0b96"
-SRC_URI[sha256sum] = "77839eb6fc6c652125f08acfd9369701c2516eb05cc2084160e7efc7a3fb731c"
+SRC_URI[md5sum] = "f9c2b35810790f5bd802483eb14cb301"
+SRC_URI[sha256sum] = "2c45144acf8dc6fcd655be7370a022e9c03c8b7419af489c9c2e786a335006db"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages
 
-- 
2.17.1


