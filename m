Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id BDD027DD8C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:58 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id j11so4403852pff.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=B7Iu5QN3d3eagQmhxiLbThFdRjVHpJIUJIotJeYll0E=;
	b=YvNRmkdKrWV3fbmU80cgMlXCbpxxA+Ls039FLJd/JyCEieM/OYDYaIOM28d6yY0hPu
	pSDKlKBRl9MB0zAMrskM5KdAmPiTZjDGqC+Iu4JQJHLS3G6eJ00kKAEaKjmJxxJreTdP
	0pn/JU5cBeldd6xRSzS+Ijk5yVOKH8X86xnyccFqdNu5TKNASKk29AeBF3QhOCnkUBg1
	4SCuQU6mH1KI//l9qCvugjI8TWG6p1u5+lL54B7A/UiJv4yuKEpjAlzQokXpXvxG7PgA
	R4Plo1VOcUyIx94lQABAXnQ8ALdPZTQRd3Aw3Whirq98Pwv7ACKpMOsVoafbSZmI96YB
	ZxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=B7Iu5QN3d3eagQmhxiLbThFdRjVHpJIUJIotJeYll0E=;
	b=kz/0sXI3Vln43a8tdhOmdpWjR2SA7MgzzpUuiGfln9BJGsmqYiG8/YfMvqcrJ2aj5y
	a64EAga9rptsqSB/fHjhbsc/dPoqzwBBXc2N1tM9+kLXX1hl7vyt1WpvBrOkoQtMDHcF
	tMnI7BUUOPkyOLjaHx+vAme4n+hFla8GfiqFI0SOxjMjuMT1XRVUEdbHKR3ZAWPINyLl
	0/tOq8sk/PTTP9jZ0UvJgcSnwxjiJnj6hJ0IqpuqxBjZYNWa8CDwXgRmAF+k/ey6ZWa6
	yGXyMERQyeVPhb+62IXvO7AiJ3c+dMQOwjy0bTIfSIKW2ldWecMVBTFgCkFCCzpaUJQJ
	eZlg==
X-Gm-Message-State: APjAAAVCeUbdZGMJbfKmuGjPL7iplh2PNADYqLg/Ae/NrP7P3cRhcloy
	bLRCiJn/G7hOsx8AUE6QYoHj6bHn
X-Google-Smtp-Source: APXvYqyNPY4RRpvuAAkd2czr6mu+nbEuJWvLjbafWWSmAOqinz1h+zMbrQDXfER57zYQx3l4BlHnFw==
X-Received: by 2002:a63:2d41:: with SMTP id t62mr19431955pgt.113.1556983679804;
	Sat, 04 May 2019 08:27:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:10 -0700
Message-Id: <058d613af39a24cffe6053e0ff98b503c73e920e.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 34/43] python3: Drop ptest hack
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
X-List-Received-Date: Sat, 04 May 2019 15:27:58 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

With the kernel TCP backlog queue coalescing bug fixed in the 5.0 kernels
we don't need this patch anymore and can run the tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3/ptesthack.patch                 | 60 ----------------------
 meta/recipes-devtools/python/python3_3.7.2.bb      |  1 -
 2 files changed, 61 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/ptesthack.patch

diff --git a/meta/recipes-devtools/python/python3/ptesthack.patch b/meta/recipes-devtools/python/python3/ptesthack.patch
deleted file mode 100644
index 8cfa92f..0000000
--- a/meta/recipes-devtools/python/python3/ptesthack.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-This test hangs under 5.0 kernels onwards. It appears to be caused by the commit in the kernel:
-
-commit 4f693b55c3d2d2239b8a0094b518a1e533cf75d5 (HEAD, refs/bisect/bad)
-Author: Eric Dumazet <edumazet@google.com>
-Date:   Tue Nov 27 14:42:03 2018 -0800
-
-    tcp: implement coalescing on backlog queue
-    
-    In case GRO is not as efficient as it should be or disabled,
-    we might have a user thread trapped in __release_sock() while
-    softirq handler flood packets up to the point we have to drop.
-    
-    This patch balances work done from user thread and softirq,
-    to give more chances to __release_sock() to complete its work
-    before new packets are added the the backlog.
-    
-    This also helps if we receive many ACK packets, since GRO
-    does not aggregate them.
-    
-    This patch brings ~60% throughput increase on a receiver
-    without GRO, but the spectacular gain is really on
-    1000x release_sock() latency reduction I have measured.
-    
-    Signed-off-by: Eric Dumazet <edumazet@google.com>
-    Cc: Neal Cardwell <ncardwell@google.com>
-    Cc: Yuchung Cheng <ycheng@google.com>
-    Acked-by: Neal Cardwell <ncardwell@google.com>
-    Signed-off-by: David S. Miller <davem@davemloft.net>
-
-
-Reported to upstream kernel for advice: https://lore.kernel.org/netdev/85aabf9d4f41b6c57629e736993233f80a037e59.camel@linuxfoundation.org/T/#u
-
-Disable the test for now to stop ptests hanging
-
-Upstream-Status: Inappropriate [real cause of issue still TBD]
-
-Index: Python-3.7.2/Lib/test/test_httplib.py
-===================================================================
---- Python-3.7.2.orig/Lib/test/test_httplib.py
-+++ Python-3.7.2/Lib/test/test_httplib.py
-@@ -1114,6 +1114,7 @@ class BasicTest(TestCase):
-         self.assertEqual(sock.file.read(), extradata) #we read to the end
-         resp.close()
- 
-+    @unittest.skip("broken on newer kernels")
-     def test_response_fileno(self):
-         # Make sure fd returned by fileno is valid.
-         serv = socket.socket(
-Index: Python-3.7.2/Lib/test/test_ssl.py
-===================================================================
---- Python-3.7.2.orig/Lib/test/test_ssl.py
-+++ Python-3.7.2/Lib/test/test_ssl.py
-@@ -4146,6 +4146,7 @@ class ThreadedTests(unittest.TestCase):
-         self.assertEqual(sess_stat['accept'], 4)
-         self.assertEqual(sess_stat['hits'], 2)
- 
-+    @unittest.skip("broken on newer kernels")
-     def test_session_handling(self):
-         client_context, server_context, hostname = testing_context()
-         client_context2, _, _ = testing_context()
diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
index 579febc..7ef7cb5 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.2.bb
@@ -21,7 +21,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
            file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
-           file://ptesthack.patch \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
            "
 
-- 
2.7.4


