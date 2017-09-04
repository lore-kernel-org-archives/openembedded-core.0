Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 688 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Sep 2017 03:12:00 UTC
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBAD60102
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 03:12:00 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym02.jp.fujitsu.com with smtp
	id 2520_5a39_d9bfc181_7982_40b7_b2de_91309559d97e;
	Mon, 04 Sep 2017 12:00:26 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
	(g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 50102AC0108
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 12:00:26 +0900 (JST)
Received: from G01JPEXCHKW13.g01.fujitsu.local
	(G01JPEXCHKW13.g01.fujitsu.local [10.0.194.52])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	3E87E69242C for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 12:00:25 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	G01JPEXCHKW13.g01.fujitsu.local (10.0.194.52) with Microsoft SMTP
	Server id 14.3.352.0; Mon, 4 Sep 2017 12:00:24 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Sep 2017 12:00:18 +0900
Message-ID: <1504494018-23966-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] perf: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 04 Sep 2017 03:12:01 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index b882204..b79b973 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -5,6 +5,7 @@ performance analysis. It covers hardware level \
 (CPU/PMU, Performance Monitoring Unit) features \
 and software features (software counters, tracepoints) \
 as well."
+HOMEPAGE = "https://perf.wiki.kernel.org/index.php/Main_Page"
 
 LICENSE = "GPLv2"
 
-- 
2.7.4



