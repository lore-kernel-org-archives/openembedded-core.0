Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4007F19A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 04:03:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2019 21:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="189233230"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2019 21:03:35 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 12:03:00 +0800
Message-Id: <1564027386-8107-5-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564027386-8107-1-git-send-email-anuj.mittal@intel.com>
References: <1564027386-8107-1-git-send-email-anuj.mittal@intel.com>
Subject: [warrior][PATCH 05/11] glibc: CVE-2018-20796 is same as CVE-2019-9169
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
X-List-Received-Date: Thu, 25 Jul 2019 04:03:34 -0000

See:
https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34141
https://www.securityfocus.com/bid/107160

(From OE-Core rev: 7e90506534ed2a70680382cf28614f02fdb98409)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
index bc40361..cf3744b 100644
--- a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
@@ -1,4 +1,5 @@
 CVE: CVE-2019-9169
+CVE: CVE-2018-20796
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-- 
2.7.4


