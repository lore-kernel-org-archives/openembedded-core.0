Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id D724977DB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=aJmnmjDeOW1tvyFrm3M136zp86Zq6AGwogm7WA6FObM=; 
	b=Nrn2ufjNBKWZxw+/ELGVLz/nDINcUXZ8DUL/TDwkuK3k7IcBkJ1kK4q/pWdWa28lBsrxVy5uPUEAGAk9R9DVMQAxxHCF2VXRaulIZmxYL+cJRMsEwFBOxqhVSxnWC/FJ/dKRPeCUU5Zf5woLs4geDAPZTYiNabcDKqcx6MeQDd5tytQy1qRkzdBR32KPzK9ohbtd82UuN2ty09nsjnSEgzxyb83IT4YRqDMBqpWyDCcp2bIIyE8+9nHb7tb6K3USOfL5anV0jpA7GKZ5txfH1g0+Gi7rHVWct/GIo+GjifZ56LElnAyV8We7tWWNvJwR7C//E7OXJMNRt6tnegNpDg==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQM-0005MN-Th; Thu, 20 Jul 2017 16:23:26 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQM-0003Rb-S7; Thu, 20 Jul 2017 16:23:26 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:22:56 +0300
Message-Id: <1500556991-11471-9-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 08/23] glib.inc: set CVE_PRODUCT to glib
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

NVD uses product glib and vendor gnome for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2016-6855

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 4a145ae..d6ef4df 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
 
+CVE_PRODUCT = "glib"
+
 BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS = "virtual/libiconv libffi zlib glib-2.0-native"
-- 
1.9.1


