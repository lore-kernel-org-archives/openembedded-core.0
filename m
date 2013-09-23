Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f52.google.com (mail-bk0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF9A610FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 08:01:51 +0000 (UTC)
Received: by mail-bk0-f52.google.com with SMTP id e11so1007785bkh.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 01:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=FClHnnsyOhijcEo9PcAo8Uh7m8cvwN+DVqjW1jkUAi0=;
	b=bMZRElAcnvLepKZJQg2oYH1PTh5bzUf21Xq1/ppVGcXu8GcJHj5bwxVvH3Ew848UZ8
	lxBtyQYMJ/dmstZQTdN5d9CTdABee/eGLQlsgncCUnGhYobTFvHDC9JR6DhRh7wqH9sy
	Z/go+aM4SebNbsE9iKSd8H/TekPbgjQUeFKoJPCrO5ImbwlKXjVT+DFLhwo7TJsABvYQ
	11JWbkFPt2rqD/0jusKGkiDuyabCup0KTuEa4j26qaO4dzebk8VNr7uEyrdZTmAVt6Ef
	eHXpGmW3pFmjWAXCG87YlmSEsUXlyslzoq9vsja8CDSLK9NZUhMA4c6zpsRDyHpfZRGf
	NGGw==
X-Received: by 10.205.78.5 with SMTP id zk5mr16745775bkb.25.1379923311562;
	Mon, 23 Sep 2013 01:01:51 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id
	on10sm8153289bkb.13.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 01:01:50 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 4AE95400339; Mon, 23 Sep 2013 10:01:41 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 10:01:28 +0200
Message-Id: <1379923288-1061-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCHv2] Add makedevs to nativesdk
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
X-List-Received-Date: Mon, 23 Sep 2013 08:01:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a first in a series of patches to add items
to the nativesdk toolchain tarball.
Many of which are Yocto specific and needed to create a  
rootfs with pre and post install hooks successfully run, 
using only the toolchain tarball.

End goal is to create a sandbox where _users_ of a Yocto 
based distribution can customize a rootfs from a package feed
with their package manager of choice.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-devtools/makedevs/makedevs_1.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
index 2b9fd37..e6860f0 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
@@ -19,4 +19,4 @@ do_install() {
 	install -m 0755 ${S}/makedevs ${D}${base_sbindir}/makedevs
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


