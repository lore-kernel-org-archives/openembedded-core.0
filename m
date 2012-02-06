Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuRCE-00054x-6E
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 17:13:38 +0100
Received: by pbbb4 with SMTP id b4so4428358pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 08:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8eOfg60h9V+yHfILdHeRb9UDl5B7aFijVQHWLsLQ8qA=;
	b=CZ92gaXeQvUFJhKV5VJ4wF4R5Lm9Hwh0ASREWN/8WZqt4/dQJBnRi9HfXrXoIzYpf1
	g3nE1qNwiFEQWBDGTvZQcZL2WFrkdT0AJqj8G/GoVhDL4HmWKPl8mMPISBf75d5HoPt9
	3Mk9i7PSBg5H4eE7FfrAlcYiizDUBdQVgS2q8=
Received: by 10.68.125.227 with SMTP id mt3mr48820758pbb.1.1328544335582;
	Mon, 06 Feb 2012 08:05:35 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-142-235.lightspeed.sntcca.sbcglobal.net. [99.57.142.235])
	by mx.google.com with ESMTPS id x8sm40006956pbr.11.2012.02.06.08.05.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 08:05:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 08:05:27 -0800
Message-Id: <1328544327-16670-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [PATCH] xorg-apps: Bump PR to accomodate meta-oe recipe deletion
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
X-List-Received-Date: Mon, 06 Feb 2012 16:13:38 -0000

rgb in meta-oe has been removed in favour of
oe-core which requires a PR bump so feeds
keep working

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-app/xorg-app-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 86e5c23..890648b 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -5,7 +5,7 @@ SECTION = "x11/apps"
 LICENSE = "MIT-X"
 DEPENDS = "util-macros-native virtual/libx11"
 
-INC_PR = "r5"
+INC_PR = "r7"
 
 SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
 
-- 
1.7.8.3



