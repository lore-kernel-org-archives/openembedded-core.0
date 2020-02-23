Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F003061732
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 17:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QXM330CTz2J;
	Sun, 23 Feb 2020 18:32:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582479135;
	bh=aceWBoQYTQWKftZuIqTA/yzuqpXF1yio/EaY4rR/jS8=;
	h=From:To:Cc:Subject:Date:From;
	b=PDTk7wD+ZF6G8xNaXRr27Z6BUGL83NMpLOV5x8pcPadBGOhUsoCO+7FLid9fvJVmu
	mqnJBRHncmV4xgTbIZ256i84Y1W2qGaRNfjlV54cUTi6uvIbGvqxVTNqFa0cAOfRRL
	vJhr7wB/ptCfe2zFe3Cbn8FV5r1yI783leFonVhdebkWlJ7EqowZPWHbL5Uuf8cDZQ
	pAngmCUKqxUjGHKXn8oZubWLDxGsdATKFm1q/HAmrJLVY1l5xuCFf+KpYKcuXvBccv
	biohwjymeaFJYu5gUcEnYPKh3VlrJFk9cwLId4WEdaqPpG01RlUsR94rWqYjTZSpHJ
	SswyS6ih3MbQTcW72uPvp7CdzRRCNGIMmrLHaBQhkQGRnT2kXwpnTwPK4vonwC5lmt
	XO1wwYMH5huOCklmqUPWezeTZr3DEAH/DJ0/prUGUZEG5297G865lmLHo1Lwg4LZzl
	ktWYEJ6FgdHFIPxLAG3YdCj3e6icfoHG/Wzw5SmEV2wwkSQBpxhknYEpNa8H98fQWD
	QBgSa7LAhu1aEUIUgRzGOn5iXJzaCVGZ7veOnpKi6ud3UwsGJHbW24NdE0xGhWThH/
	Tf+ZA5+UE12TX46ReywhyJSRjHzcVU9jLs1849B2C+Ea7/5aOdnT3xHL0n0618K903
	sU1DjinMxiX6tSDXCPn4Vggw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 19:32:09 +0200
Message-Id: <20200223173214.9487-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/6] webkitgtk: Correct from REQUIRED_DISTRO_FEATURES to ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
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
X-List-Received-Date: Sun, 23 Feb 2020 17:32:18 -0000

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


