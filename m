Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SsAwc-0000KH-RH
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 13:00:27 +0200
Received: by bkcik5 with SMTP id ik5so2633504bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=DuxPofjkbsLX2ZjCacLkN13E6lRkd1zLwjqMSt4xEPk=;
	b=gRxSr5GLd07TFVz4ZXD1PPkBrVB1de6+A8l/POSfL+YCWjhvtr98RaQnI/aGmLkGBX
	Tc+mNDd+3i2xbfsEbxn25I2qy9OxtId2M0nf6a5MIyLMpm38Eb3XaUKSiTzcflfqF4EY
	N2WCJjy7iIMk1mhvljBSi2H4aAaAEHVUlbU/AZURF7vDf/A3b9uzfF/MzyKPJiTqeLdZ
	utwI3WsfIvfDI/whwSRKvJFA1jsYpkiG6jbk290fsf5RPszyzUSpROBgm3dS6yckjBGZ
	1T9wS/ixb1NHjDjFLpekTj93aJPVLO1x5UcspY0UyvwR4Wzjog5sH774QlJxqoBDvhhi
	8WPw==
Received: by 10.204.157.146 with SMTP id b18mr2604204bkx.108.1342781334444;
	Fri, 20 Jul 2012 03:48:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z19sm2566730bkw.10.2012.07.20.03.48.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 03:48:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 12:49:03 +0200
Message-Id: <1342781343-16277-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120628191246.GA5532@localhost.jama.net>
References: <20120628191246.GA5532@localhost.jama.net>
Subject: [PATCH] util-linux: register reset u-a to bindir like busybox does
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
X-List-Received-Date: Fri, 20 Jul 2012 11:00:28 -0000

* fixes http://lists.linuxtogo.org/pipermail/openembedded-core/2012-June/024586.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |    3 ++-
 meta/recipes-core/util-linux/util-linux_2.21.2.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 688a5be..00e5d7c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -136,7 +136,8 @@ ALTERNATIVE_${PN} += "setsid chrt flock hwclock"
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
 ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
-ALTERNATIVE_LINK_NAME[reset] = "${base_bindir}/reset"
+ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
+ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
 ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
 ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
index 7f2c2a9..0f5fdc6 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r0"
+PR = "r1"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.8.6



