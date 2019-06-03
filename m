Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id DBFC97D67C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 21:56:49 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 47BBB1E9D2E;
	Mon,  3 Jun 2019 17:56:50 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id k3foU9C4jKJn; Mon,  3 Jun 2019 17:56:49 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id B3AB01E9D29;
	Mon,  3 Jun 2019 17:56:49 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com B3AB01E9D29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1559599009;
	bh=Ts1OTnIbNBO8bjDxUwMz7roe2WxEqn+lzLPeWvmsqgY=;
	h=From:To:Date:Message-Id;
	b=pTaQejUNXTzwFNPDFcGOmC+vbOZI8dSrAJq1YQl2+TUhE69RvHZ7pJvQ8OFCG1eai
	OqK1ppu53/PV4H13gLGzN3uu0WJNpbdppNMSoc8uls4z67QbjWnPFbzK9KHe7aFGQe
	PwSbV3gnoWwNx4PG3RDXhVr1oIejnWDTEGIfidH/FgBewqVJsGgHrohlYGmTih/qcQ
	iYKqWgqXqTx57eqqa501xTUL4ljFKPyR9Ln51EYDPIhKN8txunkwqe96ZIRAuHXfV/
	hUXdDxsdM8ryscEC9WuSpNjesFtVr4Eo5kNpm3BdG2p8T9qVtG+hJWr0OTxdayvfpx
	kjpR43OA+Z9Eg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id dpiPHMeKCL8f; Mon,  3 Jun 2019 17:56:49 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id 8E66F1E9D24;
	Mon,  3 Jun 2019 17:56:49 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 21:56:43 +0000
Message-Id: <20190603215643.8929-1-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] liburcu: update to 0.11.1
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
X-List-Received-Date: Mon, 03 Jun 2019 21:56:50 -0000

0.11.0 contains a major bug regarding the so versionning scheme [1].

0.11.1 includes the following fixes:
        * Fix: SONAME bump to 6.1.0
        * Fix: urcu/futex.h: users of struct timespec should include time.h

[1] https://lists.lttng.org/pipermail/lttng-dev/2019-June/029020.html

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 .../liburcu/{liburcu_0.11.0.bb => liburcu_0.11.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.11.0.bb => liburcu_0.11.1.bb} (83%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.11.0.bb b/meta/recipes-support/liburcu/liburcu_0.11.1.bb
similarity index 83%
rename from meta/recipes-support/liburcu/liburcu_0.11.0.bb
rename to meta/recipes-support/liburcu/liburcu_0.11.1.bb
index df41ffc73e..6a517e6f29 100644
--- a/meta/recipes-support/liburcu/liburcu_0.11.0.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.11.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "102184afa99e64e3ecefb320092ac1e4"
-SRC_URI[sha256sum] = "1af5694c4f6266f4eba5eb4b832daee600d1e7055fce6da5d514d735d72eb3e7"
+SRC_URI[md5sum] = "91c75d5902127f94ab556ce039b369ca"
+SRC_URI[sha256sum] = "92b9971bf3f1c443edd6c09e7bf5ff3b43531e778841f16377a812c8feeb3350"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.17.1


