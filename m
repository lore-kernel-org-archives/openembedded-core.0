Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7090B77035
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 13:13:55 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so64032521wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2i5h0DzFmDMmXtKCeDn82yNe2KkHvdtaRz/TNrH7NjU=;
	b=ufaWOEpkgV900n402bhKNgKCP9jlcQOrPFhMtFi+FNRQ+ZqKy3Gc9JcNgO+Lf9CpoB
	SC3SQFn2S++Vt/ar6s5AiE16X9X9yTQx88zBvoFF05ei9/kGlSJamDM4hwwpwCp45Cjv
	4DRuSw0Xxl4vFJ9FRjBlfAHwYIgfUm0PnP3lFc4WXDFhcBNfI1lL/FILSXpKRW9d/a8D
	9ae9FafyMn+9robN4+IwjKDyIUPAg1PCNORTOuF0fh9zgAoEuiypqm7hhyrxufz8wWU6
	iUg3NoBmL57wx0UF50ST61tHg2ZWsDsT+6Z6cqAykPhZ7ULc2LuvpFQr2+LWoO+RZlEr
	jKtg==
X-Received: by 10.180.105.234 with SMTP id gp10mr36288632wib.51.1442582036002; 
	Fri, 18 Sep 2015 06:13:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id p1sm14656040wif.7.2015.09.18.06.13.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 06:13:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 15:14:08 +0200
Message-Id: <1442582049-12108-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1442582049-12108-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1442582049-12108-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] insane.bbclass: drop extra line-feed in pkgname check
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
X-List-Received-Date: Fri, 18 Sep 2015 13:13:56 -0000

* it was causing QA checck name to be shown on separate line like this:
  sblim-sfcCommon-1.0.1: sblim-sfcCommon-dev doesn't match the [a-z0-9.+-]+ regex
   [pkgname]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a35e546..c01c34a 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1091,7 +1091,7 @@ python do_package_qa () {
         # Check package name
         if not pkgname_pattern.match(package):
             package_qa_handle_error("pkgname",
-                    "%s doesn't match the [a-z0-9.+-]+ regex\n" % package, d)
+                    "%s doesn't match the [a-z0-9.+-]+ regex" % package, d)
 
         path = "%s/%s" % (pkgdest, package)
         if not package_qa_walk(path, warnchecks, errorchecks, skip, package, d):
-- 
2.5.1


