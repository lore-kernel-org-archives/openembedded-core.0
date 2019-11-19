Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 524897F698
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 09:23:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47HL3H5jgDz8t
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 10:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574155404;
	bh=0gqSWoceZgrpq2RgBAApTQWoXBXUfTcJLq2oWDGYJac=;
	h=From:To:Subject:Date:From;
	b=GvJ89S0Mqxh4Lc+3N7tUjrn3VT0VgRX6hYzLmCc4iLWRL0+b5Q9VejsvgfC/jQ7vh
	U/R95cWe0uZK20dYh83M3s5overCTeUR3QqdqeURPLwLJU7r2HkylEjUb9GdEI87Y9
	RO2uKXIhPfaSQ+BjTa2hW0/7nJB5CQ9wYjz8dA9tezazYuXT14bZHm3mpiIOplmmqp
	Sr2K2AlbYjep3on0A/q/T528IukdPFOaL7sYJF74ItLn0Bax5BTxuquP/jhGNMWWPr
	RZZy5YFv6A09Q2aC7SDA+iqzXamKDojfX76vdqdA4PjEg7rA1fXVn93Rx5evGGbYBn
	XRY7FiWZmMn0LhYFKLmQI6Watyn0S0lpTg0ZWK3J8zkrqPQt5CRp1bSrb8EvwJOYR5
	JjVvM82VbfTAtYWw6mF8ZnNTsU8L79MUKastdwnvnPCcWUHrKEalhmOXG+0KOpbE2X
	suVm2M/M/flyMxW+RIz176hfOTmwo0v0+NxOmnFCAsAbqJC3fW4u9qWwWoQRQXD1SV
	VBRkfWt7v0M0ktL8DW0fmT7ZtxeDe1bMJr2qvCTr7zY1XSqzEII7cozx7JJ7VpHF29
	wn0WjYurQEdxvNaPTiRmB38KH0CjnjuECzEKYBiho1Pvcd5xd4HfNg8TtCc8olqOit
	rF4ecNFBwASOlZ0PGGBlDJUg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 11:23:21 +0200
Message-Id: <20191119092321.12043-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH] lz4: Whitelist CVE-2014-4715
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
X-List-Received-Date: Tue, 19 Nov 2019 09:23:25 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index f0a8416a96..ed4452c82e 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -18,6 +18,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
 
+# Fixed in r118, which is larger than the current version.
+CVE_CHECK_WHITELIST += "CVE-2014-4715"
+
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
 do_install() {
-- 
2.17.1


