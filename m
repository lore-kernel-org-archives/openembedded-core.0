Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4660B7FC0C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:48 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 193so12378938pfc.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Za5Mf0ZbJ+3eSksgfXnAffKxHS/Iz2fsIImwBvJ0OPo=;
	b=OsppPkuQ0G6oN3wce3s7+VJR3XDVZu+KPmPpr8uOfTt5d36eKdDKMPi2h3FEPJ6lbi
	EA4ixzPV1c31o4baA7tkg2fObcAtMdKaONkwFN2MsYu13T8tETHmX8h0XIcsdVuPjrIB
	Ap31ze5g3NnxEtiwe+UOcKAUVyEInWKlBVKtiyT0qRq4v6sDlFBW/NGGAmFaVReebiEu
	l4cHTRgjO1izAfU+u3odYKdR2/LMmv2JAd+P9QC8cbPfEd+EQ5s/crVVvBn4FcoJ+npE
	iBOP2c40Lx/cSl/k6ZlQqbzts5GI0zpYYjpSxYzaMvZ6n/JtOgJRvob8MHcGYHR+8Qze
	0q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Za5Mf0ZbJ+3eSksgfXnAffKxHS/Iz2fsIImwBvJ0OPo=;
	b=S0dk29A9OnEjPEoqMyByScrsFmoVkuwvjaiutz2K5Qlo4PzXVkJo3modyH2RNPXLBR
	jsiO/oBWQkICiV+E7hxbJQ+R8XZXf8rhcU2sKbSBaUtyLoWZelHLyF+JkqXmpu9AxdAc
	KhkrZb1OgwMEKN3xqjUurOfLEXWqVcgabspeXQMCjrk/+QTMXgmqU4OmUC3cazkd8QOZ
	WGdiOmdXvE4JprpeLet9q+4byVShcEQGlwhd/BLkFxOo9J/IxPe3wM8ycuRMNUZ3tbUu
	NyJV1ZRYbOEB76ikrArGUodMJq1SnEBJtHM2RAtM0kMLHpgcL94t+kTLWWQUgb1P1YCl
	6tSw==
X-Gm-Message-State: APjAAAU16RBQRZGbL5USnnqdgA0l7YO0RtaiIEhkRYalkKCe0gp1toqd
	zPZPiwruhUl24sJB2Q1TnfLzx5E5
X-Google-Smtp-Source: APXvYqw1ba+avra2P/tkDnIchh18OQNaEnmT4spW2rQP23oG+3lJpnyIUpVVVNp4Iukzj8/tIL6VzA==
X-Received: by 2002:a63:9543:: with SMTP id t3mr33140100pgn.350.1573533229055; 
	Mon, 11 Nov 2019 20:33:49 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:26 -0800
Message-Id: <df8da978928324cca66b4a9b00daafc717bbcc4d.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 07/20] manual qa: drop ltpstress test
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:48 -0000

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


