Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34326.1794851709691184556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=csoWw08T;
 spf=pass (domain: mvista.com, ip: 74.125.82.176, mailfrom: rsangam@mvista.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a315ed211so104673eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1794851709; x=1795456509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=szhj0Mh1SvbqBNSkKwOZ/ZoWGLsXiM106yO5edcD75s=;
        b=csoWw08T4lhpT+8/VHZ4AeKZwACFpaa3Yr0n+bF+lZTfMQJTICt8TL8D353z3IVWpT
         RV40DJ87zW34jPwYxlCpY52Fj5HAaQ3RhMaDUhfiymO/cIrKcOeA9gSQklD8lOZlsnPU
         EzsIaF3AC7W/mYXWiVzZAc7au8f/p+R18EHuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851709; x=1795456509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szhj0Mh1SvbqBNSkKwOZ/ZoWGLsXiM106yO5edcD75s=;
        b=sqgNRAIqpa09JF9FRpvoc9z6hrbc6J1Q27IzIqO/KngpscQbZWITWAKAkePEvb3J4X
         1PBrZcP20l9DdS1ipO9CW+5nV5GnoNAyABMQZjA9wz0LM9OMV2MNoTgV37lsHFKtsj9a
         lSMFryp3ySIPN5bIASWo6TSByQ2osk+SMr+VU543G4r/gS/guT8BIjISGOOE6aPRc0qg
         9BDckpLiymTTiCV2Mi1g3xnZ/ZCyZpKE+zsweJszTC2bFq5PzEzvgLUXvhzlhGsnVfVP
         83nxEOHQhvkkFChwyMm7624kmCHZRwM/qdPptyyYn+nZgN11JPR4OmaPTN1p6VPooqWZ
         LDiQ==
X-Gm-Message-State: APuU4Z9nY3CdOPwLfPc7zcSY0iFgbsIHc86rOEYHn9q2R/2R14+9i8gn
	DPG/y5dc+32c3iFyXBCcNoA+FcPSNfxHA9BRjXOw7ip0xf+yTmNjDrLWm9QS/unTswW6bKoSwyL
	YybSdutU=
X-Gm-Gg: AYBFou2P/gHcb4i3fOy5NXctVVWP8/RFI7GHak0Km2H1osuoP71IswZOAAn7Fvj5Cap
	/eJraVFosRW/USKmp2Nojfo1IRYeSN2/LriIUaT1H2kvhznu7j/j5lkt0E7srI4C2KRJvZqtPDC
	3adFCBBmNPeF/uOrQj9lJwQmMhxKGZIvu4oorji4U2uTzcQPP38NL2MqY1vUnQiqjC+OpFvq7eE
	rOYupa+CRjf8gzI5ePcugeDiZ4CK2bfaGuIztcrNIP0T6n4qN4ama4YB+uLwAu2rm2CvUClomh8
	NZZyt9TBxit6JbPrYRazz6NMW6myaXexTKnyznPL4ochaZveUurqpiDMi+aztHnFluQ4Jw5xb4z
	rl/DFWFiA8EYSiGGh6ZOXFs3krwNSYw2P8QLkRY1kr7aGNL9DZvecG1bDolKOfJ5lGCnu7lKmhT
	sBIOTB+v8fjqJrNeH2kS79yLLOVWy8CBOfV6OFvVlPopd9XsAAiUFi5+LJuUNHRN67QPE8Tthn9
	E+8C1dKq40B3hDbESfnJoI0f73RSKCBDpxV1TrmM3m2ypbv8cXNaM2xMvZN/fS73sSqUKK7TDPI
	M0GWD2XgVISWHlHUpXXtCNrYKRNiBajsmeDDLQ==
X-Received: by 2002:a05:7300:2146:b0:375:6fed:8e71 with SMTP id 5a478bee46e88-3810e419ea7mr244283eec.7.1794851708762;
        Mon, 16 Nov 2026 09:55:08 -0800 (PST)
Return-Path: <rsangam@mvista.com>
Received: from MVIN00040.mvista.com ([49.207.195.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm65353422eec.21.2026.11.16.09.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:08 -0800 (PST)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [OE-core][scarthgap][PATCH] bind: Security fix for CVE-2026-19666
Date: Mon, 16 Nov 2026 23:25:00 +0530
Message-Id: <20261116175500.328321-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250371
Content-Type: text/plain; charset="utf-8"

Pick patch from [1] also mentioned at Debian tracker in [2]

[1] https://github.com/isc-projects/bind9/commit/78175f9749fecdac4eb0d4b08dd064968b4c55f8
[2] https://security-tracker.debian.org/tracker/CVE-2026-19666

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../bind/bind/CVE-2026-19666.patch            | 113 ++++++++++++++++++
 .../recipes-connectivity/bind/bind_9.18.49.bb |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-19666.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-19666.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-19666.patch
new file mode 100644
index 0000000000..46f4030af3
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-19666.patch
@@ -0,0 +1,113 @@
+From f1d4bc8b82d1f4635db38fc281c3eed7b589db65 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@isc.org>
+Date: Thu, 6 Aug 2026 15:09:34 +0200
+Subject: [PATCH] Clear the noqname alias on the DNS64 filter64 path
+
+When a partially excluded AAAA RRset is filtered rather than
+synthesized, query_addanswer() returns the original rdataset to the
+message rdataset pool, but qctx->noqname was aliased to it moments
+earlier in query_respond().  query_addnoqnameproof() then dereferences
+the freed object, and named aborts on the methods != NULL assertion
+because the pool has already handed the memory back out.
+
+The sibling DNS64 synthesis arm clears the alias for exactly this
+reason; the filter64 arm has needed the same treatment ever since DNS64
+was added, and was missed when the synthesis arm was fixed.  Dropping
+the proof is also what the answer deserves: filtering the RRset has
+already discarded its signature.
+
+(cherry picked from commit 9ddfd2e4da7374ab2f6eaa67cd48d99116a8f60e)
+
+CVE: CVE-2026-19666
+Upstream-Status: Backport from https://github.com/isc-projects/bind9/commit/78175f9749fecdac4eb0d4b08dd064968b4c55f8
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ bin/tests/system/dns64/ns1/example.db    |  3 +++
+ bin/tests/system/dns64/ns2/named.conf.in |  8 ++++++++
+ bin/tests/system/dns64/tests.sh          | 23 +++++++++++++++++++++++
+ lib/ns/query.c                           |  1 +
+ 4 files changed, 35 insertions(+)
+
+diff --git a/bin/tests/system/dns64/ns1/example.db b/bin/tests/system/dns64/ns1/example.db
+index 8253f1d..92a00ed 100644
+--- a/bin/tests/system/dns64/ns1/example.db
++++ b/bin/tests/system/dns64/ns1/example.db
+@@ -26,6 +26,9 @@ partially-excluded-bad-a	AAAA	2001:eeee::2
+ 		A	10.0.0.1
+ partially-excluded-only	AAAA	2001:eeee::3
+ 		AAAA	2001::3
++; A wildcard match yields a signed answer carrying a NOQNAME proof.
++*.wild-partially-excluded AAAA	2001:eeee::4
++		AAAA	2001::4
+ a-only		A	1.2.3.5
+ a-and-aaaa	AAAA	2001::1
+ 		A	1.2.3.6
+diff --git a/bin/tests/system/dns64/ns2/named.conf.in b/bin/tests/system/dns64/ns2/named.conf.in
+index 263cc8a..64e032b 100644
+--- a/bin/tests/system/dns64/ns2/named.conf.in
++++ b/bin/tests/system/dns64/ns2/named.conf.in
+@@ -47,6 +47,14 @@ options {
+ 		suffix ::;
+ 	};
+ 
++	dns64 2001:cccc::/96 {
++		clients { 10.53.0.8; };
++		mapped { !rfc1918; any; };
++		exclude { 2001:eeee::/32; 64:FF9B::/96; ::ffff:0000:0000/96; };
++		suffix ::;
++		break-dnssec yes;
++	};
++
+ 	dns64-server "dns64.example.net.";
+ 	dns64-contact "hostmaster.example.net.";
+ 	dns64 2001:32::/32 { clients { 10.53.0.6; }; };
+diff --git a/bin/tests/system/dns64/tests.sh b/bin/tests/system/dns64/tests.sh
+index 231e825..2a41f98 100644
+--- a/bin/tests/system/dns64/tests.sh
++++ b/bin/tests/system/dns64/tests.sh
+@@ -1276,6 +1276,29 @@ n=$((n + 1))
+ if [ $ret != 0 ]; then echo_i "failed"; fi
+ status=$((status + ret))
+ 
++# The answer is wildcard-expanded, so it is cached with a NOQNAME proof,
++# and it is partially excluded, so it is filtered rather than synthesized.
++# 10.53.0.8 is the only client for which break-dnssec is in effect, which
++# is what lets a +dnssec query reach the filtering path at all.
++echo_i "checking partially-excluded wildcard AAAA lookup in signed zone works with +dnssec ($n)"
++ret=0
++$DIG $DIGOPTS +dnssec a.wild-partially-excluded.signed. @10.53.0.2 -b 10.53.0.8 aaaa >dig.out.ns2.test$n || ret=1
++grep "status: NOERROR" dig.out.ns2.test$n >/dev/null || ret=1
++grep "ANSWER: 1," dig.out.ns2.test$n >/dev/null || ret=1
++grep "2001::4" dig.out.ns2.test$n >/dev/null || ret=1
++grep "2001:eeee::4" dig.out.ns2.test$n >/dev/null && ret=1
++n=$((n + 1))
++if [ $ret != 0 ]; then echo_i "failed"; fi
++status=$((status + ret))
++
++echo_i "checking ns2 survived the partially-excluded wildcard lookup ($n)"
++ret=0
++$DIG $DIGOPTS aaaa-only.signed. @10.53.0.2 -b 10.53.0.2 aaaa >dig.out.ns2.test$n || ret=1
++grep "status: NOERROR" dig.out.ns2.test$n >/dev/null || ret=1
++n=$((n + 1))
++if [ $ret != 0 ]; then echo_i "failed"; fi
++status=$((status + ret))
++
+ echo_i "checking reverse mapping ($n)"
+ ret=0
+ $DIG $DIGOPTS -x 2001:aaaa::10.0.0.1 @10.53.0.2 >dig.out.ns2.test$n || ret=1
+diff --git a/lib/ns/query.c b/lib/ns/query.c
+index 86485b7..6b38606 100644
+--- a/lib/ns/query.c
++++ b/lib/ns/query.c
+@@ -8329,6 +8329,7 @@ query_addanswer(query_ctx_t *qctx) {
+ 		}
+ 	} else if (qctx->client->query.dns64_aaaaok != NULL) {
+ 		query_filter64(qctx);
++		qctx->noqname = NULL;
+ 		ns_client_putrdataset(qctx->client, &qctx->rdataset);
+ 		isc_mem_put(qctx->client->mctx,
+ 			    qctx->client->query.dns64_aaaaok,
+-- 
+2.44.4
+
diff --git a/meta/recipes-connectivity/bind/bind_9.18.49.bb b/meta/recipes-connectivity/bind/bind_9.18.49.bb
index fef00e363f..6396f4ffc1 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.49.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            file://CVE-2026-19667-1.patch \
            file://CVE-2026-19667-2.patch \
+           file://CVE-2026-19666.patch \
            "
 
 SRC_URI[sha256sum] = "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24"
-- 
2.34.1

