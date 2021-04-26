Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.921.1619398436071444216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: JJyE3PfihQKncbv6GLRyJ0/8zuH4K1Hl3QvgfRRM7OzwqVDTuqDUVu3bWcPHijMVzf0m0zrFkd
 4rlvycRAAK2w==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="196323417"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="196323417"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:53:58 -0700
IronPort-SDR: dxRUn3wynCdt4yNtz9Z6KQhQWNqzxCESoHTHHYxI91phpF8m4euFAGnmWwAWccUfZsu9ua4u7x
 QfyAgGHEvYJg==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067218"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:53:57 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/64] pseudo: Upgrade to add trailing slashes ignore path fix
Date: Mon, 26 Apr 2021 08:52:33 +0800
Message-Id: <141cd6342ff9ab8f684d81c3b7ba4cb3356bc33b.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in:
  client: strip trailing slashes when opening an ignored path

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9fb92bc13b8a78ef98798f14e728058feb180ba6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 17bd02c27c..4eab133128 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "60e25a36558f1f07dcce1a044fe976b475bec42b"
+SRCREV = "ee24ebec9e5a11dd5208c9be2870f35eab3b9e20"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.30.2

