Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id A0D4F7E55C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:27 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id d30so3654513pgm.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=z0ONJ4C0DkNeibH/tCHJiKdZApswkvZbX3GkeOSykCk=;
	b=DJ8lozDXvK20Pm/xTUVmDD/W1S0tryxyBkpR1kc8HARZOnS9ZK+4RWnx6byaBF7UNv
	r1G7nqZNDmoqzQKsKLrVyuQ4Bfrk/bD8Um4Ec878s/qMiwf3KWlKCRBDdcJuKnDF+kRX
	WOrkm1BA5zMvh1n40i/Ftucjx5dz8dLUCqHxjpfIEgUsAAq1u3wZDibPuI4xDwHD82Vs
	n0+Dnj+FlKPk8UR4vhzeTS84NSP6mJsqpiWMzc4mGX+HQYZHdu8WGEdrIXZtzmeSmZlG
	Lk8nc9JS7j9QivOvnWzKVjm755b2rYJlewYE7ZYEKKsPB5Sv3wfXqgWvWNDfNZfY5bUT
	Yu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=z0ONJ4C0DkNeibH/tCHJiKdZApswkvZbX3GkeOSykCk=;
	b=ugWvc4w/OPoTcmeE/UtZt9pYLMhpjITfsRCZqtYE10E/0814OxJ0rwCVqadAVGOBUo
	GMoECkOOuryKcPRj0yJKWFCdntXxSkN4xSsyk6OnD14pJ3WqgVskpofO5Qz+RrYRznEK
	uY0UegQtpFwCKlGjjA6puJL47bhJQCXBkRMBulNxumlw/MFrWirh0K40aOH11Ymjd3XE
	lP4A+1K4yBkc1DMqRQMU8eVcvJ70mYeYuHk1TLQo5vzYquIbBnOnwmXqCxkPGLicv4Tg
	UjJNGuf8a+q2iZ32JaE3z1Shi91m47ahVFZhlxFEgu4ZLYSJOx0TPVLbU/NWWmH3ocNu
	4tSw==
X-Gm-Message-State: APjAAAW9lM4E437TRkoa+TpQO2LaFZIvKWWUwlbytEkp9BDu7ngWXSdQ
	VMmW96BxgFdAvVWRXs94qBY4Y4ln
X-Google-Smtp-Source: APXvYqxUttImaWSO0/cp1kyJ5o9Amc1uKXeMrgKEYhZjOARW3NlwJBjDalTZ29S0qPDSJUHyfmceiA==
X-Received: by 2002:a63:a84c:: with SMTP id i12mr11947480pgp.115.1560092068807;
	Sun, 09 Jun 2019 07:54:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:54:01 -0700
Message-Id: <5b0e4d875f68656e90cfeccc1863b23ace32f17e.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 26/27] logparser: Add LTP compliance section
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:28 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/utils/logparser.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index abff8c7..cc6d18d 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -114,3 +114,40 @@ class LtpParser(object):
             self.section['log'] = self.section['log'] + ("%s: %s\n" % (result.strip()[:-2], test.strip()))
 
         return self.results, self.section
+
+
+# ltp Compliance log parsing
+class LtpComplianceParser(object):
+    def __init__(self):
+        self.results = {}
+        self.section = {'duration': "", 'log': ""}
+
+    def parse(self, logfile):
+        test_regex = {}
+        test_regex['PASSED'] = re.compile(r"^PASS")
+        test_regex['FAILED'] = re.compile(r"^FAIL")
+        test_regex['SKIPPED'] = re.compile(r"(?:UNTESTED)|(?:UNSUPPORTED)")
+
+        section_regex = {}
+        section_regex['test'] = re.compile(r"^Testing")
+
+        with open(logfile, errors='replace') as f:
+            for line in f:
+                result = section_regex['test'].search(line)
+                if result:
+                    self.name = ""
+                    self.name = line.split()[1].strip()
+                    self.results[self.name] = "PASSED"
+                    failed = 0
+
+                failed_result = test_regex['FAILED'].search(line)
+                if failed_result:
+                    failed = line.split()[1].strip()
+                    if int(failed) > 0:
+                        self.results[self.name] = "FAILED"
+
+        for test in self.results:
+            result = self.results[test]
+            self.section['log'] = self.section['log'] + ("%s: %s\n" % (result.strip()[:-2], test.strip()))
+
+        return self.results, self.section
-- 
2.7.4


