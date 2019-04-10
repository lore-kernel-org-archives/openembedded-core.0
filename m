Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 58FDB7D924
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:23 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g3so2868865wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zcUfEmTVQFSeYHPOxnPEnBmzIgyXaEXk1WxAPLFSYDg=;
	b=r6gGtgwREHPrioZf81+Xvnkicl9fPNq9XfaQRC6i1r6TCnGhGfj1mxSr22a7GEUah0
	6pBizFeBBL5OUsqtaXpwGoZW8CEj5BFoNi4mzGJXAyamL8ARwxMNNf8EooATgIe3MRpV
	hOsTWxQ6KOKQzOaunfMBP5fQ0wQwBEfBjtReZ17MFfm5xi44oMBSmq+Jw5EEh7mSGx4E
	h0xIfWPHfxdBtKBRuEBla9mtFklN0m+fxJpy8kfuHzbGNdWuXDYHWgFhuyXzG40qVWNp
	ADaNjQgdpvvyiFfLTXugL3E7OEICKwNKALpoJaenkHIEJynKGFJlRU67JJ3qSwYDYod7
	4daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zcUfEmTVQFSeYHPOxnPEnBmzIgyXaEXk1WxAPLFSYDg=;
	b=Fd6AKgM8oJpmRWlwe4ZnATE3Zfo0XzM0G1+Dh2xF4Hy0Zp6tYjvvDRrwLR0wXUlRwj
	1qLkALmZJFDRzzHODzElHeWgOfveLqZpM7GBCnsyw+OQSUiHVP5q2jNAvMDY0USiJ91D
	A79OrcxV5A2/xJ6KSbep/rLe8ZcdInyQL1IeIAvLspWf19Drjl80rXL0SeB9dmFWRYIO
	fcC3vOjEzmDqNtFnW+b8UxS1kU1FColS4mgg4QDnA7Y6c2cGo/wPVgPpMGn5V8xcTYb0
	0nKdcDJLFgQ6+dj1aLcivi6bp81RKHjMHNrrHT2ql4F7tkr1J96xGO2L8fmRiXHONRCR
	sr5g==
X-Gm-Message-State: APjAAAX/8QAztaKRad/v+DNnp700QyB+QnpMJEhFCSq4uAAvfs5B9hhL
	HSsCxkhJqLpsdJ47XKmBzvLpp+4ZB98=
X-Google-Smtp-Source: APXvYqxI/xglNV77SgbRSLtpu4b2vbydK6KgiIhdcABa7CBRVOvBypXT+m7969Ie2ejd+0LPBJNJlA==
X-Received: by 2002:adf:f285:: with SMTP id k5mr12473785wro.110.1554901943918; 
	Wed, 10 Apr 2019 06:12:23 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:36 +0530
Message-Id: <c833aba64f26546894a0c58d8a59db75d18e2ff7.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 17/33] resulttool/manualexecution: Enable display full steps without press enter
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:23 -0000

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

Current manualexecution required pressing enter button to show each step
information, where this was wasting execution time. Enable display
full steps without needing to any press enter button.

Signed-off-by: Mazliana <mazliana.mohamad@intel.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/manualexecution.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 8ce7903..0783540 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -87,8 +87,9 @@ class ManualTestRunner(object):
         print('------------------------------------------------------------------------\n')
         for step in sorted((self.jdata[test_id]['test']['execution']).keys()):
             print('Step %s: ' % step + self.jdata[test_id]['test']['execution']['%s' % step]['action'])
-            print('Expected output: ' + self.jdata[test_id]['test']['execution']['%s' % step]['expected_results'])
-            done = input('\nPlease press ENTER when you are done to proceed to next step.\n')
+            expected_output = self.jdata[test_id]['test']['execution']['%s' % step]['expected_results']
+            if expected_output:
+                print('Expected output: ' + expected_output)
         while True:
             done = input('\nPlease provide test results: (P)assed/(F)ailed/(B)locked/(S)kipped? \n')
             done = done.lower()
-- 
2.7.4


