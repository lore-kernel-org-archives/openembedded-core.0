Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9F29E7162E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Sep 2014 02:59:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8S2xbIS020312
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Sep 2014 19:59:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sat, 27 Sep 2014 19:59:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 28 Sep 2014 11:00:20 +0800
Message-ID: <16e0c4481ed581a2dc114ff34ca022b5b0970d66.1411721794.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411721793.git.Qi.Chen@windriver.com>
References: <cover.1411721793.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 4/4] sysklog: comment out configuration regarding xconsole
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
X-List-Received-Date: Sun, 28 Sep 2014 02:59:35 -0000
Content-Type: text/plain

I commented out these configurations for the following reasons:
We don't have xconsole utility in OE. These configurations are useless
for us.

Besides, the /dev/xconsole device is created in the init script which means
if these configuration are enabled, we need to add a script in sysklogd which
creates /dev/xconsole and is invoked in ExecStartPre in the sysklogd's service
file.

I think it's better that we just comment these lines out.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sysklogd/files/syslog.conf | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/sysklogd/files/syslog.conf b/meta/recipes-extended/sysklogd/files/syslog.conf
index 0849de1..46a734c 100644
--- a/meta/recipes-extended/sysklogd/files/syslog.conf
+++ b/meta/recipes-extended/sysklogd/files/syslog.conf
@@ -64,8 +64,8 @@ mail,news.none		-/var/log/messages
 # NOTE: adjust the list below, or you'll go crazy if you have a reasonably
 #      busy site..
 #
-daemon.*;mail.*;\
-news.err;\
-*.=debug;*.=info;\
-*.=notice;*.=warn	|/dev/xconsole
+#daemon.*;mail.*;\
+#news.err;\
+#*.=debug;*.=info;\
+#*.=notice;*.=warn	|/dev/xconsole
 
-- 
1.9.1


