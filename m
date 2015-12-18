Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id E9B106FF86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 04:42:24 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id o67so78165899iof.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TtvqYll1FNrB4ofRvb8wgR78GguyUGP6iHddGw6K6RM=;
	b=eXRBzFXHaBrCGqJcq60EPVQCriwIg1iNLVSA70CYNM2qvxziGMOgg77UR+6Y5Pck0r
	tqAV9CxeCemqXOLGp4sA+hJT9u4pPPmRFcO1Mxie9O5NjgP80sQ0SzU62+ugQzb2MbEy
	2jFeWPTX8iXtTN/ExsVeLI34boJ8K3c60/ZIhVqAeKGFWEaXrpbj0EoIkg/eQv7seYMW
	/uUia/grK67dUrUmQ72G9C+BlFgIzEwTwT/btmkNIyM7H5fdUGtBEAkeNvDF6puTYHUI
	lR//M/2ndqWv9VHm+THX06oFHCHUnujRz1ccVwK5Q2FVhmvMVhDKZHTEyKdwYWhA5d/O
	76Ew==
X-Received: by 10.107.9.224 with SMTP id 93mr2290204ioj.112.1450413745723;
	Thu, 17 Dec 2015 20:42:25 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id c5sm2011003igt.9.2015.12.17.20.42.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Dec 2015 20:42:24 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 20:42:03 -0800
Message-Id: <1450413723-22208-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450413723-22208-1-git-send-email-armccurdy@gmail.com>
References: <1450413723-22208-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/4 v3] valgrind: include aarch64 in COMPATIBLE_HOST
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
X-List-Received-Date: Fri, 18 Dec 2015 04:42:25 -0000

Valgrind has supported aarch64 since v3.10.0.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index bb3f6e1..293dd2b 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
 SRC_URI[sha256sum] = "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
 
-COMPATIBLE_HOST = '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 
 inherit autotools ptest
 
-- 
1.9.1


