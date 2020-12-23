Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.10343.1608736768391429647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 2wal1tH21Sx2q7ngslV8naSwId3Lqsk+JVeqfba9Hrohf1Zm78gDAKLM9g/ya9cCG6dD5+J8oW
 CywUfPwfykJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236147"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236147"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:38 -0800
IronPort-SDR: 6BF7oyYqlp0cy0AZ3MqXO8qT9SxL59kE7YzVu7ZXFJDvscLeg/o2I4b0HtjtCA7olk82yxLYSs
 A5G3ZqRursow==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027736"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:37 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 32/35] minicom: RDEPENDS on ncurses-terminfo-base
Date: Wed, 23 Dec 2020 23:18:42 +0800
Message-Id: <d3b19eaedfb62ef82866a3a322ab860fca136533.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert Yang <liezhi.yang@windriver.com>

Fixed when ncurses-terminfo-base is not installed:
$ minicom
No termcap database present!

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15198ebe8a0fc58c2d1122b956fca092c66a0d41)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/minicom/minicom_2.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
index 03034864c8..6d61684e69 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
@@ -29,3 +29,5 @@ do_install() {
 }
 
 RRECOMMENDS_${PN} += "lrzsz"
+
+RDEPENDS_${PN} += "ncurses-terminfo-base"
-- 
2.29.2

