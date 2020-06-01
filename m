Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.38008.1591020730576820877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GKG6FFrk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.195, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f195.google.com with SMTP id b5so670635pfp.9
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ghuFE9lATdZci4G0g9xSNIi8Polntl567xFpmC6cv18=;
        b=GKG6FFrksX9pYluvchz2xYrGWxDYranGg+KkU7uTdCliNWlMCS0MnYP8Wwwtwk/yjt
         Wc7RNruFWgI6lbGOCyuJbXBzPrcg4Ih6Rhg8j7QjSp1iD9bBinru8P5V74EvsENkORmN
         kvAAv/tB4nhVh/lN4Mbh5C+wX7OtANrNPaqz+p8wJu9ldCuifkowTNMmCNJTCaXKrU0V
         fNgXCIMbd4FJwSB7SPETs7q+FmIZ6abcYdUYk+Jcc8L9B9xWy3EqJK7wkBCCvuQCeKXP
         ZBCX81FYZ5DbU6V+yr4FbgyAbdLXBPf7wXabV48H5YGFCa4ioP7n1TSYj8DtbMKzSyDp
         nv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ghuFE9lATdZci4G0g9xSNIi8Polntl567xFpmC6cv18=;
        b=PuNYXCyqi7g7azwFdF/i6/gxru3KtVq610oKuE/zehW78oH/UKavGISf13LjRCHMwW
         HK8NSRulXtX6JMwA+T6dQN+stzWwHH7YokqzUEjhQqVHPegcfE2mEYE3BV0iUyvHKAie
         BPaeQeisT6JKPmyK3G+mu3DaEmIhZgmF1m5UoqPl75S2xTsN18v4Eqq5CTU0Op+dheSo
         MTWU/Qwmn2Np8qZ3OO40YlCNhPD3r5XwP57Eg9W8NYP1fvaCGSTEl5c8Z3drM/CLNrn2
         FAF8jOfvtZ8YP7gKnl4L4nrbWvmk0Vhx6ZKWrW6TPfQWgvdvGhefx+JCdX8VeGrQXsbJ
         1ksA==
X-Gm-Message-State: AOAM5330g9s+taB2OgcYN7tdlE7oARpeOASSgKnJyVkP/yc41SErki9F
	JwANNLS5/3Lfp7U2+wKi6YOTtkhbyV4=
X-Google-Smtp-Source: ABdhPJzayjxiRXh+woV5kb7LxsOtyeamJvq4mg27sCm4Idw82Hz124Z9tRJgevS+mlNeInPMb/aSJg==
X-Received: by 2002:a65:68d2:: with SMTP id k18mr19457813pgt.110.1591020729526;
        Mon, 01 Jun 2020 07:12:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.12.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:12:08 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/16] bind: fix CVE-2020-8616/7
Date: Mon,  1 Jun 2020 04:11:17 -1000
Message-Id: <8681058cce46b342c9895819e3a4bc0770934d86.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

fix CVE-2020-8616 and CVE-2020-8617

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0df831830e4c5f8df2343a45ea75c2ab4f57058)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/bind/CVE-2020-8616.patch             | 206 ++++++++++++++++++
 .../bind/bind/CVE-2020-8617.patch             |  29 +++
 .../recipes-connectivity/bind/bind_9.11.13.bb |   2 +
 3 files changed, 237 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
