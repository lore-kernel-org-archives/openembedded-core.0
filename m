Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id A2AB67E3B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 22:21:46 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id E88BE1E5748
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:21:47 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id clZeSM_hL6m5; Wed, 22 May 2019 18:21:47 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id A93E81E5743;
	Wed, 22 May 2019 18:21:47 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com A93E81E5743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1558563707;
	bh=Zgj2XzXozbER2JTfxlA9DTq+BVjPcb3E3jmRHGhe4wE=;
	h=From:To:Date:Message-Id;
	b=scwd7PfcD46e542Bt6VyJEn/lZGHhUV6k+JuV56FEvc6ALV/wKwXn8wBU5ZKqBHgX
	EzASRf7cxTUtKx5fm8Z3vhDQMis/kQz+SIDSQ4ua7SjyUyAsSPGMZ2G1K+DifoerwF
	KonLDqiDv2ft09K7AuEqU5wwGX8W3Q89f0+7X5TIRqvu/tuEbnXyOT1jQ/Jwlh1Nb6
	JN32v1sDVPOzkwuCXaVySG5AxKG6WWH0E6JabQzLY1lyiwhB5RTzE5kgkvu550zGL+
	5G0L7HuvgO4i36wJFEM0FNEfyfWMiKYXdL9f+aAy9Bu3pe6TlNVddpPAa8F1XZDNrx
	sybOroCqV+FTA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id GXrBrkIvCVLF; Wed, 22 May 2019 18:21:47 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id 8AB1F1E573C;
	Wed, 22 May 2019 18:21:47 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 22:21:32 +0000
Message-Id: <20190522222132.25731-2-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522222132.25731-1-jonathan.rajotte-julien@efficios.com>
References: <20190522222132.25731-1-jonathan.rajotte-julien@efficios.com>
Subject: [PATCH v2 2/2] lttng-tools: add lttng-modules to ptest dependencies
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
X-List-Received-Date: Wed, 22 May 2019 22:21:46 -0000

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


