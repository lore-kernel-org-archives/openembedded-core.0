Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id B5B1A6E9B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 12:42:03 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id y6so274217lbh.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 04:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eTcOErFGjgNVjtnyQTq6y7pKpyYZ8/qOtIORlVYR9zs=;
	b=S3Yk9tO4foBtg34f5DVCc+odwfd19+W6Wx2YJyCCVCVq7rzLviblIOD5IGuXagp1rT
	Ln10oJnV7prQgBcINM6w19ykrZ9GvRBX05TshAiD7bwbbpYNEd9k1JpCtsONrHY3qPyo
	0R8z5xY0ZNWkwraz08c2rquGrophuHA/Z3Ra9Dngiz5h+qXoyahMFAhFV+BrfOIuRT7b
	G2lQUvaAXVN44YQBuHnVh25Y0e1rHMb1RYCxluNj8OkEuLGjLQ/ToMdSWb71n0343u55
	aU7mYRS8RqWbGEqFZ/mz1ppQPccugqRpBlr10lXGJRLMejatc4N2pjkY0PZ/P/iuldst
	yNPw==
X-Gm-Message-State: ALoCoQnl7YdQvXQ3f85paSM+wpZsMvrhgTSjE9UWFar4cYNBNpqVcDziJozANVSPPhJmQ9rXvTk/
X-Received: by 10.152.4.74 with SMTP id i10mr91414lai.58.1390912924021;
	Tue, 28 Jan 2014 04:42:04 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	mx3sm16345665lbc.14.2014.01.28.04.42.03 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 Jan 2014 04:42:03 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 14:41:53 +0200
Message-Id: <1390912914-31576-6-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
References: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCHv3 5/6] ltp: fix comment to refer to oe-core instead of poky
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
X-List-Received-Date: Tue, 28 Jan 2014 12:42:04 -0000

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


