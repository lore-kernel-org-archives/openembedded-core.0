Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pv2Qc-0007vN-2W
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 07:54:26 +0100
Received: by yia13 with SMTP id 13so267860yia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 22:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=6cwt8DCeMF6vnW/HsVOTovtTC5rVOQpCwkZX+Z0Mgy8=;
	b=J9KY3jgOYRiYxSDsXN6e/idC9KNHhXcgmsxqtpkzfnN6s8/0BLCkSU0fLsa8PMzwNn
	XL61i7exlVLcRm8VkbUlpfnR96kmSlig9xK0XZ20Oqfp0TZ31AIA1MdXZjKcZCS9Kmfd
	zYyPNjnjFAeRq+A9IiwA7zVdPes1tHCm5Auec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=n+hyQtQMXA4HXxheyBegNsOjm6c1iI8zRvrIcpLhBByRX30rsjOZWu7RFCtDcB+Sd7
	Gwf39eLzWeEKEWJS11Bw3t6cQlQQ05xEOTqGc3NmphkYci6LO7GGSOiYdmPTZ2tHxVv7
	zRq45CGenSTXKqd45EmWiNsKdoVb2EQLhPQiE=
Received: by 10.151.26.7 with SMTP id d7mr1354088ybj.297.1299135176298;
	Wed, 02 Mar 2011 22:52:56 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g27sm595767yhc.8.2011.03.02.22.52.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 22:52:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 22:52:42 -0800
Message-Id: <1299135167-18330-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCHv3 1/6] sqlite3: Update version 3.7.3 -> 3.7.5
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
X-List-Received-Date: Thu, 03 Mar 2011 06:54:26 -0000

* Imported from OE commit a2c3af2d608b1b713018d688b00e03873a538993
* native version of 3.7.3 does not build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3_3.7.3.bb |    8 --------
 meta/recipes-support/sqlite/sqlite3_3.7.5.bb |   10 ++++++++++
 2 files changed, 10 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.3.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.5.bb

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



