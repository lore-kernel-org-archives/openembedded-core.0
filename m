Return-Path: <roxana.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 213C170F0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:49:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 22 Aug 2014 01:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,378,1406617200"; d="scan'208";a="580310850"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.58])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2014 01:49:22 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 11:49:38 +0300
Message-Id: <0b4a84f71a4329a74699d000685c6dae2c0cee11.1408696291.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
Subject: [PATCH 2/9] error-report: add 'Submitted on' detail
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
X-List-Received-Date: Fri, 22 Aug 2014 08:49:38 -0000

Show the submission date and time for an error in the
the error details page.

[YOCTO #6538]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 templates/error-details.html | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/templates/error-details.html b/templates/error-details.html
index 0de5f46..f2dc010 100644
--- a/templates/error-details.html
+++ b/templates/error-details.html
@@ -21,6 +21,8 @@
 					<div class="well">
 						<h2>Error details</h2>
 						<dl class="dl-vertical">
+							<dt>Submitted on:</dt>
+							<dd>{{ detail.BUILD.DATE|date:"d/m/y H:i"}}</dd>
 							<dt>Task:</dt>
 							<dd>{{ detail.TASK }}</dd>
 							<dt>Recipe:</dt>
-- 
1.9.1


