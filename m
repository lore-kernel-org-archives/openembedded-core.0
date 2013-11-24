Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3E86D822
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2013 13:28:30 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so1762420eaj.21
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2013 05:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9mpRH2JrNJyXi/TrBCNLJ8VZmIKYLUm2rhRrfIqift8=;
	b=qECMer3SPj2AscA1VjuwYUAT9kp5clGYGINjTdANRSFijI3hkkrPEMNjIXPj9GVWJk
	5eu4qm8UXHqYAluTFi9tDkJ1qEpQGs4a4sCFgSFxPCt1LXXDT9FPlK8EZiTYVblcV+MG
	3uDwpb/rG8rXVcog7fMOcr7P3vuqCZX+wX5GAXogyj3eXt8vHMy6mjfXHtYz4oUaLViP
	X7XtFcbz+Bz40eEDvz1hagvQn5x53orXT4PqwZeiplDleZGXjZekGsrVt0CrmshIzL/i
	4605xmJhKn8CnX/oIdFkOv7JG+J1EG/k5eRdlFAIstkFkeJTZZdZISRpMXIsQT0eguTX
	fIWw==
X-Received: by 10.15.32.73 with SMTP id z49mr29692626eeu.27.1385299709434;
	Sun, 24 Nov 2013 05:28:29 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a51sm92214733eeh.8.2013.11.24.05.28.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Nov 2013 05:28:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2013 14:28:27 +0100
Message-Id: <1385299707-17554-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] avahi: add leading space to RRECOMMENDS append
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
X-List-Received-Date: Sun, 24 Nov 2013 13:28:30 -0000

* in case update-rc.d is already in RRECOMMENDS it fails with
  ERROR: Nothing RPROVIDES 'update-rc.dlibnss-mdns' (but
  meta/recipes-connectivity/avahi/avahi_0.6.31.bb
  RDEPENDS on or otherwise requires it)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 00622f3..3a95b7f 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -99,8 +99,8 @@ FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*"
 FILES_avahi-utils = "${bindir}/avahi-*"
 
 # uclibc has no nss
-RRECOMMENDS_avahi-daemon_append_libc-glibc = "libnss-mdns"
-RRECOMMENDS_${PN}_append_libc-glibc = "libnss-mdns"
+RRECOMMENDS_avahi-daemon_append_libc-glibc = " libnss-mdns"
+RRECOMMENDS_${PN}_append_libc-glibc = " libnss-mdns"
 
 RRECOMMENDS_avahi-dev = "expat-dev libcap-dev libdaemon-dev dbus-dev glib-2.0-dev update-rc.d-dev"
 RRECOMMENDS_avahi-dev_append_libc-glibc = " gettext-dev"
-- 
1.8.4.3


