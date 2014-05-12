Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (unknown [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2225B65ED6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 12:20:52 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id n12so6831118wgh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 05:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jcJ2iQGUePYO4iTjSUm71ZZVCDP/S4cMUd07Yg7xtbU=;
	b=O+ELwc9foKQuz2moJ2l0R9mSTCZFdrQaP1Skf3sZXP9Haxnlzuyfd+RRMZRE79ornv
	LdBzWu7T7PtQW/5foKR16dsBSVy90sbN28pZrY8pCSc9yqR9lHSQT2FmlUM8crzgDliB
	9Kv//btwcxpr8ek5xB8EKtQXhDNRv5Sp4/aBTcss0cVsd9/NmBCPwTbvWdpX24MdCUS+
	JLpPEbtjmb7JVnt/+RVBHEo/f2sbjKbP1Rp4DslWJz9t/BnAWbP1bRYoxbFWRxSVJaov
	ZfEPgk5HufhkcqxCNhUKUm3TOEhg+DxPNJ5qEIn/U4yDXAUF0nnd/lubR9XNNtQUFgmg
	xjnA==
X-Gm-Message-State: ALoCoQnnna4LPwOjhj6N04psKo7QRs9efyE0vhivVaOtISe1VW6t093F0xQE73MqtfHxcZZVzkNY
X-Received: by 10.194.187.107 with SMTP id fr11mr1315205wjc.70.1399896906561; 
	Mon, 12 May 2014 05:15:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ct2sm17699110wjb.33.2014.05.12.05.15.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 05:15:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:14:51 +0100
Message-Id: <1399896893-486-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399896893-486-1-git-send-email-ross.burton@intel.com>
References: <1399896893-486-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/7] python-numpy: add Signed-off-by to patches
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
X-List-Received-Date: Mon, 12 May 2014 12:20:54 -0000

These patches were authored by Koen Kooi in oe-classic commits:

 443f6022df06d9f9dc221011c1744274deff2c2c
 19a4b765a694c070bc50477026cda03143af34df

As the patches haven't changed since, add his SOB.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-numpy/trycompile.diff          |    3 +++
 meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff |    3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python-numpy/trycompile.diff b/meta/recipes-devtools/python/python-numpy/trycompile.diff
index 3ab3d72..6824227 100644
--- a/meta/recipes-devtools/python/python-numpy/trycompile.diff
+++ b/meta/recipes-devtools/python/python-numpy/trycompile.diff
@@ -1,3 +1,6 @@
+Upstream-Status: Pending
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
 --- /tmp/setup.py	2008-09-01 10:37:44.000000000 +0200
 +++ numpy-1.1.1/numpy/core/setup.py	2008-09-01 10:38:20.373198000 +0200
 @@ -80,8 +80,7 @@
diff --git a/meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff b/meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
index c5b4481..20ec6fd 100644
--- a/meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
+++ b/meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
@@ -1,3 +1,6 @@
+Upstream-Status: Inappropriate
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
 --- /tmp/system_info.py	2008-08-22 00:38:16.000000000 +0200
 +++ numpy-1.1.1/numpy/distutils/system_info.py	2008-08-22 00:40:33.013198000 +0200
 @@ -137,11 +137,8 @@
-- 
1.7.10.4


