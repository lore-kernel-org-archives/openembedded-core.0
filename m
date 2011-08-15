Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1QszTj-00051M-1d
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 17:53:27 +0200
Received: by wwe32 with SMTP id 32so4119349wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ibiLaevsdhNfX4TBy967ctqmpmQXSPjBTeFzgvG4Nog=;
	b=D455lo4OlyX6dpoLagU1EtF9pjrHB7LZgIQa+quyMEr9qbYvlb7WeJF7pxSikafUfY
	OGN7h0HZf5j3Ut5uPLLbmTaUK17Mv60RFCoFxKhdCVU2xYQ+HjAkZR7zt0+f7sPf9pkI
	e5sdXtrzdXpz3/YMz7ZHp92kS0pHDWbNvfRok=
Received: by 10.227.199.207 with SMTP id et15mr3587169wbb.56.1313423330748;
	Mon, 15 Aug 2011 08:48:50 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id fg5sm4654697wbb.40.2011.08.15.08.48.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 15 Aug 2011 08:48:49 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 19:48:43 +0400
Message-Id: <1313423323-30335-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH] libxcb: enable native/nativesdk builds as was done previously in meta-oe
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
X-List-Received-Date: Mon, 15 Aug 2011 15:53:27 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-graphics/xcb/libxcb.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xcb/libxcb.inc b/meta/recipes-graphics/xcb/libxcb.inc
index 5044917..015065e 100644
--- a/meta/recipes-graphics/xcb/libxcb.inc
+++ b/meta/recipes-graphics/xcb/libxcb.inc
@@ -5,6 +5,8 @@ the protocol, improved threading support, and extensibility."
 HOMEPAGE = "http://xcb.freedesktop.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
 
+BBCLASSEXTEND = "native nativesdk"
+
 SECTION = "x11/libs"
 LICENSE = "MIT-X"
 
-- 
1.7.2.5



