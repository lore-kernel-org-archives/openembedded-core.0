Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: fntGnodYpoAgpOPpar30CGiR0j/m0KbLKljpzMYwxSd41Cv38FDC5vBba2lvltqwivkwOvEE4R
 q3wfPMnVcfWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211583"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211583"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:48 -0700
IronPort-SDR: Lje1hqA90p6jVcnHfz5u+Wrowi2LZlyh3d3PyEVlL9Sjjx9iRTCuWYPh4XeUaZaY5UKuzbcHlY
 51D6jsYvnATA==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295154"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:47 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/25] shadow: whitelist CVE-2013-4235
Date: Mon, 22 Mar 2021 09:41:09 +0800
Message-Id: <1474dcb84c925603736bafbe9fc802a99a014a39.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>

This CVE is about TOCTOU (time-of-check time-of-use)
race condition when copying and removing directory trees
which had very low severity problem and marked as closed
and won't fix. Therefore whitelisted CVE-2013-4235.
Master, gatesgarth and dunfell all have shadow version 4.81.
Hence, this is applicable for master, gatesgarth and dunfell.
Link: https://bugzilla.redhat.com/show_bug.cgi?id=884658

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1c6cd87bee6b019619dc5728fd6c36bc87ed696)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/shadow/shadow_4.8.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.8.1.bb b/meta/recipes-extended/shadow/shadow_4.8.1.bb
index c975395ff8..ff4aad926f 100644
--- a/meta/recipes-extended/shadow/shadow_4.8.1.bb
+++ b/meta/recipes-extended/shadow/shadow_4.8.1.bb
@@ -6,5 +6,6 @@ BUILD_LDFLAGS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'p
 
 BBCLASSEXTEND = "native nativesdk"
 
-
-
+# Severity is low and marked as closed and won't fix.
+# https://bugzilla.redhat.com/show_bug.cgi?id=884658
+CVE_CHECK_WHITELIST += "CVE-2013-4235"
-- 
2.30.2

