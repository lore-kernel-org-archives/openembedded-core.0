Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rg3f6-0007wR-6b
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 01:16:00 +0100
Received: by ghrr17 with SMTP id r17so5525686ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 16:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=xww1IlbeDunB/M0p2NHH8JtDXpZfdhPLhWaMqSXdfhc=;
	b=e9i6Lfq0puI638wZpHnl/Ul0P645iGlAaHKG6f7Zpp65u1WXPN8zBS2SHtaJ0/tdul
	Qh3j2gsp1huwEVSgbmHG2jVJskuY352pfg4O9PRyvonfQVlVd6lB1qoJI6xYsRwCHTrL
	//ktJnnFBHOMla21OrW3+FIBMI3Rwxd1KDO2w=
Received: by 10.236.173.131 with SMTP id v3mr45641986yhl.112.1325117323137;
	Wed, 28 Dec 2011 16:08:43 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id e66sm46252510yhk.6.2011.12.28.16.08.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 16:08:42 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 18:08:42 -0600
Message-Id: <1325117322-27695-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <1325117322-27695-1-git-send-email-kergoth@gmail.com>
References: <1325117322-27695-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] glib-2.0: we need zlib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Dec 2011 00:16:00 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
index bf415a1..8b45655 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
@@ -3,7 +3,7 @@ require glib.inc
 PR = "r1"
 PE = "1"
 
-DEPENDS += "libffi python-argparse-native"
+DEPENDS += "libffi python-argparse-native zlib"
 DEPENDS_virtclass-native += "libffi-native python-argparse-native"
 DEPENDS_virtclass-nativesdk += "libffi-nativesdk python-argparse-native zlib-nativesdk"
 
-- 
1.7.8.rc4



