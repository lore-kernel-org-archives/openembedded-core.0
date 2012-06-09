Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOwM-0004SW-H1
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:55:06 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3571196pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ry+hknjgk84cUpP5V8f9NGDwVzF9U+jxa6U2lfEWdpY=;
	b=MfKfVIVCScxQDcWuwZLnVhPZRl0fLi2UKkch6kN+hS3kzamlVQ2d8R+jceZ4VFb7Gz
	ILQriGWgKdyZU4/INF0oxAgu+7lpqWhuLI9zcucDdfaO4yfBdRA+wPRw5VQHPpFShlqC
	xNW7MMaNJ4gYgGJNTjHe9xglB6m5cvHGLOYUZlSUdtu8q2RhliNJIsGH65jHEmZWP26g
	pTs29xoFaGiiEPm7Yj6WAz152iPOIyydxKUoDKAvOl+KF+pDgWfR7K3hv0QkWjdnVjNh
	SHlbAXjBKU6VKmzpF0mTgPINERdnhhFoVg7kHCkAMTccbE5P3qIy3HZKtAH2rI2YXclB
	S1zA==
Received: by 10.68.134.163 with SMTP id pl3mr7736044pbb.167.1339260277316;
	Sat, 09 Jun 2012 09:44:37 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:43:14 -0700
Message-Id: <74ec80fce12f7fea4f3bd8b036c3e1ec90afa3d0.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
References: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 16/16] gnupg-2.0.19: Depend on npth for uclibc
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
X-List-Received-Date: Sat, 09 Jun 2012 16:55:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gnupg/gnupg_2.0.19.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.19.bb b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
index d014f03..24219a8 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.19.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
@@ -4,8 +4,10 @@ LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
 
-DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt"
-PR = "r2"
+DEPENDS = "${PTH} libassuan libksba zlib bzip2 readline libgcrypt"
+PTH = "pth"
+PTH_libc-uclibc = "npth"
+PR = "r3"
 
 inherit autotools gettext
 
-- 
1.7.5.4



