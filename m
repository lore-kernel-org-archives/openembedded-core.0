Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id D502F73166
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 01:35:42 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id o67so74743887iof.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 17:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NDo9M5uAddU9M0QWWKBnGIEAIql1DymIropV85yVuyQ=;
	b=yWoqgDgVBAJs04CtztsR/+A87ZadjKi8cuACfPO/r3o0y4d/3aLpIgYY9plCJ49/XR
	9fd9w4rCvNwsiQmrEPGrPe79pucdHDF8+WkGas+kF4AuiLyExSHZdG58psvo75nvUBUB
	OQmxOEe8L4HpmLgv0EGKePasr5hM5ljPPnmgvzxS5YEI/t8hDFSeEJimSZc2KGQBnnl8
	xYL7dFdgke4Ve26liS2OEaLBC7P8kix22GIxn5HOBPdZKlhwIRSrWvSyIHHVLH6NeJ9s
	MuxsuXv027e4wzf/jHMPzhDfVQuEMQoVlLZAWQRTm5W0C/YNsbqKGdCNKojk4fqICYZn
	Z5AA==
X-Received: by 10.107.17.92 with SMTP id z89mr1891133ioi.97.1450402543846;
	Thu, 17 Dec 2015 17:35:43 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id w8sm1745659igl.0.2015.12.17.17.35.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Dec 2015 17:35:42 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:35:25 -0800
Message-Id: <1450402525-11430-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450402525-11430-1-git-send-email-armccurdy@gmail.com>
References: <1450402525-11430-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/4 v2] valgrind: include aarch64 in COMPATIBLE_HOST
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
X-List-Received-Date: Fri, 18 Dec 2015 01:35:43 -0000

Valgrind has supported aarch64 since v3.10.0.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 0481c63..4c602ce 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
 SRC_URI[sha256sum] = "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
 
-COMPATIBLE_HOST = '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 
 # valgrind supports armv7 and above
 COMPATIBLE_HOST_armv4 = 'null'
-- 
1.9.1


