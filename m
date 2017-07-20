Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id DC874782E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=78/XFV/8AIQH+5isogccsT8MQwhIKfOmuNoutG0RZkw=; 
	b=JnanoPgJzO+mI4KWOaLNK1Xm5B+tfmDELgQqDkA4lYPOxXxd9pnWEiPkd51HaWQijf4gu/N2voLQwiOR8cuCZNiCZ+bG90wbKWpvsgEhCEmvI3s6tn37uPfeCIbSzH1klCzyngVLXGX0vu8UjL3PATPPGQSZ5m/9ovsxbNznByCk07tg31I1P58qGpgiPYAMJKIlY/MD+BtoseV2dfmKuHiG3821dqJVH4sepnKdaTabX+Z9mJGexQVpc38Z3WewgNAhz3VtlLS/u0Hu1DD8T8ZT0QLNirAl83LP3ox0uJuX/Y6IbylqbfVao9Drnh0AEonxl6JuBvjoABSMFdwniQ==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQM-0005M9-SB; Thu, 20 Jul 2017 16:23:26 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQM-0003RL-Qu; Thu, 20 Jul 2017 16:23:26 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:22:54 +0300
Message-Id: <1500556991-11471-7-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 06/23] flac_1.3.1.bb: set CVE_PRODUCT to libflac
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:27 -0000

NVD uses product name libflac for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2014-8962

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-multimedia/flac/flac_1.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/flac/flac_1.3.2.bb b/meta/recipes-multimedia/flac/flac_1.3.2.bb
index 8a7fc5e..8315ab5 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.2.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.2.bb
@@ -19,6 +19,8 @@ SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
 SRC_URI[md5sum] = "454f1bfa3f93cc708098d7890d0499bd"
 SRC_URI[sha256sum] = "91cfc3ed61dc40f47f050a109b08610667d73477af6ef36dcad31c31a4a8d53f"
 
+CVE_PRODUCT = "libflac"
+
 inherit autotools gettext
 
 EXTRA_OECONF = "--disable-oggtest \
-- 
1.9.1


