Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78F1CD37AB
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:41 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15706.1777645529764079558
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ymW3+Tlv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=b7292fYf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019de3ee4f62-a909e0fa-4cbb-4354-93b6-85723153d044-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645539;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YgWXtKNevAuKmTutvWVlvrS7uQNZuPLclcGessKAS+I=;
	b=ymW3+TlvmXYdcf0VrPp6aTZ+KL03H7aNvgDMcH64bY+2zQjqxw4UqdiqRB9iEDsB
	ZnlBTNZGPQgg2Vo50i/H19usN2BlcNOQPnjwP5oObi47hravnLxg2qqAhxSRbixjC9r
	H0CAfWoTah1nigJUzIg444YOMudXyQfMAI/JKO0A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645539;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YgWXtKNevAuKmTutvWVlvrS7uQNZuPLclcGessKAS+I=;
	b=b7292fYfrtJdd6wi44DjbFebrQKETZrday0JFQT+ID6fVMzUZUujuEoceDvM4uTN
	SPZJhfYEFeAXtS0YhKpL/FCGRbptAaVcXgWiexrUPtSYwuKB4Fotw0ixXi9ELkNDJEe
	Rb+zrnV6KcsoG3ljbKGuixpwZeF8zK5w+zZFUX24=
Content-Type: multipart/mixed; boundary="===============0871639332578799194=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-chardet: upgrading to 7.4.3 SUCCEEDED
Message-ID: <0101019de3ee4f62-a909e0fa-4cbb-4354-93b6-85723153d044-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236232

--===============0871639332578799194==
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
From 62e723cb922e0b93680060a53d906836a3a3d87d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 08:10:24 +0000
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


--===============0871639332578799194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-cli: PKGSIZE changed from 9914 to 0 (-100%)
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-cli: FILELIST: removed all items "/usr/lib/python3.14/site-packages/chardet/cli/chardetect.py /usr/lib/python3.14/site-packages/chardet/cli/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/cli/__init__.py /usr/lib/python3.14/site-packages/chardet/cli/__pycache__/chardetect.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet: PKGSIZE changed from 24721887 to 1120674 (-95%)
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet: FILELIST: directory renamed /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/licenses -> /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info -> /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info, removed "/usr/lib/python3.14/site-packages/chardet/__pycache__/cp949prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/escprober.py /usr/lib/python3.14/site-packages/chardet/langdutchmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/resultdict.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/johabfreq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/charsetprober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langthaimodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/codingstatemachinedict.cpython-314.pyc /usr/lib/python3
 .14/site-packages/chardet/langitalianmodel.py /usr/lib/python3.14/site-packages/chardet/langspanishmodel.py /usr/lib/python3.14/site-packages/chardet/langpolishmodel.py /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/languages.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langbelarusianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langindonesianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langscottishgaelicmodel.py /usr/lib/python3.14/site-packages/chardet/langindonesianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langczechmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langdutchmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langfarsimodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langgreekmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langirishmodel.cpython-314.pyc 
 /usr/lib/python3.14/site-packages/chardet/__pycache__/langmalaymodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langtajikmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langwelshmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/gb2312freq.py /usr/lib/python3.14/site-packages/chardet/langthaimodel.py /usr/lib/python3.14/site-packages/chardet/codingstatemachinedict.py /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcsgroupprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/sbcsgroupprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langromanianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/escprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/jisfreq.py /usr/lib/python3.14/site-packages/chardet/__pycache__/utf8prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/si
 te-packages/chardet/langslovenemodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/euckrprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langportuguesemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/big5freq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/codingstatemachine.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langdanishmodel.py /usr/lib/python3.14/site-packages/chardet/langkazakhmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/big5prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/jisfreq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langlatvianmodel.py /usr/lib/python3.14/site-packages/chardet/langturkishmodel.py /usr/lib/python3.14/site-packages/chardet/gb18030prober.py /usr/lib/python3.14/site-packages/chardet/langcroatianmodel.py /usr/lib/python3.14/site-packages/chardet/mbcsgroupprober.py /usr/lib/python3.14/site-pack
 ages/chardet/sbcsgroupprober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/gb18030prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langczechmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langkazakhmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langpolishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langslovakmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langarabicmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langbretonmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langdanishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langfrenchmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langgermanmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langhebrewmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pyc
 ache__/jpcntx.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langhebrewmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langesperantomodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langirishmodel.py /usr/lib/python3.14/site-packages/chardet/language_model_notes.md /usr/lib/python3.14/site-packages/chardet/langrussianmodel.py /usr/lib/python3.14/site-packages/chardet/big5prober.py /usr/lib/python3.14/site-packages/chardet/sjisprober.py /usr/lib/python3.14/site-packages/chardet/utf8prober.py /usr/lib/python3.14/site-packages/chardet/version.py /usr/lib/python3.14/site-packages/chardet/langlithuanianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/utf1632prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/charsetprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langvietnamesemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/big5freq.py /usr/lib/python3.14/site-packag
 es/chardet/langbulgarianmodel.py /usr/lib/python3.14/site-packages/chardet/langgermanmodel.py /usr/lib/python3.14/site-packages/chardet/metadata/charsets.py /usr/lib/python3.14/site-packages/chardet/metadata/__init__.py /usr/lib/python3.14/site-packages/chardet/__pycache__/charsetgroupprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/languages.py /usr/lib/python3.14/site-packages/chardet/langfarsimodel.py /usr/lib/python3.14/site-packages/chardet/langswedishmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langcroatianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langestonianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langicelandicmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langromanianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/codingstatemachine.py /usr/lib/python3.14/site-packages/chardet/langhungarianmodel.py /usr/lib/python3.14/s
 ite-packages/chardet/langmaltesemodel.py /usr/lib/python3.14/site-packages/chardet/langarabicmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcharsetprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/sbcharsetprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/johabprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/euckrfreq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/cp949prober.py /usr/lib/python3.14/site-packages/chardet/eucjpprober.py /usr/lib/python3.14/site-packages/chardet/euckrprober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/gb2312freq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/johabprober.py /usr/lib/python3.14/site-packages/chardet/langslovakmodel.py /usr/lib/python3.14/site-packages/chardet/langfinnishmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langspanishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/
 __pycache__/langswedishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langturkishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langenglishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langfinnishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langitalianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langbulgarianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langhungarianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langlatvianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langnorwegianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langrussianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langserbianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langukrainianmodel.cpy
 thon-314.pyc /usr/lib/python3.14/site-packages/chardet/langbretonmodel.py /usr/lib/python3.14/site-packages/chardet/langfrenchmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/eucjpprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/charsetgroupprober.py /usr/lib/python3.14/site-packages/chardet/langenglishmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/escsm.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/version.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/mbcharsetprober.py /usr/lib/python3.14/site-packages/chardet/sbcharsetprober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/hebrewprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langserbianmodel.py /usr/lib/python3.14/site-packages/chardet/resultdict.py /usr/lib/python3.14/site-packages/chardet/langicelandicmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/chardistribution.cpython-314.pyc /usr/lib/python3.14/site-p
 ackages/chardet/langnorwegianmodel.py /usr/lib/python3.14/site-packages/chardet/langukrainianmodel.py /usr/lib/python3.14/site-packages/chardet/utf1632prober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langmaltesemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langslovenemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langlithuanianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langmacedonianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langscottishgaelicmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langmalaymodel.py /usr/lib/python3.14/site-packages/chardet/langtajikmodel.py /usr/lib/python3.14/site-packages/chardet/langwelshmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcssm.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langbelarusianmodel.py /usr/lib/python3.14/site-packages/chardet/chardistribution.py /usr
 /lib/python3.14/site-packages/chardet/langesperantomodel.py /usr/lib/python3.14/site-packages/chardet/langvietnamesemodel.py /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/charsets.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/escsm.py /usr/lib/python3.14/site-packages/chardet/euckrfreq.py /usr/lib/python3.14/site-packages/chardet/johabfreq.py /usr/lib/python3.14/site-packages/chardet/hebrewprober.py /usr/lib/python3.14/site-packages/chardet/jpcntx.py /usr/lib/python3.14/site-packages/chardet/langmacedonianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/sjisprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langportuguesemodel.py /usr/lib/python3.14/site-packages/chardet/mbcssm.py /usr/lib/python3.14/site-packages/chardet/langgreekmodel.py /usr/lib/python3.14/site-packages/chardet/langestonianmodel.py", added "/usr/lib/python3.14/site-packages/chardet/__pycache__/cli.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pi
 peline/__pycache__/statistical.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/markup.py /usr/lib/python3.14/site-packages/chardet/__pycache__/_version.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/escape.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/cli.py /usr/lib/python3.14/site-packages/chardet/detector.py /usr/lib/python3.14/site-packages/chardet/_version.py /usr/lib/python3.14/site-packages/chardet/pipeline/statistical.py /usr/lib/python3.14/site-packages/chardet/pipeline/utf8.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/utf1632.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/structural.py /usr/lib/python3.14/site-packages/chardet/pipeline/orchestrator.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/binary.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/
 escape.py /usr/lib/python3.14/site-packages/chardet/models/confusion.bin /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/confusion.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/detector.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/binary.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/structural.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/bom.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/confusion.py /usr/lib/python3.14/site-packages/chardet/pipeline/ascii.py /usr/lib/python3.14/site-packages/chardet/pipeline/magic.py /usr/lib/python3.14/site-packages/chardet/__pycache__/_utils.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/idf.bin /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/validity.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/registry.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__
 /markup.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/orchestrator.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/equivalences.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/_utils.py /usr/lib/python3.14/site-packages/chardet/__pycache__/registry.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/utf1632.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/ascii.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/training_metadata.yaml /usr/lib/python3.14/site-packages/chardet/pipeline/__init__.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/utf8.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/validity.py /usr/lib/python3.14/site-packages/chardet/equivalences.py /usr/lib/python3.14/site-packages/chardet/pipeline/bom.py /usr/lib/python3.14/site-packages/
 chardet/models/models.bin /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/magic.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/__init__.py"
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

--===============0871639332578799194==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-chardet-upgrade-6.0.0.post1-7.4.3.patch"

