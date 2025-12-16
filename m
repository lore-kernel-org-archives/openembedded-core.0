Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9761BD5C0E2
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17186.1765872138758352233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hhaO9jt6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rC4gRLHl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b262e77d0-2e9fd3aa-79e6-4164-bd90-47cb628273fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E03DSsG3s2ScdzeqAiGXJrFQNfJVmZdfp9l+iMhYSwk=;
	b=hhaO9jt6fPIjgAV+fAtc+hUNmHkrJMYgyIF2EdR9JJxVemtHkw4ga2HfjqKU6z3O
	j1aBoOUpOXepjyG278BJnSnvJTNbfKh2k+VKNhq77uy++dFbiKpTNIukiUV8XIfS4J1
	huv0ihQ8Gyfqcc3eY2mayvty7U1iG5j7kIjShJOw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E03DSsG3s2ScdzeqAiGXJrFQNfJVmZdfp9l+iMhYSwk=;
	b=rC4gRLHlVVPGe5+XQG6TcNPA8Rq5zjAivrTKPDl36TqfYam5QjbXsHHMxNogP/qg
	d3/QYEyAR7qAKyr33wfm9yS9I3woMplmjvpL7jNU+TboAB/uJpKegXXYaJ3PVsNDMvT
	NvOqO1ZQzdcP8IQuFzDtwpsnikOr+JAM/sh+7LSk=
Content-Type: multipart/mixed; boundary="===============9175449448599014746=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtest-fatal-perl: upgrading to 0.018 SUCCEEDED
Message-ID: <0101019b262e77d0-2e9fd3aa-79e6-4164-bd90-47cb628273fe-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227794

--===============9175449448599014746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtest-fatal-perl* to *0.018* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtest-fatal-perl-upgrade-0.017-0.018.patch
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
From 9e77e20e07d3b182a341d98a97138e1ae4f794f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 23:07:45 +0000
Subject: [PATCH] libtest-fatal-perl: upgrade 0.017 -> 0.018

---
 .../perl/libtest-fatal-perl_0.017.bb          |  36 --
 .../perl/libtest-fatal-perl_0.018.bb          | 310 ++++++++++++++++++
 2 files changed, 310 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb
 create mode 100644 meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb

diff --git a/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb b/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb
deleted file mode 100644
index eae128b0cc..0000000000
--- a/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Incredibly simple helpers for testing code with exceptions"
-DESCRIPTION = "Test::Fatal is an alternative to the popular Test::Exception.\
-It does much less, but should allow greater flexibility in testing \
-exception-throwing code with about the same amount of typing."
-HOMEPAGE = "https://github.com/rjbs/Test-Fatal"
-BUGTRACKER = "https://github.com/rjbs/Test-Fatal/issues"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b5c851290cab1dda12fcfb0e9ec43639"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Fatal-${PV}.tar.gz"
-
-SRC_URI[sha256sum] = "37dfffdafb84b762efe96b02fb2aa41f37026c73e6b83590db76229697f3c4a6"
-
-S = "${UNPACKDIR}/Test-Fatal-${PV}"
-
-inherit cpan ptest-perl
-
-RDEPENDS:${PN} += "\
-    libtry-tiny-perl \
-    perl-module-carp \
-    perl-module-exporter \
-    perl-module-test-builder \
-"
-
-RDEPENDS:${PN}-ptest += "\
-    perl-module-extutils-makemaker \
-    perl-module-extutils-mm-unix \
-    perl-module-file-spec \
-    perl-module-overload \
-    perl-module-test-builder-tester \
-    perl-module-test-more \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb b/meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb
new file mode 100644
index 0000000000..4bf4cc2a31
--- /dev/null
+++ b/meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb
@@ -0,0 +1,310 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -22,7 +22,7 @@
+#                       Version 1, February 1989
+#  
+#   Copyright (C) 1989 Free Software Foundation, Inc.
+# - 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+# +                    <https://fsf.org/>
+#  
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+# @@ -236,8 +236,7 @@
+#      GNU General Public License for more details.
+#  
+#      You should have received a copy of the GNU General Public License
+# -    along with this program; if not, write to the Free Software
+# -    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA  02110-1301 USA
+# +    along with this program; if not, see <https://www.gnu.org/licenses/>.
+#  
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+# @@ -264,116 +263,149 @@
+#    program `Gnomovision' (a program to direct compilers to make passes
+#    at assemblers) written by James Hacker.
+#  
+# -  <signature of Ty Coon>, 1 April 1989
+# -  Ty Coon, President of Vice
+# +  <signature of Moe Ghoul>, 1 April 1989
+# +  Moe Ghoul, President of Vice
+#  
+#  That's all there is to it!
+#  
+#  
+# ---- The Artistic License 1.0 ---
+# +--- The Perl Artistic License 1.0 ---
+#  
+#  This software is Copyright (c) 2010 by Ricardo Signes.
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
+# -MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
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
+SUMMARY = "Incredibly simple helpers for testing code with exceptions"
+DESCRIPTION = "Test::Fatal is an alternative to the popular Test::Exception.\
+It does much less, but should allow greater flexibility in testing \
+exception-throwing code with about the same amount of typing."
+HOMEPAGE = "https://github.com/rjbs/Test-Fatal"
+BUGTRACKER = "https://github.com/rjbs/Test-Fatal/issues"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f7fc7d4b26ddae0843b09ba56109e65a"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Fatal-${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "b8d2cccf9ee467271bc478f9cf7eba49545452be9302ae359bc538b8bf687cd6"
+
+S = "${UNPACKDIR}/Test-Fatal-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN} += "\
+    libtry-tiny-perl \
+    perl-module-carp \
+    perl-module-exporter \
+    perl-module-test-builder \
+"
+
+RDEPENDS:${PN}-ptest += "\
+    perl-module-extutils-makemaker \
+    perl-module-extutils-mm-unix \
+    perl-module-file-spec \
+    perl-module-overload \
+    perl-module-test-builder-tester \
+    perl-module-test-more \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============9175449448599014746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libtest-fatal-perl: PV changed from "0.017" to "0.018"
packages/x86-64-v3-poky-linux/libtest-fatal-perl: SRC_URI changed from "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Test-Fatal-0.017.tar.gz file://ptest-perl/run-ptest" to "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Test-Fatal-0.018.tar.gz file://ptest-perl/run-ptest"
packages/x86-64-v3-poky-linux/libtest-fatal-perl: PKGV changed from 0.017 [default] to 0.018 [default]
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-dbg: PV changed from "0.017" to "0.018"
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-dbg: PKGV changed from 0.017 [default] to 0.018 [default]
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-dev: PV changed from "0.017" to "0.018"
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-dev: PKGV changed from 0.017 [default] to 0.018 [default]
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-doc: PV changed from "0.017" to "0.018"
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-doc: PKGV changed from 0.017 [default] to 0.018 [default]
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-doc: PKGSIZE changed from 8920 to 9167 (+3%)
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-locale: PV changed from "0.017" to "0.018"
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-locale: PKGV changed from 0.017 [default] to 0.018 [default]
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-ptest: PV changed from "0.017" to "0.018"
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-ptest: PKGV changed from 0.017 [default] to 0.018 [default]
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-ptest: PKGSIZE changed from 13324 to 13638 (+2%)
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-src: PV changed from "0.017" to "0.018"
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-src: PKGV changed from 0.017 [default] to 0.018 [default]
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-staticdev: PV changed from "0.017" to "0.018"
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl-staticdev: PKGV changed from 0.017 [default] to 0.018 [default]
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl: PV changed from "0.017" to "0.018"
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl: PKGV changed from 0.017 [default] to 0.018 [default]
packages/x86-64-v3-poky-linux/libtest-fatal-perl/libtest-fatal-perl: PKGSIZE changed from 15355 to 15836 (+3%)

