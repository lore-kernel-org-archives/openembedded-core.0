Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SrAgJ-00021K-Dl
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:31:27 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so466300bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=9GlI7toUpyr9m9sgJz8YoTrMBQ1WNHUewbJo9yvv+bA=;
	b=Kp8Rts/VjwpNvvf4pmNfy6E2KwYWgoN48X4ORuJgxwoy+12Ki83kz8+y7lvHqQgbXI
	nB7hbNNC5GE1iF7UclW20yNt4tbVdwH3QtLz2QQDljDtbNr70cPVqQsn0iEhoezQbV42
	m2wUFBDlJIxCJSMMuR09pOzWNSWicGitTDo5kk5bkzzuFLiMH0s5k+icg8su79OdbM+f
	QMf1+oLAtj8+Q9RoLbygl+D/JAdcfZ+3xuF9OG+IhjSeDTDrqQahHI1uT0AyLvGnawt8
	xd3Ec+F9RO64yFSUu4Li+OyBEtoxq18QdV4xnvMjmYoAKqZXbg1McmoNwtlqKmB/Bkz+
	+FHw==
Received: by 10.204.152.19 with SMTP id e19mr1686005bkw.8.1342542010018;
	Tue, 17 Jul 2012 09:20:10 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id 14sm10358424bkq.12.2012.07.17.09.20.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:20:08 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 19:20:00 +0300
Message-Id: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342541736.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1342541736.git.andrei@gherzan.ro>
References: <cover.1342541736.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkueGzJ/v4Is8wz5HsJnTEWfnTunF5sn+hF0MW6UJAfkF1N3Bb5KkotT7wUjVGsMbso8zWh
Subject: [PATCH V3 1/3] connman: Update to version 1.3
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
X-List-Received-Date: Tue, 17 Jul 2012 16:31:27 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 .../connman/{connman_1.0.bb => connman_1.3.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.0.bb => connman_1.3.bb} (82%)

diff --git a/meta/recipes-connectivity/connman/connman_1.0.bb b/meta/recipes-connectivity/connman/connman_1.3.bb
similarity index 82%
rename from meta/recipes-connectivity/connman/connman_1.0.bb
rename to meta/recipes-connectivity/connman/connman_1.3.bb
index 926d22e..1e3d138 100644
--- a/meta/recipes-connectivity/connman/connman_1.0.bb
+++ b/meta/recipes-connectivity/connman/connman_1.3.bb
@@ -1,7 +1,7 @@
 require connman.inc
 
-# 1.0 tag
-SRCREV = "6d6f312fb2b751b4cf7037f2a526c7785364732f"
+# 1.3 tag
+SRCREV = "3c0fa84091524c7cd6237744f2088ffee2f1d5ad"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
-- 
1.7.9.5



