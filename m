Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC9673199
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 09:30:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u369U3si025364
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Apr 2016 02:30:03 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Apr 2016 02:30:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Apr 2016 02:30:01 -0700
Message-ID: <1ce3bc28f087aaa0ee655f76bd3169218be43346.1459934955.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1459934955.git.liezhi.yang@windriver.com>
References: <cover.1459934955.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] sanity.bbclass: fix a hardcode in check_path_length()
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
X-List-Received-Date: Wed, 06 Apr 2016 09:30:03 -0000
Content-Type: text/plain

* Fixed:
  410 -> limit

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 662f764..ac23517 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -334,7 +334,7 @@ def check_create_long_filename(filepath, pathname):
 
 def check_path_length(filepath, pathname, limit):
     if len(filepath) > limit:
-        return "The length of %s is longer than 410, this would cause unexpected errors, please use a shorter path.\n" % pathname
+        return "The length of %s is longer than %s, this would cause unexpected errors, please use a shorter path.\n" % (pathname, limit)
     return ""
 
 def get_filesystem_id(path):
-- 
2.8.0


