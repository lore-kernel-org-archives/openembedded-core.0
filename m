Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 50425784F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 03:11:27 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id s75so19563939pgs.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 19:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c34qg0s2QBIxGIgjPU5RtZeJeBNj4V1GUCLmCUBE8OY=;
	b=e62XeQx7M8k9tzOo85p0S7VrXqEAAz0gFQkOsYjISNjfoMHDu+vB6jX3fKTM04nJNG
	fZfMyCuQMyZfMIbNp7KPghksyp6Q794fKniMV3pKZ8nVmB2nLQB4ERgH0knebfmpwoxr
	RXCEsUsKIj/dpPtq0/B/IFJP16m+abDaVNnDJaOqV7Sg4C2D3G/t8ylJZ00sWJD73C+3
	2eDmb7ZyskjL/ZovHVbtOErulJa1oEjAcw/W7F4qtnXyfN0WKCXZquKmtUsjW36SsFEf
	6hcB/dcFSQ+Jkr3WsUwMJeINFQB12eVrbruNPpfiEwWAjRzoBesjWErIUVDx96vxlGgB
	D1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c34qg0s2QBIxGIgjPU5RtZeJeBNj4V1GUCLmCUBE8OY=;
	b=BnR5gCdQ/apBOviCze80uOENUS82G9HDQQs+vcQUGgj0eM7bGKGxulxJ2X9YIY7sAD
	zrbhfKUnoAEpWUbx0v3HySf0zARYBV4eF/sf7QA9xRsKftMAC2PPPZJRwW6weCqp5lqh
	HgaTFfMtf4DwvvKM6Q5skxzba/WBLRZN8iZAZINqYMlKcUkmeKrZeYICh+1Ue5SQv8uT
	cDbAGtk6TsnP4xt2sAwEXaXFRcMUWhfmuFzGcibFrN/6l4Fs1l1uvkfBDriZYdmqqB5u
	NapZ+whe5L/VHRJDNZZfzSUEDZY1xGiaMHrTKUSuYe8Iy4NP/bZKKsY/bX3+sIjCwsRz
	CZRQ==
X-Gm-Message-State: AJaThX5ZZhMfD9N/vSLHmSX/5Kv8sWBdpAvLHA1dmvaOvLtTOfEw/5Ah
	56YoI0E9EWGKJLVhenFR7XtSi4YF9Nd1P0DhwP8=
X-Google-Smtp-Source: AGs4zMYhKKnXIdltVVl+tzEnqcRXrrMcgbKGBDc/2/o8XnhAZEK2KQsMuLJbkmyTJOb6ClWgyplzJlaMKebChdHChdc=
X-Received: by 10.101.74.129 with SMTP id b1mr227825pgu.341.1510801889054;
	Wed, 15 Nov 2017 19:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20171115203605.19088-1-george.mccollister@gmail.com>
In-Reply-To: <20171115203605.19088-1-george.mccollister@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Nov 2017 03:11:17 +0000
Message-ID: <CAMKF1srXdUx1QynC3PBSNRQT9qXu1rF2ZSDDcyC9ZcvJ=6Ow9Q@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	George McCollister <george.mccollister@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH v2 1/2] glibc: Fix CVE-2015-5180
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
X-List-Received-Date: Thu, 16 Nov 2017 03:11:28 -0000
Content-Type: multipart/alternative; boundary="089e08252884ec55d3055e10f9e3"

--089e08252884ec55d3055e10f9e3
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 15, 2017 at 12:36 PM George McCollister <
george.mccollister@gmail.com> wrote:

> Add backported patch to fix CVE-2015-5180 from the upstream
> release/2.24/master branch.
>

This is ok

