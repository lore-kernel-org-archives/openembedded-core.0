Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A3C697222C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 23:48:19 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so15461133wgh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 15:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=akBpRCWIZ9cO8VooxkAYE7J90BvAxSPKOl3RAtkutl4=;
	b=lgmkv13gexRRKuhi9qYw70SbxDRLiCZKiHNF0wuCNB20Vesuzya/aeXDHuockE66fK
	cDHvnI205EbdlpWWeVYHzLa9NuhHbjUOWaV0KJvLnI9wU1OLSyjvbPyl2y7Ukw9p0uec
	RUldx0lL4dfA0CBoZ6BJQfpqiy+xqYSPDUc2XUUPFWg79difsgVCF5uM9zLzEGImrB1B
	NpHQnaNueuo/bjNXeQk92TxUuqGcSbUr6yKcS1A53RIlpdgcuILk1pEXQNXZnWZLuTZz
	Hq23K4+BqnaUeM3cOS4q9WEj6jtfSRjD1SrBosuEcNt9opJ7ZuBRCRrBpZv91LKWpJll
	pBWw==
X-Gm-Message-State: ALoCoQmcdj1c8vlrWNWrU1dlw01xQZ/ZeiQyWz4mKYHECJCrRKs6gu0Wy/weRKmGLIxQ7dPyMSTz
X-Received: by 10.194.87.34 with SMTP id u2mr98251259wjz.42.1417477700364;
	Mon, 01 Dec 2014 15:48:20 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	he3sm29570430wjc.15.2014.12.01.15.48.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 15:48:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Dec 2014 23:47:47 +0000
Message-Id: <d818f59b6da77c778d8af9f91ce1ad97dc847c2d.1417477584.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1417477584.git.ross.burton@intel.com>
References: <cover.1417477584.git.ross.burton@intel.com>
In-Reply-To: <cover.1417477584.git.ross.burton@intel.com>
References: <cover.1417477584.git.ross.burton@intel.com>
Subject: [PATCH 4/4] bitbake.conf: remove internal flags from BB_SIGNATURE_EXCLUDE_FLAGS
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
X-List-Received-Date: Mon, 01 Dec 2014 23:48:24 -0000

As the code that uses BB_SIGNATURE_EXCLUDE_FLAGS uses d.getVarFlags() so doesn't
get to see the internal flags, remove _append and _prepend.  Also defaultval is
now _defaultval and thus internal, so remove that too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0ccaac0..7902bd7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -775,7 +775,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED"
-BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc defaultval _append _prepend deps depends \
+BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     lockfiles type vardepsexclude vardeps vardepvalue vardepvalueexclude \
     file-checksums python func task export unexport noexec nostamp dirs cleandirs \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
-- 
1.7.10.4


