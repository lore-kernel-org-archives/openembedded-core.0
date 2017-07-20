Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id B0102782DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=r+FURyQM4g3nHN9jt7BI8KIFlpbUf4pKH+AW/D/+Z5M=; 
	b=SPOWK+77KcwxfZEB6zQoyTn7s1Qwpkgcso8tgRnfH8vK/TR2f1bgICQLDEz+I7wdCZjnOrzm/E7c9hmpZvlkZCzcg0MEHBCly9r6fwmPYgnIR1oiZADgRDZb7cj0BviX10ouy7FRVN0eihwRIVvrN3BsDD+4NS6HzFwu6e4kZq5drpOE/LTifF/mcZ3hlyWbJAZZ2hUZ5AFlIpRksOqrYLYFxG3tjXEeos+e9w1f5Kd7GrCwuNq9YTtZjg9i3Bg5s0wsSlGFKV7Etdb6UGqIOV9PiVnuPDkrYiVwCGw/4or9WAQaJ0/LySeFvkjaDvLB9E8RKIE5Sjpho2kw7SWtlA==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQM-0005M5-RP; Thu, 20 Jul 2017 16:23:26 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQM-0003Qr-Q6; Thu, 20 Jul 2017 16:23:26 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:22:53 +0300
Message-Id: <1500556991-11471-6-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 05/23] eglinfo.inc: set CVE_PRODUCT to eglinfo
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:26 -0000

Upstream is called eglinfo no matter how the recipes are named.
There are no existing CVE's for eglinfo in NVD yet.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-graphics/eglinfo/eglinfo.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-graphics/eglinfo/eglinfo.inc
index d0c0c27..8e7d9bd 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo.inc
+++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
@@ -11,6 +11,8 @@ SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master \
           "
 SRCREV = "4b317648ec6cf39556a9e5d8078f605bc0edd5de"
 
+CVE_PRODUCT = "eglinfo"
+
 S = "${WORKDIR}/git"
 
 inherit waf distro_features_check
-- 
1.9.1


