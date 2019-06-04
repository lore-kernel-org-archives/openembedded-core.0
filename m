Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8417E33C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 10:56:41 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w13so15275395wru.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2019 03:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=d6g+lQBex9QfViKAd6112/COmDnpLlfS7Ye2iumAtN0=;
	b=d/5U2SFCduMjCmHGBQni8ypOmxsXhE/yQ6rBm0L5vuT0tgyuRj+veJ8HtbSKrcKu1o
	cjey1AgPW4lzGv0rE1jcsif2CAEuEQB9rKqUImP/0Jb/WmYaCIop7WcX3v37LQq9xOF+
	G9WVk2D53Kw9w/OqEkkc/WtLXBu8dgYTRri2RKQ8sfAzF3nY8q/6RvEEj4hLzwWDZmj2
	5oWn1dULkDkK6Oc+5ddw7wrkr0og54VUa2GhU461ba1LtnqOC/blCfZRIX5P1dAFTyN7
	65QGOWIGNxAAaiT1toUekvXMwbpVdwGt5Ge6I7cRyxQu7XJSjqqlefVbZ2THwJRgtCXq
	obTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=d6g+lQBex9QfViKAd6112/COmDnpLlfS7Ye2iumAtN0=;
	b=TKZwI1MemxHbdXFE2Qs5gs09JNoyMef6GsMCtNYTGc7Go4U95rl801N01E2bLpikX4
	BkOMsj8DA9gjDjxZKEO+ZIoj+PVCF6n/ExHbWGFrDzrP+NV+Lfk20+MjAnFwhgj1MMQ6
	S9doE2OGwUcbXysjQGxImipSMgtpNHtVVWkCGTQrvEXXfiXlM/yklnqFLc8nya5LpOh9
	Q5MmFbRVB2q+pNVsrD1Qpv171+BbaYupjtQ8q1Y9/TD7tDvcHNP1wWdbFFbNG412CF/q
	9gwXOAQpnKi/6O8i3txCnZa4lNB5uAxpxXRN+ZunpEr2+TgQfVP50ryLB93JwMloDoSj
	rTbg==
X-Gm-Message-State: APjAAAUvuFkmfnZPaHVCXi1SpMAK6G6uDXbW5JG6le2qbM5bsKJfY/MI
	C93p1uvWbBdUOlLhlbQ7PRPF7vwtCqA=
X-Google-Smtp-Source: APXvYqxu/3EWCmfdljCuRbrDLb/KBXatIGf9RDyih6okiisdcOn7LQJSvTsQq1uOFHc9z6gplCWjNA==
X-Received: by 2002:adf:fd08:: with SMTP id e8mr9018922wrr.276.1559645802580; 
	Tue, 04 Jun 2019 03:56:42 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c18sm17458641wrm.7.2019.06.04.03.56.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 03:56:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jun 2019 11:56:39 +0100
Message-Id: <20190604105639.7974-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] local.conf.sample: change default MACHINE to qemux86-64
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
X-List-Received-Date: Tue, 04 Jun 2019 10:56:42 -0000

32-bit x86 isn't really a useful target these days, and if users are
experimenting without setting MACHINE to their actual target then 64-bit x86
will have better performance.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/local.conf.sample | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index a3e01047eee..92afac2fe17 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -25,8 +25,8 @@
 #MACHINE ?= "qemux86"
 #MACHINE ?= "qemux86-64"
 #
-# This sets the default machine to be qemux86 if no other machine is selected:
-MACHINE ??= "qemux86"
+# This sets the default machine to be qemux86-64 if no other machine is selected:
+MACHINE ??= "qemux86-64"
 
 #
 # Where to place downloads
-- 
2.11.0


