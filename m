Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 8790A71BF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 22:59:59 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 2C84C220600;
	Thu, 20 Dec 2018 11:59:58 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 11:59:44 +1300
Message-Id: <20181219225948.30700-2-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219225948.30700-1-douglas.royds@taitradio.com>
References: <20181219225948.30700-1-douglas.royds@taitradio.com>
Subject: [PATCH 1/5] icecc: readlink -f on the recipe-sysroot gcc/g++
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
X-List-Received-Date: Wed, 19 Dec 2018 23:00:00 -0000

We were accidentally doing a readlink -f on simply 'gcc', for instance

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 2b189232cb..b251e9b5aa 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -303,7 +303,7 @@ def icecc_get_and_check_tool(bb, d, tool):
     # compiler environment package.
     t = icecc_get_tool(bb, d, tool)
     if t:
-        link_path = icecc_get_tool_link(tool, d)
+        link_path = icecc_get_tool_link(t, d)
         if link_path == get_icecc(d):
             bb.error("%s is a symlink to %s in PATH and this prevents icecc from working" % (t, get_icecc(d)))
             return ""
-- 
2.17.1


