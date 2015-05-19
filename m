Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA4B860168
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 08:29:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4J8TKVP025190
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 01:29:20 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.153) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 19 May 2015 01:29:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 May 2015 16:29:29 +0800
Message-ID: <971f18fc4a97344769e54313a78898f86f520a7e.1432024013.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1432024013.git.Qi.Chen@windriver.com>
References: <cover.1432024013.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] buildstats-summary: add eventmask
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
X-List-Received-Date: Tue, 19 May 2015 08:29:19 -0000
Content-Type: text/plain

Add eventmask for buildstats_summary handler.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/buildstats-summary.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/buildstats-summary.bbclass
index c8fbb2f..7bd528e 100644
--- a/meta/classes/buildstats-summary.bbclass
+++ b/meta/classes/buildstats-summary.bbclass
@@ -37,3 +37,4 @@ python buildstats_summary () {
             bb.note("  {0}: {1}% sstate reuse ({2} setscene, {3} scratch)".format(t, 100*len(sstate)/(len(sstate)+len(no_sstate)), len(sstate), len(no_sstate)))
 }
 addhandler buildstats_summary
+buildstats_summary[eventmask] = "bb.event.BuildCompleted"
-- 
1.9.1


