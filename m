Received: from a1i711.smtp2go.com (a1i711.smtp2go.com [43.228.186.199])
 by mx.groups.io with SMTP id smtpd.web10.1897.1626310079874293855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 17:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smtpservice.net header.s=m3y3p0.a1-4.dyn header.b=Lgd7WSTn;
 spf=pass (domain: return.smtpservice.net, ip: 43.228.186.199, mailfrom: bt.mg0o3e1u20=ufb165favpi4=d1lzsjjrou@return.smtpservice.net)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=m3y3p0.a1-4.dyn; x=1626310980; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe; bh=qTSMKc06/YinQ+JxqlDkGMmPCE98Jfrnq389OJMwMbE=; b=Lgd7WSTn
	DdIwcVCcNWfiettPTtPiD7QBiG2u/SFi5Tp7l48yb5bLQ1ybur/uzOd2UfZl2+/g2l4MkbLD46xjc
	AafFD+GQ4WlRnYtPT3/2COLBBqRtT5yQj4u8WPoV2pHmkp1sMgiD5nsv15F5U4feOFsUbAYzg7TwA
	xD6IlxwuZ6oZgzSS4CLZEfcHRc24Dcl/cEVSyfHZ18QpBJy11WFpODoy1UE5lH9KqlDrwUHwEh5UV
	nnZUUt+dXCvvcixusJE7J13lKi3T4LdeXIq3cbVJabafNlfrfNamzXWEk/72Jx0Km3Ls7Xy/zAvmd
	Jj08nFwsoquCcvQaWy7rrUIk4w==;
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <tony.tascioglu@windriver.com>)
 id 1m3pXh-bePHtl-9m; Thu, 15 Jul 2021 00:47:57 +0000
Received: from [10.178.243.31] (helo=localhost.localdomain)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_SECP256R1__AES_128_GCM:128)
 (Exim 4.94.2-S2G) (envelope-from <tony.tascioglu@windriver.com>)
 id 1m3pXf-4XaDXz-Jt; Thu, 15 Jul 2021 00:47:55 +0000
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	tony.tascioglu@windriver.com
Subject: [PATCH] valgrind: skip flaky ptest fb_test_amd64
Date: Wed, 14 Jul 2021 20:48:13 -0400
Message-Id: <20210715004813.3628596-1-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Smtpcorp-Track: 1X3pbf4baDbzJt.77W67lr-GkVlQ
Feedback-ID: 184165m:184165a_VbNsp:184165sQ_BoxyVVD
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
Content-Transfer-Encoding: 8bit

Recently, the none/tests/amd64/fb_test_amd64 test had been flaky and
causing failures on the auto-builder. Until we can get to the root cause
of the issue, we are going to skip the test to reduce the noise from the
ptests.

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-all | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
index e69de29bb2..c3fc639066 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -0,0 +1 @@
+none/tests/amd64/fb_test_amd64
-- 
2.32.0

