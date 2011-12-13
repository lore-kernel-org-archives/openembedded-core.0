Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVDL-0000sV-UX
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:28:24 +0100
Received: by mail-ww0-f43.google.com with SMTP id ds11so12054547wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WCenNEOQGq0JZel6at0i8kdxtcyS7U27qJiyKhVfE14=;
	b=auvqj59VWVQKn4Lad+jcWBb5R/ivRpuy1ZUQSSaeGZKmoIjZpHFHuxkoHlUNvly944
	9pG0s/CktmVMOV157zQUF7okjBYBmzkAd974eJ4FbrsmG9IpJ9kWHY2Kdj8jGOI+swoz
	jQZ3IC/UtSB8M+TdlrOCccHx7+EIAlpu13hZs=
Received: by 10.227.204.66 with SMTP id fl2mr4477408wbb.16.1323793289058;
	Tue, 13 Dec 2011 08:21:29 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id 28sm27231923wby.3.2011.12.13.08.21.26
	(version=SSLv3 cipher=OTHER); Tue, 13 Dec 2011 08:21:27 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:19:51 +0400
Message-Id: <1323793193-31090-7-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 7/9] ncurses: drop empty dir to remove QA warning
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
X-List-Received-Date: Tue, 13 Dec 2011 16:28:24 -0000

ncurses doesn't install any files in ${libdir}/terminfo, drop that directory.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 98f45a4..1449f34 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -171,6 +171,8 @@ do_install() {
         echo 'INPUT(AS_NEEDED(-ltinfo))' >>$f
 
 	oe_multilib_header curses.h
+
+	rm ${D}${libdir}/terminfo
 }
 
 python populate_packages_prepend () {
-- 
1.7.7.3



