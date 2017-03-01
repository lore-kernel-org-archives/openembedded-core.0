Return-Path: <mcfrisk@kapsi.fi>
X-Greylist: delayed 1646 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 Mar 2017 09:36:34 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id E106071984
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 09:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From;
	bh=fHhPIMMiM9XVYo+E4AbDLR805TKo2g7Z3x3stX6CP8Y=; 
	b=SbB1Y50hR3JuVgjy5/FGKwo7f6BaBv9i+4Am/BYeBiwxkKrOkPJ/k87zMLrky5rr09p48ftiZ0Vyd3gebQWocu3iA/753GGsx4VmCSRKmEwgZFw4zi+9CwBz/+hrsnL9oUH5s3WfItrI8ASpjsZS3sjcGXmo06UIcWBpAMY1luEjbhMlSOCSkkWwp2epJ5nNiQo0DGqo8LEkAryZm19YZfdoU8zwvLHGQSSr9q8asTieNlwHMPwVHF+fmn9w8kxCqlQkmR/9e+9Cy+VQoBp8iFC/eD4f8TFCXvOSwRpXC8bIZXTFiSili6ZZzf31KyHaOF8dfqpHa0Rch3GO41IzCw==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1cj0Fu-00067B-Lh; Wed, 01 Mar 2017 11:09:06 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1cj0Fu-0005Rz-Ke; Wed, 01 Mar 2017 11:09:06 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 11:08:47 +0200
Message-Id: <1488359327-17544-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH] buildhistory.bbclass: use tabs as separator in installed-package-sizes.txt
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
X-List-Received-Date: Wed, 01 Mar 2017 09:36:36 -0000

All other fields are separated by tabs except KiB and binary package
name. This helps users, *cough managers*, who import this file into
MS Excel to calculate file system usage summaries.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 7251a2c..ee6addd 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -414,7 +414,7 @@ buildhistory_get_installed() {
 
 	# Produce installed package sizes list
 	oe-pkgdata-util -p ${PKGDATA_DIR} read-value "PKGSIZE" -n -f $pkgcache > $1/installed-package-sizes.tmp
-	cat $1/installed-package-sizes.tmp | awk '{print $2 "\tKiB " $1}' | sort -n -r > $1/installed-package-sizes.txt
+	cat $1/installed-package-sizes.tmp | awk '{print $2 "\tKiB\t" $1}' | sort -n -r > $1/installed-package-sizes.txt
 	rm $1/installed-package-sizes.tmp
 
 	# We're now done with the cache, delete it
-- 
1.9.1


