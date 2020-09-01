Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.15522.1598973768634373199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 08:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LnazRDq+;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id o16so787995pjr.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 08:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MD34gki+68fJfLkveBlHeDeJV4VtdpvTwL/x21GmUTo=;
        b=LnazRDq+Mxs0V4POKb+EQPZ7t87qydC01/WrX0+/tUS/J2jST2a+45kL6ooa5bmSZ9
         0udhoep3d1kXr+uJToDSby6axsutlkoX6+HRxz1fJAsbego6gznh+e/r33MFOVJ2OpGg
         haxajcmMf9EOXFeEUI34k/9u+vH1gvLwgIm1PskeR/okcGbvNDLBACas2qv1J45qRBTc
         ok0XPFnbkQSNfxDsRfPVpcBLl0J0Moy6ZHouEFEjBKRrVJ2OGPquxXmADZHwdCIeZblp
         Wv69P6XoF9LC5Xjibz4NtmGe0Uoq5ItgjMYBGO0jUtzUaz5Zsn08BeD9TUtbnZ1qNmHE
         kVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MD34gki+68fJfLkveBlHeDeJV4VtdpvTwL/x21GmUTo=;
        b=dQV0dRsXEoJAAxvGTDES9eGvDcnjoX4aH/eusHdqp34ifI5mZQxRi9176pyoN/7GcN
         jOgVuazAwoc6zgLVZtja0w4no0shqG2hFmiDZZClL+33HDaA0AO2PVgeebzKNG3ntKcY
         XhrumMdBPYbn4sdd/L9A+Dyp542hgPFB6A5A3FFRshps0yQkwrWZEEtlYZS5lWzhDFS0
         n80tQIQxdPnSZiZQ7n3AtuIlzBmz6B1NVAK0v6LgLQoRlr/gQSs5txfJpy+4X17LOPkL
         7jjNDf9SLOHulip2GZJFLhjIt3KK6xvl21iiXaE+Xef22wF6GY5gC5wa/mXJ41SSmxQL
         04vw==
X-Gm-Message-State: AOAM53182wYRA7jTlSqKOsJWwB6l+swRy3MSkOg0ghJCP6VR3G30ClWf
	gk0uIjWkvX6MXY02je+2l1vxOipD62w=
X-Google-Smtp-Source: ABdhPJyiz+x8jaa6JMgREVy00SBMzs0M+UDZSs667HxP07tsytWw2ZVPkw+VY/5PTU+e3TCDGoQKbg==
X-Received: by 2002:a17:902:7044:: with SMTP id h4mr1831297plt.78.1598973767042;
        Tue, 01 Sep 2020 08:22:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9dcf:ebf9:1f19:e8a8])
        by smtp.gmail.com with ESMTPSA id u5sm2217917pfm.149.2020.09.01.08.22.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 08:22:46 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] bind: 9.11 remove
