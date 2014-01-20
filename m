Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id B63276DCFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 11:40:30 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id b8so5505649lan.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 03:40:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eTcOErFGjgNVjtnyQTq6y7pKpyYZ8/qOtIORlVYR9zs=;
	b=GD5agLFWASXfRq+8pfiwwp9ldsyUmUR4kuNQlXgLs3bZnPRKHz6eiMP++aSSs/G0Sj
	8nPLKDjiJiuoZTXsLp8li6VicCL/hztatmvSd1+N5qsFceEoxQ3K6HF8aO66P7IitgcN
	Y9q0aYJVUuOtcaLmyOoUJITh2AuTdrblBy4UWXN526YWobO8dId0abj5T5ffsztDRe28
	N+00mvKYvKVJupmHPUfuy9YbmWrzUDrZsIvK8Agkt3+8xdfJJDdmTQ189AEAeil1a8/O
	kScG0zV3uYjQtTH8V52TO4ENLL2+Ba6SQC0DkvJSV4VYYCWrSWuC87SFI9Qi7tbeZRPM
	xoiw==
X-Gm-Message-State: ALoCoQm4Cc2yJ1p1cKSFKQ05shhSTVVVA7CDf4CP4RXHoftrQafy+vkIt3WsY2Xcuh6BrOnLzlZx
X-Received: by 10.112.164.229 with SMTP id yt5mr8113536lbb.31.1390218031240;
	Mon, 20 Jan 2014 03:40:31 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id gi5sm609509lbc.4.2014.01.20.03.40.30
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 Jan 2014 03:40:30 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 13:40:16 +0200
Message-Id: <1390218017-10423-7-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
References: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCHv2 6/7] ltp: fix comment to refer to oe-core instead of poky
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
X-List-Received-Date: Mon, 20 Jan 2014 11:40:31 -0000

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


