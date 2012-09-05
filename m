Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9AIS-0007Nx-TP
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 09:45:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q857WnOW017242
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2012 00:32:49 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 5 Sep 2012 00:32:48 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 5 Sep 2012 15:32:46 +0800
Message-ID: <6e22b3eee7fffbe59403778ab611947becc979ca.1346829716.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346829716.git.kai.kang@windriver.com>
References: <cover.1346829716.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] libfile-checktree-perl: add it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 07:45:13 -0000
Content-Type: text/plain

LSB perl test 4.1.6-2, all/tst_perlModPresent.pl 1 fails with:
test 88 'use File::CheckTree;' failed

Add it to fix this issue.

[Yocto #3031]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../perl/libfile-checktree-perl_4.41.bb            |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-lsb/recipes-devtools/perl/libfile-checktree-perl_4.41.bb

diff --git a/meta-lsb/recipes-devtools/perl/libfile-checktree-perl_4.41.bb b/meta-lsb/recipes-devtools/perl/libfile-checktree-perl_4.41.bb
new file mode 100644
index 0000000..f11db5e
--- /dev/null
+++ b/meta-lsb/recipes-devtools/perl/libfile-checktree-perl_4.41.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Perl module that run many filetest checks on a tree"
+DESCRIPTION = "The validate() routine takes a single multiline string consisting \
+of directives, each containing a filename plus a file test to try on it. (The file \
+test may also be a "cd", causing subsequent relative filenames to be interpreted \
+relative to that directory.) After the file test you may put || die to make it a \
+fatal error if the file test fails. The default is || warn. The file test may \
+optionally have a "!' prepended to test for the opposite condition. If you do a \
+cd and then list some relative filenames, you may want to indent them slightly for \
+readability. If you supply your own die() or warn() message, you can use $file to \
+interpolate the filename. \
+\
+Filetests may be bunched: "-rwx" tests for all of -r, -w, and -x. Only the first failed \
+test of the bunch will produce a warning. \
+\
+The routine returns the number of warnings issued."
+
+HOMEPAGE = "http://search.cpan.org/~flora/File-CheckTree/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c6fcacc5df80e037060300a7f4b93bf9"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/File-CheckTree-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "519c82aa7e5b7f752b4da14a6c8ad740"
+SRC_URI[sha256sum] = "fc99ab6bb5af4664832715974b5a19e328071dc9202ab72e5d5a594ebd46a729"
+
+S = "${WORKDIR}/File-CheckTree-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.7.5.4



