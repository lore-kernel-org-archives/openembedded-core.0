Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UalER-00087O-Hg
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 13:11:24 +0200
Received: by mail-ee0-f48.google.com with SMTP id c4so1613140eek.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 03:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=/PmDIrz8p3bu7X89bqXzC7e4tMdidA2DNYzZbKC19rg=;
	b=jIpOouCK65MoiINoU3Lv3K+/1g4aPbmvGZMonJfS+ZoO1ETSaC7w/c7w/lAROu4nub
	UakmVZ7wbTdU1tT34BiIdQchPp1K40HPnEVyEc5HMl9ywTTPJoy76YUlvDCt5oKeuwpq
	JRLw+pfIHeC2kzbzsSJ73sMHGlIfGcJZUQDHTG/nuN3lFGlmHYiV+XiEGKMmPCApjYdh
	F5pj7CwjLPkVFbbNDzjCVMV5y7PndQ5xqCwZSLfaXj7mxZOVwfKcrswZsAePiipJWXrq
	drEd3RvoB8Ku/873MqhxI5gcYTUQX+5vnf4lrg3HNt94R9HGPqg7ryj2463hHvmTD0Xs
	qhHw==
X-Received: by 10.14.194.70 with SMTP id l46mr39937068een.28.1368183198337;
	Fri, 10 May 2013 03:53:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t9sm2788163eeo.11.2013.05.10.03.53.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 May 2013 03:53:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 12:53:11 +0200
Message-Id: <1368183192-26634-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1368183192-26634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1368183192-26634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] tcp-wrappers: fix indentation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 11:11:27 -0000

---
 .../tcp-wrappers/tcp-wrappers_7.6.bb               | 40 +++++++++++-----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 3586a35..c7954e7 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Security tool that is a wrapper for TCP daemons"
 DESCRIPTION = "Tools for monitoring and filtering incoming requests for tcp \
-	      services."
+               services."
 SECTION = "console/network"
 
 LICENSE = "BSD"
@@ -51,25 +51,25 @@ S = "${WORKDIR}/tcp_wrappers_${PV}"
 
 PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "'CC=${CC}' \
-		'AR=${AR}' \
-		'RANLIB=${RANLIB}' \
-		'REAL_DAEMON_DIR=${sbindir}' \
-		'STYLE=-DPROCESS_OPTIONS' \
-		'FACILITY=LOG_DAEMON' \
-		'SEVERITY=LOG_INFO' \
-		'BUGS=' \
-		'VSYSLOG=' \
-		'RFC931_TIMEOUT=10' \
-		'ACCESS=-DHOSTS_ACCESS' \
-		'KILL_OPT=-DKILL_IP_OPTIONS' \
-		'UMASK=-DDAEMON_UMASK=022' \
-		'NETGROUP=${EXTRA_OEMAKE_NETGROUP}' \
-		'LIBS=-lnsl' \
-		'ARFLAGS=rv' \
-		'AUX_OBJ=weak_symbols.o' \
-		'TLI=' \
-		'COPTS=' \
-		'EXTRA_CFLAGS=${CFLAGS} -DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT -DINET6=1 -Dss_family=__ss_family -Dss_len=__ss_len'"
+                'AR=${AR}' \
+                'RANLIB=${RANLIB}' \
+                'REAL_DAEMON_DIR=${sbindir}' \
+                'STYLE=-DPROCESS_OPTIONS' \
+                'FACILITY=LOG_DAEMON' \
+                'SEVERITY=LOG_INFO' \
+                'BUGS=' \
+                'VSYSLOG=' \
+                'RFC931_TIMEOUT=10' \
+                'ACCESS=-DHOSTS_ACCESS' \
+                'KILL_OPT=-DKILL_IP_OPTIONS' \
+                'UMASK=-DDAEMON_UMASK=022' \
+                'NETGROUP=${EXTRA_OEMAKE_NETGROUP}' \
+                'LIBS=-lnsl' \
+                'ARFLAGS=rv' \
+                'AUX_OBJ=weak_symbols.o' \
+                'TLI=' \
+                'COPTS=' \
+                'EXTRA_CFLAGS=${CFLAGS} -DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT -DINET6=1 -Dss_family=__ss_family -Dss_len=__ss_len'"
 
 EXTRA_OEMAKE_NETGROUP = "-DNETGROUP -DUSE_GETDOMAIN"
 EXTRA_OEMAKE_NETGROUP_libc-uclibc = "-DUSE_GETDOMAIN"
-- 
1.8.2.1



