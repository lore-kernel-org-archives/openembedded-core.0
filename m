Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A90CD5BA0
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:35 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34826.1778851230212323486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fvaLKUqL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mOGnvNs1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e2bcbaf56-9b482909-cb1b-4059-88da-40e92a674099-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c69F10GR28MbMR1tFL4NtlQqOcce1NHff25whcGuTXc=;
	b=fvaLKUqLQ9KbgSOdBZavaRsi6rJwVMbteyZg1zgklxM138FQRH9LaEB+fMtHmArU
	u866S8Ivu32Ue+UYJZjwaaSKtvCU0dhaPEOywva6BAR2sqf+1tPvGP9aZQdxdHFGmZt
	4uT74oppK+PHcoBtRLArSNNMiywrzqZ/n0g3ba6w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c69F10GR28MbMR1tFL4NtlQqOcce1NHff25whcGuTXc=;
	b=mOGnvNs1PNjtf/QWDSzfqcvAh2dzOnHVgxnYTnEWjh3+1QnB6Lj4k4f6h3u586vy
	Mn+tvCJjvhsDyUUNDxilwgKFLNDHt6dDgJYXzPGyhv1HYsU8vQBX3N4q5WEioblXP/W
	r/NxusOHNjnL5onLVmlTYavpk7wM1JqkcBb5sCg8=
Content-Type: multipart/mixed; boundary="===============0857580397660430874=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-chardet: upgrading to 7.4.3 SUCCEEDED
Message-ID: <0101019e2bcbaf56-9b482909-cb1b-4059-88da-40e92a674099-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237111

--===============0857580397660430874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-chardet* to *7.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-chardet-upgrade-6.0.0.post1-7.4.3.patch
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
From 4b54a0efe704941b8140ed38a0280c8d7d5a2028 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 07:36:42 +0000
Subject: [PATCH] python3-chardet: upgrade 6.0.0.post1 -> 7.4.3

---
 .../python/python3-chardet_6.0.0.post1.bb     |  23 -
 .../python/python3-chardet_7.4.3.bb           | 548 ++++++++++++++++++
 2 files changed, 548 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
 create mode 100644 meta/recipes-devtools/python/python3-chardet_7.4.3.bb

