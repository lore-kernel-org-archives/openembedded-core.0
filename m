Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB7B4608DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:05:39 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t14so4606299wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bP6Cx2pVDaD8sH4FZlS9hzdCqNI1K18GkoMtrwr/Nes=;
	b=b3LKzw1yhIOO71FJax3BVNSivEfJ+JRKioJSZs2rUAZu3BQyoqlT4ntXa+z4HbxFCD
	pMS4dupRbGRRlI61csHZvZ6G6Y36EQaFJYaJTzBJL3iPbGuJuMLUucQIP1BWst+QvvrC
	Llfq3eNiEOzCHjnu5i74e5qC9IqtD9Ln4EBPs2a1N9le5zgaTc0+FHeZ99q4aGAWEWLM
	VY23ICKYFwjJHcixGjq8HIjRGWWXZT4dm7W0xecN8UgI8Y0DcF8PH2wd3IjLFP08h82+
	ASfA4/FFeCsr2ttpf8nI+8E6CWthUXOHzkIWlzo1GS7dzrjaNn+omB5wLgyoaEx46YXa
	7CVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bP6Cx2pVDaD8sH4FZlS9hzdCqNI1K18GkoMtrwr/Nes=;
	b=oZFywegLvI78lvAM/joeztAeszz3FFucwZlX0UUO4/J1dAsF/OXZDUEZXTm47KNKHn
	FeefpT+zTQG1mTI8RAAZ1DV3wYHRqK2uB5QPTcNxI+CEJUc/1SMHKU3Y0keEmyVGWIDt
	sjvnqf1PEq/A4eAJA3LJh6xTUukilcwg/k+gcP6g1kYqWvkkoBedhh8vikbmmo+Sqrd9
	SzuwJQCL94YUl26+tyOwG3eqRdDD8BIHkWAfXGT2doVJ3wHDSze0zoCqdbl9dRAdHL9U
	O96kcmNdq7HjoTB+qiGJfAZ7JPtaeJQEvkNkgjgV34idCvZ3ROjhkhAye3l0WmfK7DTF
	ECGQ==
X-Gm-Message-State: APjAAAX+aoUoTEAROkvZCmThWVR+CxdWW5DJ+xFsxkzrr7fLHKIvBSpI
	Agr18mfShaaBJng+BEKoLmH7EaU7
X-Google-Smtp-Source: APXvYqzyRe5ueRPd/+BOUASLjIphe/vPXLIb+ehhyZ9S4MQ58xt2H+EVC4eLNg90UBSx8KCvWjdu5Q==
X-Received: by 2002:a7b:c08d:: with SMTP id r13mr10670636wmh.104.1580288890916;
	Wed, 29 Jan 2020 01:08:10 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:20 +0100
Message-Id: <20200129090738.1398-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/24] bison: upgrade 3.4.2 -> 3.5
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:08 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/bison/{bison_3.4.2.bb => bison_3.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/bison/{bison_3.4.2.bb => bison_3.5.bb} (90%)

diff --git a/meta/recipes-devtools/bison/bison_3.4.2.bb b/meta/recipes-devtools/bison/bison_3.5.bb
similarity index 90%
rename from meta/recipes-devtools/bison/bison_3.4.2.bb
rename to meta/recipes-devtools/bison/bison_3.5.bb
index 46f0f908dd4..3d8f6579b9e 100644
--- a/meta/recipes-devtools/bison/bison_3.4.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.bb
@@ -17,8 +17,8 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
 
-SRC_URI[md5sum] = "d1ceb9dfde2d03b24a4c1137f7f1b572"
-SRC_URI[sha256sum] = "27d05534699735dc69e86add5b808d6cb35900ad3fd63fa82e3eb644336abfa0"
+SRC_URI[md5sum] = "c0230be066069f33c8445766833f3205"
+SRC_URI[sha256sum] = "55e4a023b1b4ad19095a5f8279f0dc048fa29f970759cea83224a6d5e7a3a641"
 
 inherit autotools gettext texinfo
 
-- 
2.25.0


