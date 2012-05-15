Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SUMSF-0002jj-0P
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 20:26:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4FIGcJc021285
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 11:16:38 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 15 May 2012 11:16:37 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 May 2012 13:16:35 -0500
Message-ID: <4dc3fcca56d48e71547fdf6730fe8f6bdb1c9c87.1337105658.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1337105658.git.peter.seebach@windriver.com>
References: <cover.1337105658.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] tcmode-external-csl.inc: specify the path you couldn't find
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
X-List-Received-Date: Tue, 15 May 2012 18:26:41 -0000
Content-Type: text/plain

While misconfiguring toolchains, I noticed that one of the
diagnostic messages gave me a little less information than I'd
like about what I'd done wrong.  Displaying the glob pattern
that couldn't be matched turns out to make it a lot easier to
figure out what you did wrong.  (Answer: Not enough coffee.)

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 6bdd466..731780b 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -100,7 +100,7 @@ def populate_toolchain_links(d):
     pattern = d.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}*')
     files = glob(pattern)
     if not files:
-        bb.fatal("Unable to populate toolchain binary symlinks")
+        bb.fatal("Unable to populate toolchain binary symlinks in %s" % pattern)
 
     bindir = d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
     bb.mkdirhier(bindir)
-- 
1.7.0.4



