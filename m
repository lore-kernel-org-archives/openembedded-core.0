Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q912r-0007eL-9H
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 22:15:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Apr 2011 13:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,334,1299484800"; d="scan'208";a="907791328"
Received: from unknown (HELO localhost) ([10.255.12.197])
	by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2011 13:13:27 -0700
Message-Id: <b7b7fce9fb431de18cbdabf22ce3cf51c5cfa0ef.1302466269.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302466269.git.sgw@linux.intel.com>
References: <cover.1302466269.git.sgw@linux.intel.com>
Old-Date: Wed, 23 Mar 2011 18:28:36 -0400
Date: Sun, 10 Apr 2011 13:13:27 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 1/6] autotools: Pass --disable-silent-rules to configure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Apr 2011 20:15:41 -0000

From: Colin Walters <walters@verbum.org>

Non-verbose logs are really annoying when trying to debug a build
failure.  A lot of projects are copying in the flag to use
AM_SILENT_RULES which automake gained recently.  We need to undo
this.

We'll get a warning from configure if it's not recognized, but that's
fine.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/autotools.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index bc891f9..7ebf833 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -63,6 +63,7 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --oldincludedir=${oldincludedir} \
 		  --infodir=${infodir} \
 		  --mandir=${mandir} \
+		  --disable-silent-rules \
 		  ${@append_libtool_sysroot(d)}"
 
 oe_runconf () {
-- 
1.7.1.1



