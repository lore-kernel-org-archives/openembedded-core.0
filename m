Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F1A236A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 06:13:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r576DY9q001694
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 23:13:34 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 6 Jun 2013 23:13:32 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jun 2013 14:13:57 +0800
Message-ID: <c27d0a321216d09f6bfc7bac11aaadaffbac82c9.1370585547.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1370585547.git.Qi.Chen@windriver.com>
References: <cover.1370585547.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 3/8] busybox: add a config fragment to enable login utilities
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
X-List-Received-Date: Fri, 07 Jun 2013 06:13:32 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Create a config fragment to enable the login/passwd utilities of busybox.

[YOCTO #4207]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../busybox/busybox-1.20.2/login-utilities.cfg     |   13 +++++++++++++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/login-utilities.cfg

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/login-utilities.cfg b/meta/recipes-core/busybox/busybox-1.20.2/login-utilities.cfg
new file mode 100644
index 0000000..cc9b2db
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.20.2/login-utilities.cfg
@@ -0,0 +1,13 @@
+CONFIG_FEATURE_SHADOWPASSWDS=y
+CONFIG_ADDUSER=y
+CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
+CONFIG_ADDGROUP=y
+CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=y
+CONFIG_DELUSER=y
+CONFIG_DELGROUP=y
+CONFIG_GETTY=y
+CONFIG_LOGIN=y
+CONFIG_PASSWD=y
+CONFIG_SU=y
+CONFIG_SULOGIN=y
+CONFIG_VLOCK=y
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index 07d722d..3ff8a88 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -35,7 +35,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://fail_on_no_media.patch \
            file://busybox-sulogin-empty-root-password.patch \
            file://inetd.conf \
-           file://inetd"
+           file://inetd \
+           file://login-utilities.cfg"
 
 SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
 SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
-- 
1.7.9.5


