Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuhaL-0002Kv-Un
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 09:39:06 +0100
Received: by pwj9 with SMTP id 9so996415pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 00:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=nyql6bcpM3IK7IrnV8XYJvq69slkTwvSmiOyJ6oCyi0=;
	b=UFFVFRwm/hVDTBy5RyF9x1VcNgrnebpuSrjmlwEh1d27pGRrt3bp4Hk/k7aHnek+23
	ODrTj7Zk5x06e/d1pFIgwTP0g5Uighnl+SN6rJTiDotcRL/Lm1S371mFHX4Z+zqG/A+R
	L0sjcrU37zL8VrdLEgQ9l7EUPh2q8tjeVyj58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XT7Z7VVavPmLR7+LfAyt0Tlk2+TxnZu4xKuf8GZGlmnUMFPneCoMu0vC6jK+FksxBa
	5muWnhPdL4g4mLdkUpJYtjzQf8rlIM7s1nz5op+/G8AKsNZP0ufMQQRy30+jV5JNOk1N
	/wJJP8aPKXU8c1Yb5IgAp6wI6rz7lha+3SDcM=
Received: by 10.142.193.2 with SMTP id q2mr6249000wff.409.1299055056736;
	Wed, 02 Mar 2011 00:37:36 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm8708546wfl.14.2011.03.02.00.37.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 00:37:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 00:37:19 -0800
Message-Id: <1299055045-8096-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH v2 1/7] sqlite3: Update version 3.7.3 -> 3.7.5
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
X-List-Received-Date: Wed, 02 Mar 2011 08:39:06 -0000

* Imported from OE commit a2c3af2d608b1b713018d688b00e03873a538993
* native version of 3.7.3 does not build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3.inc      |    7 ++++++-
 meta/recipes-support/sqlite/sqlite3_3.7.3.bb |    8 --------
 meta/recipes-support/sqlite/sqlite3_3.7.5.bb |   10 ++++++++++
 3 files changed, 16 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.3.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.5.bb

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 92c4930..a5e6782 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.sqlite.org"
 SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "readline ncurses tcl-native"
-DEPENDS_virtclass-native = "tcl-native"
+DEPENDS_virtclass-native = "tcl-native ncurses-native"
 LICENSE = "PD"
 
 SRC_URI = "http://www.sqlite.org/sqlite-${PV}.tar.gz \
@@ -32,3 +32,8 @@ FILES_lib${PN}-doc = "${docdir} ${mandir} ${infodir}"
 AUTO_LIBNAME_PKGS = "lib${PN}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+#do_compile_prepend() {
+#        oe_runmake sqlite3.h
+#        install -m 0644 sqlite3.h ${STAGING_INCDIR}
+#}
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.3.bb b/meta/recipes-support/sqlite/sqlite3_3.7.3.bb
deleted file mode 100644
index 7296aba..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3.7.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require sqlite3.inc
-
-LIC_FILES_CHKSUM = "file://src/main.c;endline=16;md5=86c9b824e9d68f8a26343a4b57f6d85a"
-
-PR = "r1"
-
-SRC_URI[md5sum] = "5437978aae90350cf984993091e0d695"
-SRC_URI[sha256sum] = "dbf352e8fbb74829f5e7a88f9f6ceeb80a709537f668c36e4b6cdfb271309ef6"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.5.bb b/meta/recipes-support/sqlite/sqlite3_3.7.5.bb
new file mode 100644
index 0000000..212d9e2
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.5.bb
@@ -0,0 +1,10 @@
+require sqlite3.inc
+
+LIC_FILES_CHKSUM = "file://sqlite3.c;endline=19;md5=c1b8048b783961c3ba387c43fd955dc6"
+
+SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070500.tar.gz"
+S = "${WORKDIR}/sqlite-autoconf-3070500"
+PR = "r0"
+
+SRC_URI[md5sum] = "a9604a82613ade2e7f4c303f233e477f"                                                 
+SRC_URI[sha256sum] = "cb5b86926ec9f65882b2dddd244f2d620337d911ec73411863f77e48cf6a2f94"              
-- 
1.7.4.1



