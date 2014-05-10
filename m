Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f50.google.com (unknown [209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED93601A0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 03:21:19 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb1so5134873pad.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 20:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=u2XWkOpoo2jWbD0cv59t0DGLBqJjAxwTODMvE8EQo7g=;
	b=N++cMKa4cNCxwWLAgVK5B6uuA8ovFlbuCThfuxTMKJjh3dpOTAy0hw6zvYA7Me1G2D
	PhwHpC1bygKELfo4MOvME4yB2cwdGtib6JGrQ99NDFDo8q0Q6rnLAC9iDnQKfUvwi/+4
	+LEp6U3/kcb1TNw3YNve3p4DWBPijU9CIcLMpyeYSLaFXZDgYlRlrQIFY8ZIkjMu7lwp
	lQ/sYGI5h5QIYG9HqRa8c0ynTuJXVhZLaKR606qZ2RbdryhVmLXePdCSH8KcVyjLpi+c
	7DaWwcKY544xt6XL+7SBLAaDkq/ttoC6r2UdsSKk+P3m0Q5ZF/G7E3PW0MUr/dOKt+Tb
	O2qg==
X-Received: by 10.66.121.164 with SMTP id ll4mr27259417pab.129.1399692080819; 
	Fri, 09 May 2014 20:21:20 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	gc3sm10147588pbd.93.2014.05.09.20.21.19 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 09 May 2014 20:21:19 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 May 2014 20:22:00 -0700
Message-Id: <1399692120-5878-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] licenses.conf: add AGPL variations
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
X-List-Received-Date: Sat, 10 May 2014 03:21:26 -0000

From: Tim Orling <TicoTimo@gmail.com>

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/conf/licenses.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index b41d0a8..c378a41 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -51,6 +51,11 @@ SRC_DISTRIBUTE_LICENSES += "Zimbra-1.3 Zlib ZPL-1.1 ZPL-2.0 ZPL-2.1"
 # Any mapping to MPL/LGPL/GPL should be fixed
 # see: https://wiki.yoctoproject.org/wiki/License_Audit
 
+# AGPL variations
+SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0"
+SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0"
+SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0"
+
 # GPL variations
 SPDXLICENSEMAP[GPL-1] = "GPL-1.0"
 SPDXLICENSEMAP[GPLv1] = "GPL-1.0"
-- 
1.8.3.2


