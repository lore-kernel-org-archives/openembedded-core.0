Return-Path: <jdmason@kudzu.us>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id B1C547DE7E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 23:19:51 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id c7so5721597ybs.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 16:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PKFKrxFB5Csw4P/ADu231M2QxqofzYXqexS4nIQZMvM=;
	b=jubRMFCKfyScHMFrXfrWcSN1ymUwi+oe4Ox/4aV9gXgZ05M/EHLNzqVHCwDFS2pbbj
	WEB5G9qfuWq8djcjiFI4Peu5kMo7M6zUL4MV9Ukvov85PbpvSmFglHzRTxN5vOl6V9NT
	f2iNdsiDQf0Y+OBHrHV5YsBKD/0Wk79IlKnvBvBdaYetbpLLolSXSJTFdG5RDcbhuQzQ
	0AJ8beSVlLjEjBxRVQzcTc/nn7JgOXoI0wq42EjzSUC7qqbsCUp3kuvdG3XgAwtbZoeE
	Xl7jDXS3SADjI68h5QjGQkMwj0OCQ7ruRQ4VyQFSKM5FaWgylK+PtKIy6TEnjUCYLJ28
	F0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PKFKrxFB5Csw4P/ADu231M2QxqofzYXqexS4nIQZMvM=;
	b=tc4pqcYDfcuxEBXocFaU9tCtGR68L6ypBGJe5svtJtHcnOzdZgFhWwKXj9qwBkyUqZ
	P5GTlvjJRIav7MNgXZQG1iZeOWMGAYqiOZLXmVVDpSAfQwkYbxa/9317K5mrrSd6xij3
	9pvUjD/kyHUs0vP8ToE4NhMhtTj4tG4KmXWzSsvC3t3Llf4iFeUMNt/UTaze0Z/UumN6
	CW4LXDPr066SAT2/zXgze1y7Y+wwT7fOs5r4s1rF4zGOZGBU80eWspENQPBeNQvLuDYS
	o6ZnTlwGangtcLu5DDMkjVcfeDW5QweMM1uvCAJaVlHI+wREcHK8pySUm83DMpgR1zIb
	HcOg==
X-Gm-Message-State: APjAAAVlfvhDO8rNB7hKf0MDYSQESfpDUUMHbjTuiBoqmixv7WYomqN5
	gR/0oVKUo39ZqWKkLG3gCw+6f40c19/8rQ==
X-Google-Smtp-Source: APXvYqwHbaYKsRnlaggF5LMoOPxzW91U98Bgue/qcp6JvIKXtXXii//P7QP4HZ4Z4LZE+1Hh0wvM3w==
X-Received: by 2002:a5b:ccc:: with SMTP id e12mr13080577ybr.482.1559603992193; 
	Mon, 03 Jun 2019 16:19:52 -0700 (PDT)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	k141sm4239909ywa.52.2019.06.03.16.19.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 03 Jun 2019 16:19:51 -0700 (PDT)
Received: by graymalkin (sSMTP sendmail emulation);
	Mon, 03 Jun 2019 19:19:49 -0400
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 19:19:49 -0400
Message-Id: <20190603231949.32376-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] resulttool: Remove prints if no tests occur
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
X-List-Received-Date: Mon, 03 Jun 2019 23:19:51 -0000
Content-Transfer-Encoding: 8bit

Printing the lack of a test is not necessary (per feedback).  Remove
this from the template to quieten it.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 .../resulttool/template/test_report_full_text.txt  | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/resulttool/template/test_report_full_text.txt b/scripts/lib/resulttool/template/test_report_full_text.txt
index 6a5a081c6d..17c99cb4e7 100644
--- a/scripts/lib/resulttool/template/test_report_full_text.txt
+++ b/scripts/lib/resulttool/template/test_report_full_text.txt
@@ -22,13 +22,10 @@ Test Result Status Summary (Counts/Percentages sorted by testseries, ID)
 {{ ptest.ljust(maxlen['ptest']) }} | {{ (ptests[machine][ptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ptests[machine][ptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ptests[machine][ptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ptests[machine][ptest]['duration']|string) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
-{% else %}
-There was no ptest data for {{ machine }}
-{% endif %}
 
+{% endif %}
 {% endfor %}
 
-
 {% for machine in machines %}
 {% if ltptests[machine] %}
 ==============================================================================================================
@@ -41,13 +38,10 @@ There was no ptest data for {{ machine }}
 {{ ltptest.ljust(maxlen['ltptest']) }} | {{ (ltptests[machine][ltptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ltptests[machine][ltptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ltptests[machine][ltptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ltptests[machine][ltptest]['duration']|string) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
-{% else %}
-There was no LTP Test data for {{ machine }}
-{% endif %}
 
+{% endif %}
 {% endfor %}
 
-
 {% for machine in machines %}
 {% if ltpposixtests[machine] %}
 ==============================================================================================================
@@ -60,10 +54,8 @@ There was no LTP Test data for {{ machine }}
 {{ ltpposixtest.ljust(maxlen['ltpposixtest']) }} | {{ (ltpposixtests[machine][ltpposixtest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ltpposixtests[machine][ltpposixtest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ltpposixtests[machine][ltpposixtest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ltpposixtests[machine][ltpposixtest]['duration']|string) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
-{% else %}
-There was no LTP Posix Test data for {{ machine }}
-{% endif %}
 
+{% endif %}
 {% endfor %}
 
 
-- 
2.21.0