RnJvbSA2MmU3MjNjYjkyMmUwYjkzNjgwMDYwYTUzZDkwNjgzNmEzYTNkODdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwODoxMDoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2hhcmRldDogdXBncmFkZSA2LjAuMC5wb3N0MSAtPiA3LjQuMwoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtY2hhcmRldF82LjAuMC5wb3N0MS5iYiAgICAgfCAgMjMgLQogLi4uL3B5dGhv
bi9weXRob24zLWNoYXJkZXRfNy40LjMuYmIgICAgICAgICAgIHwgNTQ4ICsrKysrKysrKysrKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCA1NDggaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWNoYXJkZXRfNi4wLjAucG9zdDEuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2hhcmRldF83LjQuMy5iYgoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jaGFyZGV0XzYuMC4wLnBvc3QxLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNoYXJkZXRfNi4wLjAucG9z
dDEuYmIKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDE0YzMyNDdiMzUuLjAwMDAwMDAw
MDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNoYXJkZXRfNi4w
LjAucG9zdDEuYmIKKysrIC9kZXYvbnVsbApAQCAtMSwyMyArMCwwIEBACi1TVU1NQVJZID0gIlVu
aXZlcnNhbCBlbmNvZGluZyBkZXRlY3RvciBmb3IgUHl0aG9uIDIgYW5kIDMiCi1IT01FUEFHRSA9
ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvY2hhcmRldC8iCi1MSUNFTlNFID0gIkxHUEwtMi4x
LW9ubHkiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT00YmY2NjFjMWUz
NzkzZTU1YzhkMTA1MWJjNWUwYWUyMSIKLQotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZiNzgwNDhj
M2M5N2M3YjJlZDFmYmFkN2ExOGY3NmY1YTY1NDdmN2QzNGRiYWI1MzZjYzEzODg3YzlhOTJmYTQi
Ci0KLWluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCi0KLURFUEVORFMgKz0gInB5dGhvbjMt
aGF0Y2gtdmNzLW5hdGl2ZSIKLQotUEFDS0FHRVMgPSsgIiR7UE59LWNsaSIKLUZJTEVTOiR7UE59
LWNsaSArPSAiIFwKLSAgICAke1BZVEhPTl9TSVRFUEFDS0FHRVNfRElSfS9jaGFyZGV0L2NsaSBc
Ci0iCi0KLVJERVBFTkRTOiR7UE59LWNsaSA9ICIke1BOfSAiCi0KLVJERVBFTkRTOiR7UE59OmNs
YXNzLXRhcmdldCArPSAiIFwKLSAgICBweXRob24zLWxvZ2dpbmcgXAotIgotCi1CQkNMQVNTRVhU
RU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2hhcmRldF83LjQuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jaGFyZGV0XzcuNC4zLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjA5NTZjMTBmOTkKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2hhcmRldF83LjQuMy5iYgpAQCAtMCwwICsxLDU0
OCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRh
dGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJl
bmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1
cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFu
Z2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgor
IyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQor
IworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAg
LTEsNTAxICsxLDEyIEBACisjIC0gICAgICAgICAgICAgICAgICBHTlUgTEVTU0VSIEdFTkVSQUwg
UFVCTElDIExJQ0VOU0UKKyMgLSAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lvbiAyLjEsIEZl
YnJ1YXJ5IDE5OTkKKyMgK0NvcHlyaWdodCAoYykgMjAyNiBEYW4gQmxhbmNoYXJkCisjICAKKyMg
LSBDb3B5cmlnaHQgKEMpIDE5OTEsIDE5OTkgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMu
CisjIC0gPGh0dHBzOi8vZnNmLm9yZy8+CisjIC0gRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNv
cHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzCisjIC0gb2YgdGhpcyBsaWNlbnNlIGRv
Y3VtZW50LCBidXQgY2hhbmdpbmcgaXQgaXMgbm90IGFsbG93ZWQuCisjICtQZXJtaXNzaW9uIHRv
IHVzZSwgY29weSwgbW9kaWZ5LCBhbmQvb3IgZGlzdHJpYnV0ZSB0aGlzIHNvZnR3YXJlIGZvciBh
bnkKKyMgK3B1cnBvc2Ugd2l0aCBvciB3aXRob3V0IGZlZSBpcyBoZXJlYnkgZ3JhbnRlZC4KKyMg
IAorIyAtW1RoaXMgaXMgdGhlIGZpcnN0IHJlbGVhc2VkIHZlcnNpb24gb2YgdGhlIExlc3NlciBH
UEwuICBJdCBhbHNvIGNvdW50cworIyAtIGFzIHRoZSBzdWNjZXNzb3Igb2YgdGhlIEdOVSBMaWJy
YXJ5IFB1YmxpYyBMaWNlbnNlLCB2ZXJzaW9uIDIsIGhlbmNlCisjIC0gdGhlIHZlcnNpb24gbnVt
YmVyIDIuMS5dCisjIC0KKyMgLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBQcmVhbWJsZQor
IyAtCisjIC0gIFRoZSBsaWNlbnNlcyBmb3IgbW9zdCBzb2Z0d2FyZSBhcmUgZGVzaWduZWQgdG8g
dGFrZSBhd2F5IHlvdXIKKyMgLWZyZWVkb20gdG8gc2hhcmUgYW5kIGNoYW5nZSBpdC4gIEJ5IGNv
bnRyYXN0LCB0aGUgR05VIEdlbmVyYWwgUHVibGljCisjIC1MaWNlbnNlcyBhcmUgaW50ZW5kZWQg
dG8gZ3VhcmFudGVlIHlvdXIgZnJlZWRvbSB0byBzaGFyZSBhbmQgY2hhbmdlCisjIC1mcmVlIHNv
ZnR3YXJlLS10byBtYWtlIHN1cmUgdGhlIHNvZnR3YXJlIGlzIGZyZWUgZm9yIGFsbCBpdHMgdXNl
cnMuCisjIC0KKyMgLSAgVGhpcyBsaWNlbnNlLCB0aGUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UsIGFwcGxpZXMgdG8gc29tZQorIyAtc3BlY2lhbGx5IGRlc2lnbmF0ZWQgc29mdHdhcmUg
cGFja2FnZXMtLXR5cGljYWxseSBsaWJyYXJpZXMtLW9mIHRoZQorIyAtRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uIGFuZCBvdGhlciBhdXRob3JzIHdobyBkZWNpZGUgdG8gdXNlIGl0LiAgWW91Cisj
IC1jYW4gdXNlIGl0IHRvbywgYnV0IHdlIHN1Z2dlc3QgeW91IGZpcnN0IHRoaW5rIGNhcmVmdWxs
eSBhYm91dCB3aGV0aGVyCisjIC10aGlzIGxpY2Vuc2Ugb3IgdGhlIG9yZGluYXJ5IEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgaXMgdGhlIGJldHRlcgorIyAtc3RyYXRlZ3kgdG8gdXNlIGluIGFueSBw
YXJ0aWN1bGFyIGNhc2UsIGJhc2VkIG9uIHRoZSBleHBsYW5hdGlvbnMgYmVsb3cuCisjIC0KKyMg
LSAgV2hlbiB3ZSBzcGVhayBvZiBmcmVlIHNvZnR3YXJlLCB3ZSBhcmUgcmVmZXJyaW5nIHRvIGZy
ZWVkb20gb2YgdXNlLAorIyAtbm90IHByaWNlLiAgT3VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2Vz
IGFyZSBkZXNpZ25lZCB0byBtYWtlIHN1cmUgdGhhdAorIyAteW91IGhhdmUgdGhlIGZyZWVkb20g
dG8gZGlzdHJpYnV0ZSBjb3BpZXMgb2YgZnJlZSBzb2Z0d2FyZSAoYW5kIGNoYXJnZQorIyAtZm9y
IHRoaXMgc2VydmljZSBpZiB5b3Ugd2lzaCk7IHRoYXQgeW91IHJlY2VpdmUgc291cmNlIGNvZGUg
b3IgY2FuIGdldAorIyAtaXQgaWYgeW91IHdhbnQgaXQ7IHRoYXQgeW91IGNhbiBjaGFuZ2UgdGhl
IHNvZnR3YXJlIGFuZCB1c2UgcGllY2VzIG9mCisjIC1pdCBpbiBuZXcgZnJlZSBwcm9ncmFtczsg
YW5kIHRoYXQgeW91IGFyZSBpbmZvcm1lZCB0aGF0IHlvdSBjYW4gZG8KKyMgLXRoZXNlIHRoaW5n
cy4KKyMgLQorIyAtICBUbyBwcm90ZWN0IHlvdXIgcmlnaHRzLCB3ZSBuZWVkIHRvIG1ha2UgcmVz
dHJpY3Rpb25zIHRoYXQgZm9yYmlkCisjIC1kaXN0cmlidXRvcnMgdG8gZGVueSB5b3UgdGhlc2Ug
cmlnaHRzIG9yIHRvIGFzayB5b3UgdG8gc3VycmVuZGVyIHRoZXNlCisjIC1yaWdodHMuICBUaGVz
ZSByZXN0cmljdGlvbnMgdHJhbnNsYXRlIHRvIGNlcnRhaW4gcmVzcG9uc2liaWxpdGllcyBmb3IK
KyMgLXlvdSBpZiB5b3UgZGlzdHJpYnV0ZSBjb3BpZXMgb2YgdGhlIGxpYnJhcnkgb3IgaWYgeW91
IG1vZGlmeSBpdC4KKyMgLQorIyAtICBGb3IgZXhhbXBsZSwgaWYgeW91IGRpc3RyaWJ1dGUgY29w
aWVzIG9mIHRoZSBsaWJyYXJ5LCB3aGV0aGVyIGdyYXRpcworIyAtb3IgZm9yIGEgZmVlLCB5b3Ug
bXVzdCBnaXZlIHRoZSByZWNpcGllbnRzIGFsbCB0aGUgcmlnaHRzIHRoYXQgd2UgZ2F2ZQorIyAt
eW91LiAgWW91IG11c3QgbWFrZSBzdXJlIHRoYXQgdGhleSwgdG9vLCByZWNlaXZlIG9yIGNhbiBn
ZXQgdGhlIHNvdXJjZQorIyAtY29kZS4gIElmIHlvdSBsaW5rIG90aGVyIGNvZGUgd2l0aCB0aGUg
bGlicmFyeSwgeW91IG11c3QgcHJvdmlkZQorIyAtY29tcGxldGUgb2JqZWN0IGZpbGVzIHRvIHRo
ZSByZWNpcGllbnRzLCBzbyB0aGF0IHRoZXkgY2FuIHJlbGluayB0aGVtCisjIC13aXRoIHRoZSBs
aWJyYXJ5IGFmdGVyIG1ha2luZyBjaGFuZ2VzIHRvIHRoZSBsaWJyYXJ5IGFuZCByZWNvbXBpbGlu
ZworIyAtaXQuICBBbmQgeW91IG11c3Qgc2hvdyB0aGVtIHRoZXNlIHRlcm1zIHNvIHRoZXkga25v
dyB0aGVpciByaWdodHMuCisjIC0KKyMgLSAgV2UgcHJvdGVjdCB5b3VyIHJpZ2h0cyB3aXRoIGEg
dHdvLXN0ZXAgbWV0aG9kOiAoMSkgd2UgY29weXJpZ2h0IHRoZQorIyAtbGlicmFyeSwgYW5kICgy
KSB3ZSBvZmZlciB5b3UgdGhpcyBsaWNlbnNlLCB3aGljaCBnaXZlcyB5b3UgbGVnYWwKKyMgLXBl
cm1pc3Npb24gdG8gY29weSwgZGlzdHJpYnV0ZSBhbmQvb3IgbW9kaWZ5IHRoZSBsaWJyYXJ5Lgor
IyAtCisjIC0gIFRvIHByb3RlY3QgZWFjaCBkaXN0cmlidXRvciwgd2Ugd2FudCB0byBtYWtlIGl0
IHZlcnkgY2xlYXIgdGhhdAorIyAtdGhlcmUgaXMgbm8gd2FycmFudHkgZm9yIHRoZSBmcmVlIGxp
YnJhcnkuICBBbHNvLCBpZiB0aGUgbGlicmFyeSBpcworIyAtbW9kaWZpZWQgYnkgc29tZW9uZSBl
bHNlIGFuZCBwYXNzZWQgb24sIHRoZSByZWNpcGllbnRzIHNob3VsZCBrbm93CisjIC10aGF0IHdo
YXQgdGhleSBoYXZlIGlzIG5vdCB0aGUgb3JpZ2luYWwgdmVyc2lvbiwgc28gdGhhdCB0aGUgb3Jp
Z2luYWwKKyMgLWF1dGhvcidzIHJlcHV0YXRpb24gd2lsbCBub3QgYmUgYWZmZWN0ZWQgYnkgcHJv
YmxlbXMgdGhhdCBtaWdodCBiZQorIyAtaW50cm9kdWNlZCBieSBvdGhlcnMuCisjIC0MCisjIC0g
IEZpbmFsbHksIHNvZnR3YXJlIHBhdGVudHMgcG9zZSBhIGNvbnN0YW50IHRocmVhdCB0byB0aGUg
ZXhpc3RlbmNlIG9mCisjIC1hbnkgZnJlZSBwcm9ncmFtLiAgV2Ugd2lzaCB0byBtYWtlIHN1cmUg
dGhhdCBhIGNvbXBhbnkgY2Fubm90CisjIC1lZmZlY3RpdmVseSByZXN0cmljdCB0aGUgdXNlcnMg
b2YgYSBmcmVlIHByb2dyYW0gYnkgb2J0YWluaW5nIGEKKyMgLXJlc3RyaWN0aXZlIGxpY2Vuc2Ug
ZnJvbSBhIHBhdGVudCBob2xkZXIuICBUaGVyZWZvcmUsIHdlIGluc2lzdCB0aGF0CisjIC1hbnkg
cGF0ZW50IGxpY2Vuc2Ugb2J0YWluZWQgZm9yIGEgdmVyc2lvbiBvZiB0aGUgbGlicmFyeSBtdXN0
IGJlCisjIC1jb25zaXN0ZW50IHdpdGggdGhlIGZ1bGwgZnJlZWRvbSBvZiB1c2Ugc3BlY2lmaWVk
IGluIHRoaXMgbGljZW5zZS4KKyMgLQorIyAtICBNb3N0IEdOVSBzb2Z0d2FyZSwgaW5jbHVkaW5n
IHNvbWUgbGlicmFyaWVzLCBpcyBjb3ZlcmVkIGJ5IHRoZQorIyAtb3JkaW5hcnkgR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UuICBUaGlzIGxpY2Vuc2UsIHRoZSBHTlUgTGVzc2VyCisjIC1HZW5l
cmFsIFB1YmxpYyBMaWNlbnNlLCBhcHBsaWVzIHRvIGNlcnRhaW4gZGVzaWduYXRlZCBsaWJyYXJp
ZXMsIGFuZAorIyAtaXMgcXVpdGUgZGlmZmVyZW50IGZyb20gdGhlIG9yZGluYXJ5IEdlbmVyYWwg
UHVibGljIExpY2Vuc2UuICBXZSB1c2UKKyMgLXRoaXMgbGljZW5zZSBmb3IgY2VydGFpbiBsaWJy
YXJpZXMgaW4gb3JkZXIgdG8gcGVybWl0IGxpbmtpbmcgdGhvc2UKKyMgLWxpYnJhcmllcyBpbnRv
IG5vbi1mcmVlIHByb2dyYW1zLgorIyAtCisjIC0gIFdoZW4gYSBwcm9ncmFtIGlzIGxpbmtlZCB3
aXRoIGEgbGlicmFyeSwgd2hldGhlciBzdGF0aWNhbGx5IG9yIHVzaW5nCisjIC1hIHNoYXJlZCBs
aWJyYXJ5LCB0aGUgY29tYmluYXRpb24gb2YgdGhlIHR3byBpcyBsZWdhbGx5IHNwZWFraW5nIGEK
KyMgLWNvbWJpbmVkIHdvcmssIGEgZGVyaXZhdGl2ZSBvZiB0aGUgb3JpZ2luYWwgbGlicmFyeS4g
IFRoZSBvcmRpbmFyeQorIyAtR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB0aGVyZWZvcmUgcGVybWl0
cyBzdWNoIGxpbmtpbmcgb25seSBpZiB0aGUKKyMgLWVudGlyZSBjb21iaW5hdGlvbiBmaXRzIGl0
cyBjcml0ZXJpYSBvZiBmcmVlZG9tLiAgVGhlIExlc3NlciBHZW5lcmFsCisjIC1QdWJsaWMgTGlj
ZW5zZSBwZXJtaXRzIG1vcmUgbGF4IGNyaXRlcmlhIGZvciBsaW5raW5nIG90aGVyIGNvZGUgd2l0
aAorIyAtdGhlIGxpYnJhcnkuCisjIC0KKyMgLSAgV2UgY2FsbCB0aGlzIGxpY2Vuc2UgdGhlICJM
ZXNzZXIiIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYmVjYXVzZSBpdAorIyAtZG9lcyBMZXNzIHRv
IHByb3RlY3QgdGhlIHVzZXIncyBmcmVlZG9tIHRoYW4gdGhlIG9yZGluYXJ5IEdlbmVyYWwKKyMg
LVB1YmxpYyBMaWNlbnNlLiAgSXQgYWxzbyBwcm92aWRlcyBvdGhlciBmcmVlIHNvZnR3YXJlIGRl
dmVsb3BlcnMgTGVzcworIyAtb2YgYW4gYWR2YW50YWdlIG92ZXIgY29tcGV0aW5nIG5vbi1mcmVl
IHByb2dyYW1zLiAgVGhlc2UgZGlzYWR2YW50YWdlcworIyAtYXJlIHRoZSByZWFzb24gd2UgdXNl
IHRoZSBvcmRpbmFyeSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtYW55CisjIC1saWJyYXJp
ZXMuICBIb3dldmVyLCB0aGUgTGVzc2VyIGxpY2Vuc2UgcHJvdmlkZXMgYWR2YW50YWdlcyBpbiBj
ZXJ0YWluCisjIC1zcGVjaWFsIGNpcmN1bXN0YW5jZXMuCisjIC0KKyMgLSAgRm9yIGV4YW1wbGUs
IG9uIHJhcmUgb2NjYXNpb25zLCB0aGVyZSBtYXkgYmUgYSBzcGVjaWFsIG5lZWQgdG8KKyMgLWVu
Y291cmFnZSB0aGUgd2lkZXN0IHBvc3NpYmxlIHVzZSBvZiBhIGNlcnRhaW4gbGlicmFyeSwgc28g
dGhhdCBpdCBiZWNvbWVzCisjIC1hIGRlLWZhY3RvIHN0YW5kYXJkLiAgVG8gYWNoaWV2ZSB0aGlz
LCBub24tZnJlZSBwcm9ncmFtcyBtdXN0IGJlCisjIC1hbGxvd2VkIHRvIHVzZSB0aGUgbGlicmFy
eS4gIEEgbW9yZSBmcmVxdWVudCBjYXNlIGlzIHRoYXQgYSBmcmVlCisjIC1saWJyYXJ5IGRvZXMg
dGhlIHNhbWUgam9iIGFzIHdpZGVseSB1c2VkIG5vbi1mcmVlIGxpYnJhcmllcy4gIEluIHRoaXMK
KyMgLWNhc2UsIHRoZXJlIGlzIGxpdHRsZSB0byBnYWluIGJ5IGxpbWl0aW5nIHRoZSBmcmVlIGxp
YnJhcnkgdG8gZnJlZQorIyAtc29mdHdhcmUgb25seSwgc28gd2UgdXNlIHRoZSBMZXNzZXIgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZS4KKyMgLQorIyAtICBJbiBvdGhlciBjYXNlcywgcGVybWlzc2lv
biB0byB1c2UgYSBwYXJ0aWN1bGFyIGxpYnJhcnkgaW4gbm9uLWZyZWUKKyMgLXByb2dyYW1zIGVu
YWJsZXMgYSBncmVhdGVyIG51bWJlciBvZiBwZW9wbGUgdG8gdXNlIGEgbGFyZ2UgYm9keSBvZgor
IyAtZnJlZSBzb2Z0d2FyZS4gIEZvciBleGFtcGxlLCBwZXJtaXNzaW9uIHRvIHVzZSB0aGUgR05V
IEMgTGlicmFyeSBpbgorIyAtbm9uLWZyZWUgcHJvZ3JhbXMgZW5hYmxlcyBtYW55IG1vcmUgcGVv
cGxlIHRvIHVzZSB0aGUgd2hvbGUgR05VCisjIC1vcGVyYXRpbmcgc3lzdGVtLCBhcyB3ZWxsIGFz
IGl0cyB2YXJpYW50LCB0aGUgR05VL0xpbnV4IG9wZXJhdGluZworIyAtc3lzdGVtLgorIyAtCisj
IC0gIEFsdGhvdWdoIHRoZSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBpcyBMZXNzIHBy
b3RlY3RpdmUgb2YgdGhlCisjIC11c2VycycgZnJlZWRvbSwgaXQgZG9lcyBlbnN1cmUgdGhhdCB0
aGUgdXNlciBvZiBhIHByb2dyYW0gdGhhdCBpcworIyAtbGlua2VkIHdpdGggdGhlIExpYnJhcnkg
aGFzIHRoZSBmcmVlZG9tIGFuZCB0aGUgd2hlcmV3aXRoYWwgdG8gcnVuCisjIC10aGF0IHByb2dy
YW0gdXNpbmcgYSBtb2RpZmllZCB2ZXJzaW9uIG9mIHRoZSBMaWJyYXJ5LgorIyAtCisjIC0gIFRo
ZSBwcmVjaXNlIHRlcm1zIGFuZCBjb25kaXRpb25zIGZvciBjb3B5aW5nLCBkaXN0cmlidXRpb24g
YW5kCisjIC1tb2RpZmljYXRpb24gZm9sbG93LiAgUGF5IGNsb3NlIGF0dGVudGlvbiB0byB0aGUg
ZGlmZmVyZW5jZSBiZXR3ZWVuIGEKKyMgLSJ3b3JrIGJhc2VkIG9uIHRoZSBsaWJyYXJ5IiBhbmQg
YSAid29yayB0aGF0IHVzZXMgdGhlIGxpYnJhcnkiLiAgVGhlCisjIC1mb3JtZXIgY29udGFpbnMg
Y29kZSBkZXJpdmVkIGZyb20gdGhlIGxpYnJhcnksIHdoZXJlYXMgdGhlIGxhdHRlciBtdXN0Cisj
IC1iZSBjb21iaW5lZCB3aXRoIHRoZSBsaWJyYXJ5IGluIG9yZGVyIHRvIHJ1bi4KKyMgLQwKKyMg
LSAgICAgICAgICAgICAgICAgIEdOVSBMRVNTRVIgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyAt
ICAgVEVSTVMgQU5EIENPTkRJVElPTlMgRk9SIENPUFlJTkcsIERJU1RSSUJVVElPTiBBTkQgTU9E
SUZJQ0FUSU9OCisjIC0KKyMgLSAgMC4gVGhpcyBMaWNlbnNlIEFncmVlbWVudCBhcHBsaWVzIHRv
IGFueSBzb2Z0d2FyZSBsaWJyYXJ5IG9yIG90aGVyCisjIC1wcm9ncmFtIHdoaWNoIGNvbnRhaW5z
IGEgbm90aWNlIHBsYWNlZCBieSB0aGUgY29weXJpZ2h0IGhvbGRlciBvcgorIyAtb3RoZXIgYXV0
aG9yaXplZCBwYXJ0eSBzYXlpbmcgaXQgbWF5IGJlIGRpc3RyaWJ1dGVkIHVuZGVyIHRoZSB0ZXJt
cyBvZgorIyAtdGhpcyBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSAoYWxzbyBjYWxsZWQg
InRoaXMgTGljZW5zZSIpLgorIyAtRWFjaCBsaWNlbnNlZSBpcyBhZGRyZXNzZWQgYXMgInlvdSIu
CisjIC0KKyMgLSAgQSAibGlicmFyeSIgbWVhbnMgYSBjb2xsZWN0aW9uIG9mIHNvZnR3YXJlIGZ1
bmN0aW9ucyBhbmQvb3IgZGF0YQorIyAtcHJlcGFyZWQgc28gYXMgdG8gYmUgY29udmVuaWVudGx5
IGxpbmtlZCB3aXRoIGFwcGxpY2F0aW9uIHByb2dyYW1zCisjIC0od2hpY2ggdXNlIHNvbWUgb2Yg
dGhvc2UgZnVuY3Rpb25zIGFuZCBkYXRhKSB0byBmb3JtIGV4ZWN1dGFibGVzLgorIyAtCisjIC0g
IFRoZSAiTGlicmFyeSIsIGJlbG93LCByZWZlcnMgdG8gYW55IHN1Y2ggc29mdHdhcmUgbGlicmFy
eSBvciB3b3JrCisjIC13aGljaCBoYXMgYmVlbiBkaXN0cmlidXRlZCB1bmRlciB0aGVzZSB0ZXJt
cy4gIEEgIndvcmsgYmFzZWQgb24gdGhlCisjIC1MaWJyYXJ5IiBtZWFucyBlaXRoZXIgdGhlIExp
YnJhcnkgb3IgYW55IGRlcml2YXRpdmUgd29yayB1bmRlcgorIyAtY29weXJpZ2h0IGxhdzogdGhh
dCBpcyB0byBzYXksIGEgd29yayBjb250YWluaW5nIHRoZSBMaWJyYXJ5IG9yIGEKKyMgLXBvcnRp
b24gb2YgaXQsIGVpdGhlciB2ZXJiYXRpbSBvciB3aXRoIG1vZGlmaWNhdGlvbnMgYW5kL29yIHRy
YW5zbGF0ZWQKKyMgLXN0cmFpZ2h0Zm9yd2FyZGx5IGludG8gYW5vdGhlciBsYW5ndWFnZS4gIChI
ZXJlaW5hZnRlciwgdHJhbnNsYXRpb24gaXMKKyMgLWluY2x1ZGVkIHdpdGhvdXQgbGltaXRhdGlv
biBpbiB0aGUgdGVybSAibW9kaWZpY2F0aW9uIi4pCisjIC0KKyMgLSAgIlNvdXJjZSBjb2RlIiBm
b3IgYSB3b3JrIG1lYW5zIHRoZSBwcmVmZXJyZWQgZm9ybSBvZiB0aGUgd29yayBmb3IKKyMgLW1h
a2luZyBtb2RpZmljYXRpb25zIHRvIGl0LiAgRm9yIGEgbGlicmFyeSwgY29tcGxldGUgc291cmNl
IGNvZGUgbWVhbnMKKyMgLWFsbCB0aGUgc291cmNlIGNvZGUgZm9yIGFsbCBtb2R1bGVzIGl0IGNv
bnRhaW5zLCBwbHVzIGFueSBhc3NvY2lhdGVkCisjIC1pbnRlcmZhY2UgZGVmaW5pdGlvbiBmaWxl
cywgcGx1cyB0aGUgc2NyaXB0cyB1c2VkIHRvIGNvbnRyb2wgY29tcGlsYXRpb24KKyMgLWFuZCBp
bnN0YWxsYXRpb24gb2YgdGhlIGxpYnJhcnkuCisjIC0KKyMgLSAgQWN0aXZpdGllcyBvdGhlciB0
aGFuIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBhbmQgbW9kaWZpY2F0aW9uIGFyZSBub3QKKyMgLWNv
dmVyZWQgYnkgdGhpcyBMaWNlbnNlOyB0aGV5IGFyZSBvdXRzaWRlIGl0cyBzY29wZS4gIFRoZSBh
Y3Qgb2YKKyMgLXJ1bm5pbmcgYSBwcm9ncmFtIHVzaW5nIHRoZSBMaWJyYXJ5IGlzIG5vdCByZXN0
cmljdGVkLCBhbmQgb3V0cHV0IGZyb20KKyMgLXN1Y2ggYSBwcm9ncmFtIGlzIGNvdmVyZWQgb25s
eSBpZiBpdHMgY29udGVudHMgY29uc3RpdHV0ZSBhIHdvcmsgYmFzZWQKKyMgLW9uIHRoZSBMaWJy
YXJ5IChpbmRlcGVuZGVudCBvZiB0aGUgdXNlIG9mIHRoZSBMaWJyYXJ5IGluIGEgdG9vbCBmb3IK
KyMgLXdyaXRpbmcgaXQpLiAgV2hldGhlciB0aGF0IGlzIHRydWUgZGVwZW5kcyBvbiB3aGF0IHRo
ZSBMaWJyYXJ5IGRvZXMKKyMgLWFuZCB3aGF0IHRoZSBwcm9ncmFtIHRoYXQgdXNlcyB0aGUgTGli
cmFyeSBkb2VzLgorIyAtCisjIC0gIDEuIFlvdSBtYXkgY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJi
YXRpbSBjb3BpZXMgb2YgdGhlIExpYnJhcnkncworIyAtY29tcGxldGUgc291cmNlIGNvZGUgYXMg
eW91IHJlY2VpdmUgaXQsIGluIGFueSBtZWRpdW0sIHByb3ZpZGVkIHRoYXQKKyMgLXlvdSBjb25z
cGljdW91c2x5IGFuZCBhcHByb3ByaWF0ZWx5IHB1Ymxpc2ggb24gZWFjaCBjb3B5IGFuCisjIC1h
cHByb3ByaWF0ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCBkaXNjbGFpbWVyIG9mIHdhcnJhbnR5OyBr
ZWVwIGludGFjdAorIyAtYWxsIHRoZSBub3RpY2VzIHRoYXQgcmVmZXIgdG8gdGhpcyBMaWNlbnNl
IGFuZCB0byB0aGUgYWJzZW5jZSBvZiBhbnkKKyMgLXdhcnJhbnR5OyBhbmQgZGlzdHJpYnV0ZSBh
IGNvcHkgb2YgdGhpcyBMaWNlbnNlIGFsb25nIHdpdGggdGhlCisjIC1MaWJyYXJ5LgorIyAtCisj
IC0gIFlvdSBtYXkgY2hhcmdlIGEgZmVlIGZvciB0aGUgcGh5c2ljYWwgYWN0IG9mIHRyYW5zZmVy
cmluZyBhIGNvcHksCisjIC1hbmQgeW91IG1heSBhdCB5b3VyIG9wdGlvbiBvZmZlciB3YXJyYW50
eSBwcm90ZWN0aW9uIGluIGV4Y2hhbmdlIGZvciBhCisjIC1mZWUuCisjIC0MCisjIC0gIDIuIFlv
dSBtYXkgbW9kaWZ5IHlvdXIgY29weSBvciBjb3BpZXMgb2YgdGhlIExpYnJhcnkgb3IgYW55IHBv
cnRpb24KKyMgLW9mIGl0LCB0aHVzIGZvcm1pbmcgYSB3b3JrIGJhc2VkIG9uIHRoZSBMaWJyYXJ5
LCBhbmQgY29weSBhbmQKKyMgLWRpc3RyaWJ1dGUgc3VjaCBtb2RpZmljYXRpb25zIG9yIHdvcmsg
dW5kZXIgdGhlIHRlcm1zIG9mIFNlY3Rpb24gMQorIyAtYWJvdmUsIHByb3ZpZGVkIHRoYXQgeW91
IGFsc28gbWVldCBhbGwgb2YgdGhlc2UgY29uZGl0aW9uczoKKyMgLQorIyAtICAgIGEpIFRoZSBt
b2RpZmllZCB3b3JrIG11c3QgaXRzZWxmIGJlIGEgc29mdHdhcmUgbGlicmFyeS4KKyMgLQorIyAt
ICAgIGIpIFlvdSBtdXN0IGNhdXNlIHRoZSBmaWxlcyBtb2RpZmllZCB0byBjYXJyeSBwcm9taW5l
bnQgbm90aWNlcworIyAtICAgIHN0YXRpbmcgdGhhdCB5b3UgY2hhbmdlZCB0aGUgZmlsZXMgYW5k
IHRoZSBkYXRlIG9mIGFueSBjaGFuZ2UuCisjIC0KKyMgLSAgICBjKSBZb3UgbXVzdCBjYXVzZSB0
aGUgd2hvbGUgb2YgdGhlIHdvcmsgdG8gYmUgbGljZW5zZWQgYXQgbm8KKyMgLSAgICBjaGFyZ2Ug
dG8gYWxsIHRoaXJkIHBhcnRpZXMgdW5kZXIgdGhlIHRlcm1zIG9mIHRoaXMgTGljZW5zZS4KKyMg
LQorIyAtICAgIGQpIElmIGEgZmFjaWxpdHkgaW4gdGhlIG1vZGlmaWVkIExpYnJhcnkgcmVmZXJz
IHRvIGEgZnVuY3Rpb24gb3IgYQorIyAtICAgIHRhYmxlIG9mIGRhdGEgdG8gYmUgc3VwcGxpZWQg
YnkgYW4gYXBwbGljYXRpb24gcHJvZ3JhbSB0aGF0IHVzZXMKKyMgLSAgICB0aGUgZmFjaWxpdHks
IG90aGVyIHRoYW4gYXMgYW4gYXJndW1lbnQgcGFzc2VkIHdoZW4gdGhlIGZhY2lsaXR5CisjIC0g
ICAgaXMgaW52b2tlZCwgdGhlbiB5b3UgbXVzdCBtYWtlIGEgZ29vZCBmYWl0aCBlZmZvcnQgdG8g
ZW5zdXJlIHRoYXQsCisjIC0gICAgaW4gdGhlIGV2ZW50IGFuIGFwcGxpY2F0aW9uIGRvZXMgbm90
IHN1cHBseSBzdWNoIGZ1bmN0aW9uIG9yCisjIC0gICAgdGFibGUsIHRoZSBmYWNpbGl0eSBzdGls
bCBvcGVyYXRlcywgYW5kIHBlcmZvcm1zIHdoYXRldmVyIHBhcnQgb2YKKyMgLSAgICBpdHMgcHVy
cG9zZSByZW1haW5zIG1lYW5pbmdmdWwuCisjIC0KKyMgLSAgICAoRm9yIGV4YW1wbGUsIGEgZnVu
Y3Rpb24gaW4gYSBsaWJyYXJ5IHRvIGNvbXB1dGUgc3F1YXJlIHJvb3RzIGhhcworIyAtICAgIGEg
cHVycG9zZSB0aGF0IGlzIGVudGlyZWx5IHdlbGwtZGVmaW5lZCBpbmRlcGVuZGVudCBvZiB0aGUK
KyMgLSAgICBhcHBsaWNhdGlvbi4gIFRoZXJlZm9yZSwgU3Vic2VjdGlvbiAyZCByZXF1aXJlcyB0
aGF0IGFueQorIyAtICAgIGFwcGxpY2F0aW9uLXN1cHBsaWVkIGZ1bmN0aW9uIG9yIHRhYmxlIHVz
ZWQgYnkgdGhpcyBmdW5jdGlvbiBtdXN0CisjIC0gICAgYmUgb3B0aW9uYWw6IGlmIHRoZSBhcHBs
aWNhdGlvbiBkb2VzIG5vdCBzdXBwbHkgaXQsIHRoZSBzcXVhcmUKKyMgLSAgICByb290IGZ1bmN0
aW9uIG11c3Qgc3RpbGwgY29tcHV0ZSBzcXVhcmUgcm9vdHMuKQorIyAtCisjIC1UaGVzZSByZXF1
aXJlbWVudHMgYXBwbHkgdG8gdGhlIG1vZGlmaWVkIHdvcmsgYXMgYSB3aG9sZS4gIElmCisjIC1p
ZGVudGlmaWFibGUgc2VjdGlvbnMgb2YgdGhhdCB3b3JrIGFyZSBub3QgZGVyaXZlZCBmcm9tIHRo
ZSBMaWJyYXJ5LAorIyAtYW5kIGNhbiBiZSByZWFzb25hYmx5IGNvbnNpZGVyZWQgaW5kZXBlbmRl
bnQgYW5kIHNlcGFyYXRlIHdvcmtzIGluCisjIC10aGVtc2VsdmVzLCB0aGVuIHRoaXMgTGljZW5z
ZSwgYW5kIGl0cyB0ZXJtcywgZG8gbm90IGFwcGx5IHRvIHRob3NlCisjIC1zZWN0aW9ucyB3aGVu
IHlvdSBkaXN0cmlidXRlIHRoZW0gYXMgc2VwYXJhdGUgd29ya3MuICBCdXQgd2hlbiB5b3UKKyMg
LWRpc3RyaWJ1dGUgdGhlIHNhbWUgc2VjdGlvbnMgYXMgcGFydCBvZiBhIHdob2xlIHdoaWNoIGlz
IGEgd29yayBiYXNlZAorIyAtb24gdGhlIExpYnJhcnksIHRoZSBkaXN0cmlidXRpb24gb2YgdGhl
IHdob2xlIG11c3QgYmUgb24gdGhlIHRlcm1zIG9mCisjIC10aGlzIExpY2Vuc2UsIHdob3NlIHBl
cm1pc3Npb25zIGZvciBvdGhlciBsaWNlbnNlZXMgZXh0ZW5kIHRvIHRoZQorIyAtZW50aXJlIHdo
b2xlLCBhbmQgdGh1cyB0byBlYWNoIGFuZCBldmVyeSBwYXJ0IHJlZ2FyZGxlc3Mgb2Ygd2hvIHdy
b3RlCisjIC1pdC4KKyMgLQorIyAtVGh1cywgaXQgaXMgbm90IHRoZSBpbnRlbnQgb2YgdGhpcyBz
ZWN0aW9uIHRvIGNsYWltIHJpZ2h0cyBvciBjb250ZXN0CisjIC15b3VyIHJpZ2h0cyB0byB3b3Jr
IHdyaXR0ZW4gZW50aXJlbHkgYnkgeW91OyByYXRoZXIsIHRoZSBpbnRlbnQgaXMgdG8KKyMgLWV4
ZXJjaXNlIHRoZSByaWdodCB0byBjb250cm9sIHRoZSBkaXN0cmlidXRpb24gb2YgZGVyaXZhdGl2
ZSBvcgorIyAtY29sbGVjdGl2ZSB3b3JrcyBiYXNlZCBvbiB0aGUgTGlicmFyeS4KKyMgLQorIyAt
SW4gYWRkaXRpb24sIG1lcmUgYWdncmVnYXRpb24gb2YgYW5vdGhlciB3b3JrIG5vdCBiYXNlZCBv
biB0aGUgTGlicmFyeQorIyAtd2l0aCB0aGUgTGlicmFyeSAob3Igd2l0aCBhIHdvcmsgYmFzZWQg
b24gdGhlIExpYnJhcnkpIG9uIGEgdm9sdW1lIG9mCisjIC1hIHN0b3JhZ2Ugb3IgZGlzdHJpYnV0
aW9uIG1lZGl1bSBkb2VzIG5vdCBicmluZyB0aGUgb3RoZXIgd29yayB1bmRlcgorIyAtdGhlIHNj
b3BlIG9mIHRoaXMgTGljZW5zZS4KKyMgLQorIyAtICAzLiBZb3UgbWF5IG9wdCB0byBhcHBseSB0
aGUgdGVybXMgb2YgdGhlIG9yZGluYXJ5IEdOVSBHZW5lcmFsIFB1YmxpYworIyAtTGljZW5zZSBp
bnN0ZWFkIG9mIHRoaXMgTGljZW5zZSB0byBhIGdpdmVuIGNvcHkgb2YgdGhlIExpYnJhcnkuICBU
byBkbworIyAtdGhpcywgeW91IG11c3QgYWx0ZXIgYWxsIHRoZSBub3RpY2VzIHRoYXQgcmVmZXIg
dG8gdGhpcyBMaWNlbnNlLCBzbworIyAtdGhhdCB0aGV5IHJlZmVyIHRvIHRoZSBvcmRpbmFyeSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSwgdmVyc2lvbiAyLAorIyAtaW5zdGVhZCBvZiB0byB0
aGlzIExpY2Vuc2UuICAoSWYgYSBuZXdlciB2ZXJzaW9uIHRoYW4gdmVyc2lvbiAyIG9mIHRoZQor
IyAtb3JkaW5hcnkgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgaGFzIGFwcGVhcmVkLCB0aGVu
IHlvdSBjYW4gc3BlY2lmeQorIyAtdGhhdCB2ZXJzaW9uIGluc3RlYWQgaWYgeW91IHdpc2guKSAg
RG8gbm90IG1ha2UgYW55IG90aGVyIGNoYW5nZSBpbgorIyAtdGhlc2Ugbm90aWNlcy4KKyMgLQwK
KyMgLSAgT25jZSB0aGlzIGNoYW5nZSBpcyBtYWRlIGluIGEgZ2l2ZW4gY29weSwgaXQgaXMgaXJy
ZXZlcnNpYmxlIGZvcgorIyAtdGhhdCBjb3B5LCBzbyB0aGUgb3JkaW5hcnkgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgYXBwbGllcyB0byBhbGwKKyMgLXN1YnNlcXVlbnQgY29waWVzIGFuZCBk
ZXJpdmF0aXZlIHdvcmtzIG1hZGUgZnJvbSB0aGF0IGNvcHkuCisjIC0KKyMgLSAgVGhpcyBvcHRp
b24gaXMgdXNlZnVsIHdoZW4geW91IHdpc2ggdG8gY29weSBwYXJ0IG9mIHRoZSBjb2RlIG9mCisj
IC10aGUgTGlicmFyeSBpbnRvIGEgcHJvZ3JhbSB0aGF0IGlzIG5vdCBhIGxpYnJhcnkuCisjIC0K
KyMgLSAgNC4gWW91IG1heSBjb3B5IGFuZCBkaXN0cmlidXRlIHRoZSBMaWJyYXJ5IChvciBhIHBv
cnRpb24gb3IKKyMgLWRlcml2YXRpdmUgb2YgaXQsIHVuZGVyIFNlY3Rpb24gMikgaW4gb2JqZWN0
IGNvZGUgb3IgZXhlY3V0YWJsZSBmb3JtCisjIC11bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbnMg
MSBhbmQgMiBhYm92ZSBwcm92aWRlZCB0aGF0IHlvdSBhY2NvbXBhbnkKKyMgLWl0IHdpdGggdGhl
IGNvbXBsZXRlIGNvcnJlc3BvbmRpbmcgbWFjaGluZS1yZWFkYWJsZSBzb3VyY2UgY29kZSwgd2hp
Y2gKKyMgLW11c3QgYmUgZGlzdHJpYnV0ZWQgdW5kZXIgdGhlIHRlcm1zIG9mIFNlY3Rpb25zIDEg
YW5kIDIgYWJvdmUgb24gYQorIyAtbWVkaXVtIGN1c3RvbWFyaWx5IHVzZWQgZm9yIHNvZnR3YXJl
IGludGVyY2hhbmdlLgorIyAtCisjIC0gIElmIGRpc3RyaWJ1dGlvbiBvZiBvYmplY3QgY29kZSBp
cyBtYWRlIGJ5IG9mZmVyaW5nIGFjY2VzcyB0byBjb3B5CisjIC1mcm9tIGEgZGVzaWduYXRlZCBw
bGFjZSwgdGhlbiBvZmZlcmluZyBlcXVpdmFsZW50IGFjY2VzcyB0byBjb3B5IHRoZQorIyAtc291
cmNlIGNvZGUgZnJvbSB0aGUgc2FtZSBwbGFjZSBzYXRpc2ZpZXMgdGhlIHJlcXVpcmVtZW50IHRv
CisjIC1kaXN0cmlidXRlIHRoZSBzb3VyY2UgY29kZSwgZXZlbiB0aG91Z2ggdGhpcmQgcGFydGll
cyBhcmUgbm90CisjIC1jb21wZWxsZWQgdG8gY29weSB0aGUgc291cmNlIGFsb25nIHdpdGggdGhl
IG9iamVjdCBjb2RlLgorIyAtCisjIC0gIDUuIEEgcHJvZ3JhbSB0aGF0IGNvbnRhaW5zIG5vIGRl
cml2YXRpdmUgb2YgYW55IHBvcnRpb24gb2YgdGhlCisjIC1MaWJyYXJ5LCBidXQgaXMgZGVzaWdu
ZWQgdG8gd29yayB3aXRoIHRoZSBMaWJyYXJ5IGJ5IGJlaW5nIGNvbXBpbGVkIG9yCisjIC1saW5r
ZWQgd2l0aCBpdCwgaXMgY2FsbGVkIGEgIndvcmsgdGhhdCB1c2VzIHRoZSBMaWJyYXJ5Ii4gIFN1
Y2ggYQorIyAtd29yaywgaW4gaXNvbGF0aW9uLCBpcyBub3QgYSBkZXJpdmF0aXZlIHdvcmsgb2Yg
dGhlIExpYnJhcnksIGFuZAorIyAtdGhlcmVmb3JlIGZhbGxzIG91dHNpZGUgdGhlIHNjb3BlIG9m
IHRoaXMgTGljZW5zZS4KKyMgLQorIyAtICBIb3dldmVyLCBsaW5raW5nIGEgIndvcmsgdGhhdCB1
c2VzIHRoZSBMaWJyYXJ5IiB3aXRoIHRoZSBMaWJyYXJ5CisjIC1jcmVhdGVzIGFuIGV4ZWN1dGFi
bGUgdGhhdCBpcyBhIGRlcml2YXRpdmUgb2YgdGhlIExpYnJhcnkgKGJlY2F1c2UgaXQKKyMgLWNv
bnRhaW5zIHBvcnRpb25zIG9mIHRoZSBMaWJyYXJ5KSwgcmF0aGVyIHRoYW4gYSAid29yayB0aGF0
IHVzZXMgdGhlCisjIC1saWJyYXJ5Ii4gIFRoZSBleGVjdXRhYmxlIGlzIHRoZXJlZm9yZSBjb3Zl
cmVkIGJ5IHRoaXMgTGljZW5zZS4KKyMgLVNlY3Rpb24gNiBzdGF0ZXMgdGVybXMgZm9yIGRpc3Ry
aWJ1dGlvbiBvZiBzdWNoIGV4ZWN1dGFibGVzLgorIyAtCisjIC0gIFdoZW4gYSAid29yayB0aGF0
IHVzZXMgdGhlIExpYnJhcnkiIHVzZXMgbWF0ZXJpYWwgZnJvbSBhIGhlYWRlciBmaWxlCisjIC10
aGF0IGlzIHBhcnQgb2YgdGhlIExpYnJhcnksIHRoZSBvYmplY3QgY29kZSBmb3IgdGhlIHdvcmsg
bWF5IGJlIGEKKyMgLWRlcml2YXRpdmUgd29yayBvZiB0aGUgTGlicmFyeSBldmVuIHRob3VnaCB0
aGUgc291cmNlIGNvZGUgaXMgbm90LgorIyAtV2hldGhlciB0aGlzIGlzIHRydWUgaXMgZXNwZWNp
YWxseSBzaWduaWZpY2FudCBpZiB0aGUgd29yayBjYW4gYmUKKyMgLWxpbmtlZCB3aXRob3V0IHRo
ZSBMaWJyYXJ5LCBvciBpZiB0aGUgd29yayBpcyBpdHNlbGYgYSBsaWJyYXJ5LiAgVGhlCisjIC10
aHJlc2hvbGQgZm9yIHRoaXMgdG8gYmUgdHJ1ZSBpcyBub3QgcHJlY2lzZWx5IGRlZmluZWQgYnkg
bGF3LgorIyAtCisjIC0gIElmIHN1Y2ggYW4gb2JqZWN0IGZpbGUgdXNlcyBvbmx5IG51bWVyaWNh
bCBwYXJhbWV0ZXJzLCBkYXRhCisjIC1zdHJ1Y3R1cmUgbGF5b3V0cyBhbmQgYWNjZXNzb3JzLCBh
bmQgc21hbGwgbWFjcm9zIGFuZCBzbWFsbCBpbmxpbmUKKyMgLWZ1bmN0aW9ucyAodGVuIGxpbmVz
IG9yIGxlc3MgaW4gbGVuZ3RoKSwgdGhlbiB0aGUgdXNlIG9mIHRoZSBvYmplY3QKKyMgLWZpbGUg
aXMgdW5yZXN0cmljdGVkLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgaXQgaXMgbGVnYWxseSBhIGRl
cml2YXRpdmUKKyMgLXdvcmsuICAoRXhlY3V0YWJsZXMgY29udGFpbmluZyB0aGlzIG9iamVjdCBj
b2RlIHBsdXMgcG9ydGlvbnMgb2YgdGhlCisjIC1MaWJyYXJ5IHdpbGwgc3RpbGwgZmFsbCB1bmRl
ciBTZWN0aW9uIDYuKQorIyAtCisjIC0gIE90aGVyd2lzZSwgaWYgdGhlIHdvcmsgaXMgYSBkZXJp
dmF0aXZlIG9mIHRoZSBMaWJyYXJ5LCB5b3UgbWF5CisjIC1kaXN0cmlidXRlIHRoZSBvYmplY3Qg
Y29kZSBmb3IgdGhlIHdvcmsgdW5kZXIgdGhlIHRlcm1zIG9mIFNlY3Rpb24gNi4KKyMgLUFueSBl
eGVjdXRhYmxlcyBjb250YWluaW5nIHRoYXQgd29yayBhbHNvIGZhbGwgdW5kZXIgU2VjdGlvbiA2
LAorIyAtd2hldGhlciBvciBub3QgdGhleSBhcmUgbGlua2VkIGRpcmVjdGx5IHdpdGggdGhlIExp
YnJhcnkgaXRzZWxmLgorIyAtDAorIyAtICA2LiBBcyBhbiBleGNlcHRpb24gdG8gdGhlIFNlY3Rp
b25zIGFib3ZlLCB5b3UgbWF5IGFsc28gY29tYmluZSBvcgorIyAtbGluayBhICJ3b3JrIHRoYXQg
dXNlcyB0aGUgTGlicmFyeSIgd2l0aCB0aGUgTGlicmFyeSB0byBwcm9kdWNlIGEKKyMgLXdvcmsg
Y29udGFpbmluZyBwb3J0aW9ucyBvZiB0aGUgTGlicmFyeSwgYW5kIGRpc3RyaWJ1dGUgdGhhdCB3
b3JrCisjIC11bmRlciB0ZXJtcyBvZiB5b3VyIGNob2ljZSwgcHJvdmlkZWQgdGhhdCB0aGUgdGVy
bXMgcGVybWl0CisjIC1tb2RpZmljYXRpb24gb2YgdGhlIHdvcmsgZm9yIHRoZSBjdXN0b21lcidz
IG93biB1c2UgYW5kIHJldmVyc2UKKyMgLWVuZ2luZWVyaW5nIGZvciBkZWJ1Z2dpbmcgc3VjaCBt
b2RpZmljYXRpb25zLgorIyAtCisjIC0gIFlvdSBtdXN0IGdpdmUgcHJvbWluZW50IG5vdGljZSB3
aXRoIGVhY2ggY29weSBvZiB0aGUgd29yayB0aGF0IHRoZQorIyAtTGlicmFyeSBpcyB1c2VkIGlu
IGl0IGFuZCB0aGF0IHRoZSBMaWJyYXJ5IGFuZCBpdHMgdXNlIGFyZSBjb3ZlcmVkIGJ5CisjIC10
aGlzIExpY2Vuc2UuICBZb3UgbXVzdCBzdXBwbHkgYSBjb3B5IG9mIHRoaXMgTGljZW5zZS4gIElm
IHRoZSB3b3JrCisjIC1kdXJpbmcgZXhlY3V0aW9uIGRpc3BsYXlzIGNvcHlyaWdodCBub3RpY2Vz
LCB5b3UgbXVzdCBpbmNsdWRlIHRoZQorIyAtY29weXJpZ2h0IG5vdGljZSBmb3IgdGhlIExpYnJh
cnkgYW1vbmcgdGhlbSwgYXMgd2VsbCBhcyBhIHJlZmVyZW5jZQorIyAtZGlyZWN0aW5nIHRoZSB1
c2VyIHRvIHRoZSBjb3B5IG9mIHRoaXMgTGljZW5zZS4gIEFsc28sIHlvdSBtdXN0IGRvIG9uZQor
IyAtb2YgdGhlc2UgdGhpbmdzOgorIyAtCisjIC0gICAgYSkgQWNjb21wYW55IHRoZSB3b3JrIHdp
dGggdGhlIGNvbXBsZXRlIGNvcnJlc3BvbmRpbmcKKyMgLSAgICBtYWNoaW5lLXJlYWRhYmxlIHNv
dXJjZSBjb2RlIGZvciB0aGUgTGlicmFyeSBpbmNsdWRpbmcgd2hhdGV2ZXIKKyMgLSAgICBjaGFu
Z2VzIHdlcmUgdXNlZCBpbiB0aGUgd29yayAod2hpY2ggbXVzdCBiZSBkaXN0cmlidXRlZCB1bmRl
cgorIyAtICAgIFNlY3Rpb25zIDEgYW5kIDIgYWJvdmUpOyBhbmQsIGlmIHRoZSB3b3JrIGlzIGFu
IGV4ZWN1dGFibGUgbGlua2VkCisjIC0gICAgd2l0aCB0aGUgTGlicmFyeSwgd2l0aCB0aGUgY29t
cGxldGUgbWFjaGluZS1yZWFkYWJsZSAid29yayB0aGF0CisjIC0gICAgdXNlcyB0aGUgTGlicmFy
eSIsIGFzIG9iamVjdCBjb2RlIGFuZC9vciBzb3VyY2UgY29kZSwgc28gdGhhdCB0aGUKKyMgLSAg
ICB1c2VyIGNhbiBtb2RpZnkgdGhlIExpYnJhcnkgYW5kIHRoZW4gcmVsaW5rIHRvIHByb2R1Y2Ug
YSBtb2RpZmllZAorIyAtICAgIGV4ZWN1dGFibGUgY29udGFpbmluZyB0aGUgbW9kaWZpZWQgTGli
cmFyeS4gIChJdCBpcyB1bmRlcnN0b29kCisjIC0gICAgdGhhdCB0aGUgdXNlciB3aG8gY2hhbmdl
cyB0aGUgY29udGVudHMgb2YgZGVmaW5pdGlvbnMgZmlsZXMgaW4gdGhlCisjIC0gICAgTGlicmFy
eSB3aWxsIG5vdCBuZWNlc3NhcmlseSBiZSBhYmxlIHRvIHJlY29tcGlsZSB0aGUgYXBwbGljYXRp
b24KKyMgLSAgICB0byB1c2UgdGhlIG1vZGlmaWVkIGRlZmluaXRpb25zLikKKyMgLQorIyAtICAg
IGIpIFVzZSBhIHN1aXRhYmxlIHNoYXJlZCBsaWJyYXJ5IG1lY2hhbmlzbSBmb3IgbGlua2luZyB3
aXRoIHRoZQorIyAtICAgIExpYnJhcnkuICBBIHN1aXRhYmxlIG1lY2hhbmlzbSBpcyBvbmUgdGhh
dCAoMSkgdXNlcyBhdCBydW4gdGltZSBhCisjIC0gICAgY29weSBvZiB0aGUgbGlicmFyeSBhbHJl
YWR5IHByZXNlbnQgb24gdGhlIHVzZXIncyBjb21wdXRlciBzeXN0ZW0sCisjIC0gICAgcmF0aGVy
IHRoYW4gY29weWluZyBsaWJyYXJ5IGZ1bmN0aW9ucyBpbnRvIHRoZSBleGVjdXRhYmxlLCBhbmQg
KDIpCisjIC0gICAgd2lsbCBvcGVyYXRlIHByb3Blcmx5IHdpdGggYSBtb2RpZmllZCB2ZXJzaW9u
IG9mIHRoZSBsaWJyYXJ5LCBpZgorIyAtICAgIHRoZSB1c2VyIGluc3RhbGxzIG9uZSwgYXMgbG9u
ZyBhcyB0aGUgbW9kaWZpZWQgdmVyc2lvbiBpcworIyAtICAgIGludGVyZmFjZS1jb21wYXRpYmxl
IHdpdGggdGhlIHZlcnNpb24gdGhhdCB0aGUgd29yayB3YXMgbWFkZSB3aXRoLgorIyAtCisjIC0g
ICAgYykgQWNjb21wYW55IHRoZSB3b3JrIHdpdGggYSB3cml0dGVuIG9mZmVyLCB2YWxpZCBmb3Ig
YXQKKyMgLSAgICBsZWFzdCB0aHJlZSB5ZWFycywgdG8gZ2l2ZSB0aGUgc2FtZSB1c2VyIHRoZSBt
YXRlcmlhbHMKKyMgLSAgICBzcGVjaWZpZWQgaW4gU3Vic2VjdGlvbiA2YSwgYWJvdmUsIGZvciBh
IGNoYXJnZSBubyBtb3JlCisjIC0gICAgdGhhbiB0aGUgY29zdCBvZiBwZXJmb3JtaW5nIHRoaXMg
ZGlzdHJpYnV0aW9uLgorIyAtCisjIC0gICAgZCkgSWYgZGlzdHJpYnV0aW9uIG9mIHRoZSB3b3Jr
IGlzIG1hZGUgYnkgb2ZmZXJpbmcgYWNjZXNzIHRvIGNvcHkKKyMgLSAgICBmcm9tIGEgZGVzaWdu
YXRlZCBwbGFjZSwgb2ZmZXIgZXF1aXZhbGVudCBhY2Nlc3MgdG8gY29weSB0aGUgYWJvdmUKKyMg
LSAgICBzcGVjaWZpZWQgbWF0ZXJpYWxzIGZyb20gdGhlIHNhbWUgcGxhY2UuCisjIC0KKyMgLSAg
ICBlKSBWZXJpZnkgdGhhdCB0aGUgdXNlciBoYXMgYWxyZWFkeSByZWNlaXZlZCBhIGNvcHkgb2Yg
dGhlc2UKKyMgLSAgICBtYXRlcmlhbHMgb3IgdGhhdCB5b3UgaGF2ZSBhbHJlYWR5IHNlbnQgdGhp
cyB1c2VyIGEgY29weS4KKyMgLQorIyAtICBGb3IgYW4gZXhlY3V0YWJsZSwgdGhlIHJlcXVpcmVk
IGZvcm0gb2YgdGhlICJ3b3JrIHRoYXQgdXNlcyB0aGUKKyMgLUxpYnJhcnkiIG11c3QgaW5jbHVk
ZSBhbnkgZGF0YSBhbmQgdXRpbGl0eSBwcm9ncmFtcyBuZWVkZWQgZm9yCisjIC1yZXByb2R1Y2lu
ZyB0aGUgZXhlY3V0YWJsZSBmcm9tIGl0LiAgSG93ZXZlciwgYXMgYSBzcGVjaWFsIGV4Y2VwdGlv
biwKKyMgLXRoZSBtYXRlcmlhbHMgdG8gYmUgZGlzdHJpYnV0ZWQgbmVlZCBub3QgaW5jbHVkZSBh
bnl0aGluZyB0aGF0IGlzCisjIC1ub3JtYWxseSBkaXN0cmlidXRlZCAoaW4gZWl0aGVyIHNvdXJj
ZSBvciBiaW5hcnkgZm9ybSkgd2l0aCB0aGUgbWFqb3IKKyMgLWNvbXBvbmVudHMgKGNvbXBpbGVy
LCBrZXJuZWwsIGFuZCBzbyBvbikgb2YgdGhlIG9wZXJhdGluZyBzeXN0ZW0gb24KKyMgLXdoaWNo
IHRoZSBleGVjdXRhYmxlIHJ1bnMsIHVubGVzcyB0aGF0IGNvbXBvbmVudCBpdHNlbGYgYWNjb21w
YW5pZXMKKyMgLXRoZSBleGVjdXRhYmxlLgorIyAtCisjIC0gIEl0IG1heSBoYXBwZW4gdGhhdCB0
aGlzIHJlcXVpcmVtZW50IGNvbnRyYWRpY3RzIHRoZSBsaWNlbnNlCisjIC1yZXN0cmljdGlvbnMg
b2Ygb3RoZXIgcHJvcHJpZXRhcnkgbGlicmFyaWVzIHRoYXQgZG8gbm90IG5vcm1hbGx5CisjIC1h
Y2NvbXBhbnkgdGhlIG9wZXJhdGluZyBzeXN0ZW0uICBTdWNoIGEgY29udHJhZGljdGlvbiBtZWFu
cyB5b3UgY2Fubm90CisjIC11c2UgYm90aCB0aGVtIGFuZCB0aGUgTGlicmFyeSB0b2dldGhlciBp
biBhbiBleGVjdXRhYmxlIHRoYXQgeW91CisjIC1kaXN0cmlidXRlLgorIyAtDAorIyAtICA3LiBZ
b3UgbWF5IHBsYWNlIGxpYnJhcnkgZmFjaWxpdGllcyB0aGF0IGFyZSBhIHdvcmsgYmFzZWQgb24g
dGhlCisjIC1MaWJyYXJ5IHNpZGUtYnktc2lkZSBpbiBhIHNpbmdsZSBsaWJyYXJ5IHRvZ2V0aGVy
IHdpdGggb3RoZXIgbGlicmFyeQorIyAtZmFjaWxpdGllcyBub3QgY292ZXJlZCBieSB0aGlzIExp
Y2Vuc2UsIGFuZCBkaXN0cmlidXRlIHN1Y2ggYSBjb21iaW5lZAorIyAtbGlicmFyeSwgcHJvdmlk
ZWQgdGhhdCB0aGUgc2VwYXJhdGUgZGlzdHJpYnV0aW9uIG9mIHRoZSB3b3JrIGJhc2VkIG9uCisj
IC10aGUgTGlicmFyeSBhbmQgb2YgdGhlIG90aGVyIGxpYnJhcnkgZmFjaWxpdGllcyBpcyBvdGhl
cndpc2UKKyMgLXBlcm1pdHRlZCwgYW5kIHByb3ZpZGVkIHRoYXQgeW91IGRvIHRoZXNlIHR3byB0
aGluZ3M6CisjIC0KKyMgLSAgICBhKSBBY2NvbXBhbnkgdGhlIGNvbWJpbmVkIGxpYnJhcnkgd2l0
aCBhIGNvcHkgb2YgdGhlIHNhbWUgd29yaworIyAtICAgIGJhc2VkIG9uIHRoZSBMaWJyYXJ5LCB1
bmNvbWJpbmVkIHdpdGggYW55IG90aGVyIGxpYnJhcnkKKyMgLSAgICBmYWNpbGl0aWVzLiAgVGhp
cyBtdXN0IGJlIGRpc3RyaWJ1dGVkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUKKyMgLSAgICBTZWN0
aW9ucyBhYm92ZS4KKyMgLQorIyAtICAgIGIpIEdpdmUgcHJvbWluZW50IG5vdGljZSB3aXRoIHRo
ZSBjb21iaW5lZCBsaWJyYXJ5IG9mIHRoZSBmYWN0CisjIC0gICAgdGhhdCBwYXJ0IG9mIGl0IGlz
IGEgd29yayBiYXNlZCBvbiB0aGUgTGlicmFyeSwgYW5kIGV4cGxhaW5pbmcKKyMgLSAgICB3aGVy
ZSB0byBmaW5kIHRoZSBhY2NvbXBhbnlpbmcgdW5jb21iaW5lZCBmb3JtIG9mIHRoZSBzYW1lIHdv
cmsuCisjIC0KKyMgLSAgOC4gWW91IG1heSBub3QgY29weSwgbW9kaWZ5LCBzdWJsaWNlbnNlLCBs
aW5rIHdpdGgsIG9yIGRpc3RyaWJ1dGUKKyMgLXRoZSBMaWJyYXJ5IGV4Y2VwdCBhcyBleHByZXNz
bHkgcHJvdmlkZWQgdW5kZXIgdGhpcyBMaWNlbnNlLiAgQW55CisjIC1hdHRlbXB0IG90aGVyd2lz
ZSB0byBjb3B5LCBtb2RpZnksIHN1YmxpY2Vuc2UsIGxpbmsgd2l0aCwgb3IKKyMgLWRpc3RyaWJ1
dGUgdGhlIExpYnJhcnkgaXMgdm9pZCwgYW5kIHdpbGwgYXV0b21hdGljYWxseSB0ZXJtaW5hdGUg
eW91cgorIyAtcmlnaHRzIHVuZGVyIHRoaXMgTGljZW5zZS4gIEhvd2V2ZXIsIHBhcnRpZXMgd2hv
IGhhdmUgcmVjZWl2ZWQgY29waWVzLAorIyAtb3IgcmlnaHRzLCBmcm9tIHlvdSB1bmRlciB0aGlz
IExpY2Vuc2Ugd2lsbCBub3QgaGF2ZSB0aGVpciBsaWNlbnNlcworIyAtdGVybWluYXRlZCBzbyBs
b25nIGFzIHN1Y2ggcGFydGllcyByZW1haW4gaW4gZnVsbCBjb21wbGlhbmNlLgorIyAtCisjIC0g
IDkuIFlvdSBhcmUgbm90IHJlcXVpcmVkIHRvIGFjY2VwdCB0aGlzIExpY2Vuc2UsIHNpbmNlIHlv
dSBoYXZlIG5vdAorIyAtc2lnbmVkIGl0LiAgSG93ZXZlciwgbm90aGluZyBlbHNlIGdyYW50cyB5
b3UgcGVybWlzc2lvbiB0byBtb2RpZnkgb3IKKyMgLWRpc3RyaWJ1dGUgdGhlIExpYnJhcnkgb3Ig
aXRzIGRlcml2YXRpdmUgd29ya3MuICBUaGVzZSBhY3Rpb25zIGFyZQorIyAtcHJvaGliaXRlZCBi
eSBsYXcgaWYgeW91IGRvIG5vdCBhY2NlcHQgdGhpcyBMaWNlbnNlLiAgVGhlcmVmb3JlLCBieQor
IyAtbW9kaWZ5aW5nIG9yIGRpc3RyaWJ1dGluZyB0aGUgTGlicmFyeSAob3IgYW55IHdvcmsgYmFz
ZWQgb24gdGhlCisjIC1MaWJyYXJ5KSwgeW91IGluZGljYXRlIHlvdXIgYWNjZXB0YW5jZSBvZiB0
aGlzIExpY2Vuc2UgdG8gZG8gc28sIGFuZAorIyAtYWxsIGl0cyB0ZXJtcyBhbmQgY29uZGl0aW9u
cyBmb3IgY29weWluZywgZGlzdHJpYnV0aW5nIG9yIG1vZGlmeWluZworIyAtdGhlIExpYnJhcnkg
b3Igd29ya3MgYmFzZWQgb24gaXQuCisjIC0KKyMgLSAgMTAuIEVhY2ggdGltZSB5b3UgcmVkaXN0
cmlidXRlIHRoZSBMaWJyYXJ5IChvciBhbnkgd29yayBiYXNlZCBvbiB0aGUKKyMgLUxpYnJhcnkp
LCB0aGUgcmVjaXBpZW50IGF1dG9tYXRpY2FsbHkgcmVjZWl2ZXMgYSBsaWNlbnNlIGZyb20gdGhl
CisjIC1vcmlnaW5hbCBsaWNlbnNvciB0byBjb3B5LCBkaXN0cmlidXRlLCBsaW5rIHdpdGggb3Ig
bW9kaWZ5IHRoZSBMaWJyYXJ5CisjIC1zdWJqZWN0IHRvIHRoZXNlIHRlcm1zIGFuZCBjb25kaXRp
b25zLiAgWW91IG1heSBub3QgaW1wb3NlIGFueSBmdXJ0aGVyCisjIC1yZXN0cmljdGlvbnMgb24g
dGhlIHJlY2lwaWVudHMnIGV4ZXJjaXNlIG9mIHRoZSByaWdodHMgZ3JhbnRlZCBoZXJlaW4uCisj
IC1Zb3UgYXJlIG5vdCByZXNwb25zaWJsZSBmb3IgZW5mb3JjaW5nIGNvbXBsaWFuY2UgYnkgdGhp
cmQgcGFydGllcyB3aXRoCisjIC10aGlzIExpY2Vuc2UuCisjIC0MCisjIC0gIDExLiBJZiwgYXMg
YSBjb25zZXF1ZW5jZSBvZiBhIGNvdXJ0IGp1ZGdtZW50IG9yIGFsbGVnYXRpb24gb2YgcGF0ZW50
CisjIC1pbmZyaW5nZW1lbnQgb3IgZm9yIGFueSBvdGhlciByZWFzb24gKG5vdCBsaW1pdGVkIHRv
IHBhdGVudCBpc3N1ZXMpLAorIyAtY29uZGl0aW9ucyBhcmUgaW1wb3NlZCBvbiB5b3UgKHdoZXRo
ZXIgYnkgY291cnQgb3JkZXIsIGFncmVlbWVudCBvcgorIyAtb3RoZXJ3aXNlKSB0aGF0IGNvbnRy
YWRpY3QgdGhlIGNvbmRpdGlvbnMgb2YgdGhpcyBMaWNlbnNlLCB0aGV5IGRvIG5vdAorIyAtZXhj
dXNlIHlvdSBmcm9tIHRoZSBjb25kaXRpb25zIG9mIHRoaXMgTGljZW5zZS4gIElmIHlvdSBjYW5u
b3QKKyMgLWRpc3RyaWJ1dGUgc28gYXMgdG8gc2F0aXNmeSBzaW11bHRhbmVvdXNseSB5b3VyIG9i
bGlnYXRpb25zIHVuZGVyIHRoaXMKKyMgLUxpY2Vuc2UgYW5kIGFueSBvdGhlciBwZXJ0aW5lbnQg
b2JsaWdhdGlvbnMsIHRoZW4gYXMgYSBjb25zZXF1ZW5jZSB5b3UKKyMgLW1heSBub3QgZGlzdHJp
YnV0ZSB0aGUgTGlicmFyeSBhdCBhbGwuICBGb3IgZXhhbXBsZSwgaWYgYSBwYXRlbnQKKyMgLWxp
Y2Vuc2Ugd291bGQgbm90IHBlcm1pdCByb3lhbHR5LWZyZWUgcmVkaXN0cmlidXRpb24gb2YgdGhl
IExpYnJhcnkgYnkKKyMgLWFsbCB0aG9zZSB3aG8gcmVjZWl2ZSBjb3BpZXMgZGlyZWN0bHkgb3Ig
aW5kaXJlY3RseSB0aHJvdWdoIHlvdSwgdGhlbgorIyAtdGhlIG9ubHkgd2F5IHlvdSBjb3VsZCBz
YXRpc2Z5IGJvdGggaXQgYW5kIHRoaXMgTGljZW5zZSB3b3VsZCBiZSB0bworIyAtcmVmcmFpbiBl
bnRpcmVseSBmcm9tIGRpc3RyaWJ1dGlvbiBvZiB0aGUgTGlicmFyeS4KKyMgLQorIyAtSWYgYW55
IHBvcnRpb24gb2YgdGhpcyBzZWN0aW9uIGlzIGhlbGQgaW52YWxpZCBvciB1bmVuZm9yY2VhYmxl
IHVuZGVyIGFueQorIyAtcGFydGljdWxhciBjaXJjdW1zdGFuY2UsIHRoZSBiYWxhbmNlIG9mIHRo
ZSBzZWN0aW9uIGlzIGludGVuZGVkIHRvIGFwcGx5LAorIyAtYW5kIHRoZSBzZWN0aW9uIGFzIGEg
d2hvbGUgaXMgaW50ZW5kZWQgdG8gYXBwbHkgaW4gb3RoZXIgY2lyY3Vtc3RhbmNlcy4KKyMgLQor
IyAtSXQgaXMgbm90IHRoZSBwdXJwb3NlIG9mIHRoaXMgc2VjdGlvbiB0byBpbmR1Y2UgeW91IHRv
IGluZnJpbmdlIGFueQorIyAtcGF0ZW50cyBvciBvdGhlciBwcm9wZXJ0eSByaWdodCBjbGFpbXMg
b3IgdG8gY29udGVzdCB2YWxpZGl0eSBvZiBhbnkKKyMgLXN1Y2ggY2xhaW1zOyB0aGlzIHNlY3Rp
b24gaGFzIHRoZSBzb2xlIHB1cnBvc2Ugb2YgcHJvdGVjdGluZyB0aGUKKyMgLWludGVncml0eSBv
ZiB0aGUgZnJlZSBzb2Z0d2FyZSBkaXN0cmlidXRpb24gc3lzdGVtIHdoaWNoIGlzCisjIC1pbXBs
ZW1lbnRlZCBieSBwdWJsaWMgbGljZW5zZSBwcmFjdGljZXMuICBNYW55IHBlb3BsZSBoYXZlIG1h
ZGUKKyMgLWdlbmVyb3VzIGNvbnRyaWJ1dGlvbnMgdG8gdGhlIHdpZGUgcmFuZ2Ugb2Ygc29mdHdh
cmUgZGlzdHJpYnV0ZWQKKyMgLXRocm91Z2ggdGhhdCBzeXN0ZW0gaW4gcmVsaWFuY2Ugb24gY29u
c2lzdGVudCBhcHBsaWNhdGlvbiBvZiB0aGF0CisjIC1zeXN0ZW07IGl0IGlzIHVwIHRvIHRoZSBh
dXRob3IvZG9ub3IgdG8gZGVjaWRlIGlmIGhlIG9yIHNoZSBpcyB3aWxsaW5nCisjIC10byBkaXN0
cmlidXRlIHNvZnR3YXJlIHRocm91Z2ggYW55IG90aGVyIHN5c3RlbSBhbmQgYSBsaWNlbnNlZSBj
YW5ub3QKKyMgLWltcG9zZSB0aGF0IGNob2ljZS4KKyMgLQorIyAtVGhpcyBzZWN0aW9uIGlzIGlu
dGVuZGVkIHRvIG1ha2UgdGhvcm91Z2hseSBjbGVhciB3aGF0IGlzIGJlbGlldmVkIHRvCisjIC1i
ZSBhIGNvbnNlcXVlbmNlIG9mIHRoZSByZXN0IG9mIHRoaXMgTGljZW5zZS4KKyMgLQorIyAtICAx
Mi4gSWYgdGhlIGRpc3RyaWJ1dGlvbiBhbmQvb3IgdXNlIG9mIHRoZSBMaWJyYXJ5IGlzIHJlc3Ry
aWN0ZWQgaW4KKyMgLWNlcnRhaW4gY291bnRyaWVzIGVpdGhlciBieSBwYXRlbnRzIG9yIGJ5IGNv
cHlyaWdodGVkIGludGVyZmFjZXMsIHRoZQorIyAtb3JpZ2luYWwgY29weXJpZ2h0IGhvbGRlciB3
aG8gcGxhY2VzIHRoZSBMaWJyYXJ5IHVuZGVyIHRoaXMgTGljZW5zZSBtYXkgYWRkCisjIC1hbiBl
eHBsaWNpdCBnZW9ncmFwaGljYWwgZGlzdHJpYnV0aW9uIGxpbWl0YXRpb24gZXhjbHVkaW5nIHRo
b3NlIGNvdW50cmllcywKKyMgLXNvIHRoYXQgZGlzdHJpYnV0aW9uIGlzIHBlcm1pdHRlZCBvbmx5
IGluIG9yIGFtb25nIGNvdW50cmllcyBub3QgdGh1cworIyAtZXhjbHVkZWQuICBJbiBzdWNoIGNh
c2UsIHRoaXMgTGljZW5zZSBpbmNvcnBvcmF0ZXMgdGhlIGxpbWl0YXRpb24gYXMgaWYKKyMgLXdy
aXR0ZW4gaW4gdGhlIGJvZHkgb2YgdGhpcyBMaWNlbnNlLgorIyAtCisjIC0gIDEzLiBUaGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uIG1heSBwdWJsaXNoIHJldmlzZWQgYW5kL29yIG5ldworIyAt
dmVyc2lvbnMgb2YgdGhlIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZyb20gdGltZSB0
byB0aW1lLgorIyAtU3VjaCBuZXcgdmVyc2lvbnMgd2lsbCBiZSBzaW1pbGFyIGluIHNwaXJpdCB0
byB0aGUgcHJlc2VudCB2ZXJzaW9uLAorIyAtYnV0IG1heSBkaWZmZXIgaW4gZGV0YWlsIHRvIGFk
ZHJlc3MgbmV3IHByb2JsZW1zIG9yIGNvbmNlcm5zLgorIyAtCisjIC1FYWNoIHZlcnNpb24gaXMg
Z2l2ZW4gYSBkaXN0aW5ndWlzaGluZyB2ZXJzaW9uIG51bWJlci4gIElmIHRoZSBMaWJyYXJ5Cisj
IC1zcGVjaWZpZXMgYSB2ZXJzaW9uIG51bWJlciBvZiB0aGlzIExpY2Vuc2Ugd2hpY2ggYXBwbGll
cyB0byBpdCBhbmQKKyMgLSJhbnkgbGF0ZXIgdmVyc2lvbiIsIHlvdSBoYXZlIHRoZSBvcHRpb24g
b2YgZm9sbG93aW5nIHRoZSB0ZXJtcyBhbmQKKyMgLWNvbmRpdGlvbnMgZWl0aGVyIG9mIHRoYXQg
dmVyc2lvbiBvciBvZiBhbnkgbGF0ZXIgdmVyc2lvbiBwdWJsaXNoZWQgYnkKKyMgLXRoZSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb24uICBJZiB0aGUgTGlicmFyeSBkb2VzIG5vdCBzcGVjaWZ5IGEK
KyMgLWxpY2Vuc2UgdmVyc2lvbiBudW1iZXIsIHlvdSBtYXkgY2hvb3NlIGFueSB2ZXJzaW9uIGV2
ZXIgcHVibGlzaGVkIGJ5CisjIC10aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgorIyAtDAor
IyAtICAxNC4gSWYgeW91IHdpc2ggdG8gaW5jb3Jwb3JhdGUgcGFydHMgb2YgdGhlIExpYnJhcnkg
aW50byBvdGhlciBmcmVlCisjIC1wcm9ncmFtcyB3aG9zZSBkaXN0cmlidXRpb24gY29uZGl0aW9u
cyBhcmUgaW5jb21wYXRpYmxlIHdpdGggdGhlc2UsCisjIC13cml0ZSB0byB0aGUgYXV0aG9yIHRv
IGFzayBmb3IgcGVybWlzc2lvbi4gIEZvciBzb2Z0d2FyZSB3aGljaCBpcworIyAtY29weXJpZ2h0
ZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgd3JpdGUgdG8gdGhlIEZyZWUKKyMg
LVNvZnR3YXJlIEZvdW5kYXRpb247IHdlIHNvbWV0aW1lcyBtYWtlIGV4Y2VwdGlvbnMgZm9yIHRo
aXMuICBPdXIKKyMgLWRlY2lzaW9uIHdpbGwgYmUgZ3VpZGVkIGJ5IHRoZSB0d28gZ29hbHMgb2Yg
cHJlc2VydmluZyB0aGUgZnJlZSBzdGF0dXMKKyMgLW9mIGFsbCBkZXJpdmF0aXZlcyBvZiBvdXIg
ZnJlZSBzb2Z0d2FyZSBhbmQgb2YgcHJvbW90aW5nIHRoZSBzaGFyaW5nCisjIC1hbmQgcmV1c2Ug
b2Ygc29mdHdhcmUgZ2VuZXJhbGx5LgorIyAtCisjIC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTk8gV0FSUkFOVFkKKyMgLQorIyAtICAxNS4gQkVDQVVTRSBUSEUgTElCUkFSWSBJUyBMSUNF
TlNFRCBGUkVFIE9GIENIQVJHRSwgVEhFUkUgSVMgTk8KKyMgLVdBUlJBTlRZIEZPUiBUSEUgTElC
UkFSWSwgVE8gVEhFIEVYVEVOVCBQRVJNSVRURUQgQlkgQVBQTElDQUJMRSBMQVcuCisjIC1FWENF
UFQgV0hFTiBPVEhFUldJU0UgU1RBVEVEIElOIFdSSVRJTkcgVEhFIENPUFlSSUdIVCBIT0xERVJT
IEFORC9PUgorIyAtT1RIRVIgUEFSVElFUyBQUk9WSURFIFRIRSBMSUJSQVJZICJBUyBJUyIgV0lU
SE9VVCBXQVJSQU5UWSBPRiBBTlkKKyMgLUtJTkQsIEVJVEhFUiBFWFBSRVNTRUQgT1IgSU1QTElF
RCwgSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFRIRQorIyAtSU1QTElFRCBXQVJSQU5U
SUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSCisjIC1Q
VVJQT1NFLiAgVEhFIEVOVElSRSBSSVNLIEFTIFRPIFRIRSBRVUFMSVRZIEFORCBQRVJGT1JNQU5D
RSBPRiBUSEUKKyMgLUxJQlJBUlkgSVMgV0lUSCBZT1UuICBTSE9VTEQgVEhFIExJQlJBUlkgUFJP
VkUgREVGRUNUSVZFLCBZT1UgQVNTVU1FCisjIC1USEUgQ09TVCBPRiBBTEwgTkVDRVNTQVJZIFNF
UlZJQ0lORywgUkVQQUlSIE9SIENPUlJFQ1RJT04uCisjIC0KKyMgLSAgMTYuIElOIE5PIEVWRU5U
IFVOTEVTUyBSRVFVSVJFRCBCWSBBUFBMSUNBQkxFIExBVyBPUiBBR1JFRUQgVE8gSU4KKyMgLVdS
SVRJTkcgV0lMTCBBTlkgQ09QWVJJR0hUIEhPTERFUiwgT1IgQU5ZIE9USEVSIFBBUlRZIFdITyBN
QVkgTU9ESUZZCisjIC1BTkQvT1IgUkVESVNUUklCVVRFIFRIRSBMSUJSQVJZIEFTIFBFUk1JVFRF
RCBBQk9WRSwgQkUgTElBQkxFIFRPIFlPVQorIyAtRk9SIERBTUFHRVMsIElOQ0xVRElORyBBTlkg
R0VORVJBTCwgU1BFQ0lBTCwgSU5DSURFTlRBTCBPUgorIyAtQ09OU0VRVUVOVElBTCBEQU1BR0VT
IEFSSVNJTkcgT1VUIE9GIFRIRSBVU0UgT1IgSU5BQklMSVRZIFRPIFVTRSBUSEUKKyMgLUxJQlJB
UlkgKElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gTE9TUyBPRiBEQVRBIE9SIERBVEEgQkVJ
TkcKKyMgLVJFTkRFUkVEIElOQUNDVVJBVEUgT1IgTE9TU0VTIFNVU1RBSU5FRCBCWSBZT1UgT1Ig
VEhJUkQgUEFSVElFUyBPUiBBCisjIC1GQUlMVVJFIE9GIFRIRSBMSUJSQVJZIFRPIE9QRVJBVEUg
V0lUSCBBTlkgT1RIRVIgU09GVFdBUkUpLCBFVkVOIElGCisjIC1TVUNIIEhPTERFUiBPUiBPVEhF
UiBQQVJUWSBIQVMgQkVFTiBBRFZJU0VEIE9GIFRIRSBQT1NTSUJJTElUWSBPRiBTVUNICisjIC1E
QU1BR0VTLgorIyAtCisjIC0gICAgICAgICAgICAgICAgICAgICBFTkQgT0YgVEVSTVMgQU5EIENP
TkRJVElPTlMKKyMgLQwKKyMgLSAgICAgICAgICAgSG93IHRvIEFwcGx5IFRoZXNlIFRlcm1zIHRv
IFlvdXIgTmV3IExpYnJhcmllcworIyAtCisjIC0gIElmIHlvdSBkZXZlbG9wIGEgbmV3IGxpYnJh
cnksIGFuZCB5b3Ugd2FudCBpdCB0byBiZSBvZiB0aGUgZ3JlYXRlc3QKKyMgLXBvc3NpYmxlIHVz
ZSB0byB0aGUgcHVibGljLCB3ZSByZWNvbW1lbmQgbWFraW5nIGl0IGZyZWUgc29mdHdhcmUgdGhh
dAorIyAtZXZlcnlvbmUgY2FuIHJlZGlzdHJpYnV0ZSBhbmQgY2hhbmdlLiAgWW91IGNhbiBkbyBz
byBieSBwZXJtaXR0aW5nCisjIC1yZWRpc3RyaWJ1dGlvbiB1bmRlciB0aGVzZSB0ZXJtcyAob3Is
IGFsdGVybmF0aXZlbHksIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUKKyMgLW9yZGluYXJ5IEdlbmVy
YWwgUHVibGljIExpY2Vuc2UpLgorIyAtCisjIC0gIFRvIGFwcGx5IHRoZXNlIHRlcm1zLCBhdHRh
Y2ggdGhlIGZvbGxvd2luZyBub3RpY2VzIHRvIHRoZSBsaWJyYXJ5LiAgSXQgaXMKKyMgLXNhZmVz
dCB0byBhdHRhY2ggdGhlbSB0byB0aGUgc3RhcnQgb2YgZWFjaCBzb3VyY2UgZmlsZSB0byBtb3N0
IGVmZmVjdGl2ZWx5CisjIC1jb252ZXkgdGhlIGV4Y2x1c2lvbiBvZiB3YXJyYW50eTsgYW5kIGVh
Y2ggZmlsZSBzaG91bGQgaGF2ZSBhdCBsZWFzdCB0aGUKKyMgLSJjb3B5cmlnaHQiIGxpbmUgYW5k
IGEgcG9pbnRlciB0byB3aGVyZSB0aGUgZnVsbCBub3RpY2UgaXMgZm91bmQuCisjIC0KKyMgLSAg
ICA8b25lIGxpbmUgdG8gZ2l2ZSB0aGUgbGlicmFyeSdzIG5hbWUgYW5kIGEgYnJpZWYgaWRlYSBv
ZiB3aGF0IGl0IGRvZXMuPgorIyAtICAgIENvcHlyaWdodCAoQykgPHllYXI+ICA8bmFtZSBvZiBh
dXRob3I+CisjIC0KKyMgLSAgICBUaGlzIGxpYnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNh
biByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisjIC0gICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYworIyAtICAgIExpY2Vuc2UgYXMgcHVi
bGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlcgorIyAtICAgIHZl
cnNpb24gMi4xIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2
ZXJzaW9uLgorIyAtCisjIC0gICAgVGhpcyBsaWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBo
b3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisjIC0gICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJB
TlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyMgLSAgICBNRVJDSEFO
VEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdO
VQorIyAtICAgIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMu
CisjIC0KKyMgLSAgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUg
TGVzc2VyIEdlbmVyYWwgUHVibGljCisjIC0gICAgTGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgbGli
cmFyeTsgaWYgbm90LCBzZWUgPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyMgLQor
IyAtQWxzbyBhZGQgaW5mb3JtYXRpb24gb24gaG93IHRvIGNvbnRhY3QgeW91IGJ5IGVsZWN0cm9u
aWMgYW5kIHBhcGVyIG1haWwuCisjIC0KKyMgLVlvdSBzaG91bGQgYWxzbyBnZXQgeW91ciBlbXBs
b3llciAoaWYgeW91IHdvcmsgYXMgYSBwcm9ncmFtbWVyKSBvciB5b3VyCisjIC1zY2hvb2wsIGlm
IGFueSwgdG8gc2lnbiBhICJjb3B5cmlnaHQgZGlzY2xhaW1lciIgZm9yIHRoZSBsaWJyYXJ5LCBp
ZgorIyAtbmVjZXNzYXJ5LiAgSGVyZSBpcyBhIHNhbXBsZTsgYWx0ZXIgdGhlIG5hbWVzOgorIyAt
CisjIC0gIFlveW9keW5lLCBJbmMuLCBoZXJlYnkgZGlzY2xhaW1zIGFsbCBjb3B5cmlnaHQgaW50
ZXJlc3QgaW4gdGhlCisjIC0gIGxpYnJhcnkgYEZyb2InIChhIGxpYnJhcnkgZm9yIHR3ZWFraW5n
IGtub2JzKSB3cml0dGVuIGJ5IEphbWVzIFJhbmRvbSBIYWNrZXIuCisjIC0KKyMgLSAgPHNpZ25h
dHVyZSBvZiBNb2UgR2hvdWw+LCAxIEFwcmlsIDE5OTAKKyMgLSAgTW9lIEdob3VsLCBQcmVzaWRl
bnQgb2YgVmljZQorIyAtCisjIC1UaGF0J3MgYWxsIHRoZXJlIGlzIHRvIGl0IQorIyArVEhFIFNP
RlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIgQU5EIFRIRSBBVVRIT1IgRElTQ0xBSU1TIEFMTCBX
QVJSQU5USUVTIFdJVEgKKyMgK1JFR0FSRCBUTyBUSElTIFNPRlRXQVJFIElOQ0xVRElORyBBTEwg
SU1QTElFRCBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQKKyMgK0ZJVE5FU1MuIElO
IE5PIEVWRU5UIFNIQUxMIFRIRSBBVVRIT1IgQkUgTElBQkxFIEZPUiBBTlkgU1BFQ0lBTCwgRElS
RUNULAorIyArSU5ESVJFQ1QsIE9SIENPTlNFUVVFTlRJQUwgREFNQUdFUyBPUiBBTlkgREFNQUdF
UyBXSEFUU09FVkVSIFJFU1VMVElORyBGUk9NIExPU1MKKyMgK09GIFVTRSwgREFUQSBPUiBQUk9G
SVRTLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgTkVHTElHRU5DRSBPUiBPVEhF
UgorIyArVE9SVElPVVMgQUNUSU9OLCBBUklTSU5HIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJ
VEggVEhFIFVTRSBPUiBQRVJGT1JNQU5DRSBPRgorIyArVEhJUyBTT0ZUV0FSRS4KKyMgCisjCisK
K1NVTU1BUlkgPSAiVW5pdmVyc2FsIGVuY29kaW5nIGRldGVjdG9yIGZvciBQeXRob24gMiBhbmQg
MyIKK0hPTUVQQUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9jaGFyZGV0LyIKK0xJQ0VO
U0UgPSAiTEdQTC0yLjEtb25seSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PWJkMDc1M2I5ZGMxMmU1ZTNkYTMwNDc3NzhmY2YxZGNhIgorCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiY2MxZDRlYjkyYTRlYzFjMmRmM2I0OTA4MzZmZmE0NjkyMmU1OTlkMzRjZTBiYjc1Y2Y0
MWZkMmJmNjMwM2Q1NiIKKworaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKKworREVQRU5E
UyArPSAicHl0aG9uMy1oYXRjaC12Y3MtbmF0aXZlIgorCitQQUNLQUdFUyA9KyAiJHtQTn0tY2xp
IgorRklMRVM6JHtQTn0tY2xpICs9ICIgXAorICAgICR7UFlUSE9OX1NJVEVQQUNLQUdFU19ESVJ9
L2NoYXJkZXQvY2xpIFwKKyIKKworUkRFUEVORFM6JHtQTn0tY2xpID0gIiR7UE59ICIKKworUkRF
UEVORFM6JHtQTn06Y2xhc3MtdGFyZ2V0ICs9ICIgXAorICAgIHB5dGhvbjMtbG9nZ2luZyBcCisi
CisKK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIuNDcuMQoK

