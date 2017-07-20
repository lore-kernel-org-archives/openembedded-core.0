Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id EA14760069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=JCcV7uGFqiFpDYGUN7wdYIBslWiWuXU/MT7lRNApXoQ=; 
	b=qOOdIuqP9X0WMBm01zPijqGPUyE492BMBQFK11csXK6fO5XujZLbuEhxYzOBaJFkr5r/rg0yO7/vZHEyF7h8YU6rrWRRZWQU5q0qMNBHAnY3FX3lN55l9C/1fvgwnQDpdtnEKlsqbAkCUelDq1tpHDQ0kdDBsP/ky2QdNy6dPgog6BpHLPFEGXkORQ+93GsJrPGCFKDC24RF/WdiMbY+OPJsw+aiaUHRukHrXZfcxjGee9LpSqnQnNUfnqk/Cz+peq/XWYvJeSoxpjUGiydPCuSWNJnPhc5tGJ98BhZ/dZwXcSXuoaCbmmo9+7CRT7CXF6URmJML4zyylR5EjzSLgQ==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005N3-4A; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQN-0003Sf-2g; Thu, 20 Jul 2017 16:23:27 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:23:02 +0300
Message-Id: <1500556991-11471-15-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 14/23] libsndfile1_1.0.28.bb: set CVE_PRODUCT to libsndfile
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:28 -0000

It is used in NVD to CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2017-6892

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 6f242cfa..e6a92a2 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
+CVE_PRODUCT = "libsndfile"
+
 S = "${WORKDIR}/libsndfile-${PV}"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
-- 
1.9.1


