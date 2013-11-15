Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id D3AF96DA98
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 17:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 74EA925B0A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mXJq-FhiEU0o
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:14 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id F1EB125B10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id DAFACBF4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id D84D1BE8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id CE17B3404E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id rAFH98eJ014848
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id rAFH98LY014847
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Nov 2013 18:09:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 18:08:57 +0100
Message-Id: <3af4d9b350f59bf3179bfe1e6901cf9678ce5c2f.1384535211.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
Subject: [PATCH 08/14] pybootchartgui: Disable options that do not make sense
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
X-List-Received-Date: Fri, 15 Nov 2013 17:09:14 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/pybootchartgui/main.py.in | 40 +++++++++++++++---------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/main.py.in b/scripts/pybootchartgui/pybootchartgui/main.py.in
index 265cb18..3927186 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py.in
+++ b/scripts/pybootchartgui/pybootchartgui/main.py.in
@@ -40,29 +40,29 @@ def _mk_options_parser():
 			  help="split the output chart into <NUM> charts, only works with \"-o PATH\"")
 	parser.add_option("-m", "--mintime", dest="mintime", type=int, default=8,
 			  help="only tasks longer than this time will be displayed")
-	parser.add_option("-n", "--no-prune", action="store_false", dest="prune", default=True,
-			  help="do not prune the process tree")
+#	parser.add_option("-n", "--no-prune", action="store_false", dest="prune", default=True,
+#			  help="do not prune the process tree")
 	parser.add_option("-q", "--quiet", action="store_true", dest="quiet", default=False,
 			  help="suppress informational messages")
-	parser.add_option("-t", "--boot-time", action="store_true", dest="boottime", default=False,
-			  help="only display the boot time of the boot in text format (stdout)")	
+#	parser.add_option("-t", "--boot-time", action="store_true", dest="boottime", default=False,
+#			  help="only display the boot time of the boot in text format (stdout)")	
 	parser.add_option("--very-quiet", action="store_true", dest="veryquiet", default=False,
 			  help="suppress all messages except errors")
 	parser.add_option("--verbose", action="store_true", dest="verbose", default=False,
 			  help="print all messages")
-	parser.add_option("--profile", action="store_true", dest="profile", default=False,
-			  help="profile rendering of chart (only useful when in batch mode indicated by -f)")
-	parser.add_option("--show-pid", action="store_true", dest="show_pid", default=False,
-			  help="show process ids in the bootchart as 'processname [pid]'")
+#	parser.add_option("--profile", action="store_true", dest="profile", default=False,
+#			  help="profile rendering of chart (only useful when in batch mode indicated by -f)")
+#	parser.add_option("--show-pid", action="store_true", dest="show_pid", default=False,
+#			  help="show process ids in the bootchart as 'processname [pid]'")
 	parser.add_option("--show-all", action="store_true", dest="show_all", default=False,
 			  help="show all process information in the bootchart as '/process/path/exe [pid] [args]'")
-	parser.add_option("--crop-after", dest="crop_after", metavar="PROCESS", default=None,
-			  help="crop chart when idle after PROCESS is started")
-	parser.add_option("--annotate", action="append", dest="annotate", metavar="PROCESS", default=None,
-			  help="annotate position where PROCESS is started; can be specified multiple times. " +
-			       "To create a single annotation when any one of a set of processes is started, use commas to separate the names")
-	parser.add_option("--annotate-file", dest="annotate_file", metavar="FILENAME", default=None,
-			  help="filename to write annotation points to")
+#	parser.add_option("--crop-after", dest="crop_after", metavar="PROCESS", default=None,
+#			  help="crop chart when idle after PROCESS is started")
+#	parser.add_option("--annotate", action="append", dest="annotate", metavar="PROCESS", default=None,
+#			  help="annotate position where PROCESS is started; can be specified multiple times. " +
+#			       "To create a single annotation when any one of a set of processes is started, use commas to separate the names")
+#	parser.add_option("--annotate-file", dest="annotate_file", metavar="FILENAME", default=None,
+#			  help="filename to write annotation points to")
 	return parser
 
 class Writer:
@@ -108,6 +108,16 @@ def main(argv=None):
 	
 		parser = _mk_options_parser()
 		options, args = parser.parse_args(argv)
+
+		# Default values for disabled options
+		options.prune = True
+		options.boottime = False
+		options.profile = False
+		options.show_pid = False
+		options.crop_after = None
+		options.annotate = None
+		options.annotate_file = None
+
 		writer = _mk_writer(options)
 
 		if len(args) == 0:
-- 
1.8.4


