Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F815C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:32 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.10360.1742048293526563129
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jXALnY5/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pkVdE5Qj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101959a2ba1fe-488e5cf7-6b40-4b14-a0d9-66caa9a68b97-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mbawG47MarEjxgypiECJ/SOngXXsEK2F9WTe5tj4KHA=;
	b=jXALnY5/shJ9sqT9EqHxG2DbKwBcsGwipcYHzJbnK7JKJLMpDnyUUQOM0j0NIqD5
	nDT18WcFXyxIshGyRxCCg/IvljqOqJXu7BSXTVpQPnG8Uxre8effwB/h16FS106PAGf
	bw90MBALHwCXNlyycKON3r2gCG2sLHaYRwh1IOT4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mbawG47MarEjxgypiECJ/SOngXXsEK2F9WTe5tj4KHA=;
	b=pkVdE5Qj8DNcsYs10BrooRvpARrxST0B6/zHpa86Ne4fwBLZVCtMy6ruOIKzINN9
	o0e/1XGLSMpE0M3CqxgzTv5rLgguSQBfoo31ICsndXGXMQLTeKTFoUQISuMoyNQCat/
	ff+7BjmfWoSUqFWLszIyYj+WrkM0F38YfVDWNhc4=
Content-Type: multipart/mixed; boundary="===============6160936738979202296=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libidn2: upgrading to 2.3.8 SUCCEEDED
Message-ID: <010101959a2ba1fe-488e5cf7-6b40-4b14-a0d9-66caa9a68b97-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212931

--===============6160936738979202296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libidn2* to *2.3.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libidn2-upgrade-2.3.7-2.3.8.patch
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
From ca1c4e9dd26848eaf224296f8834b1209d75b005 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 10:32:45 +0000
Subject: [PATCH] libidn2: upgrade 2.3.7 -> 2.3.8

---
 meta/recipes-extended/libidn/libidn2_2.3.7.bb |  33 -
 meta/recipes-extended/libidn/libidn2_2.3.8.bb | 817 ++++++++++++++++++
 2 files changed, 817 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-extended/libidn/libidn2_2.3.7.bb
 create mode 100644 meta/recipes-extended/libidn/libidn2_2.3.8.bb

diff --git a/meta/recipes-extended/libidn/libidn2_2.3.7.bb b/meta/recipes-extended/libidn/libidn2_2.3.7.bb
deleted file mode 100644
index 7ae933e047..0000000000
--- a/meta/recipes-extended/libidn/libidn2_2.3.7.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Internationalized Domain Name support library"
-DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domain Names (IDN) working group."
-HOMEPAGE = "http://www.gnu.org/software/libidn/"
-SECTION = "libs"
-LICENSE = "(GPL-2.0-or-later | LGPL-3.0-only) & GPL-3.0-or-later & Unicode-DFS-2016"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d834ea7d480438ada04e5d846152395 \
-                    file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-                    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.unicode;md5=684cf5f7e3fded3546679424528261a9 \
-                    file://src/idn2.c;endline=16;md5=afc1531bda991ba6338e33a7eff758a0 \
-                    file://lib/idn2.h.in;endline=27;md5=f88d218005a5c45b68a83cecb5bd7f26 \
-                    "
-
-SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4c21a791b610b9519b9d0e12b8097bf2f359b12f8dd92647611a929e6bfd7d64"
-
-DEPENDS = "virtual/libiconv libunistring"
-
-inherit pkgconfig autotools gettext texinfo gtk-doc lib_package
-
-EXTRA_OECONF += "--disable-rpath \
-                 --with-libunistring-prefix=${STAGING_EXECPREFIXDIR} \
-                 "
-
-do_install:append() {
-	# Need to remove any duplicate whitespace too for reproducibility
-	sed -i -e 's|-L${STAGING_LIBDIR}||' -e 's/  */ /g' ${D}${libdir}/pkgconfig/libidn2.pc
-}
-
-LICENSE:${PN} = "(GPL-2.0-or-later | LGPL-3.0-only) & Unicode-DFS-2016"
-LICENSE:${PN}-bin = "GPL-3.0-or-later"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/libidn/libidn2_2.3.8.bb b/meta/recipes-extended/libidn/libidn2_2.3.8.bb
new file mode 100644
index 0000000000..3485e3e23e
--- /dev/null
+++ b/meta/recipes-extended/libidn/libidn2_2.3.8.bb
@@ -0,0 +1,817 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,35 +1,674 @@
+# -Libidn2 COPYING -- Licensing information.                       -*- outline -*-
+# -Copyright (C) 2011-2016 Simon Josefsson
+# -See the end for copying conditions.
+# -
+# -The source code for the C library (libidn2.a or libidn.so) are
+# -licensed under the terms of either the GNU General Public License
+# -version 2.0 or later (see the file COPYINGv2) or the GNU Lesser
+# -General Public License version 3.0 or later (see the file
+# -COPYING.LESSERv3), or both in parallel as here.
+# -
+# -The command line tool, self tests, examples, and other auxiliary
+# -files, are licensed under the GNU General Public License version 3.0
+# -or later.
+# -
+# -The license of the Unicode character data files (which are parsed into
+# -static storage in the library) are documented in COPYING.unicode.
+# -
+# -Other files are licensed as indicated in each file.
+# -
+# -There may be exceptions to these general rules, see each file for
+# -precise information.
+# -
+# -----------------------------------------------------------------------
+# -This file is free software: you can redistribute it and/or modify it
+# -under the terms of the GNU General Public License as published by the
+# -Free Software Foundation, either version 3 of the License, or (at your
+# -option) any later version.
+# -
+# -This file is distributed in the hope that it will be useful, but
+# -WITHOUT ANY WARRANTY; without even the implied warranty of
+# -MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# -General Public License for more details.
+# -
+# -You should have received a copy of the GNU General Public License
+# -along with this file.  If not, see <http://www.gnu.org/licenses/>.
+# +                    GNU GENERAL PUBLIC LICENSE
+# +                       Version 3, 29 June 2007
+# +
+# + Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+# + Everyone is permitted to copy and distribute verbatim copies
+# + of this license document, but changing it is not allowed.
+# +
+# +                            Preamble
+# +
+# +  The GNU General Public License is a free, copyleft license for
+# +software and other kinds of works.
+# +
+# +  The licenses for most software and other practical works are designed
+# +to take away your freedom to share and change the works.  By contrast,
+# +the GNU General Public License is intended to guarantee your freedom to
+# +share and change all versions of a program--to make sure it remains free
+# +software for all its users.  We, the Free Software Foundation, use the
+# +GNU General Public License for most of our software; it applies also to
+# +any other work released this way by its authors.  You can apply it to
+# +your programs, too.
+# +
+# +  When we speak of free software, we are referring to freedom, not
+# +price.  Our General Public Licenses are designed to make sure that you
+# +have the freedom to distribute copies of free software (and charge for
+# +them if you wish), that you receive source code or can get it if you
+# +want it, that you can change the software or use pieces of it in new
+# +free programs, and that you know you can do these things.
+# +
+# +  To protect your rights, we need to prevent others from denying you
+# +these rights or asking you to surrender the rights.  Therefore, you have
+# +certain responsibilities if you distribute copies of the software, or if
+# +you modify it: responsibilities to respect the freedom of others.
+# +
+# +  For example, if you distribute copies of such a program, whether
+# +gratis or for a fee, you must pass on to the recipients the same
+# +freedoms that you received.  You must make sure that they, too, receive
+# +or can get the source code.  And you must show them these terms so they
+# +know their rights.
+# +
+# +  Developers that use the GNU GPL protect your rights with two steps:
+# +(1) assert copyright on the software, and (2) offer you this License
+# +giving you legal permission to copy, distribute and/or modify it.
+# +
+# +  For the developers' and authors' protection, the GPL clearly explains
+# +that there is no warranty for this free software.  For both users' and
+# +authors' sake, the GPL requires that modified versions be marked as
+# +changed, so that their problems will not be attributed erroneously to
+# +authors of previous versions.
+# +
+# +  Some devices are designed to deny users access to install or run
+# +modified versions of the software inside them, although the manufacturer
+# +can do so.  This is fundamentally incompatible with the aim of
+# +protecting users' freedom to change the software.  The systematic
+# +pattern of such abuse occurs in the area of products for individuals to
+# +use, which is precisely where it is most unacceptable.  Therefore, we
+# +have designed this version of the GPL to prohibit the practice for those
+# +products.  If such problems arise substantially in other domains, we
+# +stand ready to extend this provision to those domains in future versions
+# +of the GPL, as needed to protect the freedom of users.
+# +
+# +  Finally, every program is threatened constantly by software patents.
+# +States should not allow patents to restrict development and use of
+# +software on general-purpose computers, but in those that do, we wish to
+# +avoid the special danger that patents applied to a free program could
+# +make it effectively proprietary.  To prevent this, the GPL assures that
+# +patents cannot be used to render the program non-free.
+# +
+# +  The precise terms and conditions for copying, distribution and
+# +modification follow.
+# +
+# +                       TERMS AND CONDITIONS
+# +
+# +  0. Definitions.
+# +
+# +  "This License" refers to version 3 of the GNU General Public License.
+# +
+# +  "Copyright" also means copyright-like laws that apply to other kinds of
+# +works, such as semiconductor masks.
+# +
+# +  "The Program" refers to any copyrightable work licensed under this
+# +License.  Each licensee is addressed as "you".  "Licensees" and
+# +"recipients" may be individuals or organizations.
+# +
+# +  To "modify" a work means to copy from or adapt all or part of the work
+# +in a fashion requiring copyright permission, other than the making of an
+# +exact copy.  The resulting work is called a "modified version" of the
+# +earlier work or a work "based on" the earlier work.
+# +
+# +  A "covered work" means either the unmodified Program or a work based
+# +on the Program.
+# +
+# +  To "propagate" a work means to do anything with it that, without
+# +permission, would make you directly or secondarily liable for
+# +infringement under applicable copyright law, except executing it on a
+# +computer or modifying a private copy.  Propagation includes copying,
+# +distribution (with or without modification), making available to the
+# +public, and in some countries other activities as well.
+# +
+# +  To "convey" a work means any kind of propagation that enables other
+# +parties to make or receive copies.  Mere interaction with a user through
+# +a computer network, with no transfer of a copy, is not conveying.
+# +
+# +  An interactive user interface displays "Appropriate Legal Notices"
+# +to the extent that it includes a convenient and prominently visible
+# +feature that (1) displays an appropriate copyright notice, and (2)
+# +tells the user that there is no warranty for the work (except to the
+# +extent that warranties are provided), that licensees may convey the
+# +work under this License, and how to view a copy of this License.  If
+# +the interface presents a list of user commands or options, such as a
+# +menu, a prominent item in the list meets this criterion.
+# +
+# +  1. Source Code.
+# +
+# +  The "source code" for a work means the preferred form of the work
+# +for making modifications to it.  "Object code" means any non-source
+# +form of a work.
+# +
+# +  A "Standard Interface" means an interface that either is an official
+# +standard defined by a recognized standards body, or, in the case of
+# +interfaces specified for a particular programming language, one that
+# +is widely used among developers working in that language.
+# +
+# +  The "System Libraries" of an executable work include anything, other
+# +than the work as a whole, that (a) is included in the normal form of
+# +packaging a Major Component, but which is not part of that Major
+# +Component, and (b) serves only to enable use of the work with that
+# +Major Component, or to implement a Standard Interface for which an
+# +implementation is available to the public in source code form.  A
+# +"Major Component", in this context, means a major essential component
+# +(kernel, window system, and so on) of the specific operating system
+# +(if any) on which the executable work runs, or a compiler used to
+# +produce the work, or an object code interpreter used to run it.
+# +
+# +  The "Corresponding Source" for a work in object code form means all
+# +the source code needed to generate, install, and (for an executable
+# +work) run the object code and to modify the work, including scripts to
+# +control those activities.  However, it does not include the work's
+# +System Libraries, or general-purpose tools or generally available free
+# +programs which are used unmodified in performing those activities but
+# +which are not part of the work.  For example, Corresponding Source
+# +includes interface definition files associated with source files for
+# +the work, and the source code for shared libraries and dynamically
+# +linked subprograms that the work is specifically designed to require,
+# +such as by intimate data communication or control flow between those
+# +subprograms and other parts of the work.
+# +
+# +  The Corresponding Source need not include anything that users
+# +can regenerate automatically from other parts of the Corresponding
+# +Source.
+# +
+# +  The Corresponding Source for a work in source code form is that
+# +same work.
+# +
+# +  2. Basic Permissions.
+# +
+# +  All rights granted under this License are granted for the term of
+# +copyright on the Program, and are irrevocable provided the stated
+# +conditions are met.  This License explicitly affirms your unlimited
+# +permission to run the unmodified Program.  The output from running a
+# +covered work is covered by this License only if the output, given its
+# +content, constitutes a covered work.  This License acknowledges your
+# +rights of fair use or other equivalent, as provided by copyright law.
+# +
+# +  You may make, run and propagate covered works that you do not
+# +convey, without conditions so long as your license otherwise remains
+# +in force.  You may convey covered works to others for the sole purpose
+# +of having them make modifications exclusively for you, or provide you
+# +with facilities for running those works, provided that you comply with
+# +the terms of this License in conveying all material for which you do
+# +not control copyright.  Those thus making or running the covered works
+# +for you must do so exclusively on your behalf, under your direction
+# +and control, on terms that prohibit them from making any copies of
+# +your copyrighted material outside their relationship with you.
+# +
+# +  Conveying under any other circumstances is permitted solely under
+# +the conditions stated below.  Sublicensing is not allowed; section 10
+# +makes it unnecessary.
+# +
+# +  3. Protecting Users' Legal Rights From Anti-Circumvention Law.
+# +
+# +  No covered work shall be deemed part of an effective technological
+# +measure under any applicable law fulfilling obligations under article
+# +11 of the WIPO copyright treaty adopted on 20 December 1996, or
+# +similar laws prohibiting or restricting circumvention of such
+# +measures.
+# +
+# +  When you convey a covered work, you waive any legal power to forbid
+# +circumvention of technological measures to the extent such circumvention
+# +is effected by exercising rights under this License with respect to
+# +the covered work, and you disclaim any intention to limit operation or
+# +modification of the work as a means of enforcing, against the work's
+# +users, your or third parties' legal rights to forbid circumvention of
+# +technological measures.
+# +
+# +  4. Conveying Verbatim Copies.
+# +
+# +  You may convey verbatim copies of the Program's source code as you
+# +receive it, in any medium, provided that you conspicuously and
+# +appropriately publish on each copy an appropriate copyright notice;
+# +keep intact all notices stating that this License and any
+# +non-permissive terms added in accord with section 7 apply to the code;
+# +keep intact all notices of the absence of any warranty; and give all
+# +recipients a copy of this License along with the Program.
+# +
+# +  You may charge any price or no price for each copy that you convey,
+# +and you may offer support or warranty protection for a fee.
+# +
+# +  5. Conveying Modified Source Versions.
+# +
+# +  You may convey a work based on the Program, or the modifications to
+# +produce it from the Program, in the form of source code under the
+# +terms of section 4, provided that you also meet all of these conditions:
+# +
+# +    a) The work must carry prominent notices stating that you modified
+# +    it, and giving a relevant date.
+# +
+# +    b) The work must carry prominent notices stating that it is
+# +    released under this License and any conditions added under section
+# +    7.  This requirement modifies the requirement in section 4 to
+# +    "keep intact all notices".
+# +
+# +    c) You must license the entire work, as a whole, under this
+# +    License to anyone who comes into possession of a copy.  This
+# +    License will therefore apply, along with any applicable section 7
+# +    additional terms, to the whole of the work, and all its parts,
+# +    regardless of how they are packaged.  This License gives no
+# +    permission to license the work in any other way, but it does not
+# +    invalidate such permission if you have separately received it.
+# +
+# +    d) If the work has interactive user interfaces, each must display
+# +    Appropriate Legal Notices; however, if the Program has interactive
+# +    interfaces that do not display Appropriate Legal Notices, your
+# +    work need not make them do so.
+# +
+# +  A compilation of a covered work with other separate and independent
+# +works, which are not by their nature extensions of the covered work,
+# +and which are not combined with it such as to form a larger program,
+# +in or on a volume of a storage or distribution medium, is called an
+# +"aggregate" if the compilation and its resulting copyright are not
+# +used to limit the access or legal rights of the compilation's users
+# +beyond what the individual works permit.  Inclusion of a covered work
+# +in an aggregate does not cause this License to apply to the other
+# +parts of the aggregate.
+# +
+# +  6. Conveying Non-Source Forms.
+# +
+# +  You may convey a covered work in object code form under the terms
+# +of sections 4 and 5, provided that you also convey the
+# +machine-readable Corresponding Source under the terms of this License,
+# +in one of these ways:
+# +
+# +    a) Convey the object code in, or embodied in, a physical product
+# +    (including a physical distribution medium), accompanied by the
+# +    Corresponding Source fixed on a durable physical medium
+# +    customarily used for software interchange.
+# +
+# +    b) Convey the object code in, or embodied in, a physical product
+# +    (including a physical distribution medium), accompanied by a
+# +    written offer, valid for at least three years and valid for as
+# +    long as you offer spare parts or customer support for that product
+# +    model, to give anyone who possesses the object code either (1) a
+# +    copy of the Corresponding Source for all the software in the
+# +    product that is covered by this License, on a durable physical
+# +    medium customarily used for software interchange, for a price no
+# +    more than your reasonable cost of physically performing this
+# +    conveying of source, or (2) access to copy the
+# +    Corresponding Source from a network server at no charge.
+# +
+# +    c) Convey individual copies of the object code with a copy of the
+# +    written offer to provide the Corresponding Source.  This
+# +    alternative is allowed only occasionally and noncommercially, and
+# +    only if you received the object code with such an offer, in accord
+# +    with subsection 6b.
+# +
+# +    d) Convey the object code by offering access from a designated
+# +    place (gratis or for a charge), and offer equivalent access to the
+# +    Corresponding Source in the same way through the same place at no
+# +    further charge.  You need not require recipients to copy the
+# +    Corresponding Source along with the object code.  If the place to
+# +    copy the object code is a network server, the Corresponding Source
+# +    may be on a different server (operated by you or a third party)
+# +    that supports equivalent copying facilities, provided you maintain
+# +    clear directions next to the object code saying where to find the
+# +    Corresponding Source.  Regardless of what server hosts the
+# +    Corresponding Source, you remain obligated to ensure that it is
+# +    available for as long as needed to satisfy these requirements.
+# +
+# +    e) Convey the object code using peer-to-peer transmission, provided
+# +    you inform other peers where the object code and Corresponding
+# +    Source of the work are being offered to the general public at no
+# +    charge under subsection 6d.
+# +
+# +  A separable portion of the object code, whose source code is excluded
+# +from the Corresponding Source as a System Library, need not be
+# +included in conveying the object code work.
+# +
+# +  A "User Product" is either (1) a "consumer product", which means any
+# +tangible personal property which is normally used for personal, family,
+# +or household purposes, or (2) anything designed or sold for incorporation
+# +into a dwelling.  In determining whether a product is a consumer product,
+# +doubtful cases shall be resolved in favor of coverage.  For a particular
+# +product received by a particular user, "normally used" refers to a
+# +typical or common use of that class of product, regardless of the status
+# +of the particular user or of the way in which the particular user
+# +actually uses, or expects or is expected to use, the product.  A product
+# +is a consumer product regardless of whether the product has substantial
+# +commercial, industrial or non-consumer uses, unless such uses represent
+# +the only significant mode of use of the product.
+# +
+# +  "Installation Information" for a User Product means any methods,
+# +procedures, authorization keys, or other information required to install
+# +and execute modified versions of a covered work in that User Product from
+# +a modified version of its Corresponding Source.  The information must
+# +suffice to ensure that the continued functioning of the modified object
+# +code is in no case prevented or interfered with solely because
+# +modification has been made.
+# +
+# +  If you convey an object code work under this section in, or with, or
+# +specifically for use in, a User Product, and the conveying occurs as
+# +part of a transaction in which the right of possession and use of the
+# +User Product is transferred to the recipient in perpetuity or for a
+# +fixed term (regardless of how the transaction is characterized), the
+# +Corresponding Source conveyed under this section must be accompanied
+# +by the Installation Information.  But this requirement does not apply
+# +if neither you nor any third party retains the ability to install
+# +modified object code on the User Product (for example, the work has
+# +been installed in ROM).
+# +
+# +  The requirement to provide Installation Information does not include a
+# +requirement to continue to provide support service, warranty, or updates
+# +for a work that has been modified or installed by the recipient, or for
+# +the User Product in which it has been modified or installed.  Access to a
+# +network may be denied when the modification itself materially and
+# +adversely affects the operation of the network or violates the rules and
+# +protocols for communication across the network.
+# +
+# +  Corresponding Source conveyed, and Installation Information provided,
+# +in accord with this section must be in a format that is publicly
+# +documented (and with an implementation available to the public in
+# +source code form), and must require no special password or key for
+# +unpacking, reading or copying.
+# +
+# +  7. Additional Terms.
+# +
+# +  "Additional permissions" are terms that supplement the terms of this
+# +License by making exceptions from one or more of its conditions.
+# +Additional permissions that are applicable to the entire Program shall
+# +be treated as though they were included in this License, to the extent
+# +that they are valid under applicable law.  If additional permissions
+# +apply only to part of the Program, that part may be used separately
+# +under those permissions, but the entire Program remains governed by
+# +this License without regard to the additional permissions.
+# +
+# +  When you convey a copy of a covered work, you may at your option
+# +remove any additional permissions from that copy, or from any part of
+# +it.  (Additional permissions may be written to require their own
+# +removal in certain cases when you modify the work.)  You may place
+# +additional permissions on material, added by you to a covered work,
+# +for which you have or can give appropriate copyright permission.
+# +
+# +  Notwithstanding any other provision of this License, for material you
+# +add to a covered work, you may (if authorized by the copyright holders of
+# +that material) supplement the terms of this License with terms:
+# +
+# +    a) Disclaiming warranty or limiting liability differently from the
+# +    terms of sections 15 and 16 of this License; or
+# +
+# +    b) Requiring preservation of specified reasonable legal notices or
+# +    author attributions in that material or in the Appropriate Legal
+# +    Notices displayed by works containing it; or
+# +
+# +    c) Prohibiting misrepresentation of the origin of that material, or
+# +    requiring that modified versions of such material be marked in
+# +    reasonable ways as different from the original version; or
+# +
+# +    d) Limiting the use for publicity purposes of names of licensors or
+# +    authors of the material; or
+# +
+# +    e) Declining to grant rights under trademark law for use of some
+# +    trade names, trademarks, or service marks; or
+# +
+# +    f) Requiring indemnification of licensors and authors of that
+# +    material by anyone who conveys the material (or modified versions of
+# +    it) with contractual assumptions of liability to the recipient, for
+# +    any liability that these contractual assumptions directly impose on
+# +    those licensors and authors.
+# +
+# +  All other non-permissive additional terms are considered "further
+# +restrictions" within the meaning of section 10.  If the Program as you
+# +received it, or any part of it, contains a notice stating that it is
+# +governed by this License along with a term that is a further
+# +restriction, you may remove that term.  If a license document contains
+# +a further restriction but permits relicensing or conveying under this
+# +License, you may add to a covered work material governed by the terms
+# +of that license document, provided that the further restriction does
+# +not survive such relicensing or conveying.
+# +
+# +  If you add terms to a covered work in accord with this section, you
+# +must place, in the relevant source files, a statement of the
+# +additional terms that apply to those files, or a notice indicating
+# +where to find the applicable terms.
+# +
+# +  Additional terms, permissive or non-permissive, may be stated in the
+# +form of a separately written license, or stated as exceptions;
+# +the above requirements apply either way.
+# +
+# +  8. Termination.
+# +
+# +  You may not propagate or modify a covered work except as expressly
+# +provided under this License.  Any attempt otherwise to propagate or
+# +modify it is void, and will automatically terminate your rights under
+# +this License (including any patent licenses granted under the third
+# +paragraph of section 11).
+# +
+# +  However, if you cease all violation of this License, then your
+# +license from a particular copyright holder is reinstated (a)
+# +provisionally, unless and until the copyright holder explicitly and
+# +finally terminates your license, and (b) permanently, if the copyright
+# +holder fails to notify you of the violation by some reasonable means
+# +prior to 60 days after the cessation.
+# +
+# +  Moreover, your license from a particular copyright holder is
+# +reinstated permanently if the copyright holder notifies you of the
+# +violation by some reasonable means, this is the first time you have
+# +received notice of violation of this License (for any work) from that
+# +copyright holder, and you cure the violation prior to 30 days after
+# +your receipt of the notice.
+# +
+# +  Termination of your rights under this section does not terminate the
+# +licenses of parties who have received copies or rights from you under
+# +this License.  If your rights have been terminated and not permanently
+# +reinstated, you do not qualify to receive new licenses for the same
+# +material under section 10.
+# +
+# +  9. Acceptance Not Required for Having Copies.
+# +
+# +  You are not required to accept this License in order to receive or
+# +run a copy of the Program.  Ancillary propagation of a covered work
+# +occurring solely as a consequence of using peer-to-peer transmission
+# +to receive a copy likewise does not require acceptance.  However,
+# +nothing other than this License grants you permission to propagate or
+# +modify any covered work.  These actions infringe copyright if you do
+# +not accept this License.  Therefore, by modifying or propagating a
+# +covered work, you indicate your acceptance of this License to do so.
+# +
+# +  10. Automatic Licensing of Downstream Recipients.
+# +
+# +  Each time you convey a covered work, the recipient automatically
+# +receives a license from the original licensors, to run, modify and
+# +propagate that work, subject to this License.  You are not responsible
+# +for enforcing compliance by third parties with this License.
+# +
+# +  An "entity transaction" is a transaction transferring control of an
+# +organization, or substantially all assets of one, or subdividing an
+# +organization, or merging organizations.  If propagation of a covered
+# +work results from an entity transaction, each party to that
+# +transaction who receives a copy of the work also receives whatever
+# +licenses to the work the party's predecessor in interest had or could
+# +give under the previous paragraph, plus a right to possession of the
+# +Corresponding Source of the work from the predecessor in interest, if
+# +the predecessor has it or can get it with reasonable efforts.
+# +
+# +  You may not impose any further restrictions on the exercise of the
+# +rights granted or affirmed under this License.  For example, you may
+# +not impose a license fee, royalty, or other charge for exercise of
+# +rights granted under this License, and you may not initiate litigation
+# +(including a cross-claim or counterclaim in a lawsuit) alleging that
+# +any patent claim is infringed by making, using, selling, offering for
+# +sale, or importing the Program or any portion of it.
+# +
+# +  11. Patents.
+# +
+# +  A "contributor" is a copyright holder who authorizes use under this
+# +License of the Program or a work on which the Program is based.  The
+# +work thus licensed is called the contributor's "contributor version".
+# +
+# +  A contributor's "essential patent claims" are all patent claims
+# +owned or controlled by the contributor, whether already acquired or
+# +hereafter acquired, that would be infringed by some manner, permitted
+# +by this License, of making, using, or selling its contributor version,
+# +but do not include claims that would be infringed only as a
+# +consequence of further modification of the contributor version.  For
+# +purposes of this definition, "control" includes the right to grant
+# +patent sublicenses in a manner consistent with the requirements of
+# +this License.
+# +
+# +  Each contributor grants you a non-exclusive, worldwide, royalty-free
+# +patent license under the contributor's essential patent claims, to
+# +make, use, sell, offer for sale, import and otherwise run, modify and
+# +propagate the contents of its contributor version.
+# +
+# +  In the following three paragraphs, a "patent license" is any express
+# +agreement or commitment, however denominated, not to enforce a patent
+# +(such as an express permission to practice a patent or covenant not to
+# +sue for patent infringement).  To "grant" such a patent license to a
+# +party means to make such an agreement or commitment not to enforce a
+# +patent against the party.
+# +
+# +  If you convey a covered work, knowingly relying on a patent license,
+# +and the Corresponding Source of the work is not available for anyone
+# +to copy, free of charge and under the terms of this License, through a
+# +publicly available network server or other readily accessible means,
+# +then you must either (1) cause the Corresponding Source to be so
+# +available, or (2) arrange to deprive yourself of the benefit of the
+# +patent license for this particular work, or (3) arrange, in a manner
+# +consistent with the requirements of this License, to extend the patent
+# +license to downstream recipients.  "Knowingly relying" means you have
+# +actual knowledge that, but for the patent license, your conveying the
+# +covered work in a country, or your recipient's use of the covered work
+# +in a country, would infringe one or more identifiable patents in that
+# +country that you have reason to believe are valid.
+# +
+# +  If, pursuant to or in connection with a single transaction or
+# +arrangement, you convey, or propagate by procuring conveyance of, a
+# +covered work, and grant a patent license to some of the parties
+# +receiving the covered work authorizing them to use, propagate, modify
+# +or convey a specific copy of the covered work, then the patent license
+# +you grant is automatically extended to all recipients of the covered
+# +work and works based on it.
+# +
+# +  A patent license is "discriminatory" if it does not include within
+# +the scope of its coverage, prohibits the exercise of, or is
+# +conditioned on the non-exercise of one or more of the rights that are
+# +specifically granted under this License.  You may not convey a covered
+# +work if you are a party to an arrangement with a third party that is
+# +in the business of distributing software, under which you make payment
+# +to the third party based on the extent of your activity of conveying
+# +the work, and under which the third party grants, to any of the
+# +parties who would receive the covered work from you, a discriminatory
+# +patent license (a) in connection with copies of the covered work
+# +conveyed by you (or copies made from those copies), or (b) primarily
+# +for and in connection with specific products or compilations that
+# +contain the covered work, unless you entered into that arrangement,
+# +or that patent license was granted, prior to 28 March 2007.
+# +
+# +  Nothing in this License shall be construed as excluding or limiting
+# +any implied license or other defenses to infringement that may
+# +otherwise be available to you under applicable patent law.
+# +
+# +  12. No Surrender of Others' Freedom.
+# +
+# +  If conditions are imposed on you (whether by court order, agreement or
+# +otherwise) that contradict the conditions of this License, they do not
+# +excuse you from the conditions of this License.  If you cannot convey a
+# +covered work so as to satisfy simultaneously your obligations under this
+# +License and any other pertinent obligations, then as a consequence you may
+# +not convey it at all.  For example, if you agree to terms that obligate you
+# +to collect a royalty for further conveying from those to whom you convey
+# +the Program, the only way you could satisfy both those terms and this
+# +License would be to refrain entirely from conveying the Program.
+# +
+# +  13. Use with the GNU Affero General Public License.
+# +
+# +  Notwithstanding any other provision of this License, you have
+# +permission to link or combine any covered work with a work licensed
+# +under version 3 of the GNU Affero General Public License into a single
+# +combined work, and to convey the resulting work.  The terms of this
+# +License will continue to apply to the part which is the covered work,
+# +but the special requirements of the GNU Affero General Public License,
+# +section 13, concerning interaction through a network will apply to the
+# +combination as such.
+# +
+# +  14. Revised Versions of this License.
+# +
+# +  The Free Software Foundation may publish revised and/or new versions of
+# +the GNU General Public License from time to time.  Such new versions will
+# +be similar in spirit to the present version, but may differ in detail to
+# +address new problems or concerns.
+# +
+# +  Each version is given a distinguishing version number.  If the
+# +Program specifies that a certain numbered version of the GNU General
+# +Public License "or any later version" applies to it, you have the
+# +option of following the terms and conditions either of that numbered
+# +version or of any later version published by the Free Software
+# +Foundation.  If the Program does not specify a version number of the
+# +GNU General Public License, you may choose any version ever published
+# +by the Free Software Foundation.
+# +
+# +  If the Program specifies that a proxy can decide which future
+# +versions of the GNU General Public License can be used, that proxy's
+# +public statement of acceptance of a version permanently authorizes you
+# +to choose that version for the Program.
+# +
+# +  Later license versions may give you additional or different
+# +permissions.  However, no additional obligations are imposed on any
+# +author or copyright holder as a result of your choosing to follow a
+# +later version.
+# +
+# +  15. Disclaimer of Warranty.
+# +
+# +  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
+# +APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
+# +HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY
+# +OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
+# +THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+# +PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM
+# +IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF
+# +ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+# +
+# +  16. Limitation of Liability.
+# +
+# +  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+# +WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS
+# +THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+# +GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
+# +USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
+# +DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
+# +PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
+# +EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
+# +SUCH DAMAGES.
+# +
+# +  17. Interpretation of Sections 15 and 16.
+# +
+# +  If the disclaimer of warranty and limitation of liability provided
+# +above cannot be given local legal effect according to their terms,
+# +reviewing courts shall apply local law that most closely approximates
+# +an absolute waiver of all civil liability in connection with the
+# +Program, unless a warranty or assumption of liability accompanies a
+# +copy of the Program in return for a fee.
+# +
+# +                     END OF TERMS AND CONDITIONS
+# +
+# +            How to Apply These Terms to Your New Programs
+# +
+# +  If you develop a new program, and you want it to be of the greatest
+# +possible use to the public, the best way to achieve this is to make it
+# +free software which everyone can redistribute and change under these terms.
+# +
+# +  To do so, attach the following notices to the program.  It is safest
+# +to attach them to the start of each source file to most effectively
+# +state the exclusion of warranty; and each file should have at least
+# +the "copyright" line and a pointer to where the full notice is found.
+# +
+# +    <one line to give the program's name and a brief idea of what it does.>
+# +    Copyright (C) <year>  <name of author>
+# +
+# +    This program is free software: you can redistribute it and/or modify
+# +    it under the terms of the GNU General Public License as published by
+# +    the Free Software Foundation, either version 3 of the License, or
+# +    (at your option) any later version.
+# +
+# +    This program is distributed in the hope that it will be useful,
+# +    but WITHOUT ANY WARRANTY; without even the implied warranty of
+# +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# +    GNU General Public License for more details.
+# +
+# +    You should have received a copy of the GNU General Public License
+# +    along with this program.  If not, see <https://www.gnu.org/licenses/>.
+# +
+# +Also add information on how to contact you by electronic and paper mail.
+# +
+# +  If the program does terminal interaction, make it output a short
+# +notice like this when it starts in an interactive mode:
+# +
+# +    <program>  Copyright (C) <year>  <name of author>
+# +    This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+# +    This is free software, and you are welcome to redistribute it
+# +    under certain conditions; type `show c' for details.
+# +
+# +The hypothetical commands `show w' and `show c' should show the appropriate
+# +parts of the General Public License.  Of course, your program's commands
+# +might be different; for a GUI interface, you would use an "about box".
+# +
+# +  You should also get your employer (if you work as a programmer) or school,
+# +if any, to sign a "copyright disclaimer" for the program, if necessary.
+# +For more information on this, and how to apply and follow the GNU GPL, see
+# +<https://www.gnu.org/licenses/>.
+# +
+# +  The GNU General Public License does not permit incorporating your program
+# +into proprietary programs.  If your program is a subroutine library, you
+# +may consider it more useful to permit linking proprietary applications with
+# +the library.  If this is what you want to do, use the GNU Lesser General
+# +Public License instead of this License.  But first, please read
+# +<https://www.gnu.org/licenses/why-not-lgpl.html>.
+# --- COPYING.LESSERv3
+# +++ COPYING.LESSERv3
+# @@ -1,7 +1,7 @@
+#                     GNU LESSER GENERAL PUBLIC LICENSE
+#                         Version 3, 29 June 2007
+#  
+# - Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+# + Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# --- COPYINGv2
+# +++ COPYINGv2
+# @@ -2,7 +2,7 @@
+#                         Version 2, June 1991
+#  
+#   Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -304,8 +304,7 @@
+#      GNU General Public License for more details.
+#  
+#      You should have received a copy of the GNU General Public License along
+# -    with this program; if not, write to the Free Software Foundation, Inc.,
+# -    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# +    with this program; if not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# @@ -329,8 +328,8 @@
+#    Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+#    `Gnomovision' (which makes passes at compilers) written by James Hacker.
+#  
+# -  <signature of Ty Coon>, 1 April 1989
+# -  Ty Coon, President of Vice
+# +  <signature of Moe Ghoul>, 1 April 1989
+# +  Moe Ghoul, President of Vice
+#  
+#  This General Public License does not permit incorporating your program into
+#  proprietary programs.  If your program is a subroutine library, you may
+# --- src/idn2.c
+# +++ src/idn2.c
+# @@ -1,5 +1,5 @@
+#  /* idn2.c - command line interface to libidn2
+# -   Copyright (C) 2011-2024 Simon Josefsson, Tim Ruehsen
+# +   Copyright (C) 2011-2025 Simon Josefsson, Tim Ruehsen
+#  
+#     This program is free software: you can redistribute it and/or modify
+#     it under the terms of the GNU General Public License as published by
+# --- lib/idn2.h.in
+# +++ lib/idn2.h.in
+# @@ -1,5 +1,5 @@
+#  /* idn2.h - header file for idn2
+# -   Copyright (C) 2011-2024 Simon Josefsson
+# +   Copyright (C) 2011-2025 Simon Josefsson
+#  
+#     Libidn2 is free software: you can redistribute it and/or modify it
+#     under the terms of either:
+# 
+#
+
+SUMMARY = "Internationalized Domain Name support library"
+DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domain Names (IDN) working group."
+HOMEPAGE = "http://www.gnu.org/software/libidn/"
+SECTION = "libs"
+LICENSE = "(GPL-2.0-or-later | LGPL-3.0-only) & GPL-3.0-or-later & Unicode-DFS-2016"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://COPYING.LESSERv3;md5=3000208d539ec061b899bce1d9ce9404 \
+                    file://COPYINGv2;md5=570a9b3749dd0463a1778803b12a6dce \
+                    file://COPYING.unicode;md5=684cf5f7e3fded3546679424528261a9 \
+                    file://src/idn2.c;endline=16;md5=c44fb6f201f22da3a19857499b49b15d \
+                    file://lib/idn2.h.in;endline=27;md5=f27aee1b44326be3a28961c55319099f \
+                    "
+
+SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
+SRC_URI[sha256sum] = "f557911bf6171621e1f72ff35f5b1825bb35b52ed45325dcdee931e5d3c0787a"
+
+DEPENDS = "virtual/libiconv libunistring"
+
+inherit pkgconfig autotools gettext texinfo gtk-doc lib_package
+
+EXTRA_OECONF += "--disable-rpath \
+                 --with-libunistring-prefix=${STAGING_EXECPREFIXDIR} \
+                 "
+
+do_install:append() {
+	# Need to remove any duplicate whitespace too for reproducibility
+	sed -i -e 's|-L${STAGING_LIBDIR}||' -e 's/  */ /g' ${D}${libdir}/pkgconfig/libidn2.pc
+}
+
+LICENSE:${PN} = "(GPL-2.0-or-later | LGPL-3.0-only) & Unicode-DFS-2016"
+LICENSE:${PN}-bin = "GPL-3.0-or-later"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.44.1


