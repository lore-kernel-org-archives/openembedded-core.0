Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F81277B41
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 45E0918153
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id O1Dj-4q943Nb
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 65CC4180E5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 531D11A086
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 481AD1A084
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 3C25E5E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v35Dkj6e013073
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Apr 2017 15:46:45 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v35Dkjd5013054
	for openembedded-core@lists.openembedded.org;
	Wed, 5 Apr 2017 15:46:45 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 15:46:40 +0200
Message-Id: <20170405134642.12572-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2 1/3] base-files: profile: Whitespace clean up
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
X-List-Received-Date: Wed, 05 Apr 2017 13:46:47 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/base-files/base-files/profile | 29 +++++++++++++------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index c616616cee..22dfb4f219 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -6,28 +6,29 @@ EDITOR="vi"			# needed for packages like cron, git-commit
 test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
 
 if [ "$HOME" = "ROOTHOME" ]; then
-   PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
+	PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
 fi
 if [ "$PS1" ]; then
-# works for bash and ash (no other shells known to be in use here)
-   PS1='\u@\h:\w\$ '
+	# works for bash and ash (no other shells known to be in use here)
+	PS1='\u@\h:\w\$ '
 fi
 
 if [ -d /etc/profile.d ]; then
-  for i in /etc/profile.d/*.sh ; do
-    if [ -f $i -a -r $i ]; then
-      . $i
-    fi
-  done
-  unset i
+	for i in /etc/profile.d/*.sh; do
+		if [ -f $i -a -r $i ]; then
+			. $i
+		fi
+	done
+	unset i
 fi
 
 if [ -x /usr/bin/resize ] && termpath="`tty`"; then
-  # Make sure we are on a serial console (i.e. the device used starts with /dev/tty),
-  # otherwise we confuse e.g. the eclipse launcher which tries do use ssh
-  case "$termpath" in
-  /dev/tty[A-z]*) resize >/dev/null
-  esac
+	# Make sure we are on a serial console (i.e. the device used starts with
+	# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which
+	# tries do use ssh
+	case "$termpath" in
+		/dev/tty[A-z]*) resize >/dev/null
+	esac
 fi
 
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
-- 
2.12.0


