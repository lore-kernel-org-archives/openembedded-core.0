Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.1337.1591132513778317195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 14:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=gbgRvet6;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id C1A966012F;
	Tue,  2 Jun 2020 23:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591132511;
	bh=h0hox+PX6q80KP4G3J9Kfv+Fwdq/QkBaC3oHvqb53Fk=;
	h=From:To:Cc:Subject:Date:From;
	b=gbgRvet6r4CezMQDIfONSrh9gxc2kyuLqXNEzbyedFRu5LB7+y1Ab3XavcIMHBp0p
	 1+LWdnqLGdBzc0X4qCZQMvG/+wUldxk9KNA7kRCEkfThSJEEMuqEBHSmj8OsCK5Dpv
	 7IaUg4Xm0tycZJMAGUhbd2ysFWYRDNuCLm56CgUimK09K2bScwBen6/hmmivlme69R
	 ofPvx1WDKf7lSjx10CxoBQodPeiA8gkij/ySJcx3cBdN9EAdd5oV0QTS6kO+7TnM9g
	 3Jgz6AeJPulEiRd9Ggq34rYMTgI6iCb4nF905WgJ95II4gKslDlCtGMYr9PLW36ipp
	 /fCcg9fqHlNfA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] diffoscope: upgrade 144 -> 146
Date: Tue,  2 Jun 2020 23:14:45 +0200
Message-Id: <1591132485-30328-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://diffoscope.org/news/diffoscope-146-released/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../diffoscope/{diffoscope_144.bb => diffoscope_146.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/diffoscope/{diffoscope_144.bb => diffoscope_146.bb} (75%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_144.bb b/meta/recipes-support/diffoscope/diffoscope_146.bb
similarity index 75%
rename from meta/recipes-support/diffoscope/diffoscope_144.bb
rename to meta/recipes-support/diffoscope/diffoscope_146.bb
index 3a877ca..a3402d4 100644
--- a/meta/recipes-support/diffoscope/diffoscope_144.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_146.bb
@@ -7,8 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "4ee9d1a36086caa31ccbc6300ad31652"
-SRC_URI[sha256sum] = "9a45464b7b7184fa1ad2af9c52ebac8f00b3dd5dcf9e15dfc00c653c26fcc345"
+SRC_URI[sha256sum] = "a031605c043577c908052763e49b0bd9c1d4d8a169eaf41364900ff1d9566ee2"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.7.4

