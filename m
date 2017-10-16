Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 976A678204
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 22:01:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 16 Oct 2017 15:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,388,1503385200"; d="scan'208";a="323947004"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga004.fm.intel.com with ESMTP; 16 Oct 2017 15:01:29 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Oct 2017 15:01:24 -0700
Message-Id: <20171016220126.128198-3-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20171016220126.128198-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20171016220126.128198-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 3/5] git.inc: remove sed statement removing SVN lines from .packlist
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
X-List-Received-Date: Mon, 16 Oct 2017 22:01:28 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The git-perltools package created with perl 5.26.1 does not contain
the  .packlist file thus there is no need to sed on this file.

More general, the buildhistory-diff tool shows the following changes on
the related package, clearly indicating that .packlist is not there anymore.

    diff --git a/packages/i586-poky-linux/git/git-perltools/files-in-package.txt b/packages/i586-poky-linux/git/git-perltools/files-in-package.txt
    index 0780bf9..f5b70f6 100644
    --- a/packages/i586-poky-linux/git/git-perltools/files-in-package.txt
    +++ b/packages/i586-poky-linux/git/git-perltools/files-in-package.txt
    @@ -1,7 +1,7 @@
     drwxr-xr-x root       root               61 ./usr
     drwxr-xr-x root       root               26 ./usr/lib
     drwxr-xr-x root       root               30 ./usr/libexec
    -drwxr-xr-x root       root              269 ./usr/libexec/git-core
    +drwxr-xr-x root       root              288 ./usr/libexec/git-core
     -rwxr-xr-x root       root            42296 ./usr/libexec/git-core/git-add--interactive
     -rwxr-xr-x root       root          2323504 ./usr/libexec/git-core/git-am
     -rwxr-xr-x root       root            36973 ./usr/libexec/git-core/git-archimport
    @@ -12,18 +12,28 @@ drwxr-xr-x root       root              269 ./usr/libexec/git-core
     -rwxr-xr-x root       root             3702 ./usr/libexec/git-core/git-request-pull
     -rwxr-xr-x root       root            52159 ./usr/libexec/git-core/git-send-email
     -rwxr-xr-x root       root            28086 ./usr/libexec/git-core/git-submodule
    +-rwxr-xr-x root       root            64175 ./usr/libexec/git-core/git-svn
     drwxr-xr-x root       root               31 ./usr/lib/perl
     drwxr-xr-x root       root               28 ./usr/lib/perl/site_perl
    -drwxr-xr-x root       root              104 ./usr/lib/perl/site_perl/5.24.1
    -drwxr-xr-x root       root               25 ./usr/lib/perl/site_perl/5.24.1/auto
    -drwxr-xr-x root       root               31 ./usr/lib/perl/site_perl/5.24.1/auto/Git
    --rw-r--r-- root       root             1115 ./usr/lib/perl/site_perl/5.24.1/auto/Git/.packlist
    --r--r--r-- root       root            19087 ./usr/lib/perl/site_perl/5.24.1/Error.pm
    -drwxr-xr-x root       root               53 ./usr/lib/perl/site_perl/5.24.1/Git
    --r--r--r-- root       root             2473 ./usr/lib/perl/site_perl/5.24.1/Git/I18N.pm
    --r--r--r-- root       root              644 ./usr/lib/perl/site_perl/5.24.1/Git/IndexInfo.pm
    --r--r--r-- root       root            48000 ./usr/lib/perl/site_perl/5.24.1/Git.pm
    --rw-r--r-- root       root              226 ./usr/lib/perl/site_perl/5.24.1/perllocal.pod
    +drwxr-xr-x root       root               88 ./usr/lib/perl/site_perl/5.26.1
    +-r--r--r-- root       root            19087 ./usr/lib/perl/site_perl/5.26.1/Error.pm
    +drwxr-xr-x root       root               86 ./usr/lib/perl/site_perl/5.26.1/Git
    +-r--r--r-- root       root             2473 ./usr/lib/perl/site_perl/5.26.1/Git/I18N.pm
    +-r--r--r-- root       root              644 ./usr/lib/perl/site_perl/5.26.1/Git/IndexInfo.pm
    +-r--r--r-- root       root            48000 ./usr/lib/perl/site_perl/5.26.1/Git.pm
    +drwxr-xr-x root       root              195 ./usr/lib/perl/site_perl/5.26.1/Git/SVN
    +-r--r--r-- root       root            16945 ./usr/lib/perl/site_perl/5.26.1/Git/SVN/Editor.pm
    +-r--r--r-- root       root            18575 ./usr/lib/perl/site_perl/5.26.1/Git/SVN/Fetcher.pm
    +-r--r--r-- root       root             1798 ./usr/lib/perl/site_perl/5.26.1/Git/SVN/GlobSpec.pm
    +-r--r--r-- root       root             9564 ./usr/lib/perl/site_perl/5.26.1/Git/SVN/Log.pm
    +drwxr-xr-x root       root               29 ./usr/lib/perl/site_perl/5.26.1/Git/SVN/Memoize
    +-r--r--r-- root       root             1748 ./usr/lib/perl/site_perl/5.26.1/Git/SVN/Memoize/YAML.pm
    +-r--r--r-- root       root             8145 ./usr/lib/perl/site_perl/5.26.1/Git/SVN/Migration.pm
    +-r--r--r-- root       root            71721 ./usr/lib/perl/site_perl/5.26.1/Git/SVN.pm
    +-r--r--r-- root       root             5319 ./usr/lib/perl/site_perl/5.26.1/Git/SVN/Prompt.pm
    +-r--r--r-- root       root            19358 ./usr/lib/perl/site_perl/5.26.1/Git/SVN/Ra.pm
    +-r--r--r-- root       root             4586 ./usr/lib/perl/site_perl/5.26.1/Git/SVN/Utils.pm
    +-rw-r--r-- root       root              226 ./usr/lib/perl/site_perl/5.26.1/perllocal.pod

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-devtools/git/git.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 9b4c1284d2..06ff27c70b 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -73,7 +73,6 @@ perl_native_fixup () {
 		# module, which does not exist in OE-Core.
 		rm -r ${D}${libexecdir}/git-core/git-svn \
 		      ${D}${libdir}/perl/site_perl/*/Git/SVN*
-		sed -i -e '/SVN/d' ${D}${libdir}/perl/site_perl/*/auto/Git/.packlist
 	fi
 }
 
-- 
2.12.3