diff --git a/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb b/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
deleted file mode 100644
index 14c3247b35..0000000000
--- a/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Universal encoding detector for Python 2 and 3"
-HOMEPAGE = "https://pypi.org/project/chardet/"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
-
-SRC_URI[sha256sum] = "6b78048c3c97c7b2ed1fbad7a18f76f5a6547f7d34dbab536cc13887c9a92fa4"
-
-inherit pypi python_hatchling
-
-DEPENDS += "python3-hatch-vcs-native"
-
-PACKAGES =+ "${PN}-cli"
-FILES:${PN}-cli += " \
-    ${PYTHON_SITEPACKAGES_DIR}/chardet/cli \
-"
-
-RDEPENDS:${PN}-cli = "${PN} "
-
-RDEPENDS:${PN}:class-target += " \
-    python3-logging \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-chardet_7.4.3.bb b/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
new file mode 100644
index 0000000000..0956c10f99
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
@@ -0,0 +1,548 @@
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
+# @@ -1,501 +1,12 @@
+# -                  GNU LESSER GENERAL PUBLIC LICENSE
+# -                       Version 2.1, February 1999
+# +Copyright (c) 2026 Dan Blanchard
+#  
+# - Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+# - <https://fsf.org/>
+# - Everyone is permitted to copy and distribute verbatim copies
+# - of this license document, but changing it is not allowed.
+# +Permission to use, copy, modify, and/or distribute this software for any
+# +purpose with or without fee is hereby granted.
+#  
+# -[This is the first released version of the Lesser GPL.  It also counts
+# - as the successor of the GNU Library Public License, version 2, hence
+# - the version number 2.1.]
+# -
+# -                            Preamble
+# -
+# -  The licenses for most software are designed to take away your
+# -freedom to share and change it.  By contrast, the GNU General Public
+# -Licenses are intended to guarantee your freedom to share and change
+# -free software--to make sure the software is free for all its users.
+# -
+# -  This license, the Lesser General Public License, applies to some
+# -specially designated software packages--typically libraries--of the
+# -Free Software Foundation and other authors who decide to use it.  You
+# -can use it too, but we suggest you first think carefully about whether
+# -this license or the ordinary General Public License is the better
+# -strategy to use in any particular case, based on the explanations below.
+# -
+# -  When we speak of free software, we are referring to freedom of use,
+# -not price.  Our General Public Licenses are designed to make sure that
+# -you have the freedom to distribute copies of free software (and charge
+# -for this service if you wish); that you receive source code or can get
+# -it if you want it; that you can change the software and use pieces of
+# -it in new free programs; and that you are informed that you can do
+# -these things.
+# -
+# -  To protect your rights, we need to make restrictions that forbid
+# -distributors to deny you these rights or to ask you to surrender these
+# -rights.  These restrictions translate to certain responsibilities for
+# -you if you distribute copies of the library or if you modify it.
+# -
+# -  For example, if you distribute copies of the library, whether gratis
+# -or for a fee, you must give the recipients all the rights that we gave
+# -you.  You must make sure that they, too, receive or can get the source
+# -code.  If you link other code with the library, you must provide
+# -complete object files to the recipients, so that they can relink them
+# -with the library after making changes to the library and recompiling
+# -it.  And you must show them these terms so they know their rights.
+# -
+# -  We protect your rights with a two-step method: (1) we copyright the
+# -library, and (2) we offer you this license, which gives you legal
+# -permission to copy, distribute and/or modify the library.
+# -
+# -  To protect each distributor, we want to make it very clear that
+# -there is no warranty for the free library.  Also, if the library is
+# -modified by someone else and passed on, the recipients should know
+# -that what they have is not the original version, so that the original
+# -author's reputation will not be affected by problems that might be
+# -introduced by others.
+# -
+# -  Finally, software patents pose a constant threat to the existence of
+# -any free program.  We wish to make sure that a company cannot
+# -effectively restrict the users of a free program by obtaining a
+# -restrictive license from a patent holder.  Therefore, we insist that
+# -any patent license obtained for a version of the library must be
+# -consistent with the full freedom of use specified in this license.
+# -
+# -  Most GNU software, including some libraries, is covered by the
+# -ordinary GNU General Public License.  This license, the GNU Lesser
+# -General Public License, applies to certain designated libraries, and
+# -is quite different from the ordinary General Public License.  We use
+# -this license for certain libraries in order to permit linking those
+# -libraries into non-free programs.
+# -
+# -  When a program is linked with a library, whether statically or using
+# -a shared library, the combination of the two is legally speaking a
+# -combined work, a derivative of the original library.  The ordinary
+# -General Public License therefore permits such linking only if the
+# -entire combination fits its criteria of freedom.  The Lesser General
+# -Public License permits more lax criteria for linking other code with
+# -the library.
+# -
+# -  We call this license the "Lesser" General Public License because it
+# -does Less to protect the user's freedom than the ordinary General
+# -Public License.  It also provides other free software developers Less
+# -of an advantage over competing non-free programs.  These disadvantages
+# -are the reason we use the ordinary General Public License for many
+# -libraries.  However, the Lesser license provides advantages in certain
+# -special circumstances.
+# -
+# -  For example, on rare occasions, there may be a special need to
+# -encourage the widest possible use of a certain library, so that it becomes
+# -a de-facto standard.  To achieve this, non-free programs must be
+# -allowed to use the library.  A more frequent case is that a free
+# -library does the same job as widely used non-free libraries.  In this
+# -case, there is little to gain by limiting the free library to free
+# -software only, so we use the Lesser General Public License.
+# -
+# -  In other cases, permission to use a particular library in non-free
+# -programs enables a greater number of people to use a large body of
+# -free software.  For example, permission to use the GNU C Library in
+# -non-free programs enables many more people to use the whole GNU
+# -operating system, as well as its variant, the GNU/Linux operating
+# -system.
+# -
+# -  Although the Lesser General Public License is Less protective of the
+# -users' freedom, it does ensure that the user of a program that is
+# -linked with the Library has the freedom and the wherewithal to run
+# -that program using a modified version of the Library.
+# -
+# -  The precise terms and conditions for copying, distribution and
+# -modification follow.  Pay close attention to the difference between a
+# -"work based on the library" and a "work that uses the library".  The
+# -former contains code derived from the library, whereas the latter must
+# -be combined with the library in order to run.
+# -
+# -                  GNU LESSER GENERAL PUBLIC LICENSE
+# -   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+# -
+# -  0. This License Agreement applies to any software library or other
+# -program which contains a notice placed by the copyright holder or
+# -other authorized party saying it may be distributed under the terms of
+# -this Lesser General Public License (also called "this License").
+# -Each licensee is addressed as "you".
+# -
+# -  A "library" means a collection of software functions and/or data
+# -prepared so as to be conveniently linked with application programs
+# -(which use some of those functions and data) to form executables.
+# -
+# -  The "Library", below, refers to any such software library or work
+# -which has been distributed under these terms.  A "work based on the
+# -Library" means either the Library or any derivative work under
+# -copyright law: that is to say, a work containing the Library or a
+# -portion of it, either verbatim or with modifications and/or translated
+# -straightforwardly into another language.  (Hereinafter, translation is
+# -included without limitation in the term "modification".)
+# -
+# -  "Source code" for a work means the preferred form of the work for
+# -making modifications to it.  For a library, complete source code means
+# -all the source code for all modules it contains, plus any associated
+# -interface definition files, plus the scripts used to control compilation
+# -and installation of the library.
+# -
+# -  Activities other than copying, distribution and modification are not
+# -covered by this License; they are outside its scope.  The act of
+# -running a program using the Library is not restricted, and output from
+# -such a program is covered only if its contents constitute a work based
+# -on the Library (independent of the use of the Library in a tool for
+# -writing it).  Whether that is true depends on what the Library does
+# -and what the program that uses the Library does.
+# -
+# -  1. You may copy and distribute verbatim copies of the Library's
+# -complete source code as you receive it, in any medium, provided that
+# -you conspicuously and appropriately publish on each copy an
+# -appropriate copyright notice and disclaimer of warranty; keep intact
+# -all the notices that refer to this License and to the absence of any
+# -warranty; and distribute a copy of this License along with the
+# -Library.
+# -
+# -  You may charge a fee for the physical act of transferring a copy,
+# -and you may at your option offer warranty protection in exchange for a
+# -fee.
+# -
+# -  2. You may modify your copy or copies of the Library or any portion
+# -of it, thus forming a work based on the Library, and copy and
+# -distribute such modifications or work under the terms of Section 1
+# -above, provided that you also meet all of these conditions:
+# -
+# -    a) The modified work must itself be a software library.
+# -
+# -    b) You must cause the files modified to carry prominent notices
+# -    stating that you changed the files and the date of any change.
+# -
+# -    c) You must cause the whole of the work to be licensed at no
+# -    charge to all third parties under the terms of this License.
+# -
+# -    d) If a facility in the modified Library refers to a function or a
+# -    table of data to be supplied by an application program that uses
+# -    the facility, other than as an argument passed when the facility
+# -    is invoked, then you must make a good faith effort to ensure that,
+# -    in the event an application does not supply such function or
+# -    table, the facility still operates, and performs whatever part of
+# -    its purpose remains meaningful.
+# -
+# -    (For example, a function in a library to compute square roots has
+# -    a purpose that is entirely well-defined independent of the
+# -    application.  Therefore, Subsection 2d requires that any
+# -    application-supplied function or table used by this function must
+# -    be optional: if the application does not supply it, the square
+# -    root function must still compute square roots.)
+# -
+# -These requirements apply to the modified work as a whole.  If
+# -identifiable sections of that work are not derived from the Library,
+# -and can be reasonably considered independent and separate works in
+# -themselves, then this License, and its terms, do not apply to those
+# -sections when you distribute them as separate works.  But when you
+# -distribute the same sections as part of a whole which is a work based
+# -on the Library, the distribution of the whole must be on the terms of
+# -this License, whose permissions for other licensees extend to the
+# -entire whole, and thus to each and every part regardless of who wrote
+# -it.
+# -
+# -Thus, it is not the intent of this section to claim rights or contest
+# -your rights to work written entirely by you; rather, the intent is to
+# -exercise the right to control the distribution of derivative or
+# -collective works based on the Library.
+# -
+# -In addition, mere aggregation of another work not based on the Library
+# -with the Library (or with a work based on the Library) on a volume of
+# -a storage or distribution medium does not bring the other work under
+# -the scope of this License.
+# -
+# -  3. You may opt to apply the terms of the ordinary GNU General Public
+# -License instead of this License to a given copy of the Library.  To do
+# -this, you must alter all the notices that refer to this License, so
+# -that they refer to the ordinary GNU General Public License, version 2,
+# -instead of to this License.  (If a newer version than version 2 of the
+# -ordinary GNU General Public License has appeared, then you can specify
+# -that version instead if you wish.)  Do not make any other change in
+# -these notices.
+# -
+# -  Once this change is made in a given copy, it is irreversible for
+# -that copy, so the ordinary GNU General Public License applies to all
+# -subsequent copies and derivative works made from that copy.
+# -
+# -  This option is useful when you wish to copy part of the code of
+# -the Library into a program that is not a library.
+# -
+# -  4. You may copy and distribute the Library (or a portion or
+# -derivative of it, under Section 2) in object code or executable form
+# -under the terms of Sections 1 and 2 above provided that you accompany
+# -it with the complete corresponding machine-readable source code, which
+# -must be distributed under the terms of Sections 1 and 2 above on a
+# -medium customarily used for software interchange.
+# -
+# -  If distribution of object code is made by offering access to copy
+# -from a designated place, then offering equivalent access to copy the
+# -source code from the same place satisfies the requirement to
+# -distribute the source code, even though third parties are not
+# -compelled to copy the source along with the object code.
+# -
+# -  5. A program that contains no derivative of any portion of the
+# -Library, but is designed to work with the Library by being compiled or
+# -linked with it, is called a "work that uses the Library".  Such a
+# -work, in isolation, is not a derivative work of the Library, and
+# -therefore falls outside the scope of this License.
+# -
+# -  However, linking a "work that uses the Library" with the Library
+# -creates an executable that is a derivative of the Library (because it
+# -contains portions of the Library), rather than a "work that uses the
+# -library".  The executable is therefore covered by this License.
+# -Section 6 states terms for distribution of such executables.
+# -
+# -  When a "work that uses the Library" uses material from a header file
+# -that is part of the Library, the object code for the work may be a
+# -derivative work of the Library even though the source code is not.
+# -Whether this is true is especially significant if the work can be
+# -linked without the Library, or if the work is itself a library.  The
+# -threshold for this to be true is not precisely defined by law.
+# -
+# -  If such an object file uses only numerical parameters, data
+# -structure layouts and accessors, and small macros and small inline
+# -functions (ten lines or less in length), then the use of the object
+# -file is unrestricted, regardless of whether it is legally a derivative
+# -work.  (Executables containing this object code plus portions of the
+# -Library will still fall under Section 6.)
+# -
+# -  Otherwise, if the work is a derivative of the Library, you may
+# -distribute the object code for the work under the terms of Section 6.
+# -Any executables containing that work also fall under Section 6,
+# -whether or not they are linked directly with the Library itself.
+# -
+# -  6. As an exception to the Sections above, you may also combine or
+# -link a "work that uses the Library" with the Library to produce a
+# -work containing portions of the Library, and distribute that work
+# -under terms of your choice, provided that the terms permit
+# -modification of the work for the customer's own use and reverse
+# -engineering for debugging such modifications.
+# -
+# -  You must give prominent notice with each copy of the work that the
+# -Library is used in it and that the Library and its use are covered by
+# -this License.  You must supply a copy of this License.  If the work
+# -during execution displays copyright notices, you must include the
+# -copyright notice for the Library among them, as well as a reference
+# -directing the user to the copy of this License.  Also, you must do one
+# -of these things:
+# -
+# -    a) Accompany the work with the complete corresponding
+# -    machine-readable source code for the Library including whatever
+# -    changes were used in the work (which must be distributed under
+# -    Sections 1 and 2 above); and, if the work is an executable linked
+# -    with the Library, with the complete machine-readable "work that
+# -    uses the Library", as object code and/or source code, so that the
+# -    user can modify the Library and then relink to produce a modified
+# -    executable containing the modified Library.  (It is understood
+# -    that the user who changes the contents of definitions files in the
+# -    Library will not necessarily be able to recompile the application
+# -    to use the modified definitions.)
+# -
+# -    b) Use a suitable shared library mechanism for linking with the
+# -    Library.  A suitable mechanism is one that (1) uses at run time a
+# -    copy of the library already present on the user's computer system,
+# -    rather than copying library functions into the executable, and (2)
+# -    will operate properly with a modified version of the library, if
+# -    the user installs one, as long as the modified version is
+# -    interface-compatible with the version that the work was made with.
+# -
+# -    c) Accompany the work with a written offer, valid for at
+# -    least three years, to give the same user the materials
+# -    specified in Subsection 6a, above, for a charge no more
+# -    than the cost of performing this distribution.
+# -
+# -    d) If distribution of the work is made by offering access to copy
+# -    from a designated place, offer equivalent access to copy the above
+# -    specified materials from the same place.
+# -
+# -    e) Verify that the user has already received a copy of these
+# -    materials or that you have already sent this user a copy.
+# -
+# -  For an executable, the required form of the "work that uses the
+# -Library" must include any data and utility programs needed for
+# -reproducing the executable from it.  However, as a special exception,
+# -the materials to be distributed need not include anything that is
+# -normally distributed (in either source or binary form) with the major
+# -components (compiler, kernel, and so on) of the operating system on
+# -which the executable runs, unless that component itself accompanies
+# -the executable.
+# -
+# -  It may happen that this requirement contradicts the license
+# -restrictions of other proprietary libraries that do not normally
+# -accompany the operating system.  Such a contradiction means you cannot
+# -use both them and the Library together in an executable that you
+# -distribute.
+# -
+# -  7. You may place library facilities that are a work based on the
+# -Library side-by-side in a single library together with other library
+# -facilities not covered by this License, and distribute such a combined
+# -library, provided that the separate distribution of the work based on
+# -the Library and of the other library facilities is otherwise
+# -permitted, and provided that you do these two things:
+# -
+# -    a) Accompany the combined library with a copy of the same work
+# -    based on the Library, uncombined with any other library
+# -    facilities.  This must be distributed under the terms of the
+# -    Sections above.
+# -
+# -    b) Give prominent notice with the combined library of the fact
+# -    that part of it is a work based on the Library, and explaining
+# -    where to find the accompanying uncombined form of the same work.
+# -
+# -  8. You may not copy, modify, sublicense, link with, or distribute
+# -the Library except as expressly provided under this License.  Any
+# -attempt otherwise to copy, modify, sublicense, link with, or
+# -distribute the Library is void, and will automatically terminate your
+# -rights under this License.  However, parties who have received copies,
+# -or rights, from you under this License will not have their licenses
+# -terminated so long as such parties remain in full compliance.
+# -
+# -  9. You are not required to accept this License, since you have not
+# -signed it.  However, nothing else grants you permission to modify or
+# -distribute the Library or its derivative works.  These actions are
+# -prohibited by law if you do not accept this License.  Therefore, by
+# -modifying or distributing the Library (or any work based on the
+# -Library), you indicate your acceptance of this License to do so, and
+# -all its terms and conditions for copying, distributing or modifying
+# -the Library or works based on it.
+# -
+# -  10. Each time you redistribute the Library (or any work based on the
+# -Library), the recipient automatically receives a license from the
+# -original licensor to copy, distribute, link with or modify the Library
+# -subject to these terms and conditions.  You may not impose any further
+# -restrictions on the recipients' exercise of the rights granted herein.
+# -You are not responsible for enforcing compliance by third parties with
+# -this License.
+# -
+# -  11. If, as a consequence of a court judgment or allegation of patent
+# -infringement or for any other reason (not limited to patent issues),
+# -conditions are imposed on you (whether by court order, agreement or
+# -otherwise) that contradict the conditions of this License, they do not
+# -excuse you from the conditions of this License.  If you cannot
+# -distribute so as to satisfy simultaneously your obligations under this
+# -License and any other pertinent obligations, then as a consequence you
+# -may not distribute the Library at all.  For example, if a patent
+# -license would not permit royalty-free redistribution of the Library by
+# -all those who receive copies directly or indirectly through you, then
+# -the only way you could satisfy both it and this License would be to
+# -refrain entirely from distribution of the Library.
+# -
+# -If any portion of this section is held invalid or unenforceable under any
+# -particular circumstance, the balance of the section is intended to apply,
+# -and the section as a whole is intended to apply in other circumstances.
+# -
+# -It is not the purpose of this section to induce you to infringe any
+# -patents or other property right claims or to contest validity of any
+# -such claims; this section has the sole purpose of protecting the
+# -integrity of the free software distribution system which is
+# -implemented by public license practices.  Many people have made
+# -generous contributions to the wide range of software distributed
+# -through that system in reliance on consistent application of that
+# -system; it is up to the author/donor to decide if he or she is willing
+# -to distribute software through any other system and a licensee cannot
+# -impose that choice.
+# -
+# -This section is intended to make thoroughly clear what is believed to
+# -be a consequence of the rest of this License.
+# -
+# -  12. If the distribution and/or use of the Library is restricted in
+# -certain countries either by patents or by copyrighted interfaces, the
+# -original copyright holder who places the Library under this License may add
+# -an explicit geographical distribution limitation excluding those countries,
+# -so that distribution is permitted only in or among countries not thus
+# -excluded.  In such case, this License incorporates the limitation as if
+# -written in the body of this License.
+# -
+# -  13. The Free Software Foundation may publish revised and/or new
+# -versions of the Lesser General Public License from time to time.
+# -Such new versions will be similar in spirit to the present version,
+# -but may differ in detail to address new problems or concerns.
+# -
+# -Each version is given a distinguishing version number.  If the Library
+# -specifies a version number of this License which applies to it and
+# -"any later version", you have the option of following the terms and
+# -conditions either of that version or of any later version published by
+# -the Free Software Foundation.  If the Library does not specify a
+# -license version number, you may choose any version ever published by
+# -the Free Software Foundation.
+# -
+# -  14. If you wish to incorporate parts of the Library into other free
+# -programs whose distribution conditions are incompatible with these,
+# -write to the author to ask for permission.  For software which is
+# -copyrighted by the Free Software Foundation, write to the Free
+# -Software Foundation; we sometimes make exceptions for this.  Our
+# -decision will be guided by the two goals of preserving the free status
+# -of all derivatives of our free software and of promoting the sharing
+# -and reuse of software generally.
+# -
+# -                            NO WARRANTY
+# -
+# -  15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
+# -WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
+# -EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
+# -OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY
+# -KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
+# -IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+# -PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
+# -LIBRARY IS WITH YOU.  SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
+# -THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+# -
+# -  16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
+# -WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY
+# -AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU
+# -FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR
+# -CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
+# -LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
+# -RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
+# -FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
+# -SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
+# -DAMAGES.
+# -
+# -                     END OF TERMS AND CONDITIONS
+# -
+# -           How to Apply These Terms to Your New Libraries
+# -
+# -  If you develop a new library, and you want it to be of the greatest
+# -possible use to the public, we recommend making it free software that
+# -everyone can redistribute and change.  You can do so by permitting
+# -redistribution under these terms (or, alternatively, under the terms of the
+# -ordinary General Public License).
+# -
+# -  To apply these terms, attach the following notices to the library.  It is
+# -safest to attach them to the start of each source file to most effectively
+# -convey the exclusion of warranty; and each file should have at least the
+# -"copyright" line and a pointer to where the full notice is found.
+# -
+# -    <one line to give the library's name and a brief idea of what it does.>
+# -    Copyright (C) <year>  <name of author>
+# -
+# -    This library is free software; you can redistribute it and/or
+# -    modify it under the terms of the GNU Lesser General Public
+# -    License as published by the Free Software Foundation; either
+# -    version 2.1 of the License, or (at your option) any later version.
+# -
+# -    This library is distributed in the hope that it will be useful,
+# -    but WITHOUT ANY WARRANTY; without even the implied warranty of
+# -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# -    Lesser General Public License for more details.
+# -
+# -    You should have received a copy of the GNU Lesser General Public
+# -    License along with this library; if not, see <https://www.gnu.org/licenses/>.
+# -
+# -Also add information on how to contact you by electronic and paper mail.
+# -
+# -You should also get your employer (if you work as a programmer) or your
+# -school, if any, to sign a "copyright disclaimer" for the library, if
+# -necessary.  Here is a sample; alter the names:
+# -
+# -  Yoyodyne, Inc., hereby disclaims all copyright interest in the
+# -  library `Frob' (a library for tweaking knobs) written by James Random Hacker.
+# -
+# -  <signature of Moe Ghoul>, 1 April 1990
+# -  Moe Ghoul, President of Vice
+# -
+# -That's all there is to it!
+# +THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
+# +REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
+# +FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
+# +INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
+# +OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+# +TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
+# +THIS SOFTWARE.
+# 
+#
+
+SUMMARY = "Universal encoding detector for Python 2 and 3"
+HOMEPAGE = "https://pypi.org/project/chardet/"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bd0753b9dc12e5e3da3047778fcf1dca"
+
+SRC_URI[sha256sum] = "cc1d4eb92a4ec1c2df3b490836ffa46922e599d34ce0bb75cf41fd2bf6303d56"
+
+inherit pypi python_hatchling
+
+DEPENDS += "python3-hatch-vcs-native"
+
+PACKAGES =+ "${PN}-cli"
+FILES:${PN}-cli += " \
+    ${PYTHON_SITEPACKAGES_DIR}/chardet/cli \
+"
+
+RDEPENDS:${PN}-cli = "${PN} "
+
+RDEPENDS:${PN}:class-target += " \
+    python3-logging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============0857580397660430874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-6f47fedb0477de54082f69069513e600e1b48ef2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:6f47fedb0477de54082f69069513e600e1b48ef2"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 480 Local 466 Mirrors 0 Missed 14 Current 290 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 314 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 315 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 349 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 365 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 401 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-chardet-7.4.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 422 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 433 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 442 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-chardet-7.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 929 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_fetch)
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 445 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 446 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-chardet-7.4.3-r0: task do_fetch: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 471 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-chardet-7.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 930 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_unpack: Started
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 931 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 494 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-chardet-7.4.3-r0: task do_patch: Started
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe python3-chardet-7.4.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 960 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1109 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-chardet-7.4.3-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 545 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1114 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-7.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 556 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libedit/20251016-3.1/temp/log.do_packagedata_setscene.596541
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_deploy_source_date_epoch unihash changed to 899f7b109f0bd3616b316adec12b2ba96971632fe6e93f743eaca9b44beb52f7
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 555 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_package_setscene)
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-7.4.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 573 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 612 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1186 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1191 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata_setscene)
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 654 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 656 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 678 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running task 1264 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 686 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 696 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1276 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1327 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libedit-20251016-3.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 715 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1333 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1420 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running setscene task 741 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 744 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 768 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1792 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata)
NOTE: Running task 1826 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-chardet-7.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1952 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_configure)
NOTE: recipe python3-chardet-7.4.3-r0: task do_configure: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1953 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_compile)
NOTE: Running task 1954 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-chardet-7.4.3-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-chardet-7.4.3-r0: task do_compile: Succeeded
NOTE: Running task 1961 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_install)
NOTE: recipe python3-chardet-7.4.3-r0: task do_install: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_install: Succeeded
NOTE: Running task 1962 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_package)
NOTE: Running task 1963 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_populate_sysroot)
NOTE: recipe python3-chardet-7.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_package: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-chardet-7.4.3-r0: task do_package: Succeeded
NOTE: Running task 1964 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_packagedata)
NOTE: recipe python3-chardet-7.4.3-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_packagedata unihash changed to 7c8668b207861bcdc20d6332cd035e59a838199eb4532516b80873c4c85b536f
NOTE: Setscene tasks completed
NOTE: Running task 1965 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_create_spdx)
NOTE: Running task 1966 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_package_write_ipk)
NOTE: Running task 1967 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_package_write_deb)
NOTE: Running task 1968 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_package_write_rpm)
NOTE: Running task 1969 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_package_qa)
NOTE: recipe python3-chardet-7.4.3-r0: task do_create_spdx: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_package_qa: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1970 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_create_package_spdx)
NOTE: recipe python3-chardet-7.4.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-chardet-7.4.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_package_qa unihash changed to 2e2404f6d825e22a5dc305a01b5fed353f3dce3dcf02ce8157120fb7da86964f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_package_write_ipk unihash changed to 9bab53aa501252cdc3f1f94c2dd19ea251693abc99ec0ea8375f3407a0cb79e7
NOTE: recipe python3-chardet-7.4.3-r0: task do_create_package_spdx: Started
NOTE: recipe python3-chardet-7.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_package_write_rpm unihash changed to d72b33cf5407968112be9a532906272fd19ee9364b6fdea77df52bd357498b4a
NOTE: recipe python3-chardet-7.4.3-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_package_write_deb unihash changed to 5c4d18486dc4146dd2beeaad871699880e66565d63a001692511d684146ac5bf
NOTE: recipe python3-chardet-7.4.3-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 1971 of 1971 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.4.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1971 tasks of which 1942 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libedit-20251016-3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libedit-src went backwards which would break package feeds (from 0:20260512-3.1-r0 to 0:20251016-3.1-r0) [version-going-backwards]
ERROR: libedit-20251016-3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libedit-dbg went backwards which would break package feeds (from 0:20260512-3.1-r0 to 0:20251016-3.1-r0) [version-going-backwards]
ERROR: libedit-20251016-3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libedit-staticdev went backwards which would break package feeds (from 0:20260512-3.1-r0 to 0:20251016-3.1-r0) [version-going-backwards]
ERROR: libedit-20251016-3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libedit-dev went backwards which would break package feeds (from 0:20260512-3.1-r0 to 0:20251016-3.1-r0) [version-going-backwards]
ERROR: libedit-20251016-3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libedit-doc went backwards which would break package feeds (from 0:20260512-3.1-r0 to 0:20251016-3.1-r0) [version-going-backwards]
ERROR: libedit-20251016-3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libedit-locale went backwards which would break package feeds (from 0:20260512-3.1-r0 to 0:20251016-3.1-r0) [version-going-backwards]
ERROR: libedit-20251016-3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libedit went backwards which would break package feeds (from 0:20260512-3.1-r0 to 0:20251016-3.1-r0) [version-going-backwards]
ERROR: libedit-20251016-3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0857580397660430874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-chardet: PV changed from "6.0.0.post1" to "7.4.3"
packages/x86-64-v3-poky-linux/python3-chardet: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/chardet/chardet-6.0.0.post1.tar.gz;downloadfilename=chardet-6.0.0.post1.tar.gz" to "https://files.pythonhosted.org/packages/source/c/chardet/chardet-7.4.3.tar.gz;downloadfilename=chardet-7.4.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-chardet: PKGV changed from 6.0.0.post1 [default] to 7.4.3 [default]
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-cli: PKGSIZE changed from 9914 to 0 (-100%)
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-cli: PV changed from "6.0.0.post1" to "7.4.3"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-cli: FILELIST: removed all items "/usr/lib/python3.14/site-packages/chardet/cli/__init__.py /usr/lib/python3.14/site-packages/chardet/cli/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/cli/chardetect.py /usr/lib/python3.14/site-packages/chardet/cli/__pycache__/chardetect.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-cli: PKGV changed from 6.0.0.post1 [default] to 7.4.3 [default]
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-dbg: PV changed from "6.0.0.post1" to "7.4.3"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-dbg: PKGV changed from 6.0.0.post1 [default] to 7.4.3 [default]
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-dev: PV changed from "6.0.0.post1" to "7.4.3"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-dev: PKGV changed from 6.0.0.post1 [default] to 7.4.3 [default]
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-doc: PV changed from "6.0.0.post1" to "7.4.3"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-doc: PKGV changed from 6.0.0.post1 [default] to 7.4.3 [default]
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-locale: PV changed from "6.0.0.post1" to "7.4.3"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-locale: PKGV changed from 6.0.0.post1 [default] to 7.4.3 [default]
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-src: PV changed from "6.0.0.post1" to "7.4.3"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-src: PKGV changed from 6.0.0.post1 [default] to 7.4.3 [default]
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-staticdev: PV changed from "6.0.0.post1" to "7.4.3"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-staticdev: PKGV changed from 6.0.0.post1 [default] to 7.4.3 [default]
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet: PKGSIZE changed from 24721887 to 1120674 (-95%)
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet: PV changed from "6.0.0.post1" to "7.4.3"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet: FILELIST: directory renamed /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/licenses -> /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info -> /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info, removed "/usr/lib/python3.14/site-packages/chardet/__pycache__/charsetprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/escprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langfarsimodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langczechmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langdutchmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langgreekmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langirishmodel.cpython-314.pyc /usr/lib/python3.14/s
 ite-packages/chardet/__pycache__/langmalaymodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langtajikmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langwelshmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/escprober.py /usr/lib/python3.14/site-packages/chardet/langbulgarianmodel.py /usr/lib/python3.14/site-packages/chardet/sjisprober.py /usr/lib/python3.14/site-packages/chardet/utf8prober.py /usr/lib/python3.14/site-packages/chardet/big5prober.py /usr/lib/python3.14/site-packages/chardet/langvietnamesemodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/johabfreq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langlatvianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/hebrewprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/cp949prober.py /usr/lib/python3.14/site-packages/chardet/eucjpprober.py /usr/lib/python3.14/site-packages/chardet/euckrprober.py /usr/lib/python
 3.14/site-packages/chardet/johabprober.py /usr/lib/python3.14/site-packages/chardet/langfarsimodel.py /usr/lib/python3.14/site-packages/chardet/langromanianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/johabprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/resultdict.py /usr/lib/python3.14/site-packages/chardet/__pycache__/eucjpprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/resultdict.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/language_model_notes.md /usr/lib/python3.14/site-packages/chardet/escsm.py /usr/lib/python3.14/site-packages/chardet/langthaimodel.py /usr/lib/python3.14/site-packages/chardet/hebrewprober.py /usr/lib/python3.14/site-packages/chardet/langrussianmodel.py /usr/lib/python3.14/site-packages/chardet/langmacedonianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/sbcsgroupprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcsgroupprober.cpython-314.py
 c /usr/lib/python3.14/site-packages/chardet/langturkishmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/big5prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langslovenemodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/charsetgroupprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langthaimodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/gb18030prober.py /usr/lib/python3.14/site-packages/chardet/charsetprober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/escsm.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/version.py /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcssm.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/__init__.py /usr/lib/python3.14/site-packages/chardet/langbretonmodel.py /usr/lib/python3.14/site-packages/chardet/langfrenchmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/jisfreq.cpython-314.pyc /usr/lib/python3.14/site-packa
 ges/chardet/__pycache__/chardistribution.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langkazakhmodel.py /usr/lib/python3.14/site-packages/chardet/langslovakmodel.py /usr/lib/python3.14/site-packages/chardet/langscottishgaelicmodel.py /usr/lib/python3.14/site-packages/chardet/langswedishmodel.py /usr/lib/python3.14/site-packages/chardet/codingstatemachine.py /usr/lib/python3.14/site-packages/chardet/metadata/languages.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langesperantomodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langicelandicmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/gb2312freq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/euckrfreq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langportuguesemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/charsetgroupprober.py /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/lan
 guages.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/gb2312freq.py /usr/lib/python3.14/site-packages/chardet/jisfreq.py /usr/lib/python3.14/site-packages/chardet/chardistribution.py /usr/lib/python3.14/site-packages/chardet/langbelarusianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langvietnamesemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/charsets.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langindonesianmodel.py /usr/lib/python3.14/site-packages/chardet/langarabicmodel.py /usr/lib/python3.14/site-packages/chardet/codingstatemachinedict.py /usr/lib/python3.14/site-packages/chardet/langesperantomodel.py /usr/lib/python3.14/site-packages/chardet/langpolishmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/codingstatemachinedict.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/big5freq.py /usr/lib/python3.14/site-packages/chardet/langdutchmodel.py /usr/lib/python3.14/site-packages/
 chardet/langcroatianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/utf1632prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/mbcharsetprober.py /usr/lib/python3.14/site-packages/chardet/sbcharsetprober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/euckrprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/jpcntx.py /usr/lib/python3.14/site-packages/chardet/__pycache__/gb18030prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/big5freq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/mbcssm.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langitalianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langlatvianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langrussianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langserbianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/utf8prober.
 cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langenglishmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/sjisprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/sbcharsetprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcharsetprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langserbianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langbulgarianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langhungarianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langnorwegianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langukrainianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/version.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/cp949prober.cpython-314.pyc 
 /usr/lib/python3.14/site-packages/chardet/langczechmodel.py /usr/lib/python3.14/site-packages/chardet/langgreekmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langenglishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langfinnishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langspanishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langswedishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langturkishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/charsets.py /usr/lib/python3.14/site-packages/chardet/utf1632prober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langcroatianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langestonianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langromanianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langhebrewmode
 l.py /usr/lib/python3.14/site-packages/chardet/langirishmodel.py /usr/lib/python3.14/site-packages/chardet/langmaltesemodel.py /usr/lib/python3.14/site-packages/chardet/langlithuanianmodel.py /usr/lib/python3.14/site-packages/chardet/langtajikmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/jpcntx.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langfrenchmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langhungarianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langgermanmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langestonianmodel.py /usr/lib/python3.14/site-packages/chardet/langgermanmodel.py /usr/lib/python3.14/site-packages/chardet/johabfreq.py /usr/lib/python3.14/site-packages/chardet/langfinnishmodel.py /usr/lib/python3.14/site-packages/chardet/euckrfreq.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langhebrewmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycach
 e__/langkazakhmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langpolishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langslovakmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langarabicmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langbretonmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/codingstatemachine.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langdanishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langlithuanianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langmacedonianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langmaltesemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langslovenemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langmalaymodel.py /usr/lib/python3.14/site-pac
 kages/chardet/langwelshmodel.py /usr/lib/python3.14/site-packages/chardet/langdanishmodel.py /usr/lib/python3.14/site-packages/chardet/langportuguesemodel.py /usr/lib/python3.14/site-packages/chardet/mbcsgroupprober.py /usr/lib/python3.14/site-packages/chardet/sbcsgroupprober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langbelarusianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langindonesianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langitalianmodel.py /usr/lib/python3.14/site-packages/chardet/langnorwegianmodel.py /usr/lib/python3.14/site-packages/chardet/langspanishmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langscottishgaelicmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langukrainianmodel.py /usr/lib/python3.14/site-packages/chardet/langicelandicmodel.py", added "/usr/lib/python3.14/site-packages/chardet/models/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-package
 s/chardet/pipeline/utf1632.py /usr/lib/python3.14/site-packages/chardet/pipeline/validity.py /usr/lib/python3.14/site-packages/chardet/models/__init__.py /usr/lib/python3.14/site-packages/chardet/pipeline/binary.py /usr/lib/python3.14/site-packages/chardet/pipeline/statistical.py /usr/lib/python3.14/site-packages/chardet/pipeline/bom.py /usr/lib/python3.14/site-packages/chardet/pipeline/__init__.py /usr/lib/python3.14/site-packages/chardet/cli.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/ascii.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/equivalences.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/binary.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/escape.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/utf8.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/structur
 al.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/structural.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/_utils.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/magic.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/ascii.py /usr/lib/python3.14/site-packages/chardet/pipeline/magic.py /usr/lib/python3.14/site-packages/chardet/pipeline/escape.py /usr/lib/python3.14/site-packages/chardet/registry.py /usr/lib/python3.14/site-packages/chardet/pipeline/confusion.py /usr/lib/python3.14/site-packages/chardet/pipeline/utf8.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/bom.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/utf1632.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/training_metadata.yaml /usr/lib/python3.14/site-packages/chardet/models/models.bin /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/markup.cpython-314.pyc /usr/lib/python3.1
 4/site-packages/chardet/__pycache__/registry.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/_version.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/statistical.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/_utils.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/orchestrator.py /usr/lib/python3.14/site-packages/chardet/__pycache__/cli.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/detector.py /usr/lib/python3.14/site-packages/chardet/models/confusion.bin /usr/lib/python3.14/site-packages/chardet/pipeline/markup.py /usr/lib/python3.14/site-packages/chardet/_version.py /usr/lib/python3.14/site-packages/chardet/__pycache__/equivalences.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/orchestrator.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/confusion.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/_
 _pycache__/validity.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/detector.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/idf.bin"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet: PKGV changed from 6.0.0.post1 [default] to 7.4.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-chardet (sysroot):
  /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info was added
  /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/chardet/cli.py was added
  /usr/lib/python3.14/site-packages/chardet/detector.py was added
  /usr/lib/python3.14/site-packages/chardet/equivalences.py was added
  /usr/lib/python3.14/site-packages/chardet/models was added
  /usr/lib/python3.14/site-packages/chardet/models/confusion.bin was added
  /usr/lib/python3.14/site-packages/chardet/models/idf.bin was added
  /usr/lib/python3.14/site-packages/chardet/models/__init__.py was added
  /usr/lib/python3.14/site-packages/chardet/models/models.bin was added
  /usr/lib/python3.14/site-packages/chardet/models/__pycache__ was added
  /usr/lib/python3.14/site-packages/chardet/models/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/models/training_metadata.yaml was added
  /usr/lib/python3.14/site-packages/chardet/pipeline was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/ascii.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/binary.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/bom.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/confusion.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/escape.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__init__.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/magic.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/markup.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/orchestrator.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__ was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/ascii.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/binary.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/bom.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/confusion.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/escape.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/magic.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/markup.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/orchestrator.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/statistical.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/structural.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/utf1632.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/utf8.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/validity.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/statistical.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/structural.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/utf1632.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/utf8.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/validity.py was added
  /usr/lib/python3.14/site-packages/chardet/__pycache__/cli.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/__pycache__/detector.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/__pycache__/equivalences.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/__pycache__/registry.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/__pycache__/_utils.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/__pycache__/_version.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/registry.py was added
  /usr/lib/python3.14/site-packages/chardet/_utils.py was added
  /usr/lib/python3.14/site-packages/chardet/_version.py was added
  /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info was removed
  /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/chardet/big5freq.py was removed
  /usr/lib/python3.14/site-packages/chardet/big5prober.py was removed
  /usr/lib/python3.14/site-packages/chardet/chardistribution.py was removed
  /usr/lib/python3.14/site-packages/chardet/charsetgroupprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/charsetprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/cli was removed
  /usr/lib/python3.14/site-packages/chardet/cli/chardetect.py was removed
  /usr/lib/python3.14/site-packages/chardet/cli/__init__.py was removed
  /usr/lib/python3.14/site-packages/chardet/cli/__pycache__ was removed
  /usr/lib/python3.14/site-packages/chardet/cli/__pycache__/chardetect.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/cli/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/codingstatemachinedict.py was removed
  /usr/lib/python3.14/site-packages/chardet/codingstatemachine.py was removed
  /usr/lib/python3.14/site-packages/chardet/cp949prober.py was removed
  /usr/lib/python3.14/site-packages/chardet/escprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/escsm.py was removed
  /usr/lib/python3.14/site-packages/chardet/eucjpprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/euckrfreq.py was removed
  /usr/lib/python3.14/site-packages/chardet/euckrprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/gb18030prober.py was removed
  /usr/lib/python3.14/site-packages/chardet/gb2312freq.py was removed
  /usr/lib/python3.14/site-packages/chardet/hebrewprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/jisfreq.py was removed
  /usr/lib/python3.14/site-packages/chardet/johabfreq.py was removed
  /usr/lib/python3.14/site-packages/chardet/johabprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/jpcntx.py was removed
  /usr/lib/python3.14/site-packages/chardet/langarabicmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langbelarusianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langbretonmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langbulgarianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langcroatianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langczechmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langdanishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langdutchmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langenglishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langesperantomodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langestonianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langfarsimodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langfinnishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langfrenchmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langgermanmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langgreekmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langhebrewmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langhungarianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langicelandicmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langindonesianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langirishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langitalianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langkazakhmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langlatvianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langlithuanianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langmacedonianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langmalaymodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langmaltesemodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langnorwegianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langpolishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langportuguesemodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langromanianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langrussianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langscottishgaelicmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langserbianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langslovakmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langslovenemodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langspanishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langswedishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langtajikmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langthaimodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langturkishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/language_model_notes.md was removed
  /usr/lib/python3.14/site-packages/chardet/langukrainianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langvietnamesemodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langwelshmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/mbcharsetprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/mbcsgroupprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/mbcssm.py was removed
  /usr/lib/python3.14/site-packages/chardet/metadata was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/charsets.py was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/__init__.py was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/languages.py was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__ was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/charsets.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/languages.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/big5freq.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/big5prober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/chardistribution.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/charsetgroupprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/charsetprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/codingstatemachine.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/codingstatemachinedict.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/cp949prober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/escprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/escsm.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/eucjpprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/euckrfreq.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/euckrprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/gb18030prober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/gb2312freq.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/hebrewprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/jisfreq.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/johabfreq.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/johabprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/jpcntx.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langarabicmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langbelarusianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langbretonmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langbulgarianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langcroatianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langczechmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langdanishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langdutchmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langenglishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langesperantomodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langestonianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langfarsimodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langfinnishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langfrenchmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langgermanmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langgreekmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langhebrewmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langhungarianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langicelandicmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langindonesianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langirishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langitalianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langkazakhmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langlatvianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langlithuanianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langmacedonianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langmalaymodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langmaltesemodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langnorwegianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langpolishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langportuguesemodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langromanianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langrussianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langscottishgaelicmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langserbianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langslovakmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langslovenemodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langspanishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langswedishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langtajikmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langthaimodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langturkishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langukrainianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langvietnamesemodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langwelshmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcharsetprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcsgroupprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcssm.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/resultdict.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/sbcharsetprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/sbcsgroupprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/sjisprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/utf1632prober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/utf8prober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/version.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/resultdict.py was removed
  /usr/lib/python3.14/site-packages/chardet/sbcharsetprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/sbcsgroupprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/sjisprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/utf1632prober.py was removed
  /usr/lib/python3.14/site-packages/chardet/utf8prober.py was removed
  /usr/lib/python3.14/site-packages/chardet/version.py was removed