--===============0871639332578799194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-chardet: PV changed from "6.0.0.post1" to "7.4.3"
packages/x86-64-v3-poky-linux/python3-chardet: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/chardet/chardet-6.0.0.post1.tar.gz;downloadfilename=chardet-6.0.0.post1.tar.gz" to "https://files.pythonhosted.org/packages/source/c/chardet/chardet-7.4.3.tar.gz;downloadfilename=chardet-7.4.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-chardet: PKGV changed from 6.0.0.post1 [default] to 7.4.3 [default]
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-cli: FILELIST: removed all items "/usr/lib/python3.14/site-packages/chardet/cli/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/cli/chardetect.py /usr/lib/python3.14/site-packages/chardet/cli/__init__.py /usr/lib/python3.14/site-packages/chardet/cli/__pycache__/chardetect.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-cli: PV changed from "6.0.0.post1" to "7.4.3"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet-cli: PKGSIZE changed from 9914 to 0 (-100%)
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
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet: FILELIST: directory renamed /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info/licenses -> /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/chardet-6.0.0.post1.dist-info -> /usr/lib/python3.14/site-packages/chardet-7.4.3.dist-info, removed "/usr/lib/python3.14/site-packages/chardet/langcroatianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/johabfreq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/sbcharsetprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcharsetprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langgermanmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langlithuanianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langmacedonianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langromanian
 model.py /usr/lib/python3.14/site-packages/chardet/mbcharsetprober.py /usr/lib/python3.14/site-packages/chardet/sbcharsetprober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/cp949prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/__init__.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langbulgarianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/chardistribution.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langnorwegianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langhungarianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/codingstatemachine.py /usr/lib/python3.14/site-packages/chardet/__pycache__/gb18030prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/gb2312freq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/cp949prober.py /usr/lib/python3.14/site-packages/chardet/eucjpprober.py /usr/lib/python3.14/site
 -packages/chardet/euckrprober.py /usr/lib/python3.14/site-packages/chardet/johabprober.py /usr/lib/python3.14/site-packages/chardet/langpolishmodel.py /usr/lib/python3.14/site-packages/chardet/charsetgroupprober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/euckrprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langczechmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langdutchmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langfarsimodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langgreekmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langirishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langmalaymodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langtajikmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langportuguesemodel.cpython-314.pyc /usr/lib/python
 3.14/site-packages/chardet/__pycache__/utf8prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langvietnamesemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/gb2312freq.py /usr/lib/python3.14/site-packages/chardet/__pycache__/jpcntx.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/language_model_notes.md /usr/lib/python3.14/site-packages/chardet/langdanishmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/johabprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langtajikmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langitalianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langlatvianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langrussianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langserbianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langesperantomodel.cpython-314.pyc /u
 sr/lib/python3.14/site-packages/chardet/__pycache__/codingstatemachine.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langdutchmodel.py /usr/lib/python3.14/site-packages/chardet/langestonianmodel.py /usr/lib/python3.14/site-packages/chardet/chardistribution.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langscottishgaelicmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/hebrewprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langicelandicmodel.py /usr/lib/python3.14/site-packages/chardet/codingstatemachinedict.py /usr/lib/python3.14/site-packages/chardet/__pycache__/charsetgroupprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langhungarianmodel.py /usr/lib/python3.14/site-packages/chardet/langenglishmodel.py /usr/lib/python3.14/site-packages/chardet/escsm.py /usr/lib/python3.14/site-packages/chardet/hebrewprober.py /usr/lib/python3.14/site-packages/chardet/escprober.py /usr/lib/python3.14/site-packages/cha
 rdet/__pycache__/escsm.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langicelandicmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/gb18030prober.py /usr/lib/python3.14/site-packages/chardet/langvietnamesemodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langarabicmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langbretonmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langdanishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langfrenchmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langgermanmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langhebrewmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langkazakhmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langpolishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/lan
 gslovakmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/euckrfreq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langserbianmodel.py /usr/lib/python3.14/site-packages/chardet/langesperantomodel.py /usr/lib/python3.14/site-packages/chardet/big5freq.py /usr/lib/python3.14/site-packages/chardet/charsetprober.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langindonesianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langbelarusianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/charsets.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/mbcsgroupprober.py /usr/lib/python3.14/site-packages/chardet/langkazakhmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/utf1632prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/sbcsgroupprober.py /usr/lib/python3.14/site-packages/chardet/euckrfreq.py /usr/lib/python3.14/site-packages/chardet/johabfreq.py /usr
 /lib/python3.14/site-packages/chardet/__pycache__/mbcsgroupprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/sbcsgroupprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langnorwegianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/big5freq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langukrainianmodel.py /usr/lib/python3.14/site-packages/chardet/langirishmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/big5prober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langbretonmodel.py /usr/lib/python3.14/site-packages/chardet/langfrenchmodel.py /usr/lib/python3.14/site-packages/chardet/langlatvianmodel.py /usr/lib/python3.14/site-packages/chardet/langitalianmodel.py /usr/lib/python3.14/site-packages/chardet/langspanishmodel.py /usr/lib/python3.14/site-packages/chardet/langmacedonianmodel.py /usr/lib/python3.14/site-packages/chardet/jisfreq.py /usr/lib/python3.14/site-packages/chardet/__pycache__/e
 ucjpprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langhebrewmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langwelshmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langmaltesemodel.py /usr/lib/python3.14/site-packages/chardet/big5prober.py /usr/lib/python3.14/site-packages/chardet/sjisprober.py /usr/lib/python3.14/site-packages/chardet/utf8prober.py /usr/lib/python3.14/site-packages/chardet/langfarsimodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/mbcssm.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/resultdict.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langmaltesemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langslovenemodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langbelarusianmodel.py /usr/lib/python3.14/site-packages/chardet/langbul
 garianmodel.py /usr/lib/python3.14/site-packages/chardet/langportuguesemodel.py /usr/lib/python3.14/site-packages/chardet/langswedishmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/jisfreq.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/languages.py /usr/lib/python3.14/site-packages/chardet/langthaimodel.py /usr/lib/python3.14/site-packages/chardet/langslovenemodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langenglishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langfinnishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langspanishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langswedishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langturkishmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langmalaymodel.py /usr/lib/python3.14/site-packages/chardet/langwelshmodel.py /usr/lib/python3.14/site-packages/cha
 rdet/langslovakmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langthaimodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/utf1632prober.py /usr/lib/python3.14/site-packages/chardet/langarabicmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/charsetprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/codingstatemachinedict.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langlithuanianmodel.py /usr/lib/python3.14/site-packages/chardet/jpcntx.py /usr/lib/python3.14/site-packages/chardet/mbcssm.py /usr/lib/python3.14/site-packages/chardet/langfinnishmodel.py /usr/lib/python3.14/site-packages/chardet/langczechmodel.py /usr/lib/python3.14/site-packages/chardet/langgreekmodel.py /usr/lib/python3.14/site-packages/chardet/version.py /usr/lib/python3.14/site-packages/chardet/langindonesianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/langcroatianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/c
 hardet/__pycache__/langestonianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langromanianmodel.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/metadata/charsets.py /usr/lib/python3.14/site-packages/chardet/resultdict.py /usr/lib/python3.14/site-packages/chardet/langrussianmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/version.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langscottishgaelicmodel.py /usr/lib/python3.14/site-packages/chardet/__pycache__/escprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/langturkishmodel.py /usr/lib/python3.14/site-packages/chardet/metadata/__pycache__/languages.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/sjisprober.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/langukrainianmodel.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/chardet/pipeline/structural.py /usr/lib/python3.14/site-packages/chardet/pipeline/ut
 f1632.py /usr/lib/python3.14/site-packages/chardet/detector.py /usr/lib/python3.14/site-packages/chardet/__pycache__/equivalences.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/bom.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/registry.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/orchestrator.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/__pycache__/_utils.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/__init__.py /usr/lib/python3.14/site-packages/chardet/pipeline/bom.py /usr/lib/python3.14/site-packages/chardet/registry.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/confusion.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/equivalences.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/utf8.cpython-314.pyc /usr/lib/python3.14/site-pac
 kages/chardet/pipeline/__pycache__/structural.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/binary.py /usr/lib/python3.14/site-packages/chardet/models/models.bin /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/utf1632.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/idf.bin /usr/lib/python3.14/site-packages/chardet/models/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/models/confusion.bin /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/binary.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/validity.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/_utils.py /usr/lib/python3.14/site-packages/chardet/__pycache__/cli.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__init__.py /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/magic.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/ascii.py /usr/lib/pyth
 on3.14/site-packages/chardet/pipeline/magic.py /usr/lib/python3.14/site-packages/chardet/pipeline/markup.py /usr/lib/python3.14/site-packages/chardet/pipeline/statistical.py /usr/lib/python3.14/site-packages/chardet/pipeline/confusion.py /usr/lib/python3.14/site-packages/chardet/pipeline/escape.py /usr/lib/python3.14/site-packages/chardet/pipeline/orchestrator.py /usr/lib/python3.14/site-packages/chardet/__pycache__/_version.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/escape.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/ascii.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/validity.py /usr/lib/python3.14/site-packages/chardet/__pycache__/detector.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/pipeline/__pycache__/markup.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/cli.py /usr/lib/python3.14/site-packages/chardet/pipeline/utf8.py /usr/lib/python3.14/site-packages/chardet/pip
 eline/__pycache__/statistical.cpython-314.pyc /usr/lib/python3.14/site-packages/chardet/_version.py /usr/lib/python3.14/site-packages/chardet/models/training_metadata.yaml"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet: PV changed from "6.0.0.post1" to "7.4.3"
packages/x86-64-v3-poky-linux/python3-chardet/python3-chardet: PKGSIZE changed from 24721887 to 1120674 (-95%)
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

--===============0871639332578799194==--

