Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.3721.1592166845811367240
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2020 13:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tzbCj8Mu;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id b5so5729891pgm.8
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2020 13:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=k/JCRQcHcb0xJHnqoVgZ8+z+pPIfUQU9Cw8TjERYnO8=;
        b=tzbCj8MuXJSavOoDses+JQObE4jakvZiU7spbOozY2TXpitE2rCVuSHAKpJNLoTq3Y
         /gQJ5NEIEZiwDt2ju4p8kUU39LblZZHwQLpFhpVHTie8pv8LZcWADrLHSf9ItYVWdLsG
         R+hWeqpFbNckbA3Jzsxfqwy47WkGl8RqInSz/PMTKE7UN46OdwRn0ceGf0uNq8P1Xgeg
         Vrowqtu4qDAJGhITJCU2dvZf+PFWQjWyDLTfVidq3x5UrVYI3FTt2dfJE+ANSA12W88/
         y65HurPfXbbN6tWBnLj/KCiWZocqvrH/4RoW0JZIDTeHuH/4Iu9R9xc0ZF09eH0uKRuw
         7EgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=k/JCRQcHcb0xJHnqoVgZ8+z+pPIfUQU9Cw8TjERYnO8=;
        b=Pw70d2+02vfFxQkAyHuLI3OX0seoj9cuEk5HlHL6QpQSJrjIatY+pGUhd2jzNITgQv
         JlJzatKkxgaGCE/OSeK5I1xzX2gw1ZTO31oMLouCJPOy3J22Xy79YTu97bao1lb8G07l
         tvdAJLiZaREXs7EPYxCEn0PRXMNNt1JPFKXve8fSWO7SJiRhMC3A0hLHLB8Irot1pGhc
         jDXJ707R7aT90AcHiWGwGshdJTcAcEN2+I2OmNCop2AnL4l3s0yG1C5r1z/wjBC5g1vn
         FsATa+jM2WyTUC1drbmSadBS03eY5Z7xZ+fm3UqizDV5gdIaWbE617tbiW2RV5bsipzI
         h23w==
X-Gm-Message-State: AOAM533sWjo6KNGi3FgDLwx+RrfpsV3u1smCb5yeTpmHHhOrThxv8FIc
	MPZFvyof19tpgHVWuWdQ+YwEINWa
X-Google-Smtp-Source: ABdhPJyERKwVJNYULVzLhFN9bXv8i7oajv4KNx/Ov4afatQbf9oljNcN4dW0hPNDEJEpilYZ+53sGg==
X-Received: by 2002:a63:b511:: with SMTP id y17mr13692407pge.425.1592166844812;
        Sun, 14 Jun 2020 13:34:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:e920:50fc:4b6a:daf0])
        by smtp.gmail.com with ESMTPSA id 6sm11840277pfi.170.2020.06.14.13.34.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 13:34:04 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [Master][dunfell][PATCH] bind: update to 9.11.19
Date: Sun, 14 Jun 2020 13:34:03 -0700
Message-Id: <20200614203403.19252-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Bug fix only updates.

suitable for Stable branch updates where applicable.

Drop CVE patches included in update
LIC_FILES_CHKSUM update copyright year to 2020

