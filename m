Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1h-0004v2-PV
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:01 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=af/6Buu3tvviqqwPgR/TlbhPpvuvI8TstWflEIUjuBE=;
	b=qEDGr0V9lvrB78l2+thlYJa2nHKVjJiOd4J1v69HWJTfWwE5pU/9zhoxoJ7F7o/BAS
	8lOZnc0YtOPNmQOdWoJ6Aupdgzh77OS4lByDUvCW2Zwq4EJlPxNvJJYQMGUo4TFo+dn9
	F8L1bSWa5ff29abwnXIbRY2KtPg6mzBie/PQ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eTf4sz0viT/p0yU9EICyTzFwJ1Vci6Qz/8DYJVXmWSOH+HCFGYl2Y6kr3dbOF+fq31
	942KKcVUYZsEGJNvsFaIUCYv4WZvEMKiXQFfVgd1+uR+avtIFRjUxQKIie0etB95Yf3q
	niULfl/6CGSy39t6RN7t/wfY2vCvQCVCVRVUA=
Received: by 10.42.1.81 with SMTP id 17mr467750icf.465.1301632202730;
	Thu, 31 Mar 2011 21:30:02 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c1sm1184065ibe.15.2011.03.31.21.30.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:54 -0700
Message-Id: <647c0f91601bf834eeb2dcb8ae9cf6140638823e.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 32/46] libuser_0.57.1.bb: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:34:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libuser/libuser_0.57.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libuser/libuser_0.57.1.bb b/meta/recipes-extended/libuser/libuser_0.57.1.bb
index 2dd3f11..355427f 100644
--- a/meta/recipes-extended/libuser/libuser_0.57.1.bb
+++ b/meta/recipes-extended/libuser/libuser_0.57.1.bb
@@ -17,8 +17,8 @@ SRC_URI[md5sum] = "be82c6941264d0b4bd04f95fb342ec7d"
 SRC_URI[sha256sum] = "a61289867581fa715354a3fafe09c3e481173ce0a2dcb33b04588b6ac13cead5"
 PR = "r1"
 
-DEPENDS = "gettext popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native"
+DEPENDS = "popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native"
 
 EXTRA_OECONF += "--without-python"
 
-inherit autotools
+inherit autotools gettext
-- 
1.7.4.1



