Return-Path: <dbaryshkov@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3712E7638A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:38:37 +0000 (UTC)
Received: by lahh5 with SMTP id h5so26381071lah.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=cMdlMZy1+F58eRyXfqAQc3wTCUWBnqXl4KCNNDmRdTw=;
	b=whWqVxdLMVFwtLv1cZ3C34poQ4px3+uNji4zityY4xZ/fhKdcRMJ09ncbBAWdHEEYl
	yMu2puHFfu1dWmnTvhsJZV5CSueQsCpCxiuegcgJS9EFOWrUbX8CrUuVlalBdYOXIRjB
	lmwewKGMPDwT1GGjar/22TUIa+C7zzrlyElfVHnVvOEqDIf0Vs5s+NTWFYcIXjCsAchL
	vp2eLeSDIed534VY8sUOhWjip9KqvX3I9tA+QbzQj/SGp6eKD8pLz0ohQIgm/nqQhfTD
	C8Ko4yFc75t9SPE3ceAGKOaatx+hpcwmYUUpkQqwT1MetuyMKDjpmHmwedaK3n2LZVEQ
	govw==
X-Received: by 10.152.203.162 with SMTP id kr2mr44854787lac.57.1438267116767; 
	Thu, 30 Jul 2015 07:38:36 -0700 (PDT)
Received: from umbar.auriga.ru (cl-1614.mbx-01.si.sixxs.net.
	[2001:15c0:65ff:64d::2])
	by smtp.gmail.com with ESMTPSA id g5sm289701laf.33.2015.07.30.07.38.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 07:38:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 17:38:21 +0300
Message-Id: <1438267101-31613-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.4.6
Subject: [PATCH] cross-canadian.bbclass: support n32 OS variant
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
X-List-Received-Date: Thu, 30 Jul 2015 14:38:39 -0000

Add support for -gnun32 OS variant which is used by MIPS64 N32.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/cross-canadian.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index a4ce5c7..976a545 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -30,7 +30,7 @@ python () {
 
     tos = d.getVar("TARGET_OS", True)
     whitelist = []
-    for variant in ["", "spe", "x32", "eabi"]:
+    for variant in ["", "spe", "x32", "eabi", "n32"]:
         for libc in ["", "uclibc", "musl"]:
             entry = "linux"
             if variant and libc:
-- 
2.4.6


