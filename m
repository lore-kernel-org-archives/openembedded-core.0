Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QkIem-0007jE-4Y
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 18:32:56 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6MGSkMi010603
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:28:46 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 09:28:38 -0700
Message-Id: <18c8e3f8b8c379da0e81c1f06fd9e10d2c344840.1311352057.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311352057.git.tom_rini@mentor.com>
References: <cover.1311352057.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311352057.git.tom_rini@mentor.com>
References: <cover.1311352057.git.tom_rini@mentor.com>
Subject: [PATCH 3/8] x86_64-linux siteinfo: Add bash info
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
X-List-Received-Date: Fri, 22 Jul 2011 16:32:56 -0000

Taken from oe.dev

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/x86_64-linux |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index ba6e57c..076e5b6 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -89,6 +89,11 @@ ac_cv_lib_m_sin=${ac_cv_lib_m_sin=yes}
 
 #orbit
 libIDL_cv_long_long_format=ll
+
+# bash
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
+
+# ORBit2
 ac_cv_alignof_CORBA_boolean=1
 ac_cv_alignof_CORBA_char=1
 ac_cv_alignof_CORBA_double=8
-- 
1.7.0.4



