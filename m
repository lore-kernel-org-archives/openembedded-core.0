Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE99608AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 14:08:08 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1j6xCB-0006tf-Nf
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Feb 2020 14:57:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Bpo4bBxEV6zoRsYaH4M6spC4s+u8BC2BJ9CMumZvjo4=;
	b=VXS3Gp7+ouZiSfGXNjwWNRij37
	PqgjJxWMImEk+gJXrYIObs8L7cMaIHst9xIljyjHgsB6rNvIa6NTsMi6MCYAQDjHs6l5Wj/vzm55f
	z84/qBfKI4NqWye74C9lDhkFWLdlb3gsLI/OqxxGF7QF2aH83jyC8IDtBdcYJg127PVE5gl1uoUsw
	8ciPrbtpN8ZdxUuiAHP/o0Z9O3HYCJBg2AMoDXyQN47+8BpCSyVBwJt3QhNp87OeqB9IejvjcN8K0
	aIsNaFpsyJTq/qhoskzcj/KM1GXThbM2i3su2brinfYcD01M5jBbE5oWejuXJGrwdGhuveG9TNUdR
	Sx1+HRUA==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j6xC7-0007hR-HQ; Wed, 26 Feb 2020 14:57:49 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 14:57:16 +0100
Message-Id: <20200226135716.49255-5-zboszor@pr.hu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200226135716.49255-1-zboszor@pr.hu>
References: <20200226135716.49255-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Scan-Signature: 9c5e05eb7b369c1b31c27083e129340a
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200226135749Z
Subject: [RFC PATCH 5/5] mesa: Enforce TOOLCHAIN="gcc"
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
X-List-Received-Date: Wed, 26 Feb 2020 14:08:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When meta-clang is used, for example to build chromium-x11 from
meta-browser, a linker error occurs in Zeus.

See: https://gitlab.freedesktop.org/mesa/mesa/issues/2533

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 800e8813c7..b8f09a2ed3 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,6 +24,8 @@ PROVIDES = " \
     virtual/mesa \
     "
 
+TOOLCHAIN = "gcc"
+
 inherit meson pkgconfig python3native gettext features_check
 
 # Unset these to stop python trying to report the target Python setup
-- 
2.24.1


