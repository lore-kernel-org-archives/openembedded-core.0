Return-Path: <jef.driesen@niko.eu>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 13 Apr 2018 13:38:38 UTC
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	by mail.openembedded.org (Postfix) with ESMTP id B2030745B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 13:38:38 +0000 (UTC)
Received: from barracuda.home.lan ([81.82.26.5])
	by andre.telenet-ops.be with bizsmtp
	id ZpZe1x00B06cLrV01pZeyi; Fri, 13 Apr 2018 15:33:38 +0200
Received: from w7pt-jdi.1.0.0.1 (84-199-78-189.ifiber.telenet-ops.be
	[84.199.78.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by barracuda.home.lan (Postfix) with ESMTPSA id 9661940710;
	Fri, 13 Apr 2018 15:33:37 +0200 (CEST)
From: Jef Driesen <jef.driesen@niko.eu>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2018 15:33:05 +0200
Message-Id: <1523626385-3338-1-git-send-email-jef.driesen@niko.eu>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] bitbake.conf: add scp to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Fri, 13 Apr 2018 13:38:39 -0000

The scp tool is used by the ssh fetcher.

Signed-off-by: Jef Driesen <jef.driesen@niko.eu>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 60590e2..5cfd117 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -498,6 +498,9 @@ HOSTTOOLS_NONFATAL += "join nl size yes zcat"
 # Used by bzr fetcher
 HOSTTOOLS_NONFATAL += "bzr"
 
+# Used by ssh fetcher
+HOSTTOOLS_NONFATAL += "scp"
+
 CCACHE ??= ""
 # ccache < 3.1.10 will create CCACHE_DIR on startup even if disabled, and
 # autogen sets HOME=/dev/null so in certain situations builds can fail.
-- 
2.7.4


