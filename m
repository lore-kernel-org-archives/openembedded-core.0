Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 017D7731A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 01:09:33 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id n128so21656992pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 17:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RA4IK2gHzToR/jUSpP7w6w2Ig6PfYp9xTpTgh2locG0=;
	b=YzSC+R/0n62P8PZ/n831QscbjxAF9ZR2HJNqFANrYSuhz78l3//W2C1YJ15uRTKDH7
	CXScPH7uC/7U66ybqyNcB8Yo4ml4oxcpF0GsQ2oH5QkkeZ52/bw3/V8cPnCkcYb2oulq
	clUBgBj+JEvcwLUNad5/2ka4dBtim8g4Z0VjXW/VWdBXaRVsLq+nqOxtXS6yOnbGSgtp
	dDzsuu3HuguPB2R8PEZgNlZtEY8GGYICWYUx76QUjA6j++7zFw/wgxGbpEyNuUGjDQ01
	YWuDg8uiAmzLXDE0axzWsZ4iNQc/RKlAwtX0/NVZmCPwNEYxh5LfCd/Se4FZao4X3P0c
	h5qg==
X-Received: by 10.98.76.72 with SMTP id z69mr1161003pfa.35.1450400974511;
	Thu, 17 Dec 2015 17:09:34 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ah10sm18207114pad.23.2015.12.17.17.09.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Dec 2015 17:09:33 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:09:04 -0800
Message-Id: <1450400944-10350-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450400944-10350-1-git-send-email-armccurdy@gmail.com>
References: <1450400944-10350-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/4] valgrind: include aarch64 in COMPATIBLE_HOST
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
X-List-Received-Date: Fri, 18 Dec 2015 01:09:34 -0000

Valgrind has supported aarch64 since v3.10.0.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 9e18ec1..ed609e1 100644
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


