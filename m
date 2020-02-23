Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F320B61749
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 18:29:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QYdD0c7zz5k
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 19:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582482576;
	bh=a0YcOzDkeo8rpRfcGTojTHUJ6cEzNDnWDRj8Uwthjns=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QnfHFz1/wcZplfZ6DKRvxM2mWIuthzCNWJ9zrOahUwCo72udYiOoAncmcHJrqyoxR
	2GkbGNdzneifArhMt7ufTzhI9JJxp60x3ZksqhwlVOu9DGhhrQAvQVkPWHuJBHqyl5
	P1mRdpLI6FMCt9wQoen7CB3FgTijLnR7Ub7PncyBUkLwJMijUemrMYgqU+Kese8kSI
	nc9KSh+IaOQpp6yYc9GS4kn0qXmVOTpZfeM9/n3oxKrdrEAS+vC+urP/Vgyjp1fSWC
	kEubllmKckfkvhz+OccGtsDcrs8jpNpj4glGWcloLYMDqZgRBzK/YgGBwlN0dMmfqo
	3kOQwPupuCDq+BSuB5en0N1cXMQaU2omsQOZVRsJu1JDbkc8Ty24nEeoR2jlUqBPV7
	qyaEwkNc+YyMvRYaybNJCiRbZAYJLkPHx1kuYLaFp0PNfVf42W5rkC/uaS80c0tx5P
	u5H62QETktF19CCFbeB6jqZjwyN8/8SaxZ5RoyrU0yMOFkjwCqshN6GKeY5TY2kFpz
	GvDV7ZL6OhVTROJpnC5MwF1bevXB+WstKp7YzGUCF46wlgjq/wZtzUSM7fEdiu6WbA
	YMBNwkNmIKhRRCP27oj6q7C6CzTI5d1PXnduJa0lWXIlRK2Xw4RsT76x867WHFSDJ0
	33yE95QavbrvjDh1n6DiOCZg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 20:29:31 +0200
Message-Id: <20200223182933.6168-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223182933.6168-1-bunk@stusta.de>
References: <20200223182933.6168-1-bunk@stusta.de>
Subject: [PATCH v2 4/6] webkitgtk: Remove the unused DEPENDS on libidn
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

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index a9c00862c3..7b3d16d8cb 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -30,7 +30,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
-DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
+DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libgcrypt \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
 	   pango icu bison-native gawk intltool-native libwebp \
 	   atk udev harfbuzz jpeg libpng librsvg libtheora libvorbis libxcomposite libxtst \
-- 
2.17.1


