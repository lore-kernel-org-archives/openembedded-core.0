Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1B4F55128
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28805.1773582117745829352
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mIMweYqb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zecTPupd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019cf1bb6855-02d393ed-74cb-4042-9cf5-cc274c424afe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z8d+IfGn2Nove1vd15NsD7KIw+HJcX5qccUDaVmBgio=;
	b=mIMweYqbCdhr+MvGkU6iLBEhCwL38EXsNjJm0PzFR0Md9F2HO/d8k/4FP4XI8le3
	TmV1c/wNMi72h5GqXLn2cOMGCAPiU+RDK1WW4NvT+ECO+O3qMGShEt2EWPA3Xlim8bR
	yUyc8dIHqEwX/vS/D+m1Mb7Z1aAF8J9ZuDOc4Zio=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z8d+IfGn2Nove1vd15NsD7KIw+HJcX5qccUDaVmBgio=;
	b=zecTPupdqTbDrygpNgAWkgR5kqltU/gN50X1F8Qu1u/xhSwX/ZJw0kISEoiofrn6
	6U/DKqqaTezgdzCQDvubntxh5O8AZlRJ9cdmAVqFcbWRbWYraEy/4Rn6gVwFL2T2Tc3
	YF94Zv7QyvGL9JxQshNQrJ4u9Jx/K2s2RnDIxVug=
Content-Type: multipart/mixed; boundary="===============1303141208908419133=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-chardet: upgrading to 7.1.0 FAILED
Message-ID: <0101019cf1bb6855-02d393ed-74cb-4042-9cf5-cc274c424afe-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233147

--===============1303141208908419133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-chardet* to *7.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-chardet-upgrade-5.2.0-7.1.0.patch
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
From a8818d523f8759a65d535ac5b3fd3010ba04220e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 07:39:17 +0000
Subject: [PATCH] python3-chardet: upgrade 5.2.0 -> 7.1.0

---
 .../python/python3-chardet_5.2.0.bb           |  21 -
 .../python/python3-chardet_7.1.0.bb           | 554 ++++++++++++++++++
 2 files changed, 554 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-chardet_5.2.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-chardet_7.1.0.bb

diff --git a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb b/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
deleted file mode 100644
index 9acbeeb3f2..0000000000
--- a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Universal encoding detector for Python 2 and 3"
-HOMEPAGE = "https://pypi.org/project/chardet/"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI[sha256sum] = "1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633b2dd092ca39c1cf7"
-
-inherit pypi python_setuptools_build_meta
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
diff --git a/meta/recipes-devtools/python/python3-chardet_7.1.0.bb b/meta/recipes-devtools/python/python3-chardet_7.1.0.bb
new file mode 100644
index 0000000000..73ba751444
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-chardet_7.1.0.bb
@@ -0,0 +1,554 @@
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
+# @@ -1,502 +1,21 @@
+# -                  GNU LESSER GENERAL PUBLIC LICENSE
+# -                       Version 2.1, February 1999
+# +MIT License
+#  
+# - Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+# - 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# - Everyone is permitted to copy and distribute verbatim copies
+# - of this license document, but changing it is not allowed.
+# +Copyright (c) 2026 Dan Blanchard
+#  
+# -[This is the first released version of the Lesser GPL.  It also counts
+# - as the successor of the GNU Library Public License, version 2, hence
+# - the version number 2.1.]
+# +Permission is hereby granted, free of charge, to any person obtaining a copy
+# +of this software and associated documentation files (the "Software"), to deal
+# +in the Software without restriction, including without limitation the rights
+# +to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# +copies of the Software, and to permit persons to whom the Software is
+# +furnished to do so, subject to the following conditions:
+#  
+# -                            Preamble
+# +The above copyright notice and this permission notice shall be included in all
+# +copies or substantial portions of the Software.
+#  
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
+# -    License along with this library; if not, write to the Free Software
+# -    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
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
+# -  <signature of Ty Coon>, 1 April 1990
+# -  Ty Coon, President of Vice
+# -
+# -That's all there is to it!
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# +SOFTWARE.
+# 
+#
+
+SUMMARY = "Universal encoding detector for Python 2 and 3"
+HOMEPAGE = "https://pypi.org/project/chardet/"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=084a1810a679d5f230d086b8d4703f90"
+
+SRC_URI[sha256sum] = "8f47bc4accac17bd9accbb4acc1d563acc024a783806c0a43c3a583f5285690b"
+
+inherit pypi python_setuptools_build_meta
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


--===============1303141208908419133==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-chardet-upgrade-5.2.0-7.1.0.patch"

