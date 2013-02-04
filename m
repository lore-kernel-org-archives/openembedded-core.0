Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2R6n-0004mD-8L
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 19:49:37 +0100
Received: by mail-wi0-f178.google.com with SMTP id o1so3314305wic.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 10:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=RB33Qc9DoZau8aSsJEQu6+wEKlh3RPX8ymdZtepRniU=;
	b=sL+Q9vbkFhsnoakzGuyM6Vac7Yorf+Txy7cHvI1SB+cfrTOII5r9+SfR9UK0NjhuCe
	sVobsQZ2dOQVHiD7Ac2/IroP/32RLGFYWBvhbAENRFrZRopHfb2r2xQQ6DlYK8+t2jSc
	M3IbSMXQ9Ml+pvxHDihx6AmLwxI86JWiO/RwIrYGYNb/36kzUfftPAhu/LucovkeXQM7
	2KamvCgyJUKA0SuxIXUjV8seV5dXFfqhafLwbisdNMTYNhRn9OeC+MDNmqqBqM3DZ1Vo
	8I9pFIbfvGKOaeNrEkyqe9Ry7Pv6ZYY8T0GMsAfN+6+gm97ijxfgx1I+prICoaR2SY3b
	wThg==
X-Received: by 10.180.73.212 with SMTP id n20mr12160786wiv.11.1360002829030;
	Mon, 04 Feb 2013 10:33:49 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ec3sm16458503wib.1.2013.02.04.10.33.47
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 10:33:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 19:33:41 +0100
Message-Id: <1360002821-23224-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1360002821-23224-1-git-send-email-Martin.Jansa@gmail.com>
References: <1360002821-23224-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] dropbear: fix RPROVIDES
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
X-List-Received-Date: Mon, 04 Feb 2013 18:49:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 3a39c95..8d94e5b 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -10,7 +10,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5b0c2f0d0c49dfde9558ae2036683c"
 
 DEPENDS = "zlib"
-RPROVIDES = "ssh sshd"
+RPROVIDES_${PN} = "ssh sshd" 
+
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
-- 
1.8.1.2



