Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7168.1793599720409159088
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 22:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WFhGi2Al;
 spf=pass (domain: mvista.com, ip: 74.125.82.181, mailfrom: rsangam@mvista.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so5406786eec.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 22:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1793599720; x=1794204520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dD4WvWNdEm8yJjbIhqWCx24nLkc/zLTfGSCMvqf9SM=;
        b=WFhGi2Alkyc5dlIjlVZ9NqgSdLq5NXGi79RMuHeiSoKW2veLt511CuZAx7VVrjRpFk
         eBIToI0QTI0pI4T/5UpZ7t+Nh0snQpa913aQmFILn1QIbFKN/XCDIeTgmxWPaFoVFJLw
         0mcA+F8SZ1sNCrJ6+oKP5G4R/I1k2BSCPHX3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793599720; x=1794204520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dD4WvWNdEm8yJjbIhqWCx24nLkc/zLTfGSCMvqf9SM=;
        b=cC0IKqFk65D3yeWBxZlm2QGLn2H9HsAzctWWmiFekfk4CI20CfTN20Y85aQL4PSZQz
         t7gX4u/zrZP6SmhfdVCj5v1eUZ5CwwQxIv828scVtTv7B4bx/bnbY8mZFAoMmaF9ffqY
         AmuKJ35gTjtXBJl5Z7v+9p900lu0v51RlQHGVqb+WyAG556dv98BguMoNjqFVUAAy98M
         avu/VpxlJmsUhbto2OlWtpX3gpXpujS+rCaIp+lbepJtV9dNI961QFH9FsI8L2Qy7cSA
         RgUxIvPX/PjLOmP7NVBlkWVKfeN8ynXLKlSSUwah8ul/3PY3IlM1rNiHMtw9MNICTKH1
         6UTQ==
X-Gm-Message-State: AFq9FYJmVadGv6PHHH/BbrcEvSueR88pS7t3p6T9dkx07fbLzUYYtdVN
	Lpg5YHXpgCIjIRp2YwTmhwDxYJ+ZglNpn3JkM2dqOTcHmdkgnDE20ElnbmV7w+BrJHzD2mhITjY
	hhm62
X-Gm-Gg: AYBFou07taTE1B4Jwuzbovx9X4cUkkTNi0RZv3In3kP6RfYJ7j0lr+3As9hcapDg0iB
	J5Ln7+aRs/oZ54lLnJ9v9cT+gvu8zfrUkZ2ZEyrgXq1t98wnZDdSfZehTORcHB8K4qIj6JzloUt
	+dD7p3oEsiiSdkFx8aMaEuipac01L0fObs2Yfy7tWL3b3cUzhLoQxTD6RfOp77cQY7FfkuqZdbh
	U3D5R/z4HqfCdoRMGe3rWPNy5r7AcBLbDhXtTWDouQROkQW7nHYvlB1qgAMn0fxkecKx2zfXm9t
	3DJ3dv2Hn+Xvc9elENYsHmcwm0xlJOJ6NuTmCLlSpCZvLLp6nAOeOsvy7zZ45STwOaFWHgFQwge
	EQP924UYI1Vd/UDt/Rqg5Lz434JRuleH0R/RbNhthQGBCBtbt7gaamm2vVBf0mcMehML1pBdydd
	x3JtAGhCWkC+K3Pk9NwZR0ms3tM8FltG/JkZRGY7CbgxHfSQ9g7gjp6S7cPcIkFo+dU95LkjiqR
	XSUAyGynw+NUZ5drYGQx0oIcCDt+LL46zyhM5tvGYufxXoWYzwvFHr15A00X4kdcDDkyImUyN91
	v9cIrgCMq0AGfryJw58udKEAjxff8FIG1DGc
X-Received: by 2002:a05:7022:5f15:b0:16a:f5cd:365 with SMTP id a92af1059eb24-1b009604eb1mr7358502c88.5.1793599719048;
        Sun, 01 Nov 2026 22:08:39 -0800 (PST)
Return-Path: <rsangam@mvista.com>
Received: from MVIN00040.mvista.com ([49.207.197.97])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm30235606c88.5.2026.11.01.22.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:08:38 -0800 (PST)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [OE-core][scarthgap][PATCH] bind: Security fix for CVE-2026-19667
Date: Mon,  2 Nov 2026 11:38:30 +0530
Message-Id: <20261102060830.89471-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 06:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249181
Content-Type: text/plain; charset="utf-8"

Pick patch from [1] and [2] also mentioned at Debian tracker in [3]

[1] https://github.com/isc-projects/bind9/commit/c4203fb70e3985452afddeadb7075aa91ae05d7d
[2] https://github.com/isc-projects/bind9/commit/993d10fe15adbac485d399f1e4144b55ed226ecf
[3] https://security-tracker.debian.org/tracker/CVE-2026-19667

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../bind/bind/CVE-2026-19667-1.patch          | 139 +++++++
 .../bind/bind/CVE-2026-19667-2.patch          | 355 ++++++++++++++++++
 .../recipes-connectivity/bind/bind_9.18.49.bb |   2 +
 3 files changed, 496 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-19667-1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-19667-2.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-19667-1.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-19667-1.patch
new file mode 100644
index 0000000000..5c52e42034
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-19667-1.patch
@@ -0,0 +1,139 @@
+From e5c7129b2d312d14759aa8b4a146f78a6a60020e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@isc.org>
+Date: Thu, 6 Aug 2026 17:15:26 +0200
+Subject: [PATCH 1/2] Reject negative cache records that do not fit in a
+ dns_rdata_t
+
+dns_ncache_add() assembles each negative cache record in a 64 KiB stack
+buffer and then stores its size in dns_rdata_t.length, which is 16 bits
+wide.  A record that fills the buffer exactly is recorded as being zero
+bytes long, which is small enough to satisfy the size checks in
+dns_rdataslab_fromrdataset() that would otherwise have rejected it.  The
+truncated record is committed to the cache, and every reader of it then
+fails an assertion.
+
+A response whose authority section repeats one SOA record, with MNAME
+and RNAME compressed against a long QNAME, expands to exactly that size,
+so check the length where the record is produced rather than relying on
+the slab code to notice.  Every other way of building a dns_rdata_t
+already refuses anything longer than DNS_RDATA_MAXLENGTH.
+
+While here, refuse a singleton RRset with more than one record and a
+second SOA RRset as DNS_R_TOOMANYRECORDS, which is now also what more
+than DNS_NCACHE_RDATA records reports instead of ISC_R_NOSPACE.  The
+message parser and the resolver already reject duplicate singletons
+and a second SOA on their own, but dns_ncache_add() should not depend
+on its callers for that.
+
+Co-authored-by: Mark Andrews <marka@isc.org>
+(cherry picked from commit 8b20ed0a647cd1e9efc3bf442fc5d898f6a4de57)
+
+CVE: CVE-2026-19667
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/c4203fb70e3985452afddeadb7075aa91ae05d7d]
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ lib/dns/ncache.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 45 insertions(+), 3 deletions(-)
+
+diff --git a/lib/dns/ncache.c b/lib/dns/ncache.c
+index c99c266..bab42bf 100644
+--- a/lib/dns/ncache.c
++++ b/lib/dns/ncache.c
+@@ -63,14 +63,30 @@ copy_rdataset(dns_rdataset_t *rdataset, isc_buffer_t *buffer) {
+ 		return ISC_R_NOSPACE;
+ 	}
+ 	count = dns_rdataset_count(rdataset);
++
++	/*
++	 * Reject duplicate singleton records.
++	 */
++	if (dns_rdatatype_issingleton(rdataset->type) && count != 1) {
++		return DNS_R_TOOMANYRECORDS;
++	}
++
+ 	INSIST(count <= 65535);
+ 	isc_buffer_putuint16(buffer, (uint16_t)count);
+ 
++	if (ar.length < 2 + count * 2) {
++		/*
++		 * The count took 2 bytes and each rdata needs at least 2
++		 * more for its length.  Bail early if that cannot fit.
++		 */
++		return ISC_R_NOSPACE;
++	}
++
+ 	result = dns_rdataset_first(rdataset);
+ 	while (result == ISC_R_SUCCESS) {
+ 		dns_rdataset_current(rdataset, &rdata);
+ 		dns_rdata_toregion(&rdata, &r);
+-		INSIST(r.length <= 65535);
++		INSIST(r.length <= DNS_RDATA_MAXLENGTH);
+ 		isc_buffer_availableregion(buffer, &ar);
+ 		if (ar.length < 2) {
+ 			return ISC_R_NOSPACE;
+@@ -79,6 +95,7 @@ copy_rdataset(dns_rdataset_t *rdataset, isc_buffer_t *buffer) {
+ 		 * Copy the rdata length to the buffer.
+ 		 */
+ 		isc_buffer_putuint16(buffer, (uint16_t)r.length);
++
+ 		/*
+ 		 * Copy the rdata to the buffer.
+ 		 */
+@@ -129,8 +146,9 @@ addoptout(dns_message_t *message, dns_db_t *cache, dns_dbnode_t *node,
+ 	dns_rdata_t rdata[DNS_NCACHE_RDATA];
+ 	dns_rdataset_t ncrdataset;
+ 	dns_rdatalist_t ncrdatalist;
+-	unsigned char data[65536];
++	unsigned char data[UINT16_MAX];
+ 	unsigned int next = 0;
++	bool seen_soa = false;
+ 
+ 	/*
+ 	 * Convert the authority data from 'message' into a negative cache
+@@ -177,6 +195,20 @@ addoptout(dns_message_t *message, dns_db_t *cache, dns_dbnode_t *node,
+ 					continue;
+ 				}
+ 				type = rdataset->type;
++
++				/*
++				 * A negative response carries one SOA
++				 * RRset.  The resolver rejects a second
++				 * one before it gets here; don't rely on
++				 * that.
++				 */
++				if (type == dns_rdatatype_soa) {
++					if (seen_soa) {
++						return DNS_R_TOOMANYRECORDS;
++					}
++					seen_soa = true;
++				}
++
+ 				if (type == dns_rdatatype_rrsig) {
+ 					type = rdataset->covers;
+ 				}
+@@ -224,10 +256,20 @@ addoptout(dns_message_t *message, dns_db_t *cache, dns_dbnode_t *node,
+ 					}
+ 
+ 					if (next >= DNS_NCACHE_RDATA) {
+-						return ISC_R_NOSPACE;
++						return DNS_R_TOOMANYRECORDS;
+ 					}
+ 					dns_rdata_init(&rdata[next]);
+ 					isc_buffer_remainingregion(&buffer, &r);
++					/*
++					 * dns_rdata_t.length is 16 bits wide,
++					 * so a longer record would be silently
++					 * truncated here and would then pass
++					 * the size checks in
++					 * dns_rdataslab_fromrdataset().
++					 */
++					if (r.length > DNS_RDATA_MAXLENGTH) {
++						return ISC_R_NOSPACE;
++					}
+ 					rdata[next].data = r.base;
+ 					rdata[next].length = r.length;
+ 					rdata[next].rdclass =
+-- 
+2.44.4
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-19667-2.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-19667-2.patch
new file mode 100644
index 0000000000..8427eae31f
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-19667-2.patch
@@ -0,0 +1,355 @@
+From 993d10fe15adbac485d399f1e4144b55ed226ecf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@isc.org>
+Date: Tue, 1 Sep 2026 10:05:05 +0200
+Subject: [PATCH 2/2] Test that an oversized negative cache record is rejected
+
+Nothing exercised dns_ncache_add() with a record too large to store, so
+the missing range check went unnoticed for as long as the length field
+was wide enough to hold one.
+
+The record has to be built below the message parser.  SOA is the only
+record type whose negative cache form is larger than its wire form, and
+the parser now collapses repeated identical SOA records into one, so a
+response can no longer be made to reach the limit.  Assemble the
+authority section by hand instead, sized to the exact 64 KiB fill that
+used to be stored as a zero-length record and to either side of
+DNS_RDATA_MAXLENGTH, and cover the singleton and record-count
+rejections while at it.
+
+Assisted-by: Claude:claude-fable-5
+(cherry picked from commit a82c98e5db5b0ca3e2a1e2f42bcd7374d0235f70)
+
+CVE: CVE-2026-19667
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/993d10fe15adbac485d399f1e4144b55ed226ecf]
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ tests/dns/Makefile.am   |   1 +
+ tests/dns/ncache_test.c | 303 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 304 insertions(+)
+ create mode 100644 tests/dns/ncache_test.c
+
+diff --git a/tests/dns/Makefile.am b/tests/dns/Makefile.am
+index 7062c60..512329e 100644
+--- a/tests/dns/Makefile.am
++++ b/tests/dns/Makefile.am
+@@ -27,6 +27,7 @@ check_PROGRAMS =		\
+ 	dst_test		\
+ 	keytable_test		\
+ 	name_test		\
++	ncache_test		\
+ 	nsec3_test		\
+ 	nsec3param_test		\
+ 	private_test		\
+diff --git a/tests/dns/ncache_test.c b/tests/dns/ncache_test.c
+new file mode 100644
+index 0000000..19a30b2
+--- /dev/null
++++ b/tests/dns/ncache_test.c
+@@ -0,0 +1,303 @@
++/*
++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++ *
++ * SPDX-License-Identifier: MPL-2.0
++ *
++ * This Source Code Form is subject to the terms of the Mozilla Public
++ * License, v. 2.0. If a copy of the MPL was not distributed with this
++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
++ *
++ * See the COPYRIGHT file distributed with this work for additional
++ * information regarding copyright ownership.
++ */
++
++#include <inttypes.h>
++#include <sched.h> /* IWYU pragma: keep */
++#include <setjmp.h>
++#include <stdarg.h>
++#include <stdbool.h>
++#include <stddef.h>
++#include <stdlib.h>
++#include <string.h>
++
++#define UNIT_TESTING
++#include <cmocka.h>
++
++#include <isc/stdtime.h>
++#include <isc/util.h>
++
++#include <dns/db.h>
++#include <dns/message.h>
++#include <dns/name.h>
++#include <dns/ncache.h>
++#include <dns/rdata.h>
++#include <dns/rdatalist.h>
++#include <dns/rdataset.h>
++#include <dns/result.h>
++
++#include <tests/dns.h>
++
++/*
++ * dns_ncache_add() turns every RRset it keeps from the authority section
++ * into one negative cache record laid out as
++ *
++ *	owner name | type | trust | count | count * (rdlen | rdata)
++ *
++ * The rdata is copied verbatim and never parsed, so the tests below fill
++ * it from this buffer and only care about its length.
++ */
++static unsigned char filler[UINT16_MAX];
++
++/*
++ * dns_rdataslab_fromrdataset() stores each record behind a 2-byte length,
++ * or an 8-byte length, offset and order header with --enable-fixed-rrset,
++ * and refuses a record that would exceed DNS_RDATA_MAXLENGTH together
++ * with that header.
++ */
++#if DNS_RDATASET_FIXED
++#define SLAB_OVERHEAD 8
++#else
++#define SLAB_OVERHEAD 2
++#endif
++
++static dns_name_t *
++name_fromstring(dns_fixedname_t *fixed, const char *namestr) {
++	dns_name_t *name = dns_fixedname_initname(fixed);
++	isc_result_t result;
++
++	result = dns_name_fromstring(name, namestr, 0, NULL);
++	assert_int_equal(result, ISC_R_SUCCESS);
++
++	return name;
++}
++
++static dns_message_t *
++negative_response(void) {
++	dns_message_t *msg = NULL;
++
++	dns_message_create(mctx, DNS_MESSAGE_INTENTRENDER, &msg);
++	msg->flags = DNS_MESSAGEFLAG_QR | DNS_MESSAGEFLAG_AA;
++	msg->rcode = dns_rcode_nxdomain;
++
++	return msg;
++}
++
++/*
++ * Add an RRset of 'count' rdatas to the authority section of 'msg', at
++ * 'ownerstr', marked for negative caching the way the resolver marks
++ * them.  The rdata lengths are chosen so that the negative cache record
++ * built from the RRset is exactly 'size' bytes long.
++ */
++static void
++add_rrset(dns_message_t *msg, const char *ownerstr, dns_rdatatype_t type,
++	  dns_rdatatype_t covers, unsigned int count, size_t size) {
++	dns_name_t *name = NULL;
++	dns_rdatalist_t *rdatalist = NULL;
++	dns_rdataset_t *rdataset = NULL;
++	size_t payload, rdlen;
++	isc_result_t result;
++
++	result = dns_message_gettempname(msg, &name);
++	assert_int_equal(result, ISC_R_SUCCESS);
++	name_fromstring((dns_fixedname_t *)name, ownerstr);
++	name->attributes |= DNS_NAMEATTR_NCACHE;
++
++	result = dns_message_gettemprdatalist(msg, &rdatalist);
++	assert_int_equal(result, ISC_R_SUCCESS);
++	rdatalist->rdclass = dns_rdataclass_in;
++	rdatalist->type = type;
++	rdatalist->covers = covers;
++	rdatalist->ttl = 3600;
++
++	/*
++	 * Split the rdata bytes evenly, giving the remainder to the first
++	 * rdatas one byte at a time.
++	 */
++	assert_true(size >= name->length + 5 + count * 2);
++	payload = size - name->length - 5 - count * 2;
++	rdlen = payload / count;
++
++	for (unsigned int i = 0; i < count; i++) {
++		dns_rdata_t *rdata = NULL;
++
++		result = dns_message_gettemprdata(msg, &rdata);
++		assert_int_equal(result, ISC_R_SUCCESS);
++		rdata->rdclass = dns_rdataclass_in;
++		rdata->type = type;
++		rdata->data = filler;
++		rdata->length = rdlen + (i < payload % count ? 1 : 0);
++		assert_true(rdata->length <= DNS_RDATA_MAXLENGTH);
++		ISC_LIST_APPEND(rdatalist->rdata, rdata, link);
++	}
++
++	result = dns_message_gettemprdataset(msg, &rdataset);
++	assert_int_equal(result, ISC_R_SUCCESS);
++	result = dns_rdatalist_tordataset(rdatalist, rdataset);
++	assert_int_equal(result, ISC_R_SUCCESS);
++	rdataset->trust = dns_trust_authauthority;
++	rdataset->attributes |= DNS_RDATASETATTR_NCACHE;
++	ISC_LIST_APPEND(name->list, rdataset, link);
++
++	dns_message_addname(msg, name, DNS_SECTION_AUTHORITY);
++	/*
++	 * dns_ncache_add() skips the section when its count is zero.
++	 */
++	msg->counts[DNS_SECTION_AUTHORITY] += count;
++}
++
++/*
++ * Cache 'msg' as an NXDOMAIN for 'qname' in a fresh cache and return the
++ * result of dns_ncache_add(), and in 'find_result' what a lookup of
++ * 'qname' sees afterwards: DNS_R_NCACHENXDOMAIN if the record was stored,
++ * ISC_R_NOTFOUND if it was rejected.
++ */
++static isc_result_t
++ncache_add(dns_message_t *msg, const dns_name_t *qname,
++	   isc_result_t *find_result) {
++	isc_stdtime_t now;
++	dns_db_t *db = NULL;
++	dns_dbnode_t *node = NULL;
++	dns_fixedname_t ffound;
++	dns_name_t *found = dns_fixedname_initname(&ffound);
++	dns_rdataset_t rdataset = DNS_RDATASET_INIT;
++	isc_result_t result;
++
++	isc_stdtime_get(&now);
++
++	result = dns_db_create(mctx, "rbt", dns_rootname, dns_dbtype_cache,
++			       dns_rdataclass_in, 0, NULL, &db);
++	assert_int_equal(result, ISC_R_SUCCESS);
++
++	result = dns_db_findnode(db, qname, true, &node);
++	assert_int_equal(result, ISC_R_SUCCESS);
++
++	result = dns_ncache_add(msg, db, node, dns_rdatatype_any, now, 0, 3600,
++				NULL);
++
++	dns_db_detachnode(db, &node);
++
++	*find_result = dns_db_find(db, qname, NULL, dns_rdatatype_a, 0, now,
++				   NULL, found, &rdataset, NULL);
++	if (dns_rdataset_isassociated(&rdataset)) {
++		dns_rdataset_disassociate(&rdataset);
++	}
++
++	dns_db_detach(&db);
++
++	return result;
++}
++
++/*
++ * A record that does not fit in dns_rdata_t.length must be rejected.
++ * Its size used to be truncated to 16 bits instead, so a record of
++ * exactly 65536 bytes was committed to the cache with a length of zero
++ * and every subsequent reader of the cache entry failed an assertion.
++ */
++ISC_RUN_TEST_IMPL(ncache_add_size) {
++	struct {
++		size_t size;
++		isc_result_t expected;
++	} tests[] = {
++		/*
++		 * The largest record that can be stored: the slab needs
++		 * SLAB_OVERHEAD more bytes for its record header.
++		 */
++		{ DNS_RDATA_MAXLENGTH - SLAB_OVERHEAD, ISC_R_SUCCESS },
++		{ DNS_RDATA_MAXLENGTH + 1, ISC_R_NOSPACE },
++		{ 65536, ISC_R_NOSPACE },
++	};
++	dns_fixedname_t fqname;
++	dns_name_t *qname = name_fromstring(&fqname, "missing.example.");
++
++	for (size_t i = 0; i < ARRAY_SIZE(tests); i++) {
++		dns_message_t *msg = negative_response();
++		isc_result_t result, find_result;
++
++		/*
++		 * Two RRSIG(NSEC) records, because a single rdata cannot be
++		 * longer than DNS_RDATA_MAXLENGTH.
++		 */
++		add_rrset(msg, "example.", dns_rdatatype_rrsig,
++			  dns_rdatatype_nsec, 2, tests[i].size);
++
++		result = ncache_add(msg, qname, &find_result);
++		assert_int_equal(result, tests[i].expected);
++		assert_int_equal(find_result, tests[i].expected == ISC_R_SUCCESS
++						      ? DNS_R_NCACHENXDOMAIN
++						      : ISC_R_NOTFOUND);
++
++		dns_message_detach(&msg);
++	}
++}
++
++/*
++ * A negative response holds at most one SOA record.  The message parser
++ * and the resolver enforce that on their own, so exercise the checks in
++ * dns_ncache_add() with hand-built messages.
++ */
++ISC_RUN_TEST_IMPL(ncache_add_soa) {
++	dns_fixedname_t fqname;
++	dns_name_t *qname = name_fromstring(&fqname, "missing.example.");
++	dns_message_t *msg = NULL;
++	isc_result_t result, find_result;
++
++	/* One SOA is fine. */
++	msg = negative_response();
++	add_rrset(msg, "example.", dns_rdatatype_soa, dns_rdatatype_none, 1,
++		  100);
++	result = ncache_add(msg, qname, &find_result);
++	assert_int_equal(result, ISC_R_SUCCESS);
++	assert_int_equal(find_result, DNS_R_NCACHENXDOMAIN);
++	dns_message_detach(&msg);
++
++	/* Two SOA records in one RRset are not. */
++	msg = negative_response();
++	add_rrset(msg, "example.", dns_rdatatype_soa, dns_rdatatype_none, 2,
++		  100);
++	result = ncache_add(msg, qname, &find_result);
++	assert_int_equal(result, DNS_R_TOOMANYRECORDS);
++	assert_int_equal(find_result, ISC_R_NOTFOUND);
++	dns_message_detach(&msg);
++
++	/* Neither are two SOA RRsets. */
++	msg = negative_response();
++	add_rrset(msg, "example.", dns_rdatatype_soa, dns_rdatatype_none, 1,
++		  100);
++	add_rrset(msg, "sub.example.", dns_rdatatype_soa, dns_rdatatype_none, 1,
++		  100);
++	result = ncache_add(msg, qname, &find_result);
++	assert_int_equal(result, DNS_R_TOOMANYRECORDS);
++	assert_int_equal(find_result, ISC_R_NOTFOUND);
++	dns_message_detach(&msg);
++}
++
++/*
++ * dns_ncache_add() stores at most DNS_NCACHE_RDATA (100) records.
++ */
++ISC_RUN_TEST_IMPL(ncache_add_count) {
++	dns_fixedname_t fqname;
++	dns_name_t *qname = name_fromstring(&fqname, "missing.example.");
++	dns_message_t *msg = negative_response();
++	isc_result_t result, find_result;
++
++	for (unsigned int i = 0; i < 101; i++) {
++		char owner[64];
++
++		snprintf(owner, sizeof(owner), "nsec%u.example.", i);
++		add_rrset(msg, owner, dns_rdatatype_nsec, dns_rdatatype_none, 1,
++			  100);
++	}
++
++	result = ncache_add(msg, qname, &find_result);
++	assert_int_equal(result, DNS_R_TOOMANYRECORDS);
++	assert_int_equal(find_result, ISC_R_NOTFOUND);
++	dns_message_detach(&msg);
++}
++
++ISC_TEST_LIST_START
++ISC_TEST_ENTRY(ncache_add_size)
++ISC_TEST_ENTRY(ncache_add_soa)
++ISC_TEST_ENTRY(ncache_add_count)
++ISC_TEST_LIST_END
++
++ISC_TEST_MAIN
+-- 
+2.44.4
+
diff --git a/meta/recipes-connectivity/bind/bind_9.18.49.bb b/meta/recipes-connectivity/bind/bind_9.18.49.bb
index 723a09e739..fef00e363f 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.49.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
@@ -18,6 +18,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2026-19667-1.patch \
+           file://CVE-2026-19667-2.patch \
            "
 
 SRC_URI[sha256sum] = "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24"
-- 
2.34.1

