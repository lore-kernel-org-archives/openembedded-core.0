Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Tx7ST-00040g-Nw
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 03:50:02 +0100
Received: by mail-da0-f51.google.com with SMTP id i30so2454705dad.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2013 18:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=hI30I3qjNyIxLcgHDTg5rrY3Ak7ccSwuqXK5fWHwkdY=;
	b=Z2bQ8qWk7luD5wAZhDFFPRcoDrMBe157cvQ1vA0Z5LcbuNDaWzNLH//dUDod5JVvgH
	ce3JQxNYi0a3KYhlPv/1+EiVWoq3MDiU773vsQhb1Jg1pViOvQi4S3aaSBvsAUqNexID
	DqB4xlZOmI0UMTOfoZyduwz8EI6Bc/cVA7pH5mEBZ+qBOWx6FpbUMtfqkLLHjhIN6Xut
	QyOS8o7/lnfnbM6fjBoPdfNbz4svXrSlo3kewIAsJTpep+7F0Hj4J0I/L9w2IeagoIl4
	JV2lCksxbukY+UhCLhGJXox/Afj4qxY9ZeEbMpTUq2iLnwlXWquJYkA4Q0wNX1yEHuPu
	gjsA==
X-Received: by 10.68.137.234 with SMTP id ql10mr44510168pbb.158.1358735672842; 
	Sun, 20 Jan 2013 18:34:32 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id bv10sm8272899pab.14.2013.01.20.18.34.29
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 18:34:31 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Jan 2013 19:34:26 -0700
Message-Id: <1358735666-7605-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.0.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] package.bbclass: drop unnecessary and broken packages.remove()
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
X-List-Received-Date: Mon, 21 Jan 2013 02:50:02 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/package.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index b06cca5..068ab92 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -948,7 +948,6 @@ python populate_packages () {
     for pkg in packages.split():
         if d.getVar('LICENSE_EXCLUSION-' + pkg, True):
             bb.warn("%s has an incompatible license. Excluding from packaging." % pkg)
-            packages.remove(pkg)
         else:
             if pkg in package_list:
                 bb.error("%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg)
-- 
1.8.0.3



