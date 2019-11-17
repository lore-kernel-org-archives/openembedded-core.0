Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 066C67F969
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 03:35:20 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id s5so8592038pfh.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 19:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Za5Mf0ZbJ+3eSksgfXnAffKxHS/Iz2fsIImwBvJ0OPo=;
	b=j7W0HdR9yQ5a94f7FAs2Gpn1wJayX+GHiw943X2qXbHZvKzgO9sjXofk24iWC7048o
	xGAPT/H6eoo1gn1KL2AdAk9OVzPcGyAlFETyq7Ben2fyHhsn3M+eE4t7c1JJidcI5eqG
	ER7byGb1VE4v/q829DAodjuXLaqblmKMQNtKn0p7+eFdWMTPxsjidwWoeEVXMVswJFYk
	7yW0pac/HEbZIsIJ5XIc4hlxOdKjgOWa5G3DsHkbI97WHbymapdEoR0ytxSeO11lg5fd
	DqfVaR/eP/bAUUbfUejGv9p33eTm/ug+0g9catfvXft8czPvtn/D6QKvhNCLgUzV7qOl
	6iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Za5Mf0ZbJ+3eSksgfXnAffKxHS/Iz2fsIImwBvJ0OPo=;
	b=rwSeNMjOLZahaZEeTFmm3k5lslICp0/NrToBCSSBeovp4tabEg+hTK6hgIJuPNSUth
	bqIr/7O8aDTETHtEdHPAvNaxm9MXtV9ZIy10VWSIZULrcfOYp4OoJL7GVcMyZkousoBo
	btSRc+f/AIcSLDZy7HcAvcUdWKkJzqx6qUgo8SJDd/JGjdoZDMCZZ3YRJ5YgeZzlqsdQ
	41L9mwQDgrLB4rjKLLtloxru3lxVWHyFv8RpLU4eYfCPSqtfHkpmrLXXpkgMmSxDRfzS
	E5pSEgNFEHM3xRkGiJsv/iToTAMYOrtxKD1w43c/hA1rA+U/BYtInX0ETiou2qd1islX
	EwtA==
X-Gm-Message-State: APjAAAVylt5StmeBQHCkozEp/OiP152nb+VKhyDxOS20QSvlgYnei8EB
	IFZYta7BMz5D06RNXM1MeayIvKqy
X-Google-Smtp-Source: APXvYqx9f6mrVBvG2OoLh9WmXEFK27qouzDx3Z/AbG3/KJfr8J1lhnjq106f/WfFjScasXkzdyKf9g==
X-Received: by 2002:a62:38ca:: with SMTP id
	f193mr27529943pfa.163.1573961721837; 
	Sat, 16 Nov 2019 19:35:21 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:a049:e40e:fb9e:4d3d])
	by smtp.gmail.com with ESMTPSA id
	71sm16666402pfx.107.2019.11.16.19.35.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Nov 2019 19:35:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Nov 2019 19:35:14 -0800
Message-Id: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/7] /oeqa/manual/compliance-test: remove obsolete test
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
X-List-Received-Date: Sun, 17 Nov 2019 03:35:21 -0000

ltpstress was removed in Oct 2018

https://github.com/linux-test-project/ltp/commit/e752f7c19674d9b2f7d37aed123561a3f6410e97#diff-5231627fc8640e0adb955f9e69c3c08d

Remove LTP stress tests
ltpstress.sh runs stress.part[1-3]. But these runtest files just
duplicate definitions:
* stress.part1: fs, mm, nfs
* stress.part2: ipc, math, nptl
* stress.part3: net.multicast, pty, syscalls

The definitions are outdated anyway. There is no point trying
to keep them sync.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/compliance-test.json | 28 ----------------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta/lib/oeqa/manual/compliance-test.json

diff --git a/meta/lib/oeqa/manual/compliance-test.json b/meta/lib/oeqa/manual/compliance-test.json
deleted file mode 100644
index e374c5b..0000000
--- a/meta/lib/oeqa/manual/compliance-test.json
+++ /dev/null
@@ -1,28 +0,0 @@
-[
-  {
-    "test": {
-      "@alias": "compliance-test.compliance-test.stress_test_-_ltp_-Beaglebone",
-      "author": [
-        {
-          "email": "corneliux.stoicescu@intel.com",
-          "name": "corneliux.stoicescu@intel.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "Build LTP with toolchain or in sdk image",
-          "expected_results": ""
-        },
-        "2": {
-          "action": "Copy LTP folder into target, for example, /opt/ltp. Modify script,  testscripts/ltpstress.sh, set Iostat=1, NO_NETWORK=1",
-          "expected_results": ""
-        },
-        "3": {
-          "action": "cd testscripts/ && ./ltpstress.sh",
-          "expected_results": "This stress case will run for 24 hours Check the result\ntarget should not crash with the program "
-        }
-      },
-      "summary": "stress_test_-_-ltp_-Beaglebone"
-    }
-  }
-]
-- 
2.7.4


