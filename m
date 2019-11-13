Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 993CA6C102
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:30 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q17so1584315pgt.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Hp5mhSTL0N1bRzREMD5gYau4boxvXGcw3NDt2vJCkfU=;
	b=PxFKEnjz9Ti0AyeBItCTk0xuLqtQ/hoC9LEeLpap7Gdb43PRZmXW9xkgeoCX01WL45
	ooIYm7tAFSyV3me3/gChfAQ70GDq7cTFDWeQL6Z3jBZVuhnNSUTOSSUZsQk0Fwxga/Zp
	tsrQahcpp6dCXUD8+YRgPwSxC0hWlpVu9QxrpMegzYrzCSuaZd+O7qxR6BAifr5DTAs6
	g/Oicp6H/+UEewWzXmjvM/bFEBDa+6zelMy0VzP2Bogpp42saGR6lNLgNFjRLpN1UWfd
	diW65E4b8AKOw5wqdszxWQZt9OMTg0dIRp9HW3Q6vpI7zlWNIeawjLfEnYc/G+DHcNS5
	vwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Hp5mhSTL0N1bRzREMD5gYau4boxvXGcw3NDt2vJCkfU=;
	b=Fvh+bQqovo9PudqRbm9I/XFF02aloZj+tXrWnnGxSbwgy92DoBAhB4b6p0NSPke3Cy
	2V46o3JI4NvQQ4h6x8MnGKYptxyycxigtS3G/arP5N0HxafKH0F3SR+PS+NMCjZfcrgk
	Is8oLw7axC/T7KfYJfXh9cAgHLcDxtFpHdnHgRlwQcTaPfti9GWGwN6IzNHsVfemKnHm
	+lAN8SVyQETsuZjy222/o/UmbJyaUFgGmRxYX7f4BcQXFnj947Osr1ROVs1yqnTvZkEQ
	CddesivKYtMJC7N5IzDuTzfw9YqEb6OcknC8VD4wLYrF90+L/gjvE5SX8GSyebXPIzmb
	9+ZQ==
X-Gm-Message-State: APjAAAWtrKwaCunTnl6QmN3xoMYnmYoaXc4ylTI0Rw8ego4X+stGvEVh
	iL/XVzAaYSQc1Bn5NcOm4Td/JaFD
X-Google-Smtp-Source: APXvYqwa6AscIl2RpiFFoCr5Zsjl373GU+oWBePqKawT77R0QhnRwlU1xbc3x670h5XhBnH/r+DIdQ==
X-Received: by 2002:a63:f441:: with SMTP id p1mr4355775pgk.362.1573659151483; 
	Wed, 13 Nov 2019 07:32:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:48 -0800
Message-Id: <16b98e759a33d9f20e5b40aa1cff5b1c27dbee9d.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 06/31] procps: whitelist CVE-2018-1121
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:30 -0000

From: Ross Burton <ross.burton@intel.com>

This CVE is about race conditions in 'ps' which make it unsuitable for security
audits.  As these race conditions are unavoidable ps shouldn't be used for
security auditing, so this isn't a valid CVE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/procps/procps_3.3.15.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.15.bb b/meta/recipes-extended/procps/procps_3.3.15.bb
index 9756db0..f240e54 100644
--- a/meta/recipes-extended/procps/procps_3.3.15.bb
+++ b/meta/recipes-extended/procps/procps_3.3.15.bb
@@ -4,9 +4,9 @@ the /proc filesystem. The package includes the programs ps, top, vmstat, w, kill
 HOMEPAGE = "https://gitlab.com/procps-ng/procps"
 SECTION = "base"
 LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                  file://COPYING.LIB;md5=4cf66a4984120007c9881cc871cf49db \
-                 "
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=4cf66a4984120007c9881cc871cf49db \
+                    "
 
 DEPENDS = "ncurses"
 
@@ -64,3 +64,6 @@ python __anonymous() {
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
 }
 
+# 'ps' isn't suitable for use as a security tool so whitelist this CVE.
+# https://bugzilla.redhat.com/show_bug.cgi?id=1575473#c3
+CVE_CHECK_WHITELIST += "CVE-2018-1121"
-- 
2.7.4


