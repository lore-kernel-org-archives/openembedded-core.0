Return-Path: <ticotimo@gmail.com>
Received: from mail-vn0-f43.google.com (mail-vn0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 972DA736BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 05:17:23 +0000 (UTC)
Received: by vnbg62 with SMTP id g62so12852378vnb.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 22:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5Hek1N0uABjk5p2m4AMTL76liqLmLYos5UJ20uTZqDo=;
	b=fyYWjuRbr/itfgYx+rhMfD8Kz6TWj0KqpiU/qnwOQfDhslmybj/GdAu8aoyws2RX/K
	MN2qmpkapyCHq3BJh+sSDmZxddXLj3DN6uBPCQi1aCHtXPpKl65FU6KbqoRXnvjE7J1/
	b0Y4JkzBNjh1jX45UtmcB9u3Wa486JBp9y8yYRAeu/FdZCdz2KRjRJur77Qx4OYig94B
	qcZZgBiESv8BdqNEbsk7zqjvgPbJjuPr8kT+6Rzg55TkEDUPY/fg0hmxFd0xLLYMtEwU
	kwQ96e4fKEe4rTkhjwsiNsneMpQwg9/AWXG82pw3x/fiL1gLDUdD2ofsHLKmbVYPlNEi
	4G+w==
X-Received: by 10.170.115.145 with SMTP id h139mr23653393ykb.119.1428470244824;
	Tue, 07 Apr 2015 22:17:24 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by mx.google.com with ESMTPSA id 2sm8272561yhi.6.2015.04.07.22.17.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Apr 2015 22:17:24 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Apr 2015 22:15:56 -0700
Message-Id: <1428470156-19678-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] python-2.7-manifest.inc: add fractions.* to ${PN}-numbers
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
X-List-Received-Date: Wed, 08 Apr 2015 05:17:28 -0000

python-cryptography requires fractions module which is currently unpackaged.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 12f775e..2fb748e 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -175,7 +175,7 @@ FILES_${PN}-netserver="${libdir}/python2.7/cgi.* ${libdir}/python2.7/*HTTPServer
 
 SUMMARY_${PN}-numbers="Python number APIs"
 RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
-FILES_${PN}-numbers="${libdir}/python2.7/decimal.* ${libdir}/python2.7/numbers.* "
+FILES_${PN}-numbers="${libdir}/python2.7/decimal.* ${libdir}/python2.7/numbers.* ${libdir}/python2.7/fractions.*"
 
 SUMMARY_${PN}-pickle="Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
-- 
2.1.0


