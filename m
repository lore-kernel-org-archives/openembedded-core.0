Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81.1795101862407191590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Ct6hQR6W;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d05d51553so17002875e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101861; x=1795706661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D8C8V9sOqamg7GzJx5JcpMbi+s5GXHeioJp2MeKzPZY=;
        b=Ct6hQR6W8u/Z+9MUDdyrS7EM+tYisET+jhxh95LQ7EIVVaNn4/UrdlOTP0A42hAvQL
         gONXsjhNOhjesX9KmUKpGg0a/G0qI9XjpTiTK9QvsAC+XzzyrAROLh5ygcAd6rLFAhsx
         q0d+7GCo+9JoH/eZKKSwNDe7JHqaSuSwrXK2ZOcA9HBhBi0xCqtLPQtctVm6Rd9NaHVf
         JE0puYMhbmzlmBcY7dH4mJxVfmd7IrOo1a6lKk65BSohbhZJ8tPEm49uAauNcrRjIxPz
         FYxMex95hRnlPJVzzJDzeDpu2ECdbrY5ZB4GmTTwLgwnp6Fq3k1nhhPUD4s0UEukHyKv
         KmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101861; x=1795706661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D8C8V9sOqamg7GzJx5JcpMbi+s5GXHeioJp2MeKzPZY=;
        b=2SxZncsr5QOcOjczogCV+1pOKIhVPBCwpe1mfazFJUIMEN+ZWoon//ZG/J7AlQrgiX
         r9NM0JochJJuaDXpis1c0khHdkI/4ndRpycgxoZLIKiHkLeFsrhBfzjWAwbutF48rkJb
         WQ+k8HTyBzocQBmJSvnRwbEAvFno8SzH6Q4qHQZhEVRfUJIiWlkEkbSXD6/PKPTP/O1b
         JnD0f4+WnCQhXDFXxjx0MExKecOsaTlr2POZMJh0Qt4M8gXnLiRPxLdkoFAcvXUC+h8Y
         N+TMyRchamcZjkrJ6JQYHpdtfrHZAxdHG6Bocm/R+ct1SMgU31ooRAE6iGjxMF3U5PGT
         8MQA==
X-Gm-Message-State: APuU4Z/hG+bRqWaDziUJNHTo0BWsYn6ez9/SBHHN8Zgn2oYlTkAYBgHH
	Z3NearUR3dFGu4Rnb2WkOI6mnZD2cOIpG/4l/s1e8xC2ORjLGRJABtSN+LPMxZW665WKB2X+IPG
	dnGtJx0M=
X-Gm-Gg: AYBFou20Y0SPGx4yiLWMuYljc0ygzysvldYJtbkspBc+q1srkZXzGqne+aLzY/n7vIR
	VMbrqavObz6neyPBuVNAZ1N06XiAIqIPZBqjYbJq3L36WSmYcDxFHKkXUcMum1jsDpW0YD9XZ42
	kCV0b/wL3Bus8STfyd7brmrplnZCoKfHqNKFLauHDUi+CLxcnAogR3E2uUSnFnXHALoKc3/yem+
	L1mBKsfq+1d7KVwur1Vr1vx/rsVThltiKUwSN2EImxmR+f9cbs2lRrGNcQK1ESIblVqizqUcjV2
	Voz2LReWkrWkBRakzFMKLyuHdvtxYfUfUq1KQAc9nhrPJ/XE/0OlubpJgJKMcu9+xDwNz/ScBUA
	rnGB9p5gMYK0YMKVzU3EecBFaGX/egzZUq3OCscbWXy6UhOU1qMYYSqtUE3OR8kCmNkzveQmbHK
	tRbkkwmtZ6Ml9WoYxVPHjgKCrWWjrRi4rN0C6zw9fi+mSoHr32TCS3rVgW7Xh13xAc3NirofNNA
	WxJVU8Q4z0eESOkd9KE85t1ZX5DduPeKEQsevY1MZdwbY280nNJ1ma7D4D9rznce+ZF5PA3xfyO
	q+c9cNy74vmiHdHY3BadAMBCFZTPVxC8N7BuGTrt9l4J7uxNqlakJTbfAEYZt2IAxaFVt5fJiML
	EmI6KkGZx0sdU2cZK6/R+9m3F1IT8Cb6xsf1UF4ZmT9WvSrD09SVcFJU=
X-Received: by 2002:a05:600d:a:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb7e4edf38mr99766165e9.12.1795101860181;
        Thu, 19 Nov 2026 07:24:20 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:19 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/19] bind: Security fix for CVE-2026-19667
Date: Thu, 19 Nov 2026 16:22:30 +0100
Message-ID: <7034c3e577101096a72616bee839d4804907a21e.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250687
Content-Type: text/plain; charset="utf-8"

From: Rohini Sangam <rsangam@mvista.com>

Pick patch from [1] and [2] also mentioned at Debian tracker in [3]

[1] https://github.com/isc-projects/bind9/commit/c4203fb70e3985452afddeadb7075aa91ae05d7d
[2] https://github.com/isc-projects/bind9/commit/993d10fe15adbac485d399f1e4144b55ed226ecf
[3] https://security-tracker.debian.org/tracker/CVE-2026-19667

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
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
