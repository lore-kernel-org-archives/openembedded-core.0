Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Se6qN-0004gS-MO
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 17:47:51 +0200
Received: by bkcjm2 with SMTP id jm2so3446883bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 08:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=8+tI3zNGhc81wBvmRpVHZ5iuaX07uyvO9lY4jnevF4Q=;
	b=j01NDd/o0AsCgfxG+wlzgZWlW3X/D7ewniO/XbDASd93/oQtKX+UOMRhenfBJN0NhR
	uixhZ8yf3ZmFuuEl2wxEuyglnn5r05EknpgyGk3c8kLyv87IbSv1INLuQBjsJPpwIti7
	25BxKlB2L0rjdZSm5Zd5eM0ON7wgq2JjPoUjBn3qXEZlYOrKFcgkHDlI6PHzFdnNrCjP
	hh5bYHYEjHlSgzcKXJP5n3w0QIGxv+sWJlXcqTSgDSYxBO+fe1ITYApRqziJT7/O1duc
	ylkzDmrWJ1Xr21AsyCDE06sn/nzD/HM9bXAo4ze6XU9lIoVpdOWV2egEJUEH7aFgbqXK
	GMSw==
Received: by 10.204.152.196 with SMTP id h4mr8029394bkw.131.1339429038266;
	Mon, 11 Jun 2012 08:37:18 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-153.unitymediagroup.de.
	[178.202.232.153])
	by mx.google.com with ESMTPS id ig1sm16953964bkc.4.2012.06.11.08.37.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jun 2012 08:37:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2012 17:37:03 +0200
Message-Id: <1339429023-10291-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] systemtap: update Upstream-Status and use correct syntax
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
X-List-Received-Date: Mon, 11 Jun 2012 15:47:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

patch was applied [1]

http://sourceware.org/git/gitweb.cgi?p=systemtap.git;a=commit;h=41df51cb6a6d3f09f8b57cb216dffa5ba335e326

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...prun-configure.ac-support-without-nss-for.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch b/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
index fbe7b70..eef414a 100644
--- a/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
@@ -7,7 +7,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Upstream status: pending
+Upstream-Status: Submitted
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
-- 
1.7.6.5



