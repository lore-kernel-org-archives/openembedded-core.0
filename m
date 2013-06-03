Return-Path: <Ning.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D852560889
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 05:21:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r535LPA8025208
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 2 Jun 2013 22:21:25 -0700 (PDT)
Received: from pek-nzhang0-d3.wrs.com (128.224.162.247) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 2 Jun 2013 22:21:24 -0700
From: Ning Zhang <ning.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Jun 2013 13:21:18 +0800
Message-ID: <fc2f4a65e654e548bfba36505ed37285270667f5.1370228342.git.ning.zhang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1370228342.git.ning.zhang@windriver.com>
References: <cover.1370228342.git.ning.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] yocto_kernel: modify the msg when adding duplicate items
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
X-List-Received-Date: Mon, 03 Jun 2013 05:21:24 -0000
Content-Type: text/plain

Privious check-in "yocto_kernel: check current items before add a
new one" had been merged before I apply the feedback from Zanussi, Tom.
Now fix it as a new patch.

This fix modify the output message when customer adding duplicate
items.

[YOCTO #4558]

Signed-off-by: Ning Zhang <ning.zhang@windriver.com>
---
 scripts/lib/bsp/kernel.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/bsp/kernel.py b/scripts/lib/bsp/kernel.py
index 9ed6e94..94ae950 100644
--- a/scripts/lib/bsp/kernel.py
+++ b/scripts/lib/bsp/kernel.py
@@ -260,7 +260,7 @@ def yocto_kernel_config_add(scripts_path, machine, config_items):
             print "\t%s" % n
 
     if len(dup_items) > 0:
-        output="Below item%s already exist%s in current configuration, ignore %s" % \
+        output="The following item%s already exist%s in the current configuration, ignoring %s:" % \
             (("","s", "it") if len(dup_items)==1 else ("s", "", "them" ))
         print output
         for n in dup_items:
-- 
1.7.9.5


