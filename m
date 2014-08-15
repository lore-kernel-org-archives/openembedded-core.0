Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A497360169
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 02:49:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7F2nrZ4020985
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 19:49:53 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 14 Aug 2014 19:49:53 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Aug 2014 10:49:51 +0800
Message-ID: <1408070991-31581-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] librsvg-native: add --disable-Bsymbolic to configure
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
X-List-Received-Date: Fri, 15 Aug 2014 02:49:55 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

The older ld on the host doesn't have the -Bsymbolic-functions option,
for example, the one on CentOs 5.x, we can disable it for native.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.40.2.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
index 34d8ca1..6d9fd53 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
@@ -21,6 +21,7 @@ SRC_URI[archive.md5sum] = "acdecdb9f08f3bf662a68bf7dafb8b82"
 SRC_URI[archive.sha256sum] = "48049b643294636df7de1a4b997414d699666f5dc44776945c218a257d2a291c"
 
 EXTRA_OECONF = "--disable-introspection --disable-vala"
+EXTRA_OECONF_append_class-native = " --disable-Bsymbolic"
 
 PACKAGECONFIG ??= "gdkpixbuf"
 # The gdk-pixbuf loader
-- 
1.7.9.5


