Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 01A7476FB8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Sep 2015 15:25:46 +0000 (UTC)
Received: by qgev79 with SMTP id v79so48364026qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Sep 2015 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KyM2/Gu4KM/hVT+YSHwjx4XnPaKbKppOLm0YO3w4w+w=;
	b=iLlFonIBTrGVI+AmUQJb7QJ5Yr7l6/C35vXNtQ81ZXdGhg8DQwzI7kFZUvOAI26l8k
	fjVNQwEhmURpEZp8jaxWarSHyCC05IgGBX6RJhCwjhb8Kv6bnFO66gjaemG8Xz5elkyA
	nkWUDqu5h5fjXDV5qWJBTOI1uo5Q+RHzPLCA2uPQD2ZJxg1M64yaBT71fH1kYa/gtYG9
	Z0GvVUZv9/g7QMkVfDkQs/rkFL7/l7UmMRCyd9CDuTZTLJeuuk0wtq+UrgfQyfUmF45k
	41OoxPOsgYkMyeQxGQhrxr3cVUqwAG/6Jq2XD/HYpL8/JVfzMxsMOG66pDNkVSH5SR5Z
	XwZg==
X-Received: by 10.140.31.203 with SMTP id f69mr20284450qgf.53.1441553146574;
	Sun, 06 Sep 2015 08:25:46 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	i196sm5098459qhc.22.2015.09.06.08.25.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Sep 2015 08:25:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Sep 2015 15:25:38 +0000
Message-Id: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <cover.1441552859.git.raj.khem@gmail.com>
References: <cover.1441552859.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] busybox: Enable getopt applet
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
X-List-Received-Date: Sun, 06 Sep 2015 15:25:47 -0000

getopts is a common applet more so now needed by systemd for working
with sysv scripts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox/getopts.cfg | 3 +++
 meta/recipes-core/busybox/busybox_1.23.2.bb   | 1 +
 2 files changed, 4 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/getopts.cfg

diff --git a/meta/recipes-core/busybox/busybox/getopts.cfg b/meta/recipes-core/busybox/busybox/getopts.cfg
new file mode 100644
index 0000000..8db0a4a
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/getopts.cfg
@@ -0,0 +1,3 @@
+CONFIG_GETOPT=y
+CONFIG_LONG_OPTS=y
+CONFIG_FEATURE_GETOPT_LONG=y
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 8a4bae6..e4d9f97 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
+           file://getopts.cfg \
 "
 
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
-- 
2.5.1


