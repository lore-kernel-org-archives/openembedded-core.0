Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id A7DE378094
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:43:39 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id k67so32064814wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qtnDyvUbhEPF7pGsafevOxzcxVPBk1pK5CXVPu5pEjI=;
	b=D/cMrvQzUkjq8NdHJ/IMsyETK8aEnD5RRvYK8yicjHABPz4folaeYi8FYMit+hE8op
	B7w1sYUdytojmVrWfnMqnfgq0JVtKctZ1yisJvAmPg2M20jvm8rQKLkEK5PTpCbjiMi6
	5BQ+J5+avV9exMv0/HLHM7Afxem8HALk7HifrHuHDGUzW6nLX//LfKLTdphYVjIcIojT
	kDqQC5OoGRfI1u3+9ueWp6HszSN8vGnqwYuEpdOOq2RcJ8TYDWO9dp6HXX+DuGe+GUnz
	WsenRxkncrDgzxiAOt9lRhwpX85I9jo+wxg1+sy0itloKGn25AcXvquj+EZVbLfjqWcr
	a03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qtnDyvUbhEPF7pGsafevOxzcxVPBk1pK5CXVPu5pEjI=;
	b=Ty0yn3DySvU/m2nyMAqT4XOolbKciUOAfD1OCv+sXP188VXTW9uEs1sSGsukfFDevu
	MgT3WsZJgfVbpM0hU0f3zEMPdWbaFVUw5wCMp8bT1xwJafy3aE9ApK4pfEfgw9qvuy4K
	I4sbo0TD7TJSrkvAWoaCIUR+AQwE/Zv0vEWdFwDNhWksG/KKRF4HcgT143tmhovOOQ2d
	hH7KYdnuGWfFQnVSbNLBoiQWTu4M3ECcUhraP9UmgchqEiK8T3ZgzLjhk/z61fNJHyQG
	PVqzBTVxjbHm5u5Ae0+WkhRpJuO+MzaO0Iglhiyt59XVEww/HqNUKgM4JGNtQoMYMhIV
	0szQ==
X-Gm-Message-State: AIVw1130qyy1FKiDcvLd6FfrlD6c2g1qmYc1hSiwRnWq/I2wZrdQdYG8
	Ktp5KVbfFtNN/Qs8kfY=
X-Received: by 10.28.87.205 with SMTP id l196mr2604845wmb.121.1499863420666;
	Wed, 12 Jul 2017 05:43:40 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r70sm2800052wmb.16.2017.07.12.05.43.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 05:43:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 13:43:28 +0100
Message-Id: <20170712124331.12444-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170712124331.12444-1-ross.burton@intel.com>
References: <20170712124331.12444-1-ross.burton@intel.com>
Subject: [PATCH 2/5] bitbake.conf: add CCACHE_NOHASHDIR to hash whitelist
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
X-List-Received-Date: Wed, 12 Jul 2017 12:43:42 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 042a03cbf90..9a3aa8bbf29 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -842,7 +842,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
-    CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE LICENSE_PATH SDKPKGSUFFIX \
+    CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \
     WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
     BB_WORKERCONTEXT BB_LIMITEDDEPS extend_recipe_sysroot DEPLOY_DIR"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
-- 
2.11.0


