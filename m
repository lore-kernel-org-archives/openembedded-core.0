Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id BCA8F7FF24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:58 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id t6so2961328plj.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YMrEifQ6fSK0Z4Ag0GvH0LYX4Bm/1wEY2yU7rszuQ38=;
	b=pOFzdPZ4ZDYtFI23nu8WMLTPW0wOC0o10ENh+7yAdjneHL8ugA13YprSL4NhnLFRdn
	yY8zuYXI5Kmaf+clIlnLX0Wuo5WS8qrSQ9MYSCDuw7fkO7w/uzFJhlfozWz005WQIAwu
	+DFjwYPoWxQGRy4OQG3B/8GoT+dZzQETUjPrUWPXq98k8kadHNBFxrZ2IvqmWfaObP88
	EtWlP2XfFHrWmVWpxaIo9FRT62aYebaLlfMBBxFGmATsj5c3wpfp21eaeOSKoQ+O0JTb
	sv464uO4XHDfuOg5raj26Q/NuHravWcQ+g9lgUrV0IGxs8c0ISJdRu/QCfq4r0dlGW0F
	x5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YMrEifQ6fSK0Z4Ag0GvH0LYX4Bm/1wEY2yU7rszuQ38=;
	b=Cs0KnZHPVOmC5JYE3jNreVdoCDaX+z+2AuETfVXTIV4yjF1wJ/KjsIRDmUaxnJ5qPs
	mCmJQTnMHLP+OtcLIKa0v7AiuhVXTRRoO7XZKU9a9olr7BnwoEUEceVtnVMqSMoQer/C
	cLB6EWu1cHkK8rxobJta4W8wE7YRW49oxu10fw0+3PwjTrLS9QWlzNqkcnmXOXXtkAeD
	5dbJfIk8RQryi/dvp2lmUOGikjtTGwx3TEHfbeJlK8mARj8HrXA/quMTx5uc0SKTxP9P
	OFq5bRm6KJoysFuBTxKUJIjWsRY1tONgf/4HAdMoXohJUW5RnLjjSi9m5Dzt7+JwLilg
	Qong==
X-Gm-Message-State: APjAAAUGWf8t0tArKh78kHqSrc1e8d/bMZzf5QLDo4lM2ENiGBcRJ1+M
	4jTFoJipmMXl+PJDY8RftcMXGhzV71E=
X-Google-Smtp-Source: APXvYqzikjNcVBhXNFkpOeTX/EQihEjIOX2cfEPS3P5yje1SCv0q9v3hE2BT68IC5vuVDwYzb1EPxw==
X-Received: by 2002:a17:90a:a406:: with SMTP id
	y6mr1861167pjp.115.1580066879630; 
	Sun, 26 Jan 2020 11:27:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u20sm12987091pgf.29.2020.01.26.11.27.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:50 -0800
Message-Id: <8bd5ce3c5af8ad00e3fdef6a086b7366140cb7c1.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580066507.git.raj.khem@gmail.com>
References: <cover.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/13] go: Disable PIE on RISCV
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:58 -0000
Content-Transfer-Encoding: 8bit

Its not supported yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go_1.13.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go_1.13.bb b/meta/recipes-devtools/go/go_1.13.bb
index 483e2e2cb7..5d40cf9d04 100644
--- a/meta/recipes-devtools/go/go_1.13.bb
+++ b/meta/recipes-devtools/go/go_1.13.bb
@@ -3,11 +3,11 @@ require go-target.inc
 
 export GOBUILDMODE=""
 
-# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
-# doesn't support -buildmode=pie, so skip the QA checking for mips and its
+# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips/riscv
+# doesn't support -buildmode=pie, so skip the QA checking for mips/riscv and its
 # variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH',True):
+    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in d.getVar('TARGET_ARCH',True):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN',True), " textrel")
     else:
         d.setVar('GOBUILDMODE', 'pie')
-- 
2.25.0


