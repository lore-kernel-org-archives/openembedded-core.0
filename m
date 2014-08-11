Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 35D5F65E1B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 09:36:15 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so8357258wes.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 02:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=38jnAtYo97YPNFlLJ5IeWJs0SKwRanjjQzRnMuwjZrQ=;
	b=HPBOYO14Fm2oCEejrfNzn/Grh7Afqwqh3wLwnJ/PZE2wLkAZkg5QbHh5lIMcNaIT56
	aXn1iMqONjV/QHsSLFqtUaPrAeLsgKFuC2AGN4waTBHtWJHOTgnLF5tjtbUYZrgLiB+C
	Mcaf9Fxc1XU81IoUg+Tp/MfsUXACKf5q6nIenPewzhTTwZG1xnarPGoljOLezr26b362
	jjhN54y7i/YhyZi+Lptq56aKWG90BOhUZdzw2zt0umzgfdh3O5AJ5+Ojl+5OjDixEmN3
	zwJToBKwp/4ZPjx3L7keiy6Eu/ggQjBPv5eDeRZnrBA9bC3+UsemgjjaAQG/rN1fKbhP
	wQ1A==
X-Received: by 10.180.10.166 with SMTP id j6mr24498849wib.73.1407749776389;
	Mon, 11 Aug 2014 02:36:16 -0700 (PDT)
Received: from localhost.localdomain ([139.181.35.34])
	by mx.google.com with ESMTPSA id di7sm136710wjb.34.2014.08.11.02.36.13
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 02:36:15 -0700 (PDT)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 15:07:59 +0530
Message-Id: <1407749879-4971-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: [PATCH] gnupg: Added PACKAGECONFIG[curl]
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
X-List-Received-Date: Mon, 11 Aug 2014 09:36:23 -0000

From: Shrikant Bobade <Shrikant_Bobade@mentor.com>

gnupg can be built with or without curl. This should be explicitly defined
to avoid race between curl and gnupg.

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
---
 meta/recipes-support/gnupg/gnupg_1.4.7.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index 031eaf3..ddcc2c2 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -95,3 +95,6 @@ FILES_gpgv = "${bindir}/gpgv"
 # Exclude debug files from the main packages
 FILES_${PN} = "${bindir}/* ${datadir}/${BPN} ${libexecdir}/${BPN}/*"
 FILES_${PN}-dbg += "${libexecdir}/${BPN}/.debug"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[curl] = "--with-libcurl=${STAGING_LIBDIR},--without-libcurl,curl"
-- 
1.7.9.5


