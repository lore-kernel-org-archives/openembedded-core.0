Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 549D86DA27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 23:49:30 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id t61so4161477wes.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 15:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AHls7RXcuGnEpWspgK7QXOeALQI5mFl6sjrGbyO8Nu4=;
	b=aR+bf/Yx6J5mDAHsAk7yRbqggXUeKcJmHPkkPLndmfhn9ZQn/g8f3CcYrYIYNPGqyi
	oFxWNVfsAmixO7vjnkXw1YdNJCpC6S2tBCisv0WuzlafuyXRwENiikZTITGVUe1ce8E7
	Fu8hqebSsHjB6owJBP00fj/Y4NbEVeY91SfQUC3BtLkNv1uYIt4QLUNoLtSrGe0kA+9x
	1HADRsttYcm+Opro6x63XnsRztvBIvvx8m2eL2OJjyLuQ85oq60TVy0GjBi7qKDOmSNY
	OxpQnLvnn/nehHYeejd41n8cPV1T9mXJa0ojON8UvhupTUDZtGQPQxNAY0SAYwn3SRVg
	0p0w==
X-Gm-Message-State: ALoCoQlH1FQF6SfdALGPFfT2RtwfVHCX2mP961oefeq/i3bvuRA165/wLxaoj3dr1Ne8n/Z6PyKC
X-Received: by 10.194.104.42 with SMTP id gb10mr8638680wjb.16.1384559371587;
	Fri, 15 Nov 2013 15:49:31 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id gm2sm20642wib.4.2013.11.15.15.49.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 15:49:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 23:49:22 +0000
Message-Id: <1384559364-27687-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] libxrandr: upgrade to 1.4.1
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
X-List-Received-Date: Fri, 15 Nov 2013 23:49:30 -0000

License checksum changes as COPYING was updated upstream with additional
copyright notices.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/{libxrandr_1.4.1.bb => libxrandr_1.4.2.bb}          |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.4.1.bb => libxrandr_1.4.2.bb} (71%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.4.1.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.4.2.bb
similarity index 71%
rename from meta/recipes-graphics/xorg-lib/libxrandr_1.4.1.bb
rename to meta/recipes-graphics/xorg-lib/libxrandr_1.4.2.bb
index 360199d..4df4b3a 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.4.2.bb
@@ -9,7 +9,7 @@ specified in the Proceedings of the 2001 Usenix Technical Conference \
 require xorg-lib-common.inc
 
 LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=aa33e583cc3e96238a8467b485e62992"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c9d1a2118a6cd5727521db8e7a2fee69"
 
 DEPENDS += "virtual/libx11 randrproto libxrender libxext"
 
@@ -19,5 +19,5 @@ XORG_PN = "libXrandr"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "8dbac4e972348dcbd3a0673ce2e37919"
-SRC_URI[sha256sum] = "d914a0490fd0a2ea6c3194505b5b28c56e2a277d8f4648b0275ee0ee370fb905"
+SRC_URI[md5sum] = "210ed9499a3d9c96e3a221629b7d39b0"
+SRC_URI[sha256sum] = "caa7b31ac769be51a532343c65376f1d4df3f307afaed58e34fb5e82e8b825ad"
-- 
1.7.10.4


