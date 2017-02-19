Return-Path: <peter@berginkonsult.se>
X-Greylist: delayed 964 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 19 Feb 2017 20:46:38 UTC
Received: from mailrelay1.public.one.com (mailrelay1.public.one.com
	[91.198.169.124])
	by mail.openembedded.org (Postfix) with ESMTP id 866ED71A18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2017 20:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=berginkonsult.se; s=20140924;
	h=from:subject:date:message-id:to;
	bh=e6d5vVMVWBRsKR1V3kNZ8yWlHMT2L0PluceOgHLGPpU=;
	b=KrPXcWm9qjH+ITpfG7D8gHWHww7DQnO0FiMhTKxpW/sRMLl7QvsvtUvamtBgMGw5lxoCSUjFAkrC0
	gkMCIaaT4RBI6qRuByTZ5ZmOR7ZpfEGuC/ih/xTknvxQDI14oLESwKi5ofzICnlV5NQ+5MtVXd2tnC
	KF1+a96N5rzlJls4=
X-HalOne-Cookie: 44fe7257b97cb3f482746aade87064650aec3e22
X-HalOne-ID: 40bb1a67-f6e2-11e6-9cd7-b8ca3afa9d73
Received: from localhost.localdomain (unknown [84.219.203.105])
	by smtpfilter1.public.one.com (Halon) with ESMTPSA
	id 40bb1a67-f6e2-11e6-9cd7-b8ca3afa9d73;
	Sun, 19 Feb 2017 20:30:32 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Feb 2017 21:30:13 +0100
Message-Id: <1487536213-8453-1-git-send-email-peter@berginkonsult.se>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] useradd-staticids: fix typo for '--expiredate'
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
X-List-Received-Date: Sun, 19 Feb 2017 20:46:39 -0000

There is a typo in the useradd-staticids.bbclass that
causes error during do_install.

If build was configured to use usedadd-staticids and
the recipe included (for example):

USERADD_PARAM_${PN} = "--expiredate '' testUser"

Due to the typo this added the wrong option '--expiredata '
that caused an error.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/classes/useradd-staticids.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index a309b88..a65c3f6 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -184,7 +184,7 @@ def update_useradd_static_config(d):
             newparam += ['', ' --base-dir %s' % uaargs.base_dir][uaargs.base_dir != None]
             newparam += ['', ' --comment %s' % uaargs.comment][uaargs.comment != None]
             newparam += ['', ' --home-dir %s' % uaargs.home_dir][uaargs.home_dir != None]
-            newparam += ['', ' --expiredata %s' % uaargs.expiredate][uaargs.expiredate != None]
+            newparam += ['', ' --expiredate %s' % uaargs.expiredate][uaargs.expiredate != None]
             newparam += ['', ' --inactive %s' % uaargs.inactive][uaargs.inactive != None]
             newparam += ['', ' --gid %s' % uaargs.gid][uaargs.gid != None]
             newparam += ['', ' --groups %s' % uaargs.groups][uaargs.groups != None]
-- 
2.7.4


