Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id EBE7F72E10
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:53 +0000 (UTC)
Received: by pdjg10 with SMTP id g10so2408149pdj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=k4WTYmU3lxzCDs/drl/AmnrtKEjfcDfnvmrTdJbhZHg=;
	b=nIrD6FO7chq4KCeZcGc8bSANP7RrJ4GnGgykMKetpNok5JAGizHZj9vdIP+YXYdMJu
	Hucog1QH0FByuxls7/qqH0oIhng9i/XjwfOP3QgifAPjuzKZ6JKC4aUaHLTgutiPgUmo
	FAdEBebecVFL/5ysNUvu+mxYKhGHpIpfd9rArtnfX9e2/BudFsnx6DaxwMfjjWvOGyiz
	FmjWr4j1q7Xl/4VTpFc7builFmnk30+YqgQSMtWfYa+Qu4dBj2IKx0ZKn/7PGEC6CjQU
	OAb7ChfNiqdriyCUz2PZknbY50ehfi37qcJ50YIeKFB4tD09MWRg4lRmVXePuDCLATwa
	Pr3w==
X-Received: by 10.66.249.2 with SMTP id yq2mr5572513pac.40.1423152295318;
	Thu, 05 Feb 2015 08:04:55 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:29 -0800
Message-Id: <f90e6c957cc1379aba30c3feef140fa6c2d85b35.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 21/61] pax-utils: RDEPENDS on python
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:56 -0000

From: Robert Yang <liezhi.yang@windriver.com>

python script:
pax-utils/usr/bin/lddtree

(From OE-Core rev: b972e7fc5774a6daf92511e897919ebad29f405b)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb b/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
index 79e58ba..1b4ee0c 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
 SRC_URI[md5sum] = "bc42279c5aff3682c12be40f72805cec"
 SRC_URI[sha256sum] = "844ff25b1a11bcef92ef34b22f576f226a772b67196818656f8874513438f5b9"
 
-RDEPENDS_${PN} += "bash"
+RDEPENDS_${PN} += "bash python"
 
 do_install() {
     oe_runmake PREFIX=${D}${prefix} DESTDIR=${D} install
-- 
1.9.1


