Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF34C47090
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11656.1650052688290141936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NVNtygkI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101802ecde69d-9b5ba231-f470-49a9-a7d2-ddd17ab2f893-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UunGhVSdhh7NBh2BHgBNxuPWIV1FsP4Aejefc/Zjx4I=;
	b=NVNtygkIrXUYw6vecU6x8yGm49EvIUmIJxjKUK3YSNRVp3AaCHlbnbw1zeJw3dBb
	lD9hyUDXDhjzWdhecRkIBNZfB++OMmf2sgvz6doY50Hrz0EFCOmQ256E6/okffQPkYV
	6TTnTE1Ufwmdb+8Owokvyohl9fqg/sVMftXjfwRU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UunGhVSdhh7NBh2BHgBNxuPWIV1FsP4Aejefc/Zjx4I=;
	b=ZUdXIbnhQ7CyDNhzx/TS8jtrOfuxGzRU00newHW0U+W+j6nSGHDcNeC8GLD0g0S8
	3N8Z1qXcTy4l0rHZYxQl3nBe67P6nOd+8aOLLL5mUjlec5DiL0WI3+h0Pr4AQUpNvSU
	vu6ZDwBsuPw6rFfuVw7IXvnXAM2o3nda/TI5B158=
Content-Type: multipart/mixed; boundary="===============4668398675271771063=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.1.2 SUCCEEDED
Message-ID: 
 <010101802ecde69d-9b5ba231-f470-49a9-a7d2-ddd17ab2f893-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:07 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164472

--===============4668398675271771063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ruby* to *3.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-3.1.1-3.1.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4668398675271771063==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.1.1-3.1.2.patch"

From 3b6d5d2b0998d9e967b21d3758b4a2d42c861b1c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 10:07:33 +0000
Subject: [PATCH] ruby: upgrade 3.1.1 -> 3.1.2

---
 meta/recipes-devtools/ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb} (97%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.1.1.bb b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
similarity index 97%
rename from meta/recipes-devtools/ruby/ruby_3.1.1.bb
rename to meta/recipes-devtools/ruby/ruby_3.1.2.bb
index d8fddfa520..38ba46731b 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            "
 
-SRC_URI[sha256sum] = "fe6e4782de97443978ddba8ba4be38d222aa24dc3e3f02a6a8e7701c0eeb619d"
+SRC_URI[sha256sum] = "61843112389f02b735428b53bb64cf988ad9fb81858b8248e22e57336f24a83e"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.27.0


--===============4668398675271771063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ruby/ruby-dev: FILELIST: removed "/usr/include/ruby-3.1.0/i686-linux-gnu/rb_mjit_min_header-3.1.1.h", added "/usr/include/ruby-3.1.0/i686-linux-gnu/rb_mjit_min_header-3.1.2.h"
packages/core2-32-poky-linux/ruby/ruby: FILELIST: removed "/usr/lib/libruby.so.3.1.1", added "/usr/lib/libruby.so.3.1.2"
Changes to packages/core2-32-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.1 changed symlink target from libruby.so.3.1.1 to libruby.so.3.1.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.1.1 to libruby.so.3.1.2
  /usr/include/ruby-3.1.0/i686-linux-gnu/rb_mjit_min_header-3.1.1.h moved to /usr/include/ruby-3.1.0/i686-linux-gnu/rb_mjit_min_header-3.1.2.h
  /usr/lib/libruby.so.3.1.1 moved to /usr/lib/libruby.so.3.1.2
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.1 changed symlink target from libruby.so.3.1.1 to libruby.so.3.1.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.1.1 to libruby.so.3.1.2
  /usr/include/ruby-3.1.0/x86_64-linux-gnu/rb_mjit_min_header-3.1.1.h moved to /usr/include/ruby-3.1.0/x86_64-linux-gnu/rb_mjit_min_header-3.1.2.h
  /usr/lib/libruby.so.3.1.1 moved to /usr/lib/libruby.so.3.1.2

--===============4668398675271771063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ruby: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.1.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://remove_has_include_macros.patch file://run-ptest file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch file://0002-template-Makefile.in-filter-out-f-prefix-map.patch file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch" to "http://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.2.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://remove_has_include_macros.patch file://run-ptest file://0001-template-Makefile
 .in-do-not-write-host-cross-cc-item.patch file://0002-template-Makefile.in-filter-out-f-prefix-map.patch file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch"
packages/core2-32-poky-linux/ruby: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/ruby/ruby-dbg: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/ruby/ruby-dbg: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.3.1.1", added "/usr/lib/.debug/libruby.so.3.1.2"
packages/core2-32-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 8904680 to 8904696 (+0%)
packages/core2-32-poky-linux/ruby/ruby-dev: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/ruby/ruby-dev: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/ruby/ruby-dev: FILELIST: removed "/usr/include/ruby-3.1.0/i686-linux-gnu/rb_mjit_min_header-3.1.1.h", added "/usr/include/ruby-3.1.0/i686-linux-gnu/rb_mjit_min_header-3.1.2.h"
packages/core2-32-poky-linux/ruby/ruby-doc: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/ruby/ruby-doc: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/ruby/ruby-locale: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/ruby/ruby-locale: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/ruby/ruby-ptest: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/ruby/ruby-ptest: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 15548912 to 15549280 (+0%)
packages/core2-32-poky-linux/ruby/ruby-rdoc: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/ruby/ruby-rdoc: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/ruby/ruby-ri-docs: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/ruby/ruby-ri-docs: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/ruby/ruby-src: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/ruby/ruby-src: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/ruby/ruby-src: PKGSIZE changed from 32175789 to 32175873 (+0%)
packages/core2-32-poky-linux/ruby/ruby-staticdev: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/ruby/ruby-staticdev: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/ruby/ruby: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/ruby/ruby: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/ruby/ruby: FILELIST: removed "/usr/lib/libruby.so.3.1.1", added "/usr/lib/libruby.so.3.1.2"
Changes to packages/core2-32-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.1 changed symlink target from libruby.so.3.1.1 to libruby.so.3.1.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.1.1 to libruby.so.3.1.2
  /usr/include/ruby-3.1.0/i686-linux-gnu/rb_mjit_min_header-3.1.1.h moved to /usr/include/ruby-3.1.0/i686-linux-gnu/rb_mjit_min_header-3.1.2.h
  /usr/lib/libruby.so.3.1.1 moved to /usr/lib/libruby.so.3.1.2
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.1 changed symlink target from libruby.so.3.1.1 to libruby.so.3.1.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.1.1 to libruby.so.3.1.2
  /usr/include/ruby-3.1.0/x86_64-linux-gnu/rb_mjit_min_header-3.1.1.h moved to /usr/include/ruby-3.1.0/x86_64-linux-gnu/rb_mjit_min_header-3.1.2.h
  /usr/lib/libruby.so.3.1.1 moved to /usr/lib/libruby.so.3.1.2

--===============4668398675271771063==--