>
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>
> Changes in v2:
>  - Fix commit message
>
>  ...80-resolv-Fix-crash-with-internal-QTYPE-B.patch | 357
> +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.24.bb              |   1 +
>  2 files changed, 358 insertions(+)
>  create mode 100644
> meta/recipes-core/glibc/glibc/0001-CVE-2015-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch
>
> diff --git
> a/meta/recipes-core/glibc/glibc/0001-CVE-2015-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch
> b/meta/recipes-core/glibc/glibc/0001-CVE-2015-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch
> new file mode 100644
> index 0000000000..ba0bebe488
> --- /dev/null
> +++
> b/meta/recipes-core/glibc/glibc/0001-CVE-2015-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch
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
> +
> https://sourceware.org/git/?p=glibc.git;a=patch;h=b3b37f1a5559a7620e31c8053ed1b44f798f2b6d
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
> + resolv/tst-resolv-qtypes.c    | 185
> ++++++++++++++++++++++++++++++++++++++++++
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
> ++      [BZ #18784]
> ++      CVE-2015-5180
> ++      * include/arpa/nameser_compat.h (T_QUERY_A_AND_AAAA): Rename from
> ++      T_UNSPEC.  Adjust value.
> ++      * resolv/nss_dns/dns-host.c (_nss_dns_gethostbyname4_r): Use it.
> ++      * resolv/res_query.c (__libc_res_nquery): Likewise.
> ++      * resolv/res_mkquery.c (res_nmkquery): Check for out-of-range
> ++      QTYPEs.
> ++      * resolv/tst-resolv-qtypes.c: New file.
> ++      * resolv/Makefile (xtests): Add tst-resolv-qtypes.
> ++      (tst-resolv-qtypes): Link against libresolv and libpthread.
> ++
> + 2016-10-26  Carlos O'Donell  <carlos@redhat.com>
> +
> +       * include/atomic.h
> +diff --git a/NEWS b/NEWS
> +index 3002773c16..4b1ca3cb65 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -11,6 +11,12 @@ using `glibc' in the "product" field.
> +   printers show various pthread variables in human-readable form when
> read
> +   using the 'print' or 'display' commands in gdb.
> +
> ++* The DNS stub resolver functions would crash due to a NULL pointer
> ++  dereference when processing a query with a valid DNS question type
> which
> ++  was used internally in the implementation.  The stub resolver now uses
> a
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
> + libresolv-routines := gethnamaddr res_comp res_debug  \
> +@@ -117,3 +120,5 @@ tst-leaks2-ENV =
> MALLOC_TRACE=$(objpfx)tst-leaks2.mtrace
> + $(objpfx)mtrace-tst-leaks2.out: $(objpfx)tst-leaks2.out
> +       $(common-objpfx)malloc/mtrace $(objpfx)tst-leaks2.mtrace > $@; \
> +       $(evaluate-test)
> ++
> ++$(objpfx)tst-resolv-qtypes: $(objpfx)libresolv.so
> $(shared-thread-library)
> +diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
> +index 5f9e35701b..d16fa4b8ed 100644
> +--- a/resolv/nss_dns/dns-host.c
> ++++ b/resolv/nss_dns/dns-host.c
> +@@ -323,7 +323,7 @@ _nss_dns_gethostbyname4_r (const char *name, struct
> gaih_addrtuple **pat,
> +
> +   int olderr = errno;
> +   enum nss_status status;
> +-  int n = __libc_res_nsearch (&_res, name, C_IN, T_UNSPEC,
> ++  int n = __libc_res_nsearch (&_res, name, C_IN, T_QUERY_A_AND_AAAA,
> +                             host_buffer.buf->buf, 2048, &host_buffer.ptr,
> +                             &ans2p, &nans2p, &resplen2, &ans2p_malloced);
> +   if (n >= 0)
> +diff --git a/resolv/res_mkquery.c b/resolv/res_mkquery.c
> +index 12f9730199..d80b5318e5 100644
> +--- a/resolv/res_mkquery.c
> ++++ b/resolv/res_mkquery.c
> +@@ -103,6 +103,10 @@ res_nmkquery(res_state statp,
> +       int n;
> +       u_char *dnptrs[20], **dpp, **lastdnptr;
> +
> ++      if (class < 0 || class > 65535
> ++          || type < 0 || type > 65535)
> ++        return -1;
> ++
> + #ifdef DEBUG
> +       if (statp->options & RES_DEBUG)
> +               printf(";; res_nmkquery(%s, %s, %s, %s)\n",
> +diff --git a/resolv/res_query.c b/resolv/res_query.c
> +index 944d1a90f5..07dc6f6583 100644
> +--- a/resolv/res_query.c
> ++++ b/resolv/res_query.c
> +@@ -122,7 +122,7 @@ __libc_res_nquery(res_state statp,
> +       int n, use_malloc = 0;
> +       u_int oflags = statp->_flags;
> +
> +-      size_t bufsize = (type == T_UNSPEC ? 2 : 1) * QUERYSIZE;
> ++      size_t bufsize = (type == T_QUERY_A_AND_AAAA ? 2 : 1) * QUERYSIZE;
> +       u_char *buf = alloca (bufsize);
> +       u_char *query1 = buf;
> +       int nquery1 = -1;
> +@@ -137,7 +137,7 @@ __libc_res_nquery(res_state statp,
> +               printf(";; res_query(%s, %d, %d)\n", name, class, type);
> + #endif
> +
> +-      if (type == T_UNSPEC)
> ++      if (type == T_QUERY_A_AND_AAAA)
> +         {
> +           n = res_nmkquery(statp, QUERY, name, class, T_A, NULL, 0, NULL,
> +                            query1, bufsize);
> +@@ -190,7 +190,7 @@ __libc_res_nquery(res_state statp,
> +       if (__builtin_expect (n <= 0, 0) && !use_malloc) {
> +               /* Retry just in case res_nmkquery failed because of too
> +                  short buffer.  Shouldn't happen.  */
> +-              bufsize = (type == T_UNSPEC ? 2 : 1) * MAXPACKET;
> ++              bufsize = (type == T_QUERY_A_AND_AAAA ? 2 : 1) * MAXPACKET;
> +               buf = malloc (bufsize);
> +               if (buf != NULL) {
> +                       query1 = buf;
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
> ++      resolv_response_init (b, (struct resolv_response_flags) { .tc = 1
> });
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
> ++wrap_res_nquerydomain (int type, unsigned char *answer, int
> answer_length)
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
> ++          TEST_VERIFY (memcmp (buf + ret - 2, &type16, sizeof (type16))
> == 0);
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
> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb
> b/meta/recipes-core/glibc/glibc_2.24.bb
> index e723e03dcf..4c7d901149 100644
> --- a/meta/recipes-core/glibc/glibc_2.24.bb
> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
> @@ -45,6 +45,7 @@ SRC_URI =
> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>
> file://0004-New-condvar-implementation-that-provides-stronger-or.patch \
>             file://0005-Remove-__ASSUME_REQUEUE_PI.patch \
>             file://0006-Fix-atomic_fetch_xor_release.patch \
> +
>  file://0001-CVE-2015-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch \
>  "
>
>  SRC_URI += "\
> --
> 2.15.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e08252884ec55d3055e10f9e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Nov 15, 2017 =
at 12:36 PM George McCollister &lt;<a href=3D"mailto:george.mccollister@gma=
il.com">george.mccollister@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Add backported patch to fix CVE-2015-5180 from the upstrea=
m<br>
release/2.24/master branch.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This is ok</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
Signed-off-by: George McCollister &lt;<a href=3D"mailto:george.mccollister@=
gmail.com" target=3D"_blank">george.mccollister@gmail.com</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
=C2=A0- Fix commit message<br>
<br>
=C2=A0...80-resolv-Fix-crash-with-internal-QTYPE-B.patch | 357 ++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.24.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.24.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 358 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2015-5180-r=
esolv-Fix-crash-with-internal-QTYPE-B.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2015-5180-resolv-Fix-cr=
ash-with-internal-QTYPE-B.patch b/meta/recipes-core/glibc/glibc/0001-CVE-20=
15-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch<br>
new file mode 100644<br>
index 0000000000..ba0bebe488<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0001-CVE-2015-5180-resolv-Fix-crash-wit=
h-internal-QTYPE-B.patch<br>
@@ -0,0 +1,357 @@<br>
+From ff9b7c4fb73295cd2de2d2ccfbbf4f6d50883d47 Mon Sep 17 00:00:00 2001<br>
+From: Florian Weimer &lt;<a href=3D"mailto:fweimer@redhat.com" target=3D"_=
blank">fweimer@redhat.com</a>&gt;<br>
+Date: Sat, 31 Dec 2016 20:22:09 +0100<br>
+Subject: [PATCH] CVE-2015-5180: resolv: Fix crash with internal QTYPE [BZ<=
br>
+ #18784]<br>
+<br>
+Also rename T_UNSPEC because an upcoming public header file<br>
+update will use that name.<br>
+<br>
+(cherry picked from commit fc82b0a2dfe7dbd35671c10510a8da1043d746a5)<br>
+<br>
+Upstream-Status: Backport<br>
+<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3Db3b37f1=
a5559a7620e31c8053ed1b44f798f2b6d" rel=3D"noreferrer" target=3D"_blank">htt=
ps://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3Db3b37f1a5559a7620e31c8=
053ed1b44f798f2b6d</a><br>
+<br>
+CVE: CVE-2015-5180<br>
+<br>
+Signed-off-by: George McCollister &lt;<a href=3D"mailto:george.mccollister=
@gmail.com" target=3D"_blank">george.mccollister@gmail.com</a>&gt;<br>
+---<br>
+ ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 14 ++++<br>
+ NEWS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 ++<br>
+ include/arpa/nameser_compat.h |=C2=A0 =C2=A06 +-<br>
+ resolv/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 ++<br>
+ resolv/nss_dns/dns-host.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
+ resolv/res_mkquery.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<=
br>
+ resolv/res_query.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A06 +-<br>
+ resolv/tst-resolv-qtypes.c=C2=A0 =C2=A0 | 185 +++++++++++++++++++++++++++=
+++++++++++++++<br>
+ 8 files changed, 221 insertions(+), 7 deletions(-)<br>
+ create mode 100644 resolv/tst-resolv-qtypes.c<br>
+<br>
+diff --git a/ChangeLog b/ChangeLog<br>
+index 893262de11..2bdaf69e43 100644<br>
+--- a/ChangeLog<br>
++++ b/ChangeLog<br>
+@@ -1,3 +1,17 @@<br>
++2016-12-31=C2=A0 Florian Weimer=C2=A0 &lt;<a href=3D"mailto:fweimer@redha=
t.com" target=3D"_blank">fweimer@redhat.com</a>&gt;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 [BZ #18784]<br>
++=C2=A0 =C2=A0 =C2=A0 CVE-2015-5180<br>
++=C2=A0 =C2=A0 =C2=A0 * include/arpa/nameser_compat.h (T_QUERY_A_AND_AAAA)=
: Rename from<br>
++=C2=A0 =C2=A0 =C2=A0 T_UNSPEC.=C2=A0 Adjust value.<br>
++=C2=A0 =C2=A0 =C2=A0 * resolv/nss_dns/dns-host.c (_nss_dns_gethostbyname4=
_r): Use it.<br>
++=C2=A0 =C2=A0 =C2=A0 * resolv/res_query.c (__libc_res_nquery): Likewise.<=
br>
++=C2=A0 =C2=A0 =C2=A0 * resolv/res_mkquery.c (res_nmkquery): Check for out=
-of-range<br>
++=C2=A0 =C2=A0 =C2=A0 QTYPEs.<br>
++=C2=A0 =C2=A0 =C2=A0 * resolv/tst-resolv-qtypes.c: New file.<br>
++=C2=A0 =C2=A0 =C2=A0 * resolv/Makefile (xtests): Add tst-resolv-qtypes.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 (tst-resolv-qtypes): Link against libresolv and libp=
thread.<br>
++<br>
+ 2016-10-26=C2=A0 Carlos O&#39;Donell=C2=A0 &lt;<a href=3D"mailto:carlos@r=
edhat.com" target=3D"_blank">carlos@redhat.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* include/atomic.h<br>
+diff --git a/NEWS b/NEWS<br>
+index 3002773c16..4b1ca3cb65 100644<br>
+--- a/NEWS<br>
++++ b/NEWS<br>
+@@ -11,6 +11,12 @@ using `glibc&#39; in the &quot;product&quot; field.<br>
+=C2=A0 =C2=A0printers show various pthread variables in human-readable for=
m when read<br>
+=C2=A0 =C2=A0using the &#39;print&#39; or &#39;display&#39; commands in gd=
b.<br>
+<br>
++* The DNS stub resolver functions would crash due to a NULL pointer<br>
++=C2=A0 dereference when processing a query with a valid DNS question type=
 which<br>
++=C2=A0 was used internally in the implementation.=C2=A0 The stub resolver=
 now uses a<br>
++=C2=A0 question type which is outside the range of valid question type va=
lues.<br>
++=C2=A0 (CVE-2015-5180)<br>
++<br>
+ Version 2.24<br>
+<br>
+ * The minimum Linux kernel version that this version of the GNU C Library=
<br>
+diff --git a/include/arpa/nameser_compat.h b/include/arpa/nameser_compat.h=
<br>
+index 2e735ede4c..7c0deed9ae 100644<br>
+--- a/include/arpa/nameser_compat.h<br>
++++ b/include/arpa/nameser_compat.h<br>
+@@ -1,8 +1,8 @@<br>
+ #ifndef _ARPA_NAMESER_COMPAT_<br>
+ #include &lt;resolv/arpa/nameser_compat.h&gt;<br>
+<br>
+-/* Picksome unused number to represent lookups of IPv4 and IPv6 (i.e.,<br=
>
+-=C2=A0 =C2=A0T_A and T_AAAA).=C2=A0 */<br>
+-#define T_UNSPEC 62321<br>
++/* The number is outside the 16-bit RR type range and is used<br>
++=C2=A0 =C2=A0internally by the implementation.=C2=A0 */<br>
++#define T_QUERY_A_AND_AAAA 439963904<br>
+<br>
+ #endif<br>
+diff --git a/resolv/Makefile b/resolv/Makefile<br>
+index 8be41d3ae1..a4c86b9762 100644<br>
+--- a/resolv/Makefile<br>
++++ b/resolv/Makefile<br>
+@@ -40,6 +40,9 @@ ifeq ($(have-thread-library),yes)<br>
+ extra-libs +=3D libanl<br>
+ routines +=3D gai_sigqueue<br>
+ tests +=3D tst-res_hconf_reorder<br>
++<br>
++# This test sends millions of packets and is rather slow.<br>
++xtests +=3D tst-resolv-qtypes<br>
+ endif<br>
+ extra-libs-others =3D $(extra-libs)<br>
+ libresolv-routines :=3D gethnamaddr res_comp res_debug=C2=A0 \<br>
+@@ -117,3 +120,5 @@ tst-leaks2-ENV =3D MALLOC_TRACE=3D$(objpfx)tst-leaks2.=
mtrace<br>
+ $(objpfx)mtrace-tst-leaks2.out: $(objpfx)tst-leaks2.out<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(common-objpfx)malloc/mtrace $(objpfx)tst-leak=
s2.mtrace &gt; $@; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(evaluate-test)<br>
++<br>
++$(objpfx)tst-resolv-qtypes: $(objpfx)libresolv.so $(shared-thread-library=
)<br>
+diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c<br>
+index 5f9e35701b..d16fa4b8ed 100644<br>
+--- a/resolv/nss_dns/dns-host.c<br>
++++ b/resolv/nss_dns/dns-host.c<br>
+@@ -323,7 +323,7 @@ _nss_dns_gethostbyname4_r (const char *name, struct ga=
ih_addrtuple **pat,<br>
+<br>
+=C2=A0 =C2=A0int olderr =3D errno;<br>
+=C2=A0 =C2=A0enum nss_status status;<br>
+-=C2=A0 int n =3D __libc_res_nsearch (&amp;_res, name, C_IN, T_UNSPEC,<br>
++=C2=A0 int n =3D __libc_res_nsearch (&amp;_res, name, C_IN, T_QUERY_A_AND=
_AAAA,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_buffer.buf-&gt;buf, 2048, &amp;host_buf=
fer.ptr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;ans2p, &amp;nans2p, &amp;resplen2, &amp=
;ans2p_malloced);<br>
+=C2=A0 =C2=A0if (n &gt;=3D 0)<br>
+diff --git a/resolv/res_mkquery.c b/resolv/res_mkquery.c<br>
+index 12f9730199..d80b5318e5 100644<br>
+--- a/resolv/res_mkquery.c<br>
++++ b/resolv/res_mkquery.c<br>
+@@ -103,6 +103,10 @@ res_nmkquery(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int n;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u_char *dnptrs[20], **dpp, **lastdnptr;<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 if (class &lt; 0 || class &gt; 65535<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || type &lt; 0 || type &gt; 65535)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
++<br>
+ #ifdef DEBUG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (statp-&gt;options &amp; RES_DEBUG)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;;; res=
_nmkquery(%s, %s, %s, %s)\n&quot;,<br>
+diff --git a/resolv/res_query.c b/resolv/res_query.c<br>
+index 944d1a90f5..07dc6f6583 100644<br>
+--- a/resolv/res_query.c<br>
++++ b/resolv/res_query.c<br>
+@@ -122,7 +122,7 @@ __libc_res_nquery(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int n, use_malloc =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u_int oflags =3D statp-&gt;_flags;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 size_t bufsize =3D (type =3D=3D T_UNSPEC ? 2 : 1) * =
QUERYSIZE;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t bufsize =3D (type =3D=3D T_QUERY_A_AND_AAAA ?=
 2 : 1) * QUERYSIZE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u_char *buf =3D alloca (bufsize);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u_char *query1 =3D buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int nquery1 =3D -1;<br>
+@@ -137,7 +137,7 @@ __libc_res_nquery(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;;; res=
_query(%s, %d, %d)\n&quot;, name, class, type);<br>
+ #endif<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 if (type =3D=3D T_UNSPEC)<br>
++=C2=A0 =C2=A0 =C2=A0 if (type =3D=3D T_QUERY_A_AND_AAAA)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D res_nmkquery(statp, QUERY, =
name, class, T_A, NULL, 0, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 query1, bufsize);<br>
+@@ -190,7 +190,7 @@ __libc_res_nquery(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (__builtin_expect (n &lt;=3D 0, 0) &amp;&amp=
; !use_malloc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Retry just in ca=
se res_nmkquery failed because of too<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 short buffe=
r.=C2=A0 Shouldn&#39;t happen.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bufsize =3D (type =3D=3D=
 T_UNSPEC ? 2 : 1) * MAXPACKET;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bufsize =3D (type =3D=3D=
 T_QUERY_A_AND_AAAA ? 2 : 1) * MAXPACKET;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D malloc (buf=
size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf !=3D NULL) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0query1 =3D buf;<br>
+diff --git a/resolv/tst-resolv-qtypes.c b/resolv/tst-resolv-qtypes.c<br>
+new file mode 100644<br>
+index 0000000000..b3e60c693b<br>
+--- /dev/null<br>
++++ b/resolv/tst-resolv-qtypes.c<br>
+@@ -0,0 +1,185 @@<br>
++/* Exercise low-level query functions with different QTYPEs.<br>
++=C2=A0 =C2=A0Copyright (C) 2016 Free Software Foundation, Inc.<br>
++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
++<br>
++=C2=A0 =C2=A0The GNU C Library is free software; you can redistribute it =
and/or<br>
++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General Public<b=
r>
++=C2=A0 =C2=A0License as published by the Free Software Foundation; either=
<br>
++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any later ve=
rsion.<br>
++<br>
++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that it will be=
 useful,<br>
++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied warranty =
of<br>
++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 S=
ee the GNU<br>
++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
++<br>
++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser General Pu=
blic<br>
++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<br>
++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D"noreferr=
er" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
++<br>
++#include &lt;resolv.h&gt;<br>
++#include &lt;string.h&gt;<br>
++#include &lt;support/check.h&gt;<br>
++#include &lt;support/check_nss.h&gt;<br>
++#include &lt;support/resolv_test.h&gt;<br>
++#include &lt;support/support.h&gt;<br>
++#include &lt;support/test-driver.h&gt;<br>
++#include &lt;support/xmemstream.h&gt;<br>
++<br>
++/* If ture, the response function will send the actual response packet<br=
>
++=C2=A0 =C2=A0over TCP instead of UDP.=C2=A0 */<br>
++static volatile bool force_tcp;<br>
++<br>
++/* Send back a fake resource record matching the QTYPE.=C2=A0 */<br>
++static void<br>
++response (const struct resolv_response_context *ctx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct resolv_response_builder *b,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *qname, uint16_t qclass, ui=
nt16_t qtype)<br>
++{<br>
++=C2=A0 if (force_tcp &amp;&amp; ctx-&gt;tcp)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 resolv_response_init (b, (struct resolv_response_fla=
gs) { .tc =3D 1 });<br>
++=C2=A0 =C2=A0 =C2=A0 resolv_response_add_question (b, qname, qclass, qtyp=
e);<br>
++=C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 resolv_response_init (b, (struct resolv_response_flags) { });<br>
++=C2=A0 resolv_response_add_question (b, qname, qclass, qtype);<br>
++=C2=A0 resolv_response_section (b, ns_s_an);<br>
++=C2=A0 resolv_response_open_record (b, qname, qclass, qtype, 0);<br>
++=C2=A0 resolv_response_add_data (b, &amp;qtype, sizeof (qtype));<br>
++=C2=A0 resolv_response_close_record (b);<br>
++}<br>
++<br>
++static const const char *domain =3D &quot;<a href=3D"http://www.example.c=
om" rel=3D"noreferrer" target=3D"_blank">www.example.com</a>&quot;;<br>
++<br>
++static int<br>
++wrap_res_query (int type, unsigned char *answer, int answer_length)<br>
++{<br>
++=C2=A0 return res_query (domain, C_IN, type, answer, answer_length);<br>
++}<br>
++<br>
++static int<br>
++wrap_res_search (int type, unsigned char *answer, int answer_length)<br>
++{<br>
++=C2=A0 return res_query (domain, C_IN, type, answer, answer_length);<br>
++}<br>
++<br>
++static int<br>
++wrap_res_querydomain (int type, unsigned char *answer, int answer_length)=
<br>
++{<br>
++=C2=A0 return res_querydomain (&quot;www&quot;, &quot;<a href=3D"http://e=
xample.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>&quot;, C_I=
N, type,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0answer, answer_length);<br>
++}<br>
++<br>
++static int<br>
++wrap_res_send (int type, unsigned char *answer, int answer_length)<br>
++{<br>
++=C2=A0 unsigned char buf[512];<br>
++=C2=A0 int ret =3D res_mkquery (QUERY, domain, C_IN, type,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(const unsigned char *) &quot;&quot;, 0, NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0buf, sizeof (buf));<br>
++=C2=A0 if (type &lt; 0 || type &gt;=3D 65536)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* res_mkquery fails for out-of-range record types.=
=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 TEST_VERIFY_EXIT (ret =3D=3D -1);<br>
++=C2=A0 =C2=A0 =C2=A0 return -1;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 TEST_VERIFY_EXIT (ret &gt; 12);=C2=A0 /* DNS header length.=C2=A0 =
*/<br>
++=C2=A0 return res_send (buf, ret, answer, answer_length);<br>
++}<br>
++<br>
++static int<br>
++wrap_res_nquery (int type, unsigned char *answer, int answer_length)<br>
++{<br>
++=C2=A0 return res_nquery (&amp;_res, domain, C_IN, type, answer, answer_l=
ength);<br>
++}<br>
++<br>
++static int<br>
++wrap_res_nsearch (int type, unsigned char *answer, int answer_length)<br>
++{<br>
++=C2=A0 return res_nquery (&amp;_res, domain, C_IN, type, answer, answer_l=
ength);<br>
++}<br>
++<br>
++static int<br>
++wrap_res_nquerydomain (int type, unsigned char *answer, int answer_length=
)<br>
++{<br>
++=C2=A0 return res_nquerydomain (&amp;_res, &quot;www&quot;, &quot;<a href=
=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a=
>&quot;, C_IN, type,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0answer, answer_length);<br>
++}<br>
++<br>
++static int<br>
++wrap_res_nsend (int type, unsigned char *answer, int answer_length)<br>
++{<br>
++=C2=A0 unsigned char buf[512];<br>
++=C2=A0 int ret =3D res_nmkquery (&amp;_res, QUERY, domain, C_IN, type,<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(const unsigned char *) &quot;&quot;, 0, NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0buf, sizeof (buf));<br>
++=C2=A0 if (type &lt; 0 || type &gt;=3D 65536)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* res_mkquery fails for out-of-range record types.=
=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 TEST_VERIFY_EXIT (ret =3D=3D -1);<br>
++=C2=A0 =C2=A0 =C2=A0 return -1;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 TEST_VERIFY_EXIT (ret &gt; 12);=C2=A0 /* DNS header length.=C2=A0 =
*/<br>
++=C2=A0 return res_nsend (&amp;_res, buf, ret, answer, answer_length);<br>
++}<br>
++<br>
++static void<br>
++test_function (const char *fname,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int (*func) (int t=
ype,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char *answer, int answer_length))<br>
++{<br>
++=C2=A0 unsigned char buf[512];<br>
++=C2=A0 for (int tcp =3D 0; tcp &lt; 2; ++tcp)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 force_tcp =3D tcp;<br>
++=C2=A0 =C2=A0 =C2=A0 for (unsigned int type =3D 1; type &lt;=3D 65535; ++=
type)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (test_verbose)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf (&quot;info: sending QTY=
PE %d with %s (tcp=3D%d)\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typ=
e, fname, tcp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D func (type, buf, sizeof (b=
uf));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 47)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL_EXIT1 (&quot;%s tcp=3D%d q=
type=3D%d return value %d&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fname,tcp, type, ret);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* One question, one answer record.=C2=
=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST_VERIFY (memcmp (buf + 4, &quot;\0=
\1\0\1\0\0\0\0&quot;, 8) =3D=3D 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Question section.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static const char qname[] =3D &quot;\3=
www\7example\3com&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t qname_length =3D sizeof (qname)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST_VERIFY (memcmp (buf + 12, qname, =
qname_length) =3D=3D 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* RDATA part of answer.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t type16 =3D type;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST_VERIFY (memcmp (buf + ret - 2, &a=
mp;type16, sizeof (type16)) =3D=3D 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 TEST_VERIFY (func (-1, buf, sizeof (buf) =3D=3D -1));<br>
++=C2=A0 TEST_VERIFY (func (65536, buf, sizeof (buf) =3D=3D -1));<br>
++}<br>
++<br>
++static int<br>
++do_test (void)<br>
++{<br>
++=C2=A0 struct resolv_redirect_config config =3D<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 .response_callback =3D response,<br>
++=C2=A0 =C2=A0 };<br>
++=C2=A0 struct resolv_test *obj =3D resolv_test_start (config);<br>
++<br>
++=C2=A0 test_function (&quot;res_query&quot;, &amp;wrap_res_query);<br>
++=C2=A0 test_function (&quot;res_search&quot;, &amp;wrap_res_search);<br>
++=C2=A0 test_function (&quot;res_querydomain&quot;, &amp;wrap_res_querydom=
ain);<br>
++=C2=A0 test_function (&quot;res_send&quot;, &amp;wrap_res_send);<br>
++<br>
++=C2=A0 test_function (&quot;res_nquery&quot;, &amp;wrap_res_nquery);<br>
++=C2=A0 test_function (&quot;res_nsearch&quot;, &amp;wrap_res_nsearch);<br=
>
++=C2=A0 test_function (&quot;res_nquerydomain&quot;, &amp;wrap_res_nqueryd=
omain);<br>
++=C2=A0 test_function (&quot;res_nsend&quot;, &amp;wrap_res_nsend);<br>
++<br>
++=C2=A0 resolv_test_end (obj);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++#define TIMEOUT 300<br>
++#include &lt;support/test-driver.c&gt;<br>
+--<br>
+2.15.0<br>
+<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.24.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.24.bb</a> b/meta/recipes-core/gli=
bc/<a href=3D"http://glibc_2.24.bb" rel=3D"noreferrer" target=3D"_blank">gl=
ibc_2.24.bb</a><br>
index e723e03dcf..4c7d901149 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.24.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.24.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.24.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.24.bb</a><br>
@@ -45,6 +45,7 @@ SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${SRCBRANCH};=
name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-New-condvar-implement=
ation-that-provides-stronger-or.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-Remove-__ASSUME_REQUE=
UE_PI.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-Fix-atomic_fetch_xor_=
release.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-CVE-2015-5180-resolv-=
Fix-crash-with-internal-QTYPE-B.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;\<br>
--<br>
2.15.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--089e08252884ec55d3055e10f9e3--
