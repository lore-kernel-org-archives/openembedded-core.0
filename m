Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 710B97466F;
	Fri, 30 Mar 2018 07:05:28 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Fri, 30 Mar 2018 07:05:29 -0000
Message-ID: <20180330070529.2394.14955@do.openembedded.org>
References: <cover.1522392229.git.hongxu.jia@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <cover.1522392229.git.hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgVXBncmFkZSA3IHBhY2thZ2Vz?=
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
X-List-Received-Date: Fri, 30 Mar 2018 07:05:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Upgrade 7 packages
Revision: 1
URL   : https://patchwork.openembedded.org/series/11622/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             LIC_FILES_CHKSUM changed on target libgpg-error but there is no "License-Update" tag in commit message [test_lic_files_chksum_modified_not_mentioned] 
  Suggested fix    Include "License-Update: <description>" into the commit message with a brief description
  Current checksum file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1                     file://src/gpg-error.h.in;endline=23;md5=beae1e44d8d5c265d194760276033a7c                     file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2b91225afbc
  New checksum     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1                     file://src/gpg-error.h.in;endline=23;md5=fc7423b56d5f7163a9a2acf9fe2f8d6b                     file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2b91225afbc

* Issue             Patches not removed from tree [test_src_uri_left_files] 
  Suggested fix    Amend the patch containing the software patch file removal
  Patch            avoid-host-contamination.patch
  Patch            mkdir-p.patch
  Patch            do-not-check-local-libpng-source.patch
  Patch            ghostscript-9.02-genarch.patch
  Patch            ghostscript-9.21-prevent_recompiling.patch
  Patch            ghostscript-9.16-Werror-return-type.patch
  Patch            cups-no-gcrypt.patch
  Patch            ghostscript-9.15-parallel-make.patch



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


