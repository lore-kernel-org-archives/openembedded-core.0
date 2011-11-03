Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RM0dI-0003AC-PS
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 17:59:17 +0100
Received: by mail-ey0-f175.google.com with SMTP id 9so1322856eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 09:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=s3t+Xy3cSAFMyXOgWwClwPttvenIwjxtyJqbtUUuM7E=;
	b=m893TiaHrCeHZ4LCC8UDGfbIGAw9vZDv0/k/gOhZ1QHGObdWoe3IRu1xQspO2b2KCs
	QN8NXy+sVv16HYKTylI0waYVw8BT4nqeBZBCu8O+1I3ltw0H3uib1wdSZ4J2cFsWgHBd
	gSLr5bOCf5VvSg+95/5VHCFYhE6UfI48rE5YY=
Received: by 10.213.10.10 with SMTP id n10mr2313094ebn.114.1320339189822;
	Thu, 03 Nov 2011 09:53:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 54sm17365833eex.8.2011.11.03.09.53.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 09:53:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2011 17:52:44 +0100
Message-Id: <1320339165-25029-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
In-Reply-To: <1320339165-25029-1-git-send-email-Martin.Jansa@gmail.com>
References: <CA+chaQfT08+Vd7JyB4wZO8eF13HbY1Z_TiY8MVBV76vPsxd5fw@mail.gmail.com>
	<1320339165-25029-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/4] libnl-2.0: split to more packages, as meta-openembedded does
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
X-List-Received-Date: Thu, 03 Nov 2011 16:59:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/libnl/libnl_2.0.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/libnl/libnl_2.0.bb b/meta/recipes-support/libnl/libnl_2.0.bb
index 32705b9..f084537 100644
--- a/meta/recipes-support/libnl/libnl_2.0.bb
+++ b/meta/recipes-support/libnl/libnl_2.0.bb
@@ -19,4 +19,8 @@ SRC_URI[sha256sum] = "5a40dc903d3ca1074da7424b908bec8ff16936484798c7e46e53e9db8b
 
 inherit autotools pkgconfig
 
-LEAD_SONAME = "libnl.so"
+PACKAGES =+ "${PN}-route ${PN}-nf ${PN}-genl ${PN}-cli"
+FILES_${PN}-route = "${libdir}/libnl-route.so.*"
+FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
+FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
+FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"
-- 
1.7.7.2



