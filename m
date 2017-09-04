Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id 5150260102
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 03:06:14 +0000 (UTC)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 0c6d_9709_431f8bf5_7c5c_4557_9426_9cf509757fdd;
	Mon, 04 Sep 2017 12:06:11 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id CC997AC0066
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 12:06:10 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	A9F8D6D6503 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 12:06:09 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP
	Server id 14.3.352.0; Mon, 4 Sep 2017 12:06:09 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Sep 2017 12:06:02 +0900
Message-ID: <1504494362-24039-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] readline: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 04 Sep 2017 03:06:15 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-core/readline/readline.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 1a0a155..e966522 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -4,6 +4,7 @@ command lines as they are typed in. Both Emacs and vi editing modes are availabl
 additional functions to maintain a list of previously-entered command lines, to recall and perhaps reedit those   \
 lines, and perform csh-like history expansion on previous commands."
 SECTION = "libs"
+HOMEPAGE = "https://cnswww.cns.cwru.edu/php/chet/readline/rltop.html"
 
 # GPLv2+ (< 6.0), GPLv3+ (>= 6.0)
 LICENSE = "GPLv3+"
-- 
2.7.4