Full changes found at : https://gitlab.isc.org/isc-projects/bind9/-/blob/v9_11/CHANGES

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../bind/bind/CVE-2020-8616.patch             | 206 ------------------
 .../bind/bind/CVE-2020-8617.patch             |  29 ---
 .../bind/{bind_9.11.13.bb => bind_9.11.19.bb} |   7 +-
 3 files changed, 2 insertions(+), 240 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.13.bb => bind_9.11.19.bb} (94%)

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
deleted file mode 100644
index 8f00231919..0000000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
+++ /dev/null
@@ -1,206 +0,0 @@
-Upstream-Status: Backport [https://downloads.isc.org/isc/bind9/9.11.19/patches/CVE-2020-8616.patch]
-CVE: CVE-2020-8616
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
----
-diff --git a/lib/dns/adb.c b/lib/dns/adb.c
-index 058495f6a5..6b8a9537f0 100644
---- a/lib/dns/adb.c
-+++ b/lib/dns/adb.c
-@@ -404,14 +404,13 @@ static void log_quota(dns_adbentry_t *entry, const char *fmt, ...)
-  */
- #define FIND_WANTEVENT(fn)      (((fn)->options & DNS_ADBFIND_WANTEVENT) != 0)
- #define FIND_WANTEMPTYEVENT(fn) (((fn)->options & DNS_ADBFIND_EMPTYEVENT) != 0)
--#define FIND_AVOIDFETCHES(fn)   (((fn)->options & DNS_ADBFIND_AVOIDFETCHES) \
--				 != 0)
--#define FIND_STARTATZONE(fn)    (((fn)->options & DNS_ADBFIND_STARTATZONE) \
--				 != 0)
--#define FIND_HINTOK(fn)         (((fn)->options & DNS_ADBFIND_HINTOK) != 0)
--#define FIND_GLUEOK(fn)         (((fn)->options & DNS_ADBFIND_GLUEOK) != 0)
--#define FIND_HAS_ADDRS(fn)      (!ISC_LIST_EMPTY((fn)->list))
--#define FIND_RETURNLAME(fn)     (((fn)->options & DNS_ADBFIND_RETURNLAME) != 0)
-+#define FIND_AVOIDFETCHES(fn)	(((fn)->options & DNS_ADBFIND_AVOIDFETCHES) != 0)
-+#define FIND_STARTATZONE(fn)	(((fn)->options & DNS_ADBFIND_STARTATZONE) != 0)
-+#define FIND_HINTOK(fn)		(((fn)->options & DNS_ADBFIND_HINTOK) != 0)
-+#define FIND_GLUEOK(fn)		(((fn)->options & DNS_ADBFIND_GLUEOK) != 0)
-+#define FIND_HAS_ADDRS(fn)	(!ISC_LIST_EMPTY((fn)->list))
-+#define FIND_RETURNLAME(fn)	(((fn)->options & DNS_ADBFIND_RETURNLAME) != 0)
-+#define FIND_NOFETCH(fn)	(((fn)->options & DNS_ADBFIND_NOFETCH) != 0)
- 
- /*
-  * These are currently used on simple unsigned ints, so they are
-@@ -3155,21 +3154,26 @@ dns_adb_createfind2(dns_adb_t *adb, isc_task_t *task, isc_taskaction_t action,
- 		 * Listen to negative cache hints, and don't start
- 		 * another query.
- 		 */
--		if (NCACHE_RESULT(result) || AUTH_NX(result))
-+		if (NCACHE_RESULT(result) || AUTH_NX(result)) {
- 			goto fetch;
-+		}
- 
--		if (!NAME_FETCH_V6(adbname))
-+		if (!NAME_FETCH_V6(adbname)) {
- 			wanted_fetches |= DNS_ADBFIND_INET6;
-+		}
- 	}
- 
-  fetch:
- 	if ((WANT_INET(wanted_addresses) && NAME_HAS_V4(adbname)) ||
- 	    (WANT_INET6(wanted_addresses) && NAME_HAS_V6(adbname)))
-+	{
- 		have_address = true;
--	else
-+	} else {
- 		have_address = false;
--	if (wanted_fetches != 0 &&
--	    ! (FIND_AVOIDFETCHES(find) && have_address)) {
-+	}
-+	if (wanted_fetches != 0 && !(FIND_AVOIDFETCHES(find) && have_address) &&
-+	    !FIND_NOFETCH(find))
-+	{
- 		/*
- 		 * We're missing at least one address family.  Either the
- 		 * caller hasn't instructed us to avoid fetches, or we don't
-@@ -3177,8 +3181,9 @@ dns_adb_createfind2(dns_adb_t *adb, isc_task_t *task, isc_taskaction_t action,
- 		 * be acceptable so we have to launch fetches.
- 		 */
- 
--		if (FIND_STARTATZONE(find))
-+		if (FIND_STARTATZONE(find)) {
- 			start_at_zone = true;
-+		}
- 
- 		/*
- 		 * Start V4.
-diff --git a/lib/dns/include/dns/adb.h b/lib/dns/include/dns/adb.h
-index 63a13c4e41..edf6e54935 100644
---- a/lib/dns/include/dns/adb.h
-+++ b/lib/dns/include/dns/adb.h
-@@ -207,6 +207,10 @@ struct dns_adbfind {
-  *      lame for this query.
-  */
- #define DNS_ADBFIND_OVERQUOTA		0x00000400
-+/*%
-+ *	Don't perform a fetch even if there are no address records available.
-+ */
-+#define DNS_ADBFIND_NOFETCH		0x00000800
- 
- /*%
-  * The answers to queries come back as a list of these.
-diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
-index 7c44478a26..0a40859d08 100644
---- a/lib/dns/resolver.c
-+++ b/lib/dns/resolver.c
-@@ -172,6 +172,14 @@
- #define DEFAULT_MAX_QUERIES 75
- #endif
- 
-+/*
-+ * After NS_FAIL_LIMIT attempts to fetch a name server address,
-+ * if the number of addresses in the NS RRset exceeds NS_RR_LIMIT,
-+ * stop trying to fetch, in order to avoid wasting resources.
-+ */
-+#define NS_FAIL_LIMIT 4
-+#define NS_RR_LIMIT   5
-+
- /* Number of hash buckets for zone counters */
- #ifndef RES_DOMAIN_BUCKETS
- #define RES_DOMAIN_BUCKETS	523
-@@ -3130,8 +3138,7 @@ sort_finds(dns_adbfindlist_t *findlist, unsigned int bias) {
- static void
- findname(fetchctx_t *fctx, dns_name_t *name, in_port_t port,
- 	 unsigned int options, unsigned int flags, isc_stdtime_t now,
--	 bool *overquota, bool *need_alternate)
--{
-+	 bool *overquota, bool *need_alternate, unsigned int *no_addresses) {
- 	dns_adbaddrinfo_t *ai;
- 	dns_adbfind_t *find;
- 	dns_resolver_t *res;
-@@ -3219,7 +3226,12 @@ findname(fetchctx_t *fctx, dns_name_t *name, in_port_t port,
- 			      find->result_v6 != DNS_R_NXDOMAIN) ||
- 			     (res->dispatches6 == NULL &&
- 			      find->result_v4 != DNS_R_NXDOMAIN)))
-+			{
- 				*need_alternate = true;
-+			}
-+			if (no_addresses != NULL) {
-+				(*no_addresses)++;
-+			}
- 		} else {
- 			if ((find->options & DNS_ADBFIND_OVERQUOTA) != 0) {
- 				if (overquota != NULL)
-@@ -3270,6 +3282,7 @@ fctx_getaddresses(fetchctx_t *fctx, bool badcache) {
- 	dns_rdata_ns_t ns;
- 	bool need_alternate = false;
- 	bool all_spilled = true;
-+	unsigned int no_addresses = 0;
- 
- 	FCTXTRACE5("getaddresses", "fctx->depth=", fctx->depth);
- 
-@@ -3437,20 +3450,28 @@ fctx_getaddresses(fetchctx_t *fctx, bool badcache) {
- 		 * Extract the name from the NS record.
- 		 */
- 		result = dns_rdata_tostruct(&rdata, &ns, NULL);
--		if (result != ISC_R_SUCCESS)
-+		if (result != ISC_R_SUCCESS) {
- 			continue;
-+		}
- 
--		findname(fctx, &ns.name, 0, stdoptions, 0, now,
--			 &overquota, &need_alternate);
-+		if (no_addresses > NS_FAIL_LIMIT &&
-+		    dns_rdataset_count(&fctx->nameservers) > NS_RR_LIMIT)
-+		{
-+			stdoptions |= DNS_ADBFIND_NOFETCH;
-+		}
-+		findname(fctx, &ns.name, 0, stdoptions, 0, now, &overquota,
-+			 &need_alternate, &no_addresses);
- 
--		if (!overquota)
-+		if (!overquota) {
- 			all_spilled = false;
-+		}
- 
- 		dns_rdata_reset(&rdata);
- 		dns_rdata_freestruct(&ns);
- 	}
--	if (result != ISC_R_NOMORE)
-+	if (result != ISC_R_NOMORE) {
- 		return (result);
-+	}
- 
- 	/*
- 	 * Do we need to use 6 to 4?
-@@ -3465,7 +3486,7 @@ fctx_getaddresses(fetchctx_t *fctx, bool badcache) {
- 			if (!a->isaddress) {
- 				findname(fctx, &a->_u._n.name, a->_u._n.port,
- 					 stdoptions, FCTX_ADDRINFO_FORWARDER,
--					 now, NULL, NULL);
-+					 now, NULL, NULL, NULL);
- 				continue;
- 			}
- 			if (isc_sockaddr_pf(&a->_u.addr) != family)
-@@ -3827,16 +3827,14 @@ fctx_try(fetchctx_t *fctx, bool retrying, bool badcache) {
- 		}
- 	}
- 
--	if (dns_name_countlabels(&fctx->domain) > 2) {
--		result = isc_counter_increment(fctx->qc);
--		if (result != ISC_R_SUCCESS) {
--			isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
--				      DNS_LOGMODULE_RESOLVER, ISC_LOG_DEBUG(3),
--				      "exceeded max queries resolving '%s'",
--				      fctx->info);
--			fctx_done(fctx, DNS_R_SERVFAIL, __LINE__);
--			return;
--		}
-+	result = isc_counter_increment(fctx->qc);
-+	if (result != ISC_R_SUCCESS) {
-+		isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
-+			      DNS_LOGMODULE_RESOLVER, ISC_LOG_DEBUG(3),
-+			      "exceeded max queries resolving '%s'",
-+			      fctx->info);
-+		fctx_done(fctx, DNS_R_SERVFAIL, __LINE__);
-+		return;
- 	}
- 
- 	bucketnum = fctx->bucketnum;
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch
deleted file mode 100644
index d8769c45cc..0000000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Backport [https://downloads.isc.org/isc/bind9/9.11.19/patches/CVE-2020-8617.patch]
-CVE: CVE-2020-8617
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
----
-diff --git a/lib/dns/tsig.c b/lib/dns/tsig.c
-index b597a18d49..6357a3a486 100644
---- a/lib/dns/tsig.c
-+++ b/lib/dns/tsig.c
-@@ -1427,8 +1424,9 @@ dns_tsig_verify(isc_buffer_t *source, dns_message_t *msg,
- 			goto cleanup_context;
- 		}
- 		msg->verified_sig = 1;
--	} else if (tsig.error != dns_tsigerror_badsig &&
--		   tsig.error != dns_tsigerror_badkey) {
-+	} else if (!response || (tsig.error != dns_tsigerror_badsig &&
-+				 tsig.error != dns_tsigerror_badkey))
-+	{
- 		tsig_log(msg->tsigkey, 2, "signature was empty");
- 		return (DNS_R_TSIGVERIFYFAILURE);
- 	}
-@@ -1484,7 +1482,7 @@ dns_tsig_verify(isc_buffer_t *source, dns_message_t *msg,
- 		}
- 	}
- 
--	if (tsig.error != dns_rcode_noerror) {
-+	if (response && tsig.error != dns_rcode_noerror) {
- 		msg->tsigstatus = tsig.error;
- 		if (tsig.error == dns_tsigerror_badtime)
- 			ret = DNS_R_CLOCKSKEW;
diff --git a/meta/recipes-connectivity/bind/bind_9.11.13.bb b/meta/recipes-connectivity/bind/bind_9.11.19.bb
similarity index 94%
rename from meta/recipes-connectivity/bind/bind_9.11.13.bb
rename to meta/recipes-connectivity/bind/bind_9.11.19.bb
index 8f2d702dcb..276173e09f 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.13.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.19.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8f17f64e47e83b60cd920a1e4b54419e"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bf39058a7f64b2a934ce14dc9ec1dd45"
 
 DEPENDS = "openssl libcap zlib"
 
@@ -18,12 +18,9 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
-           file://CVE-2020-8616.patch \
-           file://CVE-2020-8617.patch \
            "
 
-SRC_URI[md5sum] = "17de0d024ab1eac377f1c2854dc25057"
-SRC_URI[sha256sum] = "fd3f3cc9fcfcdaa752db35eb24598afa1fdcc2509d3227fc90a8631b7b400f7d"
+SRC_URI[sha256sum] = "0dee554a4caa368948b32da9a0c97b516c19103bc13ff5b3762c5d8552f52329"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-- 
2.17.1

