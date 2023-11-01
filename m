Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97407C18E18
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.8656.1698848704223481086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LJzYPC8F;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Dcxh9yE9;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b8b460368-f6b67b4f-d7fe-4c28-82ce-496c595fc591-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uJOf92NNqNqwVhlOA03oT7SfvKXMJ1nrqwKzibCY8dk=;
	b=LJzYPC8Fmdmyao3hQ0Dj9usPHXRfi2gu+AtNauGkI4ecc87Wt9IAUuFkFJxoR8R3
	7WOPwCdNCfSb+K47Rxnjh7QWJexNthGmxypNgaFK9iWjtLZz9KWvpxsTX1I4+0PxHrV
	q+ADz+xrOpcW/VFVJZCgcllf8LvCvzheTNhilyFY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uJOf92NNqNqwVhlOA03oT7SfvKXMJ1nrqwKzibCY8dk=;
	b=Dcxh9yE9OIjcNIq3HIo4z7NcP+Zr668EARpafNgjgHEpru9LLCWFsUGZgVE4nP9g
	AUmuxijcbKA5tmQDtac1BTTFWOequ4tPxSwzMEwST6lHZ0ZnCEV3zi4LDRrJ64BkAG5
	yZlPzWrtugxwfkBnKbIWM/5RurgojEhQNzs79PQ8=
Content-Type: multipart/mixed; boundary="===============1932080998157489683=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtest-warnings-perl: upgrading to 0.032 SUCCEEDED
Message-ID: <0101018b8b460368-f6b67b4f-d7fe-4c28-82ce-496c595fc591-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189955

--===============1932080998157489683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libtest-warnings-perl* to *0.032* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtest-warnings-perl-upgrade-0.031-0.032.patch
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

-- >8 --
From f46a67e03b585f07340a57f70a7304353f57dca8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 08:05:10 +0000
Subject: [PATCH] libtest-warnings-perl: upgrade 0.031 -> 0.032

---
 .../perl/libtest-warnings-perl_0.031.bb       |  39 ---
 .../perl/libtest-warnings-perl_0.032.bb       | 286 ++++++++++++++++++
 2 files changed, 286 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb
 create mode 100644 meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb

diff --git a/meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb b/meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb
deleted file mode 100644
index e03deaf15f..0000000000
--- a/meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "Test::Warnings - Test for warnings and the lack of them"
-DESCRIPTION = "If you've ever tried to use Test::NoWarnings to confirm there are no \
-warnings generated by your tests, combined with the convenience of \
-\\"done_testing\\" to not have to declare a test count, you'll have discovered \
-that these two features do not play well together, as the test count will \
-be calculated *before* the warnings test is run, resulting in a TAP error. \
-(See "examples/test_nowarnings.pl" in this distribution for a \
-demonstration.)"
-HOMEPAGE = "https://github.com/karenetheridge/Test-Warnings"
-BUGTRACKER = "https://rt.cpan.org/Public/Dist/Display.html?Name=Test-Warnings"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-
-LIC_FILES_CHKSUM = "file://LICENCE;md5=6f2b02f39e7d359efd9525fbc56c84a1"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
-
-SRC_URI[sha256sum] = "1e542909fef305e45563e9878ea1c3b0c7cef1b28bb7ae07eba2e1efabec477b"
-
-S = "${WORKDIR}/Test-Warnings-${PV}"
-
-inherit cpan ptest-perl
-
-RDEPENDS:${PN} += "\
-    perl-module-test-builder \
-"
-
-# Many hidden dependencies and mysterious failures occur without full perl-modules
-RDEPENDS:${PN}-ptest += "perl-modules"
-
-do_install_ptest_perl:append () {
-    cp -r ${B}/t/lib ${D}${PTEST_PATH}/t/
-    chown -R root:root ${D}${PTEST_PATH}/t/lib
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb b/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb
new file mode 100644
index 0000000000..ff199cb63b
--- /dev/null
+++ b/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb
@@ -0,0 +1,286 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENCE
+# +++ LICENCE
+# @@ -270,110 +270,143 @@
+#  That's all there is to it!
+#  
+#  
+# ---- The Artistic License 1.0 ---
+# +--- The Perl Artistic License 1.0 ---
+#  
+#  This software is Copyright (c) 2013 by Karen Etheridge.
+#  
+#  This is free software, licensed under:
+#  
+# -  The Artistic License 1.0
+# -
+# -The Artistic License
+# -
+# -Preamble
+# -
+# -The intent of this document is to state the conditions under which a Package
+# -may be copied, such that the Copyright Holder maintains some semblance of
+# -artistic control over the development of the package, while giving the users of
+# -the package the right to use and distribute the Package in a more-or-less
+# -customary fashion, plus the right to make reasonable modifications.
+# +  The Perl Artistic License 1.0
+# +
+# +
+# +
+# +
+# +
+# +                         The "Artistic License"
+# +
+# +                                Preamble
+# +
+# +The intent of this document is to state the conditions under which a
+# +Package may be copied, such that the Copyright Holder maintains some
+# +semblance of artistic control over the development of the package,
+# +while giving the users of the package the right to use and distribute
+# +the Package in a more-or-less customary fashion, plus the right to make
+# +reasonable modifications.
+#  
+#  Definitions:
+#  
+# -  - "Package" refers to the collection of files distributed by the Copyright
+# -    Holder, and derivatives of that collection of files created through
+# -    textual modification. 
+# -  - "Standard Version" refers to such a Package if it has not been modified,
+# -    or has been modified in accordance with the wishes of the Copyright
+# -    Holder. 
+# -  - "Copyright Holder" is whoever is named in the copyright or copyrights for
+# -    the package. 
+# -  - "You" is you, if you're thinking about copying or distributing this Package.
+# -  - "Reasonable copying fee" is whatever you can justify on the basis of media
+# -    cost, duplication charges, time of people involved, and so on. (You will
+# -    not be required to justify it to the Copyright Holder, but only to the
+# -    computing community at large as a market that must bear the fee.) 
+# -  - "Freely Available" means that no fee is charged for the item itself, though
+# -    there may be fees involved in handling the item. It also means that
+# -    recipients of the item may redistribute it under the same conditions they
+# -    received it. 
+# +        "Package" refers to the collection of files distributed by the
+# +        Copyright Holder, and derivatives of that collection of files
+# +        created through textual modification.
+# +
+# +        "Standard Version" refers to such a Package if it has not been
+# +        modified, or has been modified in accordance with the wishes
+# +        of the Copyright Holder as specified below.
+# +
+# +        "Copyright Holder" is whoever is named in the copyright or
+# +        copyrights for the package.
+# +
+# +        "You" is you, if you're thinking about copying or distributing
+# +        this Package.
+# +
+# +        "Reasonable copying fee" is whatever you can justify on the
+# +        basis of media cost, duplication charges, time of people involved,
+# +        and so on.  (You will not be required to justify it to the
+# +        Copyright Holder, but only to the computing community at large
+# +        as a market that must bear the fee.)
+# +
+# +        "Freely Available" means that no fee is charged for the item
+# +        itself, though there may be fees involved in handling the item.
+# +        It also means that recipients of the item may redistribute it
+# +        under the same conditions they received it.
+#  
+#  1. You may make and give away verbatim copies of the source form of the
+#  Standard Version of this Package without restriction, provided that you
+#  duplicate all of the original copyright notices and associated disclaimers.
+#  
+# -2. You may apply bug fixes, portability fixes and other modifications derived
+# -from the Public Domain or from the Copyright Holder. A Package modified in such
+# -a way shall still be considered the Standard Version.
+# -
+# -3. You may otherwise modify your copy of this Package in any way, provided that
+# -you insert a prominent notice in each changed file stating how and when you
+# -changed that file, and provided that you do at least ONE of the following:
+# -
+# -  a) place your modifications in the Public Domain or otherwise make them
+# -     Freely Available, such as by posting said modifications to Usenet or an
+# -     equivalent medium, or placing the modifications on a major archive site
+# -     such as ftp.uu.net, or by allowing the Copyright Holder to include your
+# -     modifications in the Standard Version of the Package.
+# -
+# -  b) use the modified Package only within your corporation or organization.
+# -
+# -  c) rename any non-standard executables so the names do not conflict with
+# -     standard executables, which must also be provided, and provide a separate
+# -     manual page for each non-standard executable that clearly documents how it
+# -     differs from the Standard Version.
+# -
+# -  d) make other distribution arrangements with the Copyright Holder.
+# -
+# -4. You may distribute the programs of this Package in object code or executable
+# -form, provided that you do at least ONE of the following:
+# -
+# -  a) distribute a Standard Version of the executables and library files,
+# -     together with instructions (in the manual page or equivalent) on where to
+# -     get the Standard Version.
+# -
+# -  b) accompany the distribution with the machine-readable source of the Package
+# -     with your modifications.
+# -
+# -  c) accompany any non-standard executables with their corresponding Standard
+# -     Version executables, giving the non-standard executables non-standard
+# -     names, and clearly documenting the differences in manual pages (or
+# -     equivalent), together with instructions on where to get the Standard
+# -     Version.
+# -
+# -  d) make other distribution arrangements with the Copyright Holder.
+# +2. You may apply bug fixes, portability fixes and other modifications
+# +derived from the Public Domain or from the Copyright Holder.  A Package
+# +modified in such a way shall still be considered the Standard Version.
+# +
+# +3. You may otherwise modify your copy of this Package in any way, provided
+# +that you insert a prominent notice in each changed file stating how and
+# +when you changed that file, and provided that you do at least ONE of the
+# +following:
+# +
+# +    a) place your modifications in the Public Domain or otherwise make them
+# +    Freely Available, such as by posting said modifications to Usenet or
+# +    an equivalent medium, or placing the modifications on a major archive
+# +    site such as uunet.uu.net, or by allowing the Copyright Holder to include
+# +    your modifications in the Standard Version of the Package.
+# +
+# +    b) use the modified Package only within your corporation or organization.
+# +
+# +    c) rename any non-standard executables so the names do not conflict
+# +    with standard executables, which must also be provided, and provide
+# +    a separate manual page for each non-standard executable that clearly
+# +    documents how it differs from the Standard Version.
+# +
+# +    d) make other distribution arrangements with the Copyright Holder.
+# +
+# +4. You may distribute the programs of this Package in object code or
+# +executable form, provided that you do at least ONE of the following:
+# +
+# +    a) distribute a Standard Version of the executables and library files,
+# +    together with instructions (in the manual page or equivalent) on where
+# +    to get the Standard Version.
+# +
+# +    b) accompany the distribution with the machine-readable source of
+# +    the Package with your modifications.
+# +
+# +    c) give non-standard executables non-standard names, and clearly
+# +    document the differences in manual pages (or equivalent), together
+# +    with instructions on where to get the Standard Version.
+# +
+# +    d) make other distribution arrangements with the Copyright Holder.
+#  
+#  5. You may charge a reasonable copying fee for any distribution of this
+# -Package.  You may charge any fee you choose for support of this Package. You
+# -may not charge a fee for this Package itself. However, you may distribute this
+# -Package in aggregate with other (possibly commercial) programs as part of a
+# -larger (possibly commercial) software distribution provided that you do not
+# -advertise this Package as a product of your own.
+# -
+# -6. The scripts and library files supplied as input to or produced as output
+# -from the programs of this Package do not automatically fall under the copyright
+# -of this Package, but belong to whomever generated them, and may be sold
+# -commercially, and may be aggregated with this Package.
+# -
+# -7. C or perl subroutines supplied by you and linked into this Package shall not
+# -be considered part of this Package.
+# -
+# -8. The name of the Copyright Holder may not be used to endorse or promote
+# +Package.  You may charge any fee you choose for support of this
+# +Package.  You may not charge a fee for this Package itself.  However,
+# +you may distribute this Package in aggregate with other (possibly
+# +commercial) programs as part of a larger (possibly commercial) software
+# +distribution provided that you do not advertise this Package as a
+# +product of your own.  You may embed this Package's interpreter within
+# +an executable of yours (by linking); this shall be construed as a mere
+# +form of aggregation, provided that the complete Standard Version of the
+# +interpreter is so embedded.
+# +
+# +6. The scripts and library files supplied as input to or produced as
+# +output from the programs of this Package do not automatically fall
+# +under the copyright of this Package, but belong to whoever generated
+# +them, and may be sold commercially, and may be aggregated with this
+# +Package.  If such scripts or library files are aggregated with this
+# +Package via the so-called "undump" or "unexec" methods of producing a
+# +binary executable image, then distribution of such an image shall
+# +neither be construed as a distribution of this Package nor shall it
+# +fall under the restrictions of Paragraphs 3 and 4, provided that you do
+# +not represent such an executable image as a Standard Version of this
+# +Package.
+# +
+# +7. C subroutines (or comparably compiled subroutines in other
+# +languages) supplied by you and linked into this Package in order to
+# +emulate subroutines and variables of the language defined by this
+# +Package shall not be considered part of this Package, but are the
+# +equivalent of input as in Paragraph 6, provided these subroutines do
+# +not change the language in any way that would cause it to fail the
+# +regression tests for the language.
+# +
+# +8. Aggregation of this Package with a commercial distribution is always
+# +permitted provided that the use of this Package is embedded; that is,
+# +when no overt attempt is made to make this Package's interfaces visible
+# +to the end user of the commercial distribution.  Such use shall not be
+# +construed as a distribution of this Package.
+# +
+# +9. The name of the Copyright Holder may not be used to endorse or promote
+#  products derived from this software without specific prior written permission.
+#  
+# -9. THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
+# -WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
+# -MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+# -
+# -The End
+# -
+# +10. THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
+# +IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
+# +WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+# +
+# +                                The End
+# +
+# 
+#
+
+# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Test::Warnings - Test for warnings and the lack of them"
+DESCRIPTION = "If you've ever tried to use Test::NoWarnings to confirm there are no \
+warnings generated by your tests, combined with the convenience of \
+\\"done_testing\\" to not have to declare a test count, you'll have discovered \
+that these two features do not play well together, as the test count will \
+be calculated *before* the warnings test is run, resulting in a TAP error. \
+(See "examples/test_nowarnings.pl" in this distribution for a \
+demonstration.)"
+HOMEPAGE = "https://github.com/karenetheridge/Test-Warnings"
+BUGTRACKER = "https://rt.cpan.org/Public/Dist/Display.html?Name=Test-Warnings"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+
+LIC_FILES_CHKSUM = "file://LICENCE;md5=f98106ac3cc05d9cbebcdb8fbf7b7815"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "4727dae2416e9f07e41e2dc3a9143ba6affc1ec57652117c99d50038e313e9d9"
+
+S = "${WORKDIR}/Test-Warnings-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN} += "\
+    perl-module-test-builder \
+"
+
+# Many hidden dependencies and mysterious failures occur without full perl-modules
+RDEPENDS:${PN}-ptest += "perl-modules"
+
+do_install_ptest_perl:append () {
+    cp -r ${B}/t/lib ${D}${PTEST_PATH}/t/
+    chown -R root:root ${D}${PTEST_PATH}/t/lib
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


--===============1932080998157489683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libtest-warnings-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-Warnings-0.031.tar.gz file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-Warnings-0.032.tar.gz file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/libtest-warnings-perl: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-64-poky-linux/libtest-warnings-perl: PV changed from "0.031" to "0.032"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dbg: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dbg: PV changed from "0.031" to "0.032"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dev: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dev: PV changed from "0.031" to "0.032"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-doc: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-doc: PV changed from "0.031" to "0.032"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-doc: PKGSIZE changed from 13383 to 13754 (+3%)
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-locale: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-locale: PV changed from "0.031" to "0.032"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: PV changed from "0.031" to "0.032"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: PKGSIZE changed from 36453 to 37345 (+2%)
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: FILELIST: added "/usr/lib/libtest-warnings-perl/ptest/t/24-only-report-warnings.t"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-src: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-src: PV changed from "0.031" to "0.032"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-staticdev: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-staticdev: PV changed from "0.031" to "0.032"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PV changed from "0.031" to "0.032"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PKGSIZE changed from 14635 to 15277 (+4%)

--===============1932080998157489683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: FILELIST: added "/usr/lib/libtest-warnings-perl/ptest/t/24-only-report-warnings.t"

--===============1932080998157489683==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtest-warnings-perl-upgrade-0.031-0.032.patch"

RnJvbSBmNDZhNjdlMDNiNTg1ZjA3MzQwYTU3ZjcwYTczMDQzNTNmNTdkY2E4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwODowNToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnRlc3Qtd2FybmluZ3MtcGVybDogdXBncmFkZSAwLjAzMSAtPiAwLjAzMgoKLS0tCiAuLi4vcGVy
bC9saWJ0ZXN0LXdhcm5pbmdzLXBlcmxfMC4wMzEuYmIgICAgICAgfCAgMzkgLS0tCiAuLi4vcGVy
bC9saWJ0ZXN0LXdhcm5pbmdzLXBlcmxfMC4wMzIuYmIgICAgICAgfCAyODYgKysrKysrKysrKysr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI4NiBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMo
LSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0
LXdhcm5pbmdzLXBlcmxfMC4wMzEuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9saWJ0ZXN0LXdhcm5pbmdzLXBlcmxfMC4wMzIuYmIKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LXdhcm5pbmdzLXBlcmxfMC4wMzEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LXdhcm5pbmdzLXBlcmxfMC4w
MzEuYmIKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGUwM2RlYWYxNWYuLjAwMDAwMDAw
MDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC13YXJuaW5ncy1wZXJs
XzAuMDMxLmJiCisrKyAvZGV2L251bGwKQEAgLTEsMzkgKzAsMCBAQAotIyBDb3B5cmlnaHQgKEMp
IDIwMjAgSmVucyBSZWhzYWNrIDxzbm9AbmV0YnNkLm9yZz4KLSMgUmVsZWFzZWQgdW5kZXIgdGhl
IE1JVCBsaWNlbnNlIChzZWUgQ09QWUlORy5NSVQgZm9yIHRoZSB0ZXJtcykKLQotU1VNTUFSWSA9
ICJUZXN0OjpXYXJuaW5ncyAtIFRlc3QgZm9yIHdhcm5pbmdzIGFuZCB0aGUgbGFjayBvZiB0aGVt
IgotREVTQ1JJUFRJT04gPSAiSWYgeW91J3ZlIGV2ZXIgdHJpZWQgdG8gdXNlIFRlc3Q6Ok5vV2Fy
bmluZ3MgdG8gY29uZmlybSB0aGVyZSBhcmUgbm8gXAotd2FybmluZ3MgZ2VuZXJhdGVkIGJ5IHlv
dXIgdGVzdHMsIGNvbWJpbmVkIHdpdGggdGhlIGNvbnZlbmllbmNlIG9mIFwKLVxcImRvbmVfdGVz
dGluZ1xcIiB0byBub3QgaGF2ZSB0byBkZWNsYXJlIGEgdGVzdCBjb3VudCwgeW91J2xsIGhhdmUg
ZGlzY292ZXJlZCBcCi10aGF0IHRoZXNlIHR3byBmZWF0dXJlcyBkbyBub3QgcGxheSB3ZWxsIHRv
Z2V0aGVyLCBhcyB0aGUgdGVzdCBjb3VudCB3aWxsIFwKLWJlIGNhbGN1bGF0ZWQgKmJlZm9yZSog
dGhlIHdhcm5pbmdzIHRlc3QgaXMgcnVuLCByZXN1bHRpbmcgaW4gYSBUQVAgZXJyb3IuIFwKLShT
ZWUgImV4YW1wbGVzL3Rlc3Rfbm93YXJuaW5ncy5wbCIgaW4gdGhpcyBkaXN0cmlidXRpb24gZm9y
IGEgXAotZGVtb25zdHJhdGlvbi4pIgotSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2th
cmVuZXRoZXJpZGdlL1Rlc3QtV2FybmluZ3MiCi1CVUdUUkFDS0VSID0gImh0dHBzOi8vcnQuY3Bh
bi5vcmcvUHVibGljL0Rpc3QvRGlzcGxheS5odG1sP05hbWU9VGVzdC1XYXJuaW5ncyIKLVNFQ1RJ
T04gPSAibGlicyIKLUxJQ0VOU0UgPSAiQXJ0aXN0aWMtMS4wIHwgR1BMLTEuMC1vci1sYXRlciIK
LQotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRTttZDU9NmYyYjAyZjM5ZTdkMzU5
ZWZkOTUyNWZiYzU2Yzg0YTEiCi0KLVNSQ19VUkkgPSAiJHtDUEFOX01JUlJPUn0vYXV0aG9ycy9p
ZC9FL0VUL0VUSEVSL1Rlc3QtV2FybmluZ3MtJHtQVn0udGFyLmd6IgotCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMWU1NDI5MDlmZWYzMDVlNDU1NjNlOTg3OGVhMWMzYjBjN2NlZjFiMjhiYjdhZTA3
ZWJhMmUxZWZhYmVjNDc3YiIKLQotUyA9ICIke1dPUktESVJ9L1Rlc3QtV2FybmluZ3MtJHtQVn0i
Ci0KLWluaGVyaXQgY3BhbiBwdGVzdC1wZXJsCi0KLVJERVBFTkRTOiR7UE59ICs9ICJcCi0gICAg
cGVybC1tb2R1bGUtdGVzdC1idWlsZGVyIFwKLSIKLQotIyBNYW55IGhpZGRlbiBkZXBlbmRlbmNp
ZXMgYW5kIG15c3RlcmlvdXMgZmFpbHVyZXMgb2NjdXIgd2l0aG91dCBmdWxsIHBlcmwtbW9kdWxl
cwotUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0gInBlcmwtbW9kdWxlcyIKLQotZG9faW5zdGFsbF9w
dGVzdF9wZXJsOmFwcGVuZCAoKSB7Ci0gICAgY3AgLXIgJHtCfS90L2xpYiAke0R9JHtQVEVTVF9Q
QVRIfS90LwotICAgIGNob3duIC1SIHJvb3Q6cm9vdCAke0R9JHtQVEVTVF9QQVRIfS90L2xpYgot
fQotCi1CQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LXdhcm5pbmdzLXBlcmxfMC4wMzIuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LXdhcm5pbmdzLXBlcmxfMC4wMzIuYmIK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZmYxOTljYjYzYgotLS0gL2Rl
di9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnRlc3Qtd2FybmluZ3Mt
cGVybF8wLjAzMi5iYgpAQCAtMCwwICsxLDI4NiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19D
SEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBU
aGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5l
dyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVl
ZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2
aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBj
b3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJ
Q0VOQ0UKKyMgKysrIExJQ0VOQ0UKKyMgQEAgLTI3MCwxMTAgKzI3MCwxNDMgQEAKKyMgIFRoYXQn
cyBhbGwgdGhlcmUgaXMgdG8gaXQhCisjICAKKyMgIAorIyAtLS0tIFRoZSBBcnRpc3RpYyBMaWNl
bnNlIDEuMCAtLS0KKyMgKy0tLSBUaGUgUGVybCBBcnRpc3RpYyBMaWNlbnNlIDEuMCAtLS0KKyMg
IAorIyAgVGhpcyBzb2Z0d2FyZSBpcyBDb3B5cmlnaHQgKGMpIDIwMTMgYnkgS2FyZW4gRXRoZXJp
ZGdlLgorIyAgCisjICBUaGlzIGlzIGZyZWUgc29mdHdhcmUsIGxpY2Vuc2VkIHVuZGVyOgorIyAg
CisjIC0gIFRoZSBBcnRpc3RpYyBMaWNlbnNlIDEuMAorIyAtCisjIC1UaGUgQXJ0aXN0aWMgTGlj
ZW5zZQorIyAtCisjIC1QcmVhbWJsZQorIyAtCisjIC1UaGUgaW50ZW50IG9mIHRoaXMgZG9jdW1l
bnQgaXMgdG8gc3RhdGUgdGhlIGNvbmRpdGlvbnMgdW5kZXIgd2hpY2ggYSBQYWNrYWdlCisjIC1t
YXkgYmUgY29waWVkLCBzdWNoIHRoYXQgdGhlIENvcHlyaWdodCBIb2xkZXIgbWFpbnRhaW5zIHNv
bWUgc2VtYmxhbmNlIG9mCisjIC1hcnRpc3RpYyBjb250cm9sIG92ZXIgdGhlIGRldmVsb3BtZW50
IG9mIHRoZSBwYWNrYWdlLCB3aGlsZSBnaXZpbmcgdGhlIHVzZXJzIG9mCisjIC10aGUgcGFja2Fn
ZSB0aGUgcmlnaHQgdG8gdXNlIGFuZCBkaXN0cmlidXRlIHRoZSBQYWNrYWdlIGluIGEgbW9yZS1v
ci1sZXNzCisjIC1jdXN0b21hcnkgZmFzaGlvbiwgcGx1cyB0aGUgcmlnaHQgdG8gbWFrZSByZWFz
b25hYmxlIG1vZGlmaWNhdGlvbnMuCisjICsgIFRoZSBQZXJsIEFydGlzdGljIExpY2Vuc2UgMS4w
CisjICsKKyMgKworIyArCisjICsKKyMgKworIyArICAgICAgICAgICAgICAgICAgICAgICAgIFRo
ZSAiQXJ0aXN0aWMgTGljZW5zZSIKKyMgKworIyArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBQcmVhbWJsZQorIyArCisjICtUaGUgaW50ZW50IG9mIHRoaXMgZG9jdW1lbnQgaXMgdG8g
c3RhdGUgdGhlIGNvbmRpdGlvbnMgdW5kZXIgd2hpY2ggYQorIyArUGFja2FnZSBtYXkgYmUgY29w
aWVkLCBzdWNoIHRoYXQgdGhlIENvcHlyaWdodCBIb2xkZXIgbWFpbnRhaW5zIHNvbWUKKyMgK3Nl
bWJsYW5jZSBvZiBhcnRpc3RpYyBjb250cm9sIG92ZXIgdGhlIGRldmVsb3BtZW50IG9mIHRoZSBw
YWNrYWdlLAorIyArd2hpbGUgZ2l2aW5nIHRoZSB1c2VycyBvZiB0aGUgcGFja2FnZSB0aGUgcmln
aHQgdG8gdXNlIGFuZCBkaXN0cmlidXRlCisjICt0aGUgUGFja2FnZSBpbiBhIG1vcmUtb3ItbGVz
cyBjdXN0b21hcnkgZmFzaGlvbiwgcGx1cyB0aGUgcmlnaHQgdG8gbWFrZQorIyArcmVhc29uYWJs
ZSBtb2RpZmljYXRpb25zLgorIyAgCisjICBEZWZpbml0aW9uczoKKyMgIAorIyAtICAtICJQYWNr
YWdlIiByZWZlcnMgdG8gdGhlIGNvbGxlY3Rpb24gb2YgZmlsZXMgZGlzdHJpYnV0ZWQgYnkgdGhl
IENvcHlyaWdodAorIyAtICAgIEhvbGRlciwgYW5kIGRlcml2YXRpdmVzIG9mIHRoYXQgY29sbGVj
dGlvbiBvZiBmaWxlcyBjcmVhdGVkIHRocm91Z2gKKyMgLSAgICB0ZXh0dWFsIG1vZGlmaWNhdGlv
bi4gCisjIC0gIC0gIlN0YW5kYXJkIFZlcnNpb24iIHJlZmVycyB0byBzdWNoIGEgUGFja2FnZSBp
ZiBpdCBoYXMgbm90IGJlZW4gbW9kaWZpZWQsCisjIC0gICAgb3IgaGFzIGJlZW4gbW9kaWZpZWQg
aW4gYWNjb3JkYW5jZSB3aXRoIHRoZSB3aXNoZXMgb2YgdGhlIENvcHlyaWdodAorIyAtICAgIEhv
bGRlci4gCisjIC0gIC0gIkNvcHlyaWdodCBIb2xkZXIiIGlzIHdob2V2ZXIgaXMgbmFtZWQgaW4g
dGhlIGNvcHlyaWdodCBvciBjb3B5cmlnaHRzIGZvcgorIyAtICAgIHRoZSBwYWNrYWdlLiAKKyMg
LSAgLSAiWW91IiBpcyB5b3UsIGlmIHlvdSdyZSB0aGlua2luZyBhYm91dCBjb3B5aW5nIG9yIGRp
c3RyaWJ1dGluZyB0aGlzIFBhY2thZ2UuCisjIC0gIC0gIlJlYXNvbmFibGUgY29weWluZyBmZWUi
IGlzIHdoYXRldmVyIHlvdSBjYW4ganVzdGlmeSBvbiB0aGUgYmFzaXMgb2YgbWVkaWEKKyMgLSAg
ICBjb3N0LCBkdXBsaWNhdGlvbiBjaGFyZ2VzLCB0aW1lIG9mIHBlb3BsZSBpbnZvbHZlZCwgYW5k
IHNvIG9uLiAoWW91IHdpbGwKKyMgLSAgICBub3QgYmUgcmVxdWlyZWQgdG8ganVzdGlmeSBpdCB0
byB0aGUgQ29weXJpZ2h0IEhvbGRlciwgYnV0IG9ubHkgdG8gdGhlCisjIC0gICAgY29tcHV0aW5n
IGNvbW11bml0eSBhdCBsYXJnZSBhcyBhIG1hcmtldCB0aGF0IG11c3QgYmVhciB0aGUgZmVlLikg
CisjIC0gIC0gIkZyZWVseSBBdmFpbGFibGUiIG1lYW5zIHRoYXQgbm8gZmVlIGlzIGNoYXJnZWQg
Zm9yIHRoZSBpdGVtIGl0c2VsZiwgdGhvdWdoCisjIC0gICAgdGhlcmUgbWF5IGJlIGZlZXMgaW52
b2x2ZWQgaW4gaGFuZGxpbmcgdGhlIGl0ZW0uIEl0IGFsc28gbWVhbnMgdGhhdAorIyAtICAgIHJl
Y2lwaWVudHMgb2YgdGhlIGl0ZW0gbWF5IHJlZGlzdHJpYnV0ZSBpdCB1bmRlciB0aGUgc2FtZSBj
b25kaXRpb25zIHRoZXkKKyMgLSAgICByZWNlaXZlZCBpdC4gCisjICsgICAgICAgICJQYWNrYWdl
IiByZWZlcnMgdG8gdGhlIGNvbGxlY3Rpb24gb2YgZmlsZXMgZGlzdHJpYnV0ZWQgYnkgdGhlCisj
ICsgICAgICAgIENvcHlyaWdodCBIb2xkZXIsIGFuZCBkZXJpdmF0aXZlcyBvZiB0aGF0IGNvbGxl
Y3Rpb24gb2YgZmlsZXMKKyMgKyAgICAgICAgY3JlYXRlZCB0aHJvdWdoIHRleHR1YWwgbW9kaWZp
Y2F0aW9uLgorIyArCisjICsgICAgICAgICJTdGFuZGFyZCBWZXJzaW9uIiByZWZlcnMgdG8gc3Vj
aCBhIFBhY2thZ2UgaWYgaXQgaGFzIG5vdCBiZWVuCisjICsgICAgICAgIG1vZGlmaWVkLCBvciBo
YXMgYmVlbiBtb2RpZmllZCBpbiBhY2NvcmRhbmNlIHdpdGggdGhlIHdpc2hlcworIyArICAgICAg
ICBvZiB0aGUgQ29weXJpZ2h0IEhvbGRlciBhcyBzcGVjaWZpZWQgYmVsb3cuCisjICsKKyMgKyAg
ICAgICAgIkNvcHlyaWdodCBIb2xkZXIiIGlzIHdob2V2ZXIgaXMgbmFtZWQgaW4gdGhlIGNvcHly
aWdodCBvcgorIyArICAgICAgICBjb3B5cmlnaHRzIGZvciB0aGUgcGFja2FnZS4KKyMgKworIyAr
ICAgICAgICAiWW91IiBpcyB5b3UsIGlmIHlvdSdyZSB0aGlua2luZyBhYm91dCBjb3B5aW5nIG9y
IGRpc3RyaWJ1dGluZworIyArICAgICAgICB0aGlzIFBhY2thZ2UuCisjICsKKyMgKyAgICAgICAg
IlJlYXNvbmFibGUgY29weWluZyBmZWUiIGlzIHdoYXRldmVyIHlvdSBjYW4ganVzdGlmeSBvbiB0
aGUKKyMgKyAgICAgICAgYmFzaXMgb2YgbWVkaWEgY29zdCwgZHVwbGljYXRpb24gY2hhcmdlcywg
dGltZSBvZiBwZW9wbGUgaW52b2x2ZWQsCisjICsgICAgICAgIGFuZCBzbyBvbi4gIChZb3Ugd2ls
bCBub3QgYmUgcmVxdWlyZWQgdG8ganVzdGlmeSBpdCB0byB0aGUKKyMgKyAgICAgICAgQ29weXJp
Z2h0IEhvbGRlciwgYnV0IG9ubHkgdG8gdGhlIGNvbXB1dGluZyBjb21tdW5pdHkgYXQgbGFyZ2UK
KyMgKyAgICAgICAgYXMgYSBtYXJrZXQgdGhhdCBtdXN0IGJlYXIgdGhlIGZlZS4pCisjICsKKyMg
KyAgICAgICAgIkZyZWVseSBBdmFpbGFibGUiIG1lYW5zIHRoYXQgbm8gZmVlIGlzIGNoYXJnZWQg
Zm9yIHRoZSBpdGVtCisjICsgICAgICAgIGl0c2VsZiwgdGhvdWdoIHRoZXJlIG1heSBiZSBmZWVz
IGludm9sdmVkIGluIGhhbmRsaW5nIHRoZSBpdGVtLgorIyArICAgICAgICBJdCBhbHNvIG1lYW5z
IHRoYXQgcmVjaXBpZW50cyBvZiB0aGUgaXRlbSBtYXkgcmVkaXN0cmlidXRlIGl0CisjICsgICAg
ICAgIHVuZGVyIHRoZSBzYW1lIGNvbmRpdGlvbnMgdGhleSByZWNlaXZlZCBpdC4KKyMgIAorIyAg
MS4gWW91IG1heSBtYWtlIGFuZCBnaXZlIGF3YXkgdmVyYmF0aW0gY29waWVzIG9mIHRoZSBzb3Vy
Y2UgZm9ybSBvZiB0aGUKKyMgIFN0YW5kYXJkIFZlcnNpb24gb2YgdGhpcyBQYWNrYWdlIHdpdGhv
dXQgcmVzdHJpY3Rpb24sIHByb3ZpZGVkIHRoYXQgeW91CisjICBkdXBsaWNhdGUgYWxsIG9mIHRo
ZSBvcmlnaW5hbCBjb3B5cmlnaHQgbm90aWNlcyBhbmQgYXNzb2NpYXRlZCBkaXNjbGFpbWVycy4K
KyMgIAorIyAtMi4gWW91IG1heSBhcHBseSBidWcgZml4ZXMsIHBvcnRhYmlsaXR5IGZpeGVzIGFu
ZCBvdGhlciBtb2RpZmljYXRpb25zIGRlcml2ZWQKKyMgLWZyb20gdGhlIFB1YmxpYyBEb21haW4g
b3IgZnJvbSB0aGUgQ29weXJpZ2h0IEhvbGRlci4gQSBQYWNrYWdlIG1vZGlmaWVkIGluIHN1Y2gK
KyMgLWEgd2F5IHNoYWxsIHN0aWxsIGJlIGNvbnNpZGVyZWQgdGhlIFN0YW5kYXJkIFZlcnNpb24u
CisjIC0KKyMgLTMuIFlvdSBtYXkgb3RoZXJ3aXNlIG1vZGlmeSB5b3VyIGNvcHkgb2YgdGhpcyBQ
YWNrYWdlIGluIGFueSB3YXksIHByb3ZpZGVkIHRoYXQKKyMgLXlvdSBpbnNlcnQgYSBwcm9taW5l
bnQgbm90aWNlIGluIGVhY2ggY2hhbmdlZCBmaWxlIHN0YXRpbmcgaG93IGFuZCB3aGVuIHlvdQor
IyAtY2hhbmdlZCB0aGF0IGZpbGUsIGFuZCBwcm92aWRlZCB0aGF0IHlvdSBkbyBhdCBsZWFzdCBP
TkUgb2YgdGhlIGZvbGxvd2luZzoKKyMgLQorIyAtICBhKSBwbGFjZSB5b3VyIG1vZGlmaWNhdGlv
bnMgaW4gdGhlIFB1YmxpYyBEb21haW4gb3Igb3RoZXJ3aXNlIG1ha2UgdGhlbQorIyAtICAgICBG
cmVlbHkgQXZhaWxhYmxlLCBzdWNoIGFzIGJ5IHBvc3Rpbmcgc2FpZCBtb2RpZmljYXRpb25zIHRv
IFVzZW5ldCBvciBhbgorIyAtICAgICBlcXVpdmFsZW50IG1lZGl1bSwgb3IgcGxhY2luZyB0aGUg
bW9kaWZpY2F0aW9ucyBvbiBhIG1ham9yIGFyY2hpdmUgc2l0ZQorIyAtICAgICBzdWNoIGFzIGZ0
cC51dS5uZXQsIG9yIGJ5IGFsbG93aW5nIHRoZSBDb3B5cmlnaHQgSG9sZGVyIHRvIGluY2x1ZGUg
eW91cgorIyAtICAgICBtb2RpZmljYXRpb25zIGluIHRoZSBTdGFuZGFyZCBWZXJzaW9uIG9mIHRo
ZSBQYWNrYWdlLgorIyAtCisjIC0gIGIpIHVzZSB0aGUgbW9kaWZpZWQgUGFja2FnZSBvbmx5IHdp
dGhpbiB5b3VyIGNvcnBvcmF0aW9uIG9yIG9yZ2FuaXphdGlvbi4KKyMgLQorIyAtICBjKSByZW5h
bWUgYW55IG5vbi1zdGFuZGFyZCBleGVjdXRhYmxlcyBzbyB0aGUgbmFtZXMgZG8gbm90IGNvbmZs
aWN0IHdpdGgKKyMgLSAgICAgc3RhbmRhcmQgZXhlY3V0YWJsZXMsIHdoaWNoIG11c3QgYWxzbyBi
ZSBwcm92aWRlZCwgYW5kIHByb3ZpZGUgYSBzZXBhcmF0ZQorIyAtICAgICBtYW51YWwgcGFnZSBm
b3IgZWFjaCBub24tc3RhbmRhcmQgZXhlY3V0YWJsZSB0aGF0IGNsZWFybHkgZG9jdW1lbnRzIGhv
dyBpdAorIyAtICAgICBkaWZmZXJzIGZyb20gdGhlIFN0YW5kYXJkIFZlcnNpb24uCisjIC0KKyMg
LSAgZCkgbWFrZSBvdGhlciBkaXN0cmlidXRpb24gYXJyYW5nZW1lbnRzIHdpdGggdGhlIENvcHly
aWdodCBIb2xkZXIuCisjIC0KKyMgLTQuIFlvdSBtYXkgZGlzdHJpYnV0ZSB0aGUgcHJvZ3JhbXMg
b2YgdGhpcyBQYWNrYWdlIGluIG9iamVjdCBjb2RlIG9yIGV4ZWN1dGFibGUKKyMgLWZvcm0sIHBy
b3ZpZGVkIHRoYXQgeW91IGRvIGF0IGxlYXN0IE9ORSBvZiB0aGUgZm9sbG93aW5nOgorIyAtCisj
IC0gIGEpIGRpc3RyaWJ1dGUgYSBTdGFuZGFyZCBWZXJzaW9uIG9mIHRoZSBleGVjdXRhYmxlcyBh
bmQgbGlicmFyeSBmaWxlcywKKyMgLSAgICAgdG9nZXRoZXIgd2l0aCBpbnN0cnVjdGlvbnMgKGlu
IHRoZSBtYW51YWwgcGFnZSBvciBlcXVpdmFsZW50KSBvbiB3aGVyZSB0bworIyAtICAgICBnZXQg
dGhlIFN0YW5kYXJkIFZlcnNpb24uCisjIC0KKyMgLSAgYikgYWNjb21wYW55IHRoZSBkaXN0cmli
dXRpb24gd2l0aCB0aGUgbWFjaGluZS1yZWFkYWJsZSBzb3VyY2Ugb2YgdGhlIFBhY2thZ2UKKyMg
LSAgICAgd2l0aCB5b3VyIG1vZGlmaWNhdGlvbnMuCisjIC0KKyMgLSAgYykgYWNjb21wYW55IGFu
eSBub24tc3RhbmRhcmQgZXhlY3V0YWJsZXMgd2l0aCB0aGVpciBjb3JyZXNwb25kaW5nIFN0YW5k
YXJkCisjIC0gICAgIFZlcnNpb24gZXhlY3V0YWJsZXMsIGdpdmluZyB0aGUgbm9uLXN0YW5kYXJk
IGV4ZWN1dGFibGVzIG5vbi1zdGFuZGFyZAorIyAtICAgICBuYW1lcywgYW5kIGNsZWFybHkgZG9j
dW1lbnRpbmcgdGhlIGRpZmZlcmVuY2VzIGluIG1hbnVhbCBwYWdlcyAob3IKKyMgLSAgICAgZXF1
aXZhbGVudCksIHRvZ2V0aGVyIHdpdGggaW5zdHJ1Y3Rpb25zIG9uIHdoZXJlIHRvIGdldCB0aGUg
U3RhbmRhcmQKKyMgLSAgICAgVmVyc2lvbi4KKyMgLQorIyAtICBkKSBtYWtlIG90aGVyIGRpc3Ry
aWJ1dGlvbiBhcnJhbmdlbWVudHMgd2l0aCB0aGUgQ29weXJpZ2h0IEhvbGRlci4KKyMgKzIuIFlv
dSBtYXkgYXBwbHkgYnVnIGZpeGVzLCBwb3J0YWJpbGl0eSBmaXhlcyBhbmQgb3RoZXIgbW9kaWZp
Y2F0aW9ucworIyArZGVyaXZlZCBmcm9tIHRoZSBQdWJsaWMgRG9tYWluIG9yIGZyb20gdGhlIENv
cHlyaWdodCBIb2xkZXIuICBBIFBhY2thZ2UKKyMgK21vZGlmaWVkIGluIHN1Y2ggYSB3YXkgc2hh
bGwgc3RpbGwgYmUgY29uc2lkZXJlZCB0aGUgU3RhbmRhcmQgVmVyc2lvbi4KKyMgKworIyArMy4g
WW91IG1heSBvdGhlcndpc2UgbW9kaWZ5IHlvdXIgY29weSBvZiB0aGlzIFBhY2thZ2UgaW4gYW55
IHdheSwgcHJvdmlkZWQKKyMgK3RoYXQgeW91IGluc2VydCBhIHByb21pbmVudCBub3RpY2UgaW4g
ZWFjaCBjaGFuZ2VkIGZpbGUgc3RhdGluZyBob3cgYW5kCisjICt3aGVuIHlvdSBjaGFuZ2VkIHRo
YXQgZmlsZSwgYW5kIHByb3ZpZGVkIHRoYXQgeW91IGRvIGF0IGxlYXN0IE9ORSBvZiB0aGUKKyMg
K2ZvbGxvd2luZzoKKyMgKworIyArICAgIGEpIHBsYWNlIHlvdXIgbW9kaWZpY2F0aW9ucyBpbiB0
aGUgUHVibGljIERvbWFpbiBvciBvdGhlcndpc2UgbWFrZSB0aGVtCisjICsgICAgRnJlZWx5IEF2
YWlsYWJsZSwgc3VjaCBhcyBieSBwb3N0aW5nIHNhaWQgbW9kaWZpY2F0aW9ucyB0byBVc2VuZXQg
b3IKKyMgKyAgICBhbiBlcXVpdmFsZW50IG1lZGl1bSwgb3IgcGxhY2luZyB0aGUgbW9kaWZpY2F0
aW9ucyBvbiBhIG1ham9yIGFyY2hpdmUKKyMgKyAgICBzaXRlIHN1Y2ggYXMgdXVuZXQudXUubmV0
LCBvciBieSBhbGxvd2luZyB0aGUgQ29weXJpZ2h0IEhvbGRlciB0byBpbmNsdWRlCisjICsgICAg
eW91ciBtb2RpZmljYXRpb25zIGluIHRoZSBTdGFuZGFyZCBWZXJzaW9uIG9mIHRoZSBQYWNrYWdl
LgorIyArCisjICsgICAgYikgdXNlIHRoZSBtb2RpZmllZCBQYWNrYWdlIG9ubHkgd2l0aGluIHlv
dXIgY29ycG9yYXRpb24gb3Igb3JnYW5pemF0aW9uLgorIyArCisjICsgICAgYykgcmVuYW1lIGFu
eSBub24tc3RhbmRhcmQgZXhlY3V0YWJsZXMgc28gdGhlIG5hbWVzIGRvIG5vdCBjb25mbGljdAor
IyArICAgIHdpdGggc3RhbmRhcmQgZXhlY3V0YWJsZXMsIHdoaWNoIG11c3QgYWxzbyBiZSBwcm92
aWRlZCwgYW5kIHByb3ZpZGUKKyMgKyAgICBhIHNlcGFyYXRlIG1hbnVhbCBwYWdlIGZvciBlYWNo
IG5vbi1zdGFuZGFyZCBleGVjdXRhYmxlIHRoYXQgY2xlYXJseQorIyArICAgIGRvY3VtZW50cyBo
b3cgaXQgZGlmZmVycyBmcm9tIHRoZSBTdGFuZGFyZCBWZXJzaW9uLgorIyArCisjICsgICAgZCkg
bWFrZSBvdGhlciBkaXN0cmlidXRpb24gYXJyYW5nZW1lbnRzIHdpdGggdGhlIENvcHlyaWdodCBI
b2xkZXIuCisjICsKKyMgKzQuIFlvdSBtYXkgZGlzdHJpYnV0ZSB0aGUgcHJvZ3JhbXMgb2YgdGhp
cyBQYWNrYWdlIGluIG9iamVjdCBjb2RlIG9yCisjICtleGVjdXRhYmxlIGZvcm0sIHByb3ZpZGVk
IHRoYXQgeW91IGRvIGF0IGxlYXN0IE9ORSBvZiB0aGUgZm9sbG93aW5nOgorIyArCisjICsgICAg
YSkgZGlzdHJpYnV0ZSBhIFN0YW5kYXJkIFZlcnNpb24gb2YgdGhlIGV4ZWN1dGFibGVzIGFuZCBs
aWJyYXJ5IGZpbGVzLAorIyArICAgIHRvZ2V0aGVyIHdpdGggaW5zdHJ1Y3Rpb25zIChpbiB0aGUg
bWFudWFsIHBhZ2Ugb3IgZXF1aXZhbGVudCkgb24gd2hlcmUKKyMgKyAgICB0byBnZXQgdGhlIFN0
YW5kYXJkIFZlcnNpb24uCisjICsKKyMgKyAgICBiKSBhY2NvbXBhbnkgdGhlIGRpc3RyaWJ1dGlv
biB3aXRoIHRoZSBtYWNoaW5lLXJlYWRhYmxlIHNvdXJjZSBvZgorIyArICAgIHRoZSBQYWNrYWdl
IHdpdGggeW91ciBtb2RpZmljYXRpb25zLgorIyArCisjICsgICAgYykgZ2l2ZSBub24tc3RhbmRh
cmQgZXhlY3V0YWJsZXMgbm9uLXN0YW5kYXJkIG5hbWVzLCBhbmQgY2xlYXJseQorIyArICAgIGRv
Y3VtZW50IHRoZSBkaWZmZXJlbmNlcyBpbiBtYW51YWwgcGFnZXMgKG9yIGVxdWl2YWxlbnQpLCB0
b2dldGhlcgorIyArICAgIHdpdGggaW5zdHJ1Y3Rpb25zIG9uIHdoZXJlIHRvIGdldCB0aGUgU3Rh
bmRhcmQgVmVyc2lvbi4KKyMgKworIyArICAgIGQpIG1ha2Ugb3RoZXIgZGlzdHJpYnV0aW9uIGFy
cmFuZ2VtZW50cyB3aXRoIHRoZSBDb3B5cmlnaHQgSG9sZGVyLgorIyAgCisjICA1LiBZb3UgbWF5
IGNoYXJnZSBhIHJlYXNvbmFibGUgY29weWluZyBmZWUgZm9yIGFueSBkaXN0cmlidXRpb24gb2Yg
dGhpcworIyAtUGFja2FnZS4gIFlvdSBtYXkgY2hhcmdlIGFueSBmZWUgeW91IGNob29zZSBmb3Ig
c3VwcG9ydCBvZiB0aGlzIFBhY2thZ2UuIFlvdQorIyAtbWF5IG5vdCBjaGFyZ2UgYSBmZWUgZm9y
IHRoaXMgUGFja2FnZSBpdHNlbGYuIEhvd2V2ZXIsIHlvdSBtYXkgZGlzdHJpYnV0ZSB0aGlzCisj
IC1QYWNrYWdlIGluIGFnZ3JlZ2F0ZSB3aXRoIG90aGVyIChwb3NzaWJseSBjb21tZXJjaWFsKSBw
cm9ncmFtcyBhcyBwYXJ0IG9mIGEKKyMgLWxhcmdlciAocG9zc2libHkgY29tbWVyY2lhbCkgc29m
dHdhcmUgZGlzdHJpYnV0aW9uIHByb3ZpZGVkIHRoYXQgeW91IGRvIG5vdAorIyAtYWR2ZXJ0aXNl
IHRoaXMgUGFja2FnZSBhcyBhIHByb2R1Y3Qgb2YgeW91ciBvd24uCisjIC0KKyMgLTYuIFRoZSBz
Y3JpcHRzIGFuZCBsaWJyYXJ5IGZpbGVzIHN1cHBsaWVkIGFzIGlucHV0IHRvIG9yIHByb2R1Y2Vk
IGFzIG91dHB1dAorIyAtZnJvbSB0aGUgcHJvZ3JhbXMgb2YgdGhpcyBQYWNrYWdlIGRvIG5vdCBh
dXRvbWF0aWNhbGx5IGZhbGwgdW5kZXIgdGhlIGNvcHlyaWdodAorIyAtb2YgdGhpcyBQYWNrYWdl
LCBidXQgYmVsb25nIHRvIHdob21ldmVyIGdlbmVyYXRlZCB0aGVtLCBhbmQgbWF5IGJlIHNvbGQK
KyMgLWNvbW1lcmNpYWxseSwgYW5kIG1heSBiZSBhZ2dyZWdhdGVkIHdpdGggdGhpcyBQYWNrYWdl
LgorIyAtCisjIC03LiBDIG9yIHBlcmwgc3Vicm91dGluZXMgc3VwcGxpZWQgYnkgeW91IGFuZCBs
aW5rZWQgaW50byB0aGlzIFBhY2thZ2Ugc2hhbGwgbm90CisjIC1iZSBjb25zaWRlcmVkIHBhcnQg
b2YgdGhpcyBQYWNrYWdlLgorIyAtCisjIC04LiBUaGUgbmFtZSBvZiB0aGUgQ29weXJpZ2h0IEhv
bGRlciBtYXkgbm90IGJlIHVzZWQgdG8gZW5kb3JzZSBvciBwcm9tb3RlCisjICtQYWNrYWdlLiAg
WW91IG1heSBjaGFyZ2UgYW55IGZlZSB5b3UgY2hvb3NlIGZvciBzdXBwb3J0IG9mIHRoaXMKKyMg
K1BhY2thZ2UuICBZb3UgbWF5IG5vdCBjaGFyZ2UgYSBmZWUgZm9yIHRoaXMgUGFja2FnZSBpdHNl
bGYuICBIb3dldmVyLAorIyAreW91IG1heSBkaXN0cmlidXRlIHRoaXMgUGFja2FnZSBpbiBhZ2dy
ZWdhdGUgd2l0aCBvdGhlciAocG9zc2libHkKKyMgK2NvbW1lcmNpYWwpIHByb2dyYW1zIGFzIHBh
cnQgb2YgYSBsYXJnZXIgKHBvc3NpYmx5IGNvbW1lcmNpYWwpIHNvZnR3YXJlCisjICtkaXN0cmli
dXRpb24gcHJvdmlkZWQgdGhhdCB5b3UgZG8gbm90IGFkdmVydGlzZSB0aGlzIFBhY2thZ2UgYXMg
YQorIyArcHJvZHVjdCBvZiB5b3VyIG93bi4gIFlvdSBtYXkgZW1iZWQgdGhpcyBQYWNrYWdlJ3Mg
aW50ZXJwcmV0ZXIgd2l0aGluCisjICthbiBleGVjdXRhYmxlIG9mIHlvdXJzIChieSBsaW5raW5n
KTsgdGhpcyBzaGFsbCBiZSBjb25zdHJ1ZWQgYXMgYSBtZXJlCisjICtmb3JtIG9mIGFnZ3JlZ2F0
aW9uLCBwcm92aWRlZCB0aGF0IHRoZSBjb21wbGV0ZSBTdGFuZGFyZCBWZXJzaW9uIG9mIHRoZQor
IyAraW50ZXJwcmV0ZXIgaXMgc28gZW1iZWRkZWQuCisjICsKKyMgKzYuIFRoZSBzY3JpcHRzIGFu
ZCBsaWJyYXJ5IGZpbGVzIHN1cHBsaWVkIGFzIGlucHV0IHRvIG9yIHByb2R1Y2VkIGFzCisjICtv
dXRwdXQgZnJvbSB0aGUgcHJvZ3JhbXMgb2YgdGhpcyBQYWNrYWdlIGRvIG5vdCBhdXRvbWF0aWNh
bGx5IGZhbGwKKyMgK3VuZGVyIHRoZSBjb3B5cmlnaHQgb2YgdGhpcyBQYWNrYWdlLCBidXQgYmVs
b25nIHRvIHdob2V2ZXIgZ2VuZXJhdGVkCisjICt0aGVtLCBhbmQgbWF5IGJlIHNvbGQgY29tbWVy
Y2lhbGx5LCBhbmQgbWF5IGJlIGFnZ3JlZ2F0ZWQgd2l0aCB0aGlzCisjICtQYWNrYWdlLiAgSWYg
c3VjaCBzY3JpcHRzIG9yIGxpYnJhcnkgZmlsZXMgYXJlIGFnZ3JlZ2F0ZWQgd2l0aCB0aGlzCisj
ICtQYWNrYWdlIHZpYSB0aGUgc28tY2FsbGVkICJ1bmR1bXAiIG9yICJ1bmV4ZWMiIG1ldGhvZHMg
b2YgcHJvZHVjaW5nIGEKKyMgK2JpbmFyeSBleGVjdXRhYmxlIGltYWdlLCB0aGVuIGRpc3RyaWJ1
dGlvbiBvZiBzdWNoIGFuIGltYWdlIHNoYWxsCisjICtuZWl0aGVyIGJlIGNvbnN0cnVlZCBhcyBh
IGRpc3RyaWJ1dGlvbiBvZiB0aGlzIFBhY2thZ2Ugbm9yIHNoYWxsIGl0CisjICtmYWxsIHVuZGVy
IHRoZSByZXN0cmljdGlvbnMgb2YgUGFyYWdyYXBocyAzIGFuZCA0LCBwcm92aWRlZCB0aGF0IHlv
dSBkbworIyArbm90IHJlcHJlc2VudCBzdWNoIGFuIGV4ZWN1dGFibGUgaW1hZ2UgYXMgYSBTdGFu
ZGFyZCBWZXJzaW9uIG9mIHRoaXMKKyMgK1BhY2thZ2UuCisjICsKKyMgKzcuIEMgc3Vicm91dGlu
ZXMgKG9yIGNvbXBhcmFibHkgY29tcGlsZWQgc3Vicm91dGluZXMgaW4gb3RoZXIKKyMgK2xhbmd1
YWdlcykgc3VwcGxpZWQgYnkgeW91IGFuZCBsaW5rZWQgaW50byB0aGlzIFBhY2thZ2UgaW4gb3Jk
ZXIgdG8KKyMgK2VtdWxhdGUgc3Vicm91dGluZXMgYW5kIHZhcmlhYmxlcyBvZiB0aGUgbGFuZ3Vh
Z2UgZGVmaW5lZCBieSB0aGlzCisjICtQYWNrYWdlIHNoYWxsIG5vdCBiZSBjb25zaWRlcmVkIHBh
cnQgb2YgdGhpcyBQYWNrYWdlLCBidXQgYXJlIHRoZQorIyArZXF1aXZhbGVudCBvZiBpbnB1dCBh
cyBpbiBQYXJhZ3JhcGggNiwgcHJvdmlkZWQgdGhlc2Ugc3Vicm91dGluZXMgZG8KKyMgK25vdCBj
aGFuZ2UgdGhlIGxhbmd1YWdlIGluIGFueSB3YXkgdGhhdCB3b3VsZCBjYXVzZSBpdCB0byBmYWls
IHRoZQorIyArcmVncmVzc2lvbiB0ZXN0cyBmb3IgdGhlIGxhbmd1YWdlLgorIyArCisjICs4LiBB
Z2dyZWdhdGlvbiBvZiB0aGlzIFBhY2thZ2Ugd2l0aCBhIGNvbW1lcmNpYWwgZGlzdHJpYnV0aW9u
IGlzIGFsd2F5cworIyArcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIHVzZSBvZiB0aGlzIFBh
Y2thZ2UgaXMgZW1iZWRkZWQ7IHRoYXQgaXMsCisjICt3aGVuIG5vIG92ZXJ0IGF0dGVtcHQgaXMg
bWFkZSB0byBtYWtlIHRoaXMgUGFja2FnZSdzIGludGVyZmFjZXMgdmlzaWJsZQorIyArdG8gdGhl
IGVuZCB1c2VyIG9mIHRoZSBjb21tZXJjaWFsIGRpc3RyaWJ1dGlvbi4gIFN1Y2ggdXNlIHNoYWxs
IG5vdCBiZQorIyArY29uc3RydWVkIGFzIGEgZGlzdHJpYnV0aW9uIG9mIHRoaXMgUGFja2FnZS4K
KyMgKworIyArOS4gVGhlIG5hbWUgb2YgdGhlIENvcHlyaWdodCBIb2xkZXIgbWF5IG5vdCBiZSB1
c2VkIHRvIGVuZG9yc2Ugb3IgcHJvbW90ZQorIyAgcHJvZHVjdHMgZGVyaXZlZCBmcm9tIHRoaXMg
c29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYyBwcmlvciB3cml0dGVuIHBlcm1pc3Npb24uCisjICAK
KyMgLTkuIFRISVMgUEFDS0FHRSBJUyBQUk9WSURFRCAiQVMgSVMiIEFORCBXSVRIT1VUIEFOWSBF
WFBSRVNTIE9SIElNUExJRUQKKyMgLVdBUlJBTlRJRVMsIElOQ0xVRElORywgV0lUSE9VVCBMSU1J
VEFUSU9OLCBUSEUgSU1QTElFRCBXQVJSQU5USUVTIE9GCisjIC1NRVJDSEFOVElCSUxJVFkgQU5E
IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLgorIyAtCisjIC1UaGUgRW5kCisjIC0K
KyMgKzEwLiBUSElTIFBBQ0tBR0UgSVMgUFJPVklERUQgIkFTIElTIiBBTkQgV0lUSE9VVCBBTlkg
RVhQUkVTUyBPUgorIyArSU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcsIFdJVEhPVVQgTElN
SVRBVElPTiwgVEhFIElNUExJRUQKKyMgK1dBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFO
RCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4KKyMgKworIyArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBUaGUgRW5kCisjICsKKyMgCisjCisKKyMgQ29weXJpZ2h0IChD
KSAyMDIwIEplbnMgUmVoc2FjayA8c25vQG5ldGJzZC5vcmc+CisjIFJlbGVhc2VkIHVuZGVyIHRo
ZSBNSVQgbGljZW5zZSAoc2VlIENPUFlJTkcuTUlUIGZvciB0aGUgdGVybXMpCisKK1NVTU1BUlkg
PSAiVGVzdDo6V2FybmluZ3MgLSBUZXN0IGZvciB3YXJuaW5ncyBhbmQgdGhlIGxhY2sgb2YgdGhl
bSIKK0RFU0NSSVBUSU9OID0gIklmIHlvdSd2ZSBldmVyIHRyaWVkIHRvIHVzZSBUZXN0OjpOb1dh
cm5pbmdzIHRvIGNvbmZpcm0gdGhlcmUgYXJlIG5vIFwKK3dhcm5pbmdzIGdlbmVyYXRlZCBieSB5
b3VyIHRlc3RzLCBjb21iaW5lZCB3aXRoIHRoZSBjb252ZW5pZW5jZSBvZiBcCitcXCJkb25lX3Rl
c3RpbmdcXCIgdG8gbm90IGhhdmUgdG8gZGVjbGFyZSBhIHRlc3QgY291bnQsIHlvdSdsbCBoYXZl
IGRpc2NvdmVyZWQgXAordGhhdCB0aGVzZSB0d28gZmVhdHVyZXMgZG8gbm90IHBsYXkgd2VsbCB0
b2dldGhlciwgYXMgdGhlIHRlc3QgY291bnQgd2lsbCBcCitiZSBjYWxjdWxhdGVkICpiZWZvcmUq
IHRoZSB3YXJuaW5ncyB0ZXN0IGlzIHJ1biwgcmVzdWx0aW5nIGluIGEgVEFQIGVycm9yLiBcCiso
U2VlICJleGFtcGxlcy90ZXN0X25vd2FybmluZ3MucGwiIGluIHRoaXMgZGlzdHJpYnV0aW9uIGZv
ciBhIFwKK2RlbW9uc3RyYXRpb24uKSIKK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9r
YXJlbmV0aGVyaWRnZS9UZXN0LVdhcm5pbmdzIgorQlVHVFJBQ0tFUiA9ICJodHRwczovL3J0LmNw
YW4ub3JnL1B1YmxpYy9EaXN0L0Rpc3BsYXkuaHRtbD9OYW1lPVRlc3QtV2FybmluZ3MiCitTRUNU
SU9OID0gImxpYnMiCitMSUNFTlNFID0gIkFydGlzdGljLTEuMCB8IEdQTC0xLjAtb3ItbGF0ZXIi
CisKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0U7bWQ1PWY5ODEwNmFjM2NjMDVk
OWNiZWJjZGI4ZmJmN2I3ODE1IgorCitTUkNfVVJJID0gIiR7Q1BBTl9NSVJST1J9L2F1dGhvcnMv
aWQvRS9FVC9FVEhFUi9UZXN0LVdhcm5pbmdzLSR7UFZ9LnRhci5neiIKKworU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjQ3MjdkYWUyNDE2ZTlmMDdlNDFlMmRjM2E5MTQzYmE2YWZmYzFlYzU3NjUyMTE3
Yzk5ZDUwMDM4ZTMxM2U5ZDkiCisKK1MgPSAiJHtXT1JLRElSfS9UZXN0LVdhcm5pbmdzLSR7UFZ9
IgorCitpbmhlcml0IGNwYW4gcHRlc3QtcGVybAorCitSREVQRU5EUzoke1BOfSArPSAiXAorICAg
IHBlcmwtbW9kdWxlLXRlc3QtYnVpbGRlciBcCisiCisKKyMgTWFueSBoaWRkZW4gZGVwZW5kZW5j
aWVzIGFuZCBteXN0ZXJpb3VzIGZhaWx1cmVzIG9jY3VyIHdpdGhvdXQgZnVsbCBwZXJsLW1vZHVs
ZXMKK1JERVBFTkRTOiR7UE59LXB0ZXN0ICs9ICJwZXJsLW1vZHVsZXMiCisKK2RvX2luc3RhbGxf
cHRlc3RfcGVybDphcHBlbmQgKCkgeworICAgIGNwIC1yICR7Qn0vdC9saWIgJHtEfSR7UFRFU1Rf
UEFUSH0vdC8KKyAgICBjaG93biAtUiByb290OnJvb3QgJHtEfSR7UFRFU1RfUEFUSH0vdC9saWIK
K30KKworQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi4zOS4yCgo=

--===============1932080998157489683==--

