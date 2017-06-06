Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 93FA2780F3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 03:20:33 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 70so8196651wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 20:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FVkNGvH9dsiWQv45Il/qVJJVPZs3vp6JSeWxH5tREbc=;
	b=sZcV4i0FWRFT8x52sLyNnd+xNHne3q3mKVQnMRcSp5NgARaoZH8PF3AxcqRek2dlK4
	L827gY4pjBf6ewId6Q8mf5Ci6RdtUVFH4kHg96mJ3VyApLjchdg8+547WyvSAApLdR6d
	sqZVRVQTKoKNb6r8jBfMp6QEkP6kenRPIPERXygmXK9JkfLtY2iSauOEvTTvi1yyafKg
	7Ox+aI1iCI7OUziH5KIEURLPsVTQSaMu/zpTetv6VwF9FEpJsrpkcQgvDeo5nzhsLqj+
	QH6xAXOIqUQHI0gZWmCEJMPtL3COTyMd9k8wHhmP/oLpZcN6aBrAC8WshIXCD0dfAKG8
	vTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FVkNGvH9dsiWQv45Il/qVJJVPZs3vp6JSeWxH5tREbc=;
	b=NYJwhBVEyYIwJNcAaG2UtDV3R0tmYkf7dJD4rh1Z+SxYIoGslo3j+hZSHWEYu00BtA
	dVpTx8XkGekulAqGSVczQAGvKH71YSVaUPWUcWUmIsDU3nhpFqf+CY+CZXMYf9QoC8no
	+5i74F6KLWuW1Vt/9+xNn2dAdtdtDLlmedQrD6i3GTgBjCUNUGSJXZtpglmWarBbw/tP
	W77GrFC2x6i4uxfFO/o4A1tDHJ/hJXEc7HkE2x5thN3jqLDlbRBROybSFRFc6fNMaGd+
	pIwLlw5aKpq6+jrQMCB5KWWqUplGKx5+CoIJ4D3zv/gwBOQWZ38h/rbFMbL8Nf+d1VZE
	KbOQ==
X-Gm-Message-State: AODbwcDEX8McIgfIaxsm4p9VY1X67R0QO5mcREZJi6vb5M4aSh/DL4Pf
	U5etEOdjv84i3CNU
X-Received: by 10.80.161.166 with SMTP id 35mr18618827edk.96.1496719233904;
	Mon, 05 Jun 2017 20:20:33 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.199.183])
	by smtp.gmail.com with ESMTPSA id y53sm3654370edd.4.2017.06.05.20.20.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jun 2017 20:20:33 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jun 2017 05:20:26 +0200
Message-Id: <1496719226-3132-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] buildstats.sh: add ELAPSED option
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
X-List-Received-Date: Tue, 06 Jun 2017 03:20:33 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This allows users to be able to get the elapsed time of specific
tasks from buildstats, sometimes could be useful.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 scripts/contrib/bb-perf/buildstats.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/contrib/bb-perf/buildstats.sh b/scripts/contrib/bb-perf/buildstats.sh
index 8d7e248..caf34a6 100755
--- a/scripts/contrib/bb-perf/buildstats.sh
+++ b/scripts/contrib/bb-perf/buildstats.sh
@@ -40,6 +40,7 @@
 
 # Stats, by type
 TIME="utime:stime:cutime:cstime"
+ELAPSED="Started:Ended:Elapsed time"
 IO="IO wchar:IO write_bytes:IO syscr:IO read_bytes:IO rchar:IO syscw:IO cancelled_write_bytes"
 RUSAGE="rusage ru_utime:rusage ru_stime:rusage ru_maxrss:rusage ru_minflt:rusage ru_majflt:\
 rusage ru_inblock:rusage ru_oublock:rusage ru_nvcsw:rusage ru_nivcsw"
@@ -113,6 +114,9 @@ for stat in ${STATS}; do
 	    TIME)
 		stats="${stats}:${TIME}"
 		;;
+	    ELAPSED)
+		stats="${stats}:${ELAPSED}"
+		;;
 	    IO)
 		stats="${stats}:${IO}"
 		;;
-- 
2.7.4