Date: Tue,  1 Sep 2020 08:22:36 -0700
Message-Id: <20200901152236.9377-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901152236.9377-1-akuster808@gmail.com>
References: <20200901152236.9377-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1-avoid-start-failure-with-bind-user.patch |  27 --
 ....in-remove-useless-L-use_openssl-lib.patch |  30 --
 ...d-V-and-start-log-hide-build-options.patch |  34 --
 ...ching-for-json-headers-searches-sysr.patch |  47 ---
 meta/recipes-connectivity/bind/bind/bind9     |   2 -
 .../recipes-connectivity/bind/bind/conf.patch | 330 ------------------
 .../bind/bind/generate-rndc-key.sh            |   8 -
 ...t.d-add-support-for-read-only-rootfs.patch |  65 ----
 .../bind/make-etc-initd-bind-stop-work.patch  |  42 ---
 .../bind/bind/named.service                   |  22 --
 .../recipes-connectivity/bind/bind_9.11.22.bb | 140 --------
 11 files changed, 747 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/bind9
 delete mode 100644 meta/recipes-connectivity/bind/bind/conf.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
 delete mode 100644 meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/named.service
 delete mode 100644 meta/recipes-connectivity/bind/bind_9.11.22.bb

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
deleted file mode 100644
index 8db96ec049c..00000000000
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 15 Oct 2018 16:55:09 +0800
-Subject: [PATCH] avoid start failure with bind user
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- init.d | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/init.d b/init.d
-index b2eec60..6e03936 100644
---- a/init.d
-+++ b/init.d
-@@ -57,6 +57,7 @@ case "$1" in
- 	modprobe capability >/dev/null 2>&1 || true
- 	if [ ! -f /etc/bind/rndc.key ]; then
- 	    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
-+	    chown root:bind /etc/bind/rndc.key >/dev/null 2>&1 || true
- 	    chmod 0640 /etc/bind/rndc.key
- 	fi
- 	if [ -f /var/run/named/named.pid ]; then
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch b/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
deleted file mode 100644
index 9d31b980807..00000000000
--- a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2325a92f1896a2a7f586611686801b41fbc91b50 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 27 Aug 2018 15:00:51 +0800
-Subject: [PATCH] configure.in: remove useless `-L$use_openssl/lib'
-
-Since `--with-openssl=${STAGING_DIR_HOST}${prefix}' is used in bind recipe,
-the `-L$use_openssl/lib' has a hardcoded suffix, removing it is harmless
-and helpful for clean up host build path in isc-config.sh
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e85a5c6..2bbfc58 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1631,7 +1631,7 @@ If you don't want OpenSSL, use --without-openssl])
- 				fi
- 				;;
- 			*)
--				DST_OPENSSL_LIBS="-L$use_openssl/lib -lcrypto"
-+				DST_OPENSSL_LIBS="-lcrypto"
- 				;;
- 			esac
- 		fi
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
deleted file mode 100644
index 75908aa638f..00000000000
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a3af4a405baf5ff582e82aaba392dd9667d94bdc Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 27 Aug 2018 21:24:20 +0800
-Subject: [PATCH] `named/lwresd -V' and start log hide build options
-
-The build options expose build path directories, so hide them.
-[snip]
-$ named -V
-|built by make with *** (options are hidden)
-[snip]
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- bin/named/include/named/globals.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bin/named/include/named/globals.h b/bin/named/include/named/globals.h
-index ba3457e..7741da7 100644
---- a/bin/named/include/named/globals.h
-+++ b/bin/named/include/named/globals.h
-@@ -68,7 +68,7 @@ EXTERN const char *		ns_g_version		INIT(VERSION);
- EXTERN const char *		ns_g_product		INIT(PRODUCT);
- EXTERN const char *		ns_g_description	INIT(DESCRIPTION);
- EXTERN const char *		ns_g_srcid		INIT(SRCID);
--EXTERN const char *		ns_g_configargs		INIT(CONFIGARGS);
-+EXTERN const char *		ns_g_configargs		INIT("*** (options are hidden)");
- EXTERN const char *		ns_g_builder		INIT(BUILDER);
- EXTERN in_port_t		ns_g_port		INIT(0);
- EXTERN isc_dscp_t		ns_g_dscp		INIT(-1);
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
deleted file mode 100644
index 84559e5f378..00000000000
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From edda20fb5a6e88548f85e39d34d6c074306e15bc Mon Sep 17 00:00:00 2001
-From: Paul Gortmaker <paul.gortmaker@windriver.com>
-Date: Tue, 9 Jun 2015 11:22:00 -0400
-Subject: [PATCH] bind: ensure searching for json headers searches sysroot
-
-Bind can fail configure by detecting headers w/o libs[1], or
-it can fail the host contamination check as per below:
-
-ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
-Rerun configure task after fixing this. The path was 'build/tmp/work/core2-64-poky-linux/bind/9.10.2-r1/build'
-ERROR: Function failed: do_qa_configure
-ERROR: Logfile of failure stored in: build/tmp/work/core2-64-poky-linux/bind/9.10.2-r1/temp/log.do_configure.5242
-ERROR: Task 5 (meta/recipes-connectivity/bind/bind_9.10.2.bb, do_configure) failed with exit code '1'
-NOTE: Tasks Summary: Attempted 773 tasks of which 768 didn't need to be rerun and 1 failed.
-No currently running tasks (773 of 781)
-
-Summary: 1 task failed:
-  /meta/recipes-connectivity/bind/bind_9.10.2.bb, do_configure
-
-One way to fix it would be to unconditionally disable json in bind
-configure[2] but here we fix it by using the path to where we would
-put the header if we had json in the sysroot, in case someone wants
-to make use of the combination some day.
-
-[1] https://trac.macports.org/ticket/45305
-[2] https://trac.macports.org/changeset/126406
-
-Upstream-Status: Inappropriate [OE Specific]
-Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 17392fd..e85a5c6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2449,7 +2449,7 @@ case "$use_libjson" in
- 		libjson_libs=""
- 		;;
- 	auto|yes)
--		for d in /usr /usr/local /opt/local
-+		for d in "${STAGING_INCDIR}"
- 		do
- 			if test -f "${d}/include/json/json.h"
- 			then
diff --git a/meta/recipes-connectivity/bind/bind/bind9 b/meta/recipes-connectivity/bind/bind/bind9
deleted file mode 100644
index 968679ff7f7..00000000000
--- a/meta/recipes-connectivity/bind/bind/bind9
+++ /dev/null
@@ -1,2 +0,0 @@
-# startup options for the server
-OPTIONS="-u bind"
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
deleted file mode 100644
index aad345f9fcf..00000000000
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ /dev/null
@@ -1,330 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-the patch is imported from openembedded project
-
-11/30/2010 - Qing He <qing.he@intel.com>
-
-diff -urN bind-9.3.1.orig/conf/db.0 bind-9.3.1/conf/db.0
---- bind-9.3.1.orig/conf/db.0	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.0	2005-07-10 22:14:00.000000000 +0200
-@@ -0,0 +1,12 @@
-+;
-+; BIND reverse data file for broadcast zone
-+;
-+$TTL	604800
-+@	IN	SOA	localhost. root.localhost. (
-+			      1		; Serial
-+			 604800		; Refresh
-+			  86400		; Retry
-+			2419200		; Expire
-+			 604800 )	; Negative Cache TTL
-+;
-+@	IN	NS	localhost.
-diff -urN bind-9.3.1.orig/conf/db.127 bind-9.3.1/conf/db.127
---- bind-9.3.1.orig/conf/db.127	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.127	2005-07-10 22:14:00.000000000 +0200
-@@ -0,0 +1,13 @@
-+;
-+; BIND reverse data file for local loopback interface
-+;
-+$TTL	604800
-+@	IN	SOA	localhost. root.localhost. (
-+			      1		; Serial
-+			 604800		; Refresh
-+			  86400		; Retry
-+			2419200		; Expire
-+			 604800 )	; Negative Cache TTL
-+;
-+@	IN	NS	localhost.
-+1.0.0	IN	PTR	localhost.
-diff -urN bind-9.3.1.orig/conf/db.empty bind-9.3.1/conf/db.empty
---- bind-9.3.1.orig/conf/db.empty	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.empty	2005-07-10 22:14:00.000000000 +0200
-@@ -0,0 +1,14 @@
-+; BIND reverse data file for empty rfc1918 zone
-+;
-+; DO NOT EDIT THIS FILE - it is used for multiple zones.
-+; Instead, copy it, edit named.conf, and use that copy.
-+;
-+$TTL	86400
-+@	IN	SOA	localhost. root.localhost. (
-+			      1		; Serial
-+			 604800		; Refresh
-+			  86400		; Retry
-+			2419200		; Expire
-+			  86400 )	; Negative Cache TTL
-+;
-+@	IN	NS	localhost.
-diff -urN bind-9.3.1.orig/conf/db.255 bind-9.3.1/conf/db.255
---- bind-9.3.1.orig/conf/db.255	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.255	2005-07-10 22:14:00.000000000 +0200
-@@ -0,0 +1,12 @@
-+;
-+; BIND reserve data file for broadcast zone
-+;
-+$TTL	604800
-+@	IN	SOA	localhost. root.localhost. (
-+			      1		; Serial
-+			 604800		; Refresh
-+			  86400		; Retry
-+			2419200		; Expire
-+			 604800 )	; Negative Cache TTL
-+;
-+@	IN	NS	localhost.
-diff -urN bind-9.3.1.orig/conf/db.local bind-9.3.1/conf/db.local
---- bind-9.3.1.orig/conf/db.local	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.local	2005-07-10 22:14:00.000000000 +0200
-@@ -0,0 +1,13 @@
-+;
-+; BIND data file for local loopback interface
-+;
-+$TTL	604800
-+@	IN	SOA	localhost. root.localhost. (
-+			      1		; Serial
-+			 604800		; Refresh
-+			  86400		; Retry
-+			2419200		; Expire
-+			 604800 )	; Negative Cache TTL
-+;
-+@	IN	NS	localhost.
-+@	IN	A	127.0.0.1
-diff -urN bind-9.3.1.orig/conf/db.root bind-9.3.1/conf/db.root
---- bind-9.3.1.orig/conf/db.root	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.root	2005-07-10 22:14:00.000000000 +0200
-@@ -0,0 +1,45 @@
-+
-+; <<>> DiG 9.2.3 <<>> ns . @a.root-servers.net.
-+;; global options:  printcmd
-+;; Got answer:
-+;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18944
-+;; flags: qr aa rd; QUERY: 1, ANSWER: 13, AUTHORITY: 0, ADDITIONAL: 13
-+
-+;; QUESTION SECTION:
-+;.				IN	NS
-+
-+;; ANSWER SECTION:
-+.			518400	IN	NS	A.ROOT-SERVERS.NET.
-+.			518400	IN	NS	B.ROOT-SERVERS.NET.
-+.			518400	IN	NS	C.ROOT-SERVERS.NET.
-+.			518400	IN	NS	D.ROOT-SERVERS.NET.
-+.			518400	IN	NS	E.ROOT-SERVERS.NET.
-+.			518400	IN	NS	F.ROOT-SERVERS.NET.
-+.			518400	IN	NS	G.ROOT-SERVERS.NET.
-+.			518400	IN	NS	H.ROOT-SERVERS.NET.
-+.			518400	IN	NS	I.ROOT-SERVERS.NET.
-+.			518400	IN	NS	J.ROOT-SERVERS.NET.
-+.			518400	IN	NS	K.ROOT-SERVERS.NET.
-+.			518400	IN	NS	L.ROOT-SERVERS.NET.
-+.			518400	IN	NS	M.ROOT-SERVERS.NET.
-+
-+;; ADDITIONAL SECTION:
-+A.ROOT-SERVERS.NET.	3600000	IN	A	198.41.0.4
-+B.ROOT-SERVERS.NET.	3600000	IN	A	192.228.79.201
-+C.ROOT-SERVERS.NET.	3600000	IN	A	192.33.4.12
-+D.ROOT-SERVERS.NET.	3600000	IN	A	128.8.10.90
-+E.ROOT-SERVERS.NET.	3600000	IN	A	192.203.230.10
-+F.ROOT-SERVERS.NET.	3600000	IN	A	192.5.5.241
-+G.ROOT-SERVERS.NET.	3600000	IN	A	192.112.36.4
-+H.ROOT-SERVERS.NET.	3600000	IN	A	128.63.2.53
-+I.ROOT-SERVERS.NET.	3600000	IN	A	192.36.148.17
-+J.ROOT-SERVERS.NET.	3600000	IN	A	192.58.128.30
-+K.ROOT-SERVERS.NET.	3600000	IN	A	193.0.14.129
-+L.ROOT-SERVERS.NET.	3600000	IN	A	198.32.64.12
-+M.ROOT-SERVERS.NET.	3600000	IN	A	202.12.27.33
-+
-+;; Query time: 81 msec
-+;; SERVER: 198.41.0.4#53(a.root-servers.net.)
-+;; WHEN: Sun Feb  1 11:27:14 2004
-+;; MSG SIZE  rcvd: 436
-+
-diff -urN bind-9.3.1.orig/conf/named.conf bind-9.3.1/conf/named.conf
---- bind-9.3.1.orig/conf/named.conf	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/named.conf	2005-07-10 22:33:46.000000000 +0200
-@@ -0,0 +1,49 @@
-+// This is the primary configuration file for the BIND DNS server named.
-+//
-+// If you are just adding zones, please do that in /etc/bind/named.conf.local
-+
-+include "/etc/bind/named.conf.options";
-+
-+// prime the server with knowledge of the root servers
-+zone "." {
-+	type hint;
-+	file "/etc/bind/db.root";
-+};
-+
-+// be authoritative for the localhost forward and reverse zones, and for
-+// broadcast zones as per RFC 1912
-+
-+zone "localhost" {
-+	type master;
-+	file "/etc/bind/db.local";
-+};
-+
-+zone "127.in-addr.arpa" {
-+	type master;
-+	file "/etc/bind/db.127";
-+};
-+
-+zone "0.in-addr.arpa" {
-+	type master;
-+	file "/etc/bind/db.0";
-+};
-+
-+zone "255.in-addr.arpa" {
-+	type master;
-+	file "/etc/bind/db.255";
-+};
-+
-+// zone "com" { type delegation-only; };
-+// zone "net" { type delegation-only; };
-+
-+// From the release notes:
-+//  Because many of our users are uncomfortable receiving undelegated answers
-+//  from root or top level domains, other than a few for whom that behaviour
-+//  has been trusted and expected for quite some length of time, we have now
-+//  introduced the "root-delegations-only" feature which applies delegation-only
-+//  logic to all top level domains, and to the root domain.  An exception list
-+//  should be specified, including "MUSEUM" and "DE", and any other top level
-+//  domains from whom undelegated responses are expected and trusted.
-+// root-delegation-only exclude { "DE"; "MUSEUM"; };
-+
-+include "/etc/bind/named.conf.local";
-diff -urN bind-9.3.1.orig/conf/named.conf.local bind-9.3.1/conf/named.conf.local
---- bind-9.3.1.orig/conf/named.conf.local	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/named.conf.local	2005-07-10 22:14:06.000000000 +0200
-@@ -0,0 +1,8 @@
-+//
-+// Do any local configuration here
-+//
-+
-+// Consider adding the 1918 zones here, if they are not used in your
-+// organization
-+//include "/etc/bind/zones.rfc1918";
-+
-diff -urN bind-9.3.1.orig/conf/named.conf.options bind-9.3.1/conf/named.conf.options
---- bind-9.3.1.orig/conf/named.conf.options	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/named.conf.options	2005-07-10 22:14:06.000000000 +0200
-@@ -0,0 +1,24 @@
-+options {
-+	directory "/var/cache/bind";
-+
-+	// If there is a firewall between you and nameservers you want
-+	// to talk to, you might need to uncomment the query-source
-+	// directive below.  Previous versions of BIND always asked
-+	// questions using port 53, but BIND 8.1 and later use an unprivileged
-+	// port by default.
-+
-+	// query-source address * port 53;
-+
-+	// If your ISP provided one or more IP addresses for stable 
-+	// nameservers, you probably want to use them as forwarders.  
-+	// Uncomment the following block, and insert the addresses replacing 
-+	// the all-0's placeholder.
-+
-+	// forwarders {
-+	// 	0.0.0.0;
-+	// };
-+
-+	auth-nxdomain no;    # conform to RFC1035
-+
-+};
-+
-diff -urN bind-9.3.1.orig/conf/zones.rfc1918 bind-9.3.1/conf/zones.rfc1918
---- bind-9.3.1.orig/conf/zones.rfc1918	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/zones.rfc1918	2005-07-10 22:14:10.000000000 +0200
-@@ -0,0 +1,20 @@
-+zone "10.in-addr.arpa"      { type master; file "/etc/bind/db.empty"; };
-+ 
-+zone "16.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "17.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "18.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "19.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "20.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "21.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "22.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "23.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "24.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "25.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "26.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "27.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "28.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "29.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "30.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+zone "31.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
-+
-+zone "168.192.in-addr.arpa" { type master; file "/etc/bind/db.empty"; };
-diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
---- bind-9.3.1.orig/init.d	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/init.d	2005-07-10 23:09:58.000000000 +0200
-@@ -0,0 +1,70 @@
-+#!/bin/sh
-+
-+PATH=/sbin:/bin:/usr/sbin:/usr/bin
-+
-+# for a chrooted server: "-u bind -t /var/lib/named"
-+# Don't modify this line, change or create /etc/default/bind9.
-+OPTIONS=""
-+
-+test -f /etc/default/bind9 && . /etc/default/bind9
-+
-+test -x /usr/sbin/rndc || exit 0
-+
-+case "$1" in
-+    start)
-+	echo -n "Starting domain name service: named"
-+
-+	modprobe capability >/dev/null 2>&1 || true
-+	if [ ! -f /etc/bind/rndc.key ]; then
-+	    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
-+	    chmod 0640 /etc/bind/rndc.key
-+	fi
-+	if [ -f /var/run/named/named.pid ]; then
-+	    ps `cat /var/run/named/named.pid` > /dev/null && exit 1
-+	fi
-+
-+	# dirs under /var/run can go away on reboots.
-+	mkdir -p /var/run/named
-+	mkdir -p /var/cache/bind
-+	chmod 775 /var/run/named
-+	chown root:bind /var/run/named >/dev/null 2>&1 || true
-+
-+	if [ ! -x /usr/sbin/named ]; then
-+	    echo "named binary missing - not starting"
-+	    exit 1
-+	fi
-+	if start-stop-daemon --start --quiet --exec /usr/sbin/named \
-+		--pidfile /var/run/named/named.pid -- $OPTIONS; then
-+	    if [ -x /sbin/resolvconf ] ; then
-+		echo "nameserver 127.0.0.1" | /sbin/resolvconf -a lo
-+	    fi
-+	fi
-+	echo "."	
-+    ;;
-+
-+    stop)
-+	echo -n "Stopping domain name service: named"
-+	if [ -x /sbin/resolvconf ]; then
-+	    /sbin/resolvconf -d lo
-+	fi
-+	/usr/sbin/rndc stop >/dev/null 2>&1
-+	echo "."	
-+    ;;
-+
-+    reload)
-+	/usr/sbin/rndc reload
-+    ;;
-+
-+    restart|force-reload)
-+	$0 stop
-+	sleep 2
-+	$0 start
-+    ;;
-+    
-+    *)
-+	echo "Usage: /etc/init.d/bind {start|stop|reload|restart|force-reload}" >&2
-+	exit 1
-+    ;;
-+esac
-+
-+exit 0
diff --git a/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
deleted file mode 100644
index ef915c0ae5a..00000000000
--- a/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-if [ ! -s /etc/bind/rndc.key ]; then
-    echo -n "Generating /etc/bind/rndc.key:"
-    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
-    chown root:bind /etc/bind/rndc.key
-    chmod 0640 /etc/bind/rndc.key
-fi
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
deleted file mode 100644
index 11db95ede12..00000000000
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Subject: init.d: add support for read-only rootfs
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- init.d |   40 ++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 40 insertions(+)
-
-diff --git a/init.d b/init.d
-index 0111ed4..24677c8 100644
---- a/init.d
-+++ b/init.d
-@@ -6,8 +6,48 @@ PATH=/sbin:/bin:/usr/sbin:/usr/bin
- # Don't modify this line, change or create /etc/default/bind9.
- OPTIONS=""
- 
-+test -f /etc/default/rcS && . /etc/default/rcS
- test -f /etc/default/bind9 && . /etc/default/bind9
- 
-+# This function is here because it's possible that /var and / are on different partitions.
-+is_on_read_only_partition () {
-+    DIRECTORY=$1
-+    dir=`readlink -f $DIRECTORY`
-+    while true; do
-+	if [ ! -d "$dir" ]; then
-+	    echo "ERROR: $dir is not a directory"
-+	    exit 1
-+	else
-+	    for flag in `awk -v dir=$dir '{ if ($2 == dir) { print "FOUND"; split($4,FLAGS,",") } }; \
-+		END { for (f in FLAGS) print FLAGS[f] }' < /proc/mounts`; do
-+		[ "$flag" = "FOUND" ] && partition="read-write"
-+		[ "$flag" = "ro" ] && { partition="read-only"; break; }
-+	    done
-+	    if [ "$dir" = "/" -o -n "$partition" ]; then
-+		break
-+	    else
-+		dir=`dirname $dir`
-+	    fi
-+	fi
-+    done
-+    [ "$partition" = "read-only" ] && echo "yes" || echo "no"
-+}
-+
-+bind_mount () {
-+    olddir=$1
-+    newdir=$2
-+    mkdir -p $olddir
-+    cp -a $newdir/* $olddir
-+    mount --bind $olddir $newdir
-+}
-+
-+# Deal with read-only rootfs
-+if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
-+    [ "$VERBOSE" != "no" ] && echo "WARN: start bind service in read-only rootfs"
-+    [ `is_on_read_only_partition /etc/bind` = "yes" ] && bind_mount /var/volatile/bind/etc /etc/bind
-+    [ `is_on_read_only_partition /var/named` = "yes" ] && bind_mount /var/volatile/bind/named /var/named
-+fi
-+
- test -x /usr/sbin/rndc || exit 0
- 
- case "$1" in
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
deleted file mode 100644
index 146f3e35db6..00000000000
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-bind: make "/etc/init.d/bind stop" work
-
-Upstream-Status: Inappropriate [configuration]
-
-Add some configurations, make rndc command be able to controls
-the named daemon.
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- conf/named.conf |    5 +++++
- conf/rndc.conf  |    5 +++++
- 2 files changed, 10 insertions(+), 0 deletions(-)
- create mode 100644 conf/rndc.conf
-
-diff --git a/conf/named.conf b/conf/named.conf
-index 95829cf..c8899e7 100644
---- a/conf/named.conf
-+++ b/conf/named.conf
-@@ -47,3 +47,8 @@ zone "255.in-addr.arpa" {
- // root-delegation-only exclude { "DE"; "MUSEUM"; };
- 
- include "/etc/bind/named.conf.local";
-+include "/etc/bind/rndc.key" ;
-+controls {
-+	inet 127.0.0.1 allow { localhost; }
-+	keys { rndc-key; };
-+};
-diff --git a/conf/rndc.conf b/conf/rndc.conf
-new file mode 100644
-index 0000000..a0b481d
---- /dev/null
-+++ b/conf/rndc.conf
-@@ -0,0 +1,5 @@
-+include "/etc/bind/rndc.key";
-+options {
-+	default-server  localhost;
-+	default-key     rndc-key;
-+};
-
--- 
-1.7.5.4
-
diff --git a/meta/recipes-connectivity/bind/bind/named.service b/meta/recipes-connectivity/bind/bind/named.service
deleted file mode 100644
index cda56ef0150..00000000000
--- a/meta/recipes-connectivity/bind/bind/named.service
+++ /dev/null
@@ -1,22 +0,0 @@
-[Unit]
-Description=Berkeley Internet Name Domain (DNS)
-Wants=nss-lookup.target
-Before=nss-lookup.target
-After=network.target
-
-[Service]
-Type=forking
-EnvironmentFile=-/etc/default/bind9
-PIDFile=/run/named/named.pid
-
-ExecStartPre=@SBINDIR@/generate-rndc-key.sh
-ExecStart=@SBINDIR@/named $OPTIONS
-
-ExecReload=@BASE_BINDIR@/sh -c '@SBINDIR@/rndc reload > /dev/null 2>&1 || @BASE_BINDIR@/kill -HUP $MAINPID'
-
-ExecStop=@BASE_BINDIR@/sh -c '@SBINDIR@/rndc stop > /dev/null 2>&1 || @BASE_BINDIR@/kill -TERM $MAINPID'
-
-PrivateTmp=true
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/bind/bind_9.11.22.bb b/meta/recipes-connectivity/bind/bind_9.11.22.bb
deleted file mode 100644
index 7128bd3870c..00000000000
--- a/meta/recipes-connectivity/bind/bind_9.11.22.bb
+++ /dev/null
@@ -1,140 +0,0 @@
-SUMMARY = "ISC Internet Domain Name Server"
-HOMEPAGE = "http://www.isc.org/sw/bind/"
-SECTION = "console/network"
-
-LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bf39058a7f64b2a934ce14dc9ec1dd45"
-
-DEPENDS = "openssl libcap zlib"
-
-SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
-           file://conf.patch \
-           file://named.service \
-           file://bind9 \
-           file://generate-rndc-key.sh \
-           file://make-etc-initd-bind-stop-work.patch \
-           file://init.d-add-support-for-read-only-rootfs.patch \
-           file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
-           file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
-           file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
-           file://0001-avoid-start-failure-with-bind-user.patch \
-           "
-
-SRC_URI[sha256sum] = "afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9"
-
-UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
-# stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-UPSTREAM_CHECK_REGEX = "(?P<pver>9.(11|16|20|24|28)(\.\d+)+(-P\d+)*)/"
-
-# BIND >= 9.11.2 need dhcpd >= 4.4.0,
-# don't report it here since dhcpd is already recent enough.
-CVE_CHECK_WHITELIST += "CVE-2019-6470"
-
-inherit autotools update-rc.d systemd useradd pkgconfig multilib_script multilib_header
-
-MULTILIB_SCRIPTS = "${PN}:${bindir}/bind9-config ${PN}:${bindir}/isc-config.sh"
-
-# PACKAGECONFIGs readline and libedit should NOT be set at same time
-PACKAGECONFIG ?= "readline"
-PACKAGECONFIG[httpstats] = "--with-libxml2=${STAGING_DIR_HOST}${prefix},--without-libxml2,libxml2"
-PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
-PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
-PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
-PACKAGECONFIG[python3] = "--with-python=yes --with-python-install-dir=${PYTHON_SITEPACKAGES_DIR} , --without-python, python3-ply-native,"
-
-ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
-EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
-                 --disable-devpoll --enable-epoll --with-gost=no \
-                 --with-gssapi=no --with-ecdsa=yes --with-eddsa=no \
-                 --with-lmdb=no \
-                 --sysconfdir=${sysconfdir}/bind \
-                 --with-openssl=${STAGING_DIR_HOST}${prefix} \
-               "
-
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native distutils3-base', '', d)}
-
-# dhcp needs .la so keep them
-REMOVE_LIBTOOL_LA = "0"
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
-                       --user-group bind"
-
-INITSCRIPT_NAME = "bind"
-INITSCRIPT_PARAMS = "defaults"
-
-SYSTEMD_SERVICE_${PN} = "named.service"
-
-do_install_prepend() {
-	# clean host path in isc-config.sh before the hardlink created
-	# by "make install":
-	#   bind9-config -> isc-config.sh
-	sed -i -e "s,${STAGING_LIBDIR},${libdir}," ${B}/isc-config.sh
-}
-
-do_install_append() {
-
-	rmdir "${D}${localstatedir}/run"
-	rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
-	install -d -o bind "${D}${localstatedir}/cache/bind"
-	install -d "${D}${sysconfdir}/bind"
-	install -d "${D}${sysconfdir}/init.d"
-	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
-	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
-        if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', 'false', d)}; then
-		sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
-		${D}${sbindir}/dnssec-coverage \
-		${D}${sbindir}/dnssec-checkds \
-		${D}${sbindir}/dnssec-keymgr
-	fi
-
-	# Install systemd related files
-	install -d ${D}${sbindir}
-	install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/named.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-	       -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/named.service
-
-	install -d ${D}${sysconfdir}/default
-	install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
-
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-		install -d ${D}${sysconfdir}/tmpfiles.d
-		echo "d /run/named 0755 bind bind - -" > ${D}${sysconfdir}/tmpfiles.d/bind.conf
-	fi
-
-    oe_multilib_header isc/platform.h
-}
-
-CONFFILES_${PN} = " \
-	${sysconfdir}/bind/named.conf \
-	${sysconfdir}/bind/named.conf.local \
-	${sysconfdir}/bind/named.conf.options \
-	${sysconfdir}/bind/db.0 \
-	${sysconfdir}/bind/db.127 \
-	${sysconfdir}/bind/db.empty \
-	${sysconfdir}/bind/db.local \
-	${sysconfdir}/bind/db.root \
-	"
-
-ALTERNATIVE_${PN}-utils = "nslookup"
-ALTERNATIVE_LINK_NAME[nslookup] = "${bindir}/nslookup"
-ALTERNATIVE_PRIORITY = "100"
-
-PACKAGE_BEFORE_PN += "${PN}-utils"
-FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/mdig ${bindir}/nslookup ${bindir}/nsupdate"
-FILES_${PN}-dev += "${bindir}/isc-config.h"
-FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
-
-PACKAGE_BEFORE_PN += "${PN}-libs"
-FILES_${PN}-libs = "${libdir}/*.so*"
-FILES_${PN}-staticdev += "${libdir}/*.la"
-
-PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-bind', '', d)}"
-FILES_python3-bind = "${sbindir}/dnssec-coverage ${sbindir}/dnssec-checkds \
-                ${sbindir}/dnssec-keymgr ${PYTHON_SITEPACKAGES_DIR}"
-
-RDEPENDS_${PN}-dev = ""
-RDEPENDS_python3-bind = "python3-core python3-ply"
-- 
2.17.1

