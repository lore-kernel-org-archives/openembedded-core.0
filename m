Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW0ji-0004SA-E4
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 08:07:14 +0100
Received: by mail-bw0-f47.google.com with SMTP id zv15so1291255bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 23:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=l6Zk+0hmrtQYtrfPYGWVpJUdn59q337AYXgCWUBG1KA=;
	b=Ui7o7I9PnIhh1ahxQSz6Egf7wOeUxRO0S0d+CqJYeEMLsVp0+2UpWkbS9KlnOqRwUm
	o154PLbMYi6dVUdqSxcHNKCbbQo09ipUYW0nbNQVlKn+THe+W6s5WjIgtlyv0VkoOT98
	V+COdUzVAFHRY1B05Wd9QHyqgEW4wCgAZ0M8Y=
Received: by 10.204.157.27 with SMTP id z27mr5798854bkw.37.1322722835167;
	Wed, 30 Nov 2011 23:00:35 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c4sm9280094bkk.13.2011.11.30.23.00.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 23:00:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 08:00:19 +0100
Message-Id: <1322722819-2808-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <1322722819-2808-1-git-send-email-Martin.Jansa@gmail.com>
References: <1322722819-2808-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 2/2] apr-util: bump PR for gdbm SOVERSION change
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
X-List-Received-Date: Thu, 01 Dec 2011 07:07:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/apr/apr-util_1.3.12.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.3.12.bb b/meta/recipes-support/apr/apr-util_1.3.12.bb
index 62d72cf..676b1b4 100644
--- a/meta/recipes-support/apr/apr-util_1.3.12.bb
+++ b/meta/recipes-support/apr/apr-util_1.3.12.bb
@@ -9,7 +9,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
                     file://include/apu_version.h;endline=17;md5=806685a84e71f10c80144c48eb35df42"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
-- 
1.7.8.rc4



