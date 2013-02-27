Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UAlLg-0001x1-Fd
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 19:04:12 +0100
Received: by mail-da0-f42.google.com with SMTP id n15so404422dad.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 09:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=euUnfXGL9bFGYim3UxzyiRl16bWdUhonGoLuyPY0SQA=;
	b=LW8M01+IvpB/f04/Pw3jbwt4fbg0IajWQQMy8f2ls1UZW+8yI8DnYVFcIpIpxJPWO5
	Xf/qj+x8Y0bqlMJHaxqcnWxuN6YZ2ki3CuVfByJ5YdIvEL4SaLxkroGtyunR19izP1td
	Nw+Fz/PthMSmbeHTGj8V28FaIGAsZQps/zJzmUTENXa22cRt+qxzgCnTVVRWKtacm/Vn
	mjpNqm33SQAy2dDv8vYoXpvElt7Ck8nZlfurZ98gbcEEt6r/zu8IBwBx1l6M2pAZ3LQs
	jzNXkgGVCHUIFAGXchrAvKkXOKZm+l1M772Kaww/wl5cQsfIlLngBELu8za9tLDKQaWz
	VS4g==
X-Received: by 10.66.160.230 with SMTP id xn6mr8854687pab.119.1361987222977;
	Wed, 27 Feb 2013 09:47:02 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ab1sm5316897pbd.37.2013.02.27.09.46.59
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 09:47:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 18:46:51 +0100
Message-Id: <1361987211-19783-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] systemd.bbclass: fix bb.error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 18:04:14 -0000

NOTE: recipe avahi-ui-0.6.31-r7.0: task do_package: Started
ERROR: %s does not appear in package list, please add it avahi-ui-daemon
ERROR: %s does not appear in package list, please add it avahi-ui-dnsconfd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/systemd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 00865ed..564cd72 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -53,7 +53,7 @@ python systemd_populate_packages() {
     def systemd_check_package(pkg_systemd):
         packages = d.getVar('PACKAGES', True)
         if not pkg_systemd in packages.split():
-            bb.error('%s does not appear in package list, please add it', " " + pkg_systemd)
+            bb.error('%s does not appear in package list, please add it' % pkg_systemd)
 
 
     # Add a runtime dependency on systemd to pkg
-- 
1.8.1.4



