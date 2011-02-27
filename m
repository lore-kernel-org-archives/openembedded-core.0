Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcxx-0007DK-73
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:01 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:40 -0800 (PST)
Received: by 10.216.25.210 with SMTP id z60mr1080565wez.104.1298798977981;
	Sun, 27 Feb 2011 01:29:37 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o19sm1283657wee.26.2011.02.27.01.29.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:37 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:12 +0100
Message-Id: <ad9ceb0a626f661e974bdd12d6a27212ad221f6a.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 07/50] poky.conf: Weakly set PREMIRRORS
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:01 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We should only weakly set PREMIRRORS as users often want to override this.

[BUGID #753]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/poky.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/poky.conf b/meta/conf/distro/poky.conf
index 400b8c2..71e40de 100644
--- a/meta/conf/distro/poky.conf
+++ b/meta/conf/distro/poky.conf
@@ -150,7 +150,7 @@ BB_GENERATE_MIRROR_TARBALLS ??= "0"
 
 require conf/distro/include/world-broken.inc
 
-PREMIRRORS =+ "\
+PREMIRRORS ?= "\
 bzr://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
 cvs://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
 git://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
-- 
1.6.6.1



