Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC8F76FD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:31 +0000 (UTC)
Received: by qgev79 with SMTP id v79so119333745qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rIX1QvDX0ksAknZQBPuqQgoe5DNmB4ZdtpPCxmwGwc0=;
	b=I3oBK5GFFpC2GEhSNLbflLx5gYjwVWKMtpIwW/48nesbc3wklBRgMuTc76Gn6IJ1s9
	4RTtqmDM49uuCe0raThn8Xl244rfB/paanMbpB2bTdzEsC2fxhAzf/73DT94Ax2qLfPX
	WOx7Mcg9p5N95Q0q1WpzExq8nNsVaMIapSayoh58vOrSIp7ivrrCAW8l3CFDV32jR8en
	uHxLKlYJQFItsKNAjufZ9x/hKtpvznO7ECtzTbHc5I68QUcnHMe+zhRdpYAcPD4FaUsV
	4hWtYZ5w44CPgVjzYi5scjsYXnZnV6fWUH6ywl1zBCjONGFNQJXxslV/y6trqaHTIVH7
	DvzA==
X-Received: by 10.140.40.100 with SMTP id w91mr23028223qgw.73.1442248291482;
	Mon, 14 Sep 2015 09:31:31 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w138sm6172059qkw.40.2015.09.14.09.31.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:16 +0000
Message-Id: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <cover.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
Subject: [PATCH 01/12] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:34 -0000

There is m4/ax_pthread.m4 macro which uses GPL-3.0 with autoconf
exception, there is no other occurance of GPL-3.0 use, lets mark the
licence correctly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/xz/xz_5.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xz/xz_5.2.1.bb b/meta/recipes-extended/xz/xz_5.2.1.bb
index e0ae48f..cf7fba6 100644
--- a/meta/recipes-extended/xz/xz_5.2.1.bb
+++ b/meta/recipes-extended/xz/xz_5.2.1.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 # which is GPLv3 is an m4 macro which isn't shipped in any of our packages,
 # and the LGPL bits are under lib/, which appears to be used for libgnu, which
 # appears to be used for DOS builds. So we're left with GPLv2+ and PD.
-LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+ & PD"
+LICENSE = "GPLv2+ & GPL-3.0-with-autoconf-exception & LGPLv2.1+ & PD"
 LICENSE_${PN} = "GPLv2+"
 LICENSE_${PN}-dev = "GPLv2+"
 LICENSE_${PN}-staticdev = "GPLv2+"
-- 
2.5.2


