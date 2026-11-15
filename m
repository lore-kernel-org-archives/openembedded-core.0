Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4316.1794732540382916794
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DEAyk0dF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2750057f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732539; x=1795337339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FZ0KoOQtUXYQz9YbBAv9LSX7PGvSPCRxqDtAdyPumPQ=;
        b=DEAyk0dFPAJD/vg77oaoop0G7woF4b1NHBBPKxQlN0+clZrce9QsknpvVy+oLS/QkK
         2k7Lt+4+Mfls+6XKgmbrMq6cCiyhYhi6JFqQUoeH96sfyRiwFlPenBME28klhoUh8Hx2
         LZQ3UyzVULHX8sZrvNXaSJedM24CfqNAdAMBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732539; x=1795337339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FZ0KoOQtUXYQz9YbBAv9LSX7PGvSPCRxqDtAdyPumPQ=;
        b=b8nA3XYb8RUVYWvgKrISwp3P5rKn1J66E3/3TkRaKY9ZJH6cfh8+iZnZFDPxK8fTOc
         KyjywzG5BoH8aTQWZiCxI0U8uNL+Za9yuqyF0N9yzngD0bV01dGoaKT2aR7w0GILvm4A
         F5gScJ3HIIQyRRlfZrPo2DTotO+lGB2kUTnYhapNKcI8Nn23JYchFWidY+fAeUN2RHjd
         DECO/HmakJ1lJ58+oxB2MOSmNfHiiHhjjOr5v0ZuwsOVR9ap/9oG4y7yQp7NKeUgmTHE
         ol1vEisMhyyQ6FzDBq5lcYqGDqxT7M60bUcBENGNXRRZnf1Jb5wnPyw7CX4kewhm/wZ0
         IZgQ==
X-Gm-Message-State: APuU4Z8RvKgupojY9HvO8x/cEDy+D6dG33wMZ3eWukhv6ppOI0NcCEky
	chLLTyCx3pNhK894B+N4xGjBL+pXY5qcuMpRelu2aa3OvKLHZsMTW/4v8obRZl6UvHRQsg5DKOr
	VAJY/B5U=
X-Gm-Gg: AYBFou3jRRyvQK3cneTzqxt+Q29/vQGSidNUhtBYmsaJQKt9L5vwgQpjazL5DJ0c45a
	ABgnWeUlFJ+YUIs/SxPSAJA9P9AUY4GZF3oXS+JdxmFp0m6yEl4Ky89I3UKe4Ja05FFf+ClYWtn
	9elddlFNP/rnkIIqpQ46N+FWOTajFAb1SHIVKTX6FEzE1Pd4YV76F8CmQH9su3I+e2bhEUtpXQo
	FppcqVgEqJaK7yK+fAeVoE6kp7JOyoN8Pvr7QtAkS6idzYElUZaL2OJlAlG/Jrv/wAgRApGQKth
	RioPFqsEP2/tm78XbB2cRxUL05H2HeIeV+PyksBwkX0cVWv67haFrw8a9AlN9C/y+6laxig1lgu
	f/1phct8PhiCpR0r7fn9sRSbSdNFxeCPBDvH3oPrxhxQvRqwU74Sr9toRnKWcePGJMtRdIuqwD1
	G/Udw6rDHrqLMLOaE8k1QOf1bDStno2AQo3eR69XB5ouvYiA29QnIoIOx7qAiEX3qspXIB6uy/A
	ldeAM1gQGN25UiS5ADne4Px/muxO7ziOHypQnx6x4xWKDggnRsaGXp5gwzO7A86xwAvZrlGdGa8
	4ERC5S6szyNT5YJLJBdMkaqb5M6Qt4GI5HE5xVg1UZy+6uaoP+tsAjIDuA==
X-Received: by 2002:a05:6000:4201:b0:490:9fe2:6a37 with SMTP id ffacd0b85a97d-49c70ed8f15mr18152968f8f.17.1794732538545;
        Sun, 15 Nov 2026 00:48:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.48.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:48:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/41] oeqa/core/utils/concurrencytest: Don't buffer output in the forwarding results
Date: Sun, 15 Nov 2026 08:48:09 +0000
Message-ID: <20261115084845.701136-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250237
Content-Type: text/plain; charset="utf-8"

BBThreadsafeForwardingResult set buffer = True, so the forwarding result
for each test process swapped sys.stdout and sys.stderr for buffers in
its startTest() and restored them in stopTest(). These run in separate
reader threads without any locking, and each result records the streams
to restore when it is created, which happens after the reader threads
for earlier processes have started. sys.stdout/stderr could be left
pointing at a buffer after the tests ran, losing later output and making
any later forked test process fail at sys.stdout.fileno().

The output of the test processes comes through the passthrough buffer
and is given to the final result, which does its own buffering under the
semaphore, so don't buffer in the forwarding results. Add a test which
checks the streams are restored after concurrent runs.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/tests/test_concurrency.py | 11 +++++++++++
 meta/lib/oeqa/core/utils/concurrencytest.py  |  4 +++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/tests/test_concurrency.py b/meta/lib/oeqa/core/tests/test_concurrency.py
index b44c006d532..f7b1f554c96 100644
--- a/meta/lib/oeqa/core/tests/test_concurrency.py
+++ b/meta/lib/oeqa/core/tests/test_concurrency.py
@@ -6,6 +6,7 @@
 #
 
 import os
+import sys
 import unittest
 from unittest import mock
 
@@ -53,5 +54,15 @@ class TestConcurrency(TestBase):
             for other in {1, 2, 3} - {n}:
                 self.assertNotIn("testStreams%d" % other, output)
 
+    def test_concurrent_streams_restored(self):
+        # Each process' results are read in a separate thread; after running,
+        # sys.stdout and sys.stderr must be the original streams again. Any
+        # problem here is a race, so run several times.
+        stdout, stderr = sys.stdout, sys.stderr
+        for i in range(50):
+            self._run(['results'], processes=2)
+            self.assertIs(sys.stdout, stdout)
+            self.assertIs(sys.stderr, stderr)
+
 if __name__ == '__main__':
     unittest.main()
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 455b70faff2..24b391cdb96 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -55,7 +55,9 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
         self.threadnum = threadnum
         self.totalinprocess = totalinprocess
         self.totaltests = totaltests
-        self.buffer = True
+        # Don't set self.buffer, the output comes through outputbuf. Buffering
+        # here would swap sys.stdout/stderr in each reader thread, unlocked,
+        # and could leave them replaced after the tests have run.
         self.outputbuf = output
         # The process' output accumulates in outputbuf; this is how much of
         # it was given to earlier results
