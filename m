Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9D4046E666
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 17:04:21 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id q7so3071641pgr.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 09:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=7Z8yFYmRh64UNdogpqH0y2VXAniaAGYMbeCV4Thbd/o=;
	b=FmhEOQE/jw61cB1o7iNn4nEICOIGX28p/dWjruZGgJMcWHr/yf9Tk+0vd46qqmeBZf
	lZbRrvCeAV5Gf2+f+JLx29+9hWiSoYBO+I1+/ZkrGE2ur955HwIz5tCyQ4U5ZMe4MMN+
	CgEES40D5VbQ33/nsOzCBYmf2Ymo6qVOZX4Q6+AUvrKKaiYlbleiAFc3ogLT8qTrTJ/K
	nN6ReMdV6HTpj1hv7shEtFojmtbOp4mLxhc0GAcJ1lmQKKHJ3vgj4IuIXEuG6H0alisT
	D9GzGaGccT0hJxmbcuYalJ96cQ92EstOJ8j9/aFg6UMPgE9g4yCKpsssDR3dF/Dd9Kj3
	45+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=7Z8yFYmRh64UNdogpqH0y2VXAniaAGYMbeCV4Thbd/o=;
	b=SXjzsybAaexeNw5isRo99I1rabbRVJ3aOCgtt4dEn/vmZsOIcwTKC9BntQrgTBNBb2
	kpc7v9diH9MbpSZ8iubF5eELqO4T19+pm8SID8PBqTxdMeASo+NuakBt0M/in9rGG/Bg
	BH2jXjnQRlG6GK+cbP/JtE+9OrDYW7eT+g2muFj87RbtxjCnLtEVkFSqG2pFXhmd6eSq
	qDgJJEH+D0qDNgA9xvSI5+dTXbvMgxWa1DNVqudvKZtkUoKNsCbfspw6Ydx+xP8Kivl9
	BEZjfpfud1RuVkLDfGvDys8wRy53xRRQHAdiggxnsj8t3c/AffRw0RglMLqpp3CS86aN
	NvVQ==
X-Gm-Message-State: AJaThX4BmEzlEbjFd+vqe+/8dLUfzz0bjyzOTum/ahMKb7S2g5wZ3epR
	pjf8FuDu4axW1UgCeMmQuGUcIw==
X-Google-Smtp-Source: AGs4zMZEO8mlm8t59xUTUH1YEkwbGocgb1ZCHs22Lkc5AdShCZ/WW5DKLUblNpTv6UAKJZiQkA6uSA==
X-Received: by 10.99.3.146 with SMTP id 140mr28821386pgd.275.1511543062532;
	Fri, 24 Nov 2017 09:04:22 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:2178:58dc:281c:c010?
	([2601:202:4001:9ea0:2178:58dc:281c:c010])
	by smtp.gmail.com with ESMTPSA id
	z126sm27619792pfz.103.2017.11.24.09.04.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Nov 2017 09:04:22 -0800 (PST)
To: George McCollister <george.mccollister@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20171121200121.5896-1-george.mccollister@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2ee3f5fa-b45d-70cb-18fe-e69cd4e513f2@gmail.com>
Date: Fri, 24 Nov 2017 09:04:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171121200121.5896-1-george.mccollister@gmail.com>
Subject: Re: [morty][PATCH v3 1/2] glibc: Fix CVE-2015-5180
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
X-List-Received-Date: Fri, 24 Nov 2017 17:04:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

in akuster/pyro-next


