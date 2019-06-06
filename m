Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 1702C6C0ED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
	bh=GOcVs08ppr6jj2B8nzfQ3ZzRSKzAzeZXTlDl2Kr/YG4=; 
	b=lVqEnKuayp5EbVYpuv3dVMPUrYFxKP6hECfbjADzV799N5wP7Hrt8eHIUtgUfDzrsuEeJEhIZdwJxnt+bBd/DhzxNFAJaBGy4ijvNVTrsvzDG2S/Zv9x8gBMjoqNQp7x3la5nnh+5Ag93WHAyux54hpD5dPGnl8QTOSFA5GHnAeJ8B9AcWzD5p3OO56DWG3r5sZczPZQh5wJ778HamRDBotiRzBO5wsgzeohZx7njQLMWBkP/ne+c6reY805f+dB72CTSNXvRDgHtKFot8jOmCw//Z5PNBZR3hNcwBKIwRB8mLHQIiVEpjaBsomKJcqRKtrPFKLHB7am7qZGui7PDA==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=localhost.localdomain) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hYqCt-00065y-FJ; Thu, 06 Jun 2019 13:05:19 +0200
From: Philippe Normand <philn@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 12:05:03 +0100
Message-Id: <20190606110503.3005-1-philn@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gnutls: Use the sysconfdir variable for the ca-certificates path
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
X-List-Received-Date: Thu, 06 Jun 2019 11:05:19 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Philippe Normand <philn@igalia.com>
---
 meta/recipes-support/gnutls/gnutls_3.6.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.7.bb b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
index 01dd23c961..b27526a64e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.7.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
@@ -44,7 +44,7 @@ EXTRA_OECONF = " \
     --enable-local-libopts \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
-    --with-default-trust-store-file=/etc/ssl/certs/ca-certificates.crt \
+    --with-default-trust-store-file=${sysconfdir}/ssl/certs/ca-certificates.crt \
 "
 
 LDFLAGS_append_libc-musl = " -largp"
-- 
2.20.1


