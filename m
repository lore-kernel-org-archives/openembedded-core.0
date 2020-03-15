Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9D584605AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 18:08:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48gS9P6xCJz3w
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 19:08:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584295722;
	bh=btBx9uPYepQeMhp1EX3/JvjEk59YUNpajRxDjr3BkyE=;
	h=From:To:Subject:Date:From;
	b=qMaCmVS2qce95eF2QIK/jtUrNUG3vfmxZNMdjW8zFzzfl0ETMGJ84fz3S+nUnbRNU
	Apa4a2gO09DSXfFaUEC5jjoTBqSVBjLwzIYkttvoaaQeXLz4pOR89c2HzwnhXuvg+o
	uwcN16Ol8uPDQDo3VfGlfhRp6euP+sQuZ2/jUHdeW9KrLuma4yZ/zaVnHV60+bjgE7
	KrG+AXFAzbh69mPOChixsCGqjuxqO9B6lTs0RwiBw6UTilfcStBJabCD7U0W5Qdz+I
	hWkh2F63O+IXLMuumXZXdidNcNBX0lV1jqxdRTdTcVwKMVfsssvGoqcmq0iWoF4Vrk
	1LSW5aQL5YSEvuygNqW0cnL27X5r3z/yvL0q+nv2f2kOVP9FRsUdSMcENbMP3HfxvN
	9z942gp0p9NhbgNXn0i0Mm9NJ8oqmfR5iO+JIFveWu2rfn8FyeTqqYROqNwu0pHAkM
	DWyGEfjdJihJoE3XmZkngx9/fxQOr4gVXPqEKTtsSPgdtvB+uevTxNqjAJWNSLAqwV
	ju+yqocoo7lKZaA6029lnd+A4ruYjlLKjslnUmOlRd2iTSFzb8RDivbdC+0cV1fF3N
	UJOtEe6aSwqcURp3/+XVVfpcoaIPmbUXBDsWqemGcojO+4sWazBPnqf54SjzxORAQ+
	yzhtQoyllRdC/olPbXDqnfkQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Mar 2020 20:08:40 +0200
Message-Id: <20200315180841.3730-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH 1/2] openssl10: Add CVE_PRODUCT
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
X-List-Received-Date: Sun, 15 Mar 2020 18:08:41 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb
index 87df4f517a..7e2b884856 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb
@@ -60,6 +60,8 @@ S = "${WORKDIR}/openssl-${PV}"
 
 UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
 
+CVE_PRODUCT = "openssl:openssl"
+
 inherit pkgconfig siteinfo multilib_header ptest manpages
 
 PACKAGECONFIG ?= "cryptodev-linux"
-- 
2.17.1