--===============0857580397660430874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-cli: PKGSIZE changed from 9914 to 0 (-100%)
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-cli: FILELIST: removed all items "/usr/lib/python3.14/site-packages/chardet/cli/__init__.py /usr/lib/python3.14/site-packages/chardet/cli/__pycache__/chardetect.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/cli/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/cli/chardetect.py"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet: PKGSIZE changed from 24721887 to 1120674 (-95%)
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet: FILELIST: directory renamed /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info -> /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/licenses -> /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/chardet/langmaltesemodel.py /usr/lib/python3.14/site-packages/chardet/charsetgroupprober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langdutchmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langwelshmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langczechmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langfarsimodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langgreekmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langi
 rishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langmalaymodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langtajikmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/charsetprober.py /usr/lib/python3.14/site-packages/chardet/metadata/__init__.py /usr/lib/python3.14/site-packages/chardet/langportuguesemodel.py /usr/lib/python3.14/site-packages/chardet/langdanishmodel.py /usr/lib/python3.14/site-packages/chardet/codingstatemachine.py /usr/lib/python3.14/site-packages/chardet/langlithuanianmodel.py /usr/lib/python3.14/site-packages/chardet/jpcntx.py /usr/lib/python3.14/site-packages/chardet/langicelandicmodel.py /usr/lib/python3.14/site-packages/chardet/mbcssm.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langcroatianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langestonianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langromanianmodel.cpython-
 314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/codingstatemachinedict.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/jisfreq.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langbulgarianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langhungarianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langnorwegianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langukrainianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langvietnamesemodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/johabprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/gb2312freq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langmacedonianmodel.py /usr/lib/python3.14/site-packages/chardet/langfarsimodel.py /usr/lib/python3.14/site-packages/chardet/__py
 cache__/mbcsgroupprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/sbcsgroupprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/eucjpprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/charsetgroupprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/escprober.py /usr/lib/python3.14/site-packages/chardet/metadata/languages.py /usr/lib/python3.14/site-packages/chardet/langmalaymodel.py /usr/lib/python3.14/site-packages/chardet/langwelshmodel.py /usr/lib/python3.14/site-packages/chardet/langhungarianmodel.py /usr/lib/python3.14/site-packages/chardet/langbelarusianmodel.py /usr/lib/python3.14/site-packages/chardet/language_model_notes.md /usr/lib/python3.14/site-packages/chardet/__pycache__/cp949prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/charsets.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/escprober.cpython-314.pyc /usr/lib/python3
 .14/site-packages/chardet/big5prober.py /usr/lib/python3.14/site-packages/chardet/langesperantomodel.py /usr/lib/python3.14/site-packages/chardet/sjisprober.py /usr/lib/python3.14/site-packages/chardet/utf8prober.py /usr/lib/python3.14/site-packages/chardet/langturkishmodel.py /usr/lib/python3.14/site-packages/chardet/langhebrewmodel.py /usr/lib/python3.14/site-packages/chardet/version.py /usr/lib/python3.14/site-packages/chardet/langpolishmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langlithuanianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langmacedonianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/codingstatemachinedict.py /usr/lib/python3.14/site-packages/chardet/langindonesianmodel.py /usr/lib/python3.14/site-packages/chardet/cp949prober.py /usr/lib/python3.14/site-packages/chardet/eucjpprober.py /usr/lib/python3.14/site-packages/chardet/euckrprober.py /usr/lib/python3.14/site-packages/chardet/gb2312freq.py /usr
 /lib/python3.14/site-packages/chardet/johabprober.py /usr/lib/python3.14/site-packages/chardet/utf1632prober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/big5freq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langbulgarianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langmaltesemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/jpcntx.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langslovenemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/codingstatemachine.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langkazakhmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/sjisprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/resultdict.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/euckrfreq.py /usr/lib/python3.14/site-packages/chardet/johabfreq.py /usr/lib/python3.14/site-packages/chardet/langczechmodel.py /usr/lib/
 python3.14/site-packages/chardet/langgreekmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/big5prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langkazakhmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langpolishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langslovakmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langarabicmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langbretonmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langdanishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langfrenchmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langgermanmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langhebrewmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langicelandicmodel.cpython-314.pyc /u
 sr/lib/python3.14/site-packages/chardet/langestonianmodel.py /usr/lib/python3.14/site-packages/chardet/langromanianmodel.py /usr/lib/python3.14/site-packages/chardet/metadata/charsets.py /usr/lib/python3.14/site-packages/chardet/langrussianmodel.py /usr/lib/python3.14/site-packages/chardet/langenglishmodel.py /usr/lib/python3.14/site-packages/chardet/chardistribution.py /usr/lib/python3.14/site-packages/chardet/__pycache__/version.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/jisfreq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/johabfreq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langswedishmodel.py /usr/lib/python3.14/site-packages/chardet/langtajikmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langesperantomodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langgermanmodel.py /usr/lib/python3.14/site-packages/chardet/mbcharsetprober.py /usr/lib/python3.14/site-packages/chardet/sbcharsetprob
 er.py /usr/lib/python3.14/site-packages/chardet/__pycache__/euckrprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcharsetprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/sbcharsetprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langfinnishmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langscottishgaelicmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/hebrewprober.py /usr/lib/python3.14/site-packages/chardet/escsm.py /usr/lib/python3.14/site-packages/chardet/gb18030prober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langvietnamesemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/utf8prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/hebrewprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/mbcsgroupprober.py /usr/lib/python3.14/site-packages/chardet/langscottishgaelicmodel.py /usr/lib/python3.14/site-pack
 ages/chardet/metadata/__pycache__/languages.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/sbcsgroupprober.py /usr/lib/python3.14/site-packages/chardet/resultdict.py /usr/lib/python3.14/site-packages/chardet/__pycache__/gb18030prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langarabicmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/euckrfreq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langbelarusianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langindonesianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langitalianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langlatvianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langrussianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langserbianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langserbianmodel.py /usr/
 lib/python3.14/site-packages/chardet/__pycache__/langthaimodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langcroatianmodel.py /usr/lib/python3.14/site-packages/chardet/langitalianmodel.py /usr/lib/python3.14/site-packages/chardet/langslovakmodel.py /usr/lib/python3.14/site-packages/chardet/langspanishmodel.py /usr/lib/python3.14/site-packages/chardet/langirishmodel.py /usr/lib/python3.14/site-packages/chardet/langbretonmodel.py /usr/lib/python3.14/site-packages/chardet/langfrenchmodel.py /usr/lib/python3.14/site-packages/chardet/langnorwegianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/escsm.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langukrainianmodel.py /usr/lib/python3.14/site-packages/chardet/langslovenemodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langswedishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langturkishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pyca
 che__/langenglishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langfinnishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langspanishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/chardistribution.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcssm.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/utf1632prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langdutchmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/charsetprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langthaimodel.py /usr/lib/python3.14/site-packages/chardet/langlatvianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langportuguesemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/big5freq.py", added "/usr/lib/python3.14/site-packages/chardet/pipeline/escape.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pyca
 che__/structural.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/ascii.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/__init__.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/validity.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/detector.py /usr/lib/python3.14/site-packages/chardet/pipeline/markup.py /usr/lib/python3.14/site-packages/chardet/pipeline/validity.py /usr/lib/python3.14/site-packages/chardet/_version.py /usr/lib/python3.14/site-packages/chardet/__pycache__/equivalences.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/escape.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/binary.py /usr/lib/python3.14/site-packages/chardet/pipeline/bom.py /usr/lib/python3.14/site-packages/chardet/__pycache__/cli.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/bom.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/conf
 usion.bin /usr/lib/python3.14/site-packages/chardet/models/idf.bin /usr/lib/python3.14/site-packages/chardet/cli.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/statistical.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/_utils.py /usr/lib/python3.14/site-packages/chardet/models/models.bin /usr/lib/python3.14/site-packages/chardet/pipeline/orchestrator.py /usr/lib/python3.14/site-packages/chardet/pipeline/structural.py /usr/lib/python3.14/site-packages/chardet/pipeline/__init__.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/magic.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/training_metadata.yaml /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/confusion.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/_version.
 cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/utf8.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/ascii.py /usr/lib/python3.14/site-packages/chardet/pipeline/magic.py /usr/lib/python3.14/site-packages/chardet/pipeline/statistical.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/markup.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/registry.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/orchestrator.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/equivalences.py /usr/lib/python3.14/site-packages/chardet/pipeline/confusion.py /usr/lib/python3.14/site-packages/chardet/__pycache__/registry.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/utf1632.py /usr/lib/python3.14/site-packages/chardet/__pycache__/_utils.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/binary.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__
 pycache__/utf1632.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/detector.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/utf8.py"
