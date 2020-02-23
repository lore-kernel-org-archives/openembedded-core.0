Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 00D6D6177E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 18:29:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QYdB45zPz3K
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 19:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582482574;
	bh=aceWBoQYTQWKftZuIqTA/yzuqpXF1yio/EaY4rR/jS8=;
	h=From:To:Subject:Date:From;
	b=XHWtYyyYyrPRnhVB1yQDnGako6ieumrM8Df+8P8pBft0xdb298Y3Qk7APcIDI0P7a
	dWva0rzJ1pErNuQvRd6spD8Lsy/oaI5esWToznwZQO2Hpe2t/VHJq5R+M+lJg9q2O4
	Sr2PezNHtdo6bS8VtW9ei1Cta2dY3QnxKTy8vxiSzJ0vPCIwqrthKoRg/hRSQd0xjq
	RnOFFN/1Il0DCEJC0D5HJdAjSyNR3WddcVh5UT/o8aOAkK0Uqwra4PtV1/0TnrcdUd
	WYmBKwisoNZ+j0mSDOUY1e/pWKZXTnWfMYNEkoQ49DuSAgRe7vzoj0YW3fXOH9SB9d
	YTFwCEa7YNBpcIX7rT5TuCNlABoemYKb5Wq94wc10zhbJTuyaULcLEVHjR+q8p0HMe
	lndLdwv5FIpLN6D1RruYMDUGmEIalXLNeL1i0A+ukdQW5s6hkDHxAa7sNUkzmKFrTE
	i68ZUoRTDpjlmBDo5zjvwmdzxtHbfNo8tkn93xHSzGPDlpJUKB4CAn54UiIAELZr0N
	/fIc3kF1pTihJ3U9c6eyDdD13Oe28nRFLxVfCw4cHwbVc6+sF0mEsO6NSnTNOrJqgK
	pb41QA0Y6LSrWn0SRCBfP23G0Kusn5jRixZrKWgEzrq2eTNk1Gl5plXzQ164syze/O
	O40fpQQC4AWyaHxH5tnS1ONo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 20:29:28 +0200
Message-Id: <20200223182933.6168-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2 1/6] webkitgtk: Remove unnecessary REQUIRED_DISTRO_FEATURES requirements
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
X-List-Received-Date: Sun, 23 Feb 2020 18:29:37 -0000

opengl is optional.
x11 can be replaced with wayland.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index a48a976f94..51fba94964 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "4386900713dfadf9741177210b32623cab22562a79ffd0d446b6656993
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-REQUIRED_DISTRO_FEATURES = "x11 opengl"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
-- 
2.17.1