--===============9175449448599014746==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtest-fatal-perl-upgrade-0.017-0.018.patch"

RnJvbSA5ZTc3ZTIwZTA3ZDNiMTgyYTM0MWQ5OGE5NzEzOGUxYWU0Zjc5NGYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjM6MDc6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0ZXN0LWZhdGFsLXBlcmw6IHVwZ3JhZGUgMC4wMTcgLT4gMC4wMTgKCi0tLQogLi4uL3Blcmwv
bGlidGVzdC1mYXRhbC1wZXJsXzAuMDE3LmJiICAgICAgICAgIHwgIDM2IC0tCiAuLi4vcGVybC9s
aWJ0ZXN0LWZhdGFsLXBlcmxfMC4wMTguYmIgICAgICAgICAgfCAzMTAgKysrKysrKysrKysrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDMxMCBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LWZh
dGFsLXBlcmxfMC4wMTcuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9saWJ0ZXN0LWZhdGFsLXBlcmxfMC4wMTguYmIKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LWZhdGFsLXBlcmxfMC4wMTcuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LWZhdGFsLXBlcmxfMC4wMTcuYmIKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IGVhZTEyOGIwY2MuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC1mYXRhbC1wZXJsXzAuMDE3LmJiCisrKyAvZGV2
L251bGwKQEAgLTEsMzYgKzAsMCBAQAotU1VNTUFSWSA9ICJJbmNyZWRpYmx5IHNpbXBsZSBoZWxw
ZXJzIGZvciB0ZXN0aW5nIGNvZGUgd2l0aCBleGNlcHRpb25zIgotREVTQ1JJUFRJT04gPSAiVGVz
dDo6RmF0YWwgaXMgYW4gYWx0ZXJuYXRpdmUgdG8gdGhlIHBvcHVsYXIgVGVzdDo6RXhjZXB0aW9u
LlwKLUl0IGRvZXMgbXVjaCBsZXNzLCBidXQgc2hvdWxkIGFsbG93IGdyZWF0ZXIgZmxleGliaWxp
dHkgaW4gdGVzdGluZyBcCi1leGNlcHRpb24tdGhyb3dpbmcgY29kZSB3aXRoIGFib3V0IHRoZSBz
YW1lIGFtb3VudCBvZiB0eXBpbmcuIgotSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3Jq
YnMvVGVzdC1GYXRhbCIKLUJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL3JqYnMvVGVz
dC1GYXRhbC9pc3N1ZXMiCi1TRUNUSU9OID0gImxpYnMiCi1MSUNFTlNFID0gIkFydGlzdGljLTEu
MCB8IEdQTC0xLjAtb3ItbGF0ZXIiCi0KLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0U7bWQ1PWI1Yzg1MTI5MGNhYjFkZGExMmZjZmIwZTllYzQzNjM5IgotCi1TUkNfVVJJID0gIiR7
Q1BBTl9NSVJST1J9L2F1dGhvcnMvaWQvUi9SSi9SSkJTL1Rlc3QtRmF0YWwtJHtQVn0udGFyLmd6
IgotCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzdkZmZmZGFmYjg0Yjc2MmVmZTk2YjAyZmIyYWE0
MWYzNzAyNmM3M2U2YjgzNTkwZGI3NjIyOTY5N2YzYzRhNiIKLQotUyA9ICIke1VOUEFDS0RJUn0v
VGVzdC1GYXRhbC0ke1BWfSIKLQotaW5oZXJpdCBjcGFuIHB0ZXN0LXBlcmwKLQotUkRFUEVORFM6
JHtQTn0gKz0gIlwKLSAgICBsaWJ0cnktdGlueS1wZXJsIFwKLSAgICBwZXJsLW1vZHVsZS1jYXJw
IFwKLSAgICBwZXJsLW1vZHVsZS1leHBvcnRlciBcCi0gICAgcGVybC1tb2R1bGUtdGVzdC1idWls
ZGVyIFwKLSIKLQotUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0gIlwKLSAgICBwZXJsLW1vZHVsZS1l
eHR1dGlscy1tYWtlbWFrZXIgXAotICAgIHBlcmwtbW9kdWxlLWV4dHV0aWxzLW1tLXVuaXggXAot
ICAgIHBlcmwtbW9kdWxlLWZpbGUtc3BlYyBcCi0gICAgcGVybC1tb2R1bGUtb3ZlcmxvYWQgXAot
ICAgIHBlcmwtbW9kdWxlLXRlc3QtYnVpbGRlci10ZXN0ZXIgXAotICAgIHBlcmwtbW9kdWxlLXRl
c3QtbW9yZSBcCi0iCi0KLUJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnRlc3QtZmF0YWwtcGVybF8wLjAx
OC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnRlc3QtZmF0YWwtcGVybF8wLjAx
OC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi40YmY0Y2MyYTMxCi0t
LSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC1mYXRh
bC1wZXJsXzAuMDE4LmJiCkBAIC0wLDAgKzEsMzEwIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVT
X0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisj
IFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUg
bmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBu
ZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdl
IHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6
IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0g
TElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMjIsNyArMjIsNyBAQAorIyAgICAgICAgICAg
ICAgICAgICAgICAgVmVyc2lvbiAxLCBGZWJydWFyeSAxOTg5CisjICAKKyMgICBDb3B5cmlnaHQg
KEMpIDE5ODkgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisjIC0gNTEgRnJhbmtsaW4g
U3QsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxICBVU0EKKyMgKyAgICAgICAg
ICAgICAgICAgICAgPGh0dHBzOi8vZnNmLm9yZy8+CisjICAKKyMgICBFdmVyeW9uZSBpcyBwZXJt
aXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlz
IGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgQEAg
LTIzNiw4ICsyMzYsNyBAQAorIyAgICAgIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBt
b3JlIGRldGFpbHMuCisjICAKKyMgICAgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorIyAtICAgIGFsb25nIHdpdGggdGhp
cyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCisjIC0gICAgRm91
bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uIE1B
ICAwMjExMC0xMzAxIFVTQQorIyArICAgIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3Qs
IHNlZSA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorIyAgCisjICAKKyMgIEFsc28g
YWRkIGluZm9ybWF0aW9uIG9uIGhvdyB0byBjb250YWN0IHlvdSBieSBlbGVjdHJvbmljIGFuZCBw
YXBlciBtYWlsLgorIyBAQCAtMjY0LDExNiArMjYzLDE0OSBAQAorIyAgICBwcm9ncmFtIGBHbm9t
b3Zpc2lvbicgKGEgcHJvZ3JhbSB0byBkaXJlY3QgY29tcGlsZXJzIHRvIG1ha2UgcGFzc2VzCisj
ICAgIGF0IGFzc2VtYmxlcnMpIHdyaXR0ZW4gYnkgSmFtZXMgSGFja2VyLgorIyAgCisjIC0gIDxz
aWduYXR1cmUgb2YgVHkgQ29vbj4sIDEgQXByaWwgMTk4OQorIyAtICBUeSBDb29uLCBQcmVzaWRl
bnQgb2YgVmljZQorIyArICA8c2lnbmF0dXJlIG9mIE1vZSBHaG91bD4sIDEgQXByaWwgMTk4OQor
IyArICBNb2UgR2hvdWwsIFByZXNpZGVudCBvZiBWaWNlCisjICAKKyMgIFRoYXQncyBhbGwgdGhl
cmUgaXMgdG8gaXQhCisjICAKKyMgIAorIyAtLS0tIFRoZSBBcnRpc3RpYyBMaWNlbnNlIDEuMCAt
LS0KKyMgKy0tLSBUaGUgUGVybCBBcnRpc3RpYyBMaWNlbnNlIDEuMCAtLS0KKyMgIAorIyAgVGhp
cyBzb2Z0d2FyZSBpcyBDb3B5cmlnaHQgKGMpIDIwMTAgYnkgUmljYXJkbyBTaWduZXMuCisjICAK
KyMgIFRoaXMgaXMgZnJlZSBzb2Z0d2FyZSwgbGljZW5zZWQgdW5kZXI6CisjICAKKyMgLSAgVGhl
IEFydGlzdGljIExpY2Vuc2UgMS4wCisjIC0KKyMgLVRoZSBBcnRpc3RpYyBMaWNlbnNlCisjIC0K
KyMgLVByZWFtYmxlCisjIC0KKyMgLVRoZSBpbnRlbnQgb2YgdGhpcyBkb2N1bWVudCBpcyB0byBz
dGF0ZSB0aGUgY29uZGl0aW9ucyB1bmRlciB3aGljaCBhIFBhY2thZ2UKKyMgLW1heSBiZSBjb3Bp
ZWQsIHN1Y2ggdGhhdCB0aGUgQ29weXJpZ2h0IEhvbGRlciBtYWludGFpbnMgc29tZSBzZW1ibGFu
Y2Ugb2YKKyMgLWFydGlzdGljIGNvbnRyb2wgb3ZlciB0aGUgZGV2ZWxvcG1lbnQgb2YgdGhlIHBh
Y2thZ2UsIHdoaWxlIGdpdmluZyB0aGUgdXNlcnMgb2YKKyMgLXRoZSBwYWNrYWdlIHRoZSByaWdo
dCB0byB1c2UgYW5kIGRpc3RyaWJ1dGUgdGhlIFBhY2thZ2UgaW4gYSBtb3JlLW9yLWxlc3MKKyMg
LWN1c3RvbWFyeSBmYXNoaW9uLCBwbHVzIHRoZSByaWdodCB0byBtYWtlIHJlYXNvbmFibGUgbW9k
aWZpY2F0aW9ucy4KKyMgKyAgVGhlIFBlcmwgQXJ0aXN0aWMgTGljZW5zZSAxLjAKKyMgKworIyAr
CisjICsKKyMgKworIyArCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgVGhlICJBcnRpc3Rp
YyBMaWNlbnNlIgorIyArCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFByZWFt
YmxlCisjICsKKyMgK1RoZSBpbnRlbnQgb2YgdGhpcyBkb2N1bWVudCBpcyB0byBzdGF0ZSB0aGUg
Y29uZGl0aW9ucyB1bmRlciB3aGljaCBhCisjICtQYWNrYWdlIG1heSBiZSBjb3BpZWQsIHN1Y2gg
dGhhdCB0aGUgQ29weXJpZ2h0IEhvbGRlciBtYWludGFpbnMgc29tZQorIyArc2VtYmxhbmNlIG9m
IGFydGlzdGljIGNvbnRyb2wgb3ZlciB0aGUgZGV2ZWxvcG1lbnQgb2YgdGhlIHBhY2thZ2UsCisj
ICt3aGlsZSBnaXZpbmcgdGhlIHVzZXJzIG9mIHRoZSBwYWNrYWdlIHRoZSByaWdodCB0byB1c2Ug
YW5kIGRpc3RyaWJ1dGUKKyMgK3RoZSBQYWNrYWdlIGluIGEgbW9yZS1vci1sZXNzIGN1c3RvbWFy
eSBmYXNoaW9uLCBwbHVzIHRoZSByaWdodCB0byBtYWtlCisjICtyZWFzb25hYmxlIG1vZGlmaWNh
dGlvbnMuCisjICAKKyMgIERlZmluaXRpb25zOgorIyAgCisjIC0gIC0gIlBhY2thZ2UiIHJlZmVy
cyB0byB0aGUgY29sbGVjdGlvbiBvZiBmaWxlcyBkaXN0cmlidXRlZCBieSB0aGUgQ29weXJpZ2h0
CisjIC0gICAgSG9sZGVyLCBhbmQgZGVyaXZhdGl2ZXMgb2YgdGhhdCBjb2xsZWN0aW9uIG9mIGZp
bGVzIGNyZWF0ZWQgdGhyb3VnaAorIyAtICAgIHRleHR1YWwgbW9kaWZpY2F0aW9uLgorIyAtICAt
ICJTdGFuZGFyZCBWZXJzaW9uIiByZWZlcnMgdG8gc3VjaCBhIFBhY2thZ2UgaWYgaXQgaGFzIG5v
dCBiZWVuIG1vZGlmaWVkLAorIyAtICAgIG9yIGhhcyBiZWVuIG1vZGlmaWVkIGluIGFjY29yZGFu
Y2Ugd2l0aCB0aGUgd2lzaGVzIG9mIHRoZSBDb3B5cmlnaHQKKyMgLSAgICBIb2xkZXIuCisjIC0g
IC0gIkNvcHlyaWdodCBIb2xkZXIiIGlzIHdob2V2ZXIgaXMgbmFtZWQgaW4gdGhlIGNvcHlyaWdo
dCBvciBjb3B5cmlnaHRzIGZvcgorIyAtICAgIHRoZSBwYWNrYWdlLgorIyAtICAtICJZb3UiIGlz
IHlvdSwgaWYgeW91J3JlIHRoaW5raW5nIGFib3V0IGNvcHlpbmcgb3IgZGlzdHJpYnV0aW5nIHRo
aXMgUGFja2FnZS4KKyMgLSAgLSAiUmVhc29uYWJsZSBjb3B5aW5nIGZlZSIgaXMgd2hhdGV2ZXIg
eW91IGNhbiBqdXN0aWZ5IG9uIHRoZSBiYXNpcyBvZiBtZWRpYQorIyAtICAgIGNvc3QsIGR1cGxp
Y2F0aW9uIGNoYXJnZXMsIHRpbWUgb2YgcGVvcGxlIGludm9sdmVkLCBhbmQgc28gb24uIChZb3Ug
d2lsbAorIyAtICAgIG5vdCBiZSByZXF1aXJlZCB0byBqdXN0aWZ5IGl0IHRvIHRoZSBDb3B5cmln
aHQgSG9sZGVyLCBidXQgb25seSB0byB0aGUKKyMgLSAgICBjb21wdXRpbmcgY29tbXVuaXR5IGF0
IGxhcmdlIGFzIGEgbWFya2V0IHRoYXQgbXVzdCBiZWFyIHRoZSBmZWUuKQorIyAtICAtICJGcmVl
bHkgQXZhaWxhYmxlIiBtZWFucyB0aGF0IG5vIGZlZSBpcyBjaGFyZ2VkIGZvciB0aGUgaXRlbSBp
dHNlbGYsIHRob3VnaAorIyAtICAgIHRoZXJlIG1heSBiZSBmZWVzIGludm9sdmVkIGluIGhhbmRs
aW5nIHRoZSBpdGVtLiBJdCBhbHNvIG1lYW5zIHRoYXQKKyMgLSAgICByZWNpcGllbnRzIG9mIHRo
ZSBpdGVtIG1heSByZWRpc3RyaWJ1dGUgaXQgdW5kZXIgdGhlIHNhbWUgY29uZGl0aW9ucyB0aGV5
CisjIC0gICAgcmVjZWl2ZWQgaXQuCisjICsgICAgICAgICJQYWNrYWdlIiByZWZlcnMgdG8gdGhl
IGNvbGxlY3Rpb24gb2YgZmlsZXMgZGlzdHJpYnV0ZWQgYnkgdGhlCisjICsgICAgICAgIENvcHly
aWdodCBIb2xkZXIsIGFuZCBkZXJpdmF0aXZlcyBvZiB0aGF0IGNvbGxlY3Rpb24gb2YgZmlsZXMK
KyMgKyAgICAgICAgY3JlYXRlZCB0aHJvdWdoIHRleHR1YWwgbW9kaWZpY2F0aW9uLgorIyArCisj
ICsgICAgICAgICJTdGFuZGFyZCBWZXJzaW9uIiByZWZlcnMgdG8gc3VjaCBhIFBhY2thZ2UgaWYg
aXQgaGFzIG5vdCBiZWVuCisjICsgICAgICAgIG1vZGlmaWVkLCBvciBoYXMgYmVlbiBtb2RpZmll
ZCBpbiBhY2NvcmRhbmNlIHdpdGggdGhlIHdpc2hlcworIyArICAgICAgICBvZiB0aGUgQ29weXJp
Z2h0IEhvbGRlciBhcyBzcGVjaWZpZWQgYmVsb3cuCisjICsKKyMgKyAgICAgICAgIkNvcHlyaWdo
dCBIb2xkZXIiIGlzIHdob2V2ZXIgaXMgbmFtZWQgaW4gdGhlIGNvcHlyaWdodCBvcgorIyArICAg
ICAgICBjb3B5cmlnaHRzIGZvciB0aGUgcGFja2FnZS4KKyMgKworIyArICAgICAgICAiWW91IiBp
cyB5b3UsIGlmIHlvdSdyZSB0aGlua2luZyBhYm91dCBjb3B5aW5nIG9yIGRpc3RyaWJ1dGluZwor
IyArICAgICAgICB0aGlzIFBhY2thZ2UuCisjICsKKyMgKyAgICAgICAgIlJlYXNvbmFibGUgY29w
eWluZyBmZWUiIGlzIHdoYXRldmVyIHlvdSBjYW4ganVzdGlmeSBvbiB0aGUKKyMgKyAgICAgICAg
YmFzaXMgb2YgbWVkaWEgY29zdCwgZHVwbGljYXRpb24gY2hhcmdlcywgdGltZSBvZiBwZW9wbGUg
aW52b2x2ZWQsCisjICsgICAgICAgIGFuZCBzbyBvbi4gIChZb3Ugd2lsbCBub3QgYmUgcmVxdWly
ZWQgdG8ganVzdGlmeSBpdCB0byB0aGUKKyMgKyAgICAgICAgQ29weXJpZ2h0IEhvbGRlciwgYnV0
IG9ubHkgdG8gdGhlIGNvbXB1dGluZyBjb21tdW5pdHkgYXQgbGFyZ2UKKyMgKyAgICAgICAgYXMg
YSBtYXJrZXQgdGhhdCBtdXN0IGJlYXIgdGhlIGZlZS4pCisjICsKKyMgKyAgICAgICAgIkZyZWVs
eSBBdmFpbGFibGUiIG1lYW5zIHRoYXQgbm8gZmVlIGlzIGNoYXJnZWQgZm9yIHRoZSBpdGVtCisj
ICsgICAgICAgIGl0c2VsZiwgdGhvdWdoIHRoZXJlIG1heSBiZSBmZWVzIGludm9sdmVkIGluIGhh
bmRsaW5nIHRoZSBpdGVtLgorIyArICAgICAgICBJdCBhbHNvIG1lYW5zIHRoYXQgcmVjaXBpZW50
cyBvZiB0aGUgaXRlbSBtYXkgcmVkaXN0cmlidXRlIGl0CisjICsgICAgICAgIHVuZGVyIHRoZSBz
YW1lIGNvbmRpdGlvbnMgdGhleSByZWNlaXZlZCBpdC4KKyMgIAorIyAgMS4gWW91IG1heSBtYWtl
IGFuZCBnaXZlIGF3YXkgdmVyYmF0aW0gY29waWVzIG9mIHRoZSBzb3VyY2UgZm9ybSBvZiB0aGUK
KyMgIFN0YW5kYXJkIFZlcnNpb24gb2YgdGhpcyBQYWNrYWdlIHdpdGhvdXQgcmVzdHJpY3Rpb24s
IHByb3ZpZGVkIHRoYXQgeW91CisjICBkdXBsaWNhdGUgYWxsIG9mIHRoZSBvcmlnaW5hbCBjb3B5
cmlnaHQgbm90aWNlcyBhbmQgYXNzb2NpYXRlZCBkaXNjbGFpbWVycy4KKyMgIAorIyAtMi4gWW91
IG1heSBhcHBseSBidWcgZml4ZXMsIHBvcnRhYmlsaXR5IGZpeGVzIGFuZCBvdGhlciBtb2RpZmlj
YXRpb25zIGRlcml2ZWQKKyMgLWZyb20gdGhlIFB1YmxpYyBEb21haW4gb3IgZnJvbSB0aGUgQ29w
eXJpZ2h0IEhvbGRlci4gQSBQYWNrYWdlIG1vZGlmaWVkIGluIHN1Y2gKKyMgLWEgd2F5IHNoYWxs
IHN0aWxsIGJlIGNvbnNpZGVyZWQgdGhlIFN0YW5kYXJkIFZlcnNpb24uCisjIC0KKyMgLTMuIFlv
dSBtYXkgb3RoZXJ3aXNlIG1vZGlmeSB5b3VyIGNvcHkgb2YgdGhpcyBQYWNrYWdlIGluIGFueSB3
YXksIHByb3ZpZGVkIHRoYXQKKyMgLXlvdSBpbnNlcnQgYSBwcm9taW5lbnQgbm90aWNlIGluIGVh
Y2ggY2hhbmdlZCBmaWxlIHN0YXRpbmcgaG93IGFuZCB3aGVuIHlvdQorIyAtY2hhbmdlZCB0aGF0
IGZpbGUsIGFuZCBwcm92aWRlZCB0aGF0IHlvdSBkbyBhdCBsZWFzdCBPTkUgb2YgdGhlIGZvbGxv
d2luZzoKKyMgLQorIyAtICBhKSBwbGFjZSB5b3VyIG1vZGlmaWNhdGlvbnMgaW4gdGhlIFB1Ymxp
YyBEb21haW4gb3Igb3RoZXJ3aXNlIG1ha2UgdGhlbQorIyAtICAgICBGcmVlbHkgQXZhaWxhYmxl
LCBzdWNoIGFzIGJ5IHBvc3Rpbmcgc2FpZCBtb2RpZmljYXRpb25zIHRvIFVzZW5ldCBvciBhbgor
IyAtICAgICBlcXVpdmFsZW50IG1lZGl1bSwgb3IgcGxhY2luZyB0aGUgbW9kaWZpY2F0aW9ucyBv
biBhIG1ham9yIGFyY2hpdmUgc2l0ZQorIyAtICAgICBzdWNoIGFzIGZ0cC51dS5uZXQsIG9yIGJ5
IGFsbG93aW5nIHRoZSBDb3B5cmlnaHQgSG9sZGVyIHRvIGluY2x1ZGUgeW91cgorIyAtICAgICBt
b2RpZmljYXRpb25zIGluIHRoZSBTdGFuZGFyZCBWZXJzaW9uIG9mIHRoZSBQYWNrYWdlLgorIyAt
CisjIC0gIGIpIHVzZSB0aGUgbW9kaWZpZWQgUGFja2FnZSBvbmx5IHdpdGhpbiB5b3VyIGNvcnBv
cmF0aW9uIG9yIG9yZ2FuaXphdGlvbi4KKyMgLQorIyAtICBjKSByZW5hbWUgYW55IG5vbi1zdGFu
ZGFyZCBleGVjdXRhYmxlcyBzbyB0aGUgbmFtZXMgZG8gbm90IGNvbmZsaWN0IHdpdGgKKyMgLSAg
ICAgc3RhbmRhcmQgZXhlY3V0YWJsZXMsIHdoaWNoIG11c3QgYWxzbyBiZSBwcm92aWRlZCwgYW5k
IHByb3ZpZGUgYSBzZXBhcmF0ZQorIyAtICAgICBtYW51YWwgcGFnZSBmb3IgZWFjaCBub24tc3Rh
bmRhcmQgZXhlY3V0YWJsZSB0aGF0IGNsZWFybHkgZG9jdW1lbnRzIGhvdyBpdAorIyAtICAgICBk
aWZmZXJzIGZyb20gdGhlIFN0YW5kYXJkIFZlcnNpb24uCisjIC0KKyMgLSAgZCkgbWFrZSBvdGhl
ciBkaXN0cmlidXRpb24gYXJyYW5nZW1lbnRzIHdpdGggdGhlIENvcHlyaWdodCBIb2xkZXIuCisj
IC0KKyMgLTQuIFlvdSBtYXkgZGlzdHJpYnV0ZSB0aGUgcHJvZ3JhbXMgb2YgdGhpcyBQYWNrYWdl
IGluIG9iamVjdCBjb2RlIG9yIGV4ZWN1dGFibGUKKyMgLWZvcm0sIHByb3ZpZGVkIHRoYXQgeW91
IGRvIGF0IGxlYXN0IE9ORSBvZiB0aGUgZm9sbG93aW5nOgorIyAtCisjIC0gIGEpIGRpc3RyaWJ1
dGUgYSBTdGFuZGFyZCBWZXJzaW9uIG9mIHRoZSBleGVjdXRhYmxlcyBhbmQgbGlicmFyeSBmaWxl
cywKKyMgLSAgICAgdG9nZXRoZXIgd2l0aCBpbnN0cnVjdGlvbnMgKGluIHRoZSBtYW51YWwgcGFn
ZSBvciBlcXVpdmFsZW50KSBvbiB3aGVyZSB0bworIyAtICAgICBnZXQgdGhlIFN0YW5kYXJkIFZl
cnNpb24uCisjIC0KKyMgLSAgYikgYWNjb21wYW55IHRoZSBkaXN0cmlidXRpb24gd2l0aCB0aGUg
bWFjaGluZS1yZWFkYWJsZSBzb3VyY2Ugb2YgdGhlIFBhY2thZ2UKKyMgLSAgICAgd2l0aCB5b3Vy
IG1vZGlmaWNhdGlvbnMuCisjIC0KKyMgLSAgYykgYWNjb21wYW55IGFueSBub24tc3RhbmRhcmQg
ZXhlY3V0YWJsZXMgd2l0aCB0aGVpciBjb3JyZXNwb25kaW5nIFN0YW5kYXJkCisjIC0gICAgIFZl
cnNpb24gZXhlY3V0YWJsZXMsIGdpdmluZyB0aGUgbm9uLXN0YW5kYXJkIGV4ZWN1dGFibGVzIG5v
bi1zdGFuZGFyZAorIyAtICAgICBuYW1lcywgYW5kIGNsZWFybHkgZG9jdW1lbnRpbmcgdGhlIGRp
ZmZlcmVuY2VzIGluIG1hbnVhbCBwYWdlcyAob3IKKyMgLSAgICAgZXF1aXZhbGVudCksIHRvZ2V0
aGVyIHdpdGggaW5zdHJ1Y3Rpb25zIG9uIHdoZXJlIHRvIGdldCB0aGUgU3RhbmRhcmQKKyMgLSAg
ICAgVmVyc2lvbi4KKyMgLQorIyAtICBkKSBtYWtlIG90aGVyIGRpc3RyaWJ1dGlvbiBhcnJhbmdl
bWVudHMgd2l0aCB0aGUgQ29weXJpZ2h0IEhvbGRlci4KKyMgKzIuIFlvdSBtYXkgYXBwbHkgYnVn
IGZpeGVzLCBwb3J0YWJpbGl0eSBmaXhlcyBhbmQgb3RoZXIgbW9kaWZpY2F0aW9ucworIyArZGVy
aXZlZCBmcm9tIHRoZSBQdWJsaWMgRG9tYWluIG9yIGZyb20gdGhlIENvcHlyaWdodCBIb2xkZXIu
ICBBIFBhY2thZ2UKKyMgK21vZGlmaWVkIGluIHN1Y2ggYSB3YXkgc2hhbGwgc3RpbGwgYmUgY29u
c2lkZXJlZCB0aGUgU3RhbmRhcmQgVmVyc2lvbi4KKyMgKworIyArMy4gWW91IG1heSBvdGhlcndp
c2UgbW9kaWZ5IHlvdXIgY29weSBvZiB0aGlzIFBhY2thZ2UgaW4gYW55IHdheSwgcHJvdmlkZWQK
KyMgK3RoYXQgeW91IGluc2VydCBhIHByb21pbmVudCBub3RpY2UgaW4gZWFjaCBjaGFuZ2VkIGZp
bGUgc3RhdGluZyBob3cgYW5kCisjICt3aGVuIHlvdSBjaGFuZ2VkIHRoYXQgZmlsZSwgYW5kIHBy
b3ZpZGVkIHRoYXQgeW91IGRvIGF0IGxlYXN0IE9ORSBvZiB0aGUKKyMgK2ZvbGxvd2luZzoKKyMg
KworIyArICAgIGEpIHBsYWNlIHlvdXIgbW9kaWZpY2F0aW9ucyBpbiB0aGUgUHVibGljIERvbWFp
biBvciBvdGhlcndpc2UgbWFrZSB0aGVtCisjICsgICAgRnJlZWx5IEF2YWlsYWJsZSwgc3VjaCBh
cyBieSBwb3N0aW5nIHNhaWQgbW9kaWZpY2F0aW9ucyB0byBVc2VuZXQgb3IKKyMgKyAgICBhbiBl
cXVpdmFsZW50IG1lZGl1bSwgb3IgcGxhY2luZyB0aGUgbW9kaWZpY2F0aW9ucyBvbiBhIG1ham9y
IGFyY2hpdmUKKyMgKyAgICBzaXRlIHN1Y2ggYXMgdXVuZXQudXUubmV0LCBvciBieSBhbGxvd2lu
ZyB0aGUgQ29weXJpZ2h0IEhvbGRlciB0byBpbmNsdWRlCisjICsgICAgeW91ciBtb2RpZmljYXRp
b25zIGluIHRoZSBTdGFuZGFyZCBWZXJzaW9uIG9mIHRoZSBQYWNrYWdlLgorIyArCisjICsgICAg
YikgdXNlIHRoZSBtb2RpZmllZCBQYWNrYWdlIG9ubHkgd2l0aGluIHlvdXIgY29ycG9yYXRpb24g
b3Igb3JnYW5pemF0aW9uLgorIyArCisjICsgICAgYykgcmVuYW1lIGFueSBub24tc3RhbmRhcmQg
ZXhlY3V0YWJsZXMgc28gdGhlIG5hbWVzIGRvIG5vdCBjb25mbGljdAorIyArICAgIHdpdGggc3Rh
bmRhcmQgZXhlY3V0YWJsZXMsIHdoaWNoIG11c3QgYWxzbyBiZSBwcm92aWRlZCwgYW5kIHByb3Zp
ZGUKKyMgKyAgICBhIHNlcGFyYXRlIG1hbnVhbCBwYWdlIGZvciBlYWNoIG5vbi1zdGFuZGFyZCBl
eGVjdXRhYmxlIHRoYXQgY2xlYXJseQorIyArICAgIGRvY3VtZW50cyBob3cgaXQgZGlmZmVycyBm
cm9tIHRoZSBTdGFuZGFyZCBWZXJzaW9uLgorIyArCisjICsgICAgZCkgbWFrZSBvdGhlciBkaXN0
cmlidXRpb24gYXJyYW5nZW1lbnRzIHdpdGggdGhlIENvcHlyaWdodCBIb2xkZXIuCisjICsKKyMg
KzQuIFlvdSBtYXkgZGlzdHJpYnV0ZSB0aGUgcHJvZ3JhbXMgb2YgdGhpcyBQYWNrYWdlIGluIG9i
amVjdCBjb2RlIG9yCisjICtleGVjdXRhYmxlIGZvcm0sIHByb3ZpZGVkIHRoYXQgeW91IGRvIGF0
IGxlYXN0IE9ORSBvZiB0aGUgZm9sbG93aW5nOgorIyArCisjICsgICAgYSkgZGlzdHJpYnV0ZSBh
IFN0YW5kYXJkIFZlcnNpb24gb2YgdGhlIGV4ZWN1dGFibGVzIGFuZCBsaWJyYXJ5IGZpbGVzLAor
IyArICAgIHRvZ2V0aGVyIHdpdGggaW5zdHJ1Y3Rpb25zIChpbiB0aGUgbWFudWFsIHBhZ2Ugb3Ig
ZXF1aXZhbGVudCkgb24gd2hlcmUKKyMgKyAgICB0byBnZXQgdGhlIFN0YW5kYXJkIFZlcnNpb24u
CisjICsKKyMgKyAgICBiKSBhY2NvbXBhbnkgdGhlIGRpc3RyaWJ1dGlvbiB3aXRoIHRoZSBtYWNo
aW5lLXJlYWRhYmxlIHNvdXJjZSBvZgorIyArICAgIHRoZSBQYWNrYWdlIHdpdGggeW91ciBtb2Rp
ZmljYXRpb25zLgorIyArCisjICsgICAgYykgZ2l2ZSBub24tc3RhbmRhcmQgZXhlY3V0YWJsZXMg
bm9uLXN0YW5kYXJkIG5hbWVzLCBhbmQgY2xlYXJseQorIyArICAgIGRvY3VtZW50IHRoZSBkaWZm
ZXJlbmNlcyBpbiBtYW51YWwgcGFnZXMgKG9yIGVxdWl2YWxlbnQpLCB0b2dldGhlcgorIyArICAg
IHdpdGggaW5zdHJ1Y3Rpb25zIG9uIHdoZXJlIHRvIGdldCB0aGUgU3RhbmRhcmQgVmVyc2lvbi4K
KyMgKworIyArICAgIGQpIG1ha2Ugb3RoZXIgZGlzdHJpYnV0aW9uIGFycmFuZ2VtZW50cyB3aXRo
IHRoZSBDb3B5cmlnaHQgSG9sZGVyLgorIyAgCisjICA1LiBZb3UgbWF5IGNoYXJnZSBhIHJlYXNv
bmFibGUgY29weWluZyBmZWUgZm9yIGFueSBkaXN0cmlidXRpb24gb2YgdGhpcworIyAtUGFja2Fn
ZS4gIFlvdSBtYXkgY2hhcmdlIGFueSBmZWUgeW91IGNob29zZSBmb3Igc3VwcG9ydCBvZiB0aGlz
IFBhY2thZ2UuIFlvdQorIyAtbWF5IG5vdCBjaGFyZ2UgYSBmZWUgZm9yIHRoaXMgUGFja2FnZSBp
dHNlbGYuIEhvd2V2ZXIsIHlvdSBtYXkgZGlzdHJpYnV0ZSB0aGlzCisjIC1QYWNrYWdlIGluIGFn
Z3JlZ2F0ZSB3aXRoIG90aGVyIChwb3NzaWJseSBjb21tZXJjaWFsKSBwcm9ncmFtcyBhcyBwYXJ0
IG9mIGEKKyMgLWxhcmdlciAocG9zc2libHkgY29tbWVyY2lhbCkgc29mdHdhcmUgZGlzdHJpYnV0
aW9uIHByb3ZpZGVkIHRoYXQgeW91IGRvIG5vdAorIyAtYWR2ZXJ0aXNlIHRoaXMgUGFja2FnZSBh
cyBhIHByb2R1Y3Qgb2YgeW91ciBvd24uCisjIC0KKyMgLTYuIFRoZSBzY3JpcHRzIGFuZCBsaWJy
YXJ5IGZpbGVzIHN1cHBsaWVkIGFzIGlucHV0IHRvIG9yIHByb2R1Y2VkIGFzIG91dHB1dAorIyAt
ZnJvbSB0aGUgcHJvZ3JhbXMgb2YgdGhpcyBQYWNrYWdlIGRvIG5vdCBhdXRvbWF0aWNhbGx5IGZh
bGwgdW5kZXIgdGhlIGNvcHlyaWdodAorIyAtb2YgdGhpcyBQYWNrYWdlLCBidXQgYmVsb25nIHRv
IHdob21ldmVyIGdlbmVyYXRlZCB0aGVtLCBhbmQgbWF5IGJlIHNvbGQKKyMgLWNvbW1lcmNpYWxs
eSwgYW5kIG1heSBiZSBhZ2dyZWdhdGVkIHdpdGggdGhpcyBQYWNrYWdlLgorIyAtCisjIC03LiBD
IG9yIHBlcmwgc3Vicm91dGluZXMgc3VwcGxpZWQgYnkgeW91IGFuZCBsaW5rZWQgaW50byB0aGlz
IFBhY2thZ2Ugc2hhbGwgbm90CisjIC1iZSBjb25zaWRlcmVkIHBhcnQgb2YgdGhpcyBQYWNrYWdl
LgorIyAtCisjIC04LiBUaGUgbmFtZSBvZiB0aGUgQ29weXJpZ2h0IEhvbGRlciBtYXkgbm90IGJl
IHVzZWQgdG8gZW5kb3JzZSBvciBwcm9tb3RlCisjICtQYWNrYWdlLiAgWW91IG1heSBjaGFyZ2Ug
YW55IGZlZSB5b3UgY2hvb3NlIGZvciBzdXBwb3J0IG9mIHRoaXMKKyMgK1BhY2thZ2UuICBZb3Ug
bWF5IG5vdCBjaGFyZ2UgYSBmZWUgZm9yIHRoaXMgUGFja2FnZSBpdHNlbGYuICBIb3dldmVyLAor
IyAreW91IG1heSBkaXN0cmlidXRlIHRoaXMgUGFja2FnZSBpbiBhZ2dyZWdhdGUgd2l0aCBvdGhl
ciAocG9zc2libHkKKyMgK2NvbW1lcmNpYWwpIHByb2dyYW1zIGFzIHBhcnQgb2YgYSBsYXJnZXIg
KHBvc3NpYmx5IGNvbW1lcmNpYWwpIHNvZnR3YXJlCisjICtkaXN0cmlidXRpb24gcHJvdmlkZWQg
dGhhdCB5b3UgZG8gbm90IGFkdmVydGlzZSB0aGlzIFBhY2thZ2UgYXMgYQorIyArcHJvZHVjdCBv
ZiB5b3VyIG93bi4gIFlvdSBtYXkgZW1iZWQgdGhpcyBQYWNrYWdlJ3MgaW50ZXJwcmV0ZXIgd2l0
aGluCisjICthbiBleGVjdXRhYmxlIG9mIHlvdXJzIChieSBsaW5raW5nKTsgdGhpcyBzaGFsbCBi
ZSBjb25zdHJ1ZWQgYXMgYSBtZXJlCisjICtmb3JtIG9mIGFnZ3JlZ2F0aW9uLCBwcm92aWRlZCB0
aGF0IHRoZSBjb21wbGV0ZSBTdGFuZGFyZCBWZXJzaW9uIG9mIHRoZQorIyAraW50ZXJwcmV0ZXIg
aXMgc28gZW1iZWRkZWQuCisjICsKKyMgKzYuIFRoZSBzY3JpcHRzIGFuZCBsaWJyYXJ5IGZpbGVz
IHN1cHBsaWVkIGFzIGlucHV0IHRvIG9yIHByb2R1Y2VkIGFzCisjICtvdXRwdXQgZnJvbSB0aGUg
cHJvZ3JhbXMgb2YgdGhpcyBQYWNrYWdlIGRvIG5vdCBhdXRvbWF0aWNhbGx5IGZhbGwKKyMgK3Vu
ZGVyIHRoZSBjb3B5cmlnaHQgb2YgdGhpcyBQYWNrYWdlLCBidXQgYmVsb25nIHRvIHdob2V2ZXIg
Z2VuZXJhdGVkCisjICt0aGVtLCBhbmQgbWF5IGJlIHNvbGQgY29tbWVyY2lhbGx5LCBhbmQgbWF5
IGJlIGFnZ3JlZ2F0ZWQgd2l0aCB0aGlzCisjICtQYWNrYWdlLiAgSWYgc3VjaCBzY3JpcHRzIG9y
IGxpYnJhcnkgZmlsZXMgYXJlIGFnZ3JlZ2F0ZWQgd2l0aCB0aGlzCisjICtQYWNrYWdlIHZpYSB0
aGUgc28tY2FsbGVkICJ1bmR1bXAiIG9yICJ1bmV4ZWMiIG1ldGhvZHMgb2YgcHJvZHVjaW5nIGEK
KyMgK2JpbmFyeSBleGVjdXRhYmxlIGltYWdlLCB0aGVuIGRpc3RyaWJ1dGlvbiBvZiBzdWNoIGFu
IGltYWdlIHNoYWxsCisjICtuZWl0aGVyIGJlIGNvbnN0cnVlZCBhcyBhIGRpc3RyaWJ1dGlvbiBv
ZiB0aGlzIFBhY2thZ2Ugbm9yIHNoYWxsIGl0CisjICtmYWxsIHVuZGVyIHRoZSByZXN0cmljdGlv
bnMgb2YgUGFyYWdyYXBocyAzIGFuZCA0LCBwcm92aWRlZCB0aGF0IHlvdSBkbworIyArbm90IHJl
cHJlc2VudCBzdWNoIGFuIGV4ZWN1dGFibGUgaW1hZ2UgYXMgYSBTdGFuZGFyZCBWZXJzaW9uIG9m
IHRoaXMKKyMgK1BhY2thZ2UuCisjICsKKyMgKzcuIEMgc3Vicm91dGluZXMgKG9yIGNvbXBhcmFi
bHkgY29tcGlsZWQgc3Vicm91dGluZXMgaW4gb3RoZXIKKyMgK2xhbmd1YWdlcykgc3VwcGxpZWQg
YnkgeW91IGFuZCBsaW5rZWQgaW50byB0aGlzIFBhY2thZ2UgaW4gb3JkZXIgdG8KKyMgK2VtdWxh
dGUgc3Vicm91dGluZXMgYW5kIHZhcmlhYmxlcyBvZiB0aGUgbGFuZ3VhZ2UgZGVmaW5lZCBieSB0
aGlzCisjICtQYWNrYWdlIHNoYWxsIG5vdCBiZSBjb25zaWRlcmVkIHBhcnQgb2YgdGhpcyBQYWNr
YWdlLCBidXQgYXJlIHRoZQorIyArZXF1aXZhbGVudCBvZiBpbnB1dCBhcyBpbiBQYXJhZ3JhcGgg
NiwgcHJvdmlkZWQgdGhlc2Ugc3Vicm91dGluZXMgZG8KKyMgK25vdCBjaGFuZ2UgdGhlIGxhbmd1
YWdlIGluIGFueSB3YXkgdGhhdCB3b3VsZCBjYXVzZSBpdCB0byBmYWlsIHRoZQorIyArcmVncmVz
c2lvbiB0ZXN0cyBmb3IgdGhlIGxhbmd1YWdlLgorIyArCisjICs4LiBBZ2dyZWdhdGlvbiBvZiB0
aGlzIFBhY2thZ2Ugd2l0aCBhIGNvbW1lcmNpYWwgZGlzdHJpYnV0aW9uIGlzIGFsd2F5cworIyAr
cGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIHVzZSBvZiB0aGlzIFBhY2thZ2UgaXMgZW1iZWRk
ZWQ7IHRoYXQgaXMsCisjICt3aGVuIG5vIG92ZXJ0IGF0dGVtcHQgaXMgbWFkZSB0byBtYWtlIHRo
aXMgUGFja2FnZSdzIGludGVyZmFjZXMgdmlzaWJsZQorIyArdG8gdGhlIGVuZCB1c2VyIG9mIHRo
ZSBjb21tZXJjaWFsIGRpc3RyaWJ1dGlvbi4gIFN1Y2ggdXNlIHNoYWxsIG5vdCBiZQorIyArY29u
c3RydWVkIGFzIGEgZGlzdHJpYnV0aW9uIG9mIHRoaXMgUGFja2FnZS4KKyMgKworIyArOS4gVGhl
IG5hbWUgb2YgdGhlIENvcHlyaWdodCBIb2xkZXIgbWF5IG5vdCBiZSB1c2VkIHRvIGVuZG9yc2Ug
b3IgcHJvbW90ZQorIyAgcHJvZHVjdHMgZGVyaXZlZCBmcm9tIHRoaXMgc29mdHdhcmUgd2l0aG91
dCBzcGVjaWZpYyBwcmlvciB3cml0dGVuIHBlcm1pc3Npb24uCisjICAKKyMgLTkuIFRISVMgUEFD
S0FHRSBJUyBQUk9WSURFRCAiQVMgSVMiIEFORCBXSVRIT1VUIEFOWSBFWFBSRVNTIE9SIElNUExJ
RUQKKyMgLVdBUlJBTlRJRVMsIElOQ0xVRElORywgV0lUSE9VVCBMSU1JVEFUSU9OLCBUSEUgSU1Q
TElFRCBXQVJSQU5USUVTIE9GCisjIC1NRVJDSEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEg
UEFSVElDVUxBUiBQVVJQT1NFLgorIyAtCisjIC1UaGUgRW5kCisjIC0KKyMgKzEwLiBUSElTIFBB
Q0tBR0UgSVMgUFJPVklERUQgIkFTIElTIiBBTkQgV0lUSE9VVCBBTlkgRVhQUkVTUyBPUgorIyAr
SU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcsIFdJVEhPVVQgTElNSVRBVElPTiwgVEhFIElN
UExJRUQKKyMgK1dBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBB
IFBBUlRJQ1VMQVIgUFVSUE9TRS4KKyMgKworIyArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBUaGUgRW5kCisjICsKKyMgCisjCisKK1NVTU1BUlkgPSAiSW5jcmVkaWJseSBzaW1wbGUg
aGVscGVycyBmb3IgdGVzdGluZyBjb2RlIHdpdGggZXhjZXB0aW9ucyIKK0RFU0NSSVBUSU9OID0g
IlRlc3Q6OkZhdGFsIGlzIGFuIGFsdGVybmF0aXZlIHRvIHRoZSBwb3B1bGFyIFRlc3Q6OkV4Y2Vw
dGlvbi5cCitJdCBkb2VzIG11Y2ggbGVzcywgYnV0IHNob3VsZCBhbGxvdyBncmVhdGVyIGZsZXhp
YmlsaXR5IGluIHRlc3RpbmcgXAorZXhjZXB0aW9uLXRocm93aW5nIGNvZGUgd2l0aCBhYm91dCB0
aGUgc2FtZSBhbW91bnQgb2YgdHlwaW5nLiIKK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNv
bS9yamJzL1Rlc3QtRmF0YWwiCitCVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0aHViLmNvbS9yamJz
L1Rlc3QtRmF0YWwvaXNzdWVzIgorU0VDVElPTiA9ICJsaWJzIgorTElDRU5TRSA9ICJBcnRpc3Rp
Yy0xLjAgfCBHUEwtMS4wLW9yLWxhdGVyIgorCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT1mN2ZjN2Q0YjI2ZGRhZTA4NDNiMDliYTU2MTA5ZTY1YSIKKworU1JDX1VSSSA9
ICIke0NQQU5fTUlSUk9SfS9hdXRob3JzL2lkL1IvUkovUkpCUy9UZXN0LUZhdGFsLSR7UFZ9LnRh
ci5neiIKKworU1JDX1VSSVtzaGEyNTZzdW1dID0gImI4ZDJjY2NmOWVlNDY3MjcxYmM0NzhmOWNm
N2ViYTQ5NTQ1NDUyYmU5MzAyYWUzNTliYzUzOGI4YmY2ODdjZDYiCisKK1MgPSAiJHtVTlBBQ0tE
SVJ9L1Rlc3QtRmF0YWwtJHtQVn0iCisKK2luaGVyaXQgY3BhbiBwdGVzdC1wZXJsCisKK1JERVBF
TkRTOiR7UE59ICs9ICJcCisgICAgbGlidHJ5LXRpbnktcGVybCBcCisgICAgcGVybC1tb2R1bGUt
Y2FycCBcCisgICAgcGVybC1tb2R1bGUtZXhwb3J0ZXIgXAorICAgIHBlcmwtbW9kdWxlLXRlc3Qt
YnVpbGRlciBcCisiCisKK1JERVBFTkRTOiR7UE59LXB0ZXN0ICs9ICJcCisgICAgcGVybC1tb2R1
bGUtZXh0dXRpbHMtbWFrZW1ha2VyIFwKKyAgICBwZXJsLW1vZHVsZS1leHR1dGlscy1tbS11bml4
IFwKKyAgICBwZXJsLW1vZHVsZS1maWxlLXNwZWMgXAorICAgIHBlcmwtbW9kdWxlLW92ZXJsb2Fk
IFwKKyAgICBwZXJsLW1vZHVsZS10ZXN0LWJ1aWxkZXItdGVzdGVyIFwKKyAgICBwZXJsLW1vZHVs
ZS10ZXN0LW1vcmUgXAorIgorCitCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0t
IAoyLjQ3LjEKCg==

--===============9175449448599014746==--

