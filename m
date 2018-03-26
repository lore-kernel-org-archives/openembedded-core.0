Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 76D16784AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From;
	bh=C6E172ID9pDIrqbulk0hWH6RxJZO+aJNUhkthDXE2gE=; 
	b=ao/BusQqKIewTq5vmgXtMT/ip2DLpvxendOpO68YO+gYuG2eaWSQrP1fbtrdmwZu97MDdHs2v09h+JFurqs+GXC26PPw3KkZltEp51vBPzry+E9rQ+5/bvZRBrs3QqcoMVgfdZlWea1CraCzg2DA3BTT3/if332LkleDwv3+1CXetrQU7qgrwTysnKrpf5YbFwYUf8LRmbT08nfyQP0oUISE920VxwwSHZ6FfuZ4eaqilkgxfsehOXNpKMN6jYgOmA1Dz7d2UZAIFpAPoezaWAIhJlvH+F/jehkIVRTkZ5iTnjJ+MeWW8wR4gv90gL8qpAk3k/Dnclg1+rDN+VgMAw==;
Received: from [91.232.154.11] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1f0Qlh-000091-JT; Mon, 26 Mar 2018 14:58:30 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1f0QlN-0004cg-Hn; Mon, 26 Mar 2018 14:58:09 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 14:57:58 +0300
Message-Id: <1522065479-15840-2-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1522065479-15840-1-git-send-email-mikko.rapeli@bmw.de>
References: <1522065479-15840-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on mail
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_50,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_NEUTRAL autolearn=no
	autolearn_force=no version=3.4.0
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH 2/3] ca-certificates: change SRC_URI from Debian anonscm to salsa
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
X-List-Received-Date: Mon, 26 Mar 2018 13:01:22 -0000

Debian anonscm service in Alioth is shutdown and thus
fetching ca-certificates sources fails.

https://wiki.debian.org/Alioth

"Alioth is broken, and there is nobody around to fix it. Don't ask the remaining people who give it life support to implement fixes and changes. It is being replaced by a cocktail of ?GitLab (see Salsa), read-only repos and keep-alive mechanisms. See below for more information."

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-support/ca-certificates/ca-certificates_20170717.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
index 51af72e..49b7ffc 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
@@ -16,7 +16,7 @@ PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
 SRCREV = "34b8e19e541b8af4076616b2e170c7a70cdaded0"
 
-SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
+SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://update-ca-certificates-support-Toybox.patch \
-- 
1.9.1


