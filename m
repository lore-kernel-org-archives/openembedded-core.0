Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id C78FD6DA6D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 17:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id D2B2D25B0A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0JRVKMCs8TQz
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:12 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id EA70725B0E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D0508A5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id C5843BF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id C26B33E06F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id rAFH9823014844
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id rAFH98q3014843
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Nov 2013 18:09:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 18:08:56 +0100
Message-Id: <86ff7ddcfd5b25285ea32d040f9ddac05dacdff5.1384535211.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
Subject: [PATCH 07/14] pybootchartgui: No need to do a double list comprehension over files
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
X-List-Received-Date: Fri, 15 Nov 2013 17:09:11 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/pybootchartgui/parsing.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index c8a6a57..ed61825 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -675,8 +675,7 @@ def parse_paths(writer, state, paths, mintime):
             continue
         #state.filename = path
         if os.path.isdir(path):
-            files = [ f for f in [os.path.join(path, f) for f in os.listdir(path)] ]
-            files.sort()
+            files = sorted([os.path.join(path, f) for f in os.listdir(path)])
             state = parse_paths(writer, state, files, mintime)
         elif extension in [".tar", ".tgz", ".gz"]:
             if extension == ".gz":
-- 
1.8.4