RnJvbSBhODgxOGQ1MjNmODc1OWE2NWQ1MzVhYzViM2ZkMzAxMGJhMDQyMjBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDc6Mzk6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNoYXJkZXQ6IHVwZ3JhZGUgNS4yLjAgLT4gNy4xLjAKCi0tLQogLi4uL3B5dGhvbi9w
eXRob24zLWNoYXJkZXRfNS4yLjAuYmIgICAgICAgICAgIHwgIDIxIC0KIC4uLi9weXRob24vcHl0
aG9uMy1jaGFyZGV0XzcuMS4wLmJiICAgICAgICAgICB8IDU1NCArKysrKysrKysrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgNTU0IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jaGFy
ZGV0XzUuMi4wLmJiCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNoYXJkZXRfNy4xLjAuYmIKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2hhcmRldF81LjIuMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jaGFyZGV0XzUuMi4wLmJiCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCA5YWNiZWViM2YyLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jaGFyZGV0XzUuMi4wLmJiCisrKyAvZGV2L251bGwKQEAg
LTEsMjEgKzAsMCBAQAotU1VNTUFSWSA9ICJVbml2ZXJzYWwgZW5jb2RpbmcgZGV0ZWN0b3IgZm9y
IFB5dGhvbiAyIGFuZCAzIgotSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L2No
YXJkZXQvIgotTElDRU5TRSA9ICJMR1BMLTIuMS1vbmx5IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCi0KLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIxYjNiNmZmNDc5YThjNDE0YmMzZmEyYzA4NTI5OTU2OTVjNGEw
MjZkY2Q2ZDA2MzNiMmRkMDkyY2EzOWMxY2Y3IgotCi1pbmhlcml0IHB5cGkgcHl0aG9uX3NldHVw
dG9vbHNfYnVpbGRfbWV0YQotCi1QQUNLQUdFUyA9KyAiJHtQTn0tY2xpIgotRklMRVM6JHtQTn0t
Y2xpICs9ICIgXAotICAgICR7UFlUSE9OX1NJVEVQQUNLQUdFU19ESVJ9L2NoYXJkZXQvY2xpIFwK
LSIKLQotUkRFUEVORFM6JHtQTn0tY2xpID0gIiR7UE59ICIKLQotUkRFUEVORFM6JHtQTn06Y2xh
c3MtdGFyZ2V0ICs9ICIgXAotICAgIHB5dGhvbjMtbG9nZ2luZyBcCi0iCi0KLUJCQ0xBU1NFWFRF
TkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jaGFyZGV0XzcuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWNoYXJkZXRfNy4xLjAuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMC4uNzNiYTc1MTQ0NAotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jaGFyZGV0XzcuMS4wLmJiCkBAIC0wLDAgKzEsNTU0
IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0
ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVw
ZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5n
ZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisj
IChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisj
CisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAt
MSw1MDIgKzEsMjEgQEAKKyMgLSAgICAgICAgICAgICAgICAgIEdOVSBMRVNTRVIgR0VORVJBTCBQ
VUJMSUMgTElDRU5TRQorIyAtICAgICAgICAgICAgICAgICAgICAgICBWZXJzaW9uIDIuMSwgRmVi
cnVhcnkgMTk5OQorIyArTUlUIExpY2Vuc2UKKyMgIAorIyAtIENvcHlyaWdodCAoQykgMTk5MSwg
MTk5OSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyMgLSA1MSBGcmFua2xpbiBTdHJl
ZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxICBVU0EKKyMgLSBFdmVyeW9u
ZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMg
LSBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dl
ZC4KKyMgK0NvcHlyaWdodCAoYykgMjAyNiBEYW4gQmxhbmNoYXJkCisjICAKKyMgLVtUaGlzIGlz
IHRoZSBmaXJzdCByZWxlYXNlZCB2ZXJzaW9uIG9mIHRoZSBMZXNzZXIgR1BMLiAgSXQgYWxzbyBj
b3VudHMKKyMgLSBhcyB0aGUgc3VjY2Vzc29yIG9mIHRoZSBHTlUgTGlicmFyeSBQdWJsaWMgTGlj
ZW5zZSwgdmVyc2lvbiAyLCBoZW5jZQorIyAtIHRoZSB2ZXJzaW9uIG51bWJlciAyLjEuXQorIyAr
UGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJz
b24gb2J0YWluaW5nIGEgY29weQorIyArb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBk
b2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwKKyMgK2luIHRoZSBT
b2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9u
IHRoZSByaWdodHMKKyMgK3RvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlz
dHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwKKyMgK2NvcGllcyBvZiB0aGUgU29mdHdh
cmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcworIyArZnVy
bmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyMg
IAorIyAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIFByZWFtYmxlCisjICtUaGUgYWJvdmUg
Y29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNs
dWRlZCBpbiBhbGwKKyMgK2NvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29m
dHdhcmUuCisjICAKKyMgLSAgVGhlIGxpY2Vuc2VzIGZvciBtb3N0IHNvZnR3YXJlIGFyZSBkZXNp
Z25lZCB0byB0YWtlIGF3YXkgeW91cgorIyAtZnJlZWRvbSB0byBzaGFyZSBhbmQgY2hhbmdlIGl0
LiAgQnkgY29udHJhc3QsIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKKyMgLUxpY2Vuc2VzIGFyZSBp
bnRlbmRlZCB0byBndWFyYW50ZWUgeW91ciBmcmVlZG9tIHRvIHNoYXJlIGFuZCBjaGFuZ2UKKyMg
LWZyZWUgc29mdHdhcmUtLXRvIG1ha2Ugc3VyZSB0aGUgc29mdHdhcmUgaXMgZnJlZSBmb3IgYWxs
IGl0cyB1c2Vycy4KKyMgLQorIyAtICBUaGlzIGxpY2Vuc2UsIHRoZSBMZXNzZXIgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSwgYXBwbGllcyB0byBzb21lCisjIC1zcGVjaWFsbHkgZGVzaWduYXRlZCBz
b2Z0d2FyZSBwYWNrYWdlcy0tdHlwaWNhbGx5IGxpYnJhcmllcy0tb2YgdGhlCisjIC1GcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24gYW5kIG90aGVyIGF1dGhvcnMgd2hvIGRlY2lkZSB0byB1c2UgaXQu
ICBZb3UKKyMgLWNhbiB1c2UgaXQgdG9vLCBidXQgd2Ugc3VnZ2VzdCB5b3UgZmlyc3QgdGhpbmsg
Y2FyZWZ1bGx5IGFib3V0IHdoZXRoZXIKKyMgLXRoaXMgbGljZW5zZSBvciB0aGUgb3JkaW5hcnkg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBpcyB0aGUgYmV0dGVyCisjIC1zdHJhdGVneSB0byB1c2Ug
aW4gYW55IHBhcnRpY3VsYXIgY2FzZSwgYmFzZWQgb24gdGhlIGV4cGxhbmF0aW9ucyBiZWxvdy4K
KyMgLQorIyAtICBXaGVuIHdlIHNwZWFrIG9mIGZyZWUgc29mdHdhcmUsIHdlIGFyZSByZWZlcnJp
bmcgdG8gZnJlZWRvbSBvZiB1c2UsCisjIC1ub3QgcHJpY2UuICBPdXIgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZXMgYXJlIGRlc2lnbmVkIHRvIG1ha2Ugc3VyZSB0aGF0CisjIC15b3UgaGF2ZSB0aGUg
ZnJlZWRvbSB0byBkaXN0cmlidXRlIGNvcGllcyBvZiBmcmVlIHNvZnR3YXJlIChhbmQgY2hhcmdl
CisjIC1mb3IgdGhpcyBzZXJ2aWNlIGlmIHlvdSB3aXNoKTsgdGhhdCB5b3UgcmVjZWl2ZSBzb3Vy
Y2UgY29kZSBvciBjYW4gZ2V0CisjIC1pdCBpZiB5b3Ugd2FudCBpdDsgdGhhdCB5b3UgY2FuIGNo
YW5nZSB0aGUgc29mdHdhcmUgYW5kIHVzZSBwaWVjZXMgb2YKKyMgLWl0IGluIG5ldyBmcmVlIHBy
b2dyYW1zOyBhbmQgdGhhdCB5b3UgYXJlIGluZm9ybWVkIHRoYXQgeW91IGNhbiBkbworIyAtdGhl
c2UgdGhpbmdzLgorIyAtCisjIC0gIFRvIHByb3RlY3QgeW91ciByaWdodHMsIHdlIG5lZWQgdG8g
bWFrZSByZXN0cmljdGlvbnMgdGhhdCBmb3JiaWQKKyMgLWRpc3RyaWJ1dG9ycyB0byBkZW55IHlv
dSB0aGVzZSByaWdodHMgb3IgdG8gYXNrIHlvdSB0byBzdXJyZW5kZXIgdGhlc2UKKyMgLXJpZ2h0
cy4gIFRoZXNlIHJlc3RyaWN0aW9ucyB0cmFuc2xhdGUgdG8gY2VydGFpbiByZXNwb25zaWJpbGl0
aWVzIGZvcgorIyAteW91IGlmIHlvdSBkaXN0cmlidXRlIGNvcGllcyBvZiB0aGUgbGlicmFyeSBv
ciBpZiB5b3UgbW9kaWZ5IGl0LgorIyAtCisjIC0gIEZvciBleGFtcGxlLCBpZiB5b3UgZGlzdHJp
YnV0ZSBjb3BpZXMgb2YgdGhlIGxpYnJhcnksIHdoZXRoZXIgZ3JhdGlzCisjIC1vciBmb3IgYSBm
ZWUsIHlvdSBtdXN0IGdpdmUgdGhlIHJlY2lwaWVudHMgYWxsIHRoZSByaWdodHMgdGhhdCB3ZSBn
YXZlCisjIC15b3UuICBZb3UgbXVzdCBtYWtlIHN1cmUgdGhhdCB0aGV5LCB0b28sIHJlY2VpdmUg
b3IgY2FuIGdldCB0aGUgc291cmNlCisjIC1jb2RlLiAgSWYgeW91IGxpbmsgb3RoZXIgY29kZSB3
aXRoIHRoZSBsaWJyYXJ5LCB5b3UgbXVzdCBwcm92aWRlCisjIC1jb21wbGV0ZSBvYmplY3QgZmls
ZXMgdG8gdGhlIHJlY2lwaWVudHMsIHNvIHRoYXQgdGhleSBjYW4gcmVsaW5rIHRoZW0KKyMgLXdp
dGggdGhlIGxpYnJhcnkgYWZ0ZXIgbWFraW5nIGNoYW5nZXMgdG8gdGhlIGxpYnJhcnkgYW5kIHJl
Y29tcGlsaW5nCisjIC1pdC4gIEFuZCB5b3UgbXVzdCBzaG93IHRoZW0gdGhlc2UgdGVybXMgc28g
dGhleSBrbm93IHRoZWlyIHJpZ2h0cy4KKyMgLQorIyAtICBXZSBwcm90ZWN0IHlvdXIgcmlnaHRz
IHdpdGggYSB0d28tc3RlcCBtZXRob2Q6ICgxKSB3ZSBjb3B5cmlnaHQgdGhlCisjIC1saWJyYXJ5
LCBhbmQgKDIpIHdlIG9mZmVyIHlvdSB0aGlzIGxpY2Vuc2UsIHdoaWNoIGdpdmVzIHlvdSBsZWdh
bAorIyAtcGVybWlzc2lvbiB0byBjb3B5LCBkaXN0cmlidXRlIGFuZC9vciBtb2RpZnkgdGhlIGxp
YnJhcnkuCisjIC0KKyMgLSAgVG8gcHJvdGVjdCBlYWNoIGRpc3RyaWJ1dG9yLCB3ZSB3YW50IHRv
IG1ha2UgaXQgdmVyeSBjbGVhciB0aGF0CisjIC10aGVyZSBpcyBubyB3YXJyYW50eSBmb3IgdGhl
IGZyZWUgbGlicmFyeS4gIEFsc28sIGlmIHRoZSBsaWJyYXJ5IGlzCisjIC1tb2RpZmllZCBieSBz
b21lb25lIGVsc2UgYW5kIHBhc3NlZCBvbiwgdGhlIHJlY2lwaWVudHMgc2hvdWxkIGtub3cKKyMg
LXRoYXQgd2hhdCB0aGV5IGhhdmUgaXMgbm90IHRoZSBvcmlnaW5hbCB2ZXJzaW9uLCBzbyB0aGF0
IHRoZSBvcmlnaW5hbAorIyAtYXV0aG9yJ3MgcmVwdXRhdGlvbiB3aWxsIG5vdCBiZSBhZmZlY3Rl
ZCBieSBwcm9ibGVtcyB0aGF0IG1pZ2h0IGJlCisjIC1pbnRyb2R1Y2VkIGJ5IG90aGVycy4KKyMg
LQwKKyMgLSAgRmluYWxseSwgc29mdHdhcmUgcGF0ZW50cyBwb3NlIGEgY29uc3RhbnQgdGhyZWF0
IHRvIHRoZSBleGlzdGVuY2Ugb2YKKyMgLWFueSBmcmVlIHByb2dyYW0uICBXZSB3aXNoIHRvIG1h
a2Ugc3VyZSB0aGF0IGEgY29tcGFueSBjYW5ub3QKKyMgLWVmZmVjdGl2ZWx5IHJlc3RyaWN0IHRo
ZSB1c2VycyBvZiBhIGZyZWUgcHJvZ3JhbSBieSBvYnRhaW5pbmcgYQorIyAtcmVzdHJpY3RpdmUg
bGljZW5zZSBmcm9tIGEgcGF0ZW50IGhvbGRlci4gIFRoZXJlZm9yZSwgd2UgaW5zaXN0IHRoYXQK
KyMgLWFueSBwYXRlbnQgbGljZW5zZSBvYnRhaW5lZCBmb3IgYSB2ZXJzaW9uIG9mIHRoZSBsaWJy
YXJ5IG11c3QgYmUKKyMgLWNvbnNpc3RlbnQgd2l0aCB0aGUgZnVsbCBmcmVlZG9tIG9mIHVzZSBz
cGVjaWZpZWQgaW4gdGhpcyBsaWNlbnNlLgorIyAtCisjIC0gIE1vc3QgR05VIHNvZnR3YXJlLCBp
bmNsdWRpbmcgc29tZSBsaWJyYXJpZXMsIGlzIGNvdmVyZWQgYnkgdGhlCisjIC1vcmRpbmFyeSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZS4gIFRoaXMgbGljZW5zZSwgdGhlIEdOVSBMZXNzZXIK
KyMgLUdlbmVyYWwgUHVibGljIExpY2Vuc2UsIGFwcGxpZXMgdG8gY2VydGFpbiBkZXNpZ25hdGVk
IGxpYnJhcmllcywgYW5kCisjIC1pcyBxdWl0ZSBkaWZmZXJlbnQgZnJvbSB0aGUgb3JkaW5hcnkg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZS4gIFdlIHVzZQorIyAtdGhpcyBsaWNlbnNlIGZvciBjZXJ0
YWluIGxpYnJhcmllcyBpbiBvcmRlciB0byBwZXJtaXQgbGlua2luZyB0aG9zZQorIyAtbGlicmFy
aWVzIGludG8gbm9uLWZyZWUgcHJvZ3JhbXMuCisjIC0KKyMgLSAgV2hlbiBhIHByb2dyYW0gaXMg
bGlua2VkIHdpdGggYSBsaWJyYXJ5LCB3aGV0aGVyIHN0YXRpY2FsbHkgb3IgdXNpbmcKKyMgLWEg
c2hhcmVkIGxpYnJhcnksIHRoZSBjb21iaW5hdGlvbiBvZiB0aGUgdHdvIGlzIGxlZ2FsbHkgc3Bl
YWtpbmcgYQorIyAtY29tYmluZWQgd29yaywgYSBkZXJpdmF0aXZlIG9mIHRoZSBvcmlnaW5hbCBs
aWJyYXJ5LiAgVGhlIG9yZGluYXJ5CisjIC1HZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHRoZXJlZm9y
ZSBwZXJtaXRzIHN1Y2ggbGlua2luZyBvbmx5IGlmIHRoZQorIyAtZW50aXJlIGNvbWJpbmF0aW9u
IGZpdHMgaXRzIGNyaXRlcmlhIG9mIGZyZWVkb20uICBUaGUgTGVzc2VyIEdlbmVyYWwKKyMgLVB1
YmxpYyBMaWNlbnNlIHBlcm1pdHMgbW9yZSBsYXggY3JpdGVyaWEgZm9yIGxpbmtpbmcgb3RoZXIg
Y29kZSB3aXRoCisjIC10aGUgbGlicmFyeS4KKyMgLQorIyAtICBXZSBjYWxsIHRoaXMgbGljZW5z
ZSB0aGUgIkxlc3NlciIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBiZWNhdXNlIGl0CisjIC1kb2Vz
IExlc3MgdG8gcHJvdGVjdCB0aGUgdXNlcidzIGZyZWVkb20gdGhhbiB0aGUgb3JkaW5hcnkgR2Vu
ZXJhbAorIyAtUHVibGljIExpY2Vuc2UuICBJdCBhbHNvIHByb3ZpZGVzIG90aGVyIGZyZWUgc29m
dHdhcmUgZGV2ZWxvcGVycyBMZXNzCisjIC1vZiBhbiBhZHZhbnRhZ2Ugb3ZlciBjb21wZXRpbmcg
bm9uLWZyZWUgcHJvZ3JhbXMuICBUaGVzZSBkaXNhZHZhbnRhZ2VzCisjIC1hcmUgdGhlIHJlYXNv
biB3ZSB1c2UgdGhlIG9yZGluYXJ5IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1hbnkKKyMg
LWxpYnJhcmllcy4gIEhvd2V2ZXIsIHRoZSBMZXNzZXIgbGljZW5zZSBwcm92aWRlcyBhZHZhbnRh
Z2VzIGluIGNlcnRhaW4KKyMgLXNwZWNpYWwgY2lyY3Vtc3RhbmNlcy4KKyMgLQorIyAtICBGb3Ig
ZXhhbXBsZSwgb24gcmFyZSBvY2Nhc2lvbnMsIHRoZXJlIG1heSBiZSBhIHNwZWNpYWwgbmVlZCB0
bworIyAtZW5jb3VyYWdlIHRoZSB3aWRlc3QgcG9zc2libGUgdXNlIG9mIGEgY2VydGFpbiBsaWJy
YXJ5LCBzbyB0aGF0IGl0IGJlY29tZXMKKyMgLWEgZGUtZmFjdG8gc3RhbmRhcmQuICBUbyBhY2hp
ZXZlIHRoaXMsIG5vbi1mcmVlIHByb2dyYW1zIG11c3QgYmUKKyMgLWFsbG93ZWQgdG8gdXNlIHRo
ZSBsaWJyYXJ5LiAgQSBtb3JlIGZyZXF1ZW50IGNhc2UgaXMgdGhhdCBhIGZyZWUKKyMgLWxpYnJh
cnkgZG9lcyB0aGUgc2FtZSBqb2IgYXMgd2lkZWx5IHVzZWQgbm9uLWZyZWUgbGlicmFyaWVzLiAg
SW4gdGhpcworIyAtY2FzZSwgdGhlcmUgaXMgbGl0dGxlIHRvIGdhaW4gYnkgbGltaXRpbmcgdGhl
IGZyZWUgbGlicmFyeSB0byBmcmVlCisjIC1zb2Z0d2FyZSBvbmx5LCBzbyB3ZSB1c2UgdGhlIExl
c3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLgorIyAtCisjIC0gIEluIG90aGVyIGNhc2VzLCBw
ZXJtaXNzaW9uIHRvIHVzZSBhIHBhcnRpY3VsYXIgbGlicmFyeSBpbiBub24tZnJlZQorIyAtcHJv
Z3JhbXMgZW5hYmxlcyBhIGdyZWF0ZXIgbnVtYmVyIG9mIHBlb3BsZSB0byB1c2UgYSBsYXJnZSBi
b2R5IG9mCisjIC1mcmVlIHNvZnR3YXJlLiAgRm9yIGV4YW1wbGUsIHBlcm1pc3Npb24gdG8gdXNl
IHRoZSBHTlUgQyBMaWJyYXJ5IGluCisjIC1ub24tZnJlZSBwcm9ncmFtcyBlbmFibGVzIG1hbnkg
bW9yZSBwZW9wbGUgdG8gdXNlIHRoZSB3aG9sZSBHTlUKKyMgLW9wZXJhdGluZyBzeXN0ZW0sIGFz
IHdlbGwgYXMgaXRzIHZhcmlhbnQsIHRoZSBHTlUvTGludXggb3BlcmF0aW5nCisjIC1zeXN0ZW0u
CisjIC0KKyMgLSAgQWx0aG91Z2ggdGhlIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGlz
IExlc3MgcHJvdGVjdGl2ZSBvZiB0aGUKKyMgLXVzZXJzJyBmcmVlZG9tLCBpdCBkb2VzIGVuc3Vy
ZSB0aGF0IHRoZSB1c2VyIG9mIGEgcHJvZ3JhbSB0aGF0IGlzCisjIC1saW5rZWQgd2l0aCB0aGUg
TGlicmFyeSBoYXMgdGhlIGZyZWVkb20gYW5kIHRoZSB3aGVyZXdpdGhhbCB0byBydW4KKyMgLXRo
YXQgcHJvZ3JhbSB1c2luZyBhIG1vZGlmaWVkIHZlcnNpb24gb2YgdGhlIExpYnJhcnkuCisjIC0K
KyMgLSAgVGhlIHByZWNpc2UgdGVybXMgYW5kIGNvbmRpdGlvbnMgZm9yIGNvcHlpbmcsIGRpc3Ry
aWJ1dGlvbiBhbmQKKyMgLW1vZGlmaWNhdGlvbiBmb2xsb3cuICBQYXkgY2xvc2UgYXR0ZW50aW9u
IHRvIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gYQorIyAtIndvcmsgYmFzZWQgb24gdGhlIGxpYnJh
cnkiIGFuZCBhICJ3b3JrIHRoYXQgdXNlcyB0aGUgbGlicmFyeSIuICBUaGUKKyMgLWZvcm1lciBj
b250YWlucyBjb2RlIGRlcml2ZWQgZnJvbSB0aGUgbGlicmFyeSwgd2hlcmVhcyB0aGUgbGF0dGVy
IG11c3QKKyMgLWJlIGNvbWJpbmVkIHdpdGggdGhlIGxpYnJhcnkgaW4gb3JkZXIgdG8gcnVuLgor
IyAtDAorIyAtICAgICAgICAgICAgICAgICAgR05VIExFU1NFUiBHRU5FUkFMIFBVQkxJQyBMSUNF
TlNFCisjIC0gICBURVJNUyBBTkQgQ09ORElUSU9OUyBGT1IgQ09QWUlORywgRElTVFJJQlVUSU9O
IEFORCBNT0RJRklDQVRJT04KKyMgLQorIyAtICAwLiBUaGlzIExpY2Vuc2UgQWdyZWVtZW50IGFw
cGxpZXMgdG8gYW55IHNvZnR3YXJlIGxpYnJhcnkgb3Igb3RoZXIKKyMgLXByb2dyYW0gd2hpY2gg
Y29udGFpbnMgYSBub3RpY2UgcGxhY2VkIGJ5IHRoZSBjb3B5cmlnaHQgaG9sZGVyIG9yCisjIC1v
dGhlciBhdXRob3JpemVkIHBhcnR5IHNheWluZyBpdCBtYXkgYmUgZGlzdHJpYnV0ZWQgdW5kZXIg
dGhlIHRlcm1zIG9mCisjIC10aGlzIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIChhbHNv
IGNhbGxlZCAidGhpcyBMaWNlbnNlIikuCisjIC1FYWNoIGxpY2Vuc2VlIGlzIGFkZHJlc3NlZCBh
cyAieW91Ii4KKyMgLQorIyAtICBBICJsaWJyYXJ5IiBtZWFucyBhIGNvbGxlY3Rpb24gb2Ygc29m
dHdhcmUgZnVuY3Rpb25zIGFuZC9vciBkYXRhCisjIC1wcmVwYXJlZCBzbyBhcyB0byBiZSBjb252
ZW5pZW50bHkgbGlua2VkIHdpdGggYXBwbGljYXRpb24gcHJvZ3JhbXMKKyMgLSh3aGljaCB1c2Ug
c29tZSBvZiB0aG9zZSBmdW5jdGlvbnMgYW5kIGRhdGEpIHRvIGZvcm0gZXhlY3V0YWJsZXMuCisj
IC0KKyMgLSAgVGhlICJMaWJyYXJ5IiwgYmVsb3csIHJlZmVycyB0byBhbnkgc3VjaCBzb2Z0d2Fy
ZSBsaWJyYXJ5IG9yIHdvcmsKKyMgLXdoaWNoIGhhcyBiZWVuIGRpc3RyaWJ1dGVkIHVuZGVyIHRo
ZXNlIHRlcm1zLiAgQSAid29yayBiYXNlZCBvbiB0aGUKKyMgLUxpYnJhcnkiIG1lYW5zIGVpdGhl
ciB0aGUgTGlicmFyeSBvciBhbnkgZGVyaXZhdGl2ZSB3b3JrIHVuZGVyCisjIC1jb3B5cmlnaHQg
bGF3OiB0aGF0IGlzIHRvIHNheSwgYSB3b3JrIGNvbnRhaW5pbmcgdGhlIExpYnJhcnkgb3IgYQor
IyAtcG9ydGlvbiBvZiBpdCwgZWl0aGVyIHZlcmJhdGltIG9yIHdpdGggbW9kaWZpY2F0aW9ucyBh
bmQvb3IgdHJhbnNsYXRlZAorIyAtc3RyYWlnaHRmb3J3YXJkbHkgaW50byBhbm90aGVyIGxhbmd1
YWdlLiAgKEhlcmVpbmFmdGVyLCB0cmFuc2xhdGlvbiBpcworIyAtaW5jbHVkZWQgd2l0aG91dCBs
aW1pdGF0aW9uIGluIHRoZSB0ZXJtICJtb2RpZmljYXRpb24iLikKKyMgLQorIyAtICAiU291cmNl
IGNvZGUiIGZvciBhIHdvcmsgbWVhbnMgdGhlIHByZWZlcnJlZCBmb3JtIG9mIHRoZSB3b3JrIGZv
cgorIyAtbWFraW5nIG1vZGlmaWNhdGlvbnMgdG8gaXQuICBGb3IgYSBsaWJyYXJ5LCBjb21wbGV0
ZSBzb3VyY2UgY29kZSBtZWFucworIyAtYWxsIHRoZSBzb3VyY2UgY29kZSBmb3IgYWxsIG1vZHVs
ZXMgaXQgY29udGFpbnMsIHBsdXMgYW55IGFzc29jaWF0ZWQKKyMgLWludGVyZmFjZSBkZWZpbml0
aW9uIGZpbGVzLCBwbHVzIHRoZSBzY3JpcHRzIHVzZWQgdG8gY29udHJvbCBjb21waWxhdGlvbgor
IyAtYW5kIGluc3RhbGxhdGlvbiBvZiB0aGUgbGlicmFyeS4KKyMgLQorIyAtICBBY3Rpdml0aWVz
IG90aGVyIHRoYW4gY29weWluZywgZGlzdHJpYnV0aW9uIGFuZCBtb2RpZmljYXRpb24gYXJlIG5v
dAorIyAtY292ZXJlZCBieSB0aGlzIExpY2Vuc2U7IHRoZXkgYXJlIG91dHNpZGUgaXRzIHNjb3Bl
LiAgVGhlIGFjdCBvZgorIyAtcnVubmluZyBhIHByb2dyYW0gdXNpbmcgdGhlIExpYnJhcnkgaXMg
bm90IHJlc3RyaWN0ZWQsIGFuZCBvdXRwdXQgZnJvbQorIyAtc3VjaCBhIHByb2dyYW0gaXMgY292
ZXJlZCBvbmx5IGlmIGl0cyBjb250ZW50cyBjb25zdGl0dXRlIGEgd29yayBiYXNlZAorIyAtb24g
dGhlIExpYnJhcnkgKGluZGVwZW5kZW50IG9mIHRoZSB1c2Ugb2YgdGhlIExpYnJhcnkgaW4gYSB0
b29sIGZvcgorIyAtd3JpdGluZyBpdCkuICBXaGV0aGVyIHRoYXQgaXMgdHJ1ZSBkZXBlbmRzIG9u
IHdoYXQgdGhlIExpYnJhcnkgZG9lcworIyAtYW5kIHdoYXQgdGhlIHByb2dyYW0gdGhhdCB1c2Vz
IHRoZSBMaWJyYXJ5IGRvZXMuCisjIC0KKyMgLSAgMS4gWW91IG1heSBjb3B5IGFuZCBkaXN0cmli
dXRlIHZlcmJhdGltIGNvcGllcyBvZiB0aGUgTGlicmFyeSdzCisjIC1jb21wbGV0ZSBzb3VyY2Ug
Y29kZSBhcyB5b3UgcmVjZWl2ZSBpdCwgaW4gYW55IG1lZGl1bSwgcHJvdmlkZWQgdGhhdAorIyAt
eW91IGNvbnNwaWN1b3VzbHkgYW5kIGFwcHJvcHJpYXRlbHkgcHVibGlzaCBvbiBlYWNoIGNvcHkg
YW4KKyMgLWFwcHJvcHJpYXRlIGNvcHlyaWdodCBub3RpY2UgYW5kIGRpc2NsYWltZXIgb2Ygd2Fy
cmFudHk7IGtlZXAgaW50YWN0CisjIC1hbGwgdGhlIG5vdGljZXMgdGhhdCByZWZlciB0byB0aGlz
IExpY2Vuc2UgYW5kIHRvIHRoZSBhYnNlbmNlIG9mIGFueQorIyAtd2FycmFudHk7IGFuZCBkaXN0
cmlidXRlIGEgY29weSBvZiB0aGlzIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUKKyMgLUxpYnJhcnku
CisjIC0KKyMgLSAgWW91IG1heSBjaGFyZ2UgYSBmZWUgZm9yIHRoZSBwaHlzaWNhbCBhY3Qgb2Yg
dHJhbnNmZXJyaW5nIGEgY29weSwKKyMgLWFuZCB5b3UgbWF5IGF0IHlvdXIgb3B0aW9uIG9mZmVy
IHdhcnJhbnR5IHByb3RlY3Rpb24gaW4gZXhjaGFuZ2UgZm9yIGEKKyMgLWZlZS4KKyMgLQwKKyMg
LSAgMi4gWW91IG1heSBtb2RpZnkgeW91ciBjb3B5IG9yIGNvcGllcyBvZiB0aGUgTGlicmFyeSBv
ciBhbnkgcG9ydGlvbgorIyAtb2YgaXQsIHRodXMgZm9ybWluZyBhIHdvcmsgYmFzZWQgb24gdGhl
IExpYnJhcnksIGFuZCBjb3B5IGFuZAorIyAtZGlzdHJpYnV0ZSBzdWNoIG1vZGlmaWNhdGlvbnMg
b3Igd29yayB1bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbiAxCisjIC1hYm92ZSwgcHJvdmlkZWQg
dGhhdCB5b3UgYWxzbyBtZWV0IGFsbCBvZiB0aGVzZSBjb25kaXRpb25zOgorIyAtCisjIC0gICAg
YSkgVGhlIG1vZGlmaWVkIHdvcmsgbXVzdCBpdHNlbGYgYmUgYSBzb2Z0d2FyZSBsaWJyYXJ5Lgor
IyAtCisjIC0gICAgYikgWW91IG11c3QgY2F1c2UgdGhlIGZpbGVzIG1vZGlmaWVkIHRvIGNhcnJ5
IHByb21pbmVudCBub3RpY2VzCisjIC0gICAgc3RhdGluZyB0aGF0IHlvdSBjaGFuZ2VkIHRoZSBm
aWxlcyBhbmQgdGhlIGRhdGUgb2YgYW55IGNoYW5nZS4KKyMgLQorIyAtICAgIGMpIFlvdSBtdXN0
IGNhdXNlIHRoZSB3aG9sZSBvZiB0aGUgd29yayB0byBiZSBsaWNlbnNlZCBhdCBubworIyAtICAg
IGNoYXJnZSB0byBhbGwgdGhpcmQgcGFydGllcyB1bmRlciB0aGUgdGVybXMgb2YgdGhpcyBMaWNl
bnNlLgorIyAtCisjIC0gICAgZCkgSWYgYSBmYWNpbGl0eSBpbiB0aGUgbW9kaWZpZWQgTGlicmFy
eSByZWZlcnMgdG8gYSBmdW5jdGlvbiBvciBhCisjIC0gICAgdGFibGUgb2YgZGF0YSB0byBiZSBz
dXBwbGllZCBieSBhbiBhcHBsaWNhdGlvbiBwcm9ncmFtIHRoYXQgdXNlcworIyAtICAgIHRoZSBm
YWNpbGl0eSwgb3RoZXIgdGhhbiBhcyBhbiBhcmd1bWVudCBwYXNzZWQgd2hlbiB0aGUgZmFjaWxp
dHkKKyMgLSAgICBpcyBpbnZva2VkLCB0aGVuIHlvdSBtdXN0IG1ha2UgYSBnb29kIGZhaXRoIGVm
Zm9ydCB0byBlbnN1cmUgdGhhdCwKKyMgLSAgICBpbiB0aGUgZXZlbnQgYW4gYXBwbGljYXRpb24g
ZG9lcyBub3Qgc3VwcGx5IHN1Y2ggZnVuY3Rpb24gb3IKKyMgLSAgICB0YWJsZSwgdGhlIGZhY2ls
aXR5IHN0aWxsIG9wZXJhdGVzLCBhbmQgcGVyZm9ybXMgd2hhdGV2ZXIgcGFydCBvZgorIyAtICAg
IGl0cyBwdXJwb3NlIHJlbWFpbnMgbWVhbmluZ2Z1bC4KKyMgLQorIyAtICAgIChGb3IgZXhhbXBs
ZSwgYSBmdW5jdGlvbiBpbiBhIGxpYnJhcnkgdG8gY29tcHV0ZSBzcXVhcmUgcm9vdHMgaGFzCisj
IC0gICAgYSBwdXJwb3NlIHRoYXQgaXMgZW50aXJlbHkgd2VsbC1kZWZpbmVkIGluZGVwZW5kZW50
IG9mIHRoZQorIyAtICAgIGFwcGxpY2F0aW9uLiAgVGhlcmVmb3JlLCBTdWJzZWN0aW9uIDJkIHJl
cXVpcmVzIHRoYXQgYW55CisjIC0gICAgYXBwbGljYXRpb24tc3VwcGxpZWQgZnVuY3Rpb24gb3Ig
dGFibGUgdXNlZCBieSB0aGlzIGZ1bmN0aW9uIG11c3QKKyMgLSAgICBiZSBvcHRpb25hbDogaWYg
dGhlIGFwcGxpY2F0aW9uIGRvZXMgbm90IHN1cHBseSBpdCwgdGhlIHNxdWFyZQorIyAtICAgIHJv
b3QgZnVuY3Rpb24gbXVzdCBzdGlsbCBjb21wdXRlIHNxdWFyZSByb290cy4pCisjIC0KKyMgLVRo
ZXNlIHJlcXVpcmVtZW50cyBhcHBseSB0byB0aGUgbW9kaWZpZWQgd29yayBhcyBhIHdob2xlLiAg
SWYKKyMgLWlkZW50aWZpYWJsZSBzZWN0aW9ucyBvZiB0aGF0IHdvcmsgYXJlIG5vdCBkZXJpdmVk
IGZyb20gdGhlIExpYnJhcnksCisjIC1hbmQgY2FuIGJlIHJlYXNvbmFibHkgY29uc2lkZXJlZCBp
bmRlcGVuZGVudCBhbmQgc2VwYXJhdGUgd29ya3MgaW4KKyMgLXRoZW1zZWx2ZXMsIHRoZW4gdGhp
cyBMaWNlbnNlLCBhbmQgaXRzIHRlcm1zLCBkbyBub3QgYXBwbHkgdG8gdGhvc2UKKyMgLXNlY3Rp
b25zIHdoZW4geW91IGRpc3RyaWJ1dGUgdGhlbSBhcyBzZXBhcmF0ZSB3b3Jrcy4gIEJ1dCB3aGVu
IHlvdQorIyAtZGlzdHJpYnV0ZSB0aGUgc2FtZSBzZWN0aW9ucyBhcyBwYXJ0IG9mIGEgd2hvbGUg
d2hpY2ggaXMgYSB3b3JrIGJhc2VkCisjIC1vbiB0aGUgTGlicmFyeSwgdGhlIGRpc3RyaWJ1dGlv
biBvZiB0aGUgd2hvbGUgbXVzdCBiZSBvbiB0aGUgdGVybXMgb2YKKyMgLXRoaXMgTGljZW5zZSwg
d2hvc2UgcGVybWlzc2lvbnMgZm9yIG90aGVyIGxpY2Vuc2VlcyBleHRlbmQgdG8gdGhlCisjIC1l
bnRpcmUgd2hvbGUsIGFuZCB0aHVzIHRvIGVhY2ggYW5kIGV2ZXJ5IHBhcnQgcmVnYXJkbGVzcyBv
ZiB3aG8gd3JvdGUKKyMgLWl0LgorIyAtCisjIC1UaHVzLCBpdCBpcyBub3QgdGhlIGludGVudCBv
ZiB0aGlzIHNlY3Rpb24gdG8gY2xhaW0gcmlnaHRzIG9yIGNvbnRlc3QKKyMgLXlvdXIgcmlnaHRz
IHRvIHdvcmsgd3JpdHRlbiBlbnRpcmVseSBieSB5b3U7IHJhdGhlciwgdGhlIGludGVudCBpcyB0
bworIyAtZXhlcmNpc2UgdGhlIHJpZ2h0IHRvIGNvbnRyb2wgdGhlIGRpc3RyaWJ1dGlvbiBvZiBk
ZXJpdmF0aXZlIG9yCisjIC1jb2xsZWN0aXZlIHdvcmtzIGJhc2VkIG9uIHRoZSBMaWJyYXJ5Lgor
IyAtCisjIC1JbiBhZGRpdGlvbiwgbWVyZSBhZ2dyZWdhdGlvbiBvZiBhbm90aGVyIHdvcmsgbm90
IGJhc2VkIG9uIHRoZSBMaWJyYXJ5CisjIC13aXRoIHRoZSBMaWJyYXJ5IChvciB3aXRoIGEgd29y
ayBiYXNlZCBvbiB0aGUgTGlicmFyeSkgb24gYSB2b2x1bWUgb2YKKyMgLWEgc3RvcmFnZSBvciBk
aXN0cmlidXRpb24gbWVkaXVtIGRvZXMgbm90IGJyaW5nIHRoZSBvdGhlciB3b3JrIHVuZGVyCisj
IC10aGUgc2NvcGUgb2YgdGhpcyBMaWNlbnNlLgorIyAtCisjIC0gIDMuIFlvdSBtYXkgb3B0IHRv
IGFwcGx5IHRoZSB0ZXJtcyBvZiB0aGUgb3JkaW5hcnkgR05VIEdlbmVyYWwgUHVibGljCisjIC1M
aWNlbnNlIGluc3RlYWQgb2YgdGhpcyBMaWNlbnNlIHRvIGEgZ2l2ZW4gY29weSBvZiB0aGUgTGli
cmFyeS4gIFRvIGRvCisjIC10aGlzLCB5b3UgbXVzdCBhbHRlciBhbGwgdGhlIG5vdGljZXMgdGhh
dCByZWZlciB0byB0aGlzIExpY2Vuc2UsIHNvCisjIC10aGF0IHRoZXkgcmVmZXIgdG8gdGhlIG9y
ZGluYXJ5IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLCB2ZXJzaW9uIDIsCisjIC1pbnN0ZWFk
IG9mIHRvIHRoaXMgTGljZW5zZS4gIChJZiBhIG5ld2VyIHZlcnNpb24gdGhhbiB2ZXJzaW9uIDIg
b2YgdGhlCisjIC1vcmRpbmFyeSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBoYXMgYXBwZWFy
ZWQsIHRoZW4geW91IGNhbiBzcGVjaWZ5CisjIC10aGF0IHZlcnNpb24gaW5zdGVhZCBpZiB5b3Ug
d2lzaC4pICBEbyBub3QgbWFrZSBhbnkgb3RoZXIgY2hhbmdlIGluCisjIC10aGVzZSBub3RpY2Vz
LgorIyAtDAorIyAtICBPbmNlIHRoaXMgY2hhbmdlIGlzIG1hZGUgaW4gYSBnaXZlbiBjb3B5LCBp
dCBpcyBpcnJldmVyc2libGUgZm9yCisjIC10aGF0IGNvcHksIHNvIHRoZSBvcmRpbmFyeSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcHBsaWVzIHRvIGFsbAorIyAtc3Vic2VxdWVudCBjb3Bp
ZXMgYW5kIGRlcml2YXRpdmUgd29ya3MgbWFkZSBmcm9tIHRoYXQgY29weS4KKyMgLQorIyAtICBU
aGlzIG9wdGlvbiBpcyB1c2VmdWwgd2hlbiB5b3Ugd2lzaCB0byBjb3B5IHBhcnQgb2YgdGhlIGNv
ZGUgb2YKKyMgLXRoZSBMaWJyYXJ5IGludG8gYSBwcm9ncmFtIHRoYXQgaXMgbm90IGEgbGlicmFy
eS4KKyMgLQorIyAtICA0LiBZb3UgbWF5IGNvcHkgYW5kIGRpc3RyaWJ1dGUgdGhlIExpYnJhcnkg
KG9yIGEgcG9ydGlvbiBvcgorIyAtZGVyaXZhdGl2ZSBvZiBpdCwgdW5kZXIgU2VjdGlvbiAyKSBp
biBvYmplY3QgY29kZSBvciBleGVjdXRhYmxlIGZvcm0KKyMgLXVuZGVyIHRoZSB0ZXJtcyBvZiBT
ZWN0aW9ucyAxIGFuZCAyIGFib3ZlIHByb3ZpZGVkIHRoYXQgeW91IGFjY29tcGFueQorIyAtaXQg
d2l0aCB0aGUgY29tcGxldGUgY29ycmVzcG9uZGluZyBtYWNoaW5lLXJlYWRhYmxlIHNvdXJjZSBj
b2RlLCB3aGljaAorIyAtbXVzdCBiZSBkaXN0cmlidXRlZCB1bmRlciB0aGUgdGVybXMgb2YgU2Vj
dGlvbnMgMSBhbmQgMiBhYm92ZSBvbiBhCisjIC1tZWRpdW0gY3VzdG9tYXJpbHkgdXNlZCBmb3Ig
c29mdHdhcmUgaW50ZXJjaGFuZ2UuCisjIC0KKyMgLSAgSWYgZGlzdHJpYnV0aW9uIG9mIG9iamVj
dCBjb2RlIGlzIG1hZGUgYnkgb2ZmZXJpbmcgYWNjZXNzIHRvIGNvcHkKKyMgLWZyb20gYSBkZXNp
Z25hdGVkIHBsYWNlLCB0aGVuIG9mZmVyaW5nIGVxdWl2YWxlbnQgYWNjZXNzIHRvIGNvcHkgdGhl
CisjIC1zb3VyY2UgY29kZSBmcm9tIHRoZSBzYW1lIHBsYWNlIHNhdGlzZmllcyB0aGUgcmVxdWly
ZW1lbnQgdG8KKyMgLWRpc3RyaWJ1dGUgdGhlIHNvdXJjZSBjb2RlLCBldmVuIHRob3VnaCB0aGly
ZCBwYXJ0aWVzIGFyZSBub3QKKyMgLWNvbXBlbGxlZCB0byBjb3B5IHRoZSBzb3VyY2UgYWxvbmcg
d2l0aCB0aGUgb2JqZWN0IGNvZGUuCisjIC0KKyMgLSAgNS4gQSBwcm9ncmFtIHRoYXQgY29udGFp
bnMgbm8gZGVyaXZhdGl2ZSBvZiBhbnkgcG9ydGlvbiBvZiB0aGUKKyMgLUxpYnJhcnksIGJ1dCBp
cyBkZXNpZ25lZCB0byB3b3JrIHdpdGggdGhlIExpYnJhcnkgYnkgYmVpbmcgY29tcGlsZWQgb3IK
KyMgLWxpbmtlZCB3aXRoIGl0LCBpcyBjYWxsZWQgYSAid29yayB0aGF0IHVzZXMgdGhlIExpYnJh
cnkiLiAgU3VjaCBhCisjIC13b3JrLCBpbiBpc29sYXRpb24sIGlzIG5vdCBhIGRlcml2YXRpdmUg
d29yayBvZiB0aGUgTGlicmFyeSwgYW5kCisjIC10aGVyZWZvcmUgZmFsbHMgb3V0c2lkZSB0aGUg
c2NvcGUgb2YgdGhpcyBMaWNlbnNlLgorIyAtCisjIC0gIEhvd2V2ZXIsIGxpbmtpbmcgYSAid29y
ayB0aGF0IHVzZXMgdGhlIExpYnJhcnkiIHdpdGggdGhlIExpYnJhcnkKKyMgLWNyZWF0ZXMgYW4g
ZXhlY3V0YWJsZSB0aGF0IGlzIGEgZGVyaXZhdGl2ZSBvZiB0aGUgTGlicmFyeSAoYmVjYXVzZSBp
dAorIyAtY29udGFpbnMgcG9ydGlvbnMgb2YgdGhlIExpYnJhcnkpLCByYXRoZXIgdGhhbiBhICJ3
b3JrIHRoYXQgdXNlcyB0aGUKKyMgLWxpYnJhcnkiLiAgVGhlIGV4ZWN1dGFibGUgaXMgdGhlcmVm
b3JlIGNvdmVyZWQgYnkgdGhpcyBMaWNlbnNlLgorIyAtU2VjdGlvbiA2IHN0YXRlcyB0ZXJtcyBm
b3IgZGlzdHJpYnV0aW9uIG9mIHN1Y2ggZXhlY3V0YWJsZXMuCisjIC0KKyMgLSAgV2hlbiBhICJ3
b3JrIHRoYXQgdXNlcyB0aGUgTGlicmFyeSIgdXNlcyBtYXRlcmlhbCBmcm9tIGEgaGVhZGVyIGZp
bGUKKyMgLXRoYXQgaXMgcGFydCBvZiB0aGUgTGlicmFyeSwgdGhlIG9iamVjdCBjb2RlIGZvciB0
aGUgd29yayBtYXkgYmUgYQorIyAtZGVyaXZhdGl2ZSB3b3JrIG9mIHRoZSBMaWJyYXJ5IGV2ZW4g
dGhvdWdoIHRoZSBzb3VyY2UgY29kZSBpcyBub3QuCisjIC1XaGV0aGVyIHRoaXMgaXMgdHJ1ZSBp
cyBlc3BlY2lhbGx5IHNpZ25pZmljYW50IGlmIHRoZSB3b3JrIGNhbiBiZQorIyAtbGlua2VkIHdp
dGhvdXQgdGhlIExpYnJhcnksIG9yIGlmIHRoZSB3b3JrIGlzIGl0c2VsZiBhIGxpYnJhcnkuICBU
aGUKKyMgLXRocmVzaG9sZCBmb3IgdGhpcyB0byBiZSB0cnVlIGlzIG5vdCBwcmVjaXNlbHkgZGVm
aW5lZCBieSBsYXcuCisjIC0KKyMgLSAgSWYgc3VjaCBhbiBvYmplY3QgZmlsZSB1c2VzIG9ubHkg
bnVtZXJpY2FsIHBhcmFtZXRlcnMsIGRhdGEKKyMgLXN0cnVjdHVyZSBsYXlvdXRzIGFuZCBhY2Nl
c3NvcnMsIGFuZCBzbWFsbCBtYWNyb3MgYW5kIHNtYWxsIGlubGluZQorIyAtZnVuY3Rpb25zICh0
ZW4gbGluZXMgb3IgbGVzcyBpbiBsZW5ndGgpLCB0aGVuIHRoZSB1c2Ugb2YgdGhlIG9iamVjdAor
IyAtZmlsZSBpcyB1bnJlc3RyaWN0ZWQsIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBpdCBpcyBsZWdh
bGx5IGEgZGVyaXZhdGl2ZQorIyAtd29yay4gIChFeGVjdXRhYmxlcyBjb250YWluaW5nIHRoaXMg
b2JqZWN0IGNvZGUgcGx1cyBwb3J0aW9ucyBvZiB0aGUKKyMgLUxpYnJhcnkgd2lsbCBzdGlsbCBm
YWxsIHVuZGVyIFNlY3Rpb24gNi4pCisjIC0KKyMgLSAgT3RoZXJ3aXNlLCBpZiB0aGUgd29yayBp
cyBhIGRlcml2YXRpdmUgb2YgdGhlIExpYnJhcnksIHlvdSBtYXkKKyMgLWRpc3RyaWJ1dGUgdGhl
IG9iamVjdCBjb2RlIGZvciB0aGUgd29yayB1bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbiA2Lgor
IyAtQW55IGV4ZWN1dGFibGVzIGNvbnRhaW5pbmcgdGhhdCB3b3JrIGFsc28gZmFsbCB1bmRlciBT
ZWN0aW9uIDYsCisjIC13aGV0aGVyIG9yIG5vdCB0aGV5IGFyZSBsaW5rZWQgZGlyZWN0bHkgd2l0
aCB0aGUgTGlicmFyeSBpdHNlbGYuCisjIC0MCisjIC0gIDYuIEFzIGFuIGV4Y2VwdGlvbiB0byB0
aGUgU2VjdGlvbnMgYWJvdmUsIHlvdSBtYXkgYWxzbyBjb21iaW5lIG9yCisjIC1saW5rIGEgIndv
cmsgdGhhdCB1c2VzIHRoZSBMaWJyYXJ5IiB3aXRoIHRoZSBMaWJyYXJ5IHRvIHByb2R1Y2UgYQor
IyAtd29yayBjb250YWluaW5nIHBvcnRpb25zIG9mIHRoZSBMaWJyYXJ5LCBhbmQgZGlzdHJpYnV0
ZSB0aGF0IHdvcmsKKyMgLXVuZGVyIHRlcm1zIG9mIHlvdXIgY2hvaWNlLCBwcm92aWRlZCB0aGF0
IHRoZSB0ZXJtcyBwZXJtaXQKKyMgLW1vZGlmaWNhdGlvbiBvZiB0aGUgd29yayBmb3IgdGhlIGN1
c3RvbWVyJ3Mgb3duIHVzZSBhbmQgcmV2ZXJzZQorIyAtZW5naW5lZXJpbmcgZm9yIGRlYnVnZ2lu
ZyBzdWNoIG1vZGlmaWNhdGlvbnMuCisjIC0KKyMgLSAgWW91IG11c3QgZ2l2ZSBwcm9taW5lbnQg
bm90aWNlIHdpdGggZWFjaCBjb3B5IG9mIHRoZSB3b3JrIHRoYXQgdGhlCisjIC1MaWJyYXJ5IGlz
IHVzZWQgaW4gaXQgYW5kIHRoYXQgdGhlIExpYnJhcnkgYW5kIGl0cyB1c2UgYXJlIGNvdmVyZWQg
YnkKKyMgLXRoaXMgTGljZW5zZS4gIFlvdSBtdXN0IHN1cHBseSBhIGNvcHkgb2YgdGhpcyBMaWNl
bnNlLiAgSWYgdGhlIHdvcmsKKyMgLWR1cmluZyBleGVjdXRpb24gZGlzcGxheXMgY29weXJpZ2h0
IG5vdGljZXMsIHlvdSBtdXN0IGluY2x1ZGUgdGhlCisjIC1jb3B5cmlnaHQgbm90aWNlIGZvciB0
aGUgTGlicmFyeSBhbW9uZyB0aGVtLCBhcyB3ZWxsIGFzIGEgcmVmZXJlbmNlCisjIC1kaXJlY3Rp
bmcgdGhlIHVzZXIgdG8gdGhlIGNvcHkgb2YgdGhpcyBMaWNlbnNlLiAgQWxzbywgeW91IG11c3Qg
ZG8gb25lCisjIC1vZiB0aGVzZSB0aGluZ3M6CisjIC0KKyMgLSAgICBhKSBBY2NvbXBhbnkgdGhl
IHdvcmsgd2l0aCB0aGUgY29tcGxldGUgY29ycmVzcG9uZGluZworIyAtICAgIG1hY2hpbmUtcmVh
ZGFibGUgc291cmNlIGNvZGUgZm9yIHRoZSBMaWJyYXJ5IGluY2x1ZGluZyB3aGF0ZXZlcgorIyAt
ICAgIGNoYW5nZXMgd2VyZSB1c2VkIGluIHRoZSB3b3JrICh3aGljaCBtdXN0IGJlIGRpc3RyaWJ1
dGVkIHVuZGVyCisjIC0gICAgU2VjdGlvbnMgMSBhbmQgMiBhYm92ZSk7IGFuZCwgaWYgdGhlIHdv
cmsgaXMgYW4gZXhlY3V0YWJsZSBsaW5rZWQKKyMgLSAgICB3aXRoIHRoZSBMaWJyYXJ5LCB3aXRo
IHRoZSBjb21wbGV0ZSBtYWNoaW5lLXJlYWRhYmxlICJ3b3JrIHRoYXQKKyMgLSAgICB1c2VzIHRo
ZSBMaWJyYXJ5IiwgYXMgb2JqZWN0IGNvZGUgYW5kL29yIHNvdXJjZSBjb2RlLCBzbyB0aGF0IHRo
ZQorIyAtICAgIHVzZXIgY2FuIG1vZGlmeSB0aGUgTGlicmFyeSBhbmQgdGhlbiByZWxpbmsgdG8g
cHJvZHVjZSBhIG1vZGlmaWVkCisjIC0gICAgZXhlY3V0YWJsZSBjb250YWluaW5nIHRoZSBtb2Rp
ZmllZCBMaWJyYXJ5LiAgKEl0IGlzIHVuZGVyc3Rvb2QKKyMgLSAgICB0aGF0IHRoZSB1c2VyIHdo
byBjaGFuZ2VzIHRoZSBjb250ZW50cyBvZiBkZWZpbml0aW9ucyBmaWxlcyBpbiB0aGUKKyMgLSAg
ICBMaWJyYXJ5IHdpbGwgbm90IG5lY2Vzc2FyaWx5IGJlIGFibGUgdG8gcmVjb21waWxlIHRoZSBh
cHBsaWNhdGlvbgorIyAtICAgIHRvIHVzZSB0aGUgbW9kaWZpZWQgZGVmaW5pdGlvbnMuKQorIyAt
CisjIC0gICAgYikgVXNlIGEgc3VpdGFibGUgc2hhcmVkIGxpYnJhcnkgbWVjaGFuaXNtIGZvciBs
aW5raW5nIHdpdGggdGhlCisjIC0gICAgTGlicmFyeS4gIEEgc3VpdGFibGUgbWVjaGFuaXNtIGlz
IG9uZSB0aGF0ICgxKSB1c2VzIGF0IHJ1biB0aW1lIGEKKyMgLSAgICBjb3B5IG9mIHRoZSBsaWJy
YXJ5IGFscmVhZHkgcHJlc2VudCBvbiB0aGUgdXNlcidzIGNvbXB1dGVyIHN5c3RlbSwKKyMgLSAg
ICByYXRoZXIgdGhhbiBjb3B5aW5nIGxpYnJhcnkgZnVuY3Rpb25zIGludG8gdGhlIGV4ZWN1dGFi
bGUsIGFuZCAoMikKKyMgLSAgICB3aWxsIG9wZXJhdGUgcHJvcGVybHkgd2l0aCBhIG1vZGlmaWVk
IHZlcnNpb24gb2YgdGhlIGxpYnJhcnksIGlmCisjIC0gICAgdGhlIHVzZXIgaW5zdGFsbHMgb25l
LCBhcyBsb25nIGFzIHRoZSBtb2RpZmllZCB2ZXJzaW9uIGlzCisjIC0gICAgaW50ZXJmYWNlLWNv
bXBhdGlibGUgd2l0aCB0aGUgdmVyc2lvbiB0aGF0IHRoZSB3b3JrIHdhcyBtYWRlIHdpdGguCisj
IC0KKyMgLSAgICBjKSBBY2NvbXBhbnkgdGhlIHdvcmsgd2l0aCBhIHdyaXR0ZW4gb2ZmZXIsIHZh
bGlkIGZvciBhdAorIyAtICAgIGxlYXN0IHRocmVlIHllYXJzLCB0byBnaXZlIHRoZSBzYW1lIHVz
ZXIgdGhlIG1hdGVyaWFscworIyAtICAgIHNwZWNpZmllZCBpbiBTdWJzZWN0aW9uIDZhLCBhYm92
ZSwgZm9yIGEgY2hhcmdlIG5vIG1vcmUKKyMgLSAgICB0aGFuIHRoZSBjb3N0IG9mIHBlcmZvcm1p
bmcgdGhpcyBkaXN0cmlidXRpb24uCisjIC0KKyMgLSAgICBkKSBJZiBkaXN0cmlidXRpb24gb2Yg
dGhlIHdvcmsgaXMgbWFkZSBieSBvZmZlcmluZyBhY2Nlc3MgdG8gY29weQorIyAtICAgIGZyb20g
YSBkZXNpZ25hdGVkIHBsYWNlLCBvZmZlciBlcXVpdmFsZW50IGFjY2VzcyB0byBjb3B5IHRoZSBh
Ym92ZQorIyAtICAgIHNwZWNpZmllZCBtYXRlcmlhbHMgZnJvbSB0aGUgc2FtZSBwbGFjZS4KKyMg
LQorIyAtICAgIGUpIFZlcmlmeSB0aGF0IHRoZSB1c2VyIGhhcyBhbHJlYWR5IHJlY2VpdmVkIGEg
Y29weSBvZiB0aGVzZQorIyAtICAgIG1hdGVyaWFscyBvciB0aGF0IHlvdSBoYXZlIGFscmVhZHkg
c2VudCB0aGlzIHVzZXIgYSBjb3B5LgorIyAtCisjIC0gIEZvciBhbiBleGVjdXRhYmxlLCB0aGUg
cmVxdWlyZWQgZm9ybSBvZiB0aGUgIndvcmsgdGhhdCB1c2VzIHRoZQorIyAtTGlicmFyeSIgbXVz
dCBpbmNsdWRlIGFueSBkYXRhIGFuZCB1dGlsaXR5IHByb2dyYW1zIG5lZWRlZCBmb3IKKyMgLXJl
cHJvZHVjaW5nIHRoZSBleGVjdXRhYmxlIGZyb20gaXQuICBIb3dldmVyLCBhcyBhIHNwZWNpYWwg
ZXhjZXB0aW9uLAorIyAtdGhlIG1hdGVyaWFscyB0byBiZSBkaXN0cmlidXRlZCBuZWVkIG5vdCBp
bmNsdWRlIGFueXRoaW5nIHRoYXQgaXMKKyMgLW5vcm1hbGx5IGRpc3RyaWJ1dGVkIChpbiBlaXRo
ZXIgc291cmNlIG9yIGJpbmFyeSBmb3JtKSB3aXRoIHRoZSBtYWpvcgorIyAtY29tcG9uZW50cyAo
Y29tcGlsZXIsIGtlcm5lbCwgYW5kIHNvIG9uKSBvZiB0aGUgb3BlcmF0aW5nIHN5c3RlbSBvbgor
IyAtd2hpY2ggdGhlIGV4ZWN1dGFibGUgcnVucywgdW5sZXNzIHRoYXQgY29tcG9uZW50IGl0c2Vs
ZiBhY2NvbXBhbmllcworIyAtdGhlIGV4ZWN1dGFibGUuCisjIC0KKyMgLSAgSXQgbWF5IGhhcHBl
biB0aGF0IHRoaXMgcmVxdWlyZW1lbnQgY29udHJhZGljdHMgdGhlIGxpY2Vuc2UKKyMgLXJlc3Ry
aWN0aW9ucyBvZiBvdGhlciBwcm9wcmlldGFyeSBsaWJyYXJpZXMgdGhhdCBkbyBub3Qgbm9ybWFs
bHkKKyMgLWFjY29tcGFueSB0aGUgb3BlcmF0aW5nIHN5c3RlbS4gIFN1Y2ggYSBjb250cmFkaWN0
aW9uIG1lYW5zIHlvdSBjYW5ub3QKKyMgLXVzZSBib3RoIHRoZW0gYW5kIHRoZSBMaWJyYXJ5IHRv
Z2V0aGVyIGluIGFuIGV4ZWN1dGFibGUgdGhhdCB5b3UKKyMgLWRpc3RyaWJ1dGUuCisjIC0MCisj
IC0gIDcuIFlvdSBtYXkgcGxhY2UgbGlicmFyeSBmYWNpbGl0aWVzIHRoYXQgYXJlIGEgd29yayBi
YXNlZCBvbiB0aGUKKyMgLUxpYnJhcnkgc2lkZS1ieS1zaWRlIGluIGEgc2luZ2xlIGxpYnJhcnkg
dG9nZXRoZXIgd2l0aCBvdGhlciBsaWJyYXJ5CisjIC1mYWNpbGl0aWVzIG5vdCBjb3ZlcmVkIGJ5
IHRoaXMgTGljZW5zZSwgYW5kIGRpc3RyaWJ1dGUgc3VjaCBhIGNvbWJpbmVkCisjIC1saWJyYXJ5
LCBwcm92aWRlZCB0aGF0IHRoZSBzZXBhcmF0ZSBkaXN0cmlidXRpb24gb2YgdGhlIHdvcmsgYmFz
ZWQgb24KKyMgLXRoZSBMaWJyYXJ5IGFuZCBvZiB0aGUgb3RoZXIgbGlicmFyeSBmYWNpbGl0aWVz
IGlzIG90aGVyd2lzZQorIyAtcGVybWl0dGVkLCBhbmQgcHJvdmlkZWQgdGhhdCB5b3UgZG8gdGhl
c2UgdHdvIHRoaW5nczoKKyMgLQorIyAtICAgIGEpIEFjY29tcGFueSB0aGUgY29tYmluZWQgbGli
cmFyeSB3aXRoIGEgY29weSBvZiB0aGUgc2FtZSB3b3JrCisjIC0gICAgYmFzZWQgb24gdGhlIExp
YnJhcnksIHVuY29tYmluZWQgd2l0aCBhbnkgb3RoZXIgbGlicmFyeQorIyAtICAgIGZhY2lsaXRp
ZXMuICBUaGlzIG11c3QgYmUgZGlzdHJpYnV0ZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZQorIyAt
ICAgIFNlY3Rpb25zIGFib3ZlLgorIyAtCisjIC0gICAgYikgR2l2ZSBwcm9taW5lbnQgbm90aWNl
IHdpdGggdGhlIGNvbWJpbmVkIGxpYnJhcnkgb2YgdGhlIGZhY3QKKyMgLSAgICB0aGF0IHBhcnQg
b2YgaXQgaXMgYSB3b3JrIGJhc2VkIG9uIHRoZSBMaWJyYXJ5LCBhbmQgZXhwbGFpbmluZworIyAt
ICAgIHdoZXJlIHRvIGZpbmQgdGhlIGFjY29tcGFueWluZyB1bmNvbWJpbmVkIGZvcm0gb2YgdGhl
IHNhbWUgd29yay4KKyMgLQorIyAtICA4LiBZb3UgbWF5IG5vdCBjb3B5LCBtb2RpZnksIHN1Ymxp
Y2Vuc2UsIGxpbmsgd2l0aCwgb3IgZGlzdHJpYnV0ZQorIyAtdGhlIExpYnJhcnkgZXhjZXB0IGFz
IGV4cHJlc3NseSBwcm92aWRlZCB1bmRlciB0aGlzIExpY2Vuc2UuICBBbnkKKyMgLWF0dGVtcHQg
b3RoZXJ3aXNlIHRvIGNvcHksIG1vZGlmeSwgc3VibGljZW5zZSwgbGluayB3aXRoLCBvcgorIyAt
ZGlzdHJpYnV0ZSB0aGUgTGlicmFyeSBpcyB2b2lkLCBhbmQgd2lsbCBhdXRvbWF0aWNhbGx5IHRl
cm1pbmF0ZSB5b3VyCisjIC1yaWdodHMgdW5kZXIgdGhpcyBMaWNlbnNlLiAgSG93ZXZlciwgcGFy
dGllcyB3aG8gaGF2ZSByZWNlaXZlZCBjb3BpZXMsCisjIC1vciByaWdodHMsIGZyb20geW91IHVu
ZGVyIHRoaXMgTGljZW5zZSB3aWxsIG5vdCBoYXZlIHRoZWlyIGxpY2Vuc2VzCisjIC10ZXJtaW5h
dGVkIHNvIGxvbmcgYXMgc3VjaCBwYXJ0aWVzIHJlbWFpbiBpbiBmdWxsIGNvbXBsaWFuY2UuCisj
IC0KKyMgLSAgOS4gWW91IGFyZSBub3QgcmVxdWlyZWQgdG8gYWNjZXB0IHRoaXMgTGljZW5zZSwg
c2luY2UgeW91IGhhdmUgbm90CisjIC1zaWduZWQgaXQuICBIb3dldmVyLCBub3RoaW5nIGVsc2Ug
Z3JhbnRzIHlvdSBwZXJtaXNzaW9uIHRvIG1vZGlmeSBvcgorIyAtZGlzdHJpYnV0ZSB0aGUgTGli
cmFyeSBvciBpdHMgZGVyaXZhdGl2ZSB3b3Jrcy4gIFRoZXNlIGFjdGlvbnMgYXJlCisjIC1wcm9o
aWJpdGVkIGJ5IGxhdyBpZiB5b3UgZG8gbm90IGFjY2VwdCB0aGlzIExpY2Vuc2UuICBUaGVyZWZv
cmUsIGJ5CisjIC1tb2RpZnlpbmcgb3IgZGlzdHJpYnV0aW5nIHRoZSBMaWJyYXJ5IChvciBhbnkg
d29yayBiYXNlZCBvbiB0aGUKKyMgLUxpYnJhcnkpLCB5b3UgaW5kaWNhdGUgeW91ciBhY2NlcHRh
bmNlIG9mIHRoaXMgTGljZW5zZSB0byBkbyBzbywgYW5kCisjIC1hbGwgaXRzIHRlcm1zIGFuZCBj
b25kaXRpb25zIGZvciBjb3B5aW5nLCBkaXN0cmlidXRpbmcgb3IgbW9kaWZ5aW5nCisjIC10aGUg
TGlicmFyeSBvciB3b3JrcyBiYXNlZCBvbiBpdC4KKyMgLQorIyAtICAxMC4gRWFjaCB0aW1lIHlv
dSByZWRpc3RyaWJ1dGUgdGhlIExpYnJhcnkgKG9yIGFueSB3b3JrIGJhc2VkIG9uIHRoZQorIyAt
TGlicmFyeSksIHRoZSByZWNpcGllbnQgYXV0b21hdGljYWxseSByZWNlaXZlcyBhIGxpY2Vuc2Ug
ZnJvbSB0aGUKKyMgLW9yaWdpbmFsIGxpY2Vuc29yIHRvIGNvcHksIGRpc3RyaWJ1dGUsIGxpbmsg
d2l0aCBvciBtb2RpZnkgdGhlIExpYnJhcnkKKyMgLXN1YmplY3QgdG8gdGhlc2UgdGVybXMgYW5k
IGNvbmRpdGlvbnMuICBZb3UgbWF5IG5vdCBpbXBvc2UgYW55IGZ1cnRoZXIKKyMgLXJlc3RyaWN0
aW9ucyBvbiB0aGUgcmVjaXBpZW50cycgZXhlcmNpc2Ugb2YgdGhlIHJpZ2h0cyBncmFudGVkIGhl
cmVpbi4KKyMgLVlvdSBhcmUgbm90IHJlc3BvbnNpYmxlIGZvciBlbmZvcmNpbmcgY29tcGxpYW5j
ZSBieSB0aGlyZCBwYXJ0aWVzIHdpdGgKKyMgLXRoaXMgTGljZW5zZS4KKyMgLQwKKyMgLSAgMTEu
IElmLCBhcyBhIGNvbnNlcXVlbmNlIG9mIGEgY291cnQganVkZ21lbnQgb3IgYWxsZWdhdGlvbiBv
ZiBwYXRlbnQKKyMgLWluZnJpbmdlbWVudCBvciBmb3IgYW55IG90aGVyIHJlYXNvbiAobm90IGxp
bWl0ZWQgdG8gcGF0ZW50IGlzc3VlcyksCisjIC1jb25kaXRpb25zIGFyZSBpbXBvc2VkIG9uIHlv
dSAod2hldGhlciBieSBjb3VydCBvcmRlciwgYWdyZWVtZW50IG9yCisjIC1vdGhlcndpc2UpIHRo
YXQgY29udHJhZGljdCB0aGUgY29uZGl0aW9ucyBvZiB0aGlzIExpY2Vuc2UsIHRoZXkgZG8gbm90
CisjIC1leGN1c2UgeW91IGZyb20gdGhlIGNvbmRpdGlvbnMgb2YgdGhpcyBMaWNlbnNlLiAgSWYg
eW91IGNhbm5vdAorIyAtZGlzdHJpYnV0ZSBzbyBhcyB0byBzYXRpc2Z5IHNpbXVsdGFuZW91c2x5
IHlvdXIgb2JsaWdhdGlvbnMgdW5kZXIgdGhpcworIyAtTGljZW5zZSBhbmQgYW55IG90aGVyIHBl
cnRpbmVudCBvYmxpZ2F0aW9ucywgdGhlbiBhcyBhIGNvbnNlcXVlbmNlIHlvdQorIyAtbWF5IG5v
dCBkaXN0cmlidXRlIHRoZSBMaWJyYXJ5IGF0IGFsbC4gIEZvciBleGFtcGxlLCBpZiBhIHBhdGVu
dAorIyAtbGljZW5zZSB3b3VsZCBub3QgcGVybWl0IHJveWFsdHktZnJlZSByZWRpc3RyaWJ1dGlv
biBvZiB0aGUgTGlicmFyeSBieQorIyAtYWxsIHRob3NlIHdobyByZWNlaXZlIGNvcGllcyBkaXJl
Y3RseSBvciBpbmRpcmVjdGx5IHRocm91Z2ggeW91LCB0aGVuCisjIC10aGUgb25seSB3YXkgeW91
IGNvdWxkIHNhdGlzZnkgYm90aCBpdCBhbmQgdGhpcyBMaWNlbnNlIHdvdWxkIGJlIHRvCisjIC1y
ZWZyYWluIGVudGlyZWx5IGZyb20gZGlzdHJpYnV0aW9uIG9mIHRoZSBMaWJyYXJ5LgorIyAtCisj
IC1JZiBhbnkgcG9ydGlvbiBvZiB0aGlzIHNlY3Rpb24gaXMgaGVsZCBpbnZhbGlkIG9yIHVuZW5m
b3JjZWFibGUgdW5kZXIgYW55CisjIC1wYXJ0aWN1bGFyIGNpcmN1bXN0YW5jZSwgdGhlIGJhbGFu
Y2Ugb2YgdGhlIHNlY3Rpb24gaXMgaW50ZW5kZWQgdG8gYXBwbHksCisjIC1hbmQgdGhlIHNlY3Rp
b24gYXMgYSB3aG9sZSBpcyBpbnRlbmRlZCB0byBhcHBseSBpbiBvdGhlciBjaXJjdW1zdGFuY2Vz
LgorIyAtCisjIC1JdCBpcyBub3QgdGhlIHB1cnBvc2Ugb2YgdGhpcyBzZWN0aW9uIHRvIGluZHVj
ZSB5b3UgdG8gaW5mcmluZ2UgYW55CisjIC1wYXRlbnRzIG9yIG90aGVyIHByb3BlcnR5IHJpZ2h0
IGNsYWltcyBvciB0byBjb250ZXN0IHZhbGlkaXR5IG9mIGFueQorIyAtc3VjaCBjbGFpbXM7IHRo
aXMgc2VjdGlvbiBoYXMgdGhlIHNvbGUgcHVycG9zZSBvZiBwcm90ZWN0aW5nIHRoZQorIyAtaW50
ZWdyaXR5IG9mIHRoZSBmcmVlIHNvZnR3YXJlIGRpc3RyaWJ1dGlvbiBzeXN0ZW0gd2hpY2ggaXMK
KyMgLWltcGxlbWVudGVkIGJ5IHB1YmxpYyBsaWNlbnNlIHByYWN0aWNlcy4gIE1hbnkgcGVvcGxl
IGhhdmUgbWFkZQorIyAtZ2VuZXJvdXMgY29udHJpYnV0aW9ucyB0byB0aGUgd2lkZSByYW5nZSBv
ZiBzb2Z0d2FyZSBkaXN0cmlidXRlZAorIyAtdGhyb3VnaCB0aGF0IHN5c3RlbSBpbiByZWxpYW5j
ZSBvbiBjb25zaXN0ZW50IGFwcGxpY2F0aW9uIG9mIHRoYXQKKyMgLXN5c3RlbTsgaXQgaXMgdXAg
dG8gdGhlIGF1dGhvci9kb25vciB0byBkZWNpZGUgaWYgaGUgb3Igc2hlIGlzIHdpbGxpbmcKKyMg
LXRvIGRpc3RyaWJ1dGUgc29mdHdhcmUgdGhyb3VnaCBhbnkgb3RoZXIgc3lzdGVtIGFuZCBhIGxp
Y2Vuc2VlIGNhbm5vdAorIyAtaW1wb3NlIHRoYXQgY2hvaWNlLgorIyAtCisjIC1UaGlzIHNlY3Rp
b24gaXMgaW50ZW5kZWQgdG8gbWFrZSB0aG9yb3VnaGx5IGNsZWFyIHdoYXQgaXMgYmVsaWV2ZWQg
dG8KKyMgLWJlIGEgY29uc2VxdWVuY2Ugb2YgdGhlIHJlc3Qgb2YgdGhpcyBMaWNlbnNlLgorIyAt
CisjIC0gIDEyLiBJZiB0aGUgZGlzdHJpYnV0aW9uIGFuZC9vciB1c2Ugb2YgdGhlIExpYnJhcnkg
aXMgcmVzdHJpY3RlZCBpbgorIyAtY2VydGFpbiBjb3VudHJpZXMgZWl0aGVyIGJ5IHBhdGVudHMg
b3IgYnkgY29weXJpZ2h0ZWQgaW50ZXJmYWNlcywgdGhlCisjIC1vcmlnaW5hbCBjb3B5cmlnaHQg
aG9sZGVyIHdobyBwbGFjZXMgdGhlIExpYnJhcnkgdW5kZXIgdGhpcyBMaWNlbnNlIG1heSBhZGQK
KyMgLWFuIGV4cGxpY2l0IGdlb2dyYXBoaWNhbCBkaXN0cmlidXRpb24gbGltaXRhdGlvbiBleGNs
dWRpbmcgdGhvc2UgY291bnRyaWVzLAorIyAtc28gdGhhdCBkaXN0cmlidXRpb24gaXMgcGVybWl0
dGVkIG9ubHkgaW4gb3IgYW1vbmcgY291bnRyaWVzIG5vdCB0aHVzCisjIC1leGNsdWRlZC4gIElu
IHN1Y2ggY2FzZSwgdGhpcyBMaWNlbnNlIGluY29ycG9yYXRlcyB0aGUgbGltaXRhdGlvbiBhcyBp
ZgorIyAtd3JpdHRlbiBpbiB0aGUgYm9keSBvZiB0aGlzIExpY2Vuc2UuCisjIC0KKyMgLSAgMTMu
IFRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24gbWF5IHB1Ymxpc2ggcmV2aXNlZCBhbmQvb3Ig
bmV3CisjIC12ZXJzaW9ucyBvZiB0aGUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZnJv
bSB0aW1lIHRvIHRpbWUuCisjIC1TdWNoIG5ldyB2ZXJzaW9ucyB3aWxsIGJlIHNpbWlsYXIgaW4g
c3Bpcml0IHRvIHRoZSBwcmVzZW50IHZlcnNpb24sCisjIC1idXQgbWF5IGRpZmZlciBpbiBkZXRh
aWwgdG8gYWRkcmVzcyBuZXcgcHJvYmxlbXMgb3IgY29uY2VybnMuCisjIC0KKyMgLUVhY2ggdmVy
c2lvbiBpcyBnaXZlbiBhIGRpc3Rpbmd1aXNoaW5nIHZlcnNpb24gbnVtYmVyLiAgSWYgdGhlIExp
YnJhcnkKKyMgLXNwZWNpZmllcyBhIHZlcnNpb24gbnVtYmVyIG9mIHRoaXMgTGljZW5zZSB3aGlj
aCBhcHBsaWVzIHRvIGl0IGFuZAorIyAtImFueSBsYXRlciB2ZXJzaW9uIiwgeW91IGhhdmUgdGhl
IG9wdGlvbiBvZiBmb2xsb3dpbmcgdGhlIHRlcm1zIGFuZAorIyAtY29uZGl0aW9ucyBlaXRoZXIg
b2YgdGhhdCB2ZXJzaW9uIG9yIG9mIGFueSBsYXRlciB2ZXJzaW9uIHB1Ymxpc2hlZCBieQorIyAt
dGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4gIElmIHRoZSBMaWJyYXJ5IGRvZXMgbm90IHNw
ZWNpZnkgYQorIyAtbGljZW5zZSB2ZXJzaW9uIG51bWJlciwgeW91IG1heSBjaG9vc2UgYW55IHZl
cnNpb24gZXZlciBwdWJsaXNoZWQgYnkKKyMgLXRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24u
CisjIC0MCisjIC0gIDE0LiBJZiB5b3Ugd2lzaCB0byBpbmNvcnBvcmF0ZSBwYXJ0cyBvZiB0aGUg
TGlicmFyeSBpbnRvIG90aGVyIGZyZWUKKyMgLXByb2dyYW1zIHdob3NlIGRpc3RyaWJ1dGlvbiBj
b25kaXRpb25zIGFyZSBpbmNvbXBhdGlibGUgd2l0aCB0aGVzZSwKKyMgLXdyaXRlIHRvIHRoZSBh
dXRob3IgdG8gYXNrIGZvciBwZXJtaXNzaW9uLiAgRm9yIHNvZnR3YXJlIHdoaWNoIGlzCisjIC1j
b3B5cmlnaHRlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCB3cml0ZSB0byB0aGUg
RnJlZQorIyAtU29mdHdhcmUgRm91bmRhdGlvbjsgd2Ugc29tZXRpbWVzIG1ha2UgZXhjZXB0aW9u
cyBmb3IgdGhpcy4gIE91cgorIyAtZGVjaXNpb24gd2lsbCBiZSBndWlkZWQgYnkgdGhlIHR3byBn
b2FscyBvZiBwcmVzZXJ2aW5nIHRoZSBmcmVlIHN0YXR1cworIyAtb2YgYWxsIGRlcml2YXRpdmVz
IG9mIG91ciBmcmVlIHNvZnR3YXJlIGFuZCBvZiBwcm9tb3RpbmcgdGhlIHNoYXJpbmcKKyMgLWFu
ZCByZXVzZSBvZiBzb2Z0d2FyZSBnZW5lcmFsbHkuCisjIC0KKyMgLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBOTyBXQVJSQU5UWQorIyAtCisjIC0gIDE1LiBCRUNBVVNFIFRIRSBMSUJSQVJZ
IElTIExJQ0VOU0VEIEZSRUUgT0YgQ0hBUkdFLCBUSEVSRSBJUyBOTworIyAtV0FSUkFOVFkgRk9S
IFRIRSBMSUJSQVJZLCBUTyBUSEUgRVhURU5UIFBFUk1JVFRFRCBCWSBBUFBMSUNBQkxFIExBVy4K
KyMgLUVYQ0VQVCBXSEVOIE9USEVSV0lTRSBTVEFURUQgSU4gV1JJVElORyBUSEUgQ09QWVJJR0hU
IEhPTERFUlMgQU5EL09SCisjIC1PVEhFUiBQQVJUSUVTIFBST1ZJREUgVEhFIExJQlJBUlkgIkFT
IElTIiBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWQorIyAtS0lORCwgRUlUSEVSIEVYUFJFU1NFRCBP
UiBJTVBMSUVELCBJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgVEhFCisjIC1JTVBMSUVE
IFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VM
QVIKKyMgLVBVUlBPU0UuICBUSEUgRU5USVJFIFJJU0sgQVMgVE8gVEhFIFFVQUxJVFkgQU5EIFBF
UkZPUk1BTkNFIE9GIFRIRQorIyAtTElCUkFSWSBJUyBXSVRIIFlPVS4gIFNIT1VMRCBUSEUgTElC
UkFSWSBQUk9WRSBERUZFQ1RJVkUsIFlPVSBBU1NVTUUKKyMgLVRIRSBDT1NUIE9GIEFMTCBORUNF
U1NBUlkgU0VSVklDSU5HLCBSRVBBSVIgT1IgQ09SUkVDVElPTi4KKyMgLQorIyAtICAxNi4gSU4g
Tk8gRVZFTlQgVU5MRVNTIFJFUVVJUkVEIEJZIEFQUExJQ0FCTEUgTEFXIE9SIEFHUkVFRCBUTyBJ
TgorIyAtV1JJVElORyBXSUxMIEFOWSBDT1BZUklHSFQgSE9MREVSLCBPUiBBTlkgT1RIRVIgUEFS
VFkgV0hPIE1BWSBNT0RJRlkKKyMgLUFORC9PUiBSRURJU1RSSUJVVEUgVEhFIExJQlJBUlkgQVMg
UEVSTUlUVEVEIEFCT1ZFLCBCRSBMSUFCTEUgVE8gWU9VCisjIC1GT1IgREFNQUdFUywgSU5DTFVE
SU5HIEFOWSBHRU5FUkFMLCBTUEVDSUFMLCBJTkNJREVOVEFMIE9SCisjIC1DT05TRVFVRU5USUFM
IERBTUFHRVMgQVJJU0lORyBPVVQgT0YgVEhFIFVTRSBPUiBJTkFCSUxJVFkgVE8gVVNFIFRIRQor
IyAtTElCUkFSWSAoSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBMT1NTIE9GIERBVEEgT1Ig
REFUQSBCRUlORworIyAtUkVOREVSRUQgSU5BQ0NVUkFURSBPUiBMT1NTRVMgU1VTVEFJTkVEIEJZ
IFlPVSBPUiBUSElSRCBQQVJUSUVTIE9SIEEKKyMgLUZBSUxVUkUgT0YgVEhFIExJQlJBUlkgVE8g
T1BFUkFURSBXSVRIIEFOWSBPVEhFUiBTT0ZUV0FSRSksIEVWRU4gSUYKKyMgLVNVQ0ggSE9MREVS
IE9SIE9USEVSIFBBUlRZIEhBUyBCRUVOIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GIFNV
Q0gKKyMgLURBTUFHRVMuCisjIC0KKyMgLSAgICAgICAgICAgICAgICAgICAgIEVORCBPRiBURVJN
UyBBTkQgQ09ORElUSU9OUworIyAtDAorIyAtICAgICAgICAgICBIb3cgdG8gQXBwbHkgVGhlc2Ug
VGVybXMgdG8gWW91ciBOZXcgTGlicmFyaWVzCisjIC0KKyMgLSAgSWYgeW91IGRldmVsb3AgYSBu
ZXcgbGlicmFyeSwgYW5kIHlvdSB3YW50IGl0IHRvIGJlIG9mIHRoZSBncmVhdGVzdAorIyAtcG9z
c2libGUgdXNlIHRvIHRoZSBwdWJsaWMsIHdlIHJlY29tbWVuZCBtYWtpbmcgaXQgZnJlZSBzb2Z0
d2FyZSB0aGF0CisjIC1ldmVyeW9uZSBjYW4gcmVkaXN0cmlidXRlIGFuZCBjaGFuZ2UuICBZb3Ug
Y2FuIGRvIHNvIGJ5IHBlcm1pdHRpbmcKKyMgLXJlZGlzdHJpYnV0aW9uIHVuZGVyIHRoZXNlIHRl
cm1zIChvciwgYWx0ZXJuYXRpdmVseSwgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZQorIyAtb3JkaW5h
cnkgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSkuCisjIC0KKyMgLSAgVG8gYXBwbHkgdGhlc2UgdGVy
bXMsIGF0dGFjaCB0aGUgZm9sbG93aW5nIG5vdGljZXMgdG8gdGhlIGxpYnJhcnkuICBJdCBpcwor
IyAtc2FmZXN0IHRvIGF0dGFjaCB0aGVtIHRvIHRoZSBzdGFydCBvZiBlYWNoIHNvdXJjZSBmaWxl
IHRvIG1vc3QgZWZmZWN0aXZlbHkKKyMgLWNvbnZleSB0aGUgZXhjbHVzaW9uIG9mIHdhcnJhbnR5
OyBhbmQgZWFjaCBmaWxlIHNob3VsZCBoYXZlIGF0IGxlYXN0IHRoZQorIyAtImNvcHlyaWdodCIg
bGluZSBhbmQgYSBwb2ludGVyIHRvIHdoZXJlIHRoZSBmdWxsIG5vdGljZSBpcyBmb3VuZC4KKyMg
LQorIyAtICAgIDxvbmUgbGluZSB0byBnaXZlIHRoZSBsaWJyYXJ5J3MgbmFtZSBhbmQgYSBicmll
ZiBpZGVhIG9mIHdoYXQgaXQgZG9lcy4+CisjIC0gICAgQ29weXJpZ2h0IChDKSA8eWVhcj4gIDxu
YW1lIG9mIGF1dGhvcj4KKyMgLQorIyAtICAgIFRoaXMgbGlicmFyeSBpcyBmcmVlIHNvZnR3YXJl
OyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKKyMgLSAgICBtb2RpZnkgaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisjIC0gICAgTGljZW5z
ZSBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyCisj
IC0gICAgdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5b3VyIG9wdGlvbikgYW55
IGxhdGVyIHZlcnNpb24uCisjIC0KKyMgLSAgICBUaGlzIGxpYnJhcnkgaXMgZGlzdHJpYnV0ZWQg
aW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyMgLSAgICBidXQgV0lUSE9VVCBB
TlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorIyAtICAg
IE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNl
ZSB0aGUgR05VCisjIC0gICAgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUg
ZGV0YWlscy4KKyMgLQorIyAtICAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2Yg
dGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyMgLSAgICBMaWNlbnNlIGFsb25nIHdpdGgg
dGhpcyBsaWJyYXJ5OyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCisjIC0gICAg
Rm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9u
LCBNQSAgMDIxMTAtMTMwMSAgVVNBCisjIC0KKyMgLUFsc28gYWRkIGluZm9ybWF0aW9uIG9uIGhv
dyB0byBjb250YWN0IHlvdSBieSBlbGVjdHJvbmljIGFuZCBwYXBlciBtYWlsLgorIyAtCisjIC1Z
b3Ugc2hvdWxkIGFsc28gZ2V0IHlvdXIgZW1wbG95ZXIgKGlmIHlvdSB3b3JrIGFzIGEgcHJvZ3Jh
bW1lcikgb3IgeW91cgorIyAtc2Nob29sLCBpZiBhbnksIHRvIHNpZ24gYSAiY29weXJpZ2h0IGRp
c2NsYWltZXIiIGZvciB0aGUgbGlicmFyeSwgaWYKKyMgLW5lY2Vzc2FyeS4gIEhlcmUgaXMgYSBz
YW1wbGU7IGFsdGVyIHRoZSBuYW1lczoKKyMgLQorIyAtICBZb3lvZHluZSwgSW5jLiwgaGVyZWJ5
IGRpc2NsYWltcyBhbGwgY29weXJpZ2h0IGludGVyZXN0IGluIHRoZQorIyAtICBsaWJyYXJ5IGBG
cm9iJyAoYSBsaWJyYXJ5IGZvciB0d2Vha2luZyBrbm9icykgd3JpdHRlbiBieSBKYW1lcyBSYW5k
b20gSGFja2VyLgorIyAtCisjIC0gIDxzaWduYXR1cmUgb2YgVHkgQ29vbj4sIDEgQXByaWwgMTk5
MAorIyAtICBUeSBDb29uLCBQcmVzaWRlbnQgb2YgVmljZQorIyAtCisjIC1UaGF0J3MgYWxsIHRo
ZXJlIGlzIHRvIGl0IQorIyArVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhP
VVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyMgK0lNUExJRUQsIElOQ0xVRElO
RyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAor
IyArRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4g
SU4gTk8gRVZFTlQgU0hBTEwgVEhFCisjICtBVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJF
IExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSCisjICtMSUFCSUxJVFksIFdI
RVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lO
RyBGUk9NLAorIyArT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1Ig
VEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUKKyMgK1NPRlRXQVJFLgorIyAKKyMKKwor
U1VNTUFSWSA9ICJVbml2ZXJzYWwgZW5jb2RpbmcgZGV0ZWN0b3IgZm9yIFB5dGhvbiAyIGFuZCAz
IgorSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L2NoYXJkZXQvIgorTElDRU5T
RSA9ICJMR1BMLTIuMS1vbmx5IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTtt
ZDU9MDg0YTE4MTBhNjc5ZDVmMjMwZDA4NmI4ZDQ3MDNmOTAiCisKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI4ZjQ3YmM0YWNjYWMxN2JkOWFjY2JiNGFjYzFkNTYzYWNjMDI0YTc4MzgwNmMwYTQzYzNh
NTgzZjUyODU2OTBiIgorCitpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0
YQorCitQQUNLQUdFUyA9KyAiJHtQTn0tY2xpIgorRklMRVM6JHtQTn0tY2xpICs9ICIgXAorICAg
ICR7UFlUSE9OX1NJVEVQQUNLQUdFU19ESVJ9L2NoYXJkZXQvY2xpIFwKKyIKKworUkRFUEVORFM6
JHtQTn0tY2xpID0gIiR7UE59ICIKKworUkRFUEVORFM6JHtQTn06Y2xhc3MtdGFyZ2V0ICs9ICIg
XAorICAgIHB5dGhvbjMtbG9nZ2luZyBcCisiCisKK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5h
dGl2ZXNkayIKLS0gCjIuNDcuMQoK

