Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2F68D78817
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 12:01:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2018 04:01:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,429,1511856000"; d="scan'208";a="13895519"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 29 Jan 2018 04:01:43 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 14:01:34 +0200
Message-Id: <f648759f6752afb72c4e759445497142c8e7872e.1517227178.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1517227178.git.alexander.kanavin@linux.intel.com>
References: <cover.1517227178.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 7/7] rootfs.py: change the notice about deferring scripts to first boot from warning to a note
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
X-List-Received-Date: Mon, 29 Jan 2018 12:01:42 -0000

Now that the first boot deferral needs to be requested explicitly,
it's not really something to be concerned about.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 8bf77aea492..bf2aea2b25a 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -303,7 +303,7 @@ class Rootfs(object, metaclass=ABCMeta):
                     break
 
             if registered_pkgs is not None:
-                bb.warn("The postinstalls for the following packages "
+                bb.note("The postinstalls for the following packages "
                         "will be postponed for first boot: %s" %
                         registered_pkgs)
 
-- 
2.15.1


