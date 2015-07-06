Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id D72066AC3D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:51:00 +0000 (UTC)
Received: by iecvh10 with SMTP id vh10so121763980iec.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=j4A2bI9a5Z7c8cXdyc3f4iByfYL/raaMO46J87y2PnI=;
	b=zmI6ntUi/9b+vTZ5WfADS0qzC/AJV4mK5vBER7ekQN9o7WpjLog0URlifu9d4jmidb
	HtXam2b/7Ns7SPosNw1mPpyHHl0hQ5y3Lvnrc3GPVugXHv70Fk8ft8UWkC6eMdgpvySb
	cAJ4zZ/O6tIEzfaJT8pQhZQc/f7m7xPOf1JB1zgC7P+vUzFJIFdB8KnGumckm2ZbnCCg
	LbTtM7gJe55Z9PCUAPhKfyBPye4/D664O4HxfFnRJBFfcGRFTXdV/Olzbi6mYgZ0Hpyx
	DfwhVdbdHAjiA9IrM7z6fC1LqyqMtIwHd34QXGQ2RBoSchFdUNvVJ5Y4WwMJa/o61ekH
	sHdQ==
X-Received: by 10.50.1.116 with SMTP id 20mr26344616igl.10.1436215860862;
	Mon, 06 Jul 2015 13:51:00 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.51.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:51:00 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:50:09 -0700
Message-Id: <1436215810-23722-13-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/13] texinfo: fix typo in dont-depend-on-help2man.patch
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
X-List-Received-Date: Mon, 06 Jul 2015 20:51:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch b/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
index 6e216da..876e0d0 100644
--- a/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
+++ b/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Inappropŕiate
+Upstream-Status: Inappropriate
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
 diff -Nurd texinfo-5.1/doc/Makefile.am texinfo-5.1/doc/Makefile.am
-- 
1.9.1


