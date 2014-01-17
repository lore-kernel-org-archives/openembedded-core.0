Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id B6C136DC16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 21:57:16 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id er20so4031947lab.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 13:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eTcOErFGjgNVjtnyQTq6y7pKpyYZ8/qOtIORlVYR9zs=;
	b=gIXyxQERBVIl9OJxxIItV6Xs6wLDqKO5vJvMpzWKh58zd7z0opOF9RRSxv89aZqbpl
	u7uwrCFfEZVkSqgZkH5DX69xgvh0xjsVD2/mdlgM+LB2P4UvSAs8ln/E4wvwD8d7F2Tg
	E39Z6CFDafpDPbYmepXXJP6ZD+P8JsKQqsk3KQgvMgYfuLJk6cNDIuabq4sJWhGmNo6b
	js7MmBJfplfjrAQ2zhaHit4r8L8ZIW8XOBn//Apq0aNRHejfVkAVee4aKZpWG31zhg01
	2+vtSrSS/+dB4Uj/x8fWtZDvrtTseP9/6KVAp/rM1aF+plXzGgzCJaDOow1Fl1az7Vin
	dsVQ==
X-Gm-Message-State: ALoCoQnMUOze5+AUYN2yVz+veq/XOT0JROM02b5f4TvjqFCx9kwm5QN5s//9LPuyoP0KiKTLqebY
X-Received: by 10.112.181.232 with SMTP id dz8mr2159619lbc.8.1389995837164;
	Fri, 17 Jan 2014 13:57:17 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id bl6sm7612764lbb.5.2014.01.17.13.57.16
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 Jan 2014 13:57:16 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2014 23:57:03 +0200
Message-Id: <1389995824-9066-7-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1389995824-9066-1-git-send-email-fathi.boudra@linaro.org>
References: <1389995824-9066-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCH 6/7] Fix comment to refer to oe-core instead of poky
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
X-List-Received-Date: Fri, 17 Jan 2014 21:57:17 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-extended/ltp/ltp_20140115.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
index d9c707b..4e20f24 100644
--- a/meta/recipes-extended/ltp/ltp_20140115.bb
+++ b/meta/recipes-extended/ltp/ltp_20140115.bb
@@ -43,7 +43,7 @@ do_install(){
     # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
     cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
 
-    # We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in poky
+    # We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in oe-core
     # We will add expect for enhancement in future
     find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
 }
-- 
1.8.1.2


