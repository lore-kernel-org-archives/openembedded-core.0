Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id CB56260CFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 08:54:26 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lf10so14575283pab.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ie7YS3RzQH8xcPeQMvlo5Iasgfbqho+0oR0IeuB9NDk=;
	b=JgoTejjffwXCPqNFiNsK7xU+lmJpsFS0dgb8bGIN3vRs8F4NKmVKzta8IRnDl7gfaG
	KRCsUbsp6GvlG8iPwsk3Y7Zy1vL+1Us3HQsiyWQ45laQsyxGs87qlgQA8mN62BCPTWvC
	V0M0W3WRorYwkclT0AT3myvZQhHJryNX+VcDNI8zGpzf9YEJ6wu2v8O+3IqHtiZBzHPV
	Xgm6MXTSVkbKgy8BgXD6/23FL+RA/W9gipCdRUwRZ5zdQ98fnq+VRklPFfO1hGRjMYM/
	mQFBvIfpuFRb+EbtNqbnT1my9IUgin2IPFU4oUtlHfcuqebVYq8PEsVdbdjtys8NAwdn
	iwHg==
X-Received: by 10.68.69.7 with SMTP id a7mr2827603pbu.49.1407920067844;
	Wed, 13 Aug 2014 01:54:27 -0700 (PDT)
Received: from localhost.localdomain ([139.181.35.34])
	by mx.google.com with ESMTPSA id nn3sm1209929pdb.58.2014.08.13.01.54.25
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Aug 2014 01:54:27 -0700 (PDT)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 14:26:25 +0530
Message-Id: <1407920185-11814-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>,
	Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: [PATCH] autoconf: add rdep on perl-module-data-dumper
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
X-List-Received-Date: Wed, 13 Aug 2014 08:54:34 -0000

From: Shrikant Bobade <Shrikant_Bobade@mentor.com>

This patch adds rdepends on perl-module-data-dumper
for autoconf.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 8ed4b13..8b00fbd 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -23,6 +23,7 @@ RDEPENDS_${PN} = "m4 gnu-config \
 		  perl-module-getopt-long \
 		  perl-module-io-file \
 		  perl-module-posix \
+		  perl-module-data-dumper \
 		 "
 RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
 
-- 
1.7.9.5


