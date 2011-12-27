Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Rfdr6-0002YP-7c
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 21:42:40 +0100
Received: by eeit10 with SMTP id t10so7196885eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2011 12:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=QJYkrOUZhmBHofwYWUnIedUl2rYNfo8BbSMjAJDRy8o=;
	b=UewkcdQYw+WQ3rntcBWBFiuWgZOPDLdHt7ZyF1/cwImyjNi/NNJnC58ZxkIxOX/dKy
	3BVxq5lBNuYzpnOslYTCpBxTNUnjktQOye0zZN838jaxqqJWDTNA596JrQgadwK3YVXy
	n9zcys+Lv/8N7uYOX5WbkVnDiEpT2mGukT4GU=
Received: by 10.213.106.10 with SMTP id v10mr3793070ebo.73.1325018126650;
	Tue, 27 Dec 2011 12:35:26 -0800 (PST)
Received: from localhost.localdomain (a2038.upc-a.chello.nl. [62.163.2.38])
	by mx.google.com with ESMTPS id 76sm111237229eeh.0.2011.12.27.12.35.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Dec 2011 12:35:25 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Dec 2011 21:35:17 +0100
Message-Id: <1325018118-30223-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.8.1
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: [PATCH 1/2] u-boot: improved DESCRIPTION, fixed HOMEPAGE
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
X-List-Received-Date: Tue, 27 Dec 2011 20:42:41 -0000

HOMEPAGE pointed to an sf.net page that said that the
page did not exist any more and after that it redirected
to the denx.de page; updated HOMEPAGE to point to that page
Also improved the description to use the official capitalisation

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 544acd2..a3f50bc 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -1,3 +1,5 @@
+DESCRIPTION = "U-Boot - the Universal Boot Loader"
+HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
 DESCRIPTION = "U-boot bootloader"
 HOMEPAGE = "http://u-boot.sf.net"
 SECTION = "bootloaders"
-- 
1.7.8.1



