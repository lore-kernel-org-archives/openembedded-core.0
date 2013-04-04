Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNnxA-0000e9-1h
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 19:28:00 +0200
Received: by mail-we0-f172.google.com with SMTP id r3so2260246wey.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 10:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=SNxF+LlC3QxgmTkg9MHI8xmYSYU+cseEPqkaz23ccjw=;
	b=nNejuDx08LQvEYfk8HFXY0FS7K8XKX3kwbW0pL2DAd9ikgMGK5VTvksMtddH+lwrem
	etFJ24JEAAXPH8Q1ep8LKmnxTdiqTWpgWgjHERmFzpshxMc9E3EoztLmOEiKChCYd7z+
	Vq5vAy9wct0q95y5g6Iw/6+ScJPV5tpTU16SJzwGDAceQAS5AgbWOrDklpNrvvq8xi5H
	wfkl1qsDh1guSR8BdB835imQd6XpGi2g/I0uWQIUwhJzM6RyqplXQ35CgVc9Jd+I++om
	27bzYXK3f79TYgahX604SXF5BSwKgGD/hkoY4pY2vS/u5MpStoe37X5/1DQbGClVS3zK
	Ikfw==
X-Received: by 10.194.89.234 with SMTP id br10mr11028149wjb.43.1365095447260; 
	Thu, 04 Apr 2013 10:10:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fv2sm17439788wib.6.2013.04.04.10.10.45
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 10:10:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 18:08:00 +0100
Message-Id: <1365095280-13550-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1365095280-13550-1-git-send-email-ross.burton@intel.com>
References: <1365095280-13550-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQk2RY5kqoKrH6ZnhosnkxG1FfNEOyZG1rMrhdITxuRwaABTvCwrbBQy7zUTAIMcrFWLs3QN
Subject: [PATCH 2/2] libxcb: remove obsolete version 1.1.91
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 17:28:07 -0000

We have 1.9 and git snapshot recipes, we don't also need this ancient version.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xcb/libxcb_1.1.91.bb |    4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta/recipes-graphics/xcb/libxcb_1.1.91.bb

diff --git a/meta/recipes-graphics/xcb/libxcb_1.1.91.bb b/meta/recipes-graphics/xcb/libxcb_1.1.91.bb
deleted file mode 100644
index b74243e..0000000
--- a/meta/recipes-graphics/xcb/libxcb_1.1.91.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include libxcb.inc
-PR = "r2"
-
-PACKAGES =+ "libxcb-xinerama"
-- 
1.7.10.4



