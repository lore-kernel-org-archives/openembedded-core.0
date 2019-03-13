Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD8F7C6FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 20:56:15 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 970D3182029;
	Wed, 13 Mar 2019 16:56:16 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id RE-5lO8w2Hy8; Wed, 13 Mar 2019 16:56:16 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 47F0C182025;
	Wed, 13 Mar 2019 16:56:16 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 47F0C182025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552510576;
	bh=+h6NGTZO/zq2PAnS04XSaLMZUrBe2WjdqVQYY0K1gp4=;
	h=From:To:Date:Message-Id;
	b=OZPKkFDYaExuQgl4nLqphYML1ZADin90EbOwGC+dbFoTpFZViN2qn+VF94LuRMnNT
	XY5yahrKpI1Ix4vzhHsX+7duIu+NcArwpi5ec8i5j5lzgZ5yofvomyxEe6Hd3t5IHK
	+FT/FBFyT9yylzA0JVd+bAnCBEJNovB50zIPNQ8DzAuJ7xaXB9oNhqFKsTMuYZttMY
	EsXDoHy9orphfeeQoOWSXxZ0hdUL/X8bOzyyBBMLiRdiXOLM6P4/a526pIRrr3H3p+
	ggG+Oan8y8gEi9OtoNdRbPUgjyDoj+d3Y5cYh3lkiuJdRik1WYdw/ukv4c5/MZeL3u
	iyWNLo30yUhuQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id obGTaL8ZNXGg; Wed, 13 Mar 2019 16:56:16 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 1972E18201D;
	Wed, 13 Mar 2019 16:56:16 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 20:55:55 +0000
Message-Id: <20190313205555.10007-3-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190313205555.10007-1-jonathan.rajotte-julien@efficios.com>
References: <20190313205555.10007-1-jonathan.rajotte-julien@efficios.com>
Subject: [Thud][PATCH 3/3] lttng-tools: update to 2.9.11
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
X-List-Received-Date: Wed, 13 Mar 2019 20:56:15 -0000

Update 0001-Allow-multiple-attempts-to-connect-to-relayd.patch chunk
accordingly.

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 ...multiple-attempts-to-connect-to-relayd.patch | 17 ++++++++---------
 ...tng-tools_2.9.5.bb => lttng-tools_2.9.11.bb} |  4 ++--
 2 files changed, 10 insertions(+), 11 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.9.5.bb => lttng-tools_2.9.11.bb} (97%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Allow-multiple-attempts-to-connect-to-relayd.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Allow-multiple-attempts-to-connect-to-relayd.patch
index 62a0978592..0998fc3860 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-Allow-multiple-attempts-to-connect-to-relayd.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-Allow-multiple-attempts-to-connect-to-relayd.patch
@@ -16,17 +16,17 @@ Signed-off-by: Mikael Beckius <mikael.beckius@windriver.com>
 Signed-off-by: He Zhe <zhe.he@windriver.com>
 Upstream-Status: Pending
 ---
- src/bin/lttng-sessiond/cmd.c |    8 --------
+ src/bin/lttng-sessiond/cmd.c | 8 --------
  1 file changed, 8 deletions(-)
 
 diff --git a/src/bin/lttng-sessiond/cmd.c b/src/bin/lttng-sessiond/cmd.c
-index 73b4ce3..36f62ee 100644
+index cf30b8e..cc41a48 100644
 --- a/src/bin/lttng-sessiond/cmd.c
 +++ b/src/bin/lttng-sessiond/cmd.c
-@@ -689,14 +689,6 @@ close_sock:
- 	free(rsock);
+@@ -945,14 +945,6 @@ static int send_consumer_relayd_socket(enum lttng_domain_type domain,
+ 	 */
  
- error:
+ close_sock:
 -	if (ret != LTTNG_OK) {
 -		/*
 -		 * The consumer output for this session should not be used anymore
@@ -35,9 +35,8 @@ index 73b4ce3..36f62ee 100644
 -		 */
 -		consumer->enabled = 0;
 -	}
- 	return ret;
- }
+ 	(void) relayd_close(rsock);
+ 	free(rsock);
  
 -- 
-1.7.9.5
-
+2.17.1
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb b/meta/recipes-kernel/lttng/lttng-tools_2.9.11.bb
similarity index 97%
rename from meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.9.11.bb
index 0314b53637..5e3fc1aab2 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.9.11.bb
@@ -34,8 +34,8 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            "
 
-SRC_URI[md5sum] = "051224eb991aee07f8721ff1877d0b96"
-SRC_URI[sha256sum] = "77839eb6fc6c652125f08acfd9369701c2516eb05cc2084160e7efc7a3fb731c"
+SRC_URI[md5sum] = "f9c2b35810790f5bd802483eb14cb301"
+SRC_URI[sha256sum] = "2c45144acf8dc6fcd655be7370a022e9c03c8b7419af489c9c2e786a335006db"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.17.1


