Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDA4C04EBC
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.102667.1697399114312766559
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P0jBpxZt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NXq9NFwC;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b34df077b-add57a3b-8232-4794-9b39-21520f187216-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VbHzj+s3rg0l65FwSWdOvnYmkV/V1Ap0GUBhtm2eVhI=;
	b=P0jBpxZtdT6XgGtB4VnAJUijctLwSViC6JkCtAMlvDcm0eAG88RMZqbUectPtFz2
	5H9CT6CNu+0vye7ss1VGZjpWTAanq1/EJ++qv5vRyf4bDGPKJY24YFW918IH11S9fpd
	ebzboWge2XZ0nBSDQkSHI+hK9KFEF+cEnAPpzQcA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VbHzj+s3rg0l65FwSWdOvnYmkV/V1Ap0GUBhtm2eVhI=;
	b=NXq9NFwCmfybmpZqn6PsC169DGAVDuXPa6yLVDfv54LmIXA7WiluAeUWeQss78/n
	C9z2iI+88DOemwNgneR9VZFZWq3k02fEcagYKy43m0L/IAvwZ8Ydan5lt4bqokJ4OA3
	/l+zzbNWxAthQ84vuCSy7Dmv6jWkCHlGcngcFmhA=
Content-Type: multipart/mixed; boundary="===============6880797599926096586=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtest-warnings-perl: upgrading to 0.032 SUCCEEDED
Message-ID: <0101018b34df077b-add57a3b-8232-4794-9b39-21520f187216-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189179

--===============6880797599926096586==
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
From b0eca8697bcd413fa649a76286d4e54385f0f626 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 10:06:03 +0000
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


--===============6880797599926096586==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtest-warnings-perl-upgrade-0.031-0.032.patch"

