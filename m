Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EBCF7779DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 21:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490650423; x=1522186423;
	h=from:to:cc:subject:date:message-id;
	bh=IstY/JXBfGrq6rVaaDGSEv1U4iVwkMNArKvF1+170IQ=;
	b=JkmhJsBfpb7aScuMDn39BGw6JO1CuropRE8vZ6zM9/YdUd0zKu38tmeC
	vR9BHbmd1Yha5vQGBaFLNdjacmXAwg==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2017 14:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,233,1486454400"; d="scan'208";a="1112711668"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 27 Mar 2017 14:33:43 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 14:33:37 -0700
Message-Id: <1490650417-16932-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [morty][PATCH] parselogs: Whitelist NUC6 firmware load error message on genericx86-64
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
X-List-Received-Date: Mon, 27 Mar 2017 21:33:42 -0000

This was already whitelisted, but the 4.8 kernel changed the error
message, causing it to get caught by parselogs again.

Fixes [YOCTO #10494].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit e1bad14231115f3b1a2bf844ef5b2022c648b55d)
Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
This is a backport from master. This error occurs on 2.2.1 - see latest
comments on bug 10494. If I need to add additional info to this commit
message, please let me know and I'll send a V2.

 meta/lib/oeqa/runtime/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index e79c39a..aa5008b 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -142,6 +142,7 @@ ignore_errors = {
         'Failed to load firmware i915',
         'Failed to fetch GuC',
         'Failed to initialize GuC',
+        'Failed to load DMC firmware',
         'The driver is built-in, so to load the firmware you need to',
         ] + x86_common,
     'edgerouter' : [
-- 
2.5.5


