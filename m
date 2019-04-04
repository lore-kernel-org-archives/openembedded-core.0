Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 34D6E7D46D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 21:47:57 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 795A71D324F;
	Thu,  4 Apr 2019 17:47:58 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id yQZONgZRqIxp; Thu,  4 Apr 2019 17:47:58 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 43CD21D324B;
	Thu,  4 Apr 2019 17:47:58 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 43CD21D324B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1554414478;
	bh=aV6gKxKoB1sXw/4ST5Ik0Xxo8vHPLLOORVUyoIeVI+0=;
	h=From:To:Date:Message-Id;
	b=l/sHNc5gw86I//+Da+62dhgEu8XUh9BzhF1Tp5+iQCPwQaIufsq6ttszi7ieyYLQZ
	QLiXB5qVPYE6arOf545Rf9/1PZpKbBVuWm7YrH9weH1gnpuCKr4HnNctuqv79gEILU
	6YjR4/zf12p1Kna/XZlkDQRrdy2p/bJ1dNHh6axaWTF4x+TKAw9I7VL2GKPGKSX8cs
	brNtk7gt/ISAhEP5997Ng5CN8/OksWHzSwG5Emlp8kgvosETeS2PFOlEEdrPIUPrGI
	zJrA6CO6+/vjmmJZYxvRo/YcbX4aIPmtMjAibc1KzcFS5Um0YTe28niu6lBisBDrh7
	7BIhtQAN1NFxw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id AOGrGiniYgSH; Thu,  4 Apr 2019 17:47:58 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id EABB21D3246;
	Thu,  4 Apr 2019 17:47:57 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  4 Apr 2019 21:47:43 +0000
Message-Id: <20190404214743.9827-4-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190404214743.9827-1-jonathan.rajotte-julien@efficios.com>
References: <20190404214743.9827-1-jonathan.rajotte-julien@efficios.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] lttng-tools: lttng-tools works fine on musl no need to remove it
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
X-List-Received-Date: Thu, 04 Apr 2019 21:47:57 -0000

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 1e06e7fb6c..3fd423c592 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -40,7 +40,6 @@ LTTNGUST = "lttng-ust"
 LTTNGUST_arc = ""
 
 LTTNGTOOLS = "lttng-tools"
-LTTNGTOOLS_libc-musl = ""
 LTTNGTOOLS_arc = ""
 
 LTTNGMODULES = "lttng-modules"
-- 
2.17.1


