Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: GcuaJfGcQvptwXoPRnXcLE/EZk4uTFG+pUCMwfOZtgI+C9EXNaByGZ62r5tt7VSi/XK4i1+HyL
 PBrMAK8653RQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158719978"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158719978"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:24 -0800
IronPort-SDR: RNZ+9whmRgKR6/qz3w0QJpWFyNvyf4rJyZAHbgVe/N7uSogOiTgmHEAqkVeYBG5j1pdFbx0CqW
 yfWUwf6BHuQw==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802962"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:23 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/19] conf-notes.txt: mention more important images than just sato
Date: Tue, 17 Nov 2020 23:35:56 +0800
Message-Id: <b622ea5c6d2965feb68b760e96e9073c50441a02.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f89138e12c3021ed49aa7ccdf90543d2aaaad279)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/conf-notes.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/conf-notes.txt b/meta/conf/conf-notes.txt
index 5af13a8357..1a9414a040 100644
--- a/meta/conf/conf-notes.txt
+++ b/meta/conf/conf-notes.txt
@@ -5,7 +5,9 @@ You can now run 'bitbake <target>'
 
 Common targets are:
     core-image-minimal
+    core-image-full-cmdline
     core-image-sato
+    core-image-weston
     meta-toolchain
     meta-ide-support
 
-- 
2.28.0

