Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 76D4F74925
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 02:22:14 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id y128so701034iod.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 19:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nxxRSMrSYCIM3TPUlPQ7+JgJvPqr4jQpVP0IjhY0f+8=;
	b=ti4sptL41Z2DnBm1zw9Jrd8TejjC3l0+hZsJto/608CdCnhu0T/Y4dS+jqO4FK6apM
	NEZU7HnobW8Mk6Dgzb/z2ZmY2MG9kG8bB8LO20fPoPICnt6ksd4xaZNKfiIki4lml7Wz
	WFeG/UpLe3uWshM6DJgI5SZIV9i++XP1xnup4wFvEhkd0nq8Oyl4EQXbSmtNu5iT24Uh
	a+Hk1Y9+xuNcC3SOdiXWkKPWoKL3HxrwW4r2IfePVEOiLzZXEkWu5ZtVwHIGieE1sw5W
	Jv0hc/pVPyS+0lOBUmZFwgeuAn6UsAKiVJQpmpil4LRsVoE4BwKrF7cwgghd2eg/ftFz
	eR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nxxRSMrSYCIM3TPUlPQ7+JgJvPqr4jQpVP0IjhY0f+8=;
	b=tsHq3gA7M8eVNrY3YgHQcrddPm/FUXjXyy4fNAnY+YyDGfaQqDCvIzLqa3VtI8SD5k
	HaVn+cRJHcIP5sznZ4wLMMu2zme2ZctK4ybuu2ZMWg5bL/hKimsDm4kejWegrMqPo1ka
	u84Q2f+5DTCtAOB3VdspAoRR4PrMDEgQhpD6GVr2iu3CmihNu4ysm0L3zlU6TWPYjBRZ
	b0M23mMJEVx4fi8bKPsqRwH11KLdMiCdzHPgHxKCqPyCkVZrskJtO9MiGW3zusa7UYBo
	cqx/CHJGHALbgRb26SRQ9wcP6Z8FZ4/0QUXEPlWks+Zp4e9hk13AtuAAil7cDhn5oMy7
	1BJQ==
X-Gm-Message-State: ALQs6tCdHJKKf1JLsL8wJ0QSxvz+rJ0u2/ooEwBQw+D4mY5dsoYc4dzy
	TN/avQLcKnUcbaf6yIz57XRYl6iB
X-Google-Smtp-Source: AIpwx48yDd2ol8xbzU2Y5sl8mCDpBWZrSmmWRkkOjESZ/OwfcqDoPLcWhWLc15t99f+P9B4nLotGkg==
X-Received: by 10.107.28.15 with SMTP id c15mr2969744ioc.247.1523413335252;
	Tue, 10 Apr 2018 19:22:15 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id w71sm34498iow.87.2018.04.10.19.22.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Apr 2018 19:22:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 21:21:58 -0500
Message-Id: <20180411022200.22277-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180411022200.22277-1-JPEWhacker@gmail.com>
References: <20180411022200.22277-1-JPEWhacker@gmail.com>
Subject: [sumo][PATCH 5/7] icecc.bbclass: Add ICECC_ENV_DEBUG variable
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
X-List-Received-Date: Wed, 11 Apr 2018 02:22:14 -0000

The ICECC_ENV_DEBUG variable can be set in local.conf to pass additional
debugging options to the Icecream toolchain creation script.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index cab64f52703..aea1095f5fb 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -33,6 +33,7 @@ BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_
     ICECC_CARET_WORKAROUND ICECC_CFLAGS ICECC_ENV_VERSION \
     ICECC_DEBUG ICECC_LOGFILE ICECC_REPEAT_RATE ICECC_PREFERRED_HOST \
     ICECC_CLANG_REMOTE_CPP ICECC_IGNORE_UNVERIFIED ICECC_TEST_SOCKET \
+    ICECC_ENV_DEBUG \
     "
 
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
@@ -57,6 +58,9 @@ ICECC_CFLAGS = ""
 CFLAGS += "${ICECC_CFLAGS}"
 CXXFLAGS += "${ICECC_CFLAGS}"
 
+# Debug flags when generating environments
+ICECC_ENV_DEBUG ??= ""
+
 def icecc_dep_prepend(d):
     # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
     # we need that built is the responsibility of the patch function / class, not
@@ -363,7 +367,7 @@ set_icecc_env() {
         # the ICECC_VERSION generation step must be locked by a mutex
         # in order to prevent race conditions
         if flock -n "${ICECC_VERSION}.lock" \
-            ${ICECC_ENV_EXEC} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
+            ${ICECC_ENV_EXEC} ${ICECC_ENV_DEBUG} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
         then
             touch "${ICECC_VERSION}.done"
         elif [ ! wait_for_file "${ICECC_VERSION}.done" 30 ]
-- 
2.14.3