Changes to packages/x86-64-v3-poky-linux/python3-chardet (sysroot):
  /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info was added
  /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/chardet/cli.py was added
  /usr/lib/python3.14/site-packages/chardet/detector.py was added
  /usr/lib/python3.14/site-packages/chardet/equivalences.py was added
  /usr/lib/python3.14/site-packages/chardet/models was added
  /usr/lib/python3.14/site-packages/chardet/models/confusion.bin was added
  /usr/lib/python3.14/site-packages/chardet/models/idf.bin was added
  /usr/lib/python3.14/site-packages/chardet/models/__init__.py was added
  /usr/lib/python3.14/site-packages/chardet/models/models.bin was added
  /usr/lib/python3.14/site-packages/chardet/models/__pycache__ was added
  /usr/lib/python3.14/site-packages/chardet/models/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/models/training_metadata.yaml was added
  /usr/lib/python3.14/site-packages/chardet/pipeline was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/ascii.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/binary.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/bom.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/confusion.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/escape.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__init__.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/magic.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/markup.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/orchestrator.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__ was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/ascii.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/binary.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/bom.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/confusion.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/escape.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/magic.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/markup.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/orchestrator.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/statistical.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/structural.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/utf1632.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/utf8.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/validity.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/statistical.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/structural.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/utf1632.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/utf8.py was added
  /usr/lib/python3.14/site-packages/chardet/pipeline/validity.py was added
  /usr/lib/python3.14/site-packages/chardet/__pycache__/cli.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/__pycache__/detector.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/__pycache__/equivalences.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/__pycache__/registry.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/__pycache__/_utils.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/__pycache__/_version.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/chardet/registry.py was added
  /usr/lib/python3.14/site-packages/chardet/_utils.py was added
  /usr/lib/python3.14/site-packages/chardet/_version.py was added
  /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info was removed
  /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/chardet/big5freq.py was removed
  /usr/lib/python3.14/site-packages/chardet/big5prober.py was removed
  /usr/lib/python3.14/site-packages/chardet/chardistribution.py was removed
  /usr/lib/python3.14/site-packages/chardet/charsetgroupprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/charsetprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/cli was removed
  /usr/lib/python3.14/site-packages/chardet/cli/chardetect.py was removed
  /usr/lib/python3.14/site-packages/chardet/cli/__init__.py was removed
  /usr/lib/python3.14/site-packages/chardet/cli/__pycache__ was removed
  /usr/lib/python3.14/site-packages/chardet/cli/__pycache__/chardetect.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/cli/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/codingstatemachinedict.py was removed
  /usr/lib/python3.14/site-packages/chardet/codingstatemachine.py was removed
  /usr/lib/python3.14/site-packages/chardet/cp949prober.py was removed
  /usr/lib/python3.14/site-packages/chardet/escprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/escsm.py was removed
  /usr/lib/python3.14/site-packages/chardet/eucjpprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/euckrfreq.py was removed
  /usr/lib/python3.14/site-packages/chardet/euckrprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/gb18030prober.py was removed
  /usr/lib/python3.14/site-packages/chardet/gb2312freq.py was removed
  /usr/lib/python3.14/site-packages/chardet/hebrewprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/jisfreq.py was removed
  /usr/lib/python3.14/site-packages/chardet/johabfreq.py was removed
  /usr/lib/python3.14/site-packages/chardet/johabprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/jpcntx.py was removed
  /usr/lib/python3.14/site-packages/chardet/langarabicmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langbelarusianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langbretonmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langbulgarianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langcroatianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langczechmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langdanishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langdutchmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langenglishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langesperantomodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langestonianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langfarsimodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langfinnishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langfrenchmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langgermanmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langgreekmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langhebrewmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langhungarianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langicelandicmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langindonesianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langirishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langitalianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langkazakhmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langlatvianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langlithuanianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langmacedonianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langmalaymodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langmaltesemodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langnorwegianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langpolishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langportuguesemodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langromanianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langrussianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langscottishgaelicmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langserbianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langslovakmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langslovenemodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langspanishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langswedishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langtajikmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langthaimodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langturkishmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/language_model_notes.md was removed
  /usr/lib/python3.14/site-packages/chardet/langukrainianmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langvietnamesemodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/langwelshmodel.py was removed
  /usr/lib/python3.14/site-packages/chardet/mbcharsetprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/mbcsgroupprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/mbcssm.py was removed
  /usr/lib/python3.14/site-packages/chardet/metadata was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/charsets.py was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/__init__.py was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/languages.py was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__ was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/charsets.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/languages.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/big5freq.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/big5prober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/chardistribution.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/charsetgroupprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/charsetprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/codingstatemachine.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/codingstatemachinedict.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/cp949prober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/escprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/escsm.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/eucjpprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/euckrfreq.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/euckrprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/gb18030prober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/gb2312freq.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/hebrewprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/jisfreq.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/johabfreq.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/johabprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/jpcntx.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langarabicmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langbelarusianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langbretonmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langbulgarianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langcroatianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langczechmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langdanishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langdutchmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langenglishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langesperantomodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langestonianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langfarsimodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langfinnishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langfrenchmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langgermanmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langgreekmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langhebrewmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langhungarianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langicelandicmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langindonesianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langirishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langitalianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langkazakhmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langlatvianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langlithuanianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langmacedonianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langmalaymodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langmaltesemodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langnorwegianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langpolishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langportuguesemodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langromanianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langrussianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langscottishgaelicmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langserbianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langslovakmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langslovenemodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langspanishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langswedishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langtajikmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langthaimodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langturkishmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langukrainianmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langvietnamesemodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/langwelshmodel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcharsetprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcsgroupprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcssm.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/resultdict.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/sbcharsetprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/sbcsgroupprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/sjisprober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/utf1632prober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/utf8prober.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/__pycache__/version.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/chardet/resultdict.py was removed
  /usr/lib/python3.14/site-packages/chardet/sbcharsetprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/sbcsgroupprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/sjisprober.py was removed
  /usr/lib/python3.14/site-packages/chardet/utf1632prober.py was removed
  /usr/lib/python3.14/site-packages/chardet/utf8prober.py was removed
  /usr/lib/python3.14/site-packages/chardet/version.py was removed

--===============0857580397660430874==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-chardet-upgrade-6.0.0.post1-7.4.3.patch"