new file mode 100644
index 0000000000..8f00231919
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
@@ -0,0 +1,206 @@
+Upstream-Status: Backport [https://downloads.isc.org/isc/bind9/9.11.19/patches/CVE-2020-8616.patch]
+CVE: CVE-2020-8616
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+diff --git a/lib/dns/adb.c b/lib/dns/adb.c
+index 058495f6a5..6b8a9537f0 100644
+--- a/lib/dns/adb.c
++++ b/lib/dns/adb.c
+@@ -404,14 +404,13 @@ static void log_quota(dns_adbentry_t *entry, const char *fmt, ...)
+  */
+ #define FIND_WANTEVENT(fn)      (((fn)->options & DNS_ADBFIND_WANTEVENT) != 0)
+ #define FIND_WANTEMPTYEVENT(fn) (((fn)->options & DNS_ADBFIND_EMPTYEVENT) != 0)
+-#define FIND_AVOIDFETCHES(fn)   (((fn)->options & DNS_ADBFIND_AVOIDFETCHES) \
+-				 != 0)
+-#define FIND_STARTATZONE(fn)    (((fn)->options & DNS_ADBFIND_STARTATZONE) \
+-				 != 0)
+-#define FIND_HINTOK(fn)         (((fn)->options & DNS_ADBFIND_HINTOK) != 0)
+-#define FIND_GLUEOK(fn)         (((fn)->options & DNS_ADBFIND_GLUEOK) != 0)
+-#define FIND_HAS_ADDRS(fn)      (!ISC_LIST_EMPTY((fn)->list))
+-#define FIND_RETURNLAME(fn)     (((fn)->options & DNS_ADBFIND_RETURNLAME) != 0)
++#define FIND_AVOIDFETCHES(fn)	(((fn)->options & DNS_ADBFIND_AVOIDFETCHES) != 0)
++#define FIND_STARTATZONE(fn)	(((fn)->options & DNS_ADBFIND_STARTATZONE) != 0)
++#define FIND_HINTOK(fn)		(((fn)->options & DNS_ADBFIND_HINTOK) != 0)
++#define FIND_GLUEOK(fn)		(((fn)->options & DNS_ADBFIND_GLUEOK) != 0)
++#define FIND_HAS_ADDRS(fn)	(!ISC_LIST_EMPTY((fn)->list))
++#define FIND_RETURNLAME(fn)	(((fn)->options & DNS_ADBFIND_RETURNLAME) != 0)
++#define FIND_NOFETCH(fn)	(((fn)->options & DNS_ADBFIND_NOFETCH) != 0)
+ 
+ /*
+  * These are currently used on simple unsigned ints, so they are
+@@ -3155,21 +3154,26 @@ dns_adb_createfind2(dns_adb_t *adb, isc_task_t *task, isc_taskaction_t action,
+ 		 * Listen to negative cache hints, and don't start
+ 		 * another query.
+ 		 */
+-		if (NCACHE_RESULT(result) || AUTH_NX(result))
++		if (NCACHE_RESULT(result) || AUTH_NX(result)) {
+ 			goto fetch;
++		}
+ 
+-		if (!NAME_FETCH_V6(adbname))
++		if (!NAME_FETCH_V6(adbname)) {
+ 			wanted_fetches |= DNS_ADBFIND_INET6;
++		}
+ 	}
+ 
+  fetch:
+ 	if ((WANT_INET(wanted_addresses) && NAME_HAS_V4(adbname)) ||
+ 	    (WANT_INET6(wanted_addresses) && NAME_HAS_V6(adbname)))
++	{
+ 		have_address = true;
+-	else
++	} else {
+ 		have_address = false;
+-	if (wanted_fetches != 0 &&
+-	    ! (FIND_AVOIDFETCHES(find) && have_address)) {
++	}
++	if (wanted_fetches != 0 && !(FIND_AVOIDFETCHES(find) && have_address) &&
++	    !FIND_NOFETCH(find))
++	{
+ 		/*
+ 		 * We're missing at least one address family.  Either the
+ 		 * caller hasn't instructed us to avoid fetches, or we don't
+@@ -3177,8 +3181,9 @@ dns_adb_createfind2(dns_adb_t *adb, isc_task_t *task, isc_taskaction_t action,
+ 		 * be acceptable so we have to launch fetches.
+ 		 */
+ 
+-		if (FIND_STARTATZONE(find))
++		if (FIND_STARTATZONE(find)) {
+ 			start_at_zone = true;
++		}
+ 
+ 		/*
+ 		 * Start V4.
+diff --git a/lib/dns/include/dns/adb.h b/lib/dns/include/dns/adb.h
+index 63a13c4e41..edf6e54935 100644
+--- a/lib/dns/include/dns/adb.h
++++ b/lib/dns/include/dns/adb.h
+@@ -207,6 +207,10 @@ struct dns_adbfind {
+  *      lame for this query.
+  */
+ #define DNS_ADBFIND_OVERQUOTA		0x00000400
++/*%
++ *	Don't perform a fetch even if there are no address records available.
++ */
++#define DNS_ADBFIND_NOFETCH		0x00000800
+ 
+ /*%
+  * The answers to queries come back as a list of these.
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index 7c44478a26..0a40859d08 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -172,6 +172,14 @@
+ #define DEFAULT_MAX_QUERIES 75
+ #endif
+ 
++/*
++ * After NS_FAIL_LIMIT attempts to fetch a name server address,
++ * if the number of addresses in the NS RRset exceeds NS_RR_LIMIT,
++ * stop trying to fetch, in order to avoid wasting resources.
++ */
++#define NS_FAIL_LIMIT 4
++#define NS_RR_LIMIT   5
++
+ /* Number of hash buckets for zone counters */
+ #ifndef RES_DOMAIN_BUCKETS
+ #define RES_DOMAIN_BUCKETS	523
+@@ -3130,8 +3138,7 @@ sort_finds(dns_adbfindlist_t *findlist, unsigned int bias) {
+ static void
+ findname(fetchctx_t *fctx, dns_name_t *name, in_port_t port,
+ 	 unsigned int options, unsigned int flags, isc_stdtime_t now,
+-	 bool *overquota, bool *need_alternate)
+-{
++	 bool *overquota, bool *need_alternate, unsigned int *no_addresses) {
+ 	dns_adbaddrinfo_t *ai;
+ 	dns_adbfind_t *find;
+ 	dns_resolver_t *res;
+@@ -3219,7 +3226,12 @@ findname(fetchctx_t *fctx, dns_name_t *name, in_port_t port,
+ 			      find->result_v6 != DNS_R_NXDOMAIN) ||
+ 			     (res->dispatches6 == NULL &&
+ 			      find->result_v4 != DNS_R_NXDOMAIN)))
++			{
+ 				*need_alternate = true;
++			}
++			if (no_addresses != NULL) {
++				(*no_addresses)++;
++			}
+ 		} else {
+ 			if ((find->options & DNS_ADBFIND_OVERQUOTA) != 0) {
+ 				if (overquota != NULL)
+@@ -3270,6 +3282,7 @@ fctx_getaddresses(fetchctx_t *fctx, bool badcache) {
+ 	dns_rdata_ns_t ns;
+ 	bool need_alternate = false;
+ 	bool all_spilled = true;
++	unsigned int no_addresses = 0;
+ 
+ 	FCTXTRACE5("getaddresses", "fctx->depth=", fctx->depth);
+ 
+@@ -3437,20 +3450,28 @@ fctx_getaddresses(fetchctx_t *fctx, bool badcache) {
+ 		 * Extract the name from the NS record.
+ 		 */
+ 		result = dns_rdata_tostruct(&rdata, &ns, NULL);
+-		if (result != ISC_R_SUCCESS)
++		if (result != ISC_R_SUCCESS) {
+ 			continue;
++		}
+ 
+-		findname(fctx, &ns.name, 0, stdoptions, 0, now,
+-			 &overquota, &need_alternate);
++		if (no_addresses > NS_FAIL_LIMIT &&
++		    dns_rdataset_count(&fctx->nameservers) > NS_RR_LIMIT)
++		{
++			stdoptions |= DNS_ADBFIND_NOFETCH;
++		}
++		findname(fctx, &ns.name, 0, stdoptions, 0, now, &overquota,
++			 &need_alternate, &no_addresses);
+ 
+-		if (!overquota)
++		if (!overquota) {
+ 			all_spilled = false;
++		}
+ 
+ 		dns_rdata_reset(&rdata);
+ 		dns_rdata_freestruct(&ns);
+ 	}
+-	if (result != ISC_R_NOMORE)
++	if (result != ISC_R_NOMORE) {
+ 		return (result);
++	}
+ 
+ 	/*
+ 	 * Do we need to use 6 to 4?
+@@ -3465,7 +3486,7 @@ fctx_getaddresses(fetchctx_t *fctx, bool badcache) {
+ 			if (!a->isaddress) {
+ 				findname(fctx, &a->_u._n.name, a->_u._n.port,
+ 					 stdoptions, FCTX_ADDRINFO_FORWARDER,
+-					 now, NULL, NULL);
++					 now, NULL, NULL, NULL);
+ 				continue;
+ 			}
+ 			if (isc_sockaddr_pf(&a->_u.addr) != family)
+@@ -3827,16 +3827,14 @@ fctx_try(fetchctx_t *fctx, bool retrying, bool badcache) {
+ 		}
+ 	}
+ 
+-	if (dns_name_countlabels(&fctx->domain) > 2) {
+-		result = isc_counter_increment(fctx->qc);
+-		if (result != ISC_R_SUCCESS) {
+-			isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
+-				      DNS_LOGMODULE_RESOLVER, ISC_LOG_DEBUG(3),
+-				      "exceeded max queries resolving '%s'",
+-				      fctx->info);
+-			fctx_done(fctx, DNS_R_SERVFAIL, __LINE__);
+-			return;
+-		}
++	result = isc_counter_increment(fctx->qc);
++	if (result != ISC_R_SUCCESS) {
++		isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
++			      DNS_LOGMODULE_RESOLVER, ISC_LOG_DEBUG(3),
++			      "exceeded max queries resolving '%s'",
++			      fctx->info);
++		fctx_done(fctx, DNS_R_SERVFAIL, __LINE__);
++		return;
+ 	}
+ 
+ 	bucketnum = fctx->bucketnum;
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch
new file mode 100644
index 0000000000..d8769c45cc
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Backport [https://downloads.isc.org/isc/bind9/9.11.19/patches/CVE-2020-8617.patch]
+CVE: CVE-2020-8617
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+diff --git a/lib/dns/tsig.c b/lib/dns/tsig.c
+index b597a18d49..6357a3a486 100644
+--- a/lib/dns/tsig.c
++++ b/lib/dns/tsig.c
+@@ -1427,8 +1424,9 @@ dns_tsig_verify(isc_buffer_t *source, dns_message_t *msg,
+ 			goto cleanup_context;
+ 		}
+ 		msg->verified_sig = 1;
+-	} else if (tsig.error != dns_tsigerror_badsig &&
+-		   tsig.error != dns_tsigerror_badkey) {
++	} else if (!response || (tsig.error != dns_tsigerror_badsig &&
++				 tsig.error != dns_tsigerror_badkey))
++	{
+ 		tsig_log(msg->tsigkey, 2, "signature was empty");
+ 		return (DNS_R_TSIGVERIFYFAILURE);
+ 	}
+@@ -1484,7 +1482,7 @@ dns_tsig_verify(isc_buffer_t *source, dns_message_t *msg,
+ 		}
+ 	}
+ 
+-	if (tsig.error != dns_rcode_noerror) {
++	if (response && tsig.error != dns_rcode_noerror) {
+ 		msg->tsigstatus = tsig.error;
+ 		if (tsig.error == dns_tsigerror_badtime)
+ 			ret = DNS_R_CLOCKSKEW;
diff --git a/meta/recipes-connectivity/bind/bind_9.11.13.bb b/meta/recipes-connectivity/bind/bind_9.11.13.bb
index 4e64171cc1..8f2d702dcb 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.13.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.13.bb
@@ -18,6 +18,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2020-8616.patch \
+           file://CVE-2020-8617.patch \
            "
 
 SRC_URI[md5sum] = "17de0d024ab1eac377f1c2854dc25057"
-- 
2.17.1

