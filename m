Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1878A7C0C6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 18:26:54 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c123so8464088pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 10:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5Ykh+QCu5GFR7noDsocQAnqSCVB6DkjrEjVYgXzUWSE=;
	b=K2QJ2r8df5UI8bVOmbZYLpOnZs0ECnC283zR4ZvWWfJzFGGsh4eGn/6i+eG+uO5n8F
	JGn64N1mADOVgWX+EFw9ohVmsjRXzXj5mk8UIkmz/N5YfpdHC+vy3+JvYQZi3CpLe81K
	IxdJhm1qUyaw74DTR/7DQ4HtLa1AyyFDsk8cilTQxr1gG5XICg+2k2JgquRCqz1pE2hj
	EfXeGeNjUcUNgPpRQi95p7MsDEt+WjwvRu6gNxfbzfwvKi11ckm6z/hv0bPPbRO2N+Ua
	lsYBjbYxTRmMlAfI0GEDbsyBeM4htveUvw53te3ypcJrm27u5Q6HogkjepYNT5Tida75
	/8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5Ykh+QCu5GFR7noDsocQAnqSCVB6DkjrEjVYgXzUWSE=;
	b=PdVwOyp3mX830hY2gUx/851nF/18gxtNooAUF0UxqgTACfr0Rx0B0N++jHVCYGhz/d
	M/wKswenEbCUazRx/FW1z5mkx7w8kcFtMSymQBT3aIv0XBSw1REmigJZqXiwa4mSBWGb
	1W1aarcsMmDaqiz1ofhUTwihRWlm3MVmv34B7Pzlr7wvWPJAedEanRhiQXi4p1O4k15Z
	P9DA+9xQ6RRiz0n09bKI5QAklFHmd4aHbpt4GsMRgUAQDBaQU3OZ10XzRU/tOmuM3NDT
	4u6K3KD0b/7Z2wCsMwIHWTi/Ont68AEI5ydr9RR/dwm4/AxZg63BC6QI4kTU7RkvNmwt
	+pmg==
X-Gm-Message-State: AJcUukf6KToBmEoO/TxSy368AwNzaOGL4tKvJHYALWYlgaG5UNeWGw9Z
	6Dw7pVYNUOmqRo1747+sGee7fNtiHmc=
X-Google-Smtp-Source: ALg8bN4bimC4Agep6cFNgEvhSA8lLkZCbUlS0iGNKOzP+Rx4TTsPXI9SfKAd5pNFl7JC+pySsv+1Yw==
X-Received: by 2002:a63:680a:: with SMTP id d10mr17746283pgc.396.1547317615404;
	Sat, 12 Jan 2019 10:26:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::f58b])
	by smtp.gmail.com with ESMTPSA id
	z7sm104183151pga.6.2019.01.12.10.26.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 10:26:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 10:26:46 -0800
Message-Id: <20190112182646.4257-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa: Recognise svlogd as another logger
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
X-List-Received-Date: Sat, 12 Jan 2019 18:26:55 -0000
Content-Transfer-Encoding: 8bit

This is provided by runit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/oe_syslog.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index a92a1f2bcb..ad023fb363 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -14,7 +14,7 @@ class SyslogTest(OERuntimeTestCase):
         msg = "Failed to execute %s" % self.tc.target_cmds['ps']
         self.assertEqual(status, 0, msg=msg)
         msg = "No syslog daemon process; %s output:\n%s" % (self.tc.target_cmds['ps'], output)
-        hasdaemon = "syslogd" in output or "syslog-ng" in output
+        hasdaemon = "syslogd" in output or "syslog-ng" in output or "svlogd" in output
         self.assertTrue(hasdaemon, msg=msg)
 
 class SyslogTestConfig(OERuntimeTestCase):
-- 
2.20.1