--===============1303141208908419133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-ab3d8f47d96fd98493e66abbf93cf336c4fac0f8"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:ab3d8f47d96fd98493e66abbf93cf336c4fac0f8"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 194 Local 181 Mirrors 0 Missed 13 Current 449 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 542 of 643 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_spdx_setscene)
NOTE: Running task 849 of 1843 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.1.0.bb:do_recipe_qa)
NOTE: recipe python3-chardet-7.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 605 of 643 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-chardet-7.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1049 of 1843 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.1.0.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 643 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_spdx_setscene)
NOTE: recipe python3-chardet-7.1.0-r0: task do_fetch: Started
NOTE: recipe python3-chardet-7.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1062 of 1843 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.1.0.bb:do_unpack)
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx_setscene: Started
NOTE: recipe python3-chardet-7.1.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 618 of 643 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-chardet-7.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1111 of 1843 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.1.0.bb:do_patch)
NOTE: recipe python3-chardet-7.1.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 643 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 627 of 643 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-chardet-7.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1112 of 1843 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1113 of 1843 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.1.0.bb:do_populate_lic)
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-chardet-7.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-7.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 628 of 643 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-build-native-1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 629 of 643 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-chardet-7.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-build-native-1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 631 of 643 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-chardet-7.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 643 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 643 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-build-native-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-native-3.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-build-native-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 643 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 643 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-native-3.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 643 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 643 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1691 of 1843 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1826 of 1843 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-chardet-7.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-7.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-chardet-7.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-7.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1831 of 1843 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.1.0.bb:do_configure)
NOTE: recipe python3-chardet-7.1.0-r0: task do_configure: Started
NOTE: recipe python3-chardet-7.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1832 of 1843 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.1.0.bb:do_compile)
NOTE: recipe python3-chardet-7.1.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-chardet/7.1.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
|     raise BackendUnavailable(
|     ...<4 lines>...
|     )
| pyproject_hooks._impl.BackendUnavailable: Cannot import 'hatchling.build'
| 
| ERROR Backend 'hatchling.build' is not available.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-chardet/7.1.0/temp/run.do_compile.1407913:151 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-chardet/7.1.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-chardet/7.1.0/sources/chardet-7.1.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-chardet/7.1.0/temp/run.do_compile.1407913, line 151
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-chardet/7.1.0/temp/run.do_compile.1407913, line 146
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-chardet/7.1.0/temp/run.do_compile.1407913, line 163
NOTE: recipe python3-chardet-7.1.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1832 tasks of which 1822 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315073902.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315073902.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.1.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-chardet/7.1.0/temp/log.do_compile.1407913
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-chardet-7.1.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-chardet/7.1.0/temp/run.do_compile.1407913' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-chardet/7.1.0/temp/log.do_compile.1407913
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_7.1.0.bb:do_compile) failed with exit code '1'

--===============1303141208908419133==--