--===============6160936738979202296==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libidn2-upgrade-2.3.7-2.3.8.patch"

RnJvbSBjYTFjNGU5ZGQyNjg0OGVhZjIyNDI5NmY4ODM0YjEyMDlkNzViMDA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTA6MzI6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpZG4yOiB1cGdyYWRlIDIuMy43IC0+IDIuMy44CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9saWJpZG4vbGliaWRuMl8yLjMuNy5iYiB8ICAzMyAtCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bGliaWRuL2xpYmlkbjJfMi4zLjguYmIgfCA4MTcgKysrKysrKysrKysrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDgxNyBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliaWRuL2xpYmlkbjJfMi4zLjcuYmIKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliaWRuL2xpYmlkbjJfMi4z
LjguYmIKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliaWRuL2xpYmlkbjJf
Mi4zLjcuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliaWRuL2xpYmlkbjJfMi4zLjcuYmIK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDdhZTkzM2UwNDcuLjAwMDAwMDAwMDAKLS0t
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmlkbi9saWJpZG4yXzIuMy43LmJiCisrKyAvZGV2
L251bGwKQEAgLTEsMzMgKzAsMCBAQAotU1VNTUFSWSA9ICJJbnRlcm5hdGlvbmFsaXplZCBEb21h
aW4gTmFtZSBzdXBwb3J0IGxpYnJhcnkiCi1ERVNDUklQVElPTiA9ICJJbXBsZW1lbnRhdGlvbiBv
ZiB0aGUgU3RyaW5ncHJlcCwgUHVueWNvZGUgYW5kIElETkEgc3BlY2lmaWNhdGlvbnMgZGVmaW5l
ZCBieSB0aGUgSUVURiBJbnRlcm5hdGlvbmFsaXplZCBEb21haW4gTmFtZXMgKElETikgd29ya2lu
ZyBncm91cC4iCi1IT01FUEFHRSA9ICJodHRwOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvbGliaWRu
LyIKLVNFQ1RJT04gPSAibGlicyIKLUxJQ0VOU0UgPSAiKEdQTC0yLjAtb3ItbGF0ZXIgfCBMR1BM
LTMuMC1vbmx5KSAmIEdQTC0zLjAtb3ItbGF0ZXIgJiBVbmljb2RlLURGUy0yMDE2IgotTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MmQ4MzRlYTdkNDgwNDM4YWRhMDRlNWQ4
NDYxNTIzOTUgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5MRVNTRVJ2Mztt
ZDU9ZTZhNjAwZmQ1ZTFkOWNiZGUyZDk4MzY4MDIzM2FkMDIgXAotICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vQ09QWUlOR3YyO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBc
Ci0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HLnVuaWNvZGU7bWQ1PTY4NGNmNWY3
ZTNmZGVkMzU0NjY3OTQyNDUyODI2MWE5IFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL3Ny
Yy9pZG4yLmM7ZW5kbGluZT0xNjttZDU9YWZjMTUzMWJkYTk5MWJhNjMzOGUzM2E3ZWZmNzU4YTAg
XAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGliL2lkbjIuaC5pbjtlbmRsaW5lPTI3O21k
NT1mODhkMjE4MDA1YTVjNDViNjhhODNjZWNiNWJkN2YyNiBcCi0gICAgICAgICAgICAgICAgICAg
ICIKLQotU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2xpYmlkbi8ke0JQTn0tJHtQVn0udGFyLmd6
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRjMjFhNzkxYjYxMGI5NTE5YjlkMGUxMmI4MDk3YmYy
ZjM1OWIxMmY4ZGQ5MjY0NzYxMWE5MjllNmJmZDdkNjQiCi0KLURFUEVORFMgPSAidmlydHVhbC9s
aWJpY29udiBsaWJ1bmlzdHJpbmciCi0KLWluaGVyaXQgcGtnY29uZmlnIGF1dG90b29scyBnZXR0
ZXh0IHRleGluZm8gZ3RrLWRvYyBsaWJfcGFja2FnZQotCi1FWFRSQV9PRUNPTkYgKz0gIi0tZGlz
YWJsZS1ycGF0aCBcCi0gICAgICAgICAgICAgICAgIC0td2l0aC1saWJ1bmlzdHJpbmctcHJlZml4
PSR7U1RBR0lOR19FWEVDUFJFRklYRElSfSBcCi0gICAgICAgICAgICAgICAgICIKLQotZG9faW5z
dGFsbDphcHBlbmQoKSB7Ci0JIyBOZWVkIHRvIHJlbW92ZSBhbnkgZHVwbGljYXRlIHdoaXRlc3Bh
Y2UgdG9vIGZvciByZXByb2R1Y2liaWxpdHkKLQlzZWQgLWkgLWUgJ3N8LUwke1NUQUdJTkdfTElC
RElSfXx8JyAtZSAncy8gICovIC9nJyAke0R9JHtsaWJkaXJ9L3BrZ2NvbmZpZy9saWJpZG4yLnBj
Ci19Ci0KLUxJQ0VOU0U6JHtQTn0gPSAiKEdQTC0yLjAtb3ItbGF0ZXIgfCBMR1BMLTMuMC1vbmx5
KSAmIFVuaWNvZGUtREZTLTIwMTYiCi1MSUNFTlNFOiR7UE59LWJpbiA9ICJHUEwtMy4wLW9yLWxh
dGVyIgotCi1CQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliaWRuL2xpYmlkbjJfMi4zLjguYmIgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbGliaWRuL2xpYmlkbjJfMi4zLjguYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uMzQ4NWUzZTIzZQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9saWJpZG4vbGliaWRuMl8yLjMuOC5iYgpAQCAtMCwwICsxLDgxNyBAQAor
IyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5
ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJl
dHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUg
dGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGlu
CisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhh
bXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBU
aGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTEsMzUg
KzEsNjc0IEBACisjIC1MaWJpZG4yIENPUFlJTkcgLS0gTGljZW5zaW5nIGluZm9ybWF0aW9uLiAg
ICAgICAgICAgICAgICAgICAgICAgLSotIG91dGxpbmUgLSotCisjIC1Db3B5cmlnaHQgKEMpIDIw
MTEtMjAxNiBTaW1vbiBKb3NlZnNzb24KKyMgLVNlZSB0aGUgZW5kIGZvciBjb3B5aW5nIGNvbmRp
dGlvbnMuCisjIC0KKyMgLVRoZSBzb3VyY2UgY29kZSBmb3IgdGhlIEMgbGlicmFyeSAobGliaWRu
Mi5hIG9yIGxpYmlkbi5zbykgYXJlCisjIC1saWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgZWl0
aGVyIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorIyAtdmVyc2lvbiAyLjAgb3IgbGF0
ZXIgKHNlZSB0aGUgZmlsZSBDT1BZSU5HdjIpIG9yIHRoZSBHTlUgTGVzc2VyCisjIC1HZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMy4wIG9yIGxhdGVyIChzZWUgdGhlIGZpbGUKKyMgLUNP
UFlJTkcuTEVTU0VSdjMpLCBvciBib3RoIGluIHBhcmFsbGVsIGFzIGhlcmUuCisjIC0KKyMgLVRo
ZSBjb21tYW5kIGxpbmUgdG9vbCwgc2VsZiB0ZXN0cywgZXhhbXBsZXMsIGFuZCBvdGhlciBhdXhp
bGlhcnkKKyMgLWZpbGVzLCBhcmUgbGljZW5zZWQgdW5kZXIgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIHZlcnNpb24gMy4wCisjIC1vciBsYXRlci4KKyMgLQorIyAtVGhlIGxpY2Vuc2Ug
b2YgdGhlIFVuaWNvZGUgY2hhcmFjdGVyIGRhdGEgZmlsZXMgKHdoaWNoIGFyZSBwYXJzZWQgaW50
bworIyAtc3RhdGljIHN0b3JhZ2UgaW4gdGhlIGxpYnJhcnkpIGFyZSBkb2N1bWVudGVkIGluIENP
UFlJTkcudW5pY29kZS4KKyMgLQorIyAtT3RoZXIgZmlsZXMgYXJlIGxpY2Vuc2VkIGFzIGluZGlj
YXRlZCBpbiBlYWNoIGZpbGUuCisjIC0KKyMgLVRoZXJlIG1heSBiZSBleGNlcHRpb25zIHRvIHRo
ZXNlIGdlbmVyYWwgcnVsZXMsIHNlZSBlYWNoIGZpbGUgZm9yCisjIC1wcmVjaXNlIGluZm9ybWF0
aW9uLgorIyAtCisjIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIC1UaGlzIGZpbGUgaXMgZnJlZSBzb2Z0d2Fy
ZTogeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeSBpdAorIyAtdW5kZXIgdGhl
IHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkg
dGhlCisjIC1GcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIGVpdGhlciB2ZXJzaW9uIDMgb2YgdGhl
IExpY2Vuc2UsIG9yIChhdCB5b3VyCisjIC1vcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorIyAt
CisjIC1UaGlzIGZpbGUgaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJl
IHVzZWZ1bCwgYnV0CisjIC1XSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBp
bXBsaWVkIHdhcnJhbnR5IG9mCisjIC1NRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQorIyAtR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAtCisjIC1Zb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBj
b3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorIyAtYWxvbmcgd2l0aCB0aGlz
IGZpbGUuICBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisjICsg
ICAgICAgICAgICAgICAgICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICsgICAgICAg
ICAgICAgICAgICAgICAgIFZlcnNpb24gMywgMjkgSnVuZSAyMDA3CisjICsKKyMgKyBDb3B5cmln
aHQgKEMpIDIwMDcgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuIDxodHRwczovL2ZzZi5v
cmcvPgorIyArIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIHZl
cmJhdGltIGNvcGllcworIyArIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5naW5n
IGl0IGlzIG5vdCBhbGxvd2VkLgorIyArCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
UHJlYW1ibGUKKyMgKworIyArICBUaGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgaXMgYSBm
cmVlLCBjb3B5bGVmdCBsaWNlbnNlIGZvcgorIyArc29mdHdhcmUgYW5kIG90aGVyIGtpbmRzIG9m
IHdvcmtzLgorIyArCisjICsgIFRoZSBsaWNlbnNlcyBmb3IgbW9zdCBzb2Z0d2FyZSBhbmQgb3Ro
ZXIgcHJhY3RpY2FsIHdvcmtzIGFyZSBkZXNpZ25lZAorIyArdG8gdGFrZSBhd2F5IHlvdXIgZnJl
ZWRvbSB0byBzaGFyZSBhbmQgY2hhbmdlIHRoZSB3b3Jrcy4gIEJ5IGNvbnRyYXN0LAorIyArdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGlzIGludGVuZGVkIHRvIGd1YXJhbnRlZSB5b3Vy
IGZyZWVkb20gdG8KKyMgK3NoYXJlIGFuZCBjaGFuZ2UgYWxsIHZlcnNpb25zIG9mIGEgcHJvZ3Jh
bS0tdG8gbWFrZSBzdXJlIGl0IHJlbWFpbnMgZnJlZQorIyArc29mdHdhcmUgZm9yIGFsbCBpdHMg
dXNlcnMuICBXZSwgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgdXNlIHRoZQorIyArR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vc3Qgb2Ygb3VyIHNvZnR3YXJlOyBpdCBhcHBs
aWVzIGFsc28gdG8KKyMgK2FueSBvdGhlciB3b3JrIHJlbGVhc2VkIHRoaXMgd2F5IGJ5IGl0cyBh
dXRob3JzLiAgWW91IGNhbiBhcHBseSBpdCB0bworIyAreW91ciBwcm9ncmFtcywgdG9vLgorIyAr
CisjICsgIFdoZW4gd2Ugc3BlYWsgb2YgZnJlZSBzb2Z0d2FyZSwgd2UgYXJlIHJlZmVycmluZyB0
byBmcmVlZG9tLCBub3QKKyMgK3ByaWNlLiAgT3VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2VzIGFy
ZSBkZXNpZ25lZCB0byBtYWtlIHN1cmUgdGhhdCB5b3UKKyMgK2hhdmUgdGhlIGZyZWVkb20gdG8g
ZGlzdHJpYnV0ZSBjb3BpZXMgb2YgZnJlZSBzb2Z0d2FyZSAoYW5kIGNoYXJnZSBmb3IKKyMgK3Ro
ZW0gaWYgeW91IHdpc2gpLCB0aGF0IHlvdSByZWNlaXZlIHNvdXJjZSBjb2RlIG9yIGNhbiBnZXQg
aXQgaWYgeW91CisjICt3YW50IGl0LCB0aGF0IHlvdSBjYW4gY2hhbmdlIHRoZSBzb2Z0d2FyZSBv
ciB1c2UgcGllY2VzIG9mIGl0IGluIG5ldworIyArZnJlZSBwcm9ncmFtcywgYW5kIHRoYXQgeW91
IGtub3cgeW91IGNhbiBkbyB0aGVzZSB0aGluZ3MuCisjICsKKyMgKyAgVG8gcHJvdGVjdCB5b3Vy
IHJpZ2h0cywgd2UgbmVlZCB0byBwcmV2ZW50IG90aGVycyBmcm9tIGRlbnlpbmcgeW91CisjICt0
aGVzZSByaWdodHMgb3IgYXNraW5nIHlvdSB0byBzdXJyZW5kZXIgdGhlIHJpZ2h0cy4gIFRoZXJl
Zm9yZSwgeW91IGhhdmUKKyMgK2NlcnRhaW4gcmVzcG9uc2liaWxpdGllcyBpZiB5b3UgZGlzdHJp
YnV0ZSBjb3BpZXMgb2YgdGhlIHNvZnR3YXJlLCBvciBpZgorIyAreW91IG1vZGlmeSBpdDogcmVz
cG9uc2liaWxpdGllcyB0byByZXNwZWN0IHRoZSBmcmVlZG9tIG9mIG90aGVycy4KKyMgKworIyAr
ICBGb3IgZXhhbXBsZSwgaWYgeW91IGRpc3RyaWJ1dGUgY29waWVzIG9mIHN1Y2ggYSBwcm9ncmFt
LCB3aGV0aGVyCisjICtncmF0aXMgb3IgZm9yIGEgZmVlLCB5b3UgbXVzdCBwYXNzIG9uIHRvIHRo
ZSByZWNpcGllbnRzIHRoZSBzYW1lCisjICtmcmVlZG9tcyB0aGF0IHlvdSByZWNlaXZlZC4gIFlv
dSBtdXN0IG1ha2Ugc3VyZSB0aGF0IHRoZXksIHRvbywgcmVjZWl2ZQorIyArb3IgY2FuIGdldCB0
aGUgc291cmNlIGNvZGUuICBBbmQgeW91IG11c3Qgc2hvdyB0aGVtIHRoZXNlIHRlcm1zIHNvIHRo
ZXkKKyMgK2tub3cgdGhlaXIgcmlnaHRzLgorIyArCisjICsgIERldmVsb3BlcnMgdGhhdCB1c2Ug
dGhlIEdOVSBHUEwgcHJvdGVjdCB5b3VyIHJpZ2h0cyB3aXRoIHR3byBzdGVwczoKKyMgKygxKSBh
c3NlcnQgY29weXJpZ2h0IG9uIHRoZSBzb2Z0d2FyZSwgYW5kICgyKSBvZmZlciB5b3UgdGhpcyBM
aWNlbnNlCisjICtnaXZpbmcgeW91IGxlZ2FsIHBlcm1pc3Npb24gdG8gY29weSwgZGlzdHJpYnV0
ZSBhbmQvb3IgbW9kaWZ5IGl0LgorIyArCisjICsgIEZvciB0aGUgZGV2ZWxvcGVycycgYW5kIGF1
dGhvcnMnIHByb3RlY3Rpb24sIHRoZSBHUEwgY2xlYXJseSBleHBsYWlucworIyArdGhhdCB0aGVy
ZSBpcyBubyB3YXJyYW50eSBmb3IgdGhpcyBmcmVlIHNvZnR3YXJlLiAgRm9yIGJvdGggdXNlcnMn
IGFuZAorIyArYXV0aG9ycycgc2FrZSwgdGhlIEdQTCByZXF1aXJlcyB0aGF0IG1vZGlmaWVkIHZl
cnNpb25zIGJlIG1hcmtlZCBhcworIyArY2hhbmdlZCwgc28gdGhhdCB0aGVpciBwcm9ibGVtcyB3
aWxsIG5vdCBiZSBhdHRyaWJ1dGVkIGVycm9uZW91c2x5IHRvCisjICthdXRob3JzIG9mIHByZXZp
b3VzIHZlcnNpb25zLgorIyArCisjICsgIFNvbWUgZGV2aWNlcyBhcmUgZGVzaWduZWQgdG8gZGVu
eSB1c2VycyBhY2Nlc3MgdG8gaW5zdGFsbCBvciBydW4KKyMgK21vZGlmaWVkIHZlcnNpb25zIG9m
IHRoZSBzb2Z0d2FyZSBpbnNpZGUgdGhlbSwgYWx0aG91Z2ggdGhlIG1hbnVmYWN0dXJlcgorIyAr
Y2FuIGRvIHNvLiAgVGhpcyBpcyBmdW5kYW1lbnRhbGx5IGluY29tcGF0aWJsZSB3aXRoIHRoZSBh
aW0gb2YKKyMgK3Byb3RlY3RpbmcgdXNlcnMnIGZyZWVkb20gdG8gY2hhbmdlIHRoZSBzb2Z0d2Fy
ZS4gIFRoZSBzeXN0ZW1hdGljCisjICtwYXR0ZXJuIG9mIHN1Y2ggYWJ1c2Ugb2NjdXJzIGluIHRo
ZSBhcmVhIG9mIHByb2R1Y3RzIGZvciBpbmRpdmlkdWFscyB0bworIyArdXNlLCB3aGljaCBpcyBw
cmVjaXNlbHkgd2hlcmUgaXQgaXMgbW9zdCB1bmFjY2VwdGFibGUuICBUaGVyZWZvcmUsIHdlCisj
ICtoYXZlIGRlc2lnbmVkIHRoaXMgdmVyc2lvbiBvZiB0aGUgR1BMIHRvIHByb2hpYml0IHRoZSBw
cmFjdGljZSBmb3IgdGhvc2UKKyMgK3Byb2R1Y3RzLiAgSWYgc3VjaCBwcm9ibGVtcyBhcmlzZSBz
dWJzdGFudGlhbGx5IGluIG90aGVyIGRvbWFpbnMsIHdlCisjICtzdGFuZCByZWFkeSB0byBleHRl
bmQgdGhpcyBwcm92aXNpb24gdG8gdGhvc2UgZG9tYWlucyBpbiBmdXR1cmUgdmVyc2lvbnMKKyMg
K29mIHRoZSBHUEwsIGFzIG5lZWRlZCB0byBwcm90ZWN0IHRoZSBmcmVlZG9tIG9mIHVzZXJzLgor
IyArCisjICsgIEZpbmFsbHksIGV2ZXJ5IHByb2dyYW0gaXMgdGhyZWF0ZW5lZCBjb25zdGFudGx5
IGJ5IHNvZnR3YXJlIHBhdGVudHMuCisjICtTdGF0ZXMgc2hvdWxkIG5vdCBhbGxvdyBwYXRlbnRz
IHRvIHJlc3RyaWN0IGRldmVsb3BtZW50IGFuZCB1c2Ugb2YKKyMgK3NvZnR3YXJlIG9uIGdlbmVy
YWwtcHVycG9zZSBjb21wdXRlcnMsIGJ1dCBpbiB0aG9zZSB0aGF0IGRvLCB3ZSB3aXNoIHRvCisj
ICthdm9pZCB0aGUgc3BlY2lhbCBkYW5nZXIgdGhhdCBwYXRlbnRzIGFwcGxpZWQgdG8gYSBmcmVl
IHByb2dyYW0gY291bGQKKyMgK21ha2UgaXQgZWZmZWN0aXZlbHkgcHJvcHJpZXRhcnkuICBUbyBw
cmV2ZW50IHRoaXMsIHRoZSBHUEwgYXNzdXJlcyB0aGF0CisjICtwYXRlbnRzIGNhbm5vdCBiZSB1
c2VkIHRvIHJlbmRlciB0aGUgcHJvZ3JhbSBub24tZnJlZS4KKyMgKworIyArICBUaGUgcHJlY2lz
ZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBmb3IgY29weWluZywgZGlzdHJpYnV0aW9uIGFuZAorIyAr
bW9kaWZpY2F0aW9uIGZvbGxvdy4KKyMgKworIyArICAgICAgICAgICAgICAgICAgICAgICBURVJN
UyBBTkQgQ09ORElUSU9OUworIyArCisjICsgIDAuIERlZmluaXRpb25zLgorIyArCisjICsgICJU
aGlzIExpY2Vuc2UiIHJlZmVycyB0byB2ZXJzaW9uIDMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlLgorIyArCisjICsgICJDb3B5cmlnaHQiIGFsc28gbWVhbnMgY29weXJpZ2h0LWxp
a2UgbGF3cyB0aGF0IGFwcGx5IHRvIG90aGVyIGtpbmRzIG9mCisjICt3b3Jrcywgc3VjaCBhcyBz
ZW1pY29uZHVjdG9yIG1hc2tzLgorIyArCisjICsgICJUaGUgUHJvZ3JhbSIgcmVmZXJzIHRvIGFu
eSBjb3B5cmlnaHRhYmxlIHdvcmsgbGljZW5zZWQgdW5kZXIgdGhpcworIyArTGljZW5zZS4gIEVh
Y2ggbGljZW5zZWUgaXMgYWRkcmVzc2VkIGFzICJ5b3UiLiAgIkxpY2Vuc2VlcyIgYW5kCisjICsi
cmVjaXBpZW50cyIgbWF5IGJlIGluZGl2aWR1YWxzIG9yIG9yZ2FuaXphdGlvbnMuCisjICsKKyMg
KyAgVG8gIm1vZGlmeSIgYSB3b3JrIG1lYW5zIHRvIGNvcHkgZnJvbSBvciBhZGFwdCBhbGwgb3Ig
cGFydCBvZiB0aGUgd29yaworIyAraW4gYSBmYXNoaW9uIHJlcXVpcmluZyBjb3B5cmlnaHQgcGVy
bWlzc2lvbiwgb3RoZXIgdGhhbiB0aGUgbWFraW5nIG9mIGFuCisjICtleGFjdCBjb3B5LiAgVGhl
IHJlc3VsdGluZyB3b3JrIGlzIGNhbGxlZCBhICJtb2RpZmllZCB2ZXJzaW9uIiBvZiB0aGUKKyMg
K2VhcmxpZXIgd29yayBvciBhIHdvcmsgImJhc2VkIG9uIiB0aGUgZWFybGllciB3b3JrLgorIyAr
CisjICsgIEEgImNvdmVyZWQgd29yayIgbWVhbnMgZWl0aGVyIHRoZSB1bm1vZGlmaWVkIFByb2dy
YW0gb3IgYSB3b3JrIGJhc2VkCisjICtvbiB0aGUgUHJvZ3JhbS4KKyMgKworIyArICBUbyAicHJv
cGFnYXRlIiBhIHdvcmsgbWVhbnMgdG8gZG8gYW55dGhpbmcgd2l0aCBpdCB0aGF0LCB3aXRob3V0
CisjICtwZXJtaXNzaW9uLCB3b3VsZCBtYWtlIHlvdSBkaXJlY3RseSBvciBzZWNvbmRhcmlseSBs
aWFibGUgZm9yCisjICtpbmZyaW5nZW1lbnQgdW5kZXIgYXBwbGljYWJsZSBjb3B5cmlnaHQgbGF3
LCBleGNlcHQgZXhlY3V0aW5nIGl0IG9uIGEKKyMgK2NvbXB1dGVyIG9yIG1vZGlmeWluZyBhIHBy
aXZhdGUgY29weS4gIFByb3BhZ2F0aW9uIGluY2x1ZGVzIGNvcHlpbmcsCisjICtkaXN0cmlidXRp
b24gKHdpdGggb3Igd2l0aG91dCBtb2RpZmljYXRpb24pLCBtYWtpbmcgYXZhaWxhYmxlIHRvIHRo
ZQorIyArcHVibGljLCBhbmQgaW4gc29tZSBjb3VudHJpZXMgb3RoZXIgYWN0aXZpdGllcyBhcyB3
ZWxsLgorIyArCisjICsgIFRvICJjb252ZXkiIGEgd29yayBtZWFucyBhbnkga2luZCBvZiBwcm9w
YWdhdGlvbiB0aGF0IGVuYWJsZXMgb3RoZXIKKyMgK3BhcnRpZXMgdG8gbWFrZSBvciByZWNlaXZl
IGNvcGllcy4gIE1lcmUgaW50ZXJhY3Rpb24gd2l0aCBhIHVzZXIgdGhyb3VnaAorIyArYSBjb21w
dXRlciBuZXR3b3JrLCB3aXRoIG5vIHRyYW5zZmVyIG9mIGEgY29weSwgaXMgbm90IGNvbnZleWlu
Zy4KKyMgKworIyArICBBbiBpbnRlcmFjdGl2ZSB1c2VyIGludGVyZmFjZSBkaXNwbGF5cyAiQXBw
cm9wcmlhdGUgTGVnYWwgTm90aWNlcyIKKyMgK3RvIHRoZSBleHRlbnQgdGhhdCBpdCBpbmNsdWRl
cyBhIGNvbnZlbmllbnQgYW5kIHByb21pbmVudGx5IHZpc2libGUKKyMgK2ZlYXR1cmUgdGhhdCAo
MSkgZGlzcGxheXMgYW4gYXBwcm9wcmlhdGUgY29weXJpZ2h0IG5vdGljZSwgYW5kICgyKQorIyAr
dGVsbHMgdGhlIHVzZXIgdGhhdCB0aGVyZSBpcyBubyB3YXJyYW50eSBmb3IgdGhlIHdvcmsgKGV4
Y2VwdCB0byB0aGUKKyMgK2V4dGVudCB0aGF0IHdhcnJhbnRpZXMgYXJlIHByb3ZpZGVkKSwgdGhh
dCBsaWNlbnNlZXMgbWF5IGNvbnZleSB0aGUKKyMgK3dvcmsgdW5kZXIgdGhpcyBMaWNlbnNlLCBh
bmQgaG93IHRvIHZpZXcgYSBjb3B5IG9mIHRoaXMgTGljZW5zZS4gIElmCisjICt0aGUgaW50ZXJm
YWNlIHByZXNlbnRzIGEgbGlzdCBvZiB1c2VyIGNvbW1hbmRzIG9yIG9wdGlvbnMsIHN1Y2ggYXMg
YQorIyArbWVudSwgYSBwcm9taW5lbnQgaXRlbSBpbiB0aGUgbGlzdCBtZWV0cyB0aGlzIGNyaXRl
cmlvbi4KKyMgKworIyArICAxLiBTb3VyY2UgQ29kZS4KKyMgKworIyArICBUaGUgInNvdXJjZSBj
b2RlIiBmb3IgYSB3b3JrIG1lYW5zIHRoZSBwcmVmZXJyZWQgZm9ybSBvZiB0aGUgd29yaworIyAr
Zm9yIG1ha2luZyBtb2RpZmljYXRpb25zIHRvIGl0LiAgIk9iamVjdCBjb2RlIiBtZWFucyBhbnkg
bm9uLXNvdXJjZQorIyArZm9ybSBvZiBhIHdvcmsuCisjICsKKyMgKyAgQSAiU3RhbmRhcmQgSW50
ZXJmYWNlIiBtZWFucyBhbiBpbnRlcmZhY2UgdGhhdCBlaXRoZXIgaXMgYW4gb2ZmaWNpYWwKKyMg
K3N0YW5kYXJkIGRlZmluZWQgYnkgYSByZWNvZ25pemVkIHN0YW5kYXJkcyBib2R5LCBvciwgaW4g
dGhlIGNhc2Ugb2YKKyMgK2ludGVyZmFjZXMgc3BlY2lmaWVkIGZvciBhIHBhcnRpY3VsYXIgcHJv
Z3JhbW1pbmcgbGFuZ3VhZ2UsIG9uZSB0aGF0CisjICtpcyB3aWRlbHkgdXNlZCBhbW9uZyBkZXZl
bG9wZXJzIHdvcmtpbmcgaW4gdGhhdCBsYW5ndWFnZS4KKyMgKworIyArICBUaGUgIlN5c3RlbSBM
aWJyYXJpZXMiIG9mIGFuIGV4ZWN1dGFibGUgd29yayBpbmNsdWRlIGFueXRoaW5nLCBvdGhlcgor
IyArdGhhbiB0aGUgd29yayBhcyBhIHdob2xlLCB0aGF0IChhKSBpcyBpbmNsdWRlZCBpbiB0aGUg
bm9ybWFsIGZvcm0gb2YKKyMgK3BhY2thZ2luZyBhIE1ham9yIENvbXBvbmVudCwgYnV0IHdoaWNo
IGlzIG5vdCBwYXJ0IG9mIHRoYXQgTWFqb3IKKyMgK0NvbXBvbmVudCwgYW5kIChiKSBzZXJ2ZXMg
b25seSB0byBlbmFibGUgdXNlIG9mIHRoZSB3b3JrIHdpdGggdGhhdAorIyArTWFqb3IgQ29tcG9u
ZW50LCBvciB0byBpbXBsZW1lbnQgYSBTdGFuZGFyZCBJbnRlcmZhY2UgZm9yIHdoaWNoIGFuCisj
ICtpbXBsZW1lbnRhdGlvbiBpcyBhdmFpbGFibGUgdG8gdGhlIHB1YmxpYyBpbiBzb3VyY2UgY29k
ZSBmb3JtLiAgQQorIyArIk1ham9yIENvbXBvbmVudCIsIGluIHRoaXMgY29udGV4dCwgbWVhbnMg
YSBtYWpvciBlc3NlbnRpYWwgY29tcG9uZW50CisjICsoa2VybmVsLCB3aW5kb3cgc3lzdGVtLCBh
bmQgc28gb24pIG9mIHRoZSBzcGVjaWZpYyBvcGVyYXRpbmcgc3lzdGVtCisjICsoaWYgYW55KSBv
biB3aGljaCB0aGUgZXhlY3V0YWJsZSB3b3JrIHJ1bnMsIG9yIGEgY29tcGlsZXIgdXNlZCB0bwor
IyArcHJvZHVjZSB0aGUgd29yaywgb3IgYW4gb2JqZWN0IGNvZGUgaW50ZXJwcmV0ZXIgdXNlZCB0
byBydW4gaXQuCisjICsKKyMgKyAgVGhlICJDb3JyZXNwb25kaW5nIFNvdXJjZSIgZm9yIGEgd29y
ayBpbiBvYmplY3QgY29kZSBmb3JtIG1lYW5zIGFsbAorIyArdGhlIHNvdXJjZSBjb2RlIG5lZWRl
ZCB0byBnZW5lcmF0ZSwgaW5zdGFsbCwgYW5kIChmb3IgYW4gZXhlY3V0YWJsZQorIyArd29yaykg
cnVuIHRoZSBvYmplY3QgY29kZSBhbmQgdG8gbW9kaWZ5IHRoZSB3b3JrLCBpbmNsdWRpbmcgc2Ny
aXB0cyB0bworIyArY29udHJvbCB0aG9zZSBhY3Rpdml0aWVzLiAgSG93ZXZlciwgaXQgZG9lcyBu
b3QgaW5jbHVkZSB0aGUgd29yaydzCisjICtTeXN0ZW0gTGlicmFyaWVzLCBvciBnZW5lcmFsLXB1
cnBvc2UgdG9vbHMgb3IgZ2VuZXJhbGx5IGF2YWlsYWJsZSBmcmVlCisjICtwcm9ncmFtcyB3aGlj
aCBhcmUgdXNlZCB1bm1vZGlmaWVkIGluIHBlcmZvcm1pbmcgdGhvc2UgYWN0aXZpdGllcyBidXQK
KyMgK3doaWNoIGFyZSBub3QgcGFydCBvZiB0aGUgd29yay4gIEZvciBleGFtcGxlLCBDb3JyZXNw
b25kaW5nIFNvdXJjZQorIyAraW5jbHVkZXMgaW50ZXJmYWNlIGRlZmluaXRpb24gZmlsZXMgYXNz
b2NpYXRlZCB3aXRoIHNvdXJjZSBmaWxlcyBmb3IKKyMgK3RoZSB3b3JrLCBhbmQgdGhlIHNvdXJj
ZSBjb2RlIGZvciBzaGFyZWQgbGlicmFyaWVzIGFuZCBkeW5hbWljYWxseQorIyArbGlua2VkIHN1
YnByb2dyYW1zIHRoYXQgdGhlIHdvcmsgaXMgc3BlY2lmaWNhbGx5IGRlc2lnbmVkIHRvIHJlcXVp
cmUsCisjICtzdWNoIGFzIGJ5IGludGltYXRlIGRhdGEgY29tbXVuaWNhdGlvbiBvciBjb250cm9s
IGZsb3cgYmV0d2VlbiB0aG9zZQorIyArc3VicHJvZ3JhbXMgYW5kIG90aGVyIHBhcnRzIG9mIHRo
ZSB3b3JrLgorIyArCisjICsgIFRoZSBDb3JyZXNwb25kaW5nIFNvdXJjZSBuZWVkIG5vdCBpbmNs
dWRlIGFueXRoaW5nIHRoYXQgdXNlcnMKKyMgK2NhbiByZWdlbmVyYXRlIGF1dG9tYXRpY2FsbHkg
ZnJvbSBvdGhlciBwYXJ0cyBvZiB0aGUgQ29ycmVzcG9uZGluZworIyArU291cmNlLgorIyArCisj
ICsgIFRoZSBDb3JyZXNwb25kaW5nIFNvdXJjZSBmb3IgYSB3b3JrIGluIHNvdXJjZSBjb2RlIGZv
cm0gaXMgdGhhdAorIyArc2FtZSB3b3JrLgorIyArCisjICsgIDIuIEJhc2ljIFBlcm1pc3Npb25z
LgorIyArCisjICsgIEFsbCByaWdodHMgZ3JhbnRlZCB1bmRlciB0aGlzIExpY2Vuc2UgYXJlIGdy
YW50ZWQgZm9yIHRoZSB0ZXJtIG9mCisjICtjb3B5cmlnaHQgb24gdGhlIFByb2dyYW0sIGFuZCBh
cmUgaXJyZXZvY2FibGUgcHJvdmlkZWQgdGhlIHN0YXRlZAorIyArY29uZGl0aW9ucyBhcmUgbWV0
LiAgVGhpcyBMaWNlbnNlIGV4cGxpY2l0bHkgYWZmaXJtcyB5b3VyIHVubGltaXRlZAorIyArcGVy
bWlzc2lvbiB0byBydW4gdGhlIHVubW9kaWZpZWQgUHJvZ3JhbS4gIFRoZSBvdXRwdXQgZnJvbSBy
dW5uaW5nIGEKKyMgK2NvdmVyZWQgd29yayBpcyBjb3ZlcmVkIGJ5IHRoaXMgTGljZW5zZSBvbmx5
IGlmIHRoZSBvdXRwdXQsIGdpdmVuIGl0cworIyArY29udGVudCwgY29uc3RpdHV0ZXMgYSBjb3Zl
cmVkIHdvcmsuICBUaGlzIExpY2Vuc2UgYWNrbm93bGVkZ2VzIHlvdXIKKyMgK3JpZ2h0cyBvZiBm
YWlyIHVzZSBvciBvdGhlciBlcXVpdmFsZW50LCBhcyBwcm92aWRlZCBieSBjb3B5cmlnaHQgbGF3
LgorIyArCisjICsgIFlvdSBtYXkgbWFrZSwgcnVuIGFuZCBwcm9wYWdhdGUgY292ZXJlZCB3b3Jr
cyB0aGF0IHlvdSBkbyBub3QKKyMgK2NvbnZleSwgd2l0aG91dCBjb25kaXRpb25zIHNvIGxvbmcg
YXMgeW91ciBsaWNlbnNlIG90aGVyd2lzZSByZW1haW5zCisjICtpbiBmb3JjZS4gIFlvdSBtYXkg
Y29udmV5IGNvdmVyZWQgd29ya3MgdG8gb3RoZXJzIGZvciB0aGUgc29sZSBwdXJwb3NlCisjICtv
ZiBoYXZpbmcgdGhlbSBtYWtlIG1vZGlmaWNhdGlvbnMgZXhjbHVzaXZlbHkgZm9yIHlvdSwgb3Ig
cHJvdmlkZSB5b3UKKyMgK3dpdGggZmFjaWxpdGllcyBmb3IgcnVubmluZyB0aG9zZSB3b3Jrcywg
cHJvdmlkZWQgdGhhdCB5b3UgY29tcGx5IHdpdGgKKyMgK3RoZSB0ZXJtcyBvZiB0aGlzIExpY2Vu
c2UgaW4gY29udmV5aW5nIGFsbCBtYXRlcmlhbCBmb3Igd2hpY2ggeW91IGRvCisjICtub3QgY29u
dHJvbCBjb3B5cmlnaHQuICBUaG9zZSB0aHVzIG1ha2luZyBvciBydW5uaW5nIHRoZSBjb3ZlcmVk
IHdvcmtzCisjICtmb3IgeW91IG11c3QgZG8gc28gZXhjbHVzaXZlbHkgb24geW91ciBiZWhhbGYs
IHVuZGVyIHlvdXIgZGlyZWN0aW9uCisjICthbmQgY29udHJvbCwgb24gdGVybXMgdGhhdCBwcm9o
aWJpdCB0aGVtIGZyb20gbWFraW5nIGFueSBjb3BpZXMgb2YKKyMgK3lvdXIgY29weXJpZ2h0ZWQg
bWF0ZXJpYWwgb3V0c2lkZSB0aGVpciByZWxhdGlvbnNoaXAgd2l0aCB5b3UuCisjICsKKyMgKyAg
Q29udmV5aW5nIHVuZGVyIGFueSBvdGhlciBjaXJjdW1zdGFuY2VzIGlzIHBlcm1pdHRlZCBzb2xl
bHkgdW5kZXIKKyMgK3RoZSBjb25kaXRpb25zIHN0YXRlZCBiZWxvdy4gIFN1YmxpY2Vuc2luZyBp
cyBub3QgYWxsb3dlZDsgc2VjdGlvbiAxMAorIyArbWFrZXMgaXQgdW5uZWNlc3NhcnkuCisjICsK
KyMgKyAgMy4gUHJvdGVjdGluZyBVc2VycycgTGVnYWwgUmlnaHRzIEZyb20gQW50aS1DaXJjdW12
ZW50aW9uIExhdy4KKyMgKworIyArICBObyBjb3ZlcmVkIHdvcmsgc2hhbGwgYmUgZGVlbWVkIHBh
cnQgb2YgYW4gZWZmZWN0aXZlIHRlY2hub2xvZ2ljYWwKKyMgK21lYXN1cmUgdW5kZXIgYW55IGFw
cGxpY2FibGUgbGF3IGZ1bGZpbGxpbmcgb2JsaWdhdGlvbnMgdW5kZXIgYXJ0aWNsZQorIyArMTEg
b2YgdGhlIFdJUE8gY29weXJpZ2h0IHRyZWF0eSBhZG9wdGVkIG9uIDIwIERlY2VtYmVyIDE5OTYs
IG9yCisjICtzaW1pbGFyIGxhd3MgcHJvaGliaXRpbmcgb3IgcmVzdHJpY3RpbmcgY2lyY3VtdmVu
dGlvbiBvZiBzdWNoCisjICttZWFzdXJlcy4KKyMgKworIyArICBXaGVuIHlvdSBjb252ZXkgYSBj
b3ZlcmVkIHdvcmssIHlvdSB3YWl2ZSBhbnkgbGVnYWwgcG93ZXIgdG8gZm9yYmlkCisjICtjaXJj
dW12ZW50aW9uIG9mIHRlY2hub2xvZ2ljYWwgbWVhc3VyZXMgdG8gdGhlIGV4dGVudCBzdWNoIGNp
cmN1bXZlbnRpb24KKyMgK2lzIGVmZmVjdGVkIGJ5IGV4ZXJjaXNpbmcgcmlnaHRzIHVuZGVyIHRo
aXMgTGljZW5zZSB3aXRoIHJlc3BlY3QgdG8KKyMgK3RoZSBjb3ZlcmVkIHdvcmssIGFuZCB5b3Ug
ZGlzY2xhaW0gYW55IGludGVudGlvbiB0byBsaW1pdCBvcGVyYXRpb24gb3IKKyMgK21vZGlmaWNh
dGlvbiBvZiB0aGUgd29yayBhcyBhIG1lYW5zIG9mIGVuZm9yY2luZywgYWdhaW5zdCB0aGUgd29y
aydzCisjICt1c2VycywgeW91ciBvciB0aGlyZCBwYXJ0aWVzJyBsZWdhbCByaWdodHMgdG8gZm9y
YmlkIGNpcmN1bXZlbnRpb24gb2YKKyMgK3RlY2hub2xvZ2ljYWwgbWVhc3VyZXMuCisjICsKKyMg
KyAgNC4gQ29udmV5aW5nIFZlcmJhdGltIENvcGllcy4KKyMgKworIyArICBZb3UgbWF5IGNvbnZl
eSB2ZXJiYXRpbSBjb3BpZXMgb2YgdGhlIFByb2dyYW0ncyBzb3VyY2UgY29kZSBhcyB5b3UKKyMg
K3JlY2VpdmUgaXQsIGluIGFueSBtZWRpdW0sIHByb3ZpZGVkIHRoYXQgeW91IGNvbnNwaWN1b3Vz
bHkgYW5kCisjICthcHByb3ByaWF0ZWx5IHB1Ymxpc2ggb24gZWFjaCBjb3B5IGFuIGFwcHJvcHJp
YXRlIGNvcHlyaWdodCBub3RpY2U7CisjICtrZWVwIGludGFjdCBhbGwgbm90aWNlcyBzdGF0aW5n
IHRoYXQgdGhpcyBMaWNlbnNlIGFuZCBhbnkKKyMgK25vbi1wZXJtaXNzaXZlIHRlcm1zIGFkZGVk
IGluIGFjY29yZCB3aXRoIHNlY3Rpb24gNyBhcHBseSB0byB0aGUgY29kZTsKKyMgK2tlZXAgaW50
YWN0IGFsbCBub3RpY2VzIG9mIHRoZSBhYnNlbmNlIG9mIGFueSB3YXJyYW50eTsgYW5kIGdpdmUg
YWxsCisjICtyZWNpcGllbnRzIGEgY29weSBvZiB0aGlzIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUg
UHJvZ3JhbS4KKyMgKworIyArICBZb3UgbWF5IGNoYXJnZSBhbnkgcHJpY2Ugb3Igbm8gcHJpY2Ug
Zm9yIGVhY2ggY29weSB0aGF0IHlvdSBjb252ZXksCisjICthbmQgeW91IG1heSBvZmZlciBzdXBw
b3J0IG9yIHdhcnJhbnR5IHByb3RlY3Rpb24gZm9yIGEgZmVlLgorIyArCisjICsgIDUuIENvbnZl
eWluZyBNb2RpZmllZCBTb3VyY2UgVmVyc2lvbnMuCisjICsKKyMgKyAgWW91IG1heSBjb252ZXkg
YSB3b3JrIGJhc2VkIG9uIHRoZSBQcm9ncmFtLCBvciB0aGUgbW9kaWZpY2F0aW9ucyB0bworIyAr
cHJvZHVjZSBpdCBmcm9tIHRoZSBQcm9ncmFtLCBpbiB0aGUgZm9ybSBvZiBzb3VyY2UgY29kZSB1
bmRlciB0aGUKKyMgK3Rlcm1zIG9mIHNlY3Rpb24gNCwgcHJvdmlkZWQgdGhhdCB5b3UgYWxzbyBt
ZWV0IGFsbCBvZiB0aGVzZSBjb25kaXRpb25zOgorIyArCisjICsgICAgYSkgVGhlIHdvcmsgbXVz
dCBjYXJyeSBwcm9taW5lbnQgbm90aWNlcyBzdGF0aW5nIHRoYXQgeW91IG1vZGlmaWVkCisjICsg
ICAgaXQsIGFuZCBnaXZpbmcgYSByZWxldmFudCBkYXRlLgorIyArCisjICsgICAgYikgVGhlIHdv
cmsgbXVzdCBjYXJyeSBwcm9taW5lbnQgbm90aWNlcyBzdGF0aW5nIHRoYXQgaXQgaXMKKyMgKyAg
ICByZWxlYXNlZCB1bmRlciB0aGlzIExpY2Vuc2UgYW5kIGFueSBjb25kaXRpb25zIGFkZGVkIHVu
ZGVyIHNlY3Rpb24KKyMgKyAgICA3LiAgVGhpcyByZXF1aXJlbWVudCBtb2RpZmllcyB0aGUgcmVx
dWlyZW1lbnQgaW4gc2VjdGlvbiA0IHRvCisjICsgICAgImtlZXAgaW50YWN0IGFsbCBub3RpY2Vz
Ii4KKyMgKworIyArICAgIGMpIFlvdSBtdXN0IGxpY2Vuc2UgdGhlIGVudGlyZSB3b3JrLCBhcyBh
IHdob2xlLCB1bmRlciB0aGlzCisjICsgICAgTGljZW5zZSB0byBhbnlvbmUgd2hvIGNvbWVzIGlu
dG8gcG9zc2Vzc2lvbiBvZiBhIGNvcHkuICBUaGlzCisjICsgICAgTGljZW5zZSB3aWxsIHRoZXJl
Zm9yZSBhcHBseSwgYWxvbmcgd2l0aCBhbnkgYXBwbGljYWJsZSBzZWN0aW9uIDcKKyMgKyAgICBh
ZGRpdGlvbmFsIHRlcm1zLCB0byB0aGUgd2hvbGUgb2YgdGhlIHdvcmssIGFuZCBhbGwgaXRzIHBh
cnRzLAorIyArICAgIHJlZ2FyZGxlc3Mgb2YgaG93IHRoZXkgYXJlIHBhY2thZ2VkLiAgVGhpcyBM
aWNlbnNlIGdpdmVzIG5vCisjICsgICAgcGVybWlzc2lvbiB0byBsaWNlbnNlIHRoZSB3b3JrIGlu
IGFueSBvdGhlciB3YXksIGJ1dCBpdCBkb2VzIG5vdAorIyArICAgIGludmFsaWRhdGUgc3VjaCBw
ZXJtaXNzaW9uIGlmIHlvdSBoYXZlIHNlcGFyYXRlbHkgcmVjZWl2ZWQgaXQuCisjICsKKyMgKyAg
ICBkKSBJZiB0aGUgd29yayBoYXMgaW50ZXJhY3RpdmUgdXNlciBpbnRlcmZhY2VzLCBlYWNoIG11
c3QgZGlzcGxheQorIyArICAgIEFwcHJvcHJpYXRlIExlZ2FsIE5vdGljZXM7IGhvd2V2ZXIsIGlm
IHRoZSBQcm9ncmFtIGhhcyBpbnRlcmFjdGl2ZQorIyArICAgIGludGVyZmFjZXMgdGhhdCBkbyBu
b3QgZGlzcGxheSBBcHByb3ByaWF0ZSBMZWdhbCBOb3RpY2VzLCB5b3VyCisjICsgICAgd29yayBu
ZWVkIG5vdCBtYWtlIHRoZW0gZG8gc28uCisjICsKKyMgKyAgQSBjb21waWxhdGlvbiBvZiBhIGNv
dmVyZWQgd29yayB3aXRoIG90aGVyIHNlcGFyYXRlIGFuZCBpbmRlcGVuZGVudAorIyArd29ya3Ms
IHdoaWNoIGFyZSBub3QgYnkgdGhlaXIgbmF0dXJlIGV4dGVuc2lvbnMgb2YgdGhlIGNvdmVyZWQg
d29yaywKKyMgK2FuZCB3aGljaCBhcmUgbm90IGNvbWJpbmVkIHdpdGggaXQgc3VjaCBhcyB0byBm
b3JtIGEgbGFyZ2VyIHByb2dyYW0sCisjICtpbiBvciBvbiBhIHZvbHVtZSBvZiBhIHN0b3JhZ2Ug
b3IgZGlzdHJpYnV0aW9uIG1lZGl1bSwgaXMgY2FsbGVkIGFuCisjICsiYWdncmVnYXRlIiBpZiB0
aGUgY29tcGlsYXRpb24gYW5kIGl0cyByZXN1bHRpbmcgY29weXJpZ2h0IGFyZSBub3QKKyMgK3Vz
ZWQgdG8gbGltaXQgdGhlIGFjY2VzcyBvciBsZWdhbCByaWdodHMgb2YgdGhlIGNvbXBpbGF0aW9u
J3MgdXNlcnMKKyMgK2JleW9uZCB3aGF0IHRoZSBpbmRpdmlkdWFsIHdvcmtzIHBlcm1pdC4gIElu
Y2x1c2lvbiBvZiBhIGNvdmVyZWQgd29yaworIyAraW4gYW4gYWdncmVnYXRlIGRvZXMgbm90IGNh
dXNlIHRoaXMgTGljZW5zZSB0byBhcHBseSB0byB0aGUgb3RoZXIKKyMgK3BhcnRzIG9mIHRoZSBh
Z2dyZWdhdGUuCisjICsKKyMgKyAgNi4gQ29udmV5aW5nIE5vbi1Tb3VyY2UgRm9ybXMuCisjICsK
KyMgKyAgWW91IG1heSBjb252ZXkgYSBjb3ZlcmVkIHdvcmsgaW4gb2JqZWN0IGNvZGUgZm9ybSB1
bmRlciB0aGUgdGVybXMKKyMgK29mIHNlY3Rpb25zIDQgYW5kIDUsIHByb3ZpZGVkIHRoYXQgeW91
IGFsc28gY29udmV5IHRoZQorIyArbWFjaGluZS1yZWFkYWJsZSBDb3JyZXNwb25kaW5nIFNvdXJj
ZSB1bmRlciB0aGUgdGVybXMgb2YgdGhpcyBMaWNlbnNlLAorIyAraW4gb25lIG9mIHRoZXNlIHdh
eXM6CisjICsKKyMgKyAgICBhKSBDb252ZXkgdGhlIG9iamVjdCBjb2RlIGluLCBvciBlbWJvZGll
ZCBpbiwgYSBwaHlzaWNhbCBwcm9kdWN0CisjICsgICAgKGluY2x1ZGluZyBhIHBoeXNpY2FsIGRp
c3RyaWJ1dGlvbiBtZWRpdW0pLCBhY2NvbXBhbmllZCBieSB0aGUKKyMgKyAgICBDb3JyZXNwb25k
aW5nIFNvdXJjZSBmaXhlZCBvbiBhIGR1cmFibGUgcGh5c2ljYWwgbWVkaXVtCisjICsgICAgY3Vz
dG9tYXJpbHkgdXNlZCBmb3Igc29mdHdhcmUgaW50ZXJjaGFuZ2UuCisjICsKKyMgKyAgICBiKSBD
b252ZXkgdGhlIG9iamVjdCBjb2RlIGluLCBvciBlbWJvZGllZCBpbiwgYSBwaHlzaWNhbCBwcm9k
dWN0CisjICsgICAgKGluY2x1ZGluZyBhIHBoeXNpY2FsIGRpc3RyaWJ1dGlvbiBtZWRpdW0pLCBh
Y2NvbXBhbmllZCBieSBhCisjICsgICAgd3JpdHRlbiBvZmZlciwgdmFsaWQgZm9yIGF0IGxlYXN0
IHRocmVlIHllYXJzIGFuZCB2YWxpZCBmb3IgYXMKKyMgKyAgICBsb25nIGFzIHlvdSBvZmZlciBz
cGFyZSBwYXJ0cyBvciBjdXN0b21lciBzdXBwb3J0IGZvciB0aGF0IHByb2R1Y3QKKyMgKyAgICBt
b2RlbCwgdG8gZ2l2ZSBhbnlvbmUgd2hvIHBvc3Nlc3NlcyB0aGUgb2JqZWN0IGNvZGUgZWl0aGVy
ICgxKSBhCisjICsgICAgY29weSBvZiB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgZm9yIGFsbCB0
aGUgc29mdHdhcmUgaW4gdGhlCisjICsgICAgcHJvZHVjdCB0aGF0IGlzIGNvdmVyZWQgYnkgdGhp
cyBMaWNlbnNlLCBvbiBhIGR1cmFibGUgcGh5c2ljYWwKKyMgKyAgICBtZWRpdW0gY3VzdG9tYXJp
bHkgdXNlZCBmb3Igc29mdHdhcmUgaW50ZXJjaGFuZ2UsIGZvciBhIHByaWNlIG5vCisjICsgICAg
bW9yZSB0aGFuIHlvdXIgcmVhc29uYWJsZSBjb3N0IG9mIHBoeXNpY2FsbHkgcGVyZm9ybWluZyB0
aGlzCisjICsgICAgY29udmV5aW5nIG9mIHNvdXJjZSwgb3IgKDIpIGFjY2VzcyB0byBjb3B5IHRo
ZQorIyArICAgIENvcnJlc3BvbmRpbmcgU291cmNlIGZyb20gYSBuZXR3b3JrIHNlcnZlciBhdCBu
byBjaGFyZ2UuCisjICsKKyMgKyAgICBjKSBDb252ZXkgaW5kaXZpZHVhbCBjb3BpZXMgb2YgdGhl
IG9iamVjdCBjb2RlIHdpdGggYSBjb3B5IG9mIHRoZQorIyArICAgIHdyaXR0ZW4gb2ZmZXIgdG8g
cHJvdmlkZSB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UuICBUaGlzCisjICsgICAgYWx0ZXJuYXRp
dmUgaXMgYWxsb3dlZCBvbmx5IG9jY2FzaW9uYWxseSBhbmQgbm9uY29tbWVyY2lhbGx5LCBhbmQK
KyMgKyAgICBvbmx5IGlmIHlvdSByZWNlaXZlZCB0aGUgb2JqZWN0IGNvZGUgd2l0aCBzdWNoIGFu
IG9mZmVyLCBpbiBhY2NvcmQKKyMgKyAgICB3aXRoIHN1YnNlY3Rpb24gNmIuCisjICsKKyMgKyAg
ICBkKSBDb252ZXkgdGhlIG9iamVjdCBjb2RlIGJ5IG9mZmVyaW5nIGFjY2VzcyBmcm9tIGEgZGVz
aWduYXRlZAorIyArICAgIHBsYWNlIChncmF0aXMgb3IgZm9yIGEgY2hhcmdlKSwgYW5kIG9mZmVy
IGVxdWl2YWxlbnQgYWNjZXNzIHRvIHRoZQorIyArICAgIENvcnJlc3BvbmRpbmcgU291cmNlIGlu
IHRoZSBzYW1lIHdheSB0aHJvdWdoIHRoZSBzYW1lIHBsYWNlIGF0IG5vCisjICsgICAgZnVydGhl
ciBjaGFyZ2UuICBZb3UgbmVlZCBub3QgcmVxdWlyZSByZWNpcGllbnRzIHRvIGNvcHkgdGhlCisj
ICsgICAgQ29ycmVzcG9uZGluZyBTb3VyY2UgYWxvbmcgd2l0aCB0aGUgb2JqZWN0IGNvZGUuICBJ
ZiB0aGUgcGxhY2UgdG8KKyMgKyAgICBjb3B5IHRoZSBvYmplY3QgY29kZSBpcyBhIG5ldHdvcmsg
c2VydmVyLCB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UKKyMgKyAgICBtYXkgYmUgb24gYSBkaWZm
ZXJlbnQgc2VydmVyIChvcGVyYXRlZCBieSB5b3Ugb3IgYSB0aGlyZCBwYXJ0eSkKKyMgKyAgICB0
aGF0IHN1cHBvcnRzIGVxdWl2YWxlbnQgY29weWluZyBmYWNpbGl0aWVzLCBwcm92aWRlZCB5b3Ug
bWFpbnRhaW4KKyMgKyAgICBjbGVhciBkaXJlY3Rpb25zIG5leHQgdG8gdGhlIG9iamVjdCBjb2Rl
IHNheWluZyB3aGVyZSB0byBmaW5kIHRoZQorIyArICAgIENvcnJlc3BvbmRpbmcgU291cmNlLiAg
UmVnYXJkbGVzcyBvZiB3aGF0IHNlcnZlciBob3N0cyB0aGUKKyMgKyAgICBDb3JyZXNwb25kaW5n
IFNvdXJjZSwgeW91IHJlbWFpbiBvYmxpZ2F0ZWQgdG8gZW5zdXJlIHRoYXQgaXQgaXMKKyMgKyAg
ICBhdmFpbGFibGUgZm9yIGFzIGxvbmcgYXMgbmVlZGVkIHRvIHNhdGlzZnkgdGhlc2UgcmVxdWly
ZW1lbnRzLgorIyArCisjICsgICAgZSkgQ29udmV5IHRoZSBvYmplY3QgY29kZSB1c2luZyBwZWVy
LXRvLXBlZXIgdHJhbnNtaXNzaW9uLCBwcm92aWRlZAorIyArICAgIHlvdSBpbmZvcm0gb3RoZXIg
cGVlcnMgd2hlcmUgdGhlIG9iamVjdCBjb2RlIGFuZCBDb3JyZXNwb25kaW5nCisjICsgICAgU291
cmNlIG9mIHRoZSB3b3JrIGFyZSBiZWluZyBvZmZlcmVkIHRvIHRoZSBnZW5lcmFsIHB1YmxpYyBh
dCBubworIyArICAgIGNoYXJnZSB1bmRlciBzdWJzZWN0aW9uIDZkLgorIyArCisjICsgIEEgc2Vw
YXJhYmxlIHBvcnRpb24gb2YgdGhlIG9iamVjdCBjb2RlLCB3aG9zZSBzb3VyY2UgY29kZSBpcyBl
eGNsdWRlZAorIyArZnJvbSB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgYXMgYSBTeXN0ZW0gTGli
cmFyeSwgbmVlZCBub3QgYmUKKyMgK2luY2x1ZGVkIGluIGNvbnZleWluZyB0aGUgb2JqZWN0IGNv
ZGUgd29yay4KKyMgKworIyArICBBICJVc2VyIFByb2R1Y3QiIGlzIGVpdGhlciAoMSkgYSAiY29u
c3VtZXIgcHJvZHVjdCIsIHdoaWNoIG1lYW5zIGFueQorIyArdGFuZ2libGUgcGVyc29uYWwgcHJv
cGVydHkgd2hpY2ggaXMgbm9ybWFsbHkgdXNlZCBmb3IgcGVyc29uYWwsIGZhbWlseSwKKyMgK29y
IGhvdXNlaG9sZCBwdXJwb3Nlcywgb3IgKDIpIGFueXRoaW5nIGRlc2lnbmVkIG9yIHNvbGQgZm9y
IGluY29ycG9yYXRpb24KKyMgK2ludG8gYSBkd2VsbGluZy4gIEluIGRldGVybWluaW5nIHdoZXRo
ZXIgYSBwcm9kdWN0IGlzIGEgY29uc3VtZXIgcHJvZHVjdCwKKyMgK2RvdWJ0ZnVsIGNhc2VzIHNo
YWxsIGJlIHJlc29sdmVkIGluIGZhdm9yIG9mIGNvdmVyYWdlLiAgRm9yIGEgcGFydGljdWxhcgor
IyArcHJvZHVjdCByZWNlaXZlZCBieSBhIHBhcnRpY3VsYXIgdXNlciwgIm5vcm1hbGx5IHVzZWQi
IHJlZmVycyB0byBhCisjICt0eXBpY2FsIG9yIGNvbW1vbiB1c2Ugb2YgdGhhdCBjbGFzcyBvZiBw
cm9kdWN0LCByZWdhcmRsZXNzIG9mIHRoZSBzdGF0dXMKKyMgK29mIHRoZSBwYXJ0aWN1bGFyIHVz
ZXIgb3Igb2YgdGhlIHdheSBpbiB3aGljaCB0aGUgcGFydGljdWxhciB1c2VyCisjICthY3R1YWxs
eSB1c2VzLCBvciBleHBlY3RzIG9yIGlzIGV4cGVjdGVkIHRvIHVzZSwgdGhlIHByb2R1Y3QuICBB
IHByb2R1Y3QKKyMgK2lzIGEgY29uc3VtZXIgcHJvZHVjdCByZWdhcmRsZXNzIG9mIHdoZXRoZXIg
dGhlIHByb2R1Y3QgaGFzIHN1YnN0YW50aWFsCisjICtjb21tZXJjaWFsLCBpbmR1c3RyaWFsIG9y
IG5vbi1jb25zdW1lciB1c2VzLCB1bmxlc3Mgc3VjaCB1c2VzIHJlcHJlc2VudAorIyArdGhlIG9u
bHkgc2lnbmlmaWNhbnQgbW9kZSBvZiB1c2Ugb2YgdGhlIHByb2R1Y3QuCisjICsKKyMgKyAgIklu
c3RhbGxhdGlvbiBJbmZvcm1hdGlvbiIgZm9yIGEgVXNlciBQcm9kdWN0IG1lYW5zIGFueSBtZXRo
b2RzLAorIyArcHJvY2VkdXJlcywgYXV0aG9yaXphdGlvbiBrZXlzLCBvciBvdGhlciBpbmZvcm1h
dGlvbiByZXF1aXJlZCB0byBpbnN0YWxsCisjICthbmQgZXhlY3V0ZSBtb2RpZmllZCB2ZXJzaW9u
cyBvZiBhIGNvdmVyZWQgd29yayBpbiB0aGF0IFVzZXIgUHJvZHVjdCBmcm9tCisjICthIG1vZGlm
aWVkIHZlcnNpb24gb2YgaXRzIENvcnJlc3BvbmRpbmcgU291cmNlLiAgVGhlIGluZm9ybWF0aW9u
IG11c3QKKyMgK3N1ZmZpY2UgdG8gZW5zdXJlIHRoYXQgdGhlIGNvbnRpbnVlZCBmdW5jdGlvbmlu
ZyBvZiB0aGUgbW9kaWZpZWQgb2JqZWN0CisjICtjb2RlIGlzIGluIG5vIGNhc2UgcHJldmVudGVk
IG9yIGludGVyZmVyZWQgd2l0aCBzb2xlbHkgYmVjYXVzZQorIyArbW9kaWZpY2F0aW9uIGhhcyBi
ZWVuIG1hZGUuCisjICsKKyMgKyAgSWYgeW91IGNvbnZleSBhbiBvYmplY3QgY29kZSB3b3JrIHVu
ZGVyIHRoaXMgc2VjdGlvbiBpbiwgb3Igd2l0aCwgb3IKKyMgK3NwZWNpZmljYWxseSBmb3IgdXNl
IGluLCBhIFVzZXIgUHJvZHVjdCwgYW5kIHRoZSBjb252ZXlpbmcgb2NjdXJzIGFzCisjICtwYXJ0
IG9mIGEgdHJhbnNhY3Rpb24gaW4gd2hpY2ggdGhlIHJpZ2h0IG9mIHBvc3Nlc3Npb24gYW5kIHVz
ZSBvZiB0aGUKKyMgK1VzZXIgUHJvZHVjdCBpcyB0cmFuc2ZlcnJlZCB0byB0aGUgcmVjaXBpZW50
IGluIHBlcnBldHVpdHkgb3IgZm9yIGEKKyMgK2ZpeGVkIHRlcm0gKHJlZ2FyZGxlc3Mgb2YgaG93
IHRoZSB0cmFuc2FjdGlvbiBpcyBjaGFyYWN0ZXJpemVkKSwgdGhlCisjICtDb3JyZXNwb25kaW5n
IFNvdXJjZSBjb252ZXllZCB1bmRlciB0aGlzIHNlY3Rpb24gbXVzdCBiZSBhY2NvbXBhbmllZAor
IyArYnkgdGhlIEluc3RhbGxhdGlvbiBJbmZvcm1hdGlvbi4gIEJ1dCB0aGlzIHJlcXVpcmVtZW50
IGRvZXMgbm90IGFwcGx5CisjICtpZiBuZWl0aGVyIHlvdSBub3IgYW55IHRoaXJkIHBhcnR5IHJl
dGFpbnMgdGhlIGFiaWxpdHkgdG8gaW5zdGFsbAorIyArbW9kaWZpZWQgb2JqZWN0IGNvZGUgb24g
dGhlIFVzZXIgUHJvZHVjdCAoZm9yIGV4YW1wbGUsIHRoZSB3b3JrIGhhcworIyArYmVlbiBpbnN0
YWxsZWQgaW4gUk9NKS4KKyMgKworIyArICBUaGUgcmVxdWlyZW1lbnQgdG8gcHJvdmlkZSBJbnN0
YWxsYXRpb24gSW5mb3JtYXRpb24gZG9lcyBub3QgaW5jbHVkZSBhCisjICtyZXF1aXJlbWVudCB0
byBjb250aW51ZSB0byBwcm92aWRlIHN1cHBvcnQgc2VydmljZSwgd2FycmFudHksIG9yIHVwZGF0
ZXMKKyMgK2ZvciBhIHdvcmsgdGhhdCBoYXMgYmVlbiBtb2RpZmllZCBvciBpbnN0YWxsZWQgYnkg
dGhlIHJlY2lwaWVudCwgb3IgZm9yCisjICt0aGUgVXNlciBQcm9kdWN0IGluIHdoaWNoIGl0IGhh
cyBiZWVuIG1vZGlmaWVkIG9yIGluc3RhbGxlZC4gIEFjY2VzcyB0byBhCisjICtuZXR3b3JrIG1h
eSBiZSBkZW5pZWQgd2hlbiB0aGUgbW9kaWZpY2F0aW9uIGl0c2VsZiBtYXRlcmlhbGx5IGFuZAor
IyArYWR2ZXJzZWx5IGFmZmVjdHMgdGhlIG9wZXJhdGlvbiBvZiB0aGUgbmV0d29yayBvciB2aW9s
YXRlcyB0aGUgcnVsZXMgYW5kCisjICtwcm90b2NvbHMgZm9yIGNvbW11bmljYXRpb24gYWNyb3Nz
IHRoZSBuZXR3b3JrLgorIyArCisjICsgIENvcnJlc3BvbmRpbmcgU291cmNlIGNvbnZleWVkLCBh
bmQgSW5zdGFsbGF0aW9uIEluZm9ybWF0aW9uIHByb3ZpZGVkLAorIyAraW4gYWNjb3JkIHdpdGgg
dGhpcyBzZWN0aW9uIG11c3QgYmUgaW4gYSBmb3JtYXQgdGhhdCBpcyBwdWJsaWNseQorIyArZG9j
dW1lbnRlZCAoYW5kIHdpdGggYW4gaW1wbGVtZW50YXRpb24gYXZhaWxhYmxlIHRvIHRoZSBwdWJs
aWMgaW4KKyMgK3NvdXJjZSBjb2RlIGZvcm0pLCBhbmQgbXVzdCByZXF1aXJlIG5vIHNwZWNpYWwg
cGFzc3dvcmQgb3Iga2V5IGZvcgorIyArdW5wYWNraW5nLCByZWFkaW5nIG9yIGNvcHlpbmcuCisj
ICsKKyMgKyAgNy4gQWRkaXRpb25hbCBUZXJtcy4KKyMgKworIyArICAiQWRkaXRpb25hbCBwZXJt
aXNzaW9ucyIgYXJlIHRlcm1zIHRoYXQgc3VwcGxlbWVudCB0aGUgdGVybXMgb2YgdGhpcworIyAr
TGljZW5zZSBieSBtYWtpbmcgZXhjZXB0aW9ucyBmcm9tIG9uZSBvciBtb3JlIG9mIGl0cyBjb25k
aXRpb25zLgorIyArQWRkaXRpb25hbCBwZXJtaXNzaW9ucyB0aGF0IGFyZSBhcHBsaWNhYmxlIHRv
IHRoZSBlbnRpcmUgUHJvZ3JhbSBzaGFsbAorIyArYmUgdHJlYXRlZCBhcyB0aG91Z2ggdGhleSB3
ZXJlIGluY2x1ZGVkIGluIHRoaXMgTGljZW5zZSwgdG8gdGhlIGV4dGVudAorIyArdGhhdCB0aGV5
IGFyZSB2YWxpZCB1bmRlciBhcHBsaWNhYmxlIGxhdy4gIElmIGFkZGl0aW9uYWwgcGVybWlzc2lv
bnMKKyMgK2FwcGx5IG9ubHkgdG8gcGFydCBvZiB0aGUgUHJvZ3JhbSwgdGhhdCBwYXJ0IG1heSBi
ZSB1c2VkIHNlcGFyYXRlbHkKKyMgK3VuZGVyIHRob3NlIHBlcm1pc3Npb25zLCBidXQgdGhlIGVu
dGlyZSBQcm9ncmFtIHJlbWFpbnMgZ292ZXJuZWQgYnkKKyMgK3RoaXMgTGljZW5zZSB3aXRob3V0
IHJlZ2FyZCB0byB0aGUgYWRkaXRpb25hbCBwZXJtaXNzaW9ucy4KKyMgKworIyArICBXaGVuIHlv
dSBjb252ZXkgYSBjb3B5IG9mIGEgY292ZXJlZCB3b3JrLCB5b3UgbWF5IGF0IHlvdXIgb3B0aW9u
CisjICtyZW1vdmUgYW55IGFkZGl0aW9uYWwgcGVybWlzc2lvbnMgZnJvbSB0aGF0IGNvcHksIG9y
IGZyb20gYW55IHBhcnQgb2YKKyMgK2l0LiAgKEFkZGl0aW9uYWwgcGVybWlzc2lvbnMgbWF5IGJl
IHdyaXR0ZW4gdG8gcmVxdWlyZSB0aGVpciBvd24KKyMgK3JlbW92YWwgaW4gY2VydGFpbiBjYXNl
cyB3aGVuIHlvdSBtb2RpZnkgdGhlIHdvcmsuKSAgWW91IG1heSBwbGFjZQorIyArYWRkaXRpb25h
bCBwZXJtaXNzaW9ucyBvbiBtYXRlcmlhbCwgYWRkZWQgYnkgeW91IHRvIGEgY292ZXJlZCB3b3Jr
LAorIyArZm9yIHdoaWNoIHlvdSBoYXZlIG9yIGNhbiBnaXZlIGFwcHJvcHJpYXRlIGNvcHlyaWdo
dCBwZXJtaXNzaW9uLgorIyArCisjICsgIE5vdHdpdGhzdGFuZGluZyBhbnkgb3RoZXIgcHJvdmlz
aW9uIG9mIHRoaXMgTGljZW5zZSwgZm9yIG1hdGVyaWFsIHlvdQorIyArYWRkIHRvIGEgY292ZXJl
ZCB3b3JrLCB5b3UgbWF5IChpZiBhdXRob3JpemVkIGJ5IHRoZSBjb3B5cmlnaHQgaG9sZGVycyBv
ZgorIyArdGhhdCBtYXRlcmlhbCkgc3VwcGxlbWVudCB0aGUgdGVybXMgb2YgdGhpcyBMaWNlbnNl
IHdpdGggdGVybXM6CisjICsKKyMgKyAgICBhKSBEaXNjbGFpbWluZyB3YXJyYW50eSBvciBsaW1p
dGluZyBsaWFiaWxpdHkgZGlmZmVyZW50bHkgZnJvbSB0aGUKKyMgKyAgICB0ZXJtcyBvZiBzZWN0
aW9ucyAxNSBhbmQgMTYgb2YgdGhpcyBMaWNlbnNlOyBvcgorIyArCisjICsgICAgYikgUmVxdWly
aW5nIHByZXNlcnZhdGlvbiBvZiBzcGVjaWZpZWQgcmVhc29uYWJsZSBsZWdhbCBub3RpY2VzIG9y
CisjICsgICAgYXV0aG9yIGF0dHJpYnV0aW9ucyBpbiB0aGF0IG1hdGVyaWFsIG9yIGluIHRoZSBB
cHByb3ByaWF0ZSBMZWdhbAorIyArICAgIE5vdGljZXMgZGlzcGxheWVkIGJ5IHdvcmtzIGNvbnRh
aW5pbmcgaXQ7IG9yCisjICsKKyMgKyAgICBjKSBQcm9oaWJpdGluZyBtaXNyZXByZXNlbnRhdGlv
biBvZiB0aGUgb3JpZ2luIG9mIHRoYXQgbWF0ZXJpYWwsIG9yCisjICsgICAgcmVxdWlyaW5nIHRo
YXQgbW9kaWZpZWQgdmVyc2lvbnMgb2Ygc3VjaCBtYXRlcmlhbCBiZSBtYXJrZWQgaW4KKyMgKyAg
ICByZWFzb25hYmxlIHdheXMgYXMgZGlmZmVyZW50IGZyb20gdGhlIG9yaWdpbmFsIHZlcnNpb247
IG9yCisjICsKKyMgKyAgICBkKSBMaW1pdGluZyB0aGUgdXNlIGZvciBwdWJsaWNpdHkgcHVycG9z
ZXMgb2YgbmFtZXMgb2YgbGljZW5zb3JzIG9yCisjICsgICAgYXV0aG9ycyBvZiB0aGUgbWF0ZXJp
YWw7IG9yCisjICsKKyMgKyAgICBlKSBEZWNsaW5pbmcgdG8gZ3JhbnQgcmlnaHRzIHVuZGVyIHRy
YWRlbWFyayBsYXcgZm9yIHVzZSBvZiBzb21lCisjICsgICAgdHJhZGUgbmFtZXMsIHRyYWRlbWFy
a3MsIG9yIHNlcnZpY2UgbWFya3M7IG9yCisjICsKKyMgKyAgICBmKSBSZXF1aXJpbmcgaW5kZW1u
aWZpY2F0aW9uIG9mIGxpY2Vuc29ycyBhbmQgYXV0aG9ycyBvZiB0aGF0CisjICsgICAgbWF0ZXJp
YWwgYnkgYW55b25lIHdobyBjb252ZXlzIHRoZSBtYXRlcmlhbCAob3IgbW9kaWZpZWQgdmVyc2lv
bnMgb2YKKyMgKyAgICBpdCkgd2l0aCBjb250cmFjdHVhbCBhc3N1bXB0aW9ucyBvZiBsaWFiaWxp
dHkgdG8gdGhlIHJlY2lwaWVudCwgZm9yCisjICsgICAgYW55IGxpYWJpbGl0eSB0aGF0IHRoZXNl
IGNvbnRyYWN0dWFsIGFzc3VtcHRpb25zIGRpcmVjdGx5IGltcG9zZSBvbgorIyArICAgIHRob3Nl
IGxpY2Vuc29ycyBhbmQgYXV0aG9ycy4KKyMgKworIyArICBBbGwgb3RoZXIgbm9uLXBlcm1pc3Np
dmUgYWRkaXRpb25hbCB0ZXJtcyBhcmUgY29uc2lkZXJlZCAiZnVydGhlcgorIyArcmVzdHJpY3Rp
b25zIiB3aXRoaW4gdGhlIG1lYW5pbmcgb2Ygc2VjdGlvbiAxMC4gIElmIHRoZSBQcm9ncmFtIGFz
IHlvdQorIyArcmVjZWl2ZWQgaXQsIG9yIGFueSBwYXJ0IG9mIGl0LCBjb250YWlucyBhIG5vdGlj
ZSBzdGF0aW5nIHRoYXQgaXQgaXMKKyMgK2dvdmVybmVkIGJ5IHRoaXMgTGljZW5zZSBhbG9uZyB3
aXRoIGEgdGVybSB0aGF0IGlzIGEgZnVydGhlcgorIyArcmVzdHJpY3Rpb24sIHlvdSBtYXkgcmVt
b3ZlIHRoYXQgdGVybS4gIElmIGEgbGljZW5zZSBkb2N1bWVudCBjb250YWlucworIyArYSBmdXJ0
aGVyIHJlc3RyaWN0aW9uIGJ1dCBwZXJtaXRzIHJlbGljZW5zaW5nIG9yIGNvbnZleWluZyB1bmRl
ciB0aGlzCisjICtMaWNlbnNlLCB5b3UgbWF5IGFkZCB0byBhIGNvdmVyZWQgd29yayBtYXRlcmlh
bCBnb3Zlcm5lZCBieSB0aGUgdGVybXMKKyMgK29mIHRoYXQgbGljZW5zZSBkb2N1bWVudCwgcHJv
dmlkZWQgdGhhdCB0aGUgZnVydGhlciByZXN0cmljdGlvbiBkb2VzCisjICtub3Qgc3Vydml2ZSBz
dWNoIHJlbGljZW5zaW5nIG9yIGNvbnZleWluZy4KKyMgKworIyArICBJZiB5b3UgYWRkIHRlcm1z
IHRvIGEgY292ZXJlZCB3b3JrIGluIGFjY29yZCB3aXRoIHRoaXMgc2VjdGlvbiwgeW91CisjICtt
dXN0IHBsYWNlLCBpbiB0aGUgcmVsZXZhbnQgc291cmNlIGZpbGVzLCBhIHN0YXRlbWVudCBvZiB0
aGUKKyMgK2FkZGl0aW9uYWwgdGVybXMgdGhhdCBhcHBseSB0byB0aG9zZSBmaWxlcywgb3IgYSBu
b3RpY2UgaW5kaWNhdGluZworIyArd2hlcmUgdG8gZmluZCB0aGUgYXBwbGljYWJsZSB0ZXJtcy4K
KyMgKworIyArICBBZGRpdGlvbmFsIHRlcm1zLCBwZXJtaXNzaXZlIG9yIG5vbi1wZXJtaXNzaXZl
LCBtYXkgYmUgc3RhdGVkIGluIHRoZQorIyArZm9ybSBvZiBhIHNlcGFyYXRlbHkgd3JpdHRlbiBs
aWNlbnNlLCBvciBzdGF0ZWQgYXMgZXhjZXB0aW9uczsKKyMgK3RoZSBhYm92ZSByZXF1aXJlbWVu
dHMgYXBwbHkgZWl0aGVyIHdheS4KKyMgKworIyArICA4LiBUZXJtaW5hdGlvbi4KKyMgKworIyAr
ICBZb3UgbWF5IG5vdCBwcm9wYWdhdGUgb3IgbW9kaWZ5IGEgY292ZXJlZCB3b3JrIGV4Y2VwdCBh
cyBleHByZXNzbHkKKyMgK3Byb3ZpZGVkIHVuZGVyIHRoaXMgTGljZW5zZS4gIEFueSBhdHRlbXB0
IG90aGVyd2lzZSB0byBwcm9wYWdhdGUgb3IKKyMgK21vZGlmeSBpdCBpcyB2b2lkLCBhbmQgd2ls
bCBhdXRvbWF0aWNhbGx5IHRlcm1pbmF0ZSB5b3VyIHJpZ2h0cyB1bmRlcgorIyArdGhpcyBMaWNl
bnNlIChpbmNsdWRpbmcgYW55IHBhdGVudCBsaWNlbnNlcyBncmFudGVkIHVuZGVyIHRoZSB0aGly
ZAorIyArcGFyYWdyYXBoIG9mIHNlY3Rpb24gMTEpLgorIyArCisjICsgIEhvd2V2ZXIsIGlmIHlv
dSBjZWFzZSBhbGwgdmlvbGF0aW9uIG9mIHRoaXMgTGljZW5zZSwgdGhlbiB5b3VyCisjICtsaWNl
bnNlIGZyb20gYSBwYXJ0aWN1bGFyIGNvcHlyaWdodCBob2xkZXIgaXMgcmVpbnN0YXRlZCAoYSkK
KyMgK3Byb3Zpc2lvbmFsbHksIHVubGVzcyBhbmQgdW50aWwgdGhlIGNvcHlyaWdodCBob2xkZXIg
ZXhwbGljaXRseSBhbmQKKyMgK2ZpbmFsbHkgdGVybWluYXRlcyB5b3VyIGxpY2Vuc2UsIGFuZCAo
YikgcGVybWFuZW50bHksIGlmIHRoZSBjb3B5cmlnaHQKKyMgK2hvbGRlciBmYWlscyB0byBub3Rp
ZnkgeW91IG9mIHRoZSB2aW9sYXRpb24gYnkgc29tZSByZWFzb25hYmxlIG1lYW5zCisjICtwcmlv
ciB0byA2MCBkYXlzIGFmdGVyIHRoZSBjZXNzYXRpb24uCisjICsKKyMgKyAgTW9yZW92ZXIsIHlv
dXIgbGljZW5zZSBmcm9tIGEgcGFydGljdWxhciBjb3B5cmlnaHQgaG9sZGVyIGlzCisjICtyZWlu
c3RhdGVkIHBlcm1hbmVudGx5IGlmIHRoZSBjb3B5cmlnaHQgaG9sZGVyIG5vdGlmaWVzIHlvdSBv
ZiB0aGUKKyMgK3Zpb2xhdGlvbiBieSBzb21lIHJlYXNvbmFibGUgbWVhbnMsIHRoaXMgaXMgdGhl
IGZpcnN0IHRpbWUgeW91IGhhdmUKKyMgK3JlY2VpdmVkIG5vdGljZSBvZiB2aW9sYXRpb24gb2Yg
dGhpcyBMaWNlbnNlIChmb3IgYW55IHdvcmspIGZyb20gdGhhdAorIyArY29weXJpZ2h0IGhvbGRl
ciwgYW5kIHlvdSBjdXJlIHRoZSB2aW9sYXRpb24gcHJpb3IgdG8gMzAgZGF5cyBhZnRlcgorIyAr
eW91ciByZWNlaXB0IG9mIHRoZSBub3RpY2UuCisjICsKKyMgKyAgVGVybWluYXRpb24gb2YgeW91
ciByaWdodHMgdW5kZXIgdGhpcyBzZWN0aW9uIGRvZXMgbm90IHRlcm1pbmF0ZSB0aGUKKyMgK2xp
Y2Vuc2VzIG9mIHBhcnRpZXMgd2hvIGhhdmUgcmVjZWl2ZWQgY29waWVzIG9yIHJpZ2h0cyBmcm9t
IHlvdSB1bmRlcgorIyArdGhpcyBMaWNlbnNlLiAgSWYgeW91ciByaWdodHMgaGF2ZSBiZWVuIHRl
cm1pbmF0ZWQgYW5kIG5vdCBwZXJtYW5lbnRseQorIyArcmVpbnN0YXRlZCwgeW91IGRvIG5vdCBx
dWFsaWZ5IHRvIHJlY2VpdmUgbmV3IGxpY2Vuc2VzIGZvciB0aGUgc2FtZQorIyArbWF0ZXJpYWwg
dW5kZXIgc2VjdGlvbiAxMC4KKyMgKworIyArICA5LiBBY2NlcHRhbmNlIE5vdCBSZXF1aXJlZCBm
b3IgSGF2aW5nIENvcGllcy4KKyMgKworIyArICBZb3UgYXJlIG5vdCByZXF1aXJlZCB0byBhY2Nl
cHQgdGhpcyBMaWNlbnNlIGluIG9yZGVyIHRvIHJlY2VpdmUgb3IKKyMgK3J1biBhIGNvcHkgb2Yg
dGhlIFByb2dyYW0uICBBbmNpbGxhcnkgcHJvcGFnYXRpb24gb2YgYSBjb3ZlcmVkIHdvcmsKKyMg
K29jY3VycmluZyBzb2xlbHkgYXMgYSBjb25zZXF1ZW5jZSBvZiB1c2luZyBwZWVyLXRvLXBlZXIg
dHJhbnNtaXNzaW9uCisjICt0byByZWNlaXZlIGEgY29weSBsaWtld2lzZSBkb2VzIG5vdCByZXF1
aXJlIGFjY2VwdGFuY2UuICBIb3dldmVyLAorIyArbm90aGluZyBvdGhlciB0aGFuIHRoaXMgTGlj
ZW5zZSBncmFudHMgeW91IHBlcm1pc3Npb24gdG8gcHJvcGFnYXRlIG9yCisjICttb2RpZnkgYW55
IGNvdmVyZWQgd29yay4gIFRoZXNlIGFjdGlvbnMgaW5mcmluZ2UgY29weXJpZ2h0IGlmIHlvdSBk
bworIyArbm90IGFjY2VwdCB0aGlzIExpY2Vuc2UuICBUaGVyZWZvcmUsIGJ5IG1vZGlmeWluZyBv
ciBwcm9wYWdhdGluZyBhCisjICtjb3ZlcmVkIHdvcmssIHlvdSBpbmRpY2F0ZSB5b3VyIGFjY2Vw
dGFuY2Ugb2YgdGhpcyBMaWNlbnNlIHRvIGRvIHNvLgorIyArCisjICsgIDEwLiBBdXRvbWF0aWMg
TGljZW5zaW5nIG9mIERvd25zdHJlYW0gUmVjaXBpZW50cy4KKyMgKworIyArICBFYWNoIHRpbWUg
eW91IGNvbnZleSBhIGNvdmVyZWQgd29yaywgdGhlIHJlY2lwaWVudCBhdXRvbWF0aWNhbGx5Cisj
ICtyZWNlaXZlcyBhIGxpY2Vuc2UgZnJvbSB0aGUgb3JpZ2luYWwgbGljZW5zb3JzLCB0byBydW4s
IG1vZGlmeSBhbmQKKyMgK3Byb3BhZ2F0ZSB0aGF0IHdvcmssIHN1YmplY3QgdG8gdGhpcyBMaWNl
bnNlLiAgWW91IGFyZSBub3QgcmVzcG9uc2libGUKKyMgK2ZvciBlbmZvcmNpbmcgY29tcGxpYW5j
ZSBieSB0aGlyZCBwYXJ0aWVzIHdpdGggdGhpcyBMaWNlbnNlLgorIyArCisjICsgIEFuICJlbnRp
dHkgdHJhbnNhY3Rpb24iIGlzIGEgdHJhbnNhY3Rpb24gdHJhbnNmZXJyaW5nIGNvbnRyb2wgb2Yg
YW4KKyMgK29yZ2FuaXphdGlvbiwgb3Igc3Vic3RhbnRpYWxseSBhbGwgYXNzZXRzIG9mIG9uZSwg
b3Igc3ViZGl2aWRpbmcgYW4KKyMgK29yZ2FuaXphdGlvbiwgb3IgbWVyZ2luZyBvcmdhbml6YXRp
b25zLiAgSWYgcHJvcGFnYXRpb24gb2YgYSBjb3ZlcmVkCisjICt3b3JrIHJlc3VsdHMgZnJvbSBh
biBlbnRpdHkgdHJhbnNhY3Rpb24sIGVhY2ggcGFydHkgdG8gdGhhdAorIyArdHJhbnNhY3Rpb24g
d2hvIHJlY2VpdmVzIGEgY29weSBvZiB0aGUgd29yayBhbHNvIHJlY2VpdmVzIHdoYXRldmVyCisj
ICtsaWNlbnNlcyB0byB0aGUgd29yayB0aGUgcGFydHkncyBwcmVkZWNlc3NvciBpbiBpbnRlcmVz
dCBoYWQgb3IgY291bGQKKyMgK2dpdmUgdW5kZXIgdGhlIHByZXZpb3VzIHBhcmFncmFwaCwgcGx1
cyBhIHJpZ2h0IHRvIHBvc3Nlc3Npb24gb2YgdGhlCisjICtDb3JyZXNwb25kaW5nIFNvdXJjZSBv
ZiB0aGUgd29yayBmcm9tIHRoZSBwcmVkZWNlc3NvciBpbiBpbnRlcmVzdCwgaWYKKyMgK3RoZSBw
cmVkZWNlc3NvciBoYXMgaXQgb3IgY2FuIGdldCBpdCB3aXRoIHJlYXNvbmFibGUgZWZmb3J0cy4K
KyMgKworIyArICBZb3UgbWF5IG5vdCBpbXBvc2UgYW55IGZ1cnRoZXIgcmVzdHJpY3Rpb25zIG9u
IHRoZSBleGVyY2lzZSBvZiB0aGUKKyMgK3JpZ2h0cyBncmFudGVkIG9yIGFmZmlybWVkIHVuZGVy
IHRoaXMgTGljZW5zZS4gIEZvciBleGFtcGxlLCB5b3UgbWF5CisjICtub3QgaW1wb3NlIGEgbGlj
ZW5zZSBmZWUsIHJveWFsdHksIG9yIG90aGVyIGNoYXJnZSBmb3IgZXhlcmNpc2Ugb2YKKyMgK3Jp
Z2h0cyBncmFudGVkIHVuZGVyIHRoaXMgTGljZW5zZSwgYW5kIHlvdSBtYXkgbm90IGluaXRpYXRl
IGxpdGlnYXRpb24KKyMgKyhpbmNsdWRpbmcgYSBjcm9zcy1jbGFpbSBvciBjb3VudGVyY2xhaW0g
aW4gYSBsYXdzdWl0KSBhbGxlZ2luZyB0aGF0CisjICthbnkgcGF0ZW50IGNsYWltIGlzIGluZnJp
bmdlZCBieSBtYWtpbmcsIHVzaW5nLCBzZWxsaW5nLCBvZmZlcmluZyBmb3IKKyMgK3NhbGUsIG9y
IGltcG9ydGluZyB0aGUgUHJvZ3JhbSBvciBhbnkgcG9ydGlvbiBvZiBpdC4KKyMgKworIyArICAx
MS4gUGF0ZW50cy4KKyMgKworIyArICBBICJjb250cmlidXRvciIgaXMgYSBjb3B5cmlnaHQgaG9s
ZGVyIHdobyBhdXRob3JpemVzIHVzZSB1bmRlciB0aGlzCisjICtMaWNlbnNlIG9mIHRoZSBQcm9n
cmFtIG9yIGEgd29yayBvbiB3aGljaCB0aGUgUHJvZ3JhbSBpcyBiYXNlZC4gIFRoZQorIyArd29y
ayB0aHVzIGxpY2Vuc2VkIGlzIGNhbGxlZCB0aGUgY29udHJpYnV0b3IncyAiY29udHJpYnV0b3Ig
dmVyc2lvbiIuCisjICsKKyMgKyAgQSBjb250cmlidXRvcidzICJlc3NlbnRpYWwgcGF0ZW50IGNs
YWltcyIgYXJlIGFsbCBwYXRlbnQgY2xhaW1zCisjICtvd25lZCBvciBjb250cm9sbGVkIGJ5IHRo
ZSBjb250cmlidXRvciwgd2hldGhlciBhbHJlYWR5IGFjcXVpcmVkIG9yCisjICtoZXJlYWZ0ZXIg
YWNxdWlyZWQsIHRoYXQgd291bGQgYmUgaW5mcmluZ2VkIGJ5IHNvbWUgbWFubmVyLCBwZXJtaXR0
ZWQKKyMgK2J5IHRoaXMgTGljZW5zZSwgb2YgbWFraW5nLCB1c2luZywgb3Igc2VsbGluZyBpdHMg
Y29udHJpYnV0b3IgdmVyc2lvbiwKKyMgK2J1dCBkbyBub3QgaW5jbHVkZSBjbGFpbXMgdGhhdCB3
b3VsZCBiZSBpbmZyaW5nZWQgb25seSBhcyBhCisjICtjb25zZXF1ZW5jZSBvZiBmdXJ0aGVyIG1v
ZGlmaWNhdGlvbiBvZiB0aGUgY29udHJpYnV0b3IgdmVyc2lvbi4gIEZvcgorIyArcHVycG9zZXMg
b2YgdGhpcyBkZWZpbml0aW9uLCAiY29udHJvbCIgaW5jbHVkZXMgdGhlIHJpZ2h0IHRvIGdyYW50
CisjICtwYXRlbnQgc3VibGljZW5zZXMgaW4gYSBtYW5uZXIgY29uc2lzdGVudCB3aXRoIHRoZSBy
ZXF1aXJlbWVudHMgb2YKKyMgK3RoaXMgTGljZW5zZS4KKyMgKworIyArICBFYWNoIGNvbnRyaWJ1
dG9yIGdyYW50cyB5b3UgYSBub24tZXhjbHVzaXZlLCB3b3JsZHdpZGUsIHJveWFsdHktZnJlZQor
IyArcGF0ZW50IGxpY2Vuc2UgdW5kZXIgdGhlIGNvbnRyaWJ1dG9yJ3MgZXNzZW50aWFsIHBhdGVu
dCBjbGFpbXMsIHRvCisjICttYWtlLCB1c2UsIHNlbGwsIG9mZmVyIGZvciBzYWxlLCBpbXBvcnQg
YW5kIG90aGVyd2lzZSBydW4sIG1vZGlmeSBhbmQKKyMgK3Byb3BhZ2F0ZSB0aGUgY29udGVudHMg
b2YgaXRzIGNvbnRyaWJ1dG9yIHZlcnNpb24uCisjICsKKyMgKyAgSW4gdGhlIGZvbGxvd2luZyB0
aHJlZSBwYXJhZ3JhcGhzLCBhICJwYXRlbnQgbGljZW5zZSIgaXMgYW55IGV4cHJlc3MKKyMgK2Fn
cmVlbWVudCBvciBjb21taXRtZW50LCBob3dldmVyIGRlbm9taW5hdGVkLCBub3QgdG8gZW5mb3Jj
ZSBhIHBhdGVudAorIyArKHN1Y2ggYXMgYW4gZXhwcmVzcyBwZXJtaXNzaW9uIHRvIHByYWN0aWNl
IGEgcGF0ZW50IG9yIGNvdmVuYW50IG5vdCB0bworIyArc3VlIGZvciBwYXRlbnQgaW5mcmluZ2Vt
ZW50KS4gIFRvICJncmFudCIgc3VjaCBhIHBhdGVudCBsaWNlbnNlIHRvIGEKKyMgK3BhcnR5IG1l
YW5zIHRvIG1ha2Ugc3VjaCBhbiBhZ3JlZW1lbnQgb3IgY29tbWl0bWVudCBub3QgdG8gZW5mb3Jj
ZSBhCisjICtwYXRlbnQgYWdhaW5zdCB0aGUgcGFydHkuCisjICsKKyMgKyAgSWYgeW91IGNvbnZl
eSBhIGNvdmVyZWQgd29yaywga25vd2luZ2x5IHJlbHlpbmcgb24gYSBwYXRlbnQgbGljZW5zZSwK
KyMgK2FuZCB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2Ugb2YgdGhlIHdvcmsgaXMgbm90IGF2YWls
YWJsZSBmb3IgYW55b25lCisjICt0byBjb3B5LCBmcmVlIG9mIGNoYXJnZSBhbmQgdW5kZXIgdGhl
IHRlcm1zIG9mIHRoaXMgTGljZW5zZSwgdGhyb3VnaCBhCisjICtwdWJsaWNseSBhdmFpbGFibGUg
bmV0d29yayBzZXJ2ZXIgb3Igb3RoZXIgcmVhZGlseSBhY2Nlc3NpYmxlIG1lYW5zLAorIyArdGhl
biB5b3UgbXVzdCBlaXRoZXIgKDEpIGNhdXNlIHRoZSBDb3JyZXNwb25kaW5nIFNvdXJjZSB0byBi
ZSBzbworIyArYXZhaWxhYmxlLCBvciAoMikgYXJyYW5nZSB0byBkZXByaXZlIHlvdXJzZWxmIG9m
IHRoZSBiZW5lZml0IG9mIHRoZQorIyArcGF0ZW50IGxpY2Vuc2UgZm9yIHRoaXMgcGFydGljdWxh
ciB3b3JrLCBvciAoMykgYXJyYW5nZSwgaW4gYSBtYW5uZXIKKyMgK2NvbnNpc3RlbnQgd2l0aCB0
aGUgcmVxdWlyZW1lbnRzIG9mIHRoaXMgTGljZW5zZSwgdG8gZXh0ZW5kIHRoZSBwYXRlbnQKKyMg
K2xpY2Vuc2UgdG8gZG93bnN0cmVhbSByZWNpcGllbnRzLiAgIktub3dpbmdseSByZWx5aW5nIiBt
ZWFucyB5b3UgaGF2ZQorIyArYWN0dWFsIGtub3dsZWRnZSB0aGF0LCBidXQgZm9yIHRoZSBwYXRl
bnQgbGljZW5zZSwgeW91ciBjb252ZXlpbmcgdGhlCisjICtjb3ZlcmVkIHdvcmsgaW4gYSBjb3Vu
dHJ5LCBvciB5b3VyIHJlY2lwaWVudCdzIHVzZSBvZiB0aGUgY292ZXJlZCB3b3JrCisjICtpbiBh
IGNvdW50cnksIHdvdWxkIGluZnJpbmdlIG9uZSBvciBtb3JlIGlkZW50aWZpYWJsZSBwYXRlbnRz
IGluIHRoYXQKKyMgK2NvdW50cnkgdGhhdCB5b3UgaGF2ZSByZWFzb24gdG8gYmVsaWV2ZSBhcmUg
dmFsaWQuCisjICsKKyMgKyAgSWYsIHB1cnN1YW50IHRvIG9yIGluIGNvbm5lY3Rpb24gd2l0aCBh
IHNpbmdsZSB0cmFuc2FjdGlvbiBvcgorIyArYXJyYW5nZW1lbnQsIHlvdSBjb252ZXksIG9yIHBy
b3BhZ2F0ZSBieSBwcm9jdXJpbmcgY29udmV5YW5jZSBvZiwgYQorIyArY292ZXJlZCB3b3JrLCBh
bmQgZ3JhbnQgYSBwYXRlbnQgbGljZW5zZSB0byBzb21lIG9mIHRoZSBwYXJ0aWVzCisjICtyZWNl
aXZpbmcgdGhlIGNvdmVyZWQgd29yayBhdXRob3JpemluZyB0aGVtIHRvIHVzZSwgcHJvcGFnYXRl
LCBtb2RpZnkKKyMgK29yIGNvbnZleSBhIHNwZWNpZmljIGNvcHkgb2YgdGhlIGNvdmVyZWQgd29y
aywgdGhlbiB0aGUgcGF0ZW50IGxpY2Vuc2UKKyMgK3lvdSBncmFudCBpcyBhdXRvbWF0aWNhbGx5
IGV4dGVuZGVkIHRvIGFsbCByZWNpcGllbnRzIG9mIHRoZSBjb3ZlcmVkCisjICt3b3JrIGFuZCB3
b3JrcyBiYXNlZCBvbiBpdC4KKyMgKworIyArICBBIHBhdGVudCBsaWNlbnNlIGlzICJkaXNjcmlt
aW5hdG9yeSIgaWYgaXQgZG9lcyBub3QgaW5jbHVkZSB3aXRoaW4KKyMgK3RoZSBzY29wZSBvZiBp
dHMgY292ZXJhZ2UsIHByb2hpYml0cyB0aGUgZXhlcmNpc2Ugb2YsIG9yIGlzCisjICtjb25kaXRp
b25lZCBvbiB0aGUgbm9uLWV4ZXJjaXNlIG9mIG9uZSBvciBtb3JlIG9mIHRoZSByaWdodHMgdGhh
dCBhcmUKKyMgK3NwZWNpZmljYWxseSBncmFudGVkIHVuZGVyIHRoaXMgTGljZW5zZS4gIFlvdSBt
YXkgbm90IGNvbnZleSBhIGNvdmVyZWQKKyMgK3dvcmsgaWYgeW91IGFyZSBhIHBhcnR5IHRvIGFu
IGFycmFuZ2VtZW50IHdpdGggYSB0aGlyZCBwYXJ0eSB0aGF0IGlzCisjICtpbiB0aGUgYnVzaW5l
c3Mgb2YgZGlzdHJpYnV0aW5nIHNvZnR3YXJlLCB1bmRlciB3aGljaCB5b3UgbWFrZSBwYXltZW50
CisjICt0byB0aGUgdGhpcmQgcGFydHkgYmFzZWQgb24gdGhlIGV4dGVudCBvZiB5b3VyIGFjdGl2
aXR5IG9mIGNvbnZleWluZworIyArdGhlIHdvcmssIGFuZCB1bmRlciB3aGljaCB0aGUgdGhpcmQg
cGFydHkgZ3JhbnRzLCB0byBhbnkgb2YgdGhlCisjICtwYXJ0aWVzIHdobyB3b3VsZCByZWNlaXZl
IHRoZSBjb3ZlcmVkIHdvcmsgZnJvbSB5b3UsIGEgZGlzY3JpbWluYXRvcnkKKyMgK3BhdGVudCBs
aWNlbnNlIChhKSBpbiBjb25uZWN0aW9uIHdpdGggY29waWVzIG9mIHRoZSBjb3ZlcmVkIHdvcmsK
KyMgK2NvbnZleWVkIGJ5IHlvdSAob3IgY29waWVzIG1hZGUgZnJvbSB0aG9zZSBjb3BpZXMpLCBv
ciAoYikgcHJpbWFyaWx5CisjICtmb3IgYW5kIGluIGNvbm5lY3Rpb24gd2l0aCBzcGVjaWZpYyBw
cm9kdWN0cyBvciBjb21waWxhdGlvbnMgdGhhdAorIyArY29udGFpbiB0aGUgY292ZXJlZCB3b3Jr
LCB1bmxlc3MgeW91IGVudGVyZWQgaW50byB0aGF0IGFycmFuZ2VtZW50LAorIyArb3IgdGhhdCBw
YXRlbnQgbGljZW5zZSB3YXMgZ3JhbnRlZCwgcHJpb3IgdG8gMjggTWFyY2ggMjAwNy4KKyMgKwor
IyArICBOb3RoaW5nIGluIHRoaXMgTGljZW5zZSBzaGFsbCBiZSBjb25zdHJ1ZWQgYXMgZXhjbHVk
aW5nIG9yIGxpbWl0aW5nCisjICthbnkgaW1wbGllZCBsaWNlbnNlIG9yIG90aGVyIGRlZmVuc2Vz
IHRvIGluZnJpbmdlbWVudCB0aGF0IG1heQorIyArb3RoZXJ3aXNlIGJlIGF2YWlsYWJsZSB0byB5
b3UgdW5kZXIgYXBwbGljYWJsZSBwYXRlbnQgbGF3LgorIyArCisjICsgIDEyLiBObyBTdXJyZW5k
ZXIgb2YgT3RoZXJzJyBGcmVlZG9tLgorIyArCisjICsgIElmIGNvbmRpdGlvbnMgYXJlIGltcG9z
ZWQgb24geW91ICh3aGV0aGVyIGJ5IGNvdXJ0IG9yZGVyLCBhZ3JlZW1lbnQgb3IKKyMgK290aGVy
d2lzZSkgdGhhdCBjb250cmFkaWN0IHRoZSBjb25kaXRpb25zIG9mIHRoaXMgTGljZW5zZSwgdGhl
eSBkbyBub3QKKyMgK2V4Y3VzZSB5b3UgZnJvbSB0aGUgY29uZGl0aW9ucyBvZiB0aGlzIExpY2Vu
c2UuICBJZiB5b3UgY2Fubm90IGNvbnZleSBhCisjICtjb3ZlcmVkIHdvcmsgc28gYXMgdG8gc2F0
aXNmeSBzaW11bHRhbmVvdXNseSB5b3VyIG9ibGlnYXRpb25zIHVuZGVyIHRoaXMKKyMgK0xpY2Vu
c2UgYW5kIGFueSBvdGhlciBwZXJ0aW5lbnQgb2JsaWdhdGlvbnMsIHRoZW4gYXMgYSBjb25zZXF1
ZW5jZSB5b3UgbWF5CisjICtub3QgY29udmV5IGl0IGF0IGFsbC4gIEZvciBleGFtcGxlLCBpZiB5
b3UgYWdyZWUgdG8gdGVybXMgdGhhdCBvYmxpZ2F0ZSB5b3UKKyMgK3RvIGNvbGxlY3QgYSByb3lh
bHR5IGZvciBmdXJ0aGVyIGNvbnZleWluZyBmcm9tIHRob3NlIHRvIHdob20geW91IGNvbnZleQor
IyArdGhlIFByb2dyYW0sIHRoZSBvbmx5IHdheSB5b3UgY291bGQgc2F0aXNmeSBib3RoIHRob3Nl
IHRlcm1zIGFuZCB0aGlzCisjICtMaWNlbnNlIHdvdWxkIGJlIHRvIHJlZnJhaW4gZW50aXJlbHkg
ZnJvbSBjb252ZXlpbmcgdGhlIFByb2dyYW0uCisjICsKKyMgKyAgMTMuIFVzZSB3aXRoIHRoZSBH
TlUgQWZmZXJvIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuCisjICsKKyMgKyAgTm90d2l0aHN0YW5k
aW5nIGFueSBvdGhlciBwcm92aXNpb24gb2YgdGhpcyBMaWNlbnNlLCB5b3UgaGF2ZQorIyArcGVy
bWlzc2lvbiB0byBsaW5rIG9yIGNvbWJpbmUgYW55IGNvdmVyZWQgd29yayB3aXRoIGEgd29yayBs
aWNlbnNlZAorIyArdW5kZXIgdmVyc2lvbiAzIG9mIHRoZSBHTlUgQWZmZXJvIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgaW50byBhIHNpbmdsZQorIyArY29tYmluZWQgd29yaywgYW5kIHRvIGNvbnZl
eSB0aGUgcmVzdWx0aW5nIHdvcmsuICBUaGUgdGVybXMgb2YgdGhpcworIyArTGljZW5zZSB3aWxs
IGNvbnRpbnVlIHRvIGFwcGx5IHRvIHRoZSBwYXJ0IHdoaWNoIGlzIHRoZSBjb3ZlcmVkIHdvcmss
CisjICtidXQgdGhlIHNwZWNpYWwgcmVxdWlyZW1lbnRzIG9mIHRoZSBHTlUgQWZmZXJvIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UsCisjICtzZWN0aW9uIDEzLCBjb25jZXJuaW5nIGludGVyYWN0aW9u
IHRocm91Z2ggYSBuZXR3b3JrIHdpbGwgYXBwbHkgdG8gdGhlCisjICtjb21iaW5hdGlvbiBhcyBz
dWNoLgorIyArCisjICsgIDE0LiBSZXZpc2VkIFZlcnNpb25zIG9mIHRoaXMgTGljZW5zZS4KKyMg
KworIyArICBUaGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uIG1heSBwdWJsaXNoIHJldmlzZWQg
YW5kL29yIG5ldyB2ZXJzaW9ucyBvZgorIyArdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGZyb20gdGltZSB0byB0aW1lLiAgU3VjaCBuZXcgdmVyc2lvbnMgd2lsbAorIyArYmUgc2ltaWxh
ciBpbiBzcGlyaXQgdG8gdGhlIHByZXNlbnQgdmVyc2lvbiwgYnV0IG1heSBkaWZmZXIgaW4gZGV0
YWlsIHRvCisjICthZGRyZXNzIG5ldyBwcm9ibGVtcyBvciBjb25jZXJucy4KKyMgKworIyArICBF
YWNoIHZlcnNpb24gaXMgZ2l2ZW4gYSBkaXN0aW5ndWlzaGluZyB2ZXJzaW9uIG51bWJlci4gIElm
IHRoZQorIyArUHJvZ3JhbSBzcGVjaWZpZXMgdGhhdCBhIGNlcnRhaW4gbnVtYmVyZWQgdmVyc2lv
biBvZiB0aGUgR05VIEdlbmVyYWwKKyMgK1B1YmxpYyBMaWNlbnNlICJvciBhbnkgbGF0ZXIgdmVy
c2lvbiIgYXBwbGllcyB0byBpdCwgeW91IGhhdmUgdGhlCisjICtvcHRpb24gb2YgZm9sbG93aW5n
IHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBlaXRoZXIgb2YgdGhhdCBudW1iZXJlZAorIyArdmVy
c2lvbiBvciBvZiBhbnkgbGF0ZXIgdmVyc2lvbiBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdh
cmUKKyMgK0ZvdW5kYXRpb24uICBJZiB0aGUgUHJvZ3JhbSBkb2VzIG5vdCBzcGVjaWZ5IGEgdmVy
c2lvbiBudW1iZXIgb2YgdGhlCisjICtHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSwgeW91IG1h
eSBjaG9vc2UgYW55IHZlcnNpb24gZXZlciBwdWJsaXNoZWQKKyMgK2J5IHRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb24uCisjICsKKyMgKyAgSWYgdGhlIFByb2dyYW0gc3BlY2lmaWVzIHRoYXQg
YSBwcm94eSBjYW4gZGVjaWRlIHdoaWNoIGZ1dHVyZQorIyArdmVyc2lvbnMgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGNhbiBiZSB1c2VkLCB0aGF0IHByb3h5J3MKKyMgK3B1Ymxp
YyBzdGF0ZW1lbnQgb2YgYWNjZXB0YW5jZSBvZiBhIHZlcnNpb24gcGVybWFuZW50bHkgYXV0aG9y
aXplcyB5b3UKKyMgK3RvIGNob29zZSB0aGF0IHZlcnNpb24gZm9yIHRoZSBQcm9ncmFtLgorIyAr
CisjICsgIExhdGVyIGxpY2Vuc2UgdmVyc2lvbnMgbWF5IGdpdmUgeW91IGFkZGl0aW9uYWwgb3Ig
ZGlmZmVyZW50CisjICtwZXJtaXNzaW9ucy4gIEhvd2V2ZXIsIG5vIGFkZGl0aW9uYWwgb2JsaWdh
dGlvbnMgYXJlIGltcG9zZWQgb24gYW55CisjICthdXRob3Igb3IgY29weXJpZ2h0IGhvbGRlciBh
cyBhIHJlc3VsdCBvZiB5b3VyIGNob29zaW5nIHRvIGZvbGxvdyBhCisjICtsYXRlciB2ZXJzaW9u
LgorIyArCisjICsgIDE1LiBEaXNjbGFpbWVyIG9mIFdhcnJhbnR5LgorIyArCisjICsgIFRIRVJF
IElTIE5PIFdBUlJBTlRZIEZPUiBUSEUgUFJPR1JBTSwgVE8gVEhFIEVYVEVOVCBQRVJNSVRURUQg
QlkKKyMgK0FQUExJQ0FCTEUgTEFXLiAgRVhDRVBUIFdIRU4gT1RIRVJXSVNFIFNUQVRFRCBJTiBX
UklUSU5HIFRIRSBDT1BZUklHSFQKKyMgK0hPTERFUlMgQU5EL09SIE9USEVSIFBBUlRJRVMgUFJP
VklERSBUSEUgUFJPR1JBTSAiQVMgSVMiIFdJVEhPVVQgV0FSUkFOVFkKKyMgK09GIEFOWSBLSU5E
LCBFSVRIRVIgRVhQUkVTU0VEIE9SIElNUExJRUQsIElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVE
IFRPLAorIyArVEhFIElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJ
VE5FU1MgRk9SIEEgUEFSVElDVUxBUgorIyArUFVSUE9TRS4gIFRIRSBFTlRJUkUgUklTSyBBUyBU
TyBUSEUgUVVBTElUWSBBTkQgUEVSRk9STUFOQ0UgT0YgVEhFIFBST0dSQU0KKyMgK0lTIFdJVEgg
WU9VLiAgU0hPVUxEIFRIRSBQUk9HUkFNIFBST1ZFIERFRkVDVElWRSwgWU9VIEFTU1VNRSBUSEUg
Q09TVCBPRgorIyArQUxMIE5FQ0VTU0FSWSBTRVJWSUNJTkcsIFJFUEFJUiBPUiBDT1JSRUNUSU9O
LgorIyArCisjICsgIDE2LiBMaW1pdGF0aW9uIG9mIExpYWJpbGl0eS4KKyMgKworIyArICBJTiBO
TyBFVkVOVCBVTkxFU1MgUkVRVUlSRUQgQlkgQVBQTElDQUJMRSBMQVcgT1IgQUdSRUVEIFRPIElO
IFdSSVRJTkcKKyMgK1dJTEwgQU5ZIENPUFlSSUdIVCBIT0xERVIsIE9SIEFOWSBPVEhFUiBQQVJU
WSBXSE8gTU9ESUZJRVMgQU5EL09SIENPTlZFWVMKKyMgK1RIRSBQUk9HUkFNIEFTIFBFUk1JVFRF
RCBBQk9WRSwgQkUgTElBQkxFIFRPIFlPVSBGT1IgREFNQUdFUywgSU5DTFVESU5HIEFOWQorIyAr
R0VORVJBTCwgU1BFQ0lBTCwgSU5DSURFTlRBTCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMgQVJJ
U0lORyBPVVQgT0YgVEhFCisjICtVU0UgT1IgSU5BQklMSVRZIFRPIFVTRSBUSEUgUFJPR1JBTSAo
SU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBMT1NTIE9GCisjICtEQVRBIE9SIERBVEEgQkVJ
TkcgUkVOREVSRUQgSU5BQ0NVUkFURSBPUiBMT1NTRVMgU1VTVEFJTkVEIEJZIFlPVSBPUiBUSElS
RAorIyArUEFSVElFUyBPUiBBIEZBSUxVUkUgT0YgVEhFIFBST0dSQU0gVE8gT1BFUkFURSBXSVRI
IEFOWSBPVEhFUiBQUk9HUkFNUyksCisjICtFVkVOIElGIFNVQ0ggSE9MREVSIE9SIE9USEVSIFBB
UlRZIEhBUyBCRUVOIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GCisjICtTVUNIIERBTUFH
RVMuCisjICsKKyMgKyAgMTcuIEludGVycHJldGF0aW9uIG9mIFNlY3Rpb25zIDE1IGFuZCAxNi4K
KyMgKworIyArICBJZiB0aGUgZGlzY2xhaW1lciBvZiB3YXJyYW50eSBhbmQgbGltaXRhdGlvbiBv
ZiBsaWFiaWxpdHkgcHJvdmlkZWQKKyMgK2Fib3ZlIGNhbm5vdCBiZSBnaXZlbiBsb2NhbCBsZWdh
bCBlZmZlY3QgYWNjb3JkaW5nIHRvIHRoZWlyIHRlcm1zLAorIyArcmV2aWV3aW5nIGNvdXJ0cyBz
aGFsbCBhcHBseSBsb2NhbCBsYXcgdGhhdCBtb3N0IGNsb3NlbHkgYXBwcm94aW1hdGVzCisjICth
biBhYnNvbHV0ZSB3YWl2ZXIgb2YgYWxsIGNpdmlsIGxpYWJpbGl0eSBpbiBjb25uZWN0aW9uIHdp
dGggdGhlCisjICtQcm9ncmFtLCB1bmxlc3MgYSB3YXJyYW50eSBvciBhc3N1bXB0aW9uIG9mIGxp
YWJpbGl0eSBhY2NvbXBhbmllcyBhCisjICtjb3B5IG9mIHRoZSBQcm9ncmFtIGluIHJldHVybiBm
b3IgYSBmZWUuCisjICsKKyMgKyAgICAgICAgICAgICAgICAgICAgIEVORCBPRiBURVJNUyBBTkQg
Q09ORElUSU9OUworIyArCisjICsgICAgICAgICAgICBIb3cgdG8gQXBwbHkgVGhlc2UgVGVybXMg
dG8gWW91ciBOZXcgUHJvZ3JhbXMKKyMgKworIyArICBJZiB5b3UgZGV2ZWxvcCBhIG5ldyBwcm9n
cmFtLCBhbmQgeW91IHdhbnQgaXQgdG8gYmUgb2YgdGhlIGdyZWF0ZXN0CisjICtwb3NzaWJsZSB1
c2UgdG8gdGhlIHB1YmxpYywgdGhlIGJlc3Qgd2F5IHRvIGFjaGlldmUgdGhpcyBpcyB0byBtYWtl
IGl0CisjICtmcmVlIHNvZnR3YXJlIHdoaWNoIGV2ZXJ5b25lIGNhbiByZWRpc3RyaWJ1dGUgYW5k
IGNoYW5nZSB1bmRlciB0aGVzZSB0ZXJtcy4KKyMgKworIyArICBUbyBkbyBzbywgYXR0YWNoIHRo
ZSBmb2xsb3dpbmcgbm90aWNlcyB0byB0aGUgcHJvZ3JhbS4gIEl0IGlzIHNhZmVzdAorIyArdG8g
YXR0YWNoIHRoZW0gdG8gdGhlIHN0YXJ0IG9mIGVhY2ggc291cmNlIGZpbGUgdG8gbW9zdCBlZmZl
Y3RpdmVseQorIyArc3RhdGUgdGhlIGV4Y2x1c2lvbiBvZiB3YXJyYW50eTsgYW5kIGVhY2ggZmls
ZSBzaG91bGQgaGF2ZSBhdCBsZWFzdAorIyArdGhlICJjb3B5cmlnaHQiIGxpbmUgYW5kIGEgcG9p
bnRlciB0byB3aGVyZSB0aGUgZnVsbCBub3RpY2UgaXMgZm91bmQuCisjICsKKyMgKyAgICA8b25l
IGxpbmUgdG8gZ2l2ZSB0aGUgcHJvZ3JhbSdzIG5hbWUgYW5kIGEgYnJpZWYgaWRlYSBvZiB3aGF0
IGl0IGRvZXMuPgorIyArICAgIENvcHlyaWdodCAoQykgPHllYXI+ICA8bmFtZSBvZiBhdXRob3I+
CisjICsKKyMgKyAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTogeW91IGNhbiByZWRp
c3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorIyArICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisjICsgICAgdGhl
IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgZWl0aGVyIHZlcnNpb24gMyBvZiB0aGUgTGljZW5z
ZSwgb3IKKyMgKyAgICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorIyArCisj
ICsgICAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2ls
bCBiZSB1c2VmdWwsCisjICsgICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2
ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyMgKyAgICBNRVJDSEFOVEFCSUxJVFkgb3IgRklU
TkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisjICsgICAgR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgKworIyArICAgIFlvdSBzaG91
bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
CisjICsgICAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8aHR0cHM6Ly93
d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorIyArCisjICtBbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBo
b3cgdG8gY29udGFjdCB5b3UgYnkgZWxlY3Ryb25pYyBhbmQgcGFwZXIgbWFpbC4KKyMgKworIyAr
ICBJZiB0aGUgcHJvZ3JhbSBkb2VzIHRlcm1pbmFsIGludGVyYWN0aW9uLCBtYWtlIGl0IG91dHB1
dCBhIHNob3J0CisjICtub3RpY2UgbGlrZSB0aGlzIHdoZW4gaXQgc3RhcnRzIGluIGFuIGludGVy
YWN0aXZlIG1vZGU6CisjICsKKyMgKyAgICA8cHJvZ3JhbT4gIENvcHlyaWdodCAoQykgPHllYXI+
ICA8bmFtZSBvZiBhdXRob3I+CisjICsgICAgVGhpcyBwcm9ncmFtIGNvbWVzIHdpdGggQUJTT0xV
VEVMWSBOTyBXQVJSQU5UWTsgZm9yIGRldGFpbHMgdHlwZSBgc2hvdyB3Jy4KKyMgKyAgICBUaGlz
IGlzIGZyZWUgc29mdHdhcmUsIGFuZCB5b3UgYXJlIHdlbGNvbWUgdG8gcmVkaXN0cmlidXRlIGl0
CisjICsgICAgdW5kZXIgY2VydGFpbiBjb25kaXRpb25zOyB0eXBlIGBzaG93IGMnIGZvciBkZXRh
aWxzLgorIyArCisjICtUaGUgaHlwb3RoZXRpY2FsIGNvbW1hbmRzIGBzaG93IHcnIGFuZCBgc2hv
dyBjJyBzaG91bGQgc2hvdyB0aGUgYXBwcm9wcmlhdGUKKyMgK3BhcnRzIG9mIHRoZSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlLiAgT2YgY291cnNlLCB5b3VyIHByb2dyYW0ncyBjb21tYW5kcworIyAr
bWlnaHQgYmUgZGlmZmVyZW50OyBmb3IgYSBHVUkgaW50ZXJmYWNlLCB5b3Ugd291bGQgdXNlIGFu
ICJhYm91dCBib3giLgorIyArCisjICsgIFlvdSBzaG91bGQgYWxzbyBnZXQgeW91ciBlbXBsb3ll
ciAoaWYgeW91IHdvcmsgYXMgYSBwcm9ncmFtbWVyKSBvciBzY2hvb2wsCisjICtpZiBhbnksIHRv
IHNpZ24gYSAiY29weXJpZ2h0IGRpc2NsYWltZXIiIGZvciB0aGUgcHJvZ3JhbSwgaWYgbmVjZXNz
YXJ5LgorIyArRm9yIG1vcmUgaW5mb3JtYXRpb24gb24gdGhpcywgYW5kIGhvdyB0byBhcHBseSBh
bmQgZm9sbG93IHRoZSBHTlUgR1BMLCBzZWUKKyMgKzxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vu
c2VzLz4uCisjICsKKyMgKyAgVGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGRvZXMgbm90
IHBlcm1pdCBpbmNvcnBvcmF0aW5nIHlvdXIgcHJvZ3JhbQorIyAraW50byBwcm9wcmlldGFyeSBw
cm9ncmFtcy4gIElmIHlvdXIgcHJvZ3JhbSBpcyBhIHN1YnJvdXRpbmUgbGlicmFyeSwgeW91Cisj
ICttYXkgY29uc2lkZXIgaXQgbW9yZSB1c2VmdWwgdG8gcGVybWl0IGxpbmtpbmcgcHJvcHJpZXRh
cnkgYXBwbGljYXRpb25zIHdpdGgKKyMgK3RoZSBsaWJyYXJ5LiAgSWYgdGhpcyBpcyB3aGF0IHlv
dSB3YW50IHRvIGRvLCB1c2UgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbAorIyArUHVibGljIExpY2Vu
c2UgaW5zdGVhZCBvZiB0aGlzIExpY2Vuc2UuICBCdXQgZmlyc3QsIHBsZWFzZSByZWFkCisjICs8
aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy93aHktbm90LWxncGwuaHRtbD4uCisjIC0tLSBD
T1BZSU5HLkxFU1NFUnYzCisjICsrKyBDT1BZSU5HLkxFU1NFUnYzCisjIEBAIC0xLDcgKzEsNyBA
QAorIyAgICAgICAgICAgICAgICAgICAgIEdOVSBMRVNTRVIgR0VORVJBTCBQVUJMSUMgTElDRU5T
RQorIyAgICAgICAgICAgICAgICAgICAgICAgICBWZXJzaW9uIDMsIDI5IEp1bmUgMjAwNworIyAg
CisjIC0gQ29weXJpZ2h0IChDKSAyMDA3IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiA8
aHR0cDovL2ZzZi5vcmcvPgorIyArIENvcHlyaWdodCAoQykgMjAwNyBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb24sIEluYy4gPGh0dHBzOi8vZnNmLm9yZy8+CisjICAgRXZlcnlvbmUgaXMgcGVybWl0
dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzCisjICAgb2YgdGhpcyBs
aWNlbnNlIGRvY3VtZW50LCBidXQgY2hhbmdpbmcgaXQgaXMgbm90IGFsbG93ZWQuCisjICAKKyMg
LS0tIENPUFlJTkd2MgorIyArKysgQ09QWUlOR3YyCisjIEBAIC0yLDcgKzIsNyBAQAorIyAgICAg
ICAgICAgICAgICAgICAgICAgICBWZXJzaW9uIDIsIEp1bmUgMTk5MQorIyAgCisjICAgQ29weXJp
Z2h0IChDKSAxOTg5LCAxOTkxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgLSA1
MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNB
CisjICsgPGh0dHBzOi8vZnNmLm9yZy8+CisjICAgRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNv
cHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzCisjICAgb2YgdGhpcyBsaWNlbnNlIGRv
Y3VtZW50LCBidXQgY2hhbmdpbmcgaXQgaXMgbm90IGFsbG93ZWQuCisjICAKKyMgQEAgLTMwNCw4
ICszMDQsNyBAQAorIyAgICAgIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRl
dGFpbHMuCisjICAKKyMgICAgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhbG9uZworIyAtICAgIHdpdGggdGhpcyBwcm9n
cmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4s
CisjIC0gICAgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjEx
MC0xMzAxIFVTQS4KKyMgKyAgICB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCBzZWUgPGh0dHBz
Oi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyMgIAorIyAgQWxzbyBhZGQgaW5mb3JtYXRpb24g
b24gaG93IHRvIGNvbnRhY3QgeW91IGJ5IGVsZWN0cm9uaWMgYW5kIHBhcGVyIG1haWwuCisjICAK
KyMgQEAgLTMyOSw4ICszMjgsOCBAQAorIyAgICBZb3lvZHluZSwgSW5jLiwgaGVyZWJ5IGRpc2Ns
YWltcyBhbGwgY29weXJpZ2h0IGludGVyZXN0IGluIHRoZSBwcm9ncmFtCisjICAgIGBHbm9tb3Zp
c2lvbicgKHdoaWNoIG1ha2VzIHBhc3NlcyBhdCBjb21waWxlcnMpIHdyaXR0ZW4gYnkgSmFtZXMg
SGFja2VyLgorIyAgCisjIC0gIDxzaWduYXR1cmUgb2YgVHkgQ29vbj4sIDEgQXByaWwgMTk4OQor
IyAtICBUeSBDb29uLCBQcmVzaWRlbnQgb2YgVmljZQorIyArICA8c2lnbmF0dXJlIG9mIE1vZSBH
aG91bD4sIDEgQXByaWwgMTk4OQorIyArICBNb2UgR2hvdWwsIFByZXNpZGVudCBvZiBWaWNlCisj
ICAKKyMgIFRoaXMgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBkb2VzIG5vdCBwZXJtaXQgaW5jb3Jw
b3JhdGluZyB5b3VyIHByb2dyYW0gaW50bworIyAgcHJvcHJpZXRhcnkgcHJvZ3JhbXMuICBJZiB5
b3VyIHByb2dyYW0gaXMgYSBzdWJyb3V0aW5lIGxpYnJhcnksIHlvdSBtYXkKKyMgLS0tIHNyYy9p
ZG4yLmMKKyMgKysrIHNyYy9pZG4yLmMKKyMgQEAgLTEsNSArMSw1IEBACisjICAvKiBpZG4yLmMg
LSBjb21tYW5kIGxpbmUgaW50ZXJmYWNlIHRvIGxpYmlkbjIKKyMgLSAgIENvcHlyaWdodCAoQykg
MjAxMS0yMDI0IFNpbW9uIEpvc2Vmc3NvbiwgVGltIFJ1ZWhzZW4KKyMgKyAgIENvcHlyaWdodCAo
QykgMjAxMS0yMDI1IFNpbW9uIEpvc2Vmc3NvbiwgVGltIFJ1ZWhzZW4KKyMgIAorIyAgICAgVGhp
cyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU6IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9v
ciBtb2RpZnkKKyMgICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisjIC0tLSBsaWIvaWRuMi5oLmluCisjICsrKyBs
aWIvaWRuMi5oLmluCisjIEBAIC0xLDUgKzEsNSBAQAorIyAgLyogaWRuMi5oIC0gaGVhZGVyIGZp
bGUgZm9yIGlkbjIKKyMgLSAgIENvcHlyaWdodCAoQykgMjAxMS0yMDI0IFNpbW9uIEpvc2Vmc3Nv
bgorIyArICAgQ29weXJpZ2h0IChDKSAyMDExLTIwMjUgU2ltb24gSm9zZWZzc29uCisjICAKKyMg
ICAgIExpYmlkbjIgaXMgZnJlZSBzb2Z0d2FyZTogeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5k
L29yIG1vZGlmeSBpdAorIyAgICAgdW5kZXIgdGhlIHRlcm1zIG9mIGVpdGhlcjoKKyMgCisjCisK
K1NVTU1BUlkgPSAiSW50ZXJuYXRpb25hbGl6ZWQgRG9tYWluIE5hbWUgc3VwcG9ydCBsaWJyYXJ5
IgorREVTQ1JJUFRJT04gPSAiSW1wbGVtZW50YXRpb24gb2YgdGhlIFN0cmluZ3ByZXAsIFB1bnlj
b2RlIGFuZCBJRE5BIHNwZWNpZmljYXRpb25zIGRlZmluZWQgYnkgdGhlIElFVEYgSW50ZXJuYXRp
b25hbGl6ZWQgRG9tYWluIE5hbWVzIChJRE4pIHdvcmtpbmcgZ3JvdXAuIgorSE9NRVBBR0UgPSAi
aHR0cDovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2xpYmlkbi8iCitTRUNUSU9OID0gImxpYnMiCitM
SUNFTlNFID0gIihHUEwtMi4wLW9yLWxhdGVyIHwgTEdQTC0zLjAtb25seSkgJiBHUEwtMy4wLW9y
LWxhdGVyICYgVW5pY29kZS1ERlMtMjAxNiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTFlYmJkM2UzNDIzN2FmMjZkYTVkYzA4YTRlNDQwNDY0IFwKKyAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL0NPUFlJTkcuTEVTU0VSdjM7bWQ1PTMwMDAyMDhkNTM5ZWMwNjFiODk5
YmNlMWQ5Y2U5NDA0IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkd2MjttZDU9
NTcwYTliMzc0OWRkMDQ2M2ExNzc4ODAzYjEyYTZkY2UgXAorICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vQ09QWUlORy51bmljb2RlO21kNT02ODRjZjVmN2UzZmRlZDM1NDY2Nzk0MjQ1MjgyNjFh
OSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvaWRuMi5jO2VuZGxpbmU9MTY7bWQ1
PWM0NGZiNmYyMDFmMjJkYTNhMTk4NTc0OTliNDliMTVkIFwKKyAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL2xpYi9pZG4yLmguaW47ZW5kbGluZT0yNzttZDU9ZjI3YWVlMWI0NDMyNmJlM2EyODk2
MWM1NTMxOTA5OWYgXAorICAgICAgICAgICAgICAgICAgICAiCisKK1NSQ19VUkkgPSAiJHtHTlVf
TUlSUk9SfS9saWJpZG4vJHtCUE59LSR7UFZ9LnRhci5neiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJmNTU3OTExYmY2MTcxNjIxZTFmNzJmZjM1ZjViMTgyNWJiMzViNTJlZDQ1MzI1ZGNkZWU5MzFl
NWQzYzA3ODdhIgorCitERVBFTkRTID0gInZpcnR1YWwvbGliaWNvbnYgbGlidW5pc3RyaW5nIgor
Citpbmhlcml0IHBrZ2NvbmZpZyBhdXRvdG9vbHMgZ2V0dGV4dCB0ZXhpbmZvIGd0ay1kb2MgbGli
X3BhY2thZ2UKKworRVhUUkFfT0VDT05GICs9ICItLWRpc2FibGUtcnBhdGggXAorICAgICAgICAg
ICAgICAgICAtLXdpdGgtbGlidW5pc3RyaW5nLXByZWZpeD0ke1NUQUdJTkdfRVhFQ1BSRUZJWERJ
Un0gXAorICAgICAgICAgICAgICAgICAiCisKK2RvX2luc3RhbGw6YXBwZW5kKCkgeworCSMgTmVl
ZCB0byByZW1vdmUgYW55IGR1cGxpY2F0ZSB3aGl0ZXNwYWNlIHRvbyBmb3IgcmVwcm9kdWNpYmls
aXR5CisJc2VkIC1pIC1lICdzfC1MJHtTVEFHSU5HX0xJQkRJUn18fCcgLWUgJ3MvICAqLyAvZycg
JHtEfSR7bGliZGlyfS9wa2djb25maWcvbGliaWRuMi5wYworfQorCitMSUNFTlNFOiR7UE59ID0g
IihHUEwtMi4wLW9yLWxhdGVyIHwgTEdQTC0zLjAtb25seSkgJiBVbmljb2RlLURGUy0yMDE2Igor
TElDRU5TRToke1BOfS1iaW4gPSAiR1BMLTMuMC1vci1sYXRlciIKKworQkJDTEFTU0VYVEVORCA9
ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40NC4xCgo=