On 11/21/2017 12:01 PM, George McCollister wrote:
> Add backported patch to fix CVE-2015-5180 from the upstream
> release/2.24/master branch.
>
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>
> Changes in v2:
>  - Fix commit message
>
> Changes in v3:
>  - None. Resending with other patch in the series.
>
>  ...80-resolv-Fix-crash-with-internal-QTYPE-B.patch | 357 +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.24.bb              |   1 +
>  2 files changed, 358 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2015-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2015-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2015-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch
> new file mode 100644
> index 0000000000..ba0bebe488
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-CVE-2015-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch
> @@ -0,0 +1,357 @@
> +From ff9b7c4fb73295cd2de2d2ccfbbf4f6d50883d47 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Sat, 31 Dec 2016 20:22:09 +0100
> +Subject: [PATCH] CVE-2015-5180: resolv: Fix crash with internal QTYPE [BZ
> + #18784]
> +
> +Also rename T_UNSPEC because an upcoming public header file
> +update will use that name.
> +
> +(cherry picked from commit fc82b0a2dfe7dbd35671c10510a8da1043d746a5)
> +
> +Upstream-Status: Backport
> +https://sourceware.org/git/?p=glibc.git;a=patch;h=b3b37f1a5559a7620e31c8053ed1b44f798f2b6d
> +
> +CVE: CVE-2015-5180
> +
> +Signed-off-by: George McCollister <george.mccollister@gmail.com>
> +---
> + ChangeLog                     |  14 ++++
> + NEWS                          |   6 ++
> + include/arpa/nameser_compat.h |   6 +-
> + resolv/Makefile               |   5 ++
> + resolv/nss_dns/dns-host.c     |   2 +-
> + resolv/res_mkquery.c          |   4 +
> + resolv/res_query.c            |   6 +-
> + resolv/tst-resolv-qtypes.c    | 185 ++++++++++++++++++++++++++++++++++++++++++
> + 8 files changed, 221 insertions(+), 7 deletions(-)
> + create mode 100644 resolv/tst-resolv-qtypes.c
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 893262de11..2bdaf69e43 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,17 @@
> ++2016-12-31  Florian Weimer  <fweimer@redhat.com>
> ++
> ++	[BZ #18784]
> ++	CVE-2015-5180
> ++	* include/arpa/nameser_compat.h (T_QUERY_A_AND_AAAA): Rename from
> ++	T_UNSPEC.  Adjust value.
> ++	* resolv/nss_dns/dns-host.c (_nss_dns_gethostbyname4_r): Use it.
> ++	* resolv/res_query.c (__libc_res_nquery): Likewise.
> ++	* resolv/res_mkquery.c (res_nmkquery): Check for out-of-range
> ++	QTYPEs.
> ++	* resolv/tst-resolv-qtypes.c: New file.
> ++	* resolv/Makefile (xtests): Add tst-resolv-qtypes.
> ++	(tst-resolv-qtypes): Link against libresolv and libpthread.
> ++
> + 2016-10-26  Carlos O'Donell  <carlos@redhat.com>
> + 
> + 	* include/atomic.h
> +diff --git a/NEWS b/NEWS
> +index 3002773c16..4b1ca3cb65 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -11,6 +11,12 @@ using `glibc' in the "product" field.
> +   printers show various pthread variables in human-readable form when read
> +   using the 'print' or 'display' commands in gdb.
> + 
> ++* The DNS stub resolver functions would crash due to a NULL pointer
> ++  dereference when processing a query with a valid DNS question type which
> ++  was used internally in the implementation.  The stub resolver now uses a
> ++  question type which is outside the range of valid question type values.
> ++  (CVE-2015-5180)
> ++
> + Version 2.24
> + 
> + * The minimum Linux kernel version that this version of the GNU C Library
> +diff --git a/include/arpa/nameser_compat.h b/include/arpa/nameser_compat.h
> +index 2e735ede4c..7c0deed9ae 100644
> +--- a/include/arpa/nameser_compat.h
> ++++ b/include/arpa/nameser_compat.h
> +@@ -1,8 +1,8 @@
> + #ifndef _ARPA_NAMESER_COMPAT_
> + #include <resolv/arpa/nameser_compat.h>
> + 
> +-/* Picksome unused number to represent lookups of IPv4 and IPv6 (i.e.,
> +-   T_A and T_AAAA).  */
> +-#define T_UNSPEC 62321
> ++/* The number is outside the 16-bit RR type range and is used
> ++   internally by the implementation.  */
> ++#define T_QUERY_A_AND_AAAA 439963904
> + 
> + #endif
> +diff --git a/resolv/Makefile b/resolv/Makefile
> +index 8be41d3ae1..a4c86b9762 100644
> +--- a/resolv/Makefile
> ++++ b/resolv/Makefile
> +@@ -40,6 +40,9 @@ ifeq ($(have-thread-library),yes)
> + extra-libs += libanl
> + routines += gai_sigqueue
> + tests += tst-res_hconf_reorder
> ++
> ++# This test sends millions of packets and is rather slow.
> ++xtests += tst-resolv-qtypes
> + endif
> + extra-libs-others = $(extra-libs)
> + libresolv-routines := gethnamaddr res_comp res_debug	\
> +@@ -117,3 +120,5 @@ tst-leaks2-ENV = MALLOC_TRACE=$(objpfx)tst-leaks2.mtrace
> + $(objpfx)mtrace-tst-leaks2.out: $(objpfx)tst-leaks2.out
> + 	$(common-objpfx)malloc/mtrace $(objpfx)tst-leaks2.mtrace > $@; \
> + 	$(evaluate-test)
> ++
> ++$(objpfx)tst-resolv-qtypes: $(objpfx)libresolv.so $(shared-thread-library)
> +diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
> +index 5f9e35701b..d16fa4b8ed 100644
> +--- a/resolv/nss_dns/dns-host.c
> ++++ b/resolv/nss_dns/dns-host.c
> +@@ -323,7 +323,7 @@ _nss_dns_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
> + 
> +   int olderr = errno;
> +   enum nss_status status;
> +-  int n = __libc_res_nsearch (&_res, name, C_IN, T_UNSPEC,
> ++  int n = __libc_res_nsearch (&_res, name, C_IN, T_QUERY_A_AND_AAAA,
> + 			      host_buffer.buf->buf, 2048, &host_buffer.ptr,
> + 			      &ans2p, &nans2p, &resplen2, &ans2p_malloced);
> +   if (n >= 0)
> +diff --git a/resolv/res_mkquery.c b/resolv/res_mkquery.c
> +index 12f9730199..d80b5318e5 100644
> +--- a/resolv/res_mkquery.c
> ++++ b/resolv/res_mkquery.c
> +@@ -103,6 +103,10 @@ res_nmkquery(res_state statp,
> + 	int n;
> + 	u_char *dnptrs[20], **dpp, **lastdnptr;
> + 
> ++	if (class < 0 || class > 65535
> ++	    || type < 0 || type > 65535)
> ++	  return -1;
> ++
> + #ifdef DEBUG
> + 	if (statp->options & RES_DEBUG)
> + 		printf(";; res_nmkquery(%s, %s, %s, %s)\n",
> +diff --git a/resolv/res_query.c b/resolv/res_query.c
> +index 944d1a90f5..07dc6f6583 100644
> +--- a/resolv/res_query.c
> ++++ b/resolv/res_query.c
> +@@ -122,7 +122,7 @@ __libc_res_nquery(res_state statp,
> + 	int n, use_malloc = 0;
> + 	u_int oflags = statp->_flags;
> + 
> +-	size_t bufsize = (type == T_UNSPEC ? 2 : 1) * QUERYSIZE;
> ++	size_t bufsize = (type == T_QUERY_A_AND_AAAA ? 2 : 1) * QUERYSIZE;
> + 	u_char *buf = alloca (bufsize);
> + 	u_char *query1 = buf;
> + 	int nquery1 = -1;
> +@@ -137,7 +137,7 @@ __libc_res_nquery(res_state statp,
> + 		printf(";; res_query(%s, %d, %d)\n", name, class, type);
> + #endif
> + 
> +-	if (type == T_UNSPEC)
> ++	if (type == T_QUERY_A_AND_AAAA)
> + 	  {
> + 	    n = res_nmkquery(statp, QUERY, name, class, T_A, NULL, 0, NULL,
> + 			     query1, bufsize);
> +@@ -190,7 +190,7 @@ __libc_res_nquery(res_state statp,
> + 	if (__builtin_expect (n <= 0, 0) && !use_malloc) {
> + 		/* Retry just in case res_nmkquery failed because of too
> + 		   short buffer.  Shouldn't happen.  */
> +-		bufsize = (type == T_UNSPEC ? 2 : 1) * MAXPACKET;
> ++		bufsize = (type == T_QUERY_A_AND_AAAA ? 2 : 1) * MAXPACKET;
> + 		buf = malloc (bufsize);
> + 		if (buf != NULL) {
> + 			query1 = buf;
> +diff --git a/resolv/tst-resolv-qtypes.c b/resolv/tst-resolv-qtypes.c
> +new file mode 100644
> +index 0000000000..b3e60c693b
> +--- /dev/null
> ++++ b/resolv/tst-resolv-qtypes.c
> +@@ -0,0 +1,185 @@
> ++/* Exercise low-level query functions with different QTYPEs.
> ++   Copyright (C) 2016 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#include <resolv.h>
> ++#include <string.h>
> ++#include <support/check.h>
> ++#include <support/check_nss.h>
> ++#include <support/resolv_test.h>
> ++#include <support/support.h>
> ++#include <support/test-driver.h>
> ++#include <support/xmemstream.h>
> ++
> ++/* If ture, the response function will send the actual response packet
> ++   over TCP instead of UDP.  */
> ++static volatile bool force_tcp;
> ++
> ++/* Send back a fake resource record matching the QTYPE.  */
> ++static void
> ++response (const struct resolv_response_context *ctx,
> ++          struct resolv_response_builder *b,
> ++          const char *qname, uint16_t qclass, uint16_t qtype)
> ++{
> ++  if (force_tcp && ctx->tcp)
> ++    {
> ++      resolv_response_init (b, (struct resolv_response_flags) { .tc = 1 });
> ++      resolv_response_add_question (b, qname, qclass, qtype);
> ++      return;
> ++    }
> ++
> ++  resolv_response_init (b, (struct resolv_response_flags) { });
> ++  resolv_response_add_question (b, qname, qclass, qtype);
> ++  resolv_response_section (b, ns_s_an);
> ++  resolv_response_open_record (b, qname, qclass, qtype, 0);
> ++  resolv_response_add_data (b, &qtype, sizeof (qtype));
> ++  resolv_response_close_record (b);
> ++}
> ++
> ++static const const char *domain = "www.example.com";
> ++
> ++static int
> ++wrap_res_query (int type, unsigned char *answer, int answer_length)
> ++{
> ++  return res_query (domain, C_IN, type, answer, answer_length);
> ++}
> ++
> ++static int
> ++wrap_res_search (int type, unsigned char *answer, int answer_length)
> ++{
> ++  return res_query (domain, C_IN, type, answer, answer_length);
> ++}
> ++
> ++static int
> ++wrap_res_querydomain (int type, unsigned char *answer, int answer_length)
> ++{
> ++  return res_querydomain ("www", "example.com", C_IN, type,
> ++                           answer, answer_length);
> ++}
> ++
> ++static int
> ++wrap_res_send (int type, unsigned char *answer, int answer_length)
> ++{
> ++  unsigned char buf[512];
> ++  int ret = res_mkquery (QUERY, domain, C_IN, type,
> ++                         (const unsigned char *) "", 0, NULL,
> ++                         buf, sizeof (buf));
> ++  if (type < 0 || type >= 65536)
> ++    {
> ++      /* res_mkquery fails for out-of-range record types.  */
> ++      TEST_VERIFY_EXIT (ret == -1);
> ++      return -1;
> ++    }
> ++  TEST_VERIFY_EXIT (ret > 12);  /* DNS header length.  */
> ++  return res_send (buf, ret, answer, answer_length);
> ++}
> ++
> ++static int
> ++wrap_res_nquery (int type, unsigned char *answer, int answer_length)
> ++{
> ++  return res_nquery (&_res, domain, C_IN, type, answer, answer_length);
> ++}
> ++
> ++static int
> ++wrap_res_nsearch (int type, unsigned char *answer, int answer_length)
> ++{
> ++  return res_nquery (&_res, domain, C_IN, type, answer, answer_length);
> ++}
> ++
> ++static int
> ++wrap_res_nquerydomain (int type, unsigned char *answer, int answer_length)
> ++{
> ++  return res_nquerydomain (&_res, "www", "example.com", C_IN, type,
> ++                           answer, answer_length);
> ++}
> ++
> ++static int
> ++wrap_res_nsend (int type, unsigned char *answer, int answer_length)
> ++{
> ++  unsigned char buf[512];
> ++  int ret = res_nmkquery (&_res, QUERY, domain, C_IN, type,
> ++                         (const unsigned char *) "", 0, NULL,
> ++                         buf, sizeof (buf));
> ++  if (type < 0 || type >= 65536)
> ++    {
> ++      /* res_mkquery fails for out-of-range record types.  */
> ++      TEST_VERIFY_EXIT (ret == -1);
> ++      return -1;
> ++    }
> ++  TEST_VERIFY_EXIT (ret > 12);  /* DNS header length.  */
> ++  return res_nsend (&_res, buf, ret, answer, answer_length);
> ++}
> ++
> ++static void
> ++test_function (const char *fname,
> ++               int (*func) (int type,
> ++                            unsigned char *answer, int answer_length))
> ++{
> ++  unsigned char buf[512];
> ++  for (int tcp = 0; tcp < 2; ++tcp)
> ++    {
> ++      force_tcp = tcp;
> ++      for (unsigned int type = 1; type <= 65535; ++type)
> ++        {
> ++          if (test_verbose)
> ++            printf ("info: sending QTYPE %d with %s (tcp=%d)\n",
> ++                    type, fname, tcp);
> ++          int ret = func (type, buf, sizeof (buf));
> ++          if (ret != 47)
> ++            FAIL_EXIT1 ("%s tcp=%d qtype=%d return value %d",
> ++                        fname,tcp, type, ret);
> ++          /* One question, one answer record.  */
> ++          TEST_VERIFY (memcmp (buf + 4, "\0\1\0\1\0\0\0\0", 8) == 0);
> ++          /* Question section.  */
> ++          static const char qname[] = "\3www\7example\3com";
> ++          size_t qname_length = sizeof (qname);
> ++          TEST_VERIFY (memcmp (buf + 12, qname, qname_length) == 0);
> ++          /* RDATA part of answer.  */
> ++          uint16_t type16 = type;
> ++          TEST_VERIFY (memcmp (buf + ret - 2, &type16, sizeof (type16)) == 0);
> ++        }
> ++    }
> ++
> ++  TEST_VERIFY (func (-1, buf, sizeof (buf) == -1));
> ++  TEST_VERIFY (func (65536, buf, sizeof (buf) == -1));
> ++}
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  struct resolv_redirect_config config =
> ++    {
> ++      .response_callback = response,
> ++    };
> ++  struct resolv_test *obj = resolv_test_start (config);
> ++
> ++  test_function ("res_query", &wrap_res_query);
> ++  test_function ("res_search", &wrap_res_search);
> ++  test_function ("res_querydomain", &wrap_res_querydomain);
> ++  test_function ("res_send", &wrap_res_send);
> ++
> ++  test_function ("res_nquery", &wrap_res_nquery);
> ++  test_function ("res_nsearch", &wrap_res_nsearch);
> ++  test_function ("res_nquerydomain", &wrap_res_nquerydomain);
> ++  test_function ("res_nsend", &wrap_res_nsend);
> ++
> ++  resolv_test_end (obj);
> ++  return 0;
> ++}
> ++
> ++#define TIMEOUT 300
> ++#include <support/test-driver.c>
> +-- 
> +2.15.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
> index e723e03dcf..4c7d901149 100644
> --- a/meta/recipes-core/glibc/glibc_2.24.bb
> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
> @@ -45,6 +45,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0004-New-condvar-implementation-that-provides-stronger-or.patch \
>             file://0005-Remove-__ASSUME_REQUEUE_PI.patch \
>             file://0006-Fix-atomic_fetch_xor_release.patch \
> +           file://0001-CVE-2015-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch \
>  "
>  
>  SRC_URI += "\


