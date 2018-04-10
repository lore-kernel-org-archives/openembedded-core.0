Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id BD23B745E7;
	Tue, 10 Apr 2018 12:34:20 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Tue, 10 Apr 2018 12:34:22 -0000
Message-ID: <20180410123422.2392.14795@do.openembedded.org>
References: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgIltSRkNdIG9wZW5zc2w6IHJlbmFtZSBvcGVuc3NsIC4uLiIgYW5kIDQgbW9yZQ==?=
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
X-List-Received-Date: Tue, 10 Apr 2018 12:34:20 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "[RFC] openssl: rename openssl ..." and 4 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/11748/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             LIC_FILES_CHKSUM changed on target openssl but there is no "License-Update" tag in commit message [test_lic_files_chksum_modified_not_mentioned] 
  Suggested fix    Include "License-Update: <description>" into the commit message with a brief description
  Current checksum file://LICENSE;md5=f475368924827d06d4b416111c8bdb77
  New checksum     file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff

* Issue             Patches not removed from tree [test_src_uri_left_files] 
  Suggested fix    Amend the patch containing the software patch file removal
  Patch            
  Patch            engines-install-in-libdir-ssl.patch
  Patch            ptest-deps.patch
  Patch            openssl_fix_for_x32.patch
  Patch            c_rehash-compat.patch
  Patch            no-symbolic.patch
  Patch            oe-ldflags.patch
  Patch            ptest_makefile_deps.patch
  Patch            openssl-util-perlpath.pl-cwd.patch
  Patch            debian-targets.patch
  Patch            0001-openssl-force-soft-link-to-avoid-rare-race.patch
  Patch            man-dir.patch
  Patch            pic.patch
  Patch            block_diginotar.patch
  Patch            parallel.patch
  Patch            Makefiles-ptest.patch
  Patch            man-section.patch
  Patch            block_digicert_malaysia.patch
  Patch            configure-targets.patch
  Patch            0001-Fix-build-with-clang-using-external-assembler.patch
  Patch            reproducible-mkbuildinf.patch
  Patch            no-rpath.patch
  Patch            soname.patch
  Patch            ca.patch
  Patch            shared-libs.patch
  Patch            Use-SHA256-not-MD5-as-default-digest.patch
  Patch            reproducible-cflags.patch
  Patch            configure-musl-target.patch
  Patch            openssl-fix-des.pod-error.patch
  Patch            version-script.patch



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


