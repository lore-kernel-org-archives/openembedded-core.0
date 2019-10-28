Return-Path: <frazer.clews@codethink.co.uk>
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
	by mail.openembedded.org (Postfix) with ESMTP id 20A9A7F9B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 17:15:00 +0000 (UTC)
Received: from [167.98.27.226] (helo=frazerclews.office.codethink.co.uk)
	by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
	id 1iP8bc-0005aD-Oa; Mon, 28 Oct 2019 17:15:00 +0000
From: Frazer Leslie Clews <frazer.clews@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2019 17:14:49 +0000
Message-Id: <20191028171449.8489-3-frazer.clews@codethink.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028171449.8489-1-frazer.clews@codethink.co.uk>
References: <20191028171449.8489-1-frazer.clews@codethink.co.uk>
MIME-Version: 1.0
Cc: Frazer Leslie Clews <frazer.clews@codethink.co.uk>
Subject: [PATCH 2/2] fix invalidScanfFormatWidth to prevent overflowing usr_buf
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
X-List-Received-Date: Mon, 28 Oct 2019 17:15:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Frazer Leslie Clews <frazer.clews@codethink.co.uk>
---
 meta/recipes-devtools/makedevs/makedevs/makedevs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
index 01e564afee..32b9872932 100644
--- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
@@ -360,7 +360,7 @@ static int interpret_table_entry(char *line)
 	unsigned long mode = 0755, uid = 0, gid = 0, major = 0, minor = 0;
 	unsigned long start = 0, increment = 1, count = 0;
 
-	if (0 > sscanf(line, "%4095s %c %lo %40s %40s %lu %lu %lu %lu %lu", path,
+	if (0 > sscanf(line, "%4095s %c %lo %39s %39s %lu %lu %lu %lu %lu", path,
 		    &type, &mode, usr_buf, grp_buf, &major, &minor, &start,
 		    &increment, &count))
 	{
-- 
2.20.1


