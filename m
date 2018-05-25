Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E6C5874D51
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 19:17:06 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id k2-v6so2679569pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 12:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f0NxZ+e1g7pqyWXOJJTqy4OJOD9NCGG2jC0m/qoKKgo=;
	b=Ezm2SvE3+A93K4qFGQwty7iZqrrtFXrgw3jz/RSXK8XvrIDw5Ys7JLGvP/NMRVUefm
	IfstZlnla/kd0o/A+6EdK2w97T8NFoIWEtn876m4k7qpi6BPqbLn/Vcwrkk9lgh3fA2r
	87sx6RlLRIX+OnpIpiBWl1IWUxtrrEb7NNAmlvPgLv8Wugvylo2o8xT1JEA/3f6aNoQ5
	lZF+aLghj6oDBtQMV5rGDlgdbe3X8kBo76em8/ZLfEsglv5oXv84nBLQjIViBWyjxWna
	niyGGHn2Vh44vn9JqUpKaKDPYjmnX7LZvFqi+DRQbZm5RSQGiFcKcEydPaREcH/Y9gm9
	rQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f0NxZ+e1g7pqyWXOJJTqy4OJOD9NCGG2jC0m/qoKKgo=;
	b=SneTDzJgkPnExdYoHEQs9Ehh6fvRTUTIzzjn1KhI21Q73scpBeO320aS5SE3hVT/E7
	9Ky4CIe5Z4yznUDRxj9HDT/ffsbO+oeP9wEE2dz6Bq3k0ddw8wuHkx+ss5tHLHLzWoop
	KzU/BvLPsB3jUwfIaoYa1RPKefa6QzNG2HRUdsAFb/0yxBPV1m86I/MB50h/qVdD35U/
	ZHrVl6Ez5s2pvz6nal4IiLlW7bNFVRbmMiJ/7Q5zmKRXM+y5W8xeTJat8PX6VA693E/X
	MxdQwjSWvx2GBx2GU88CHMbvFixhrwSK1hs1jYiYZrlhUAsQMrxWsDKZSOzk3dcRdoxN
	ICVg==
X-Gm-Message-State: ALKqPwcl1shJLdCok5HqIwd4gcc5e3i4JIVXAy9PS8RDd8HyILLycZNP
	hQDON1LPM7tvJgqDLeRLYUccfA==
X-Google-Smtp-Source: AB8JxZq5sXNgDCYsCjRpSZ3AQnzVlnoc3MYxniyDfrYeDYHjeUEjbxYAL3EcoqOpvY6KH526flcVQQ==
X-Received: by 2002:a63:740c:: with SMTP id
	p12-v6mr2947080pgc.259.1527275828085; 
	Fri, 25 May 2018 12:17:08 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h65-v6sm60154782pfj.54.2018.05.25.12.17.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 May 2018 12:17:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 12:16:56 -0700
Message-Id: <1527275816-6705-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527275816-6705-1-git-send-email-armccurdy@gmail.com>
References: <1527275816-6705-1-git-send-email-armccurdy@gmail.com>
Subject: [morty][PATCH 3/3] staging.bbclass: use single quotes for path passed to file in is_elf()
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
X-List-Received-Date: Fri, 25 May 2018 19:17:07 -0000

Align staging.bbclass is_elf() with recent changes in package.bbclass
isELF():

  http://git.openembedded.org/openembedded-core/commit/?id=7877761534b0c2492da6289e9f2269d41b6ed464

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit ab056c7f6065f310be4dd256ceb45f85ff981f69)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 033bd5c..cc07f42 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -83,7 +83,7 @@ python sysroot_strip () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file -b \"%s\"" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput("file -b '%s'" % path)
 
         if ret:
             bb.error("split_and_strip_files: 'file %s' failed" % path)
-- 
1.9.1


