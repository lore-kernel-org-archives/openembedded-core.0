Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 0F87878202
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=+WWeLIMdcdnD/wc0aNCRXxKOkS1XqOkU2jfnWbIuBl8=; 
	b=B4j8ysyApmFva1pZ8Uw6WQIyxp9+ycKwo/ydXWgpOoMmu6tXC8m+fSQcpghoLHSPXxj6y50jc85ZeYpBXiRIVdOEAtVm8sfCTnUiKGcH4i8rPC/zF4auG76ZCcN/49ziUHGinlVa97RvLbmH/s+OGVDsGoz8z1mJJvllK2rmU6phDRqn8bP1fFYKHlt7KvwR0fPR5il/4BQn/ZHfHIVzHMxouRZuQwKwIgcBcr5NHhYUYFf4ncWq7ilW1BG5RHC03UOn/zyAfjRPFYFq5QhnDHNvQzP4br6d1l0RiH+ZKh1MuW+Gyh8EwuEl7/bv3v6pWSz3iuW8YmBAiFhMWby4Ag==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005NJ-7L; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQN-0003TY-5v; Thu, 20 Jul 2017 16:23:27 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:23:05 +0300
Message-Id: <1500556991-11471-18-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 17/23] lttng-ust_2.9.1.bb: set CVE_PRODUCT to ust
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

It is used in NVD for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2010-3386

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb
index f7e01bb..03da4ca 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb
@@ -26,6 +26,8 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "5a5636fc3d9aa370f65b25a802a79e6e"
 SRC_URI[sha256sum] = "b891d267cdbbbd11cf34751f66c21c4a7fdc0eec3c1b53be2c40dca073b7daa4"
 
+CVE_PRODUCT = "ust"
+
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 
 do_install_append() {
-- 
1.9.1


