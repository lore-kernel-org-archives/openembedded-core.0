Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id ABD3973D3E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:20:58 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so37721515pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=c3nkbtSddLYCoIuqQTIQn/IvHJ45kMSCsGe/HWBO98I=;
	b=sY4DpLeUVLDKx6v3Xx+ZMjP3e5bc8WX+iEHpBP4PP5heL2UAVirPwGqTvzEm7ZKO3B
	UAow7E5eV6KkdL7hvFxP3YZ2aLk4wYPQR827ajeh7w+NyWuMi+b4dyGzQzrJt8ySAyx5
	lb8uztasue1ZUq/YsFIzKhLUysd9EYqwy7iQ2mtiOPTB8jaql1hckHwsM06RV1SR4PqQ
	Ahce+syeUBnvK2eCyEY8Q6FlmrJ1vLWctSRIQlStpWhCelqjetQT6VP6z3OX0AKq2mLG
	nx2Ynp2cTg3Okrep4xPFkuiOPAEjS5VLb/VT8JCqhDs5T8RCEIiYyXl4Tyk8vK0m/bKv
	wucA==
X-Received: by 10.70.87.195 with SMTP id ba3mr7158708pdb.126.1428715259778;
	Fri, 10 Apr 2015 18:20:59 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.20.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:20:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:37 -0700
Message-Id: <61be5cb68f45b55a51295d749cf122760d37bbbc.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 06/17] vte: Pass _GNU_SOURCE via CFLAGS
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
X-List-Received-Date: Sat, 11 Apr 2015 01:20:58 -0000

It uses function extentions like  ptsname_r()
so we need to let build know about it

Change-Id: I5a06d08c56529a6b2cf3adf264656ae03b95c1d4
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/vte/vte_0.28.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index 485187d..9dab390 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -6,5 +6,7 @@ PR = "r6"
 
 SRC_URI += "file://obsolete_automake_macros.patch"
 
+CFLAGS += "-D_GNU_SOURCE"
+
 SRC_URI[archive.md5sum] = "f07a4bf943194f94b7f142db8f7f36dc"
 SRC_URI[archive.sha256sum] = "8d04e202b617373dfb47689e5e628febe2c58840b34cccc4af4feb88c48df903"
-- 
2.1.4


