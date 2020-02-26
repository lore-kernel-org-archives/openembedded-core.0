Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 418 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Feb 2020 14:04:40 UTC
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id D801060B54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 14:04:40 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1j6xC5-0006pR-Q1
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Feb 2020 14:57:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vos9rRJInu3xv6dupzBbEjgX0bm9dQkhYsagmn1dREs=;
	b=lIyyxtdGqvlO2ClQi38+dajxhE
	3f2Bh2MOGCBnhitjh/dqzk6Yx4NjZVV1APx11n1NUtNSlYUlGpv16R+s40makCgF8SpUXIxswTf0W
	QiaWyRDh602YTSKwgv9+Vth5xloJMS+BnwXUiFhp6Y9V5UTAxApGYbOZYTYa2qXW1M8LmKuvQxmDE
	Ol5Q13iHK8c+8/EXcFgh6uXt2UWFGx4+ZimF6/bnSnGcbIXhkUBhPUWlz2z8okvwqoHT81aFuZaRN
	eA8GfwD1hVDAn3feFicOO5jcwBqFQKvNWehaJUSly0qYSoLyKavL08xb2UMF5b16Yh8d9Qdk313q6
	apNwYXsg==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j6xC1-0007hR-C9; Wed, 26 Feb 2020 14:57:43 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 14:57:13 +0100
Message-Id: <20200226135716.49255-2-zboszor@pr.hu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200226135716.49255-1-zboszor@pr.hu>
References: <20200226135716.49255-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Scan-Signature: e09cf10a2f761ea532ffadc65ca3e0bd
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200226135743Z
Subject: [PATCH 2/5] libva-initial: New recipe to carry only pkgconfig files and headers
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
X-List-Received-Date: Wed, 26 Feb 2020 14:04:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The package name exploits sstate.bbclass so it's not added as
implicit dependency to packages.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 meta/recipes-graphics/libva/libva-2.6.1.inc        | 4 +++-
 meta/recipes-graphics/libva/libva-initial_2.6.1.bb | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libva/libva-initial_2.6.1.bb

diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc b/meta/recipes-graphics/libva/libva-2.6.1.inc
index ca1386d80b..5b1cdee7e3 100644
--- a/meta/recipes-graphics/libva/libva-2.6.1.inc
+++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
@@ -17,10 +17,12 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
+SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
 SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
 SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
 
+S = "${WORKDIR}/libva-${PV}"
+
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
 DEPENDS = "libdrm"
diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
new file mode 100644
index 0000000000..828ef6fbca
--- /dev/null
+++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
@@ -0,0 +1,5 @@
+require libva-${PV}.inc
+
+do_install_append () {
+	rm -f ${D}${libdir}/*.so*
+}
-- 
2.24.1