RnJvbSA0YjU0YTBlZmU3MDQ5NDFiODE0MGVkMzhhMDI4MGM4ZDdkNWEyMDI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDc6MzY6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNoYXJkZXQ6IHVwZ3JhZGUgNi4wLjAucG9zdDEgLT4gNy40LjMKCi0tLQogLi4uL3B5
dGhvbi9weXRob24zLWNoYXJkZXRfNi4wLjAucG9zdDEuYmIgICAgIHwgIDIzIC0KIC4uLi9weXRo
b24vcHl0aG9uMy1jaGFyZGV0XzcuNC4zLmJiICAgICAgICAgICB8IDU0OCArKysrKysrKysrKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNTQ4IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygt
KQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1jaGFyZGV0XzYuMC4wLnBvc3QxLmJiCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNoYXJkZXRfNy40LjMuYmIKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2hhcmRldF82LjAuMC5wb3N0MS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jaGFyZGV0XzYuMC4wLnBv
c3QxLmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAxNGMzMjQ3YjM1Li4wMDAwMDAw
MDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jaGFyZGV0XzYu
MC4wLnBvc3QxLmJiCisrKyAvZGV2L251bGwKQEAgLTEsMjMgKzAsMCBAQAotU1VNTUFSWSA9ICJV
bml2ZXJzYWwgZW5jb2RpbmcgZGV0ZWN0b3IgZm9yIFB5dGhvbiAyIGFuZCAzIgotSE9NRVBBR0Ug
PSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L2NoYXJkZXQvIgotTElDRU5TRSA9ICJMR1BMLTIu
MS1vbmx5IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NGJmNjYxYzFl
Mzc5M2U1NWM4ZDEwNTFiYzVlMGFlMjEiCi0KLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2Yjc4MDQ4
YzNjOTdjN2IyZWQxZmJhZDdhMThmNzZmNWE2NTQ3ZjdkMzRkYmFiNTM2Y2MxMzg4N2M5YTkyZmE0
IgotCi1pbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwotCi1ERVBFTkRTICs9ICJweXRob24z
LWhhdGNoLXZjcy1uYXRpdmUiCi0KLVBBQ0tBR0VTID0rICIke1BOfS1jbGkiCi1GSUxFUzoke1BO
fS1jbGkgKz0gIiBcCi0gICAgJHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0vY2hhcmRldC9jbGkg
XAotIgotCi1SREVQRU5EUzoke1BOfS1jbGkgPSAiJHtQTn0gIgotCi1SREVQRU5EUzoke1BOfTpj
bGFzcy10YXJnZXQgKz0gIiBcCi0gICAgcHl0aG9uMy1sb2dnaW5nIFwKLSIKLQotQkJDTEFTU0VY
VEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNoYXJkZXRfNy40LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2hhcmRldF83LjQuMy5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi4wOTU2YzEwZjk5Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNoYXJkZXRfNy40LjMuYmIKQEAgLTAsMCArMSw1
NDggQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBk
YXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2Ug
dXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hh
bmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4K
KyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykK
KyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBA
IC0xLDUwMSArMSwxMiBAQAorIyAtICAgICAgICAgICAgICAgICAgR05VIExFU1NFUiBHRU5FUkFM
IFBVQkxJQyBMSUNFTlNFCisjIC0gICAgICAgICAgICAgICAgICAgICAgIFZlcnNpb24gMi4xLCBG
ZWJydWFyeSAxOTk5CisjICtDb3B5cmlnaHQgKGMpIDIwMjYgRGFuIEJsYW5jaGFyZAorIyAgCisj
IC0gQ29weXJpZ2h0IChDKSAxOTkxLCAxOTk5IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5j
LgorIyAtIDxodHRwczovL2ZzZi5vcmcvPgorIyAtIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBj
b3B5IGFuZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcworIyAtIG9mIHRoaXMgbGljZW5zZSBk
b2N1bWVudCwgYnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxvd2VkLgorIyArUGVybWlzc2lvbiB0
byB1c2UsIGNvcHksIG1vZGlmeSwgYW5kL29yIGRpc3RyaWJ1dGUgdGhpcyBzb2Z0d2FyZSBmb3Ig
YW55CisjICtwdXJwb3NlIHdpdGggb3Igd2l0aG91dCBmZWUgaXMgaGVyZWJ5IGdyYW50ZWQuCisj
ICAKKyMgLVtUaGlzIGlzIHRoZSBmaXJzdCByZWxlYXNlZCB2ZXJzaW9uIG9mIHRoZSBMZXNzZXIg
R1BMLiAgSXQgYWxzbyBjb3VudHMKKyMgLSBhcyB0aGUgc3VjY2Vzc29yIG9mIHRoZSBHTlUgTGli
cmFyeSBQdWJsaWMgTGljZW5zZSwgdmVyc2lvbiAyLCBoZW5jZQorIyAtIHRoZSB2ZXJzaW9uIG51
bWJlciAyLjEuXQorIyAtCisjIC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgUHJlYW1ibGUK
KyMgLQorIyAtICBUaGUgbGljZW5zZXMgZm9yIG1vc3Qgc29mdHdhcmUgYXJlIGRlc2lnbmVkIHRv
IHRha2UgYXdheSB5b3VyCisjIC1mcmVlZG9tIHRvIHNoYXJlIGFuZCBjaGFuZ2UgaXQuICBCeSBj
b250cmFzdCwgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYworIyAtTGljZW5zZXMgYXJlIGludGVuZGVk
IHRvIGd1YXJhbnRlZSB5b3VyIGZyZWVkb20gdG8gc2hhcmUgYW5kIGNoYW5nZQorIyAtZnJlZSBz
b2Z0d2FyZS0tdG8gbWFrZSBzdXJlIHRoZSBzb2Z0d2FyZSBpcyBmcmVlIGZvciBhbGwgaXRzIHVz
ZXJzLgorIyAtCisjIC0gIFRoaXMgbGljZW5zZSwgdGhlIExlc3NlciBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlLCBhcHBsaWVzIHRvIHNvbWUKKyMgLXNwZWNpYWxseSBkZXNpZ25hdGVkIHNvZnR3YXJl
IHBhY2thZ2VzLS10eXBpY2FsbHkgbGlicmFyaWVzLS1vZiB0aGUKKyMgLUZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbiBhbmQgb3RoZXIgYXV0aG9ycyB3aG8gZGVjaWRlIHRvIHVzZSBpdC4gIFlvdQor
IyAtY2FuIHVzZSBpdCB0b28sIGJ1dCB3ZSBzdWdnZXN0IHlvdSBmaXJzdCB0aGluayBjYXJlZnVs
bHkgYWJvdXQgd2hldGhlcgorIyAtdGhpcyBsaWNlbnNlIG9yIHRoZSBvcmRpbmFyeSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGlzIHRoZSBiZXR0ZXIKKyMgLXN0cmF0ZWd5IHRvIHVzZSBpbiBhbnkg
cGFydGljdWxhciBjYXNlLCBiYXNlZCBvbiB0aGUgZXhwbGFuYXRpb25zIGJlbG93LgorIyAtCisj
IC0gIFdoZW4gd2Ugc3BlYWsgb2YgZnJlZSBzb2Z0d2FyZSwgd2UgYXJlIHJlZmVycmluZyB0byBm
cmVlZG9tIG9mIHVzZSwKKyMgLW5vdCBwcmljZS4gIE91ciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
cyBhcmUgZGVzaWduZWQgdG8gbWFrZSBzdXJlIHRoYXQKKyMgLXlvdSBoYXZlIHRoZSBmcmVlZG9t
IHRvIGRpc3RyaWJ1dGUgY29waWVzIG9mIGZyZWUgc29mdHdhcmUgKGFuZCBjaGFyZ2UKKyMgLWZv
ciB0aGlzIHNlcnZpY2UgaWYgeW91IHdpc2gpOyB0aGF0IHlvdSByZWNlaXZlIHNvdXJjZSBjb2Rl
IG9yIGNhbiBnZXQKKyMgLWl0IGlmIHlvdSB3YW50IGl0OyB0aGF0IHlvdSBjYW4gY2hhbmdlIHRo
ZSBzb2Z0d2FyZSBhbmQgdXNlIHBpZWNlcyBvZgorIyAtaXQgaW4gbmV3IGZyZWUgcHJvZ3JhbXM7
IGFuZCB0aGF0IHlvdSBhcmUgaW5mb3JtZWQgdGhhdCB5b3UgY2FuIGRvCisjIC10aGVzZSB0aGlu
Z3MuCisjIC0KKyMgLSAgVG8gcHJvdGVjdCB5b3VyIHJpZ2h0cywgd2UgbmVlZCB0byBtYWtlIHJl
c3RyaWN0aW9ucyB0aGF0IGZvcmJpZAorIyAtZGlzdHJpYnV0b3JzIHRvIGRlbnkgeW91IHRoZXNl
IHJpZ2h0cyBvciB0byBhc2sgeW91IHRvIHN1cnJlbmRlciB0aGVzZQorIyAtcmlnaHRzLiAgVGhl
c2UgcmVzdHJpY3Rpb25zIHRyYW5zbGF0ZSB0byBjZXJ0YWluIHJlc3BvbnNpYmlsaXRpZXMgZm9y
CisjIC15b3UgaWYgeW91IGRpc3RyaWJ1dGUgY29waWVzIG9mIHRoZSBsaWJyYXJ5IG9yIGlmIHlv
dSBtb2RpZnkgaXQuCisjIC0KKyMgLSAgRm9yIGV4YW1wbGUsIGlmIHlvdSBkaXN0cmlidXRlIGNv
cGllcyBvZiB0aGUgbGlicmFyeSwgd2hldGhlciBncmF0aXMKKyMgLW9yIGZvciBhIGZlZSwgeW91
IG11c3QgZ2l2ZSB0aGUgcmVjaXBpZW50cyBhbGwgdGhlIHJpZ2h0cyB0aGF0IHdlIGdhdmUKKyMg
LXlvdS4gIFlvdSBtdXN0IG1ha2Ugc3VyZSB0aGF0IHRoZXksIHRvbywgcmVjZWl2ZSBvciBjYW4g
Z2V0IHRoZSBzb3VyY2UKKyMgLWNvZGUuICBJZiB5b3UgbGluayBvdGhlciBjb2RlIHdpdGggdGhl
IGxpYnJhcnksIHlvdSBtdXN0IHByb3ZpZGUKKyMgLWNvbXBsZXRlIG9iamVjdCBmaWxlcyB0byB0
aGUgcmVjaXBpZW50cywgc28gdGhhdCB0aGV5IGNhbiByZWxpbmsgdGhlbQorIyAtd2l0aCB0aGUg
bGlicmFyeSBhZnRlciBtYWtpbmcgY2hhbmdlcyB0byB0aGUgbGlicmFyeSBhbmQgcmVjb21waWxp
bmcKKyMgLWl0LiAgQW5kIHlvdSBtdXN0IHNob3cgdGhlbSB0aGVzZSB0ZXJtcyBzbyB0aGV5IGtu
b3cgdGhlaXIgcmlnaHRzLgorIyAtCisjIC0gIFdlIHByb3RlY3QgeW91ciByaWdodHMgd2l0aCBh
IHR3by1zdGVwIG1ldGhvZDogKDEpIHdlIGNvcHlyaWdodCB0aGUKKyMgLWxpYnJhcnksIGFuZCAo
Mikgd2Ugb2ZmZXIgeW91IHRoaXMgbGljZW5zZSwgd2hpY2ggZ2l2ZXMgeW91IGxlZ2FsCisjIC1w
ZXJtaXNzaW9uIHRvIGNvcHksIGRpc3RyaWJ1dGUgYW5kL29yIG1vZGlmeSB0aGUgbGlicmFyeS4K
KyMgLQorIyAtICBUbyBwcm90ZWN0IGVhY2ggZGlzdHJpYnV0b3IsIHdlIHdhbnQgdG8gbWFrZSBp
dCB2ZXJ5IGNsZWFyIHRoYXQKKyMgLXRoZXJlIGlzIG5vIHdhcnJhbnR5IGZvciB0aGUgZnJlZSBs
aWJyYXJ5LiAgQWxzbywgaWYgdGhlIGxpYnJhcnkgaXMKKyMgLW1vZGlmaWVkIGJ5IHNvbWVvbmUg
ZWxzZSBhbmQgcGFzc2VkIG9uLCB0aGUgcmVjaXBpZW50cyBzaG91bGQga25vdworIyAtdGhhdCB3
aGF0IHRoZXkgaGF2ZSBpcyBub3QgdGhlIG9yaWdpbmFsIHZlcnNpb24sIHNvIHRoYXQgdGhlIG9y
aWdpbmFsCisjIC1hdXRob3IncyByZXB1dGF0aW9uIHdpbGwgbm90IGJlIGFmZmVjdGVkIGJ5IHBy
b2JsZW1zIHRoYXQgbWlnaHQgYmUKKyMgLWludHJvZHVjZWQgYnkgb3RoZXJzLgorIyAtDAorIyAt
ICBGaW5hbGx5LCBzb2Z0d2FyZSBwYXRlbnRzIHBvc2UgYSBjb25zdGFudCB0aHJlYXQgdG8gdGhl
IGV4aXN0ZW5jZSBvZgorIyAtYW55IGZyZWUgcHJvZ3JhbS4gIFdlIHdpc2ggdG8gbWFrZSBzdXJl
IHRoYXQgYSBjb21wYW55IGNhbm5vdAorIyAtZWZmZWN0aXZlbHkgcmVzdHJpY3QgdGhlIHVzZXJz
IG9mIGEgZnJlZSBwcm9ncmFtIGJ5IG9idGFpbmluZyBhCisjIC1yZXN0cmljdGl2ZSBsaWNlbnNl
IGZyb20gYSBwYXRlbnQgaG9sZGVyLiAgVGhlcmVmb3JlLCB3ZSBpbnNpc3QgdGhhdAorIyAtYW55
IHBhdGVudCBsaWNlbnNlIG9idGFpbmVkIGZvciBhIHZlcnNpb24gb2YgdGhlIGxpYnJhcnkgbXVz
dCBiZQorIyAtY29uc2lzdGVudCB3aXRoIHRoZSBmdWxsIGZyZWVkb20gb2YgdXNlIHNwZWNpZmll
ZCBpbiB0aGlzIGxpY2Vuc2UuCisjIC0KKyMgLSAgTW9zdCBHTlUgc29mdHdhcmUsIGluY2x1ZGlu
ZyBzb21lIGxpYnJhcmllcywgaXMgY292ZXJlZCBieSB0aGUKKyMgLW9yZGluYXJ5IEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlLiAgVGhpcyBsaWNlbnNlLCB0aGUgR05VIExlc3NlcgorIyAtR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSwgYXBwbGllcyB0byBjZXJ0YWluIGRlc2lnbmF0ZWQgbGlicmFy
aWVzLCBhbmQKKyMgLWlzIHF1aXRlIGRpZmZlcmVudCBmcm9tIHRoZSBvcmRpbmFyeSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlLiAgV2UgdXNlCisjIC10aGlzIGxpY2Vuc2UgZm9yIGNlcnRhaW4gbGli
cmFyaWVzIGluIG9yZGVyIHRvIHBlcm1pdCBsaW5raW5nIHRob3NlCisjIC1saWJyYXJpZXMgaW50
byBub24tZnJlZSBwcm9ncmFtcy4KKyMgLQorIyAtICBXaGVuIGEgcHJvZ3JhbSBpcyBsaW5rZWQg
d2l0aCBhIGxpYnJhcnksIHdoZXRoZXIgc3RhdGljYWxseSBvciB1c2luZworIyAtYSBzaGFyZWQg
bGlicmFyeSwgdGhlIGNvbWJpbmF0aW9uIG9mIHRoZSB0d28gaXMgbGVnYWxseSBzcGVha2luZyBh
CisjIC1jb21iaW5lZCB3b3JrLCBhIGRlcml2YXRpdmUgb2YgdGhlIG9yaWdpbmFsIGxpYnJhcnku
ICBUaGUgb3JkaW5hcnkKKyMgLUdlbmVyYWwgUHVibGljIExpY2Vuc2UgdGhlcmVmb3JlIHBlcm1p
dHMgc3VjaCBsaW5raW5nIG9ubHkgaWYgdGhlCisjIC1lbnRpcmUgY29tYmluYXRpb24gZml0cyBp
dHMgY3JpdGVyaWEgb2YgZnJlZWRvbS4gIFRoZSBMZXNzZXIgR2VuZXJhbAorIyAtUHVibGljIExp
Y2Vuc2UgcGVybWl0cyBtb3JlIGxheCBjcml0ZXJpYSBmb3IgbGlua2luZyBvdGhlciBjb2RlIHdp
dGgKKyMgLXRoZSBsaWJyYXJ5LgorIyAtCisjIC0gIFdlIGNhbGwgdGhpcyBsaWNlbnNlIHRoZSAi
TGVzc2VyIiBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGJlY2F1c2UgaXQKKyMgLWRvZXMgTGVzcyB0
byBwcm90ZWN0IHRoZSB1c2VyJ3MgZnJlZWRvbSB0aGFuIHRoZSBvcmRpbmFyeSBHZW5lcmFsCisj
IC1QdWJsaWMgTGljZW5zZS4gIEl0IGFsc28gcHJvdmlkZXMgb3RoZXIgZnJlZSBzb2Z0d2FyZSBk
ZXZlbG9wZXJzIExlc3MKKyMgLW9mIGFuIGFkdmFudGFnZSBvdmVyIGNvbXBldGluZyBub24tZnJl
ZSBwcm9ncmFtcy4gIFRoZXNlIGRpc2FkdmFudGFnZXMKKyMgLWFyZSB0aGUgcmVhc29uIHdlIHVz
ZSB0aGUgb3JkaW5hcnkgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbWFueQorIyAtbGlicmFy
aWVzLiAgSG93ZXZlciwgdGhlIExlc3NlciBsaWNlbnNlIHByb3ZpZGVzIGFkdmFudGFnZXMgaW4g
Y2VydGFpbgorIyAtc3BlY2lhbCBjaXJjdW1zdGFuY2VzLgorIyAtCisjIC0gIEZvciBleGFtcGxl
LCBvbiByYXJlIG9jY2FzaW9ucywgdGhlcmUgbWF5IGJlIGEgc3BlY2lhbCBuZWVkIHRvCisjIC1l
bmNvdXJhZ2UgdGhlIHdpZGVzdCBwb3NzaWJsZSB1c2Ugb2YgYSBjZXJ0YWluIGxpYnJhcnksIHNv
IHRoYXQgaXQgYmVjb21lcworIyAtYSBkZS1mYWN0byBzdGFuZGFyZC4gIFRvIGFjaGlldmUgdGhp
cywgbm9uLWZyZWUgcHJvZ3JhbXMgbXVzdCBiZQorIyAtYWxsb3dlZCB0byB1c2UgdGhlIGxpYnJh
cnkuICBBIG1vcmUgZnJlcXVlbnQgY2FzZSBpcyB0aGF0IGEgZnJlZQorIyAtbGlicmFyeSBkb2Vz
IHRoZSBzYW1lIGpvYiBhcyB3aWRlbHkgdXNlZCBub24tZnJlZSBsaWJyYXJpZXMuICBJbiB0aGlz
CisjIC1jYXNlLCB0aGVyZSBpcyBsaXR0bGUgdG8gZ2FpbiBieSBsaW1pdGluZyB0aGUgZnJlZSBs
aWJyYXJ5IHRvIGZyZWUKKyMgLXNvZnR3YXJlIG9ubHksIHNvIHdlIHVzZSB0aGUgTGVzc2VyIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UuCisjIC0KKyMgLSAgSW4gb3RoZXIgY2FzZXMsIHBlcm1pc3Np
b24gdG8gdXNlIGEgcGFydGljdWxhciBsaWJyYXJ5IGluIG5vbi1mcmVlCisjIC1wcm9ncmFtcyBl
bmFibGVzIGEgZ3JlYXRlciBudW1iZXIgb2YgcGVvcGxlIHRvIHVzZSBhIGxhcmdlIGJvZHkgb2YK
KyMgLWZyZWUgc29mdHdhcmUuICBGb3IgZXhhbXBsZSwgcGVybWlzc2lvbiB0byB1c2UgdGhlIEdO
VSBDIExpYnJhcnkgaW4KKyMgLW5vbi1mcmVlIHByb2dyYW1zIGVuYWJsZXMgbWFueSBtb3JlIHBl
b3BsZSB0byB1c2UgdGhlIHdob2xlIEdOVQorIyAtb3BlcmF0aW5nIHN5c3RlbSwgYXMgd2VsbCBh
cyBpdHMgdmFyaWFudCwgdGhlIEdOVS9MaW51eCBvcGVyYXRpbmcKKyMgLXN5c3RlbS4KKyMgLQor
IyAtICBBbHRob3VnaCB0aGUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgaXMgTGVzcyBw
cm90ZWN0aXZlIG9mIHRoZQorIyAtdXNlcnMnIGZyZWVkb20sIGl0IGRvZXMgZW5zdXJlIHRoYXQg
dGhlIHVzZXIgb2YgYSBwcm9ncmFtIHRoYXQgaXMKKyMgLWxpbmtlZCB3aXRoIHRoZSBMaWJyYXJ5
IGhhcyB0aGUgZnJlZWRvbSBhbmQgdGhlIHdoZXJld2l0aGFsIHRvIHJ1bgorIyAtdGhhdCBwcm9n
cmFtIHVzaW5nIGEgbW9kaWZpZWQgdmVyc2lvbiBvZiB0aGUgTGlicmFyeS4KKyMgLQorIyAtICBU
aGUgcHJlY2lzZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBmb3IgY29weWluZywgZGlzdHJpYnV0aW9u
IGFuZAorIyAtbW9kaWZpY2F0aW9uIGZvbGxvdy4gIFBheSBjbG9zZSBhdHRlbnRpb24gdG8gdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiBhCisjIC0id29yayBiYXNlZCBvbiB0aGUgbGlicmFyeSIgYW5k
IGEgIndvcmsgdGhhdCB1c2VzIHRoZSBsaWJyYXJ5Ii4gIFRoZQorIyAtZm9ybWVyIGNvbnRhaW5z
IGNvZGUgZGVyaXZlZCBmcm9tIHRoZSBsaWJyYXJ5LCB3aGVyZWFzIHRoZSBsYXR0ZXIgbXVzdAor
IyAtYmUgY29tYmluZWQgd2l0aCB0aGUgbGlicmFyeSBpbiBvcmRlciB0byBydW4uCisjIC0MCisj
IC0gICAgICAgICAgICAgICAgICBHTlUgTEVTU0VSIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMg
LSAgIFRFUk1TIEFORCBDT05ESVRJT05TIEZPUiBDT1BZSU5HLCBESVNUUklCVVRJT04gQU5EIE1P
RElGSUNBVElPTgorIyAtCisjIC0gIDAuIFRoaXMgTGljZW5zZSBBZ3JlZW1lbnQgYXBwbGllcyB0
byBhbnkgc29mdHdhcmUgbGlicmFyeSBvciBvdGhlcgorIyAtcHJvZ3JhbSB3aGljaCBjb250YWlu
cyBhIG5vdGljZSBwbGFjZWQgYnkgdGhlIGNvcHlyaWdodCBob2xkZXIgb3IKKyMgLW90aGVyIGF1
dGhvcml6ZWQgcGFydHkgc2F5aW5nIGl0IG1heSBiZSBkaXN0cmlidXRlZCB1bmRlciB0aGUgdGVy
bXMgb2YKKyMgLXRoaXMgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgKGFsc28gY2FsbGVk
ICJ0aGlzIExpY2Vuc2UiKS4KKyMgLUVhY2ggbGljZW5zZWUgaXMgYWRkcmVzc2VkIGFzICJ5b3Ui
LgorIyAtCisjIC0gIEEgImxpYnJhcnkiIG1lYW5zIGEgY29sbGVjdGlvbiBvZiBzb2Z0d2FyZSBm
dW5jdGlvbnMgYW5kL29yIGRhdGEKKyMgLXByZXBhcmVkIHNvIGFzIHRvIGJlIGNvbnZlbmllbnRs
eSBsaW5rZWQgd2l0aCBhcHBsaWNhdGlvbiBwcm9ncmFtcworIyAtKHdoaWNoIHVzZSBzb21lIG9m
IHRob3NlIGZ1bmN0aW9ucyBhbmQgZGF0YSkgdG8gZm9ybSBleGVjdXRhYmxlcy4KKyMgLQorIyAt
ICBUaGUgIkxpYnJhcnkiLCBiZWxvdywgcmVmZXJzIHRvIGFueSBzdWNoIHNvZnR3YXJlIGxpYnJh
cnkgb3Igd29yaworIyAtd2hpY2ggaGFzIGJlZW4gZGlzdHJpYnV0ZWQgdW5kZXIgdGhlc2UgdGVy
bXMuICBBICJ3b3JrIGJhc2VkIG9uIHRoZQorIyAtTGlicmFyeSIgbWVhbnMgZWl0aGVyIHRoZSBM
aWJyYXJ5IG9yIGFueSBkZXJpdmF0aXZlIHdvcmsgdW5kZXIKKyMgLWNvcHlyaWdodCBsYXc6IHRo
YXQgaXMgdG8gc2F5LCBhIHdvcmsgY29udGFpbmluZyB0aGUgTGlicmFyeSBvciBhCisjIC1wb3J0
aW9uIG9mIGl0LCBlaXRoZXIgdmVyYmF0aW0gb3Igd2l0aCBtb2RpZmljYXRpb25zIGFuZC9vciB0
cmFuc2xhdGVkCisjIC1zdHJhaWdodGZvcndhcmRseSBpbnRvIGFub3RoZXIgbGFuZ3VhZ2UuICAo
SGVyZWluYWZ0ZXIsIHRyYW5zbGF0aW9uIGlzCisjIC1pbmNsdWRlZCB3aXRob3V0IGxpbWl0YXRp
b24gaW4gdGhlIHRlcm0gIm1vZGlmaWNhdGlvbiIuKQorIyAtCisjIC0gICJTb3VyY2UgY29kZSIg
Zm9yIGEgd29yayBtZWFucyB0aGUgcHJlZmVycmVkIGZvcm0gb2YgdGhlIHdvcmsgZm9yCisjIC1t
YWtpbmcgbW9kaWZpY2F0aW9ucyB0byBpdC4gIEZvciBhIGxpYnJhcnksIGNvbXBsZXRlIHNvdXJj
ZSBjb2RlIG1lYW5zCisjIC1hbGwgdGhlIHNvdXJjZSBjb2RlIGZvciBhbGwgbW9kdWxlcyBpdCBj
b250YWlucywgcGx1cyBhbnkgYXNzb2NpYXRlZAorIyAtaW50ZXJmYWNlIGRlZmluaXRpb24gZmls
ZXMsIHBsdXMgdGhlIHNjcmlwdHMgdXNlZCB0byBjb250cm9sIGNvbXBpbGF0aW9uCisjIC1hbmQg
aW5zdGFsbGF0aW9uIG9mIHRoZSBsaWJyYXJ5LgorIyAtCisjIC0gIEFjdGl2aXRpZXMgb3RoZXIg
dGhhbiBjb3B5aW5nLCBkaXN0cmlidXRpb24gYW5kIG1vZGlmaWNhdGlvbiBhcmUgbm90CisjIC1j
b3ZlcmVkIGJ5IHRoaXMgTGljZW5zZTsgdGhleSBhcmUgb3V0c2lkZSBpdHMgc2NvcGUuICBUaGUg
YWN0IG9mCisjIC1ydW5uaW5nIGEgcHJvZ3JhbSB1c2luZyB0aGUgTGlicmFyeSBpcyBub3QgcmVz
dHJpY3RlZCwgYW5kIG91dHB1dCBmcm9tCisjIC1zdWNoIGEgcHJvZ3JhbSBpcyBjb3ZlcmVkIG9u
bHkgaWYgaXRzIGNvbnRlbnRzIGNvbnN0aXR1dGUgYSB3b3JrIGJhc2VkCisjIC1vbiB0aGUgTGli
cmFyeSAoaW5kZXBlbmRlbnQgb2YgdGhlIHVzZSBvZiB0aGUgTGlicmFyeSBpbiBhIHRvb2wgZm9y
CisjIC13cml0aW5nIGl0KS4gIFdoZXRoZXIgdGhhdCBpcyB0cnVlIGRlcGVuZHMgb24gd2hhdCB0
aGUgTGlicmFyeSBkb2VzCisjIC1hbmQgd2hhdCB0aGUgcHJvZ3JhbSB0aGF0IHVzZXMgdGhlIExp
YnJhcnkgZG9lcy4KKyMgLQorIyAtICAxLiBZb3UgbWF5IGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVy
YmF0aW0gY29waWVzIG9mIHRoZSBMaWJyYXJ5J3MKKyMgLWNvbXBsZXRlIHNvdXJjZSBjb2RlIGFz
IHlvdSByZWNlaXZlIGl0LCBpbiBhbnkgbWVkaXVtLCBwcm92aWRlZCB0aGF0CisjIC15b3UgY29u
c3BpY3VvdXNseSBhbmQgYXBwcm9wcmlhdGVseSBwdWJsaXNoIG9uIGVhY2ggY29weSBhbgorIyAt
YXBwcm9wcmlhdGUgY29weXJpZ2h0IG5vdGljZSBhbmQgZGlzY2xhaW1lciBvZiB3YXJyYW50eTsg
a2VlcCBpbnRhY3QKKyMgLWFsbCB0aGUgbm90aWNlcyB0aGF0IHJlZmVyIHRvIHRoaXMgTGljZW5z
ZSBhbmQgdG8gdGhlIGFic2VuY2Ugb2YgYW55CisjIC13YXJyYW50eTsgYW5kIGRpc3RyaWJ1dGUg
YSBjb3B5IG9mIHRoaXMgTGljZW5zZSBhbG9uZyB3aXRoIHRoZQorIyAtTGlicmFyeS4KKyMgLQor
IyAtICBZb3UgbWF5IGNoYXJnZSBhIGZlZSBmb3IgdGhlIHBoeXNpY2FsIGFjdCBvZiB0cmFuc2Zl
cnJpbmcgYSBjb3B5LAorIyAtYW5kIHlvdSBtYXkgYXQgeW91ciBvcHRpb24gb2ZmZXIgd2FycmFu
dHkgcHJvdGVjdGlvbiBpbiBleGNoYW5nZSBmb3IgYQorIyAtZmVlLgorIyAtDAorIyAtICAyLiBZ
b3UgbWF5IG1vZGlmeSB5b3VyIGNvcHkgb3IgY29waWVzIG9mIHRoZSBMaWJyYXJ5IG9yIGFueSBw
b3J0aW9uCisjIC1vZiBpdCwgdGh1cyBmb3JtaW5nIGEgd29yayBiYXNlZCBvbiB0aGUgTGlicmFy
eSwgYW5kIGNvcHkgYW5kCisjIC1kaXN0cmlidXRlIHN1Y2ggbW9kaWZpY2F0aW9ucyBvciB3b3Jr
IHVuZGVyIHRoZSB0ZXJtcyBvZiBTZWN0aW9uIDEKKyMgLWFib3ZlLCBwcm92aWRlZCB0aGF0IHlv
dSBhbHNvIG1lZXQgYWxsIG9mIHRoZXNlIGNvbmRpdGlvbnM6CisjIC0KKyMgLSAgICBhKSBUaGUg
bW9kaWZpZWQgd29yayBtdXN0IGl0c2VsZiBiZSBhIHNvZnR3YXJlIGxpYnJhcnkuCisjIC0KKyMg
LSAgICBiKSBZb3UgbXVzdCBjYXVzZSB0aGUgZmlsZXMgbW9kaWZpZWQgdG8gY2FycnkgcHJvbWlu
ZW50IG5vdGljZXMKKyMgLSAgICBzdGF0aW5nIHRoYXQgeW91IGNoYW5nZWQgdGhlIGZpbGVzIGFu
ZCB0aGUgZGF0ZSBvZiBhbnkgY2hhbmdlLgorIyAtCisjIC0gICAgYykgWW91IG11c3QgY2F1c2Ug
dGhlIHdob2xlIG9mIHRoZSB3b3JrIHRvIGJlIGxpY2Vuc2VkIGF0IG5vCisjIC0gICAgY2hhcmdl
IHRvIGFsbCB0aGlyZCBwYXJ0aWVzIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGlzIExpY2Vuc2UuCisj
IC0KKyMgLSAgICBkKSBJZiBhIGZhY2lsaXR5IGluIHRoZSBtb2RpZmllZCBMaWJyYXJ5IHJlZmVy
cyB0byBhIGZ1bmN0aW9uIG9yIGEKKyMgLSAgICB0YWJsZSBvZiBkYXRhIHRvIGJlIHN1cHBsaWVk
IGJ5IGFuIGFwcGxpY2F0aW9uIHByb2dyYW0gdGhhdCB1c2VzCisjIC0gICAgdGhlIGZhY2lsaXR5
LCBvdGhlciB0aGFuIGFzIGFuIGFyZ3VtZW50IHBhc3NlZCB3aGVuIHRoZSBmYWNpbGl0eQorIyAt
ICAgIGlzIGludm9rZWQsIHRoZW4geW91IG11c3QgbWFrZSBhIGdvb2QgZmFpdGggZWZmb3J0IHRv
IGVuc3VyZSB0aGF0LAorIyAtICAgIGluIHRoZSBldmVudCBhbiBhcHBsaWNhdGlvbiBkb2VzIG5v
dCBzdXBwbHkgc3VjaCBmdW5jdGlvbiBvcgorIyAtICAgIHRhYmxlLCB0aGUgZmFjaWxpdHkgc3Rp
bGwgb3BlcmF0ZXMsIGFuZCBwZXJmb3JtcyB3aGF0ZXZlciBwYXJ0IG9mCisjIC0gICAgaXRzIHB1
cnBvc2UgcmVtYWlucyBtZWFuaW5nZnVsLgorIyAtCisjIC0gICAgKEZvciBleGFtcGxlLCBhIGZ1
bmN0aW9uIGluIGEgbGlicmFyeSB0byBjb21wdXRlIHNxdWFyZSByb290cyBoYXMKKyMgLSAgICBh
IHB1cnBvc2UgdGhhdCBpcyBlbnRpcmVseSB3ZWxsLWRlZmluZWQgaW5kZXBlbmRlbnQgb2YgdGhl
CisjIC0gICAgYXBwbGljYXRpb24uICBUaGVyZWZvcmUsIFN1YnNlY3Rpb24gMmQgcmVxdWlyZXMg
dGhhdCBhbnkKKyMgLSAgICBhcHBsaWNhdGlvbi1zdXBwbGllZCBmdW5jdGlvbiBvciB0YWJsZSB1
c2VkIGJ5IHRoaXMgZnVuY3Rpb24gbXVzdAorIyAtICAgIGJlIG9wdGlvbmFsOiBpZiB0aGUgYXBw
bGljYXRpb24gZG9lcyBub3Qgc3VwcGx5IGl0LCB0aGUgc3F1YXJlCisjIC0gICAgcm9vdCBmdW5j
dGlvbiBtdXN0IHN0aWxsIGNvbXB1dGUgc3F1YXJlIHJvb3RzLikKKyMgLQorIyAtVGhlc2UgcmVx
dWlyZW1lbnRzIGFwcGx5IHRvIHRoZSBtb2RpZmllZCB3b3JrIGFzIGEgd2hvbGUuICBJZgorIyAt
aWRlbnRpZmlhYmxlIHNlY3Rpb25zIG9mIHRoYXQgd29yayBhcmUgbm90IGRlcml2ZWQgZnJvbSB0
aGUgTGlicmFyeSwKKyMgLWFuZCBjYW4gYmUgcmVhc29uYWJseSBjb25zaWRlcmVkIGluZGVwZW5k
ZW50IGFuZCBzZXBhcmF0ZSB3b3JrcyBpbgorIyAtdGhlbXNlbHZlcywgdGhlbiB0aGlzIExpY2Vu
c2UsIGFuZCBpdHMgdGVybXMsIGRvIG5vdCBhcHBseSB0byB0aG9zZQorIyAtc2VjdGlvbnMgd2hl
biB5b3UgZGlzdHJpYnV0ZSB0aGVtIGFzIHNlcGFyYXRlIHdvcmtzLiAgQnV0IHdoZW4geW91Cisj
IC1kaXN0cmlidXRlIHRoZSBzYW1lIHNlY3Rpb25zIGFzIHBhcnQgb2YgYSB3aG9sZSB3aGljaCBp
cyBhIHdvcmsgYmFzZWQKKyMgLW9uIHRoZSBMaWJyYXJ5LCB0aGUgZGlzdHJpYnV0aW9uIG9mIHRo
ZSB3aG9sZSBtdXN0IGJlIG9uIHRoZSB0ZXJtcyBvZgorIyAtdGhpcyBMaWNlbnNlLCB3aG9zZSBw
ZXJtaXNzaW9ucyBmb3Igb3RoZXIgbGljZW5zZWVzIGV4dGVuZCB0byB0aGUKKyMgLWVudGlyZSB3
aG9sZSwgYW5kIHRodXMgdG8gZWFjaCBhbmQgZXZlcnkgcGFydCByZWdhcmRsZXNzIG9mIHdobyB3
cm90ZQorIyAtaXQuCisjIC0KKyMgLVRodXMsIGl0IGlzIG5vdCB0aGUgaW50ZW50IG9mIHRoaXMg
c2VjdGlvbiB0byBjbGFpbSByaWdodHMgb3IgY29udGVzdAorIyAteW91ciByaWdodHMgdG8gd29y
ayB3cml0dGVuIGVudGlyZWx5IGJ5IHlvdTsgcmF0aGVyLCB0aGUgaW50ZW50IGlzIHRvCisjIC1l
eGVyY2lzZSB0aGUgcmlnaHQgdG8gY29udHJvbCB0aGUgZGlzdHJpYnV0aW9uIG9mIGRlcml2YXRp
dmUgb3IKKyMgLWNvbGxlY3RpdmUgd29ya3MgYmFzZWQgb24gdGhlIExpYnJhcnkuCisjIC0KKyMg
LUluIGFkZGl0aW9uLCBtZXJlIGFnZ3JlZ2F0aW9uIG9mIGFub3RoZXIgd29yayBub3QgYmFzZWQg
b24gdGhlIExpYnJhcnkKKyMgLXdpdGggdGhlIExpYnJhcnkgKG9yIHdpdGggYSB3b3JrIGJhc2Vk
IG9uIHRoZSBMaWJyYXJ5KSBvbiBhIHZvbHVtZSBvZgorIyAtYSBzdG9yYWdlIG9yIGRpc3RyaWJ1
dGlvbiBtZWRpdW0gZG9lcyBub3QgYnJpbmcgdGhlIG90aGVyIHdvcmsgdW5kZXIKKyMgLXRoZSBz
Y29wZSBvZiB0aGlzIExpY2Vuc2UuCisjIC0KKyMgLSAgMy4gWW91IG1heSBvcHQgdG8gYXBwbHkg
dGhlIHRlcm1zIG9mIHRoZSBvcmRpbmFyeSBHTlUgR2VuZXJhbCBQdWJsaWMKKyMgLUxpY2Vuc2Ug
aW5zdGVhZCBvZiB0aGlzIExpY2Vuc2UgdG8gYSBnaXZlbiBjb3B5IG9mIHRoZSBMaWJyYXJ5LiAg
VG8gZG8KKyMgLXRoaXMsIHlvdSBtdXN0IGFsdGVyIGFsbCB0aGUgbm90aWNlcyB0aGF0IHJlZmVy
IHRvIHRoaXMgTGljZW5zZSwgc28KKyMgLXRoYXQgdGhleSByZWZlciB0byB0aGUgb3JkaW5hcnkg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UsIHZlcnNpb24gMiwKKyMgLWluc3RlYWQgb2YgdG8g
dGhpcyBMaWNlbnNlLiAgKElmIGEgbmV3ZXIgdmVyc2lvbiB0aGFuIHZlcnNpb24gMiBvZiB0aGUK
KyMgLW9yZGluYXJ5IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGhhcyBhcHBlYXJlZCwgdGhl
biB5b3UgY2FuIHNwZWNpZnkKKyMgLXRoYXQgdmVyc2lvbiBpbnN0ZWFkIGlmIHlvdSB3aXNoLikg
IERvIG5vdCBtYWtlIGFueSBvdGhlciBjaGFuZ2UgaW4KKyMgLXRoZXNlIG5vdGljZXMuCisjIC0M
CisjIC0gIE9uY2UgdGhpcyBjaGFuZ2UgaXMgbWFkZSBpbiBhIGdpdmVuIGNvcHksIGl0IGlzIGly
cmV2ZXJzaWJsZSBmb3IKKyMgLXRoYXQgY29weSwgc28gdGhlIG9yZGluYXJ5IEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGFwcGxpZXMgdG8gYWxsCisjIC1zdWJzZXF1ZW50IGNvcGllcyBhbmQg
ZGVyaXZhdGl2ZSB3b3JrcyBtYWRlIGZyb20gdGhhdCBjb3B5LgorIyAtCisjIC0gIFRoaXMgb3B0
aW9uIGlzIHVzZWZ1bCB3aGVuIHlvdSB3aXNoIHRvIGNvcHkgcGFydCBvZiB0aGUgY29kZSBvZgor
IyAtdGhlIExpYnJhcnkgaW50byBhIHByb2dyYW0gdGhhdCBpcyBub3QgYSBsaWJyYXJ5LgorIyAt
CisjIC0gIDQuIFlvdSBtYXkgY29weSBhbmQgZGlzdHJpYnV0ZSB0aGUgTGlicmFyeSAob3IgYSBw
b3J0aW9uIG9yCisjIC1kZXJpdmF0aXZlIG9mIGl0LCB1bmRlciBTZWN0aW9uIDIpIGluIG9iamVj
dCBjb2RlIG9yIGV4ZWN1dGFibGUgZm9ybQorIyAtdW5kZXIgdGhlIHRlcm1zIG9mIFNlY3Rpb25z
IDEgYW5kIDIgYWJvdmUgcHJvdmlkZWQgdGhhdCB5b3UgYWNjb21wYW55CisjIC1pdCB3aXRoIHRo
ZSBjb21wbGV0ZSBjb3JyZXNwb25kaW5nIG1hY2hpbmUtcmVhZGFibGUgc291cmNlIGNvZGUsIHdo
aWNoCisjIC1tdXN0IGJlIGRpc3RyaWJ1dGVkIHVuZGVyIHRoZSB0ZXJtcyBvZiBTZWN0aW9ucyAx
IGFuZCAyIGFib3ZlIG9uIGEKKyMgLW1lZGl1bSBjdXN0b21hcmlseSB1c2VkIGZvciBzb2Z0d2Fy
ZSBpbnRlcmNoYW5nZS4KKyMgLQorIyAtICBJZiBkaXN0cmlidXRpb24gb2Ygb2JqZWN0IGNvZGUg
aXMgbWFkZSBieSBvZmZlcmluZyBhY2Nlc3MgdG8gY29weQorIyAtZnJvbSBhIGRlc2lnbmF0ZWQg
cGxhY2UsIHRoZW4gb2ZmZXJpbmcgZXF1aXZhbGVudCBhY2Nlc3MgdG8gY29weSB0aGUKKyMgLXNv
dXJjZSBjb2RlIGZyb20gdGhlIHNhbWUgcGxhY2Ugc2F0aXNmaWVzIHRoZSByZXF1aXJlbWVudCB0
bworIyAtZGlzdHJpYnV0ZSB0aGUgc291cmNlIGNvZGUsIGV2ZW4gdGhvdWdoIHRoaXJkIHBhcnRp
ZXMgYXJlIG5vdAorIyAtY29tcGVsbGVkIHRvIGNvcHkgdGhlIHNvdXJjZSBhbG9uZyB3aXRoIHRo
ZSBvYmplY3QgY29kZS4KKyMgLQorIyAtICA1LiBBIHByb2dyYW0gdGhhdCBjb250YWlucyBubyBk
ZXJpdmF0aXZlIG9mIGFueSBwb3J0aW9uIG9mIHRoZQorIyAtTGlicmFyeSwgYnV0IGlzIGRlc2ln
bmVkIHRvIHdvcmsgd2l0aCB0aGUgTGlicmFyeSBieSBiZWluZyBjb21waWxlZCBvcgorIyAtbGlu
a2VkIHdpdGggaXQsIGlzIGNhbGxlZCBhICJ3b3JrIHRoYXQgdXNlcyB0aGUgTGlicmFyeSIuICBT
dWNoIGEKKyMgLXdvcmssIGluIGlzb2xhdGlvbiwgaXMgbm90IGEgZGVyaXZhdGl2ZSB3b3JrIG9m
IHRoZSBMaWJyYXJ5LCBhbmQKKyMgLXRoZXJlZm9yZSBmYWxscyBvdXRzaWRlIHRoZSBzY29wZSBv
ZiB0aGlzIExpY2Vuc2UuCisjIC0KKyMgLSAgSG93ZXZlciwgbGlua2luZyBhICJ3b3JrIHRoYXQg
dXNlcyB0aGUgTGlicmFyeSIgd2l0aCB0aGUgTGlicmFyeQorIyAtY3JlYXRlcyBhbiBleGVjdXRh
YmxlIHRoYXQgaXMgYSBkZXJpdmF0aXZlIG9mIHRoZSBMaWJyYXJ5IChiZWNhdXNlIGl0CisjIC1j
b250YWlucyBwb3J0aW9ucyBvZiB0aGUgTGlicmFyeSksIHJhdGhlciB0aGFuIGEgIndvcmsgdGhh
dCB1c2VzIHRoZQorIyAtbGlicmFyeSIuICBUaGUgZXhlY3V0YWJsZSBpcyB0aGVyZWZvcmUgY292
ZXJlZCBieSB0aGlzIExpY2Vuc2UuCisjIC1TZWN0aW9uIDYgc3RhdGVzIHRlcm1zIGZvciBkaXN0
cmlidXRpb24gb2Ygc3VjaCBleGVjdXRhYmxlcy4KKyMgLQorIyAtICBXaGVuIGEgIndvcmsgdGhh
dCB1c2VzIHRoZSBMaWJyYXJ5IiB1c2VzIG1hdGVyaWFsIGZyb20gYSBoZWFkZXIgZmlsZQorIyAt
dGhhdCBpcyBwYXJ0IG9mIHRoZSBMaWJyYXJ5LCB0aGUgb2JqZWN0IGNvZGUgZm9yIHRoZSB3b3Jr
IG1heSBiZSBhCisjIC1kZXJpdmF0aXZlIHdvcmsgb2YgdGhlIExpYnJhcnkgZXZlbiB0aG91Z2gg
dGhlIHNvdXJjZSBjb2RlIGlzIG5vdC4KKyMgLVdoZXRoZXIgdGhpcyBpcyB0cnVlIGlzIGVzcGVj
aWFsbHkgc2lnbmlmaWNhbnQgaWYgdGhlIHdvcmsgY2FuIGJlCisjIC1saW5rZWQgd2l0aG91dCB0
aGUgTGlicmFyeSwgb3IgaWYgdGhlIHdvcmsgaXMgaXRzZWxmIGEgbGlicmFyeS4gIFRoZQorIyAt
dGhyZXNob2xkIGZvciB0aGlzIHRvIGJlIHRydWUgaXMgbm90IHByZWNpc2VseSBkZWZpbmVkIGJ5
IGxhdy4KKyMgLQorIyAtICBJZiBzdWNoIGFuIG9iamVjdCBmaWxlIHVzZXMgb25seSBudW1lcmlj
YWwgcGFyYW1ldGVycywgZGF0YQorIyAtc3RydWN0dXJlIGxheW91dHMgYW5kIGFjY2Vzc29ycywg
YW5kIHNtYWxsIG1hY3JvcyBhbmQgc21hbGwgaW5saW5lCisjIC1mdW5jdGlvbnMgKHRlbiBsaW5l
cyBvciBsZXNzIGluIGxlbmd0aCksIHRoZW4gdGhlIHVzZSBvZiB0aGUgb2JqZWN0CisjIC1maWxl
IGlzIHVucmVzdHJpY3RlZCwgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIGl0IGlzIGxlZ2FsbHkgYSBk
ZXJpdmF0aXZlCisjIC13b3JrLiAgKEV4ZWN1dGFibGVzIGNvbnRhaW5pbmcgdGhpcyBvYmplY3Qg
Y29kZSBwbHVzIHBvcnRpb25zIG9mIHRoZQorIyAtTGlicmFyeSB3aWxsIHN0aWxsIGZhbGwgdW5k
ZXIgU2VjdGlvbiA2LikKKyMgLQorIyAtICBPdGhlcndpc2UsIGlmIHRoZSB3b3JrIGlzIGEgZGVy
aXZhdGl2ZSBvZiB0aGUgTGlicmFyeSwgeW91IG1heQorIyAtZGlzdHJpYnV0ZSB0aGUgb2JqZWN0
IGNvZGUgZm9yIHRoZSB3b3JrIHVuZGVyIHRoZSB0ZXJtcyBvZiBTZWN0aW9uIDYuCisjIC1Bbnkg
ZXhlY3V0YWJsZXMgY29udGFpbmluZyB0aGF0IHdvcmsgYWxzbyBmYWxsIHVuZGVyIFNlY3Rpb24g
NiwKKyMgLXdoZXRoZXIgb3Igbm90IHRoZXkgYXJlIGxpbmtlZCBkaXJlY3RseSB3aXRoIHRoZSBM
aWJyYXJ5IGl0c2VsZi4KKyMgLQwKKyMgLSAgNi4gQXMgYW4gZXhjZXB0aW9uIHRvIHRoZSBTZWN0
aW9ucyBhYm92ZSwgeW91IG1heSBhbHNvIGNvbWJpbmUgb3IKKyMgLWxpbmsgYSAid29yayB0aGF0
IHVzZXMgdGhlIExpYnJhcnkiIHdpdGggdGhlIExpYnJhcnkgdG8gcHJvZHVjZSBhCisjIC13b3Jr
IGNvbnRhaW5pbmcgcG9ydGlvbnMgb2YgdGhlIExpYnJhcnksIGFuZCBkaXN0cmlidXRlIHRoYXQg
d29yaworIyAtdW5kZXIgdGVybXMgb2YgeW91ciBjaG9pY2UsIHByb3ZpZGVkIHRoYXQgdGhlIHRl
cm1zIHBlcm1pdAorIyAtbW9kaWZpY2F0aW9uIG9mIHRoZSB3b3JrIGZvciB0aGUgY3VzdG9tZXIn
cyBvd24gdXNlIGFuZCByZXZlcnNlCisjIC1lbmdpbmVlcmluZyBmb3IgZGVidWdnaW5nIHN1Y2gg
bW9kaWZpY2F0aW9ucy4KKyMgLQorIyAtICBZb3UgbXVzdCBnaXZlIHByb21pbmVudCBub3RpY2Ug
d2l0aCBlYWNoIGNvcHkgb2YgdGhlIHdvcmsgdGhhdCB0aGUKKyMgLUxpYnJhcnkgaXMgdXNlZCBp
biBpdCBhbmQgdGhhdCB0aGUgTGlicmFyeSBhbmQgaXRzIHVzZSBhcmUgY292ZXJlZCBieQorIyAt
dGhpcyBMaWNlbnNlLiAgWW91IG11c3Qgc3VwcGx5IGEgY29weSBvZiB0aGlzIExpY2Vuc2UuICBJ
ZiB0aGUgd29yaworIyAtZHVyaW5nIGV4ZWN1dGlvbiBkaXNwbGF5cyBjb3B5cmlnaHQgbm90aWNl
cywgeW91IG11c3QgaW5jbHVkZSB0aGUKKyMgLWNvcHlyaWdodCBub3RpY2UgZm9yIHRoZSBMaWJy
YXJ5IGFtb25nIHRoZW0sIGFzIHdlbGwgYXMgYSByZWZlcmVuY2UKKyMgLWRpcmVjdGluZyB0aGUg
dXNlciB0byB0aGUgY29weSBvZiB0aGlzIExpY2Vuc2UuICBBbHNvLCB5b3UgbXVzdCBkbyBvbmUK
KyMgLW9mIHRoZXNlIHRoaW5nczoKKyMgLQorIyAtICAgIGEpIEFjY29tcGFueSB0aGUgd29yayB3
aXRoIHRoZSBjb21wbGV0ZSBjb3JyZXNwb25kaW5nCisjIC0gICAgbWFjaGluZS1yZWFkYWJsZSBz
b3VyY2UgY29kZSBmb3IgdGhlIExpYnJhcnkgaW5jbHVkaW5nIHdoYXRldmVyCisjIC0gICAgY2hh
bmdlcyB3ZXJlIHVzZWQgaW4gdGhlIHdvcmsgKHdoaWNoIG11c3QgYmUgZGlzdHJpYnV0ZWQgdW5k
ZXIKKyMgLSAgICBTZWN0aW9ucyAxIGFuZCAyIGFib3ZlKTsgYW5kLCBpZiB0aGUgd29yayBpcyBh
biBleGVjdXRhYmxlIGxpbmtlZAorIyAtICAgIHdpdGggdGhlIExpYnJhcnksIHdpdGggdGhlIGNv
bXBsZXRlIG1hY2hpbmUtcmVhZGFibGUgIndvcmsgdGhhdAorIyAtICAgIHVzZXMgdGhlIExpYnJh
cnkiLCBhcyBvYmplY3QgY29kZSBhbmQvb3Igc291cmNlIGNvZGUsIHNvIHRoYXQgdGhlCisjIC0g
ICAgdXNlciBjYW4gbW9kaWZ5IHRoZSBMaWJyYXJ5IGFuZCB0aGVuIHJlbGluayB0byBwcm9kdWNl
IGEgbW9kaWZpZWQKKyMgLSAgICBleGVjdXRhYmxlIGNvbnRhaW5pbmcgdGhlIG1vZGlmaWVkIExp
YnJhcnkuICAoSXQgaXMgdW5kZXJzdG9vZAorIyAtICAgIHRoYXQgdGhlIHVzZXIgd2hvIGNoYW5n
ZXMgdGhlIGNvbnRlbnRzIG9mIGRlZmluaXRpb25zIGZpbGVzIGluIHRoZQorIyAtICAgIExpYnJh
cnkgd2lsbCBub3QgbmVjZXNzYXJpbHkgYmUgYWJsZSB0byByZWNvbXBpbGUgdGhlIGFwcGxpY2F0
aW9uCisjIC0gICAgdG8gdXNlIHRoZSBtb2RpZmllZCBkZWZpbml0aW9ucy4pCisjIC0KKyMgLSAg
ICBiKSBVc2UgYSBzdWl0YWJsZSBzaGFyZWQgbGlicmFyeSBtZWNoYW5pc20gZm9yIGxpbmtpbmcg
d2l0aCB0aGUKKyMgLSAgICBMaWJyYXJ5LiAgQSBzdWl0YWJsZSBtZWNoYW5pc20gaXMgb25lIHRo
YXQgKDEpIHVzZXMgYXQgcnVuIHRpbWUgYQorIyAtICAgIGNvcHkgb2YgdGhlIGxpYnJhcnkgYWxy
ZWFkeSBwcmVzZW50IG9uIHRoZSB1c2VyJ3MgY29tcHV0ZXIgc3lzdGVtLAorIyAtICAgIHJhdGhl
ciB0aGFuIGNvcHlpbmcgbGlicmFyeSBmdW5jdGlvbnMgaW50byB0aGUgZXhlY3V0YWJsZSwgYW5k
ICgyKQorIyAtICAgIHdpbGwgb3BlcmF0ZSBwcm9wZXJseSB3aXRoIGEgbW9kaWZpZWQgdmVyc2lv
biBvZiB0aGUgbGlicmFyeSwgaWYKKyMgLSAgICB0aGUgdXNlciBpbnN0YWxscyBvbmUsIGFzIGxv
bmcgYXMgdGhlIG1vZGlmaWVkIHZlcnNpb24gaXMKKyMgLSAgICBpbnRlcmZhY2UtY29tcGF0aWJs
ZSB3aXRoIHRoZSB2ZXJzaW9uIHRoYXQgdGhlIHdvcmsgd2FzIG1hZGUgd2l0aC4KKyMgLQorIyAt
ICAgIGMpIEFjY29tcGFueSB0aGUgd29yayB3aXRoIGEgd3JpdHRlbiBvZmZlciwgdmFsaWQgZm9y
IGF0CisjIC0gICAgbGVhc3QgdGhyZWUgeWVhcnMsIHRvIGdpdmUgdGhlIHNhbWUgdXNlciB0aGUg
bWF0ZXJpYWxzCisjIC0gICAgc3BlY2lmaWVkIGluIFN1YnNlY3Rpb24gNmEsIGFib3ZlLCBmb3Ig
YSBjaGFyZ2Ugbm8gbW9yZQorIyAtICAgIHRoYW4gdGhlIGNvc3Qgb2YgcGVyZm9ybWluZyB0aGlz
IGRpc3RyaWJ1dGlvbi4KKyMgLQorIyAtICAgIGQpIElmIGRpc3RyaWJ1dGlvbiBvZiB0aGUgd29y
ayBpcyBtYWRlIGJ5IG9mZmVyaW5nIGFjY2VzcyB0byBjb3B5CisjIC0gICAgZnJvbSBhIGRlc2ln
bmF0ZWQgcGxhY2UsIG9mZmVyIGVxdWl2YWxlbnQgYWNjZXNzIHRvIGNvcHkgdGhlIGFib3ZlCisj
IC0gICAgc3BlY2lmaWVkIG1hdGVyaWFscyBmcm9tIHRoZSBzYW1lIHBsYWNlLgorIyAtCisjIC0g
ICAgZSkgVmVyaWZ5IHRoYXQgdGhlIHVzZXIgaGFzIGFscmVhZHkgcmVjZWl2ZWQgYSBjb3B5IG9m
IHRoZXNlCisjIC0gICAgbWF0ZXJpYWxzIG9yIHRoYXQgeW91IGhhdmUgYWxyZWFkeSBzZW50IHRo
aXMgdXNlciBhIGNvcHkuCisjIC0KKyMgLSAgRm9yIGFuIGV4ZWN1dGFibGUsIHRoZSByZXF1aXJl
ZCBmb3JtIG9mIHRoZSAid29yayB0aGF0IHVzZXMgdGhlCisjIC1MaWJyYXJ5IiBtdXN0IGluY2x1
ZGUgYW55IGRhdGEgYW5kIHV0aWxpdHkgcHJvZ3JhbXMgbmVlZGVkIGZvcgorIyAtcmVwcm9kdWNp
bmcgdGhlIGV4ZWN1dGFibGUgZnJvbSBpdC4gIEhvd2V2ZXIsIGFzIGEgc3BlY2lhbCBleGNlcHRp
b24sCisjIC10aGUgbWF0ZXJpYWxzIHRvIGJlIGRpc3RyaWJ1dGVkIG5lZWQgbm90IGluY2x1ZGUg
YW55dGhpbmcgdGhhdCBpcworIyAtbm9ybWFsbHkgZGlzdHJpYnV0ZWQgKGluIGVpdGhlciBzb3Vy
Y2Ugb3IgYmluYXJ5IGZvcm0pIHdpdGggdGhlIG1ham9yCisjIC1jb21wb25lbnRzIChjb21waWxl
ciwga2VybmVsLCBhbmQgc28gb24pIG9mIHRoZSBvcGVyYXRpbmcgc3lzdGVtIG9uCisjIC13aGlj
aCB0aGUgZXhlY3V0YWJsZSBydW5zLCB1bmxlc3MgdGhhdCBjb21wb25lbnQgaXRzZWxmIGFjY29t
cGFuaWVzCisjIC10aGUgZXhlY3V0YWJsZS4KKyMgLQorIyAtICBJdCBtYXkgaGFwcGVuIHRoYXQg
dGhpcyByZXF1aXJlbWVudCBjb250cmFkaWN0cyB0aGUgbGljZW5zZQorIyAtcmVzdHJpY3Rpb25z
IG9mIG90aGVyIHByb3ByaWV0YXJ5IGxpYnJhcmllcyB0aGF0IGRvIG5vdCBub3JtYWxseQorIyAt
YWNjb21wYW55IHRoZSBvcGVyYXRpbmcgc3lzdGVtLiAgU3VjaCBhIGNvbnRyYWRpY3Rpb24gbWVh
bnMgeW91IGNhbm5vdAorIyAtdXNlIGJvdGggdGhlbSBhbmQgdGhlIExpYnJhcnkgdG9nZXRoZXIg
aW4gYW4gZXhlY3V0YWJsZSB0aGF0IHlvdQorIyAtZGlzdHJpYnV0ZS4KKyMgLQwKKyMgLSAgNy4g
WW91IG1heSBwbGFjZSBsaWJyYXJ5IGZhY2lsaXRpZXMgdGhhdCBhcmUgYSB3b3JrIGJhc2VkIG9u
IHRoZQorIyAtTGlicmFyeSBzaWRlLWJ5LXNpZGUgaW4gYSBzaW5nbGUgbGlicmFyeSB0b2dldGhl
ciB3aXRoIG90aGVyIGxpYnJhcnkKKyMgLWZhY2lsaXRpZXMgbm90IGNvdmVyZWQgYnkgdGhpcyBM
aWNlbnNlLCBhbmQgZGlzdHJpYnV0ZSBzdWNoIGEgY29tYmluZWQKKyMgLWxpYnJhcnksIHByb3Zp
ZGVkIHRoYXQgdGhlIHNlcGFyYXRlIGRpc3RyaWJ1dGlvbiBvZiB0aGUgd29yayBiYXNlZCBvbgor
IyAtdGhlIExpYnJhcnkgYW5kIG9mIHRoZSBvdGhlciBsaWJyYXJ5IGZhY2lsaXRpZXMgaXMgb3Ro
ZXJ3aXNlCisjIC1wZXJtaXR0ZWQsIGFuZCBwcm92aWRlZCB0aGF0IHlvdSBkbyB0aGVzZSB0d28g
dGhpbmdzOgorIyAtCisjIC0gICAgYSkgQWNjb21wYW55IHRoZSBjb21iaW5lZCBsaWJyYXJ5IHdp
dGggYSBjb3B5IG9mIHRoZSBzYW1lIHdvcmsKKyMgLSAgICBiYXNlZCBvbiB0aGUgTGlicmFyeSwg
dW5jb21iaW5lZCB3aXRoIGFueSBvdGhlciBsaWJyYXJ5CisjIC0gICAgZmFjaWxpdGllcy4gIFRo
aXMgbXVzdCBiZSBkaXN0cmlidXRlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlCisjIC0gICAgU2Vj
dGlvbnMgYWJvdmUuCisjIC0KKyMgLSAgICBiKSBHaXZlIHByb21pbmVudCBub3RpY2Ugd2l0aCB0
aGUgY29tYmluZWQgbGlicmFyeSBvZiB0aGUgZmFjdAorIyAtICAgIHRoYXQgcGFydCBvZiBpdCBp
cyBhIHdvcmsgYmFzZWQgb24gdGhlIExpYnJhcnksIGFuZCBleHBsYWluaW5nCisjIC0gICAgd2hl
cmUgdG8gZmluZCB0aGUgYWNjb21wYW55aW5nIHVuY29tYmluZWQgZm9ybSBvZiB0aGUgc2FtZSB3
b3JrLgorIyAtCisjIC0gIDguIFlvdSBtYXkgbm90IGNvcHksIG1vZGlmeSwgc3VibGljZW5zZSwg
bGluayB3aXRoLCBvciBkaXN0cmlidXRlCisjIC10aGUgTGlicmFyeSBleGNlcHQgYXMgZXhwcmVz
c2x5IHByb3ZpZGVkIHVuZGVyIHRoaXMgTGljZW5zZS4gIEFueQorIyAtYXR0ZW1wdCBvdGhlcndp
c2UgdG8gY29weSwgbW9kaWZ5LCBzdWJsaWNlbnNlLCBsaW5rIHdpdGgsIG9yCisjIC1kaXN0cmli
dXRlIHRoZSBMaWJyYXJ5IGlzIHZvaWQsIGFuZCB3aWxsIGF1dG9tYXRpY2FsbHkgdGVybWluYXRl
IHlvdXIKKyMgLXJpZ2h0cyB1bmRlciB0aGlzIExpY2Vuc2UuICBIb3dldmVyLCBwYXJ0aWVzIHdo
byBoYXZlIHJlY2VpdmVkIGNvcGllcywKKyMgLW9yIHJpZ2h0cywgZnJvbSB5b3UgdW5kZXIgdGhp
cyBMaWNlbnNlIHdpbGwgbm90IGhhdmUgdGhlaXIgbGljZW5zZXMKKyMgLXRlcm1pbmF0ZWQgc28g
bG9uZyBhcyBzdWNoIHBhcnRpZXMgcmVtYWluIGluIGZ1bGwgY29tcGxpYW5jZS4KKyMgLQorIyAt
ICA5LiBZb3UgYXJlIG5vdCByZXF1aXJlZCB0byBhY2NlcHQgdGhpcyBMaWNlbnNlLCBzaW5jZSB5
b3UgaGF2ZSBub3QKKyMgLXNpZ25lZCBpdC4gIEhvd2V2ZXIsIG5vdGhpbmcgZWxzZSBncmFudHMg
eW91IHBlcm1pc3Npb24gdG8gbW9kaWZ5IG9yCisjIC1kaXN0cmlidXRlIHRoZSBMaWJyYXJ5IG9y
IGl0cyBkZXJpdmF0aXZlIHdvcmtzLiAgVGhlc2UgYWN0aW9ucyBhcmUKKyMgLXByb2hpYml0ZWQg
YnkgbGF3IGlmIHlvdSBkbyBub3QgYWNjZXB0IHRoaXMgTGljZW5zZS4gIFRoZXJlZm9yZSwgYnkK
KyMgLW1vZGlmeWluZyBvciBkaXN0cmlidXRpbmcgdGhlIExpYnJhcnkgKG9yIGFueSB3b3JrIGJh
c2VkIG9uIHRoZQorIyAtTGlicmFyeSksIHlvdSBpbmRpY2F0ZSB5b3VyIGFjY2VwdGFuY2Ugb2Yg
dGhpcyBMaWNlbnNlIHRvIGRvIHNvLCBhbmQKKyMgLWFsbCBpdHMgdGVybXMgYW5kIGNvbmRpdGlv
bnMgZm9yIGNvcHlpbmcsIGRpc3RyaWJ1dGluZyBvciBtb2RpZnlpbmcKKyMgLXRoZSBMaWJyYXJ5
IG9yIHdvcmtzIGJhc2VkIG9uIGl0LgorIyAtCisjIC0gIDEwLiBFYWNoIHRpbWUgeW91IHJlZGlz
dHJpYnV0ZSB0aGUgTGlicmFyeSAob3IgYW55IHdvcmsgYmFzZWQgb24gdGhlCisjIC1MaWJyYXJ5
KSwgdGhlIHJlY2lwaWVudCBhdXRvbWF0aWNhbGx5IHJlY2VpdmVzIGEgbGljZW5zZSBmcm9tIHRo
ZQorIyAtb3JpZ2luYWwgbGljZW5zb3IgdG8gY29weSwgZGlzdHJpYnV0ZSwgbGluayB3aXRoIG9y
IG1vZGlmeSB0aGUgTGlicmFyeQorIyAtc3ViamVjdCB0byB0aGVzZSB0ZXJtcyBhbmQgY29uZGl0
aW9ucy4gIFlvdSBtYXkgbm90IGltcG9zZSBhbnkgZnVydGhlcgorIyAtcmVzdHJpY3Rpb25zIG9u
IHRoZSByZWNpcGllbnRzJyBleGVyY2lzZSBvZiB0aGUgcmlnaHRzIGdyYW50ZWQgaGVyZWluLgor
IyAtWW91IGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGVuZm9yY2luZyBjb21wbGlhbmNlIGJ5IHRo
aXJkIHBhcnRpZXMgd2l0aAorIyAtdGhpcyBMaWNlbnNlLgorIyAtDAorIyAtICAxMS4gSWYsIGFz
IGEgY29uc2VxdWVuY2Ugb2YgYSBjb3VydCBqdWRnbWVudCBvciBhbGxlZ2F0aW9uIG9mIHBhdGVu
dAorIyAtaW5mcmluZ2VtZW50IG9yIGZvciBhbnkgb3RoZXIgcmVhc29uIChub3QgbGltaXRlZCB0
byBwYXRlbnQgaXNzdWVzKSwKKyMgLWNvbmRpdGlvbnMgYXJlIGltcG9zZWQgb24geW91ICh3aGV0
aGVyIGJ5IGNvdXJ0IG9yZGVyLCBhZ3JlZW1lbnQgb3IKKyMgLW90aGVyd2lzZSkgdGhhdCBjb250
cmFkaWN0IHRoZSBjb25kaXRpb25zIG9mIHRoaXMgTGljZW5zZSwgdGhleSBkbyBub3QKKyMgLWV4
Y3VzZSB5b3UgZnJvbSB0aGUgY29uZGl0aW9ucyBvZiB0aGlzIExpY2Vuc2UuICBJZiB5b3UgY2Fu
bm90CisjIC1kaXN0cmlidXRlIHNvIGFzIHRvIHNhdGlzZnkgc2ltdWx0YW5lb3VzbHkgeW91ciBv
YmxpZ2F0aW9ucyB1bmRlciB0aGlzCisjIC1MaWNlbnNlIGFuZCBhbnkgb3RoZXIgcGVydGluZW50
IG9ibGlnYXRpb25zLCB0aGVuIGFzIGEgY29uc2VxdWVuY2UgeW91CisjIC1tYXkgbm90IGRpc3Ry
aWJ1dGUgdGhlIExpYnJhcnkgYXQgYWxsLiAgRm9yIGV4YW1wbGUsIGlmIGEgcGF0ZW50CisjIC1s
aWNlbnNlIHdvdWxkIG5vdCBwZXJtaXQgcm95YWx0eS1mcmVlIHJlZGlzdHJpYnV0aW9uIG9mIHRo
ZSBMaWJyYXJ5IGJ5CisjIC1hbGwgdGhvc2Ugd2hvIHJlY2VpdmUgY29waWVzIGRpcmVjdGx5IG9y
IGluZGlyZWN0bHkgdGhyb3VnaCB5b3UsIHRoZW4KKyMgLXRoZSBvbmx5IHdheSB5b3UgY291bGQg
c2F0aXNmeSBib3RoIGl0IGFuZCB0aGlzIExpY2Vuc2Ugd291bGQgYmUgdG8KKyMgLXJlZnJhaW4g
ZW50aXJlbHkgZnJvbSBkaXN0cmlidXRpb24gb2YgdGhlIExpYnJhcnkuCisjIC0KKyMgLUlmIGFu
eSBwb3J0aW9uIG9mIHRoaXMgc2VjdGlvbiBpcyBoZWxkIGludmFsaWQgb3IgdW5lbmZvcmNlYWJs
ZSB1bmRlciBhbnkKKyMgLXBhcnRpY3VsYXIgY2lyY3Vtc3RhbmNlLCB0aGUgYmFsYW5jZSBvZiB0
aGUgc2VjdGlvbiBpcyBpbnRlbmRlZCB0byBhcHBseSwKKyMgLWFuZCB0aGUgc2VjdGlvbiBhcyBh
IHdob2xlIGlzIGludGVuZGVkIHRvIGFwcGx5IGluIG90aGVyIGNpcmN1bXN0YW5jZXMuCisjIC0K
KyMgLUl0IGlzIG5vdCB0aGUgcHVycG9zZSBvZiB0aGlzIHNlY3Rpb24gdG8gaW5kdWNlIHlvdSB0
byBpbmZyaW5nZSBhbnkKKyMgLXBhdGVudHMgb3Igb3RoZXIgcHJvcGVydHkgcmlnaHQgY2xhaW1z
IG9yIHRvIGNvbnRlc3QgdmFsaWRpdHkgb2YgYW55CisjIC1zdWNoIGNsYWltczsgdGhpcyBzZWN0
aW9uIGhhcyB0aGUgc29sZSBwdXJwb3NlIG9mIHByb3RlY3RpbmcgdGhlCisjIC1pbnRlZ3JpdHkg
b2YgdGhlIGZyZWUgc29mdHdhcmUgZGlzdHJpYnV0aW9uIHN5c3RlbSB3aGljaCBpcworIyAtaW1w
bGVtZW50ZWQgYnkgcHVibGljIGxpY2Vuc2UgcHJhY3RpY2VzLiAgTWFueSBwZW9wbGUgaGF2ZSBt
YWRlCisjIC1nZW5lcm91cyBjb250cmlidXRpb25zIHRvIHRoZSB3aWRlIHJhbmdlIG9mIHNvZnR3
YXJlIGRpc3RyaWJ1dGVkCisjIC10aHJvdWdoIHRoYXQgc3lzdGVtIGluIHJlbGlhbmNlIG9uIGNv
bnNpc3RlbnQgYXBwbGljYXRpb24gb2YgdGhhdAorIyAtc3lzdGVtOyBpdCBpcyB1cCB0byB0aGUg
YXV0aG9yL2Rvbm9yIHRvIGRlY2lkZSBpZiBoZSBvciBzaGUgaXMgd2lsbGluZworIyAtdG8gZGlz
dHJpYnV0ZSBzb2Z0d2FyZSB0aHJvdWdoIGFueSBvdGhlciBzeXN0ZW0gYW5kIGEgbGljZW5zZWUg
Y2Fubm90CisjIC1pbXBvc2UgdGhhdCBjaG9pY2UuCisjIC0KKyMgLVRoaXMgc2VjdGlvbiBpcyBp
bnRlbmRlZCB0byBtYWtlIHRob3JvdWdobHkgY2xlYXIgd2hhdCBpcyBiZWxpZXZlZCB0bworIyAt
YmUgYSBjb25zZXF1ZW5jZSBvZiB0aGUgcmVzdCBvZiB0aGlzIExpY2Vuc2UuCisjIC0KKyMgLSAg
MTIuIElmIHRoZSBkaXN0cmlidXRpb24gYW5kL29yIHVzZSBvZiB0aGUgTGlicmFyeSBpcyByZXN0
cmljdGVkIGluCisjIC1jZXJ0YWluIGNvdW50cmllcyBlaXRoZXIgYnkgcGF0ZW50cyBvciBieSBj
b3B5cmlnaHRlZCBpbnRlcmZhY2VzLCB0aGUKKyMgLW9yaWdpbmFsIGNvcHlyaWdodCBob2xkZXIg
d2hvIHBsYWNlcyB0aGUgTGlicmFyeSB1bmRlciB0aGlzIExpY2Vuc2UgbWF5IGFkZAorIyAtYW4g
ZXhwbGljaXQgZ2VvZ3JhcGhpY2FsIGRpc3RyaWJ1dGlvbiBsaW1pdGF0aW9uIGV4Y2x1ZGluZyB0
aG9zZSBjb3VudHJpZXMsCisjIC1zbyB0aGF0IGRpc3RyaWJ1dGlvbiBpcyBwZXJtaXR0ZWQgb25s
eSBpbiBvciBhbW9uZyBjb3VudHJpZXMgbm90IHRodXMKKyMgLWV4Y2x1ZGVkLiAgSW4gc3VjaCBj
YXNlLCB0aGlzIExpY2Vuc2UgaW5jb3Jwb3JhdGVzIHRoZSBsaW1pdGF0aW9uIGFzIGlmCisjIC13
cml0dGVuIGluIHRoZSBib2R5IG9mIHRoaXMgTGljZW5zZS4KKyMgLQorIyAtICAxMy4gVGhlIEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbiBtYXkgcHVibGlzaCByZXZpc2VkIGFuZC9vciBuZXcKKyMg
LXZlcnNpb25zIG9mIHRoZSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmcm9tIHRpbWUg
dG8gdGltZS4KKyMgLVN1Y2ggbmV3IHZlcnNpb25zIHdpbGwgYmUgc2ltaWxhciBpbiBzcGlyaXQg
dG8gdGhlIHByZXNlbnQgdmVyc2lvbiwKKyMgLWJ1dCBtYXkgZGlmZmVyIGluIGRldGFpbCB0byBh
ZGRyZXNzIG5ldyBwcm9ibGVtcyBvciBjb25jZXJucy4KKyMgLQorIyAtRWFjaCB2ZXJzaW9uIGlz
IGdpdmVuIGEgZGlzdGluZ3Vpc2hpbmcgdmVyc2lvbiBudW1iZXIuICBJZiB0aGUgTGlicmFyeQor
IyAtc3BlY2lmaWVzIGEgdmVyc2lvbiBudW1iZXIgb2YgdGhpcyBMaWNlbnNlIHdoaWNoIGFwcGxp
ZXMgdG8gaXQgYW5kCisjIC0iYW55IGxhdGVyIHZlcnNpb24iLCB5b3UgaGF2ZSB0aGUgb3B0aW9u
IG9mIGZvbGxvd2luZyB0aGUgdGVybXMgYW5kCisjIC1jb25kaXRpb25zIGVpdGhlciBvZiB0aGF0
IHZlcnNpb24gb3Igb2YgYW55IGxhdGVyIHZlcnNpb24gcHVibGlzaGVkIGJ5CisjIC10aGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLiAgSWYgdGhlIExpYnJhcnkgZG9lcyBub3Qgc3BlY2lmeSBh
CisjIC1saWNlbnNlIHZlcnNpb24gbnVtYmVyLCB5b3UgbWF5IGNob29zZSBhbnkgdmVyc2lvbiBl
dmVyIHB1Ymxpc2hlZCBieQorIyAtdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4KKyMgLQwK
KyMgLSAgMTQuIElmIHlvdSB3aXNoIHRvIGluY29ycG9yYXRlIHBhcnRzIG9mIHRoZSBMaWJyYXJ5
IGludG8gb3RoZXIgZnJlZQorIyAtcHJvZ3JhbXMgd2hvc2UgZGlzdHJpYnV0aW9uIGNvbmRpdGlv
bnMgYXJlIGluY29tcGF0aWJsZSB3aXRoIHRoZXNlLAorIyAtd3JpdGUgdG8gdGhlIGF1dGhvciB0
byBhc2sgZm9yIHBlcm1pc3Npb24uICBGb3Igc29mdHdhcmUgd2hpY2ggaXMKKyMgLWNvcHlyaWdo
dGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIHdyaXRlIHRvIHRoZSBGcmVlCisj
IC1Tb2Z0d2FyZSBGb3VuZGF0aW9uOyB3ZSBzb21ldGltZXMgbWFrZSBleGNlcHRpb25zIGZvciB0
aGlzLiAgT3VyCisjIC1kZWNpc2lvbiB3aWxsIGJlIGd1aWRlZCBieSB0aGUgdHdvIGdvYWxzIG9m
IHByZXNlcnZpbmcgdGhlIGZyZWUgc3RhdHVzCisjIC1vZiBhbGwgZGVyaXZhdGl2ZXMgb2Ygb3Vy
IGZyZWUgc29mdHdhcmUgYW5kIG9mIHByb21vdGluZyB0aGUgc2hhcmluZworIyAtYW5kIHJldXNl
IG9mIHNvZnR3YXJlIGdlbmVyYWxseS4KKyMgLQorIyAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIE5PIFdBUlJBTlRZCisjIC0KKyMgLSAgMTUuIEJFQ0FVU0UgVEhFIExJQlJBUlkgSVMgTElD
RU5TRUQgRlJFRSBPRiBDSEFSR0UsIFRIRVJFIElTIE5PCisjIC1XQVJSQU5UWSBGT1IgVEhFIExJ
QlJBUlksIFRPIFRIRSBFWFRFTlQgUEVSTUlUVEVEIEJZIEFQUExJQ0FCTEUgTEFXLgorIyAtRVhD
RVBUIFdIRU4gT1RIRVJXSVNFIFNUQVRFRCBJTiBXUklUSU5HIFRIRSBDT1BZUklHSFQgSE9MREVS
UyBBTkQvT1IKKyMgLU9USEVSIFBBUlRJRVMgUFJPVklERSBUSEUgTElCUkFSWSAiQVMgSVMiIFdJ
VEhPVVQgV0FSUkFOVFkgT0YgQU5ZCisjIC1LSU5ELCBFSVRIRVIgRVhQUkVTU0VEIE9SIElNUExJ
RUQsIElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUKKyMgLUlNUExJRUQgV0FSUkFO
VElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUgorIyAt
UFVSUE9TRS4gIFRIRSBFTlRJUkUgUklTSyBBUyBUTyBUSEUgUVVBTElUWSBBTkQgUEVSRk9STUFO
Q0UgT0YgVEhFCisjIC1MSUJSQVJZIElTIFdJVEggWU9VLiAgU0hPVUxEIFRIRSBMSUJSQVJZIFBS
T1ZFIERFRkVDVElWRSwgWU9VIEFTU1VNRQorIyAtVEhFIENPU1QgT0YgQUxMIE5FQ0VTU0FSWSBT
RVJWSUNJTkcsIFJFUEFJUiBPUiBDT1JSRUNUSU9OLgorIyAtCisjIC0gIDE2LiBJTiBOTyBFVkVO
VCBVTkxFU1MgUkVRVUlSRUQgQlkgQVBQTElDQUJMRSBMQVcgT1IgQUdSRUVEIFRPIElOCisjIC1X
UklUSU5HIFdJTEwgQU5ZIENPUFlSSUdIVCBIT0xERVIsIE9SIEFOWSBPVEhFUiBQQVJUWSBXSE8g
TUFZIE1PRElGWQorIyAtQU5EL09SIFJFRElTVFJJQlVURSBUSEUgTElCUkFSWSBBUyBQRVJNSVRU
RUQgQUJPVkUsIEJFIExJQUJMRSBUTyBZT1UKKyMgLUZPUiBEQU1BR0VTLCBJTkNMVURJTkcgQU5Z
IEdFTkVSQUwsIFNQRUNJQUwsIElOQ0lERU5UQUwgT1IKKyMgLUNPTlNFUVVFTlRJQUwgREFNQUdF
UyBBUklTSU5HIE9VVCBPRiBUSEUgVVNFIE9SIElOQUJJTElUWSBUTyBVU0UgVEhFCisjIC1MSUJS
QVJZIChJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIExPU1MgT0YgREFUQSBPUiBEQVRBIEJF
SU5HCisjIC1SRU5ERVJFRCBJTkFDQ1VSQVRFIE9SIExPU1NFUyBTVVNUQUlORUQgQlkgWU9VIE9S
IFRISVJEIFBBUlRJRVMgT1IgQQorIyAtRkFJTFVSRSBPRiBUSEUgTElCUkFSWSBUTyBPUEVSQVRF
IFdJVEggQU5ZIE9USEVSIFNPRlRXQVJFKSwgRVZFTiBJRgorIyAtU1VDSCBIT0xERVIgT1IgT1RI
RVIgUEFSVFkgSEFTIEJFRU4gQURWSVNFRCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YgU1VDSAorIyAt
REFNQUdFUy4KKyMgLQorIyAtICAgICAgICAgICAgICAgICAgICAgRU5EIE9GIFRFUk1TIEFORCBD
T05ESVRJT05TCisjIC0MCisjIC0gICAgICAgICAgIEhvdyB0byBBcHBseSBUaGVzZSBUZXJtcyB0
byBZb3VyIE5ldyBMaWJyYXJpZXMKKyMgLQorIyAtICBJZiB5b3UgZGV2ZWxvcCBhIG5ldyBsaWJy
YXJ5LCBhbmQgeW91IHdhbnQgaXQgdG8gYmUgb2YgdGhlIGdyZWF0ZXN0CisjIC1wb3NzaWJsZSB1
c2UgdG8gdGhlIHB1YmxpYywgd2UgcmVjb21tZW5kIG1ha2luZyBpdCBmcmVlIHNvZnR3YXJlIHRo
YXQKKyMgLWV2ZXJ5b25lIGNhbiByZWRpc3RyaWJ1dGUgYW5kIGNoYW5nZS4gIFlvdSBjYW4gZG8g
c28gYnkgcGVybWl0dGluZworIyAtcmVkaXN0cmlidXRpb24gdW5kZXIgdGhlc2UgdGVybXMgKG9y
LCBhbHRlcm5hdGl2ZWx5LCB1bmRlciB0aGUgdGVybXMgb2YgdGhlCisjIC1vcmRpbmFyeSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlKS4KKyMgLQorIyAtICBUbyBhcHBseSB0aGVzZSB0ZXJtcywgYXR0
YWNoIHRoZSBmb2xsb3dpbmcgbm90aWNlcyB0byB0aGUgbGlicmFyeS4gIEl0IGlzCisjIC1zYWZl
c3QgdG8gYXR0YWNoIHRoZW0gdG8gdGhlIHN0YXJ0IG9mIGVhY2ggc291cmNlIGZpbGUgdG8gbW9z
dCBlZmZlY3RpdmVseQorIyAtY29udmV5IHRoZSBleGNsdXNpb24gb2Ygd2FycmFudHk7IGFuZCBl
YWNoIGZpbGUgc2hvdWxkIGhhdmUgYXQgbGVhc3QgdGhlCisjIC0iY29weXJpZ2h0IiBsaW5lIGFu
ZCBhIHBvaW50ZXIgdG8gd2hlcmUgdGhlIGZ1bGwgbm90aWNlIGlzIGZvdW5kLgorIyAtCisjIC0g
ICAgPG9uZSBsaW5lIHRvIGdpdmUgdGhlIGxpYnJhcnkncyBuYW1lIGFuZCBhIGJyaWVmIGlkZWEg
b2Ygd2hhdCBpdCBkb2VzLj4KKyMgLSAgICBDb3B5cmlnaHQgKEMpIDx5ZWFyPiAgPG5hbWUgb2Yg
YXV0aG9yPgorIyAtCisjIC0gICAgVGhpcyBsaWJyYXJ5IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgorIyAtICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVy
bXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyMgLSAgICBMaWNlbnNlIGFzIHB1
Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIKKyMgLSAgICB2
ZXJzaW9uIDIuMSBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIg
dmVyc2lvbi4KKyMgLQorIyAtICAgIFRoaXMgbGlicmFyeSBpcyBkaXN0cmlidXRlZCBpbiB0aGUg
aG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorIyAtICAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJS
QU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisjIC0gICAgTUVSQ0hB
TlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBH
TlUKKyMgLSAgICBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxz
LgorIyAtCisjIC0gICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05V
IExlc3NlciBHZW5lcmFsIFB1YmxpYworIyAtICAgIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGlzIGxp
YnJhcnk7IGlmIG5vdCwgc2VlIDxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisjIC0K
KyMgLUFsc28gYWRkIGluZm9ybWF0aW9uIG9uIGhvdyB0byBjb250YWN0IHlvdSBieSBlbGVjdHJv
bmljIGFuZCBwYXBlciBtYWlsLgorIyAtCisjIC1Zb3Ugc2hvdWxkIGFsc28gZ2V0IHlvdXIgZW1w
bG95ZXIgKGlmIHlvdSB3b3JrIGFzIGEgcHJvZ3JhbW1lcikgb3IgeW91cgorIyAtc2Nob29sLCBp
ZiBhbnksIHRvIHNpZ24gYSAiY29weXJpZ2h0IGRpc2NsYWltZXIiIGZvciB0aGUgbGlicmFyeSwg
aWYKKyMgLW5lY2Vzc2FyeS4gIEhlcmUgaXMgYSBzYW1wbGU7IGFsdGVyIHRoZSBuYW1lczoKKyMg
LQorIyAtICBZb3lvZHluZSwgSW5jLiwgaGVyZWJ5IGRpc2NsYWltcyBhbGwgY29weXJpZ2h0IGlu
dGVyZXN0IGluIHRoZQorIyAtICBsaWJyYXJ5IGBGcm9iJyAoYSBsaWJyYXJ5IGZvciB0d2Vha2lu
ZyBrbm9icykgd3JpdHRlbiBieSBKYW1lcyBSYW5kb20gSGFja2VyLgorIyAtCisjIC0gIDxzaWdu
YXR1cmUgb2YgTW9lIEdob3VsPiwgMSBBcHJpbCAxOTkwCisjIC0gIE1vZSBHaG91bCwgUHJlc2lk
ZW50IG9mIFZpY2UKKyMgLQorIyAtVGhhdCdzIGFsbCB0aGVyZSBpcyB0byBpdCEKKyMgK1RIRSBT
T0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiIEFORCBUSEUgQVVUSE9SIERJU0NMQUlNUyBBTEwg
V0FSUkFOVElFUyBXSVRICisjICtSRUdBUkQgVE8gVEhJUyBTT0ZUV0FSRSBJTkNMVURJTkcgQUxM
IElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5ECisjICtGSVRORVNTLiBJ
TiBOTyBFVkVOVCBTSEFMTCBUSEUgQVVUSE9SIEJFIExJQUJMRSBGT1IgQU5ZIFNQRUNJQUwsIERJ
UkVDVCwKKyMgK0lORElSRUNULCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMgT1IgQU5ZIERBTUFH
RVMgV0hBVFNPRVZFUiBSRVNVTFRJTkcgRlJPTSBMT1NTCisjICtPRiBVU0UsIERBVEEgT1IgUFJP
RklUUywgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIE5FR0xJR0VOQ0UgT1IgT1RI
RVIKKyMgK1RPUlRJT1VTIEFDVElPTiwgQVJJU0lORyBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBX
SVRIIFRIRSBVU0UgT1IgUEVSRk9STUFOQ0UgT0YKKyMgK1RISVMgU09GVFdBUkUuCisjIAorIwor
CitTVU1NQVJZID0gIlVuaXZlcnNhbCBlbmNvZGluZyBkZXRlY3RvciBmb3IgUHl0aG9uIDIgYW5k
IDMiCitIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvY2hhcmRldC8iCitMSUNF
TlNFID0gIkxHUEwtMi4xLW9ubHkiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT1iZDA3NTNiOWRjMTJlNWUzZGEzMDQ3Nzc4ZmNmMWRjYSIKKworU1JDX1VSSVtzaGEyNTZz
dW1dID0gImNjMWQ0ZWI5MmE0ZWMxYzJkZjNiNDkwODM2ZmZhNDY5MjJlNTk5ZDM0Y2UwYmI3NWNm
NDFmZDJiZjYzMDNkNTYiCisKK2luaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCisKK0RFUEVO
RFMgKz0gInB5dGhvbjMtaGF0Y2gtdmNzLW5hdGl2ZSIKKworUEFDS0FHRVMgPSsgIiR7UE59LWNs
aSIKK0ZJTEVTOiR7UE59LWNsaSArPSAiIFwKKyAgICAke1BZVEhPTl9TSVRFUEFDS0FHRVNfRElS
fS9jaGFyZGV0L2NsaSBcCisiCisKK1JERVBFTkRTOiR7UE59LWNsaSA9ICIke1BOfSAiCisKK1JE
RVBFTkRTOiR7UE59OmNsYXNzLXRhcmdldCArPSAiIFwKKyAgICBweXRob24zLWxvZ2dpbmcgXAor
IgorCitCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0tIAoyLjQ3LjEKCg==

--===============0857580397660430874==--