--===============6160936738979202296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libidn2: SRC_URI changed from "https://ftp.gnu.org/gnu/libidn/libidn2-2.3.7.tar.gz" to "https://ftp.gnu.org/gnu/libidn/libidn2-2.3.8.tar.gz"
packages/core2-64-poky-linux/libidn2: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2: PACKAGES: added "libidn2-locale-lv"
packages/core2-64-poky-linux/libidn2/libidn2-bin: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-bin: PKGSIZE changed from 31336 to 35432 (+13%)
packages/core2-64-poky-linux/libidn2/libidn2-bin: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-dbg: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-dbg: PKGSIZE changed from 276592 to 277576 (+0%)
packages/core2-64-poky-linux/libidn2/libidn2-dbg: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-dev: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-dev: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-doc: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-doc: PKGSIZE changed from 80407 to 80373 (-0%)
packages/core2-64-poky-linux/libidn2/libidn2-doc: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-cs: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-cs: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-da: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-da: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-de: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-de: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-eo: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-eo: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-es: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-es: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-fi: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-fi: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-fr: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-fr: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-fur: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-fur: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-hr: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-hr: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-hu: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-hu: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-id: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-id: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-it: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-it: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-ja: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-ja: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-ka: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-ka: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-ko: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-ko: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-nl: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-nl: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-pl: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-pl: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-pt-br: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-pt-br: PKGSIZE changed from 6579 to 6728 (+2%)
packages/core2-64-poky-linux/libidn2/libidn2-locale-pt-br: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-ro: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-ro: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-ru: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-ru: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-sr: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-sr: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-sv: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-sv: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-uk: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-uk: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-vi: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-vi: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-zh-cn: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-locale-zh-cn: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-src: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-src: PKGSIZE changed from 1393051 to 1417695 (+2%)
packages/core2-64-poky-linux/libidn2/libidn2-src: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2-staticdev: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2-staticdev: PKGV changed from 2.3.7 [default] to 2.3.8 [default]
packages/core2-64-poky-linux/libidn2/libidn2: PV changed from "2.3.7" to "2.3.8"
packages/core2-64-poky-linux/libidn2/libidn2: PKGSIZE changed from 207056 to 211152 (+2%)
packages/core2-64-poky-linux/libidn2/libidn2: PKGV changed from 2.3.7 [default] to 2.3.8 [default]

--===============6160936738979202296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libidn2: PACKAGES: added "libidn2-locale-lv"
packages/core2-64-poky-linux/libidn2/libidn2-bin: PKGSIZE changed from 31336 to 35432 (+13%)

--===============6160936738979202296==--

