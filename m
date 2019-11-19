Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 515777F685
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 09:23:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47HL3H12tgz9v
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 10:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574155403;
	bh=sedMUyhhOsxuj18xLdFDhSOjumrvvt4WW7HViLn6AKw=;
	h=From:To:Subject:Date:From;
	b=YSG1CZfF9f7HP3et8PVRBzikI5LvmocgLScvh+oHTevqDaR7NkYMjG6Kcu4FMyBcS
	cbinAIxXYq87enCwroKYYQA35W5EhRFkMOr8Z0RwHpWxgUCDTuyjUkgXx1CEB6+7Yy
	Hwi5BL7+zLUJxXyoVc0wFhGGyGRTuI0D1Bt5R+22RwpiUUe42qmAkx00Psb/hME6Qw
	Hem+y1181VmtC1+Uhff91wLMWTtxk9UvwDB1b5e5JXBKBt7kMLhd59JQrGOGuvTXxP
	8VubApOXv2nm+lEnnD15UPtbmGIrciqT/ng7TVrn/CITy/nn6Nz+m6T+lIQjTvusTr
	zt1BcfY/JDlYLsSM5eyOIg6Uz9IGMDLq7XrJg8wLjCpurkunlhGlwswwcHvql7QZE7
	thqkLgD+1DK1uSDXX27FU7yhlmwXturRRH9M5ryHsb6sIMfG1T6IK1/t76TBg1uxa9
	NKHo5qBZOjIfR76VLIk1O9Dz4/0DkzuWSRevl8jx+R4ZyL/quAEFzECkHksskQOIlW
	wfQ2Tlzk6FziS4PqkfkZJec7f6Zjsi9Siff9yTPnwAQ4NIQfLLoP/1cHa85YaFvbuG
	y33EDUpzbXEtIdXKHFauJaTv55BZbUBRwjUKrbl9UyF4ee4/dOWn7Pk3QB8nhbQthD
	FcP1vn7KRhulCLaDLBKK03l0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 11:23:20 +0200
Message-Id: <20191119092321.12043-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH] libsoup: set CVE_PRODUCT
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
X-List-Received-Date: Tue, 19 Nov 2019 09:23:25 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
index 357f2fd3db..3a735cf27a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
@@ -15,6 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
 SRC_URI[md5sum] = "66c2ae89d6031b01337d78a2c57c75d5"
 SRC_URI[sha256sum] = "bd2ea602eba642509672812f3c99b77cbec2f3de02ba1cc8cb7206bf7de0ae2a"
 
+CVE_PRODUCT = "libsoup"
+
 S = "${WORKDIR}/libsoup-${PV}"
 
 inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
-- 
2.17.1


