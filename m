Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id AC3F7606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 11:52:37 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so55252952pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 04:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=xa+9ltXh0MnivimUldFRR5cYE65h3+rlc1Vq8Qw57TE=;
	b=mOr4lA9GKjKIQqShJU7HQhPANA1lXNM0NdfvPLickeC5BqT1f3JK8M6krF11HqSrmg
	KQ6+/EcCNewddkNMJujGipQMauz9X29LEvdjbnqtf127dTPa1FhGHvR2Ro5FCGen1Zi/
	KeX1XqzsZFkxq3LCvHBjTPH+tG8Ik7xmIWkh7EShDCYB1DNHLEdHn4BG0aIluAAzh2GD
	SetzLAqF6N4MaU+SnRiw19EU5sveUAfyrI2JR/NshDlFoO3FELAamZatGtbxC+2UnQat
	JDJ5VA7f5fUgJQEfUxCiqjBPTFVm2z7hdsIhtPxMV4TD4Myi/H4vqNkKntSjX/1RPwk8
	b7ww==
X-Received: by 10.70.130.5 with SMTP id oa5mr1968776pdb.55.1439812358063;
	Mon, 17 Aug 2015 04:52:38 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y9sm2852941pas.42.2015.08.17.04.52.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Aug 2015 04:52:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2015 04:52:32 -0700
Message-Id: <1439812352-23339-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH] [v2] lz4: update to 131
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
X-List-Received-Date: Mon, 17 Aug 2015 11:52:41 -0000

Clean up SRC_URI.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/lz4/lz4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/lz4/lz4.bb b/meta/recipes-support/lz4/lz4.bb
index 0b0c632..18e56d0 100644
--- a/meta/recipes-support/lz4/lz4.bb
+++ b/meta/recipes-support/lz4/lz4.bb
@@ -4,11 +4,11 @@ DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing comp
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
 
-SRCREV = "5780864c0ce08622238a267c46fb489d7066cad4"
+SRCREV = "d86dc916771c126afb797637dda9f6421c0cb998"
 
-PV = "128+git${SRCPV}"
+PV = "131+git${SRCPV}"
 
-SRC_URI = "git://github.com/Cyan4973/lz4.git;protocol=http"
+SRC_URI = "git://github.com/Cyan4973/lz4.git"
 
 S = "${WORKDIR}/git"
 
-- 
2.3.5