RnJvbSBiMGVjYTg2OTdiY2Q0MTNmYTY0OWE3NjI4NmQ0ZTU0Mzg1ZjBmNjI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTA6MDY6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0ZXN0LXdhcm5pbmdzLXBlcmw6IHVwZ3JhZGUgMC4wMzEgLT4gMC4wMzIKCi0tLQogLi4uL3Bl
cmwvbGlidGVzdC13YXJuaW5ncy1wZXJsXzAuMDMxLmJiICAgICAgIHwgIDM5IC0tLQogLi4uL3Bl
cmwvbGlidGVzdC13YXJuaW5ncy1wZXJsXzAuMDMyLmJiICAgICAgIHwgMjg2ICsrKysrKysrKysr
KysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyODYgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25z
KC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVz
dC13YXJuaW5ncy1wZXJsXzAuMDMxLmJiCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BlcmwvbGlidGVzdC13YXJuaW5ncy1wZXJsXzAuMDMyLmJiCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC13YXJuaW5ncy1wZXJsXzAuMDMx
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC13YXJuaW5ncy1wZXJsXzAu
MDMxLmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlMDNkZWFmMTVmLi4wMDAwMDAw
MDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnRlc3Qtd2FybmluZ3MtcGVy
bF8wLjAzMS5iYgorKysgL2Rldi9udWxsCkBAIC0xLDM5ICswLDAgQEAKLSMgQ29weXJpZ2h0IChD
KSAyMDIwIEplbnMgUmVoc2FjayA8c25vQG5ldGJzZC5vcmc+Ci0jIFJlbGVhc2VkIHVuZGVyIHRo
ZSBNSVQgbGljZW5zZSAoc2VlIENPUFlJTkcuTUlUIGZvciB0aGUgdGVybXMpCi0KLVNVTU1BUlkg
PSAiVGVzdDo6V2FybmluZ3MgLSBUZXN0IGZvciB3YXJuaW5ncyBhbmQgdGhlIGxhY2sgb2YgdGhl
bSIKLURFU0NSSVBUSU9OID0gIklmIHlvdSd2ZSBldmVyIHRyaWVkIHRvIHVzZSBUZXN0OjpOb1dh
cm5pbmdzIHRvIGNvbmZpcm0gdGhlcmUgYXJlIG5vIFwKLXdhcm5pbmdzIGdlbmVyYXRlZCBieSB5
b3VyIHRlc3RzLCBjb21iaW5lZCB3aXRoIHRoZSBjb252ZW5pZW5jZSBvZiBcCi1cXCJkb25lX3Rl
c3RpbmdcXCIgdG8gbm90IGhhdmUgdG8gZGVjbGFyZSBhIHRlc3QgY291bnQsIHlvdSdsbCBoYXZl
IGRpc2NvdmVyZWQgXAotdGhhdCB0aGVzZSB0d28gZmVhdHVyZXMgZG8gbm90IHBsYXkgd2VsbCB0
b2dldGhlciwgYXMgdGhlIHRlc3QgY291bnQgd2lsbCBcCi1iZSBjYWxjdWxhdGVkICpiZWZvcmUq
IHRoZSB3YXJuaW5ncyB0ZXN0IGlzIHJ1biwgcmVzdWx0aW5nIGluIGEgVEFQIGVycm9yLiBcCi0o
U2VlICJleGFtcGxlcy90ZXN0X25vd2FybmluZ3MucGwiIGluIHRoaXMgZGlzdHJpYnV0aW9uIGZv
ciBhIFwKLWRlbW9uc3RyYXRpb24uKSIKLUhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9r
YXJlbmV0aGVyaWRnZS9UZXN0LVdhcm5pbmdzIgotQlVHVFJBQ0tFUiA9ICJodHRwczovL3J0LmNw
YW4ub3JnL1B1YmxpYy9EaXN0L0Rpc3BsYXkuaHRtbD9OYW1lPVRlc3QtV2FybmluZ3MiCi1TRUNU
SU9OID0gImxpYnMiCi1MSUNFTlNFID0gIkFydGlzdGljLTEuMCB8IEdQTC0xLjAtb3ItbGF0ZXIi
Ci0KLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0U7bWQ1PTZmMmIwMmYzOWU3ZDM1
OWVmZDk1MjVmYmM1NmM4NGExIgotCi1TUkNfVVJJID0gIiR7Q1BBTl9NSVJST1J9L2F1dGhvcnMv
aWQvRS9FVC9FVEhFUi9UZXN0LVdhcm5pbmdzLSR7UFZ9LnRhci5neiIKLQotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjFlNTQyOTA5ZmVmMzA1ZTQ1NTYzZTk4NzhlYTFjM2IwYzdjZWYxYjI4YmI3YWUw
N2ViYTJlMWVmYWJlYzQ3N2IiCi0KLVMgPSAiJHtXT1JLRElSfS9UZXN0LVdhcm5pbmdzLSR7UFZ9
IgotCi1pbmhlcml0IGNwYW4gcHRlc3QtcGVybAotCi1SREVQRU5EUzoke1BOfSArPSAiXAotICAg
IHBlcmwtbW9kdWxlLXRlc3QtYnVpbGRlciBcCi0iCi0KLSMgTWFueSBoaWRkZW4gZGVwZW5kZW5j
aWVzIGFuZCBteXN0ZXJpb3VzIGZhaWx1cmVzIG9jY3VyIHdpdGhvdXQgZnVsbCBwZXJsLW1vZHVs
ZXMKLVJERVBFTkRTOiR7UE59LXB0ZXN0ICs9ICJwZXJsLW1vZHVsZXMiCi0KLWRvX2luc3RhbGxf
cHRlc3RfcGVybDphcHBlbmQgKCkgewotICAgIGNwIC1yICR7Qn0vdC9saWIgJHtEfSR7UFRFU1Rf
UEFUSH0vdC8KLSAgICBjaG93biAtUiByb290OnJvb3QgJHtEfSR7UFRFU1RfUEFUSH0vdC9saWIK
LX0KLQotQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC13YXJuaW5ncy1wZXJsXzAuMDMyLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC13YXJuaW5ncy1wZXJsXzAuMDMyLmJi
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmZmMTk5Y2I2M2IKLS0tIC9k
ZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LXdhcm5pbmdz
LXBlcmxfMC4wMzIuYmIKQEAgLTAsMCArMSwyODYgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNf
Q0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMg
VGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBu
ZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5l
ZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2Ug
dmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTog
Y29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBM
SUNFTkNFCisjICsrKyBMSUNFTkNFCisjIEBAIC0yNzAsMTEwICsyNzAsMTQzIEBACisjICBUaGF0
J3MgYWxsIHRoZXJlIGlzIHRvIGl0IQorIyAgCisjICAKKyMgLS0tLSBUaGUgQXJ0aXN0aWMgTGlj
ZW5zZSAxLjAgLS0tCisjICstLS0gVGhlIFBlcmwgQXJ0aXN0aWMgTGljZW5zZSAxLjAgLS0tCisj
ICAKKyMgIFRoaXMgc29mdHdhcmUgaXMgQ29weXJpZ2h0IChjKSAyMDEzIGJ5IEthcmVuIEV0aGVy
aWRnZS4KKyMgIAorIyAgVGhpcyBpcyBmcmVlIHNvZnR3YXJlLCBsaWNlbnNlZCB1bmRlcjoKKyMg
IAorIyAtICBUaGUgQXJ0aXN0aWMgTGljZW5zZSAxLjAKKyMgLQorIyAtVGhlIEFydGlzdGljIExp
Y2Vuc2UKKyMgLQorIyAtUHJlYW1ibGUKKyMgLQorIyAtVGhlIGludGVudCBvZiB0aGlzIGRvY3Vt
ZW50IGlzIHRvIHN0YXRlIHRoZSBjb25kaXRpb25zIHVuZGVyIHdoaWNoIGEgUGFja2FnZQorIyAt
bWF5IGJlIGNvcGllZCwgc3VjaCB0aGF0IHRoZSBDb3B5cmlnaHQgSG9sZGVyIG1haW50YWlucyBz
b21lIHNlbWJsYW5jZSBvZgorIyAtYXJ0aXN0aWMgY29udHJvbCBvdmVyIHRoZSBkZXZlbG9wbWVu
dCBvZiB0aGUgcGFja2FnZSwgd2hpbGUgZ2l2aW5nIHRoZSB1c2VycyBvZgorIyAtdGhlIHBhY2th
Z2UgdGhlIHJpZ2h0IHRvIHVzZSBhbmQgZGlzdHJpYnV0ZSB0aGUgUGFja2FnZSBpbiBhIG1vcmUt
b3ItbGVzcworIyAtY3VzdG9tYXJ5IGZhc2hpb24sIHBsdXMgdGhlIHJpZ2h0IHRvIG1ha2UgcmVh
c29uYWJsZSBtb2RpZmljYXRpb25zLgorIyArICBUaGUgUGVybCBBcnRpc3RpYyBMaWNlbnNlIDEu
MAorIyArCisjICsKKyMgKworIyArCisjICsKKyMgKyAgICAgICAgICAgICAgICAgICAgICAgICBU
aGUgIkFydGlzdGljIExpY2Vuc2UiCisjICsKKyMgKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUHJlYW1ibGUKKyMgKworIyArVGhlIGludGVudCBvZiB0aGlzIGRvY3VtZW50IGlzIHRv
IHN0YXRlIHRoZSBjb25kaXRpb25zIHVuZGVyIHdoaWNoIGEKKyMgK1BhY2thZ2UgbWF5IGJlIGNv
cGllZCwgc3VjaCB0aGF0IHRoZSBDb3B5cmlnaHQgSG9sZGVyIG1haW50YWlucyBzb21lCisjICtz
ZW1ibGFuY2Ugb2YgYXJ0aXN0aWMgY29udHJvbCBvdmVyIHRoZSBkZXZlbG9wbWVudCBvZiB0aGUg
cGFja2FnZSwKKyMgK3doaWxlIGdpdmluZyB0aGUgdXNlcnMgb2YgdGhlIHBhY2thZ2UgdGhlIHJp
Z2h0IHRvIHVzZSBhbmQgZGlzdHJpYnV0ZQorIyArdGhlIFBhY2thZ2UgaW4gYSBtb3JlLW9yLWxl
c3MgY3VzdG9tYXJ5IGZhc2hpb24sIHBsdXMgdGhlIHJpZ2h0IHRvIG1ha2UKKyMgK3JlYXNvbmFi
bGUgbW9kaWZpY2F0aW9ucy4KKyMgIAorIyAgRGVmaW5pdGlvbnM6CisjICAKKyMgLSAgLSAiUGFj
a2FnZSIgcmVmZXJzIHRvIHRoZSBjb2xsZWN0aW9uIG9mIGZpbGVzIGRpc3RyaWJ1dGVkIGJ5IHRo
ZSBDb3B5cmlnaHQKKyMgLSAgICBIb2xkZXIsIGFuZCBkZXJpdmF0aXZlcyBvZiB0aGF0IGNvbGxl
Y3Rpb24gb2YgZmlsZXMgY3JlYXRlZCB0aHJvdWdoCisjIC0gICAgdGV4dHVhbCBtb2RpZmljYXRp
b24uIAorIyAtICAtICJTdGFuZGFyZCBWZXJzaW9uIiByZWZlcnMgdG8gc3VjaCBhIFBhY2thZ2Ug
aWYgaXQgaGFzIG5vdCBiZWVuIG1vZGlmaWVkLAorIyAtICAgIG9yIGhhcyBiZWVuIG1vZGlmaWVk
IGluIGFjY29yZGFuY2Ugd2l0aCB0aGUgd2lzaGVzIG9mIHRoZSBDb3B5cmlnaHQKKyMgLSAgICBI
b2xkZXIuIAorIyAtICAtICJDb3B5cmlnaHQgSG9sZGVyIiBpcyB3aG9ldmVyIGlzIG5hbWVkIGlu
IHRoZSBjb3B5cmlnaHQgb3IgY29weXJpZ2h0cyBmb3IKKyMgLSAgICB0aGUgcGFja2FnZS4gCisj
IC0gIC0gIllvdSIgaXMgeW91LCBpZiB5b3UncmUgdGhpbmtpbmcgYWJvdXQgY29weWluZyBvciBk
aXN0cmlidXRpbmcgdGhpcyBQYWNrYWdlLgorIyAtICAtICJSZWFzb25hYmxlIGNvcHlpbmcgZmVl
IiBpcyB3aGF0ZXZlciB5b3UgY2FuIGp1c3RpZnkgb24gdGhlIGJhc2lzIG9mIG1lZGlhCisjIC0g
ICAgY29zdCwgZHVwbGljYXRpb24gY2hhcmdlcywgdGltZSBvZiBwZW9wbGUgaW52b2x2ZWQsIGFu
ZCBzbyBvbi4gKFlvdSB3aWxsCisjIC0gICAgbm90IGJlIHJlcXVpcmVkIHRvIGp1c3RpZnkgaXQg
dG8gdGhlIENvcHlyaWdodCBIb2xkZXIsIGJ1dCBvbmx5IHRvIHRoZQorIyAtICAgIGNvbXB1dGlu
ZyBjb21tdW5pdHkgYXQgbGFyZ2UgYXMgYSBtYXJrZXQgdGhhdCBtdXN0IGJlYXIgdGhlIGZlZS4p
IAorIyAtICAtICJGcmVlbHkgQXZhaWxhYmxlIiBtZWFucyB0aGF0IG5vIGZlZSBpcyBjaGFyZ2Vk
IGZvciB0aGUgaXRlbSBpdHNlbGYsIHRob3VnaAorIyAtICAgIHRoZXJlIG1heSBiZSBmZWVzIGlu
dm9sdmVkIGluIGhhbmRsaW5nIHRoZSBpdGVtLiBJdCBhbHNvIG1lYW5zIHRoYXQKKyMgLSAgICBy
ZWNpcGllbnRzIG9mIHRoZSBpdGVtIG1heSByZWRpc3RyaWJ1dGUgaXQgdW5kZXIgdGhlIHNhbWUg
Y29uZGl0aW9ucyB0aGV5CisjIC0gICAgcmVjZWl2ZWQgaXQuIAorIyArICAgICAgICAiUGFja2Fn
ZSIgcmVmZXJzIHRvIHRoZSBjb2xsZWN0aW9uIG9mIGZpbGVzIGRpc3RyaWJ1dGVkIGJ5IHRoZQor
IyArICAgICAgICBDb3B5cmlnaHQgSG9sZGVyLCBhbmQgZGVyaXZhdGl2ZXMgb2YgdGhhdCBjb2xs
ZWN0aW9uIG9mIGZpbGVzCisjICsgICAgICAgIGNyZWF0ZWQgdGhyb3VnaCB0ZXh0dWFsIG1vZGlm
aWNhdGlvbi4KKyMgKworIyArICAgICAgICAiU3RhbmRhcmQgVmVyc2lvbiIgcmVmZXJzIHRvIHN1
Y2ggYSBQYWNrYWdlIGlmIGl0IGhhcyBub3QgYmVlbgorIyArICAgICAgICBtb2RpZmllZCwgb3Ig
aGFzIGJlZW4gbW9kaWZpZWQgaW4gYWNjb3JkYW5jZSB3aXRoIHRoZSB3aXNoZXMKKyMgKyAgICAg
ICAgb2YgdGhlIENvcHlyaWdodCBIb2xkZXIgYXMgc3BlY2lmaWVkIGJlbG93LgorIyArCisjICsg
ICAgICAgICJDb3B5cmlnaHQgSG9sZGVyIiBpcyB3aG9ldmVyIGlzIG5hbWVkIGluIHRoZSBjb3B5
cmlnaHQgb3IKKyMgKyAgICAgICAgY29weXJpZ2h0cyBmb3IgdGhlIHBhY2thZ2UuCisjICsKKyMg
KyAgICAgICAgIllvdSIgaXMgeW91LCBpZiB5b3UncmUgdGhpbmtpbmcgYWJvdXQgY29weWluZyBv
ciBkaXN0cmlidXRpbmcKKyMgKyAgICAgICAgdGhpcyBQYWNrYWdlLgorIyArCisjICsgICAgICAg
ICJSZWFzb25hYmxlIGNvcHlpbmcgZmVlIiBpcyB3aGF0ZXZlciB5b3UgY2FuIGp1c3RpZnkgb24g
dGhlCisjICsgICAgICAgIGJhc2lzIG9mIG1lZGlhIGNvc3QsIGR1cGxpY2F0aW9uIGNoYXJnZXMs
IHRpbWUgb2YgcGVvcGxlIGludm9sdmVkLAorIyArICAgICAgICBhbmQgc28gb24uICAoWW91IHdp
bGwgbm90IGJlIHJlcXVpcmVkIHRvIGp1c3RpZnkgaXQgdG8gdGhlCisjICsgICAgICAgIENvcHly
aWdodCBIb2xkZXIsIGJ1dCBvbmx5IHRvIHRoZSBjb21wdXRpbmcgY29tbXVuaXR5IGF0IGxhcmdl
CisjICsgICAgICAgIGFzIGEgbWFya2V0IHRoYXQgbXVzdCBiZWFyIHRoZSBmZWUuKQorIyArCisj
ICsgICAgICAgICJGcmVlbHkgQXZhaWxhYmxlIiBtZWFucyB0aGF0IG5vIGZlZSBpcyBjaGFyZ2Vk
IGZvciB0aGUgaXRlbQorIyArICAgICAgICBpdHNlbGYsIHRob3VnaCB0aGVyZSBtYXkgYmUgZmVl
cyBpbnZvbHZlZCBpbiBoYW5kbGluZyB0aGUgaXRlbS4KKyMgKyAgICAgICAgSXQgYWxzbyBtZWFu
cyB0aGF0IHJlY2lwaWVudHMgb2YgdGhlIGl0ZW0gbWF5IHJlZGlzdHJpYnV0ZSBpdAorIyArICAg
ICAgICB1bmRlciB0aGUgc2FtZSBjb25kaXRpb25zIHRoZXkgcmVjZWl2ZWQgaXQuCisjICAKKyMg
IDEuIFlvdSBtYXkgbWFrZSBhbmQgZ2l2ZSBhd2F5IHZlcmJhdGltIGNvcGllcyBvZiB0aGUgc291
cmNlIGZvcm0gb2YgdGhlCisjICBTdGFuZGFyZCBWZXJzaW9uIG9mIHRoaXMgUGFja2FnZSB3aXRo
b3V0IHJlc3RyaWN0aW9uLCBwcm92aWRlZCB0aGF0IHlvdQorIyAgZHVwbGljYXRlIGFsbCBvZiB0
aGUgb3JpZ2luYWwgY29weXJpZ2h0IG5vdGljZXMgYW5kIGFzc29jaWF0ZWQgZGlzY2xhaW1lcnMu
CisjICAKKyMgLTIuIFlvdSBtYXkgYXBwbHkgYnVnIGZpeGVzLCBwb3J0YWJpbGl0eSBmaXhlcyBh
bmQgb3RoZXIgbW9kaWZpY2F0aW9ucyBkZXJpdmVkCisjIC1mcm9tIHRoZSBQdWJsaWMgRG9tYWlu
IG9yIGZyb20gdGhlIENvcHlyaWdodCBIb2xkZXIuIEEgUGFja2FnZSBtb2RpZmllZCBpbiBzdWNo
CisjIC1hIHdheSBzaGFsbCBzdGlsbCBiZSBjb25zaWRlcmVkIHRoZSBTdGFuZGFyZCBWZXJzaW9u
LgorIyAtCisjIC0zLiBZb3UgbWF5IG90aGVyd2lzZSBtb2RpZnkgeW91ciBjb3B5IG9mIHRoaXMg
UGFja2FnZSBpbiBhbnkgd2F5LCBwcm92aWRlZCB0aGF0CisjIC15b3UgaW5zZXJ0IGEgcHJvbWlu
ZW50IG5vdGljZSBpbiBlYWNoIGNoYW5nZWQgZmlsZSBzdGF0aW5nIGhvdyBhbmQgd2hlbiB5b3UK
KyMgLWNoYW5nZWQgdGhhdCBmaWxlLCBhbmQgcHJvdmlkZWQgdGhhdCB5b3UgZG8gYXQgbGVhc3Qg
T05FIG9mIHRoZSBmb2xsb3dpbmc6CisjIC0KKyMgLSAgYSkgcGxhY2UgeW91ciBtb2RpZmljYXRp
b25zIGluIHRoZSBQdWJsaWMgRG9tYWluIG9yIG90aGVyd2lzZSBtYWtlIHRoZW0KKyMgLSAgICAg
RnJlZWx5IEF2YWlsYWJsZSwgc3VjaCBhcyBieSBwb3N0aW5nIHNhaWQgbW9kaWZpY2F0aW9ucyB0
byBVc2VuZXQgb3IgYW4KKyMgLSAgICAgZXF1aXZhbGVudCBtZWRpdW0sIG9yIHBsYWNpbmcgdGhl
IG1vZGlmaWNhdGlvbnMgb24gYSBtYWpvciBhcmNoaXZlIHNpdGUKKyMgLSAgICAgc3VjaCBhcyBm
dHAudXUubmV0LCBvciBieSBhbGxvd2luZyB0aGUgQ29weXJpZ2h0IEhvbGRlciB0byBpbmNsdWRl
IHlvdXIKKyMgLSAgICAgbW9kaWZpY2F0aW9ucyBpbiB0aGUgU3RhbmRhcmQgVmVyc2lvbiBvZiB0
aGUgUGFja2FnZS4KKyMgLQorIyAtICBiKSB1c2UgdGhlIG1vZGlmaWVkIFBhY2thZ2Ugb25seSB3
aXRoaW4geW91ciBjb3Jwb3JhdGlvbiBvciBvcmdhbml6YXRpb24uCisjIC0KKyMgLSAgYykgcmVu
YW1lIGFueSBub24tc3RhbmRhcmQgZXhlY3V0YWJsZXMgc28gdGhlIG5hbWVzIGRvIG5vdCBjb25m
bGljdCB3aXRoCisjIC0gICAgIHN0YW5kYXJkIGV4ZWN1dGFibGVzLCB3aGljaCBtdXN0IGFsc28g
YmUgcHJvdmlkZWQsIGFuZCBwcm92aWRlIGEgc2VwYXJhdGUKKyMgLSAgICAgbWFudWFsIHBhZ2Ug
Zm9yIGVhY2ggbm9uLXN0YW5kYXJkIGV4ZWN1dGFibGUgdGhhdCBjbGVhcmx5IGRvY3VtZW50cyBo
b3cgaXQKKyMgLSAgICAgZGlmZmVycyBmcm9tIHRoZSBTdGFuZGFyZCBWZXJzaW9uLgorIyAtCisj
IC0gIGQpIG1ha2Ugb3RoZXIgZGlzdHJpYnV0aW9uIGFycmFuZ2VtZW50cyB3aXRoIHRoZSBDb3B5
cmlnaHQgSG9sZGVyLgorIyAtCisjIC00LiBZb3UgbWF5IGRpc3RyaWJ1dGUgdGhlIHByb2dyYW1z
IG9mIHRoaXMgUGFja2FnZSBpbiBvYmplY3QgY29kZSBvciBleGVjdXRhYmxlCisjIC1mb3JtLCBw
cm92aWRlZCB0aGF0IHlvdSBkbyBhdCBsZWFzdCBPTkUgb2YgdGhlIGZvbGxvd2luZzoKKyMgLQor
IyAtICBhKSBkaXN0cmlidXRlIGEgU3RhbmRhcmQgVmVyc2lvbiBvZiB0aGUgZXhlY3V0YWJsZXMg
YW5kIGxpYnJhcnkgZmlsZXMsCisjIC0gICAgIHRvZ2V0aGVyIHdpdGggaW5zdHJ1Y3Rpb25zIChp
biB0aGUgbWFudWFsIHBhZ2Ugb3IgZXF1aXZhbGVudCkgb24gd2hlcmUgdG8KKyMgLSAgICAgZ2V0
IHRoZSBTdGFuZGFyZCBWZXJzaW9uLgorIyAtCisjIC0gIGIpIGFjY29tcGFueSB0aGUgZGlzdHJp
YnV0aW9uIHdpdGggdGhlIG1hY2hpbmUtcmVhZGFibGUgc291cmNlIG9mIHRoZSBQYWNrYWdlCisj
IC0gICAgIHdpdGggeW91ciBtb2RpZmljYXRpb25zLgorIyAtCisjIC0gIGMpIGFjY29tcGFueSBh
bnkgbm9uLXN0YW5kYXJkIGV4ZWN1dGFibGVzIHdpdGggdGhlaXIgY29ycmVzcG9uZGluZyBTdGFu
ZGFyZAorIyAtICAgICBWZXJzaW9uIGV4ZWN1dGFibGVzLCBnaXZpbmcgdGhlIG5vbi1zdGFuZGFy
ZCBleGVjdXRhYmxlcyBub24tc3RhbmRhcmQKKyMgLSAgICAgbmFtZXMsIGFuZCBjbGVhcmx5IGRv
Y3VtZW50aW5nIHRoZSBkaWZmZXJlbmNlcyBpbiBtYW51YWwgcGFnZXMgKG9yCisjIC0gICAgIGVx
dWl2YWxlbnQpLCB0b2dldGhlciB3aXRoIGluc3RydWN0aW9ucyBvbiB3aGVyZSB0byBnZXQgdGhl
IFN0YW5kYXJkCisjIC0gICAgIFZlcnNpb24uCisjIC0KKyMgLSAgZCkgbWFrZSBvdGhlciBkaXN0
cmlidXRpb24gYXJyYW5nZW1lbnRzIHdpdGggdGhlIENvcHlyaWdodCBIb2xkZXIuCisjICsyLiBZ
b3UgbWF5IGFwcGx5IGJ1ZyBmaXhlcywgcG9ydGFiaWxpdHkgZml4ZXMgYW5kIG90aGVyIG1vZGlm
aWNhdGlvbnMKKyMgK2Rlcml2ZWQgZnJvbSB0aGUgUHVibGljIERvbWFpbiBvciBmcm9tIHRoZSBD
b3B5cmlnaHQgSG9sZGVyLiAgQSBQYWNrYWdlCisjICttb2RpZmllZCBpbiBzdWNoIGEgd2F5IHNo
YWxsIHN0aWxsIGJlIGNvbnNpZGVyZWQgdGhlIFN0YW5kYXJkIFZlcnNpb24uCisjICsKKyMgKzMu
IFlvdSBtYXkgb3RoZXJ3aXNlIG1vZGlmeSB5b3VyIGNvcHkgb2YgdGhpcyBQYWNrYWdlIGluIGFu
eSB3YXksIHByb3ZpZGVkCisjICt0aGF0IHlvdSBpbnNlcnQgYSBwcm9taW5lbnQgbm90aWNlIGlu
IGVhY2ggY2hhbmdlZCBmaWxlIHN0YXRpbmcgaG93IGFuZAorIyArd2hlbiB5b3UgY2hhbmdlZCB0
aGF0IGZpbGUsIGFuZCBwcm92aWRlZCB0aGF0IHlvdSBkbyBhdCBsZWFzdCBPTkUgb2YgdGhlCisj
ICtmb2xsb3dpbmc6CisjICsKKyMgKyAgICBhKSBwbGFjZSB5b3VyIG1vZGlmaWNhdGlvbnMgaW4g
dGhlIFB1YmxpYyBEb21haW4gb3Igb3RoZXJ3aXNlIG1ha2UgdGhlbQorIyArICAgIEZyZWVseSBB
dmFpbGFibGUsIHN1Y2ggYXMgYnkgcG9zdGluZyBzYWlkIG1vZGlmaWNhdGlvbnMgdG8gVXNlbmV0
IG9yCisjICsgICAgYW4gZXF1aXZhbGVudCBtZWRpdW0sIG9yIHBsYWNpbmcgdGhlIG1vZGlmaWNh
dGlvbnMgb24gYSBtYWpvciBhcmNoaXZlCisjICsgICAgc2l0ZSBzdWNoIGFzIHV1bmV0LnV1Lm5l
dCwgb3IgYnkgYWxsb3dpbmcgdGhlIENvcHlyaWdodCBIb2xkZXIgdG8gaW5jbHVkZQorIyArICAg
IHlvdXIgbW9kaWZpY2F0aW9ucyBpbiB0aGUgU3RhbmRhcmQgVmVyc2lvbiBvZiB0aGUgUGFja2Fn
ZS4KKyMgKworIyArICAgIGIpIHVzZSB0aGUgbW9kaWZpZWQgUGFja2FnZSBvbmx5IHdpdGhpbiB5
b3VyIGNvcnBvcmF0aW9uIG9yIG9yZ2FuaXphdGlvbi4KKyMgKworIyArICAgIGMpIHJlbmFtZSBh
bnkgbm9uLXN0YW5kYXJkIGV4ZWN1dGFibGVzIHNvIHRoZSBuYW1lcyBkbyBub3QgY29uZmxpY3QK
KyMgKyAgICB3aXRoIHN0YW5kYXJkIGV4ZWN1dGFibGVzLCB3aGljaCBtdXN0IGFsc28gYmUgcHJv
dmlkZWQsIGFuZCBwcm92aWRlCisjICsgICAgYSBzZXBhcmF0ZSBtYW51YWwgcGFnZSBmb3IgZWFj
aCBub24tc3RhbmRhcmQgZXhlY3V0YWJsZSB0aGF0IGNsZWFybHkKKyMgKyAgICBkb2N1bWVudHMg
aG93IGl0IGRpZmZlcnMgZnJvbSB0aGUgU3RhbmRhcmQgVmVyc2lvbi4KKyMgKworIyArICAgIGQp
IG1ha2Ugb3RoZXIgZGlzdHJpYnV0aW9uIGFycmFuZ2VtZW50cyB3aXRoIHRoZSBDb3B5cmlnaHQg
SG9sZGVyLgorIyArCisjICs0LiBZb3UgbWF5IGRpc3RyaWJ1dGUgdGhlIHByb2dyYW1zIG9mIHRo
aXMgUGFja2FnZSBpbiBvYmplY3QgY29kZSBvcgorIyArZXhlY3V0YWJsZSBmb3JtLCBwcm92aWRl
ZCB0aGF0IHlvdSBkbyBhdCBsZWFzdCBPTkUgb2YgdGhlIGZvbGxvd2luZzoKKyMgKworIyArICAg
IGEpIGRpc3RyaWJ1dGUgYSBTdGFuZGFyZCBWZXJzaW9uIG9mIHRoZSBleGVjdXRhYmxlcyBhbmQg
bGlicmFyeSBmaWxlcywKKyMgKyAgICB0b2dldGhlciB3aXRoIGluc3RydWN0aW9ucyAoaW4gdGhl
IG1hbnVhbCBwYWdlIG9yIGVxdWl2YWxlbnQpIG9uIHdoZXJlCisjICsgICAgdG8gZ2V0IHRoZSBT
dGFuZGFyZCBWZXJzaW9uLgorIyArCisjICsgICAgYikgYWNjb21wYW55IHRoZSBkaXN0cmlidXRp
b24gd2l0aCB0aGUgbWFjaGluZS1yZWFkYWJsZSBzb3VyY2Ugb2YKKyMgKyAgICB0aGUgUGFja2Fn
ZSB3aXRoIHlvdXIgbW9kaWZpY2F0aW9ucy4KKyMgKworIyArICAgIGMpIGdpdmUgbm9uLXN0YW5k
YXJkIGV4ZWN1dGFibGVzIG5vbi1zdGFuZGFyZCBuYW1lcywgYW5kIGNsZWFybHkKKyMgKyAgICBk
b2N1bWVudCB0aGUgZGlmZmVyZW5jZXMgaW4gbWFudWFsIHBhZ2VzIChvciBlcXVpdmFsZW50KSwg
dG9nZXRoZXIKKyMgKyAgICB3aXRoIGluc3RydWN0aW9ucyBvbiB3aGVyZSB0byBnZXQgdGhlIFN0
YW5kYXJkIFZlcnNpb24uCisjICsKKyMgKyAgICBkKSBtYWtlIG90aGVyIGRpc3RyaWJ1dGlvbiBh
cnJhbmdlbWVudHMgd2l0aCB0aGUgQ29weXJpZ2h0IEhvbGRlci4KKyMgIAorIyAgNS4gWW91IG1h
eSBjaGFyZ2UgYSByZWFzb25hYmxlIGNvcHlpbmcgZmVlIGZvciBhbnkgZGlzdHJpYnV0aW9uIG9m
IHRoaXMKKyMgLVBhY2thZ2UuICBZb3UgbWF5IGNoYXJnZSBhbnkgZmVlIHlvdSBjaG9vc2UgZm9y
IHN1cHBvcnQgb2YgdGhpcyBQYWNrYWdlLiBZb3UKKyMgLW1heSBub3QgY2hhcmdlIGEgZmVlIGZv
ciB0aGlzIFBhY2thZ2UgaXRzZWxmLiBIb3dldmVyLCB5b3UgbWF5IGRpc3RyaWJ1dGUgdGhpcwor
IyAtUGFja2FnZSBpbiBhZ2dyZWdhdGUgd2l0aCBvdGhlciAocG9zc2libHkgY29tbWVyY2lhbCkg
cHJvZ3JhbXMgYXMgcGFydCBvZiBhCisjIC1sYXJnZXIgKHBvc3NpYmx5IGNvbW1lcmNpYWwpIHNv
ZnR3YXJlIGRpc3RyaWJ1dGlvbiBwcm92aWRlZCB0aGF0IHlvdSBkbyBub3QKKyMgLWFkdmVydGlz
ZSB0aGlzIFBhY2thZ2UgYXMgYSBwcm9kdWN0IG9mIHlvdXIgb3duLgorIyAtCisjIC02LiBUaGUg
c2NyaXB0cyBhbmQgbGlicmFyeSBmaWxlcyBzdXBwbGllZCBhcyBpbnB1dCB0byBvciBwcm9kdWNl
ZCBhcyBvdXRwdXQKKyMgLWZyb20gdGhlIHByb2dyYW1zIG9mIHRoaXMgUGFja2FnZSBkbyBub3Qg
YXV0b21hdGljYWxseSBmYWxsIHVuZGVyIHRoZSBjb3B5cmlnaHQKKyMgLW9mIHRoaXMgUGFja2Fn
ZSwgYnV0IGJlbG9uZyB0byB3aG9tZXZlciBnZW5lcmF0ZWQgdGhlbSwgYW5kIG1heSBiZSBzb2xk
CisjIC1jb21tZXJjaWFsbHksIGFuZCBtYXkgYmUgYWdncmVnYXRlZCB3aXRoIHRoaXMgUGFja2Fn
ZS4KKyMgLQorIyAtNy4gQyBvciBwZXJsIHN1YnJvdXRpbmVzIHN1cHBsaWVkIGJ5IHlvdSBhbmQg
bGlua2VkIGludG8gdGhpcyBQYWNrYWdlIHNoYWxsIG5vdAorIyAtYmUgY29uc2lkZXJlZCBwYXJ0
IG9mIHRoaXMgUGFja2FnZS4KKyMgLQorIyAtOC4gVGhlIG5hbWUgb2YgdGhlIENvcHlyaWdodCBI
b2xkZXIgbWF5IG5vdCBiZSB1c2VkIHRvIGVuZG9yc2Ugb3IgcHJvbW90ZQorIyArUGFja2FnZS4g
IFlvdSBtYXkgY2hhcmdlIGFueSBmZWUgeW91IGNob29zZSBmb3Igc3VwcG9ydCBvZiB0aGlzCisj
ICtQYWNrYWdlLiAgWW91IG1heSBub3QgY2hhcmdlIGEgZmVlIGZvciB0aGlzIFBhY2thZ2UgaXRz
ZWxmLiAgSG93ZXZlciwKKyMgK3lvdSBtYXkgZGlzdHJpYnV0ZSB0aGlzIFBhY2thZ2UgaW4gYWdn
cmVnYXRlIHdpdGggb3RoZXIgKHBvc3NpYmx5CisjICtjb21tZXJjaWFsKSBwcm9ncmFtcyBhcyBw
YXJ0IG9mIGEgbGFyZ2VyIChwb3NzaWJseSBjb21tZXJjaWFsKSBzb2Z0d2FyZQorIyArZGlzdHJp
YnV0aW9uIHByb3ZpZGVkIHRoYXQgeW91IGRvIG5vdCBhZHZlcnRpc2UgdGhpcyBQYWNrYWdlIGFz
IGEKKyMgK3Byb2R1Y3Qgb2YgeW91ciBvd24uICBZb3UgbWF5IGVtYmVkIHRoaXMgUGFja2FnZSdz
IGludGVycHJldGVyIHdpdGhpbgorIyArYW4gZXhlY3V0YWJsZSBvZiB5b3VycyAoYnkgbGlua2lu
Zyk7IHRoaXMgc2hhbGwgYmUgY29uc3RydWVkIGFzIGEgbWVyZQorIyArZm9ybSBvZiBhZ2dyZWdh
dGlvbiwgcHJvdmlkZWQgdGhhdCB0aGUgY29tcGxldGUgU3RhbmRhcmQgVmVyc2lvbiBvZiB0aGUK
KyMgK2ludGVycHJldGVyIGlzIHNvIGVtYmVkZGVkLgorIyArCisjICs2LiBUaGUgc2NyaXB0cyBh
bmQgbGlicmFyeSBmaWxlcyBzdXBwbGllZCBhcyBpbnB1dCB0byBvciBwcm9kdWNlZCBhcworIyAr
b3V0cHV0IGZyb20gdGhlIHByb2dyYW1zIG9mIHRoaXMgUGFja2FnZSBkbyBub3QgYXV0b21hdGlj
YWxseSBmYWxsCisjICt1bmRlciB0aGUgY29weXJpZ2h0IG9mIHRoaXMgUGFja2FnZSwgYnV0IGJl
bG9uZyB0byB3aG9ldmVyIGdlbmVyYXRlZAorIyArdGhlbSwgYW5kIG1heSBiZSBzb2xkIGNvbW1l
cmNpYWxseSwgYW5kIG1heSBiZSBhZ2dyZWdhdGVkIHdpdGggdGhpcworIyArUGFja2FnZS4gIElm
IHN1Y2ggc2NyaXB0cyBvciBsaWJyYXJ5IGZpbGVzIGFyZSBhZ2dyZWdhdGVkIHdpdGggdGhpcwor
IyArUGFja2FnZSB2aWEgdGhlIHNvLWNhbGxlZCAidW5kdW1wIiBvciAidW5leGVjIiBtZXRob2Rz
IG9mIHByb2R1Y2luZyBhCisjICtiaW5hcnkgZXhlY3V0YWJsZSBpbWFnZSwgdGhlbiBkaXN0cmli
dXRpb24gb2Ygc3VjaCBhbiBpbWFnZSBzaGFsbAorIyArbmVpdGhlciBiZSBjb25zdHJ1ZWQgYXMg
YSBkaXN0cmlidXRpb24gb2YgdGhpcyBQYWNrYWdlIG5vciBzaGFsbCBpdAorIyArZmFsbCB1bmRl
ciB0aGUgcmVzdHJpY3Rpb25zIG9mIFBhcmFncmFwaHMgMyBhbmQgNCwgcHJvdmlkZWQgdGhhdCB5
b3UgZG8KKyMgK25vdCByZXByZXNlbnQgc3VjaCBhbiBleGVjdXRhYmxlIGltYWdlIGFzIGEgU3Rh
bmRhcmQgVmVyc2lvbiBvZiB0aGlzCisjICtQYWNrYWdlLgorIyArCisjICs3LiBDIHN1YnJvdXRp
bmVzIChvciBjb21wYXJhYmx5IGNvbXBpbGVkIHN1YnJvdXRpbmVzIGluIG90aGVyCisjICtsYW5n
dWFnZXMpIHN1cHBsaWVkIGJ5IHlvdSBhbmQgbGlua2VkIGludG8gdGhpcyBQYWNrYWdlIGluIG9y
ZGVyIHRvCisjICtlbXVsYXRlIHN1YnJvdXRpbmVzIGFuZCB2YXJpYWJsZXMgb2YgdGhlIGxhbmd1
YWdlIGRlZmluZWQgYnkgdGhpcworIyArUGFja2FnZSBzaGFsbCBub3QgYmUgY29uc2lkZXJlZCBw
YXJ0IG9mIHRoaXMgUGFja2FnZSwgYnV0IGFyZSB0aGUKKyMgK2VxdWl2YWxlbnQgb2YgaW5wdXQg
YXMgaW4gUGFyYWdyYXBoIDYsIHByb3ZpZGVkIHRoZXNlIHN1YnJvdXRpbmVzIGRvCisjICtub3Qg
Y2hhbmdlIHRoZSBsYW5ndWFnZSBpbiBhbnkgd2F5IHRoYXQgd291bGQgY2F1c2UgaXQgdG8gZmFp
bCB0aGUKKyMgK3JlZ3Jlc3Npb24gdGVzdHMgZm9yIHRoZSBsYW5ndWFnZS4KKyMgKworIyArOC4g
QWdncmVnYXRpb24gb2YgdGhpcyBQYWNrYWdlIHdpdGggYSBjb21tZXJjaWFsIGRpc3RyaWJ1dGlv
biBpcyBhbHdheXMKKyMgK3Blcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSB1c2Ugb2YgdGhpcyBQ
YWNrYWdlIGlzIGVtYmVkZGVkOyB0aGF0IGlzLAorIyArd2hlbiBubyBvdmVydCBhdHRlbXB0IGlz
IG1hZGUgdG8gbWFrZSB0aGlzIFBhY2thZ2UncyBpbnRlcmZhY2VzIHZpc2libGUKKyMgK3RvIHRo
ZSBlbmQgdXNlciBvZiB0aGUgY29tbWVyY2lhbCBkaXN0cmlidXRpb24uICBTdWNoIHVzZSBzaGFs
bCBub3QgYmUKKyMgK2NvbnN0cnVlZCBhcyBhIGRpc3RyaWJ1dGlvbiBvZiB0aGlzIFBhY2thZ2Uu
CisjICsKKyMgKzkuIFRoZSBuYW1lIG9mIHRoZSBDb3B5cmlnaHQgSG9sZGVyIG1heSBub3QgYmUg
dXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUKKyMgIHByb2R1Y3RzIGRlcml2ZWQgZnJvbSB0aGlz
IHNvZnR3YXJlIHdpdGhvdXQgc3BlY2lmaWMgcHJpb3Igd3JpdHRlbiBwZXJtaXNzaW9uLgorIyAg
CisjIC05LiBUSElTIFBBQ0tBR0UgSVMgUFJPVklERUQgIkFTIElTIiBBTkQgV0lUSE9VVCBBTlkg
RVhQUkVTUyBPUiBJTVBMSUVECisjIC1XQVJSQU5USUVTLCBJTkNMVURJTkcsIFdJVEhPVVQgTElN
SVRBVElPTiwgVEhFIElNUExJRUQgV0FSUkFOVElFUyBPRgorIyAtTUVSQ0hBTlRJQklMSVRZIEFO
RCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4KKyMgLQorIyAtVGhlIEVuZAorIyAt
CisjICsxMC4gVEhJUyBQQUNLQUdFIElTIFBST1ZJREVEICJBUyBJUyIgQU5EIFdJVEhPVVQgQU5Z
IEVYUFJFU1MgT1IKKyMgK0lNUExJRUQgV0FSUkFOVElFUywgSU5DTFVESU5HLCBXSVRIT1VUIExJ
TUlUQVRJT04sIFRIRSBJTVBMSUVECisjICtXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBB
TkQgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuCisjICsKKyMgKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgVGhlIEVuZAorIyArCisjIAorIworCisjIENvcHlyaWdodCAo
QykgMjAyMCBKZW5zIFJlaHNhY2sgPHNub0BuZXRic2Qub3JnPgorIyBSZWxlYXNlZCB1bmRlciB0
aGUgTUlUIGxpY2Vuc2UgKHNlZSBDT1BZSU5HLk1JVCBmb3IgdGhlIHRlcm1zKQorCitTVU1NQVJZ
ID0gIlRlc3Q6Oldhcm5pbmdzIC0gVGVzdCBmb3Igd2FybmluZ3MgYW5kIHRoZSBsYWNrIG9mIHRo
ZW0iCitERVNDUklQVElPTiA9ICJJZiB5b3UndmUgZXZlciB0cmllZCB0byB1c2UgVGVzdDo6Tm9X
YXJuaW5ncyB0byBjb25maXJtIHRoZXJlIGFyZSBubyBcCit3YXJuaW5ncyBnZW5lcmF0ZWQgYnkg
eW91ciB0ZXN0cywgY29tYmluZWQgd2l0aCB0aGUgY29udmVuaWVuY2Ugb2YgXAorXFwiZG9uZV90
ZXN0aW5nXFwiIHRvIG5vdCBoYXZlIHRvIGRlY2xhcmUgYSB0ZXN0IGNvdW50LCB5b3UnbGwgaGF2
ZSBkaXNjb3ZlcmVkIFwKK3RoYXQgdGhlc2UgdHdvIGZlYXR1cmVzIGRvIG5vdCBwbGF5IHdlbGwg
dG9nZXRoZXIsIGFzIHRoZSB0ZXN0IGNvdW50IHdpbGwgXAorYmUgY2FsY3VsYXRlZCAqYmVmb3Jl
KiB0aGUgd2FybmluZ3MgdGVzdCBpcyBydW4sIHJlc3VsdGluZyBpbiBhIFRBUCBlcnJvci4gXAor
KFNlZSAiZXhhbXBsZXMvdGVzdF9ub3dhcm5pbmdzLnBsIiBpbiB0aGlzIGRpc3RyaWJ1dGlvbiBm
b3IgYSBcCitkZW1vbnN0cmF0aW9uLikiCitIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20v
a2FyZW5ldGhlcmlkZ2UvVGVzdC1XYXJuaW5ncyIKK0JVR1RSQUNLRVIgPSAiaHR0cHM6Ly9ydC5j
cGFuLm9yZy9QdWJsaWMvRGlzdC9EaXNwbGF5Lmh0bWw/TmFtZT1UZXN0LVdhcm5pbmdzIgorU0VD
VElPTiA9ICJsaWJzIgorTElDRU5TRSA9ICJBcnRpc3RpYy0xLjAgfCBHUEwtMS4wLW9yLWxhdGVy
IgorCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFO21kNT1mOTgxMDZhYzNjYzA1
ZDljYmViY2RiOGZiZjdiNzgxNSIKKworU1JDX1VSSSA9ICIke0NQQU5fTUlSUk9SfS9hdXRob3Jz
L2lkL0UvRVQvRVRIRVIvVGVzdC1XYXJuaW5ncy0ke1BWfS50YXIuZ3oiCisKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI0NzI3ZGFlMjQxNmU5ZjA3ZTQxZTJkYzNhOTE0M2JhNmFmZmMxZWM1NzY1MjEx
N2M5OWQ1MDAzOGUzMTNlOWQ5IgorCitTID0gIiR7V09SS0RJUn0vVGVzdC1XYXJuaW5ncy0ke1BW
fSIKKworaW5oZXJpdCBjcGFuIHB0ZXN0LXBlcmwKKworUkRFUEVORFM6JHtQTn0gKz0gIlwKKyAg
ICBwZXJsLW1vZHVsZS10ZXN0LWJ1aWxkZXIgXAorIgorCisjIE1hbnkgaGlkZGVuIGRlcGVuZGVu
Y2llcyBhbmQgbXlzdGVyaW91cyBmYWlsdXJlcyBvY2N1ciB3aXRob3V0IGZ1bGwgcGVybC1tb2R1
bGVzCitSREVQRU5EUzoke1BOfS1wdGVzdCArPSAicGVybC1tb2R1bGVzIgorCitkb19pbnN0YWxs
X3B0ZXN0X3Blcmw6YXBwZW5kICgpIHsKKyAgICBjcCAtciAke0J9L3QvbGliICR7RH0ke1BURVNU
X1BBVEh9L3QvCisgICAgY2hvd24gLVIgcm9vdDpyb290ICR7RH0ke1BURVNUX1BBVEh9L3QvbGli
Cit9CisKK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIuMzkuMgoK

--===============6880797599926096586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: FILELIST: added "/usr/lib/libtest-warnings-perl/ptest/t/24-only-report-warnings.t"

--===============6880797599926096586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libtest-warnings-perl: PV changed from "0.031" to "0.032"
packages/core2-32-poky-linux/libtest-warnings-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-Warnings-0.031.tar.gz file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-Warnings-0.032.tar.gz file://ptest-perl/run-ptest"
packages/core2-32-poky-linux/libtest-warnings-perl: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dbg: PV changed from "0.031" to "0.032"
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dbg: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dev: PV changed from "0.031" to "0.032"
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dev: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-doc: PV changed from "0.031" to "0.032"
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-doc: PKGSIZE changed from 13383 to 13754 (+3%)
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-doc: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-locale: PV changed from "0.031" to "0.032"
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-locale: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: PV changed from "0.031" to "0.032"
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: PKGSIZE changed from 36453 to 37345 (+2%)
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: FILELIST: added "/usr/lib/libtest-warnings-perl/ptest/t/24-only-report-warnings.t"
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-src: PV changed from "0.031" to "0.032"
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-src: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-staticdev: PV changed from "0.031" to "0.032"
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl-staticdev: PKGV changed from 0.031 [default] to 0.032 [default]
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PV changed from "0.031" to "0.032"
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PKGSIZE changed from 14635 to 15277 (+4%)
packages/core2-32-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PKGV changed from 0.031 [default] to 0.032 [default]

--===============6880797599926096586==--

