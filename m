Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id B0B3D748C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 19:22:53 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 3B17528056D; Fri, 15 Jun 2018 12:26:52 -0700 (PDT)
Date: Fri, 15 Jun 2018 12:26:52 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180615192652.GM31886@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-core@lists.openembedded.org
References: <20180615075618.GL31886@vctlabs.com>
	<CAMKF1sqHeUyehiWW+_WsXST4Az8m0Fq6sTQLp2U1cXfKm2QeHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqHeUyehiWW+_WsXST4Az8m0Fq6sTQLp2U1cXfKm2QeHw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH V2] sqlite3: consistent set of features for nativesdk
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
X-List-Received-Date: Fri, 15 Jun 2018 19:22:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Enable use of pread() and enable column metadata API for all builds.
This brings nativesdk in line with target and native builds.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 95ec89c..1834867d 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -36,12 +36,10 @@ EXTRA_OECONF = " \
 CFLAGS_append = " -fPIC"
 
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
-BUILD_CFLAGS += "-DUSE_PREAD"
-TARGET_CFLAGS += "-DUSE_PREAD"
+CFLAGS += "-DUSE_PREAD"
 
 # Provide column meta-data API
-BUILD_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
-TARGET_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
+CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
 
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
 
-- 
1.9.4


