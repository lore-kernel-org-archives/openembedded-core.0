Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id EED287E3BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 22:06:59 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 168EE1E51E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:07:01 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id pRsorK2KZ7x1; Wed, 22 May 2019 18:07:00 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id B04171E51E2;
	Wed, 22 May 2019 18:07:00 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com B04171E51E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1558562820;
	bh=Zgj2XzXozbER2JTfxlA9DTq+BVjPcb3E3jmRHGhe4wE=;
	h=From:To:Date:Message-Id;
	b=dEX2CFSlALRwHMXkPhEJoSCiknmvDVUashtnZldBZSfu6FFK0/33sNVijEazZGUGy
	bQwHoW7cCN+uxXf+cdiXZaRnXwXTRwkctKVZyq4bz8mRzHsmEtOJxZByja1ULN3SDK
	Z5kom4/n7HSy2wZ5OOC/k9xtSUnEeO0zN/xckZ3+G8FCvYC2G3r99PPQslql+OOi2+
	sb8OUAlb3RmfqXjIFKTvVvI0fb+aWRV9P9lc3Hk8azYB557/l9Cr9B8qfk5veWETIv
	0uFBg29XEMW0vmlEkI5JLRt/s+PwoOSpcH1C+viS+n6Di3LqMwb5xQTbraQdWc4iKY
	hMM6LU1dt7Lmg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id j9TJSNvG3LBe; Wed, 22 May 2019 18:07:00 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id 8F7141E51DD;
	Wed, 22 May 2019 18:07:00 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 22:06:45 +0000
Message-Id: <20190522220645.4412-2-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522220645.4412-1-jonathan.rajotte-julien@efficios.com>
References: <20190522220645.4412-1-jonathan.rajotte-julien@efficios.com>
Subject: [PATCH 2/2] lttng-tools: add lttng-modules to ptest dependencies
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
X-List-Received-Date: Wed, 22 May 2019 22:07:00 -0000

The lttng-tools project is essentially a "tracer" controller, the tests
depends heavily on lttng-ust and lttng-modules presence.

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index f1bb7224f3..7e80bb45d1 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
-RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps perl-module-overloading coreutils util-linux kmod"
+RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"
 # babelstats.pl wants getopt-long
-- 
2.17.1


