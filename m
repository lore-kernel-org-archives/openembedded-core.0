Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeSXj-000664-9s
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 16:30:20 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so413161lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 07:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6zEiHlHH0BhCu1HUSMLpbAybnvMdy58ntzpp+0bwV5s=;
	b=eL/d6m11LpUadynQe2OBwiNpf/FYmVj4iLEK9OhETJ56ugnLqqpPoiluebHzfZ0TDZ
	VtEJEEPdFRvktU9hNxdzCFGmZKjmXRVgUP5NE/NxlfMA74smJOFVTLPbelg8lOad74N/
	yuJU7JWvvjJTS+j28uwoaqvw+y2gjY14cnos5cJBUExeMdIqbWOCzM2elEDVL2ytuOX/
	+12XjipXe+70NJF2JHLmJTlBEWOdV6M3HbUWAphQKw2jK2G2zsDXEwPVfnPL4t41Cg40
	YdSt1dUkXrMKRu/WSHeR4mzFEqrosmIhwQ/uftACQqOPf9XAoPDpr7iitknemUQi5sfd
	WkdQ==
Received: by 10.152.46.161 with SMTP id w1mr1579587lam.27.1354288564331;
	Fri, 30 Nov 2012 07:16:04 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id sq2sm2107380lab.14.2012.11.30.07.16.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 07:16:01 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeSJr-0002yX-6R; Fri, 30 Nov 2012 17:15:59 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 17:15:39 +0200
Message-Id: <1354288544-10778-6-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354288544-10778-5-git-send-email-cazfi74@gmail.com>
References: <1354288544-10778-1-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-2-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-3-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-4-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-5-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 05/10] libdaemon: fix license segment md5sum boundary
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
X-List-Received-Date: Fri, 30 Nov 2012 15:30:20 -0000

Replaced incorrect "startline" with correct "beginline" for telling
where license segment in file begins. Old md5sum was calculated from
the beginning of the file, not from beginning of the license segment.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-support/libdaemon/libdaemon_0.14.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libdaemon/libdaemon_0.14.bb b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
index 2aafad5..e93a357 100644
--- a/meta/recipes-support/libdaemon/libdaemon_0.14.bb
+++ b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
@@ -4,7 +4,7 @@ AUTHOR = "Lennart Poettering <lennart@poettering.net>"
 HOMEPAGE = "http://0pointer.de/lennart/projects/libdaemon/"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://libdaemon/daemon.h;startline=9;endline=21;md5=94c709a83d8251377c322322176d4ffe"
+                    file://libdaemon/daemon.h;beginline=9;endline=21;md5=bd9fbe57cd96d1a5848a8ba12d9a6bf4"
 PR = "r0"
 
 SRC_URI = "http://0pointer.de/lennart/projects/libdaemon/libdaemon-${PV}.tar.gz"
-- 
1.7.10.4



