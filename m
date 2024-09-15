Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D8FC35FE4
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.115648.1726410841912454676
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XEoKW8al;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=u+jyj09Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010191f61adbd0-aa72ec2f-1cd1-4a5b-ba88-3c9ad0d6b43c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YHq5k0WxvFqVJECmZn5lYKGMwdbwpLSnKYvrRSjNMCs=;
	b=XEoKW8algiwU3Q2iNPG0/cclPPbKGkNIkoxcwDAquMBcRRsPfYM6GdEhQIM3Olv8
	GrWgH9LGAfIQHGvoARZvg0KaQmcz3BIRWIxTvZfE9DquWYV2vXvwXgiDluBsRZntgFQ
	e55NnYRPPvX0j/w1GLethQXlDYK+vZ05KWG/OH7Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YHq5k0WxvFqVJECmZn5lYKGMwdbwpLSnKYvrRSjNMCs=;
	b=u+jyj09Zu2xCVVTv0sHfEEWTBiccMQVM9vpp1MIdQt6rloj3wgVvVdd7zcZd/8Rl
	vcpIf1A4gl8rYMWYoZkUOjSeqkn6SyeNCbWz/GsNv6eFAYb5jnRnuwfaWif+M+z+U5Q
	NcJh2sH193cgff7LtIUg1V+7XZYnFaGVlj0E3W3Q=
Content-Type: multipart/mixed; boundary="===============1912219002747855367=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] json-glib: upgrading to 1.10.0 SUCCEEDED
Message-ID: <01010191f61adbd0-aa72ec2f-1cd1-4a5b-ba88-3c9ad0d6b43c-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204570

--===============1912219002747855367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *json-glib* to *1.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-json-glib-upgrade-1.8.0-1.10.0.patch
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
From d9773863c650c3f9a52d5e47f549aa0797efb82e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 11:11:01 +0000
Subject: [PATCH] json-glib: upgrade 1.8.0 -> 1.10.0

---
 .../json-glib/json-glib_1.10.0.bb             | 649 ++++++++++++++++++
 .../json-glib/json-glib_1.8.0.bb              |  31 -
 2 files changed, 649 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
 delete mode 100644 meta/recipes-gnome/json-glib/json-glib_1.8.0.bb

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb b/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
new file mode 100644
index 0000000000..a98a2a864d
--- /dev/null
+++ b/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
@@ -0,0 +1,649 @@
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
+# @@ -1,504 +1,175 @@
+# -		  GNU LESSER GENERAL PUBLIC LICENSE
+# -		       Version 2.1, February 1999
+# +GNU LESSER GENERAL PUBLIC LICENSE
+#  
+# - Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+# -     59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# - Everyone is permitted to copy and distribute verbatim copies
+# - of this license document, but changing it is not allowed.
+# +Version 2.1, February 1999
+#  
+# -[This is the first released version of the Lesser GPL.  It also counts
+# - as the successor of the GNU Library Public License, version 2, hence
+# - the version number 2.1.]
+# +Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+# +51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+#  
+# -			    Preamble
+# +Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed.
+#  
+# -  The licenses for most software are designed to take away your
+# -freedom to share and change it.  By contrast, the GNU General Public
+# -Licenses are intended to guarantee your freedom to share and change
+# -free software--to make sure the software is free for all its users.
+# +[This is the first released version of the Lesser GPL.  It also counts as the successor of the GNU Library Public License, version 2, hence the version number 2.1.]
+#  
+# -  This license, the Lesser General Public License, applies to some
+# -specially designated software packages--typically libraries--of the
+# -Free Software Foundation and other authors who decide to use it.  You
+# -can use it too, but we suggest you first think carefully about whether
+# -this license or the ordinary General Public License is the better
+# -strategy to use in any particular case, based on the explanations below.
+# +Preamble
+#  
+# -  When we speak of free software, we are referring to freedom of use,
+# -not price.  Our General Public Licenses are designed to make sure that
+# -you have the freedom to distribute copies of free software (and charge
+# -for this service if you wish); that you receive source code or can get
+# -it if you want it; that you can change the software and use pieces of
+# -it in new free programs; and that you are informed that you can do
+# -these things.
+# +The licenses for most software are designed to take away your freedom to share and change it. By contrast, the GNU General Public Licenses are intended to guarantee your freedom to share and change free software--to make sure the software is free for all its users.
+#  
+# -  To protect your rights, we need to make restrictions that forbid
+# -distributors to deny you these rights or to ask you to surrender these
+# -rights.  These restrictions translate to certain responsibilities for
+# -you if you distribute copies of the library or if you modify it.
+# +This license, the Lesser General Public License, applies to some specially designated software packages--typically libraries--of the Free Software Foundation and other authors who decide to use it. You can use it too, but we suggest you first think carefully about whether this license or the ordinary General Public License is the better strategy to use in any particular case, based on the explanations below.
+#  
+# -  For example, if you distribute copies of the library, whether gratis
+# -or for a fee, you must give the recipients all the rights that we gave
+# -you.  You must make sure that they, too, receive or can get the source
+# -code.  If you link other code with the library, you must provide
+# -complete object files to the recipients, so that they can relink them
+# -with the library after making changes to the library and recompiling
+# -it.  And you must show them these terms so they know their rights.
+# +When we speak of free software, we are referring to freedom of use, not price. Our General Public Licenses are designed to make sure that you have the freedom to distribute copies of free software (and charge for this service if you wish); that you receive source code or can get it if you want it; that you can change the software and use pieces of it in new free programs; and that you are informed that you can do these things.
+#  
+# -  We protect your rights with a two-step method: (1) we copyright the
+# -library, and (2) we offer you this license, which gives you legal
+# -permission to copy, distribute and/or modify the library.
+# +To protect your rights, we need to make restrictions that forbid distributors to deny you these rights or to ask you to surrender these rights. These restrictions translate to certain responsibilities for you if you distribute copies of the library or if you modify it.
+#  
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
+# +For example, if you distribute copies of the library, whether gratis or for a fee, you must give the recipients all the rights that we gave you. You must make sure that they, too, receive or can get the source code. If you link other code with the library, you must provide complete object files to the recipients, so that they can relink them with the library after making changes to the library and recompiling it. And you must show them these terms so they know their rights.
+#  
+# -  Most GNU software, including some libraries, is covered by the
+# -ordinary GNU General Public License.  This license, the GNU Lesser
+# -General Public License, applies to certain designated libraries, and
+# -is quite different from the ordinary General Public License.  We use
+# -this license for certain libraries in order to permit linking those
+# -libraries into non-free programs.
+# +We protect your rights with a two-step method: (1) we copyright the library, and (2) we offer you this license, which gives you legal permission to copy, distribute and/or modify the library.
+#  
+# -  When a program is linked with a library, whether statically or using
+# -a shared library, the combination of the two is legally speaking a
+# -combined work, a derivative of the original library.  The ordinary
+# -General Public License therefore permits such linking only if the
+# -entire combination fits its criteria of freedom.  The Lesser General
+# -Public License permits more lax criteria for linking other code with
+# -the library.
+# +To protect each distributor, we want to make it very clear that there is no warranty for the free library. Also, if the library is modified by someone else and passed on, the recipients should know that what they have is not the original version, so that the original author's reputation will not be affected by problems that might be introduced by others.
+#  
+# -  We call this license the "Lesser" General Public License because it
+# -does Less to protect the user's freedom than the ordinary General
+# -Public License.  It also provides other free software developers Less
+# -of an advantage over competing non-free programs.  These disadvantages
+# -are the reason we use the ordinary General Public License for many
+# -libraries.  However, the Lesser license provides advantages in certain
+# -special circumstances.
+# +Finally, software patents pose a constant threat to the existence of any free program. We wish to make sure that a company cannot effectively restrict the users of a free program by obtaining a restrictive license from a patent holder. Therefore, we insist that any patent license obtained for a version of the library must be consistent with the full freedom of use specified in this license.
+#  
+# -  For example, on rare occasions, there may be a special need to
+# -encourage the widest possible use of a certain library, so that it becomes
+# -a de-facto standard.  To achieve this, non-free programs must be
+# -allowed to use the library.  A more frequent case is that a free
+# -library does the same job as widely used non-free libraries.  In this
+# -case, there is little to gain by limiting the free library to free
+# -software only, so we use the Lesser General Public License.
+# +Most GNU software, including some libraries, is covered by the ordinary GNU General Public License. This license, the GNU Lesser General Public License, applies to certain designated libraries, and is quite different from the ordinary General Public License. We use this license for certain libraries in order to permit linking those libraries into non-free programs.
+#  
+# -  In other cases, permission to use a particular library in non-free
+# -programs enables a greater number of people to use a large body of
+# -free software.  For example, permission to use the GNU C Library in
+# -non-free programs enables many more people to use the whole GNU
+# -operating system, as well as its variant, the GNU/Linux operating
+# -system.
+# +When a program is linked with a library, whether statically or using a shared library, the combination of the two is legally speaking a combined work, a derivative of the original library. The ordinary General Public License therefore permits such linking only if the entire combination fits its criteria of freedom. The Lesser General Public License permits more lax criteria for linking other code with the library.
+#  
+# -  Although the Lesser General Public License is Less protective of the
+# -users' freedom, it does ensure that the user of a program that is
+# -linked with the Library has the freedom and the wherewithal to run
+# -that program using a modified version of the Library.
+# +We call this license the "Lesser" General Public License because it does Less to protect the user's freedom than the ordinary General Public License. It also provides other free software developers Less of an advantage over competing non-free programs. These disadvantages are the reason we use the ordinary General Public License for many libraries. However, the Lesser license provides advantages in certain special circumstances.
+#  
+# -  The precise terms and conditions for copying, distribution and
+# -modification follow.  Pay close attention to the difference between a
+# -"work based on the library" and a "work that uses the library".  The
+# -former contains code derived from the library, whereas the latter must
+# -be combined with the library in order to run.
+# -
+# -		  GNU LESSER GENERAL PUBLIC LICENSE
+# -   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+# +For example, on rare occasions, there may be a special need to encourage the widest possible use of a certain library, so that it becomes a de-facto standard. To achieve this, non-free programs must be allowed to use the library. A more frequent case is that a free library does the same job as widely used non-free libraries. In this case, there is little to gain by limiting the free library to free software only, so we use the Lesser General Public License.
+#  
+# -  0. This License Agreement applies to any software library or other
+# -program which contains a notice placed by the copyright holder or
+# -other authorized party saying it may be distributed under the terms of
+# -this Lesser General Public License (also called "this License").
+# -Each licensee is addressed as "you".
+# +In other cases, permission to use a particular library in non-free programs enables a greater number of people to use a large body of free software. For example, permission to use the GNU C Library in non-free programs enables many more people to use the whole GNU operating system, as well as its variant, the GNU/Linux operating system.
+#  
+# -  A "library" means a collection of software functions and/or data
+# -prepared so as to be conveniently linked with application programs
+# -(which use some of those functions and data) to form executables.
+# +Although the Lesser General Public License is Less protective of the users' freedom, it does ensure that the user of a program that is linked with the Library has the freedom and the wherewithal to run that program using a modified version of the Library.
+#  
+# -  The "Library", below, refers to any such software library or work
+# -which has been distributed under these terms.  A "work based on the
+# -Library" means either the Library or any derivative work under
+# -copyright law: that is to say, a work containing the Library or a
+# -portion of it, either verbatim or with modifications and/or translated
+# -straightforwardly into another language.  (Hereinafter, translation is
+# -included without limitation in the term "modification".)
+# +The precise terms and conditions for copying, distribution and modification follow. Pay close attention to the difference between a "work based on the library" and a "work that uses the library". The former contains code derived from the library, whereas the latter must be combined with the library in order to run.
+#  
+# -  "Source code" for a work means the preferred form of the work for
+# -making modifications to it.  For a library, complete source code means
+# -all the source code for all modules it contains, plus any associated
+# -interface definition files, plus the scripts used to control compilation
+# -and installation of the library.
+# +TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+#  
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
+# +0. This License Agreement applies to any software library or other program which contains a notice placed by the copyright holder or other authorized party saying it may be distributed under the terms of this Lesser General Public License (also called "this License"). Each licensee is addressed as "you".
+#  
+# -  You may charge a fee for the physical act of transferring a copy,
+# -and you may at your option offer warranty protection in exchange for a
+# -fee.
+# -
+# -  2. You may modify your copy or copies of the Library or any portion
+# -of it, thus forming a work based on the Library, and copy and
+# -distribute such modifications or work under the terms of Section 1
+# -above, provided that you also meet all of these conditions:
+# +A "library" means a collection of software functions and/or data prepared so as to be conveniently linked with application programs (which use some of those functions and data) to form executables.
+#  
+# -    a) The modified work must itself be a software library.
+# +The "Library", below, refers to any such software library or work which has been distributed under these terms. A "work based on the Library" means either the Library or any derivative work under copyright law: that is to say, a work containing the Library or a portion of it, either verbatim or with modifications and/or translated straightforwardly into another language. (Hereinafter, translation is included without limitation in the term "modification".)
+#  
+# -    b) You must cause the files modified to carry prominent notices
+# -    stating that you changed the files and the date of any change.
+# +"Source code" for a work means the preferred form of the work for making modifications to it. For a library, complete source code means all the source code for all modules it contains, plus any associated interface definition files, plus the scripts used to control compilation and installation of the library.
+#  
+# -    c) You must cause the whole of the work to be licensed at no
+# -    charge to all third parties under the terms of this License.
+# +Activities other than copying, distribution and modification are not covered by this License; they are outside its scope. The act of running a program using the Library is not restricted, and output from such a program is covered only if its contents constitute a work based on the Library (independent of the use of the Library in a tool for writing it). Whether that is true depends on what the Library does and what the program that uses the Library does.
+#  
+# -    d) If a facility in the modified Library refers to a function or a
+# -    table of data to be supplied by an application program that uses
+# -    the facility, other than as an argument passed when the facility
+# -    is invoked, then you must make a good faith effort to ensure that,
+# -    in the event an application does not supply such function or
+# -    table, the facility still operates, and performs whatever part of
+# -    its purpose remains meaningful.
+# +1. You may copy and distribute verbatim copies of the Library's complete source code as you receive it, in any medium, provided that you conspicuously and appropriately publish on each copy an appropriate copyright notice and disclaimer of warranty; keep intact all the notices that refer to this License and to the absence of any warranty; and distribute a copy of this License along with the Library.
+#  
+# -    (For example, a function in a library to compute square roots has
+# -    a purpose that is entirely well-defined independent of the
+# -    application.  Therefore, Subsection 2d requires that any
+# -    application-supplied function or table used by this function must
+# -    be optional: if the application does not supply it, the square
+# -    root function must still compute square roots.)
+# +You may charge a fee for the physical act of transferring a copy, and you may at your option offer warranty protection in exchange for a fee.
+#  
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
+# +2. You may modify your copy or copies of the Library or any portion of it, thus forming a work based on the Library, and copy and distribute such modifications or work under the terms of Section 1 above, provided that you also meet all of these conditions:
+#  
+# -Thus, it is not the intent of this section to claim rights or contest
+# -your rights to work written entirely by you; rather, the intent is to
+# -exercise the right to control the distribution of derivative or
+# -collective works based on the Library.
+# +     a) The modified work must itself be a software library.
+#  
+# -In addition, mere aggregation of another work not based on the Library
+# -with the Library (or with a work based on the Library) on a volume of
+# -a storage or distribution medium does not bring the other work under
+# -the scope of this License.
+# +     b) You must cause the files modified to carry prominent notices stating that you changed the files and the date of any change.
+#  
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
+# +     c) You must cause the whole of the work to be licensed at no charge to all third parties under the terms of this License.
+#  
+# -  This option is useful when you wish to copy part of the code of
+# -the Library into a program that is not a library.
+# +     d) If a facility in the modified Library refers to a function or a table of data to be supplied by an application program that uses the facility, other than as an argument passed when the facility is invoked, then you must make a good faith effort to ensure that, in the event an application does not supply such function or table, the facility still operates, and performs whatever part of its purpose remains meaningful.
+#  
+# -  4. You may copy and distribute the Library (or a portion or
+# -derivative of it, under Section 2) in object code or executable form
+# -under the terms of Sections 1 and 2 above provided that you accompany
+# -it with the complete corresponding machine-readable source code, which
+# -must be distributed under the terms of Sections 1 and 2 above on a
+# -medium customarily used for software interchange.
+# +(For example, a function in a library to compute square roots has a purpose that is entirely well-defined independent of the application. Therefore, Subsection 2d requires that any application-supplied function or table used by this function must be optional: if the application does not supply it, the square root function must still compute square roots.)
+#  
+# -  If distribution of object code is made by offering access to copy
+# -from a designated place, then offering equivalent access to copy the
+# -source code from the same place satisfies the requirement to
+# -distribute the source code, even though third parties are not
+# -compelled to copy the source along with the object code.
+# +These requirements apply to the modified work as a whole. If identifiable sections of that work are not derived from the Library, and can be reasonably considered independent and separate works in themselves, then this License, and its terms, do not apply to those sections when you distribute them as separate works. But when you distribute the same sections as part of a whole which is a work based on the Library, the distribution of the whole must be on the terms of this License, whose permissions for other licensees extend to the entire whole, and thus to each and every part regardless of who wrote it.
+#  
+# -  5. A program that contains no derivative of any portion of the
+# -Library, but is designed to work with the Library by being compiled or
+# -linked with it, is called a "work that uses the Library".  Such a
+# -work, in isolation, is not a derivative work of the Library, and
+# -therefore falls outside the scope of this License.
+# +Thus, it is not the intent of this section to claim rights or contest your rights to work written entirely by you; rather, the intent is to exercise the right to control the distribution of derivative or collective works based on the Library.
+#  
+# -  However, linking a "work that uses the Library" with the Library
+# -creates an executable that is a derivative of the Library (because it
+# -contains portions of the Library), rather than a "work that uses the
+# -library".  The executable is therefore covered by this License.
+# -Section 6 states terms for distribution of such executables.
+# +In addition, mere aggregation of another work not based on the Library with the Library (or with a work based on the Library) on a volume of a storage or distribution medium does not bring the other work under the scope of this License.
+#  
+# -  When a "work that uses the Library" uses material from a header file
+# -that is part of the Library, the object code for the work may be a
+# -derivative work of the Library even though the source code is not.
+# -Whether this is true is especially significant if the work can be
+# -linked without the Library, or if the work is itself a library.  The
+# -threshold for this to be true is not precisely defined by law.
+# +3. You may opt to apply the terms of the ordinary GNU General Public License instead of this License to a given copy of the Library. To do this, you must alter all the notices that refer to this License, so that they refer to the ordinary GNU General Public License, version 2, instead of to this License. (If a newer version than version 2 of the ordinary GNU General Public License has appeared, then you can specify that version instead if you wish.) Do not make any other change in these notices.
+#  
+# -  If such an object file uses only numerical parameters, data
+# -structure layouts and accessors, and small macros and small inline
+# -functions (ten lines or less in length), then the use of the object
+# -file is unrestricted, regardless of whether it is legally a derivative
+# -work.  (Executables containing this object code plus portions of the
+# -Library will still fall under Section 6.)
+# +Once this change is made in a given copy, it is irreversible for that copy, so the ordinary GNU General Public License applies to all subsequent copies and derivative works made from that copy.
+#  
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
+# +This option is useful when you wish to copy part of the code of the Library into a program that is not a library.
+#  
+# -  You must give prominent notice with each copy of the work that the
+# -Library is used in it and that the Library and its use are covered by
+# -this License.  You must supply a copy of this License.  If the work
+# -during execution displays copyright notices, you must include the
+# -copyright notice for the Library among them, as well as a reference
+# -directing the user to the copy of this License.  Also, you must do one
+# -of these things:
+# +4. You may copy and distribute the Library (or a portion or derivative of it, under Section 2) in object code or executable form under the terms of Sections 1 and 2 above provided that you accompany it with the complete corresponding machine-readable source code, which must be distributed under the terms of Sections 1 and 2 above on a medium customarily used for software interchange.
+#  
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
+# +If distribution of object code is made by offering access to copy from a designated place, then offering equivalent access to copy the source code from the same place satisfies the requirement to distribute the source code, even though third parties are not compelled to copy the source along with the object code.
+#  
+# -    b) Use a suitable shared library mechanism for linking with the
+# -    Library.  A suitable mechanism is one that (1) uses at run time a
+# -    copy of the library already present on the user's computer system,
+# -    rather than copying library functions into the executable, and (2)
+# -    will operate properly with a modified version of the library, if
+# -    the user installs one, as long as the modified version is
+# -    interface-compatible with the version that the work was made with.
+# +5. A program that contains no derivative of any portion of the Library, but is designed to work with the Library by being compiled or linked with it, is called a "work that uses the Library". Such a work, in isolation, is not a derivative work of the Library, and therefore falls outside the scope of this License.
+#  
+# -    c) Accompany the work with a written offer, valid for at
+# -    least three years, to give the same user the materials
+# -    specified in Subsection 6a, above, for a charge no more
+# -    than the cost of performing this distribution.
+# +However, linking a "work that uses the Library" with the Library creates an executable that is a derivative of the Library (because it contains portions of the Library), rather than a "work that uses the library". The executable is therefore covered by this License. Section 6 states terms for distribution of such executables.
+#  
+# -    d) If distribution of the work is made by offering access to copy
+# -    from a designated place, offer equivalent access to copy the above
+# -    specified materials from the same place.
+# +When a "work that uses the Library" uses material from a header file that is part of the Library, the object code for the work may be a derivative work of the Library even though the source code is not. Whether this is true is especially significant if the work can be linked without the Library, or if the work is itself a library. The threshold for this to be true is not precisely defined by law.
+#  
+# -    e) Verify that the user has already received a copy of these
+# -    materials or that you have already sent this user a copy.
+# +If such an object file uses only numerical parameters, data structure layouts and accessors, and small macros and small inline functions (ten lines or less in length), then the use of the object file is unrestricted, regardless of whether it is legally a derivative work. (Executables containing this object code plus portions of the Library will still fall under Section 6.)
+#  
+# -  For an executable, the required form of the "work that uses the
+# -Library" must include any data and utility programs needed for
+# -reproducing the executable from it.  However, as a special exception,
+# -the materials to be distributed need not include anything that is
+# -normally distributed (in either source or binary form) with the major
+# -components (compiler, kernel, and so on) of the operating system on
+# -which the executable runs, unless that component itself accompanies
+# -the executable.
+# +Otherwise, if the work is a derivative of the Library, you may distribute the object code for the work under the terms of Section 6. Any executables containing that work also fall under Section 6, whether or not they are linked directly with the Library itself.
+#  
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
+# +6. As an exception to the Sections above, you may also combine or link a "work that uses the Library" with the Library to produce a work containing portions of the Library, and distribute that work under terms of your choice, provided that the terms permit modification of the work for the customer's own use and reverse engineering for debugging such modifications.
+#  
+# -    a) Accompany the combined library with a copy of the same work
+# -    based on the Library, uncombined with any other library
+# -    facilities.  This must be distributed under the terms of the
+# -    Sections above.
+# +You must give prominent notice with each copy of the work that the Library is used in it and that the Library and its use are covered by this License. You must supply a copy of this License. If the work during execution displays copyright notices, you must include the copyright notice for the Library among them, as well as a reference directing the user to the copy of this License. Also, you must do one of these things:
+#  
+# -    b) Give prominent notice with the combined library of the fact
+# -    that part of it is a work based on the Library, and explaining
+# -    where to find the accompanying uncombined form of the same work.
+# +     a) Accompany the work with the complete corresponding machine-readable source code for the Library including whatever changes were used in the work (which must be distributed under Sections 1 and 2 above); and, if the work is an executable linked with the Library, with the complete machine-readable "work that uses the Library", as object code and/or source code, so that the user can modify the Library and then relink to produce a modified executable containing the modified Library. (It is understood that the user who changes the contents of definitions files in the Library will not necessarily be able to recompile the application to use the modified definitions.)
+#  
+# -  8. You may not copy, modify, sublicense, link with, or distribute
+# -the Library except as expressly provided under this License.  Any
+# -attempt otherwise to copy, modify, sublicense, link with, or
+# -distribute the Library is void, and will automatically terminate your
+# -rights under this License.  However, parties who have received copies,
+# -or rights, from you under this License will not have their licenses
+# -terminated so long as such parties remain in full compliance.
+# +     b) Use a suitable shared library mechanism for linking with the Library. A suitable mechanism is one that (1) uses at run time a copy of the library already present on the user's computer system, rather than copying library functions into the executable, and (2) will operate properly with a modified version of the library, if the user installs one, as long as the modified version is interface-compatible with the version that the work was made with.
+#  
+# -  9. You are not required to accept this License, since you have not
+# -signed it.  However, nothing else grants you permission to modify or
+# -distribute the Library or its derivative works.  These actions are
+# -prohibited by law if you do not accept this License.  Therefore, by
+# -modifying or distributing the Library (or any work based on the
+# -Library), you indicate your acceptance of this License to do so, and
+# -all its terms and conditions for copying, distributing or modifying
+# -the Library or works based on it.
+# +     c) Accompany the work with a written offer, valid for at least three years, to give the same user the materials specified in Subsection 6a, above, for a charge no more than the cost of performing this distribution.
+#  
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
+# +     d) If distribution of the work is made by offering access to copy from a designated place, offer equivalent access to copy the above specified materials from the same place.
+#  
+# -If any portion of this section is held invalid or unenforceable under any
+# -particular circumstance, the balance of the section is intended to apply,
+# -and the section as a whole is intended to apply in other circumstances.
+# +     e) Verify that the user has already received a copy of these materials or that you have already sent this user a copy.
+#  
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
+# +For an executable, the required form of the "work that uses the Library" must include any data and utility programs needed for reproducing the executable from it. However, as a special exception, the materials to be distributed need not include anything that is normally distributed (in either source or binary form) with the major components (compiler, kernel, and so on) of the operating system on which the executable runs, unless that component itself accompanies the executable.
+#  
+# -This section is intended to make thoroughly clear what is believed to
+# -be a consequence of the rest of this License.
+# +It may happen that this requirement contradicts the license restrictions of other proprietary libraries that do not normally accompany the operating system. Such a contradiction means you cannot use both them and the Library together in an executable that you distribute.
+#  
+# -  12. If the distribution and/or use of the Library is restricted in
+# -certain countries either by patents or by copyrighted interfaces, the
+# -original copyright holder who places the Library under this License may add
+# -an explicit geographical distribution limitation excluding those countries,
+# -so that distribution is permitted only in or among countries not thus
+# -excluded.  In such case, this License incorporates the limitation as if
+# -written in the body of this License.
+# +7. You may place library facilities that are a work based on the Library side-by-side in a single library together with other library facilities not covered by this License, and distribute such a combined library, provided that the separate distribution of the work based on the Library and of the other library facilities is otherwise permitted, and provided that you do these two things:
+#  
+# -  13. The Free Software Foundation may publish revised and/or new
+# -versions of the Lesser General Public License from time to time.
+# -Such new versions will be similar in spirit to the present version,
+# -but may differ in detail to address new problems or concerns.
+# +     a) Accompany the combined library with a copy of the same work based on the Library, uncombined with any other library facilities. This must be distributed under the terms of the Sections above.
+#  
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
+# +     b) Give prominent notice with the combined library of the fact that part of it is a work based on the Library, and explaining where to find the accompanying uncombined form of the same work.
+#  
+# -			    NO WARRANTY
+# +8. You may not copy, modify, sublicense, link with, or distribute the Library except as expressly provided under this License. Any attempt otherwise to copy, modify, sublicense, link with, or distribute the Library is void, and will automatically terminate your rights under this License. However, parties who have received copies, or rights, from you under this License will not have their licenses terminated so long as such parties remain in full compliance.
+#  
+# -  15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
+# -WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
+# -EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
+# -OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY
+# -KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
+# -IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+# -PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
+# -LIBRARY IS WITH YOU.  SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
+# -THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+# +9. You are not required to accept this License, since you have not signed it. However, nothing else grants you permission to modify or distribute the Library or its derivative works. These actions are prohibited by law if you do not accept this License. Therefore, by modifying or distributing the Library (or any work based on the Library), you indicate your acceptance of this License to do so, and all its terms and conditions for copying, distributing or modifying the Library or works based on it.
+#  
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
+# +10. Each time you redistribute the Library (or any work based on the Library), the recipient automatically receives a license from the original licensor to copy, distribute, link with or modify the Library subject to these terms and conditions. You may not impose any further restrictions on the recipients' exercise of the rights granted herein. You are not responsible for enforcing compliance by third parties with this License.
+#  
+# -		     END OF TERMS AND CONDITIONS
+# -
+# -           How to Apply These Terms to Your New Libraries
+# +11. If, as a consequence of a court judgment or allegation of patent infringement or for any other reason (not limited to patent issues), conditions are imposed on you (whether by court order, agreement or otherwise) that contradict the conditions of this License, they do not excuse you from the conditions of this License. If you cannot distribute so as to satisfy simultaneously your obligations under this License and any other pertinent obligations, then as a consequence you may not distribute the Library at all. For example, if a patent license would not permit royalty-free redistribution of the Library by all those who receive copies directly or indirectly through you, then the only way you could satisfy both it and this License would be to refrain entirely from distribution of the Library.
+#  
+# -  If you develop a new library, and you want it to be of the greatest
+# -possible use to the public, we recommend making it free software that
+# -everyone can redistribute and change.  You can do so by permitting
+# -redistribution under these terms (or, alternatively, under the terms of the
+# -ordinary General Public License).
+# +If any portion of this section is held invalid or unenforceable under any particular circumstance, the balance of the section is intended to apply, and the section as a whole is intended to apply in other circumstances.
+#  
+# -  To apply these terms, attach the following notices to the library.  It is
+# -safest to attach them to the start of each source file to most effectively
+# -convey the exclusion of warranty; and each file should have at least the
+# -"copyright" line and a pointer to where the full notice is found.
+# +It is not the purpose of this section to induce you to infringe any patents or other property right claims or to contest validity of any such claims; this section has the sole purpose of protecting the integrity of the free software distribution system which is implemented by public license practices. Many people have made generous contributions to the wide range of software distributed through that system in reliance on consistent application of that system; it is up to the author/donor to decide if he or she is willing to distribute software through any other system and a licensee cannot impose that choice.
+#  
+# -    <one line to give the library's name and a brief idea of what it does.>
+# -    Copyright (C) <year>  <name of author>
+# +This section is intended to make thoroughly clear what is believed to be a consequence of the rest of this License.
+#  
+# -    This library is free software; you can redistribute it and/or
+# -    modify it under the terms of the GNU Lesser General Public
+# -    License as published by the Free Software Foundation; either
+# -    version 2.1 of the License, or (at your option) any later version.
+# +12. If the distribution and/or use of the Library is restricted in certain countries either by patents or by copyrighted interfaces, the original copyright holder who places the Library under this License may add an explicit geographical distribution limitation excluding those countries, so that distribution is permitted only in or among countries not thus excluded. In such case, this License incorporates the limitation as if written in the body of this License.
+#  
+# -    This library is distributed in the hope that it will be useful,
+# -    but WITHOUT ANY WARRANTY; without even the implied warranty of
+# -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# -    Lesser General Public License for more details.
+# +13. The Free Software Foundation may publish revised and/or new versions of the Lesser General Public License from time to time. Such new versions will be similar in spirit to the present version, but may differ in detail to address new problems or concerns.
+#  
+# -    You should have received a copy of the GNU Lesser General Public
+# -    License along with this library; if not, write to the Free Software
+# -    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# +Each version is given a distinguishing version number. If the Library specifies a version number of this License which applies to it and "any later version", you have the option of following the terms and conditions either of that version or of any later version published by the Free Software Foundation. If the Library does not specify a license version number, you may choose any version ever published by the Free Software Foundation.
+#  
+# -Also add information on how to contact you by electronic and paper mail.
+# +14. If you wish to incorporate parts of the Library into other free programs whose distribution conditions are incompatible with these, write to the author to ask for permission. For software which is copyrighted by the Free Software Foundation, write to the Free Software Foundation; we sometimes make exceptions for this. Our decision will be guided by the two goals of preserving the free status of all derivatives of our free software and of promoting the sharing and reuse of software generally.
+#  
+# -You should also get your employer (if you work as a programmer) or your
+# -school, if any, to sign a "copyright disclaimer" for the library, if
+# -necessary.  Here is a sample; alter the names:
+# +NO WARRANTY
+#  
+# -  Yoyodyne, Inc., hereby disclaims all copyright interest in the
+# -  library `Frob' (a library for tweaking knobs) written by James Random Hacker.
+# +15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE LIBRARY IS WITH YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+#  
+# -  <signature of Ty Coon>, 1 April 1990
+# -  Ty Coon, President of Vice
+# +16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+#  
+# +END OF TERMS AND CONDITIONS
+# +
+# +How to Apply These Terms to Your New Libraries
+# +
+# +If you develop a new library, and you want it to be of the greatest possible use to the public, we recommend making it free software that everyone can redistribute and change. You can do so by permitting redistribution under these terms (or, alternatively, under the terms of the ordinary General Public License).
+# +
+# +To apply these terms, attach the following notices to the library. It is safest to attach them to the start of each source file to most effectively convey the exclusion of warranty; and each file should have at least the "copyright" line and a pointer to where the full notice is found.
+# +
+# +     one line to give the library's name and an idea of what it does.
+# +     Copyright (C) year  name of author
+# +
+# +     This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.
+# +
+# +     This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
+# +
+# +     You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA Also add information on how to contact you by electronic and paper mail.
+# +
+# +You should also get your employer (if you work as a programmer) or your school, if any, to sign a "copyright disclaimer" for the library, if necessary. Here is a sample; alter the names:
+# +
+# +Yoyodyne, Inc., hereby disclaims all copyright interest in
+# +the library `Frob' (a library for tweaking knobs) written
+# +by James Random Hacker.
+# +
+# +signature of Ty Coon, 1 April 1990
+# +Ty Coon, President of Vice
+#  That's all there is to it!
+# -
+# -
+# 
+#
+
+SUMMARY = "JSON-GLib implements a full JSON parser using GLib and GObject"
+DESCRIPTION = "Use JSON-GLib it is possible to parse and generate valid JSON\
+ data structures, using a DOM-like API. JSON-GLib also offers GObject \
+integration, providing the ability to serialize and deserialize GObject \
+instances to and from JSON data types."
+HOMEPAGE = "https://wiki.gnome.org/Projects/JsonGlib"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/json-glib/issues"
+
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=41890f71f740302b785c27661123bff5"
+
+DEPENDS = "glib-2.0 glib-2.0-native"
+
+inherit gnomebase lib_package gobject-introspection gi-docgen gettext ptest-gnome manpages upstream-version-is-even
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
+GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
+
+SRC_URI += " file://run-ptest"
+SRC_URI[archive.sha256sum] = "1bca8d66d96106ecc147df3133b95a5bb784f1fa6f15d06dd7c1a8fb4a10af7b"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# Currently it's not possible to disable gettext in Meson, so we need to force
+# this back on.
+USE_NLS:class-native = "yes"
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb b/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
deleted file mode 100644
index 2094ebe3e7..0000000000
--- a/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "JSON-GLib implements a full JSON parser using GLib and GObject"
-DESCRIPTION = "Use JSON-GLib it is possible to parse and generate valid JSON\
- data structures, using a DOM-like API. JSON-GLib also offers GObject \
-integration, providing the ability to serialize and deserialize GObject \
-instances to and from JSON data types."
-HOMEPAGE = "https://wiki.gnome.org/Projects/JsonGlib"
-BUGTRACKER = "https://gitlab.gnome.org/GNOME/json-glib/issues"
-
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-DEPENDS = "glib-2.0 glib-2.0-native"
-
-inherit gnomebase lib_package gobject-introspection gi-docgen gettext ptest-gnome manpages upstream-version-is-even
-GIR_MESON_ENABLE_FLAG = 'enabled'
-GIR_MESON_DISABLE_FLAG = 'disabled'
-GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
-GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
-
-SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
-PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
-PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
-
-BBCLASSEXTEND = "native nativesdk"
-
-# Currently it's not possible to disable gettext in Meson, so we need to force
-# this back on.
-USE_NLS:class-native = "yes"
-- 
2.44.0


--===============1912219002747855367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/json-glib/json-glib-locale-eo: PKGSIZE changed from 3747 to 5430 (+45%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-fa: PKGSIZE changed from 2020 to 6365 (+215%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-hi: PKGSIZE changed from 5374 to 7674 (+43%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-ne: PKGSIZE changed from 5965 to 7461 (+25%)
packages/core2-64-poky-linux/json-glib/json-glib: FILELIST: removed "/usr/lib/libjson-glib-1.0.so.0.800.0", added "/usr/lib/libjson-glib-1.0.so.0.1000.0"
packages/core2-64-poky-linux/json-glib: PACKAGES: added "json-glib-locale-kab json-glib-locale-th"
Changes to packages/core2-64-poky-linux/json-glib (sysroot):
  /usr/lib/libjson-glib-1.0.so.0 changed symlink target from libjson-glib-1.0.so.0.800.0 to libjson-glib-1.0.so.0.1000.0
  /usr/lib/libjson-glib-1.0.so.0.1000.0 was added
  /usr/lib/libjson-glib-1.0.so.0.800.0 was removed

--===============1912219002747855367==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-json-glib-upgrade-1.8.0-1.10.0.patch"

RnJvbSBkOTc3Mzg2M2M2NTBjM2Y5YTUyZDVlNDdmNTQ5YWEwNzk3ZWZiODJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTE6MTE6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBq
c29uLWdsaWI6IHVwZ3JhZGUgMS44LjAgLT4gMS4xMC4wCgotLS0KIC4uLi9qc29uLWdsaWIvanNv
bi1nbGliXzEuMTAuMC5iYiAgICAgICAgICAgICB8IDY0OSArKysrKysrKysrKysrKysrKysKIC4u
Li9qc29uLWdsaWIvanNvbi1nbGliXzEuOC4wLmJiICAgICAgICAgICAgICB8ICAzMSAtCiAyIGZp
bGVzIGNoYW5nZWQsIDY0OSBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ25vbWUvanNvbi1nbGliL2pzb24tZ2xpYl8xLjEwLjAu
YmIKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ25vbWUvanNvbi1nbGliL2pzb24t
Z2xpYl8xLjguMC5iYgoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9qc29uLWdsaWIv
anNvbi1nbGliXzEuMTAuMC5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9qc29uLWdsaWIvanNvbi1n
bGliXzEuMTAuMC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5hOThh
MmE4NjRkCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2pzb24tZ2xpYi9q
c29uLWdsaWJfMS4xMC4wLmJiCkBAIC0wLDAgKzEsNjQ5IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJ
TEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScu
CisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0
aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBp
ZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNz
YWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRh
dGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAt
LS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMSw1MDQgKzEsMTc1IEBACisjIC0JCSAg
R05VIExFU1NFUiBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjIC0JCSAgICAgICBWZXJzaW9uIDIu
MSwgRmVicnVhcnkgMTk5OQorIyArR05VIExFU1NFUiBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisj
ICAKKyMgLSBDb3B5cmlnaHQgKEMpIDE5OTEsIDE5OTkgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
LCBJbmMuCisjIC0gICAgIDU5IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1BICAw
MjExMS0xMzA3ICBVU0EKKyMgLSBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlz
dHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgLSBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1
dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgK1ZlcnNpb24gMi4xLCBGZWJydWFyeSAx
OTk5CisjICAKKyMgLVtUaGlzIGlzIHRoZSBmaXJzdCByZWxlYXNlZCB2ZXJzaW9uIG9mIHRoZSBM
ZXNzZXIgR1BMLiAgSXQgYWxzbyBjb3VudHMKKyMgLSBhcyB0aGUgc3VjY2Vzc29yIG9mIHRoZSBH
TlUgTGlicmFyeSBQdWJsaWMgTGljZW5zZSwgdmVyc2lvbiAyLCBoZW5jZQorIyAtIHRoZSB2ZXJz
aW9uIG51bWJlciAyLjEuXQorIyArQ29weXJpZ2h0IChDKSAxOTkxLCAxOTk5IEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbiwgSW5jLgorIyArNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwg
Qm9zdG9uLCBNQSAgMDIxMTAtMTMwMSAgVVNBCisjICAKKyMgLQkJCSAgICBQcmVhbWJsZQorIyAr
RXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29w
aWVzIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxv
d2VkLgorIyAgCisjIC0gIFRoZSBsaWNlbnNlcyBmb3IgbW9zdCBzb2Z0d2FyZSBhcmUgZGVzaWdu
ZWQgdG8gdGFrZSBhd2F5IHlvdXIKKyMgLWZyZWVkb20gdG8gc2hhcmUgYW5kIGNoYW5nZSBpdC4g
IEJ5IGNvbnRyYXN0LCB0aGUgR05VIEdlbmVyYWwgUHVibGljCisjIC1MaWNlbnNlcyBhcmUgaW50
ZW5kZWQgdG8gZ3VhcmFudGVlIHlvdXIgZnJlZWRvbSB0byBzaGFyZSBhbmQgY2hhbmdlCisjIC1m
cmVlIHNvZnR3YXJlLS10byBtYWtlIHN1cmUgdGhlIHNvZnR3YXJlIGlzIGZyZWUgZm9yIGFsbCBp
dHMgdXNlcnMuCisjICtbVGhpcyBpcyB0aGUgZmlyc3QgcmVsZWFzZWQgdmVyc2lvbiBvZiB0aGUg
TGVzc2VyIEdQTC4gIEl0IGFsc28gY291bnRzIGFzIHRoZSBzdWNjZXNzb3Igb2YgdGhlIEdOVSBM
aWJyYXJ5IFB1YmxpYyBMaWNlbnNlLCB2ZXJzaW9uIDIsIGhlbmNlIHRoZSB2ZXJzaW9uIG51bWJl
ciAyLjEuXQorIyAgCisjIC0gIFRoaXMgbGljZW5zZSwgdGhlIExlc3NlciBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlLCBhcHBsaWVzIHRvIHNvbWUKKyMgLXNwZWNpYWxseSBkZXNpZ25hdGVkIHNvZnR3
YXJlIHBhY2thZ2VzLS10eXBpY2FsbHkgbGlicmFyaWVzLS1vZiB0aGUKKyMgLUZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbiBhbmQgb3RoZXIgYXV0aG9ycyB3aG8gZGVjaWRlIHRvIHVzZSBpdC4gIFlv
dQorIyAtY2FuIHVzZSBpdCB0b28sIGJ1dCB3ZSBzdWdnZXN0IHlvdSBmaXJzdCB0aGluayBjYXJl
ZnVsbHkgYWJvdXQgd2hldGhlcgorIyAtdGhpcyBsaWNlbnNlIG9yIHRoZSBvcmRpbmFyeSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGlzIHRoZSBiZXR0ZXIKKyMgLXN0cmF0ZWd5IHRvIHVzZSBpbiBh
bnkgcGFydGljdWxhciBjYXNlLCBiYXNlZCBvbiB0aGUgZXhwbGFuYXRpb25zIGJlbG93LgorIyAr
UHJlYW1ibGUKKyMgIAorIyAtICBXaGVuIHdlIHNwZWFrIG9mIGZyZWUgc29mdHdhcmUsIHdlIGFy
ZSByZWZlcnJpbmcgdG8gZnJlZWRvbSBvZiB1c2UsCisjIC1ub3QgcHJpY2UuICBPdXIgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZXMgYXJlIGRlc2lnbmVkIHRvIG1ha2Ugc3VyZSB0aGF0CisjIC15b3Ug
aGF2ZSB0aGUgZnJlZWRvbSB0byBkaXN0cmlidXRlIGNvcGllcyBvZiBmcmVlIHNvZnR3YXJlIChh
bmQgY2hhcmdlCisjIC1mb3IgdGhpcyBzZXJ2aWNlIGlmIHlvdSB3aXNoKTsgdGhhdCB5b3UgcmVj
ZWl2ZSBzb3VyY2UgY29kZSBvciBjYW4gZ2V0CisjIC1pdCBpZiB5b3Ugd2FudCBpdDsgdGhhdCB5
b3UgY2FuIGNoYW5nZSB0aGUgc29mdHdhcmUgYW5kIHVzZSBwaWVjZXMgb2YKKyMgLWl0IGluIG5l
dyBmcmVlIHByb2dyYW1zOyBhbmQgdGhhdCB5b3UgYXJlIGluZm9ybWVkIHRoYXQgeW91IGNhbiBk
bworIyAtdGhlc2UgdGhpbmdzLgorIyArVGhlIGxpY2Vuc2VzIGZvciBtb3N0IHNvZnR3YXJlIGFy
ZSBkZXNpZ25lZCB0byB0YWtlIGF3YXkgeW91ciBmcmVlZG9tIHRvIHNoYXJlIGFuZCBjaGFuZ2Ug
aXQuIEJ5IGNvbnRyYXN0LCB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2VzIGFyZSBpbnRl
bmRlZCB0byBndWFyYW50ZWUgeW91ciBmcmVlZG9tIHRvIHNoYXJlIGFuZCBjaGFuZ2UgZnJlZSBz
b2Z0d2FyZS0tdG8gbWFrZSBzdXJlIHRoZSBzb2Z0d2FyZSBpcyBmcmVlIGZvciBhbGwgaXRzIHVz
ZXJzLgorIyAgCisjIC0gIFRvIHByb3RlY3QgeW91ciByaWdodHMsIHdlIG5lZWQgdG8gbWFrZSBy
ZXN0cmljdGlvbnMgdGhhdCBmb3JiaWQKKyMgLWRpc3RyaWJ1dG9ycyB0byBkZW55IHlvdSB0aGVz
ZSByaWdodHMgb3IgdG8gYXNrIHlvdSB0byBzdXJyZW5kZXIgdGhlc2UKKyMgLXJpZ2h0cy4gIFRo
ZXNlIHJlc3RyaWN0aW9ucyB0cmFuc2xhdGUgdG8gY2VydGFpbiByZXNwb25zaWJpbGl0aWVzIGZv
cgorIyAteW91IGlmIHlvdSBkaXN0cmlidXRlIGNvcGllcyBvZiB0aGUgbGlicmFyeSBvciBpZiB5
b3UgbW9kaWZ5IGl0LgorIyArVGhpcyBsaWNlbnNlLCB0aGUgTGVzc2VyIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UsIGFwcGxpZXMgdG8gc29tZSBzcGVjaWFsbHkgZGVzaWduYXRlZCBzb2Z0d2FyZSBw
YWNrYWdlcy0tdHlwaWNhbGx5IGxpYnJhcmllcy0tb2YgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbiBhbmQgb3RoZXIgYXV0aG9ycyB3aG8gZGVjaWRlIHRvIHVzZSBpdC4gWW91IGNhbiB1c2Ug
aXQgdG9vLCBidXQgd2Ugc3VnZ2VzdCB5b3UgZmlyc3QgdGhpbmsgY2FyZWZ1bGx5IGFib3V0IHdo
ZXRoZXIgdGhpcyBsaWNlbnNlIG9yIHRoZSBvcmRpbmFyeSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGlzIHRoZSBiZXR0ZXIgc3RyYXRlZ3kgdG8gdXNlIGluIGFueSBwYXJ0aWN1bGFyIGNhc2UsIGJh
c2VkIG9uIHRoZSBleHBsYW5hdGlvbnMgYmVsb3cuCisjICAKKyMgLSAgRm9yIGV4YW1wbGUsIGlm
IHlvdSBkaXN0cmlidXRlIGNvcGllcyBvZiB0aGUgbGlicmFyeSwgd2hldGhlciBncmF0aXMKKyMg
LW9yIGZvciBhIGZlZSwgeW91IG11c3QgZ2l2ZSB0aGUgcmVjaXBpZW50cyBhbGwgdGhlIHJpZ2h0
cyB0aGF0IHdlIGdhdmUKKyMgLXlvdS4gIFlvdSBtdXN0IG1ha2Ugc3VyZSB0aGF0IHRoZXksIHRv
bywgcmVjZWl2ZSBvciBjYW4gZ2V0IHRoZSBzb3VyY2UKKyMgLWNvZGUuICBJZiB5b3UgbGluayBv
dGhlciBjb2RlIHdpdGggdGhlIGxpYnJhcnksIHlvdSBtdXN0IHByb3ZpZGUKKyMgLWNvbXBsZXRl
IG9iamVjdCBmaWxlcyB0byB0aGUgcmVjaXBpZW50cywgc28gdGhhdCB0aGV5IGNhbiByZWxpbmsg
dGhlbQorIyAtd2l0aCB0aGUgbGlicmFyeSBhZnRlciBtYWtpbmcgY2hhbmdlcyB0byB0aGUgbGli
cmFyeSBhbmQgcmVjb21waWxpbmcKKyMgLWl0LiAgQW5kIHlvdSBtdXN0IHNob3cgdGhlbSB0aGVz
ZSB0ZXJtcyBzbyB0aGV5IGtub3cgdGhlaXIgcmlnaHRzLgorIyArV2hlbiB3ZSBzcGVhayBvZiBm
cmVlIHNvZnR3YXJlLCB3ZSBhcmUgcmVmZXJyaW5nIHRvIGZyZWVkb20gb2YgdXNlLCBub3QgcHJp
Y2UuIE91ciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlcyBhcmUgZGVzaWduZWQgdG8gbWFrZSBzdXJl
IHRoYXQgeW91IGhhdmUgdGhlIGZyZWVkb20gdG8gZGlzdHJpYnV0ZSBjb3BpZXMgb2YgZnJlZSBz
b2Z0d2FyZSAoYW5kIGNoYXJnZSBmb3IgdGhpcyBzZXJ2aWNlIGlmIHlvdSB3aXNoKTsgdGhhdCB5
b3UgcmVjZWl2ZSBzb3VyY2UgY29kZSBvciBjYW4gZ2V0IGl0IGlmIHlvdSB3YW50IGl0OyB0aGF0
IHlvdSBjYW4gY2hhbmdlIHRoZSBzb2Z0d2FyZSBhbmQgdXNlIHBpZWNlcyBvZiBpdCBpbiBuZXcg
ZnJlZSBwcm9ncmFtczsgYW5kIHRoYXQgeW91IGFyZSBpbmZvcm1lZCB0aGF0IHlvdSBjYW4gZG8g
dGhlc2UgdGhpbmdzLgorIyAgCisjIC0gIFdlIHByb3RlY3QgeW91ciByaWdodHMgd2l0aCBhIHR3
by1zdGVwIG1ldGhvZDogKDEpIHdlIGNvcHlyaWdodCB0aGUKKyMgLWxpYnJhcnksIGFuZCAoMikg
d2Ugb2ZmZXIgeW91IHRoaXMgbGljZW5zZSwgd2hpY2ggZ2l2ZXMgeW91IGxlZ2FsCisjIC1wZXJt
aXNzaW9uIHRvIGNvcHksIGRpc3RyaWJ1dGUgYW5kL29yIG1vZGlmeSB0aGUgbGlicmFyeS4KKyMg
K1RvIHByb3RlY3QgeW91ciByaWdodHMsIHdlIG5lZWQgdG8gbWFrZSByZXN0cmljdGlvbnMgdGhh
dCBmb3JiaWQgZGlzdHJpYnV0b3JzIHRvIGRlbnkgeW91IHRoZXNlIHJpZ2h0cyBvciB0byBhc2sg
eW91IHRvIHN1cnJlbmRlciB0aGVzZSByaWdodHMuIFRoZXNlIHJlc3RyaWN0aW9ucyB0cmFuc2xh
dGUgdG8gY2VydGFpbiByZXNwb25zaWJpbGl0aWVzIGZvciB5b3UgaWYgeW91IGRpc3RyaWJ1dGUg
Y29waWVzIG9mIHRoZSBsaWJyYXJ5IG9yIGlmIHlvdSBtb2RpZnkgaXQuCisjICAKKyMgLSAgVG8g
cHJvdGVjdCBlYWNoIGRpc3RyaWJ1dG9yLCB3ZSB3YW50IHRvIG1ha2UgaXQgdmVyeSBjbGVhciB0
aGF0CisjIC10aGVyZSBpcyBubyB3YXJyYW50eSBmb3IgdGhlIGZyZWUgbGlicmFyeS4gIEFsc28s
IGlmIHRoZSBsaWJyYXJ5IGlzCisjIC1tb2RpZmllZCBieSBzb21lb25lIGVsc2UgYW5kIHBhc3Nl
ZCBvbiwgdGhlIHJlY2lwaWVudHMgc2hvdWxkIGtub3cKKyMgLXRoYXQgd2hhdCB0aGV5IGhhdmUg
aXMgbm90IHRoZSBvcmlnaW5hbCB2ZXJzaW9uLCBzbyB0aGF0IHRoZSBvcmlnaW5hbAorIyAtYXV0
aG9yJ3MgcmVwdXRhdGlvbiB3aWxsIG5vdCBiZSBhZmZlY3RlZCBieSBwcm9ibGVtcyB0aGF0IG1p
Z2h0IGJlCisjIC1pbnRyb2R1Y2VkIGJ5IG90aGVycy4KKyMgLQwKKyMgLSAgRmluYWxseSwgc29m
dHdhcmUgcGF0ZW50cyBwb3NlIGEgY29uc3RhbnQgdGhyZWF0IHRvIHRoZSBleGlzdGVuY2Ugb2YK
KyMgLWFueSBmcmVlIHByb2dyYW0uICBXZSB3aXNoIHRvIG1ha2Ugc3VyZSB0aGF0IGEgY29tcGFu
eSBjYW5ub3QKKyMgLWVmZmVjdGl2ZWx5IHJlc3RyaWN0IHRoZSB1c2VycyBvZiBhIGZyZWUgcHJv
Z3JhbSBieSBvYnRhaW5pbmcgYQorIyAtcmVzdHJpY3RpdmUgbGljZW5zZSBmcm9tIGEgcGF0ZW50
IGhvbGRlci4gIFRoZXJlZm9yZSwgd2UgaW5zaXN0IHRoYXQKKyMgLWFueSBwYXRlbnQgbGljZW5z
ZSBvYnRhaW5lZCBmb3IgYSB2ZXJzaW9uIG9mIHRoZSBsaWJyYXJ5IG11c3QgYmUKKyMgLWNvbnNp
c3RlbnQgd2l0aCB0aGUgZnVsbCBmcmVlZG9tIG9mIHVzZSBzcGVjaWZpZWQgaW4gdGhpcyBsaWNl
bnNlLgorIyArRm9yIGV4YW1wbGUsIGlmIHlvdSBkaXN0cmlidXRlIGNvcGllcyBvZiB0aGUgbGli
cmFyeSwgd2hldGhlciBncmF0aXMgb3IgZm9yIGEgZmVlLCB5b3UgbXVzdCBnaXZlIHRoZSByZWNp
cGllbnRzIGFsbCB0aGUgcmlnaHRzIHRoYXQgd2UgZ2F2ZSB5b3UuIFlvdSBtdXN0IG1ha2Ugc3Vy
ZSB0aGF0IHRoZXksIHRvbywgcmVjZWl2ZSBvciBjYW4gZ2V0IHRoZSBzb3VyY2UgY29kZS4gSWYg
eW91IGxpbmsgb3RoZXIgY29kZSB3aXRoIHRoZSBsaWJyYXJ5LCB5b3UgbXVzdCBwcm92aWRlIGNv
bXBsZXRlIG9iamVjdCBmaWxlcyB0byB0aGUgcmVjaXBpZW50cywgc28gdGhhdCB0aGV5IGNhbiBy
ZWxpbmsgdGhlbSB3aXRoIHRoZSBsaWJyYXJ5IGFmdGVyIG1ha2luZyBjaGFuZ2VzIHRvIHRoZSBs
aWJyYXJ5IGFuZCByZWNvbXBpbGluZyBpdC4gQW5kIHlvdSBtdXN0IHNob3cgdGhlbSB0aGVzZSB0
ZXJtcyBzbyB0aGV5IGtub3cgdGhlaXIgcmlnaHRzLgorIyAgCisjIC0gIE1vc3QgR05VIHNvZnR3
YXJlLCBpbmNsdWRpbmcgc29tZSBsaWJyYXJpZXMsIGlzIGNvdmVyZWQgYnkgdGhlCisjIC1vcmRp
bmFyeSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZS4gIFRoaXMgbGljZW5zZSwgdGhlIEdOVSBM
ZXNzZXIKKyMgLUdlbmVyYWwgUHVibGljIExpY2Vuc2UsIGFwcGxpZXMgdG8gY2VydGFpbiBkZXNp
Z25hdGVkIGxpYnJhcmllcywgYW5kCisjIC1pcyBxdWl0ZSBkaWZmZXJlbnQgZnJvbSB0aGUgb3Jk
aW5hcnkgR2VuZXJhbCBQdWJsaWMgTGljZW5zZS4gIFdlIHVzZQorIyAtdGhpcyBsaWNlbnNlIGZv
ciBjZXJ0YWluIGxpYnJhcmllcyBpbiBvcmRlciB0byBwZXJtaXQgbGlua2luZyB0aG9zZQorIyAt
bGlicmFyaWVzIGludG8gbm9uLWZyZWUgcHJvZ3JhbXMuCisjICtXZSBwcm90ZWN0IHlvdXIgcmln
aHRzIHdpdGggYSB0d28tc3RlcCBtZXRob2Q6ICgxKSB3ZSBjb3B5cmlnaHQgdGhlIGxpYnJhcnks
IGFuZCAoMikgd2Ugb2ZmZXIgeW91IHRoaXMgbGljZW5zZSwgd2hpY2ggZ2l2ZXMgeW91IGxlZ2Fs
IHBlcm1pc3Npb24gdG8gY29weSwgZGlzdHJpYnV0ZSBhbmQvb3IgbW9kaWZ5IHRoZSBsaWJyYXJ5
LgorIyAgCisjIC0gIFdoZW4gYSBwcm9ncmFtIGlzIGxpbmtlZCB3aXRoIGEgbGlicmFyeSwgd2hl
dGhlciBzdGF0aWNhbGx5IG9yIHVzaW5nCisjIC1hIHNoYXJlZCBsaWJyYXJ5LCB0aGUgY29tYmlu
YXRpb24gb2YgdGhlIHR3byBpcyBsZWdhbGx5IHNwZWFraW5nIGEKKyMgLWNvbWJpbmVkIHdvcmss
IGEgZGVyaXZhdGl2ZSBvZiB0aGUgb3JpZ2luYWwgbGlicmFyeS4gIFRoZSBvcmRpbmFyeQorIyAt
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSB0aGVyZWZvcmUgcGVybWl0cyBzdWNoIGxpbmtpbmcgb25s
eSBpZiB0aGUKKyMgLWVudGlyZSBjb21iaW5hdGlvbiBmaXRzIGl0cyBjcml0ZXJpYSBvZiBmcmVl
ZG9tLiAgVGhlIExlc3NlciBHZW5lcmFsCisjIC1QdWJsaWMgTGljZW5zZSBwZXJtaXRzIG1vcmUg
bGF4IGNyaXRlcmlhIGZvciBsaW5raW5nIG90aGVyIGNvZGUgd2l0aAorIyAtdGhlIGxpYnJhcnku
CisjICtUbyBwcm90ZWN0IGVhY2ggZGlzdHJpYnV0b3IsIHdlIHdhbnQgdG8gbWFrZSBpdCB2ZXJ5
IGNsZWFyIHRoYXQgdGhlcmUgaXMgbm8gd2FycmFudHkgZm9yIHRoZSBmcmVlIGxpYnJhcnkuIEFs
c28sIGlmIHRoZSBsaWJyYXJ5IGlzIG1vZGlmaWVkIGJ5IHNvbWVvbmUgZWxzZSBhbmQgcGFzc2Vk
IG9uLCB0aGUgcmVjaXBpZW50cyBzaG91bGQga25vdyB0aGF0IHdoYXQgdGhleSBoYXZlIGlzIG5v
dCB0aGUgb3JpZ2luYWwgdmVyc2lvbiwgc28gdGhhdCB0aGUgb3JpZ2luYWwgYXV0aG9yJ3MgcmVw
dXRhdGlvbiB3aWxsIG5vdCBiZSBhZmZlY3RlZCBieSBwcm9ibGVtcyB0aGF0IG1pZ2h0IGJlIGlu
dHJvZHVjZWQgYnkgb3RoZXJzLgorIyAgCisjIC0gIFdlIGNhbGwgdGhpcyBsaWNlbnNlIHRoZSAi
TGVzc2VyIiBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGJlY2F1c2UgaXQKKyMgLWRvZXMgTGVzcyB0
byBwcm90ZWN0IHRoZSB1c2VyJ3MgZnJlZWRvbSB0aGFuIHRoZSBvcmRpbmFyeSBHZW5lcmFsCisj
IC1QdWJsaWMgTGljZW5zZS4gIEl0IGFsc28gcHJvdmlkZXMgb3RoZXIgZnJlZSBzb2Z0d2FyZSBk
ZXZlbG9wZXJzIExlc3MKKyMgLW9mIGFuIGFkdmFudGFnZSBvdmVyIGNvbXBldGluZyBub24tZnJl
ZSBwcm9ncmFtcy4gIFRoZXNlIGRpc2FkdmFudGFnZXMKKyMgLWFyZSB0aGUgcmVhc29uIHdlIHVz
ZSB0aGUgb3JkaW5hcnkgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbWFueQorIyAtbGlicmFy
aWVzLiAgSG93ZXZlciwgdGhlIExlc3NlciBsaWNlbnNlIHByb3ZpZGVzIGFkdmFudGFnZXMgaW4g
Y2VydGFpbgorIyAtc3BlY2lhbCBjaXJjdW1zdGFuY2VzLgorIyArRmluYWxseSwgc29mdHdhcmUg
cGF0ZW50cyBwb3NlIGEgY29uc3RhbnQgdGhyZWF0IHRvIHRoZSBleGlzdGVuY2Ugb2YgYW55IGZy
ZWUgcHJvZ3JhbS4gV2Ugd2lzaCB0byBtYWtlIHN1cmUgdGhhdCBhIGNvbXBhbnkgY2Fubm90IGVm
ZmVjdGl2ZWx5IHJlc3RyaWN0IHRoZSB1c2VycyBvZiBhIGZyZWUgcHJvZ3JhbSBieSBvYnRhaW5p
bmcgYSByZXN0cmljdGl2ZSBsaWNlbnNlIGZyb20gYSBwYXRlbnQgaG9sZGVyLiBUaGVyZWZvcmUs
IHdlIGluc2lzdCB0aGF0IGFueSBwYXRlbnQgbGljZW5zZSBvYnRhaW5lZCBmb3IgYSB2ZXJzaW9u
IG9mIHRoZSBsaWJyYXJ5IG11c3QgYmUgY29uc2lzdGVudCB3aXRoIHRoZSBmdWxsIGZyZWVkb20g
b2YgdXNlIHNwZWNpZmllZCBpbiB0aGlzIGxpY2Vuc2UuCisjICAKKyMgLSAgRm9yIGV4YW1wbGUs
IG9uIHJhcmUgb2NjYXNpb25zLCB0aGVyZSBtYXkgYmUgYSBzcGVjaWFsIG5lZWQgdG8KKyMgLWVu
Y291cmFnZSB0aGUgd2lkZXN0IHBvc3NpYmxlIHVzZSBvZiBhIGNlcnRhaW4gbGlicmFyeSwgc28g
dGhhdCBpdCBiZWNvbWVzCisjIC1hIGRlLWZhY3RvIHN0YW5kYXJkLiAgVG8gYWNoaWV2ZSB0aGlz
LCBub24tZnJlZSBwcm9ncmFtcyBtdXN0IGJlCisjIC1hbGxvd2VkIHRvIHVzZSB0aGUgbGlicmFy
eS4gIEEgbW9yZSBmcmVxdWVudCBjYXNlIGlzIHRoYXQgYSBmcmVlCisjIC1saWJyYXJ5IGRvZXMg
dGhlIHNhbWUgam9iIGFzIHdpZGVseSB1c2VkIG5vbi1mcmVlIGxpYnJhcmllcy4gIEluIHRoaXMK
KyMgLWNhc2UsIHRoZXJlIGlzIGxpdHRsZSB0byBnYWluIGJ5IGxpbWl0aW5nIHRoZSBmcmVlIGxp
YnJhcnkgdG8gZnJlZQorIyAtc29mdHdhcmUgb25seSwgc28gd2UgdXNlIHRoZSBMZXNzZXIgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZS4KKyMgK01vc3QgR05VIHNvZnR3YXJlLCBpbmNsdWRpbmcgc29t
ZSBsaWJyYXJpZXMsIGlzIGNvdmVyZWQgYnkgdGhlIG9yZGluYXJ5IEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlLiBUaGlzIGxpY2Vuc2UsIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UsIGFwcGxpZXMgdG8gY2VydGFpbiBkZXNpZ25hdGVkIGxpYnJhcmllcywgYW5kIGlzIHF1
aXRlIGRpZmZlcmVudCBmcm9tIHRoZSBvcmRpbmFyeSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLiBX
ZSB1c2UgdGhpcyBsaWNlbnNlIGZvciBjZXJ0YWluIGxpYnJhcmllcyBpbiBvcmRlciB0byBwZXJt
aXQgbGlua2luZyB0aG9zZSBsaWJyYXJpZXMgaW50byBub24tZnJlZSBwcm9ncmFtcy4KKyMgIAor
IyAtICBJbiBvdGhlciBjYXNlcywgcGVybWlzc2lvbiB0byB1c2UgYSBwYXJ0aWN1bGFyIGxpYnJh
cnkgaW4gbm9uLWZyZWUKKyMgLXByb2dyYW1zIGVuYWJsZXMgYSBncmVhdGVyIG51bWJlciBvZiBw
ZW9wbGUgdG8gdXNlIGEgbGFyZ2UgYm9keSBvZgorIyAtZnJlZSBzb2Z0d2FyZS4gIEZvciBleGFt
cGxlLCBwZXJtaXNzaW9uIHRvIHVzZSB0aGUgR05VIEMgTGlicmFyeSBpbgorIyAtbm9uLWZyZWUg
cHJvZ3JhbXMgZW5hYmxlcyBtYW55IG1vcmUgcGVvcGxlIHRvIHVzZSB0aGUgd2hvbGUgR05VCisj
IC1vcGVyYXRpbmcgc3lzdGVtLCBhcyB3ZWxsIGFzIGl0cyB2YXJpYW50LCB0aGUgR05VL0xpbnV4
IG9wZXJhdGluZworIyAtc3lzdGVtLgorIyArV2hlbiBhIHByb2dyYW0gaXMgbGlua2VkIHdpdGgg
YSBsaWJyYXJ5LCB3aGV0aGVyIHN0YXRpY2FsbHkgb3IgdXNpbmcgYSBzaGFyZWQgbGlicmFyeSwg
dGhlIGNvbWJpbmF0aW9uIG9mIHRoZSB0d28gaXMgbGVnYWxseSBzcGVha2luZyBhIGNvbWJpbmVk
IHdvcmssIGEgZGVyaXZhdGl2ZSBvZiB0aGUgb3JpZ2luYWwgbGlicmFyeS4gVGhlIG9yZGluYXJ5
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgdGhlcmVmb3JlIHBlcm1pdHMgc3VjaCBsaW5raW5nIG9u
bHkgaWYgdGhlIGVudGlyZSBjb21iaW5hdGlvbiBmaXRzIGl0cyBjcml0ZXJpYSBvZiBmcmVlZG9t
LiBUaGUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgcGVybWl0cyBtb3JlIGxheCBjcml0
ZXJpYSBmb3IgbGlua2luZyBvdGhlciBjb2RlIHdpdGggdGhlIGxpYnJhcnkuCisjICAKKyMgLSAg
QWx0aG91Z2ggdGhlIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGlzIExlc3MgcHJvdGVj
dGl2ZSBvZiB0aGUKKyMgLXVzZXJzJyBmcmVlZG9tLCBpdCBkb2VzIGVuc3VyZSB0aGF0IHRoZSB1
c2VyIG9mIGEgcHJvZ3JhbSB0aGF0IGlzCisjIC1saW5rZWQgd2l0aCB0aGUgTGlicmFyeSBoYXMg
dGhlIGZyZWVkb20gYW5kIHRoZSB3aGVyZXdpdGhhbCB0byBydW4KKyMgLXRoYXQgcHJvZ3JhbSB1
c2luZyBhIG1vZGlmaWVkIHZlcnNpb24gb2YgdGhlIExpYnJhcnkuCisjICtXZSBjYWxsIHRoaXMg
bGljZW5zZSB0aGUgIkxlc3NlciIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBiZWNhdXNlIGl0IGRv
ZXMgTGVzcyB0byBwcm90ZWN0IHRoZSB1c2VyJ3MgZnJlZWRvbSB0aGFuIHRoZSBvcmRpbmFyeSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlLiBJdCBhbHNvIHByb3ZpZGVzIG90aGVyIGZyZWUgc29mdHdh
cmUgZGV2ZWxvcGVycyBMZXNzIG9mIGFuIGFkdmFudGFnZSBvdmVyIGNvbXBldGluZyBub24tZnJl
ZSBwcm9ncmFtcy4gVGhlc2UgZGlzYWR2YW50YWdlcyBhcmUgdGhlIHJlYXNvbiB3ZSB1c2UgdGhl
IG9yZGluYXJ5IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1hbnkgbGlicmFyaWVzLiBIb3dl
dmVyLCB0aGUgTGVzc2VyIGxpY2Vuc2UgcHJvdmlkZXMgYWR2YW50YWdlcyBpbiBjZXJ0YWluIHNw
ZWNpYWwgY2lyY3Vtc3RhbmNlcy4KKyMgIAorIyAtICBUaGUgcHJlY2lzZSB0ZXJtcyBhbmQgY29u
ZGl0aW9ucyBmb3IgY29weWluZywgZGlzdHJpYnV0aW9uIGFuZAorIyAtbW9kaWZpY2F0aW9uIGZv
bGxvdy4gIFBheSBjbG9zZSBhdHRlbnRpb24gdG8gdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBhCisj
IC0id29yayBiYXNlZCBvbiB0aGUgbGlicmFyeSIgYW5kIGEgIndvcmsgdGhhdCB1c2VzIHRoZSBs
aWJyYXJ5Ii4gIFRoZQorIyAtZm9ybWVyIGNvbnRhaW5zIGNvZGUgZGVyaXZlZCBmcm9tIHRoZSBs
aWJyYXJ5LCB3aGVyZWFzIHRoZSBsYXR0ZXIgbXVzdAorIyAtYmUgY29tYmluZWQgd2l0aCB0aGUg
bGlicmFyeSBpbiBvcmRlciB0byBydW4uCisjIC0MCisjIC0JCSAgR05VIExFU1NFUiBHRU5FUkFM
IFBVQkxJQyBMSUNFTlNFCisjIC0gICBURVJNUyBBTkQgQ09ORElUSU9OUyBGT1IgQ09QWUlORywg
RElTVFJJQlVUSU9OIEFORCBNT0RJRklDQVRJT04KKyMgK0ZvciBleGFtcGxlLCBvbiByYXJlIG9j
Y2FzaW9ucywgdGhlcmUgbWF5IGJlIGEgc3BlY2lhbCBuZWVkIHRvIGVuY291cmFnZSB0aGUgd2lk
ZXN0IHBvc3NpYmxlIHVzZSBvZiBhIGNlcnRhaW4gbGlicmFyeSwgc28gdGhhdCBpdCBiZWNvbWVz
IGEgZGUtZmFjdG8gc3RhbmRhcmQuIFRvIGFjaGlldmUgdGhpcywgbm9uLWZyZWUgcHJvZ3JhbXMg
bXVzdCBiZSBhbGxvd2VkIHRvIHVzZSB0aGUgbGlicmFyeS4gQSBtb3JlIGZyZXF1ZW50IGNhc2Ug
aXMgdGhhdCBhIGZyZWUgbGlicmFyeSBkb2VzIHRoZSBzYW1lIGpvYiBhcyB3aWRlbHkgdXNlZCBu
b24tZnJlZSBsaWJyYXJpZXMuIEluIHRoaXMgY2FzZSwgdGhlcmUgaXMgbGl0dGxlIHRvIGdhaW4g
YnkgbGltaXRpbmcgdGhlIGZyZWUgbGlicmFyeSB0byBmcmVlIHNvZnR3YXJlIG9ubHksIHNvIHdl
IHVzZSB0aGUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuCisjICAKKyMgLSAgMC4gVGhp
cyBMaWNlbnNlIEFncmVlbWVudCBhcHBsaWVzIHRvIGFueSBzb2Z0d2FyZSBsaWJyYXJ5IG9yIG90
aGVyCisjIC1wcm9ncmFtIHdoaWNoIGNvbnRhaW5zIGEgbm90aWNlIHBsYWNlZCBieSB0aGUgY29w
eXJpZ2h0IGhvbGRlciBvcgorIyAtb3RoZXIgYXV0aG9yaXplZCBwYXJ0eSBzYXlpbmcgaXQgbWF5
IGJlIGRpc3RyaWJ1dGVkIHVuZGVyIHRoZSB0ZXJtcyBvZgorIyAtdGhpcyBMZXNzZXIgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSAoYWxzbyBjYWxsZWQgInRoaXMgTGljZW5zZSIpLgorIyAtRWFjaCBs
aWNlbnNlZSBpcyBhZGRyZXNzZWQgYXMgInlvdSIuCisjICtJbiBvdGhlciBjYXNlcywgcGVybWlz
c2lvbiB0byB1c2UgYSBwYXJ0aWN1bGFyIGxpYnJhcnkgaW4gbm9uLWZyZWUgcHJvZ3JhbXMgZW5h
YmxlcyBhIGdyZWF0ZXIgbnVtYmVyIG9mIHBlb3BsZSB0byB1c2UgYSBsYXJnZSBib2R5IG9mIGZy
ZWUgc29mdHdhcmUuIEZvciBleGFtcGxlLCBwZXJtaXNzaW9uIHRvIHVzZSB0aGUgR05VIEMgTGli
cmFyeSBpbiBub24tZnJlZSBwcm9ncmFtcyBlbmFibGVzIG1hbnkgbW9yZSBwZW9wbGUgdG8gdXNl
IHRoZSB3aG9sZSBHTlUgb3BlcmF0aW5nIHN5c3RlbSwgYXMgd2VsbCBhcyBpdHMgdmFyaWFudCwg
dGhlIEdOVS9MaW51eCBvcGVyYXRpbmcgc3lzdGVtLgorIyAgCisjIC0gIEEgImxpYnJhcnkiIG1l
YW5zIGEgY29sbGVjdGlvbiBvZiBzb2Z0d2FyZSBmdW5jdGlvbnMgYW5kL29yIGRhdGEKKyMgLXBy
ZXBhcmVkIHNvIGFzIHRvIGJlIGNvbnZlbmllbnRseSBsaW5rZWQgd2l0aCBhcHBsaWNhdGlvbiBw
cm9ncmFtcworIyAtKHdoaWNoIHVzZSBzb21lIG9mIHRob3NlIGZ1bmN0aW9ucyBhbmQgZGF0YSkg
dG8gZm9ybSBleGVjdXRhYmxlcy4KKyMgK0FsdGhvdWdoIHRoZSBMZXNzZXIgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBpcyBMZXNzIHByb3RlY3RpdmUgb2YgdGhlIHVzZXJzJyBmcmVlZG9tLCBpdCBk
b2VzIGVuc3VyZSB0aGF0IHRoZSB1c2VyIG9mIGEgcHJvZ3JhbSB0aGF0IGlzIGxpbmtlZCB3aXRo
IHRoZSBMaWJyYXJ5IGhhcyB0aGUgZnJlZWRvbSBhbmQgdGhlIHdoZXJld2l0aGFsIHRvIHJ1biB0
aGF0IHByb2dyYW0gdXNpbmcgYSBtb2RpZmllZCB2ZXJzaW9uIG9mIHRoZSBMaWJyYXJ5LgorIyAg
CisjIC0gIFRoZSAiTGlicmFyeSIsIGJlbG93LCByZWZlcnMgdG8gYW55IHN1Y2ggc29mdHdhcmUg
bGlicmFyeSBvciB3b3JrCisjIC13aGljaCBoYXMgYmVlbiBkaXN0cmlidXRlZCB1bmRlciB0aGVz
ZSB0ZXJtcy4gIEEgIndvcmsgYmFzZWQgb24gdGhlCisjIC1MaWJyYXJ5IiBtZWFucyBlaXRoZXIg
dGhlIExpYnJhcnkgb3IgYW55IGRlcml2YXRpdmUgd29yayB1bmRlcgorIyAtY29weXJpZ2h0IGxh
dzogdGhhdCBpcyB0byBzYXksIGEgd29yayBjb250YWluaW5nIHRoZSBMaWJyYXJ5IG9yIGEKKyMg
LXBvcnRpb24gb2YgaXQsIGVpdGhlciB2ZXJiYXRpbSBvciB3aXRoIG1vZGlmaWNhdGlvbnMgYW5k
L29yIHRyYW5zbGF0ZWQKKyMgLXN0cmFpZ2h0Zm9yd2FyZGx5IGludG8gYW5vdGhlciBsYW5ndWFn
ZS4gIChIZXJlaW5hZnRlciwgdHJhbnNsYXRpb24gaXMKKyMgLWluY2x1ZGVkIHdpdGhvdXQgbGlt
aXRhdGlvbiBpbiB0aGUgdGVybSAibW9kaWZpY2F0aW9uIi4pCisjICtUaGUgcHJlY2lzZSB0ZXJt
cyBhbmQgY29uZGl0aW9ucyBmb3IgY29weWluZywgZGlzdHJpYnV0aW9uIGFuZCBtb2RpZmljYXRp
b24gZm9sbG93LiBQYXkgY2xvc2UgYXR0ZW50aW9uIHRvIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
YSAid29yayBiYXNlZCBvbiB0aGUgbGlicmFyeSIgYW5kIGEgIndvcmsgdGhhdCB1c2VzIHRoZSBs
aWJyYXJ5Ii4gVGhlIGZvcm1lciBjb250YWlucyBjb2RlIGRlcml2ZWQgZnJvbSB0aGUgbGlicmFy
eSwgd2hlcmVhcyB0aGUgbGF0dGVyIG11c3QgYmUgY29tYmluZWQgd2l0aCB0aGUgbGlicmFyeSBp
biBvcmRlciB0byBydW4uCisjICAKKyMgLSAgIlNvdXJjZSBjb2RlIiBmb3IgYSB3b3JrIG1lYW5z
IHRoZSBwcmVmZXJyZWQgZm9ybSBvZiB0aGUgd29yayBmb3IKKyMgLW1ha2luZyBtb2RpZmljYXRp
b25zIHRvIGl0LiAgRm9yIGEgbGlicmFyeSwgY29tcGxldGUgc291cmNlIGNvZGUgbWVhbnMKKyMg
LWFsbCB0aGUgc291cmNlIGNvZGUgZm9yIGFsbCBtb2R1bGVzIGl0IGNvbnRhaW5zLCBwbHVzIGFu
eSBhc3NvY2lhdGVkCisjIC1pbnRlcmZhY2UgZGVmaW5pdGlvbiBmaWxlcywgcGx1cyB0aGUgc2Ny
aXB0cyB1c2VkIHRvIGNvbnRyb2wgY29tcGlsYXRpb24KKyMgLWFuZCBpbnN0YWxsYXRpb24gb2Yg
dGhlIGxpYnJhcnkuCisjICtURVJNUyBBTkQgQ09ORElUSU9OUyBGT1IgQ09QWUlORywgRElTVFJJ
QlVUSU9OIEFORCBNT0RJRklDQVRJT04KKyMgIAorIyAtICBBY3Rpdml0aWVzIG90aGVyIHRoYW4g
Y29weWluZywgZGlzdHJpYnV0aW9uIGFuZCBtb2RpZmljYXRpb24gYXJlIG5vdAorIyAtY292ZXJl
ZCBieSB0aGlzIExpY2Vuc2U7IHRoZXkgYXJlIG91dHNpZGUgaXRzIHNjb3BlLiAgVGhlIGFjdCBv
ZgorIyAtcnVubmluZyBhIHByb2dyYW0gdXNpbmcgdGhlIExpYnJhcnkgaXMgbm90IHJlc3RyaWN0
ZWQsIGFuZCBvdXRwdXQgZnJvbQorIyAtc3VjaCBhIHByb2dyYW0gaXMgY292ZXJlZCBvbmx5IGlm
IGl0cyBjb250ZW50cyBjb25zdGl0dXRlIGEgd29yayBiYXNlZAorIyAtb24gdGhlIExpYnJhcnkg
KGluZGVwZW5kZW50IG9mIHRoZSB1c2Ugb2YgdGhlIExpYnJhcnkgaW4gYSB0b29sIGZvcgorIyAt
d3JpdGluZyBpdCkuICBXaGV0aGVyIHRoYXQgaXMgdHJ1ZSBkZXBlbmRzIG9uIHdoYXQgdGhlIExp
YnJhcnkgZG9lcworIyAtYW5kIHdoYXQgdGhlIHByb2dyYW0gdGhhdCB1c2VzIHRoZSBMaWJyYXJ5
IGRvZXMuCisjIC0gIAorIyAtICAxLiBZb3UgbWF5IGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0
aW0gY29waWVzIG9mIHRoZSBMaWJyYXJ5J3MKKyMgLWNvbXBsZXRlIHNvdXJjZSBjb2RlIGFzIHlv
dSByZWNlaXZlIGl0LCBpbiBhbnkgbWVkaXVtLCBwcm92aWRlZCB0aGF0CisjIC15b3UgY29uc3Bp
Y3VvdXNseSBhbmQgYXBwcm9wcmlhdGVseSBwdWJsaXNoIG9uIGVhY2ggY29weSBhbgorIyAtYXBw
cm9wcmlhdGUgY29weXJpZ2h0IG5vdGljZSBhbmQgZGlzY2xhaW1lciBvZiB3YXJyYW50eTsga2Vl
cCBpbnRhY3QKKyMgLWFsbCB0aGUgbm90aWNlcyB0aGF0IHJlZmVyIHRvIHRoaXMgTGljZW5zZSBh
bmQgdG8gdGhlIGFic2VuY2Ugb2YgYW55CisjIC13YXJyYW50eTsgYW5kIGRpc3RyaWJ1dGUgYSBj
b3B5IG9mIHRoaXMgTGljZW5zZSBhbG9uZyB3aXRoIHRoZQorIyAtTGlicmFyeS4KKyMgKzAuIFRo
aXMgTGljZW5zZSBBZ3JlZW1lbnQgYXBwbGllcyB0byBhbnkgc29mdHdhcmUgbGlicmFyeSBvciBv
dGhlciBwcm9ncmFtIHdoaWNoIGNvbnRhaW5zIGEgbm90aWNlIHBsYWNlZCBieSB0aGUgY29weXJp
Z2h0IGhvbGRlciBvciBvdGhlciBhdXRob3JpemVkIHBhcnR5IHNheWluZyBpdCBtYXkgYmUgZGlz
dHJpYnV0ZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoaXMgTGVzc2VyIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgKGFsc28gY2FsbGVkICJ0aGlzIExpY2Vuc2UiKS4gRWFjaCBsaWNlbnNlZSBpcyBhZGRy
ZXNzZWQgYXMgInlvdSIuCisjICAKKyMgLSAgWW91IG1heSBjaGFyZ2UgYSBmZWUgZm9yIHRoZSBw
aHlzaWNhbCBhY3Qgb2YgdHJhbnNmZXJyaW5nIGEgY29weSwKKyMgLWFuZCB5b3UgbWF5IGF0IHlv
dXIgb3B0aW9uIG9mZmVyIHdhcnJhbnR5IHByb3RlY3Rpb24gaW4gZXhjaGFuZ2UgZm9yIGEKKyMg
LWZlZS4KKyMgLQwKKyMgLSAgMi4gWW91IG1heSBtb2RpZnkgeW91ciBjb3B5IG9yIGNvcGllcyBv
ZiB0aGUgTGlicmFyeSBvciBhbnkgcG9ydGlvbgorIyAtb2YgaXQsIHRodXMgZm9ybWluZyBhIHdv
cmsgYmFzZWQgb24gdGhlIExpYnJhcnksIGFuZCBjb3B5IGFuZAorIyAtZGlzdHJpYnV0ZSBzdWNo
IG1vZGlmaWNhdGlvbnMgb3Igd29yayB1bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbiAxCisjIC1h
Ym92ZSwgcHJvdmlkZWQgdGhhdCB5b3UgYWxzbyBtZWV0IGFsbCBvZiB0aGVzZSBjb25kaXRpb25z
OgorIyArQSAibGlicmFyeSIgbWVhbnMgYSBjb2xsZWN0aW9uIG9mIHNvZnR3YXJlIGZ1bmN0aW9u
cyBhbmQvb3IgZGF0YSBwcmVwYXJlZCBzbyBhcyB0byBiZSBjb252ZW5pZW50bHkgbGlua2VkIHdp
dGggYXBwbGljYXRpb24gcHJvZ3JhbXMgKHdoaWNoIHVzZSBzb21lIG9mIHRob3NlIGZ1bmN0aW9u
cyBhbmQgZGF0YSkgdG8gZm9ybSBleGVjdXRhYmxlcy4KKyMgIAorIyAtICAgIGEpIFRoZSBtb2Rp
ZmllZCB3b3JrIG11c3QgaXRzZWxmIGJlIGEgc29mdHdhcmUgbGlicmFyeS4KKyMgK1RoZSAiTGli
cmFyeSIsIGJlbG93LCByZWZlcnMgdG8gYW55IHN1Y2ggc29mdHdhcmUgbGlicmFyeSBvciB3b3Jr
IHdoaWNoIGhhcyBiZWVuIGRpc3RyaWJ1dGVkIHVuZGVyIHRoZXNlIHRlcm1zLiBBICJ3b3JrIGJh
c2VkIG9uIHRoZSBMaWJyYXJ5IiBtZWFucyBlaXRoZXIgdGhlIExpYnJhcnkgb3IgYW55IGRlcml2
YXRpdmUgd29yayB1bmRlciBjb3B5cmlnaHQgbGF3OiB0aGF0IGlzIHRvIHNheSwgYSB3b3JrIGNv
bnRhaW5pbmcgdGhlIExpYnJhcnkgb3IgYSBwb3J0aW9uIG9mIGl0LCBlaXRoZXIgdmVyYmF0aW0g
b3Igd2l0aCBtb2RpZmljYXRpb25zIGFuZC9vciB0cmFuc2xhdGVkIHN0cmFpZ2h0Zm9yd2FyZGx5
IGludG8gYW5vdGhlciBsYW5ndWFnZS4gKEhlcmVpbmFmdGVyLCB0cmFuc2xhdGlvbiBpcyBpbmNs
dWRlZCB3aXRob3V0IGxpbWl0YXRpb24gaW4gdGhlIHRlcm0gIm1vZGlmaWNhdGlvbiIuKQorIyAg
CisjIC0gICAgYikgWW91IG11c3QgY2F1c2UgdGhlIGZpbGVzIG1vZGlmaWVkIHRvIGNhcnJ5IHBy
b21pbmVudCBub3RpY2VzCisjIC0gICAgc3RhdGluZyB0aGF0IHlvdSBjaGFuZ2VkIHRoZSBmaWxl
cyBhbmQgdGhlIGRhdGUgb2YgYW55IGNoYW5nZS4KKyMgKyJTb3VyY2UgY29kZSIgZm9yIGEgd29y
ayBtZWFucyB0aGUgcHJlZmVycmVkIGZvcm0gb2YgdGhlIHdvcmsgZm9yIG1ha2luZyBtb2RpZmlj
YXRpb25zIHRvIGl0LiBGb3IgYSBsaWJyYXJ5LCBjb21wbGV0ZSBzb3VyY2UgY29kZSBtZWFucyBh
bGwgdGhlIHNvdXJjZSBjb2RlIGZvciBhbGwgbW9kdWxlcyBpdCBjb250YWlucywgcGx1cyBhbnkg
YXNzb2NpYXRlZCBpbnRlcmZhY2UgZGVmaW5pdGlvbiBmaWxlcywgcGx1cyB0aGUgc2NyaXB0cyB1
c2VkIHRvIGNvbnRyb2wgY29tcGlsYXRpb24gYW5kIGluc3RhbGxhdGlvbiBvZiB0aGUgbGlicmFy
eS4KKyMgIAorIyAtICAgIGMpIFlvdSBtdXN0IGNhdXNlIHRoZSB3aG9sZSBvZiB0aGUgd29yayB0
byBiZSBsaWNlbnNlZCBhdCBubworIyAtICAgIGNoYXJnZSB0byBhbGwgdGhpcmQgcGFydGllcyB1
bmRlciB0aGUgdGVybXMgb2YgdGhpcyBMaWNlbnNlLgorIyArQWN0aXZpdGllcyBvdGhlciB0aGFu
IGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBhbmQgbW9kaWZpY2F0aW9uIGFyZSBub3QgY292ZXJlZCBi
eSB0aGlzIExpY2Vuc2U7IHRoZXkgYXJlIG91dHNpZGUgaXRzIHNjb3BlLiBUaGUgYWN0IG9mIHJ1
bm5pbmcgYSBwcm9ncmFtIHVzaW5nIHRoZSBMaWJyYXJ5IGlzIG5vdCByZXN0cmljdGVkLCBhbmQg
b3V0cHV0IGZyb20gc3VjaCBhIHByb2dyYW0gaXMgY292ZXJlZCBvbmx5IGlmIGl0cyBjb250ZW50
cyBjb25zdGl0dXRlIGEgd29yayBiYXNlZCBvbiB0aGUgTGlicmFyeSAoaW5kZXBlbmRlbnQgb2Yg
dGhlIHVzZSBvZiB0aGUgTGlicmFyeSBpbiBhIHRvb2wgZm9yIHdyaXRpbmcgaXQpLiBXaGV0aGVy
IHRoYXQgaXMgdHJ1ZSBkZXBlbmRzIG9uIHdoYXQgdGhlIExpYnJhcnkgZG9lcyBhbmQgd2hhdCB0
aGUgcHJvZ3JhbSB0aGF0IHVzZXMgdGhlIExpYnJhcnkgZG9lcy4KKyMgIAorIyAtICAgIGQpIElm
IGEgZmFjaWxpdHkgaW4gdGhlIG1vZGlmaWVkIExpYnJhcnkgcmVmZXJzIHRvIGEgZnVuY3Rpb24g
b3IgYQorIyAtICAgIHRhYmxlIG9mIGRhdGEgdG8gYmUgc3VwcGxpZWQgYnkgYW4gYXBwbGljYXRp
b24gcHJvZ3JhbSB0aGF0IHVzZXMKKyMgLSAgICB0aGUgZmFjaWxpdHksIG90aGVyIHRoYW4gYXMg
YW4gYXJndW1lbnQgcGFzc2VkIHdoZW4gdGhlIGZhY2lsaXR5CisjIC0gICAgaXMgaW52b2tlZCwg
dGhlbiB5b3UgbXVzdCBtYWtlIGEgZ29vZCBmYWl0aCBlZmZvcnQgdG8gZW5zdXJlIHRoYXQsCisj
IC0gICAgaW4gdGhlIGV2ZW50IGFuIGFwcGxpY2F0aW9uIGRvZXMgbm90IHN1cHBseSBzdWNoIGZ1
bmN0aW9uIG9yCisjIC0gICAgdGFibGUsIHRoZSBmYWNpbGl0eSBzdGlsbCBvcGVyYXRlcywgYW5k
IHBlcmZvcm1zIHdoYXRldmVyIHBhcnQgb2YKKyMgLSAgICBpdHMgcHVycG9zZSByZW1haW5zIG1l
YW5pbmdmdWwuCisjICsxLiBZb3UgbWF5IGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29w
aWVzIG9mIHRoZSBMaWJyYXJ5J3MgY29tcGxldGUgc291cmNlIGNvZGUgYXMgeW91IHJlY2VpdmUg
aXQsIGluIGFueSBtZWRpdW0sIHByb3ZpZGVkIHRoYXQgeW91IGNvbnNwaWN1b3VzbHkgYW5kIGFw
cHJvcHJpYXRlbHkgcHVibGlzaCBvbiBlYWNoIGNvcHkgYW4gYXBwcm9wcmlhdGUgY29weXJpZ2h0
IG5vdGljZSBhbmQgZGlzY2xhaW1lciBvZiB3YXJyYW50eTsga2VlcCBpbnRhY3QgYWxsIHRoZSBu
b3RpY2VzIHRoYXQgcmVmZXIgdG8gdGhpcyBMaWNlbnNlIGFuZCB0byB0aGUgYWJzZW5jZSBvZiBh
bnkgd2FycmFudHk7IGFuZCBkaXN0cmlidXRlIGEgY29weSBvZiB0aGlzIExpY2Vuc2UgYWxvbmcg
d2l0aCB0aGUgTGlicmFyeS4KKyMgIAorIyAtICAgIChGb3IgZXhhbXBsZSwgYSBmdW5jdGlvbiBp
biBhIGxpYnJhcnkgdG8gY29tcHV0ZSBzcXVhcmUgcm9vdHMgaGFzCisjIC0gICAgYSBwdXJwb3Nl
IHRoYXQgaXMgZW50aXJlbHkgd2VsbC1kZWZpbmVkIGluZGVwZW5kZW50IG9mIHRoZQorIyAtICAg
IGFwcGxpY2F0aW9uLiAgVGhlcmVmb3JlLCBTdWJzZWN0aW9uIDJkIHJlcXVpcmVzIHRoYXQgYW55
CisjIC0gICAgYXBwbGljYXRpb24tc3VwcGxpZWQgZnVuY3Rpb24gb3IgdGFibGUgdXNlZCBieSB0
aGlzIGZ1bmN0aW9uIG11c3QKKyMgLSAgICBiZSBvcHRpb25hbDogaWYgdGhlIGFwcGxpY2F0aW9u
IGRvZXMgbm90IHN1cHBseSBpdCwgdGhlIHNxdWFyZQorIyAtICAgIHJvb3QgZnVuY3Rpb24gbXVz
dCBzdGlsbCBjb21wdXRlIHNxdWFyZSByb290cy4pCisjICtZb3UgbWF5IGNoYXJnZSBhIGZlZSBm
b3IgdGhlIHBoeXNpY2FsIGFjdCBvZiB0cmFuc2ZlcnJpbmcgYSBjb3B5LCBhbmQgeW91IG1heSBh
dCB5b3VyIG9wdGlvbiBvZmZlciB3YXJyYW50eSBwcm90ZWN0aW9uIGluIGV4Y2hhbmdlIGZvciBh
IGZlZS4KKyMgIAorIyAtVGhlc2UgcmVxdWlyZW1lbnRzIGFwcGx5IHRvIHRoZSBtb2RpZmllZCB3
b3JrIGFzIGEgd2hvbGUuICBJZgorIyAtaWRlbnRpZmlhYmxlIHNlY3Rpb25zIG9mIHRoYXQgd29y
ayBhcmUgbm90IGRlcml2ZWQgZnJvbSB0aGUgTGlicmFyeSwKKyMgLWFuZCBjYW4gYmUgcmVhc29u
YWJseSBjb25zaWRlcmVkIGluZGVwZW5kZW50IGFuZCBzZXBhcmF0ZSB3b3JrcyBpbgorIyAtdGhl
bXNlbHZlcywgdGhlbiB0aGlzIExpY2Vuc2UsIGFuZCBpdHMgdGVybXMsIGRvIG5vdCBhcHBseSB0
byB0aG9zZQorIyAtc2VjdGlvbnMgd2hlbiB5b3UgZGlzdHJpYnV0ZSB0aGVtIGFzIHNlcGFyYXRl
IHdvcmtzLiAgQnV0IHdoZW4geW91CisjIC1kaXN0cmlidXRlIHRoZSBzYW1lIHNlY3Rpb25zIGFz
IHBhcnQgb2YgYSB3aG9sZSB3aGljaCBpcyBhIHdvcmsgYmFzZWQKKyMgLW9uIHRoZSBMaWJyYXJ5
LCB0aGUgZGlzdHJpYnV0aW9uIG9mIHRoZSB3aG9sZSBtdXN0IGJlIG9uIHRoZSB0ZXJtcyBvZgor
IyAtdGhpcyBMaWNlbnNlLCB3aG9zZSBwZXJtaXNzaW9ucyBmb3Igb3RoZXIgbGljZW5zZWVzIGV4
dGVuZCB0byB0aGUKKyMgLWVudGlyZSB3aG9sZSwgYW5kIHRodXMgdG8gZWFjaCBhbmQgZXZlcnkg
cGFydCByZWdhcmRsZXNzIG9mIHdobyB3cm90ZQorIyAtaXQuCisjICsyLiBZb3UgbWF5IG1vZGlm
eSB5b3VyIGNvcHkgb3IgY29waWVzIG9mIHRoZSBMaWJyYXJ5IG9yIGFueSBwb3J0aW9uIG9mIGl0
LCB0aHVzIGZvcm1pbmcgYSB3b3JrIGJhc2VkIG9uIHRoZSBMaWJyYXJ5LCBhbmQgY29weSBhbmQg
ZGlzdHJpYnV0ZSBzdWNoIG1vZGlmaWNhdGlvbnMgb3Igd29yayB1bmRlciB0aGUgdGVybXMgb2Yg
U2VjdGlvbiAxIGFib3ZlLCBwcm92aWRlZCB0aGF0IHlvdSBhbHNvIG1lZXQgYWxsIG9mIHRoZXNl
IGNvbmRpdGlvbnM6CisjICAKKyMgLVRodXMsIGl0IGlzIG5vdCB0aGUgaW50ZW50IG9mIHRoaXMg
c2VjdGlvbiB0byBjbGFpbSByaWdodHMgb3IgY29udGVzdAorIyAteW91ciByaWdodHMgdG8gd29y
ayB3cml0dGVuIGVudGlyZWx5IGJ5IHlvdTsgcmF0aGVyLCB0aGUgaW50ZW50IGlzIHRvCisjIC1l
eGVyY2lzZSB0aGUgcmlnaHQgdG8gY29udHJvbCB0aGUgZGlzdHJpYnV0aW9uIG9mIGRlcml2YXRp
dmUgb3IKKyMgLWNvbGxlY3RpdmUgd29ya3MgYmFzZWQgb24gdGhlIExpYnJhcnkuCisjICsgICAg
IGEpIFRoZSBtb2RpZmllZCB3b3JrIG11c3QgaXRzZWxmIGJlIGEgc29mdHdhcmUgbGlicmFyeS4K
KyMgIAorIyAtSW4gYWRkaXRpb24sIG1lcmUgYWdncmVnYXRpb24gb2YgYW5vdGhlciB3b3JrIG5v
dCBiYXNlZCBvbiB0aGUgTGlicmFyeQorIyAtd2l0aCB0aGUgTGlicmFyeSAob3Igd2l0aCBhIHdv
cmsgYmFzZWQgb24gdGhlIExpYnJhcnkpIG9uIGEgdm9sdW1lIG9mCisjIC1hIHN0b3JhZ2Ugb3Ig
ZGlzdHJpYnV0aW9uIG1lZGl1bSBkb2VzIG5vdCBicmluZyB0aGUgb3RoZXIgd29yayB1bmRlcgor
IyAtdGhlIHNjb3BlIG9mIHRoaXMgTGljZW5zZS4KKyMgKyAgICAgYikgWW91IG11c3QgY2F1c2Ug
dGhlIGZpbGVzIG1vZGlmaWVkIHRvIGNhcnJ5IHByb21pbmVudCBub3RpY2VzIHN0YXRpbmcgdGhh
dCB5b3UgY2hhbmdlZCB0aGUgZmlsZXMgYW5kIHRoZSBkYXRlIG9mIGFueSBjaGFuZ2UuCisjICAK
KyMgLSAgMy4gWW91IG1heSBvcHQgdG8gYXBwbHkgdGhlIHRlcm1zIG9mIHRoZSBvcmRpbmFyeSBH
TlUgR2VuZXJhbCBQdWJsaWMKKyMgLUxpY2Vuc2UgaW5zdGVhZCBvZiB0aGlzIExpY2Vuc2UgdG8g
YSBnaXZlbiBjb3B5IG9mIHRoZSBMaWJyYXJ5LiAgVG8gZG8KKyMgLXRoaXMsIHlvdSBtdXN0IGFs
dGVyIGFsbCB0aGUgbm90aWNlcyB0aGF0IHJlZmVyIHRvIHRoaXMgTGljZW5zZSwgc28KKyMgLXRo
YXQgdGhleSByZWZlciB0byB0aGUgb3JkaW5hcnkgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Us
IHZlcnNpb24gMiwKKyMgLWluc3RlYWQgb2YgdG8gdGhpcyBMaWNlbnNlLiAgKElmIGEgbmV3ZXIg
dmVyc2lvbiB0aGFuIHZlcnNpb24gMiBvZiB0aGUKKyMgLW9yZGluYXJ5IEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGhhcyBhcHBlYXJlZCwgdGhlbiB5b3UgY2FuIHNwZWNpZnkKKyMgLXRoYXQg
dmVyc2lvbiBpbnN0ZWFkIGlmIHlvdSB3aXNoLikgIERvIG5vdCBtYWtlIGFueSBvdGhlciBjaGFu
Z2UgaW4KKyMgLXRoZXNlIG5vdGljZXMuCisjIC0MCisjIC0gIE9uY2UgdGhpcyBjaGFuZ2UgaXMg
bWFkZSBpbiBhIGdpdmVuIGNvcHksIGl0IGlzIGlycmV2ZXJzaWJsZSBmb3IKKyMgLXRoYXQgY29w
eSwgc28gdGhlIG9yZGluYXJ5IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFwcGxpZXMgdG8g
YWxsCisjIC1zdWJzZXF1ZW50IGNvcGllcyBhbmQgZGVyaXZhdGl2ZSB3b3JrcyBtYWRlIGZyb20g
dGhhdCBjb3B5LgorIyArICAgICBjKSBZb3UgbXVzdCBjYXVzZSB0aGUgd2hvbGUgb2YgdGhlIHdv
cmsgdG8gYmUgbGljZW5zZWQgYXQgbm8gY2hhcmdlIHRvIGFsbCB0aGlyZCBwYXJ0aWVzIHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGlzIExpY2Vuc2UuCisjICAKKyMgLSAgVGhpcyBvcHRpb24gaXMgdXNl
ZnVsIHdoZW4geW91IHdpc2ggdG8gY29weSBwYXJ0IG9mIHRoZSBjb2RlIG9mCisjIC10aGUgTGli
cmFyeSBpbnRvIGEgcHJvZ3JhbSB0aGF0IGlzIG5vdCBhIGxpYnJhcnkuCisjICsgICAgIGQpIElm
IGEgZmFjaWxpdHkgaW4gdGhlIG1vZGlmaWVkIExpYnJhcnkgcmVmZXJzIHRvIGEgZnVuY3Rpb24g
b3IgYSB0YWJsZSBvZiBkYXRhIHRvIGJlIHN1cHBsaWVkIGJ5IGFuIGFwcGxpY2F0aW9uIHByb2dy
YW0gdGhhdCB1c2VzIHRoZSBmYWNpbGl0eSwgb3RoZXIgdGhhbiBhcyBhbiBhcmd1bWVudCBwYXNz
ZWQgd2hlbiB0aGUgZmFjaWxpdHkgaXMgaW52b2tlZCwgdGhlbiB5b3UgbXVzdCBtYWtlIGEgZ29v
ZCBmYWl0aCBlZmZvcnQgdG8gZW5zdXJlIHRoYXQsIGluIHRoZSBldmVudCBhbiBhcHBsaWNhdGlv
biBkb2VzIG5vdCBzdXBwbHkgc3VjaCBmdW5jdGlvbiBvciB0YWJsZSwgdGhlIGZhY2lsaXR5IHN0
aWxsIG9wZXJhdGVzLCBhbmQgcGVyZm9ybXMgd2hhdGV2ZXIgcGFydCBvZiBpdHMgcHVycG9zZSBy
ZW1haW5zIG1lYW5pbmdmdWwuCisjICAKKyMgLSAgNC4gWW91IG1heSBjb3B5IGFuZCBkaXN0cmli
dXRlIHRoZSBMaWJyYXJ5IChvciBhIHBvcnRpb24gb3IKKyMgLWRlcml2YXRpdmUgb2YgaXQsIHVu
ZGVyIFNlY3Rpb24gMikgaW4gb2JqZWN0IGNvZGUgb3IgZXhlY3V0YWJsZSBmb3JtCisjIC11bmRl
ciB0aGUgdGVybXMgb2YgU2VjdGlvbnMgMSBhbmQgMiBhYm92ZSBwcm92aWRlZCB0aGF0IHlvdSBh
Y2NvbXBhbnkKKyMgLWl0IHdpdGggdGhlIGNvbXBsZXRlIGNvcnJlc3BvbmRpbmcgbWFjaGluZS1y
ZWFkYWJsZSBzb3VyY2UgY29kZSwgd2hpY2gKKyMgLW11c3QgYmUgZGlzdHJpYnV0ZWQgdW5kZXIg
dGhlIHRlcm1zIG9mIFNlY3Rpb25zIDEgYW5kIDIgYWJvdmUgb24gYQorIyAtbWVkaXVtIGN1c3Rv
bWFyaWx5IHVzZWQgZm9yIHNvZnR3YXJlIGludGVyY2hhbmdlLgorIyArKEZvciBleGFtcGxlLCBh
IGZ1bmN0aW9uIGluIGEgbGlicmFyeSB0byBjb21wdXRlIHNxdWFyZSByb290cyBoYXMgYSBwdXJw
b3NlIHRoYXQgaXMgZW50aXJlbHkgd2VsbC1kZWZpbmVkIGluZGVwZW5kZW50IG9mIHRoZSBhcHBs
aWNhdGlvbi4gVGhlcmVmb3JlLCBTdWJzZWN0aW9uIDJkIHJlcXVpcmVzIHRoYXQgYW55IGFwcGxp
Y2F0aW9uLXN1cHBsaWVkIGZ1bmN0aW9uIG9yIHRhYmxlIHVzZWQgYnkgdGhpcyBmdW5jdGlvbiBt
dXN0IGJlIG9wdGlvbmFsOiBpZiB0aGUgYXBwbGljYXRpb24gZG9lcyBub3Qgc3VwcGx5IGl0LCB0
aGUgc3F1YXJlIHJvb3QgZnVuY3Rpb24gbXVzdCBzdGlsbCBjb21wdXRlIHNxdWFyZSByb290cy4p
CisjICAKKyMgLSAgSWYgZGlzdHJpYnV0aW9uIG9mIG9iamVjdCBjb2RlIGlzIG1hZGUgYnkgb2Zm
ZXJpbmcgYWNjZXNzIHRvIGNvcHkKKyMgLWZyb20gYSBkZXNpZ25hdGVkIHBsYWNlLCB0aGVuIG9m
ZmVyaW5nIGVxdWl2YWxlbnQgYWNjZXNzIHRvIGNvcHkgdGhlCisjIC1zb3VyY2UgY29kZSBmcm9t
IHRoZSBzYW1lIHBsYWNlIHNhdGlzZmllcyB0aGUgcmVxdWlyZW1lbnQgdG8KKyMgLWRpc3RyaWJ1
dGUgdGhlIHNvdXJjZSBjb2RlLCBldmVuIHRob3VnaCB0aGlyZCBwYXJ0aWVzIGFyZSBub3QKKyMg
LWNvbXBlbGxlZCB0byBjb3B5IHRoZSBzb3VyY2UgYWxvbmcgd2l0aCB0aGUgb2JqZWN0IGNvZGUu
CisjICtUaGVzZSByZXF1aXJlbWVudHMgYXBwbHkgdG8gdGhlIG1vZGlmaWVkIHdvcmsgYXMgYSB3
aG9sZS4gSWYgaWRlbnRpZmlhYmxlIHNlY3Rpb25zIG9mIHRoYXQgd29yayBhcmUgbm90IGRlcml2
ZWQgZnJvbSB0aGUgTGlicmFyeSwgYW5kIGNhbiBiZSByZWFzb25hYmx5IGNvbnNpZGVyZWQgaW5k
ZXBlbmRlbnQgYW5kIHNlcGFyYXRlIHdvcmtzIGluIHRoZW1zZWx2ZXMsIHRoZW4gdGhpcyBMaWNl
bnNlLCBhbmQgaXRzIHRlcm1zLCBkbyBub3QgYXBwbHkgdG8gdGhvc2Ugc2VjdGlvbnMgd2hlbiB5
b3UgZGlzdHJpYnV0ZSB0aGVtIGFzIHNlcGFyYXRlIHdvcmtzLiBCdXQgd2hlbiB5b3UgZGlzdHJp
YnV0ZSB0aGUgc2FtZSBzZWN0aW9ucyBhcyBwYXJ0IG9mIGEgd2hvbGUgd2hpY2ggaXMgYSB3b3Jr
IGJhc2VkIG9uIHRoZSBMaWJyYXJ5LCB0aGUgZGlzdHJpYnV0aW9uIG9mIHRoZSB3aG9sZSBtdXN0
IGJlIG9uIHRoZSB0ZXJtcyBvZiB0aGlzIExpY2Vuc2UsIHdob3NlIHBlcm1pc3Npb25zIGZvciBv
dGhlciBsaWNlbnNlZXMgZXh0ZW5kIHRvIHRoZSBlbnRpcmUgd2hvbGUsIGFuZCB0aHVzIHRvIGVh
Y2ggYW5kIGV2ZXJ5IHBhcnQgcmVnYXJkbGVzcyBvZiB3aG8gd3JvdGUgaXQuCisjICAKKyMgLSAg
NS4gQSBwcm9ncmFtIHRoYXQgY29udGFpbnMgbm8gZGVyaXZhdGl2ZSBvZiBhbnkgcG9ydGlvbiBv
ZiB0aGUKKyMgLUxpYnJhcnksIGJ1dCBpcyBkZXNpZ25lZCB0byB3b3JrIHdpdGggdGhlIExpYnJh
cnkgYnkgYmVpbmcgY29tcGlsZWQgb3IKKyMgLWxpbmtlZCB3aXRoIGl0LCBpcyBjYWxsZWQgYSAi
d29yayB0aGF0IHVzZXMgdGhlIExpYnJhcnkiLiAgU3VjaCBhCisjIC13b3JrLCBpbiBpc29sYXRp
b24sIGlzIG5vdCBhIGRlcml2YXRpdmUgd29yayBvZiB0aGUgTGlicmFyeSwgYW5kCisjIC10aGVy
ZWZvcmUgZmFsbHMgb3V0c2lkZSB0aGUgc2NvcGUgb2YgdGhpcyBMaWNlbnNlLgorIyArVGh1cywg
aXQgaXMgbm90IHRoZSBpbnRlbnQgb2YgdGhpcyBzZWN0aW9uIHRvIGNsYWltIHJpZ2h0cyBvciBj
b250ZXN0IHlvdXIgcmlnaHRzIHRvIHdvcmsgd3JpdHRlbiBlbnRpcmVseSBieSB5b3U7IHJhdGhl
ciwgdGhlIGludGVudCBpcyB0byBleGVyY2lzZSB0aGUgcmlnaHQgdG8gY29udHJvbCB0aGUgZGlz
dHJpYnV0aW9uIG9mIGRlcml2YXRpdmUgb3IgY29sbGVjdGl2ZSB3b3JrcyBiYXNlZCBvbiB0aGUg
TGlicmFyeS4KKyMgIAorIyAtICBIb3dldmVyLCBsaW5raW5nIGEgIndvcmsgdGhhdCB1c2VzIHRo
ZSBMaWJyYXJ5IiB3aXRoIHRoZSBMaWJyYXJ5CisjIC1jcmVhdGVzIGFuIGV4ZWN1dGFibGUgdGhh
dCBpcyBhIGRlcml2YXRpdmUgb2YgdGhlIExpYnJhcnkgKGJlY2F1c2UgaXQKKyMgLWNvbnRhaW5z
IHBvcnRpb25zIG9mIHRoZSBMaWJyYXJ5KSwgcmF0aGVyIHRoYW4gYSAid29yayB0aGF0IHVzZXMg
dGhlCisjIC1saWJyYXJ5Ii4gIFRoZSBleGVjdXRhYmxlIGlzIHRoZXJlZm9yZSBjb3ZlcmVkIGJ5
IHRoaXMgTGljZW5zZS4KKyMgLVNlY3Rpb24gNiBzdGF0ZXMgdGVybXMgZm9yIGRpc3RyaWJ1dGlv
biBvZiBzdWNoIGV4ZWN1dGFibGVzLgorIyArSW4gYWRkaXRpb24sIG1lcmUgYWdncmVnYXRpb24g
b2YgYW5vdGhlciB3b3JrIG5vdCBiYXNlZCBvbiB0aGUgTGlicmFyeSB3aXRoIHRoZSBMaWJyYXJ5
IChvciB3aXRoIGEgd29yayBiYXNlZCBvbiB0aGUgTGlicmFyeSkgb24gYSB2b2x1bWUgb2YgYSBz
dG9yYWdlIG9yIGRpc3RyaWJ1dGlvbiBtZWRpdW0gZG9lcyBub3QgYnJpbmcgdGhlIG90aGVyIHdv
cmsgdW5kZXIgdGhlIHNjb3BlIG9mIHRoaXMgTGljZW5zZS4KKyMgIAorIyAtICBXaGVuIGEgIndv
cmsgdGhhdCB1c2VzIHRoZSBMaWJyYXJ5IiB1c2VzIG1hdGVyaWFsIGZyb20gYSBoZWFkZXIgZmls
ZQorIyAtdGhhdCBpcyBwYXJ0IG9mIHRoZSBMaWJyYXJ5LCB0aGUgb2JqZWN0IGNvZGUgZm9yIHRo
ZSB3b3JrIG1heSBiZSBhCisjIC1kZXJpdmF0aXZlIHdvcmsgb2YgdGhlIExpYnJhcnkgZXZlbiB0
aG91Z2ggdGhlIHNvdXJjZSBjb2RlIGlzIG5vdC4KKyMgLVdoZXRoZXIgdGhpcyBpcyB0cnVlIGlz
IGVzcGVjaWFsbHkgc2lnbmlmaWNhbnQgaWYgdGhlIHdvcmsgY2FuIGJlCisjIC1saW5rZWQgd2l0
aG91dCB0aGUgTGlicmFyeSwgb3IgaWYgdGhlIHdvcmsgaXMgaXRzZWxmIGEgbGlicmFyeS4gIFRo
ZQorIyAtdGhyZXNob2xkIGZvciB0aGlzIHRvIGJlIHRydWUgaXMgbm90IHByZWNpc2VseSBkZWZp
bmVkIGJ5IGxhdy4KKyMgKzMuIFlvdSBtYXkgb3B0IHRvIGFwcGx5IHRoZSB0ZXJtcyBvZiB0aGUg
b3JkaW5hcnkgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgaW5zdGVhZCBvZiB0aGlzIExpY2Vu
c2UgdG8gYSBnaXZlbiBjb3B5IG9mIHRoZSBMaWJyYXJ5LiBUbyBkbyB0aGlzLCB5b3UgbXVzdCBh
bHRlciBhbGwgdGhlIG5vdGljZXMgdGhhdCByZWZlciB0byB0aGlzIExpY2Vuc2UsIHNvIHRoYXQg
dGhleSByZWZlciB0byB0aGUgb3JkaW5hcnkgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UsIHZl
cnNpb24gMiwgaW5zdGVhZCBvZiB0byB0aGlzIExpY2Vuc2UuIChJZiBhIG5ld2VyIHZlcnNpb24g
dGhhbiB2ZXJzaW9uIDIgb2YgdGhlIG9yZGluYXJ5IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGhhcyBhcHBlYXJlZCwgdGhlbiB5b3UgY2FuIHNwZWNpZnkgdGhhdCB2ZXJzaW9uIGluc3RlYWQg
aWYgeW91IHdpc2guKSBEbyBub3QgbWFrZSBhbnkgb3RoZXIgY2hhbmdlIGluIHRoZXNlIG5vdGlj
ZXMuCisjICAKKyMgLSAgSWYgc3VjaCBhbiBvYmplY3QgZmlsZSB1c2VzIG9ubHkgbnVtZXJpY2Fs
IHBhcmFtZXRlcnMsIGRhdGEKKyMgLXN0cnVjdHVyZSBsYXlvdXRzIGFuZCBhY2Nlc3NvcnMsIGFu
ZCBzbWFsbCBtYWNyb3MgYW5kIHNtYWxsIGlubGluZQorIyAtZnVuY3Rpb25zICh0ZW4gbGluZXMg
b3IgbGVzcyBpbiBsZW5ndGgpLCB0aGVuIHRoZSB1c2Ugb2YgdGhlIG9iamVjdAorIyAtZmlsZSBp
cyB1bnJlc3RyaWN0ZWQsIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBpdCBpcyBsZWdhbGx5IGEgZGVy
aXZhdGl2ZQorIyAtd29yay4gIChFeGVjdXRhYmxlcyBjb250YWluaW5nIHRoaXMgb2JqZWN0IGNv
ZGUgcGx1cyBwb3J0aW9ucyBvZiB0aGUKKyMgLUxpYnJhcnkgd2lsbCBzdGlsbCBmYWxsIHVuZGVy
IFNlY3Rpb24gNi4pCisjICtPbmNlIHRoaXMgY2hhbmdlIGlzIG1hZGUgaW4gYSBnaXZlbiBjb3B5
LCBpdCBpcyBpcnJldmVyc2libGUgZm9yIHRoYXQgY29weSwgc28gdGhlIG9yZGluYXJ5IEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFwcGxpZXMgdG8gYWxsIHN1YnNlcXVlbnQgY29waWVzIGFu
ZCBkZXJpdmF0aXZlIHdvcmtzIG1hZGUgZnJvbSB0aGF0IGNvcHkuCisjICAKKyMgLSAgT3RoZXJ3
aXNlLCBpZiB0aGUgd29yayBpcyBhIGRlcml2YXRpdmUgb2YgdGhlIExpYnJhcnksIHlvdSBtYXkK
KyMgLWRpc3RyaWJ1dGUgdGhlIG9iamVjdCBjb2RlIGZvciB0aGUgd29yayB1bmRlciB0aGUgdGVy
bXMgb2YgU2VjdGlvbiA2LgorIyAtQW55IGV4ZWN1dGFibGVzIGNvbnRhaW5pbmcgdGhhdCB3b3Jr
IGFsc28gZmFsbCB1bmRlciBTZWN0aW9uIDYsCisjIC13aGV0aGVyIG9yIG5vdCB0aGV5IGFyZSBs
aW5rZWQgZGlyZWN0bHkgd2l0aCB0aGUgTGlicmFyeSBpdHNlbGYuCisjIC0MCisjIC0gIDYuIEFz
IGFuIGV4Y2VwdGlvbiB0byB0aGUgU2VjdGlvbnMgYWJvdmUsIHlvdSBtYXkgYWxzbyBjb21iaW5l
IG9yCisjIC1saW5rIGEgIndvcmsgdGhhdCB1c2VzIHRoZSBMaWJyYXJ5IiB3aXRoIHRoZSBMaWJy
YXJ5IHRvIHByb2R1Y2UgYQorIyAtd29yayBjb250YWluaW5nIHBvcnRpb25zIG9mIHRoZSBMaWJy
YXJ5LCBhbmQgZGlzdHJpYnV0ZSB0aGF0IHdvcmsKKyMgLXVuZGVyIHRlcm1zIG9mIHlvdXIgY2hv
aWNlLCBwcm92aWRlZCB0aGF0IHRoZSB0ZXJtcyBwZXJtaXQKKyMgLW1vZGlmaWNhdGlvbiBvZiB0
aGUgd29yayBmb3IgdGhlIGN1c3RvbWVyJ3Mgb3duIHVzZSBhbmQgcmV2ZXJzZQorIyAtZW5naW5l
ZXJpbmcgZm9yIGRlYnVnZ2luZyBzdWNoIG1vZGlmaWNhdGlvbnMuCisjICtUaGlzIG9wdGlvbiBp
cyB1c2VmdWwgd2hlbiB5b3Ugd2lzaCB0byBjb3B5IHBhcnQgb2YgdGhlIGNvZGUgb2YgdGhlIExp
YnJhcnkgaW50byBhIHByb2dyYW0gdGhhdCBpcyBub3QgYSBsaWJyYXJ5LgorIyAgCisjIC0gIFlv
dSBtdXN0IGdpdmUgcHJvbWluZW50IG5vdGljZSB3aXRoIGVhY2ggY29weSBvZiB0aGUgd29yayB0
aGF0IHRoZQorIyAtTGlicmFyeSBpcyB1c2VkIGluIGl0IGFuZCB0aGF0IHRoZSBMaWJyYXJ5IGFu
ZCBpdHMgdXNlIGFyZSBjb3ZlcmVkIGJ5CisjIC10aGlzIExpY2Vuc2UuICBZb3UgbXVzdCBzdXBw
bHkgYSBjb3B5IG9mIHRoaXMgTGljZW5zZS4gIElmIHRoZSB3b3JrCisjIC1kdXJpbmcgZXhlY3V0
aW9uIGRpc3BsYXlzIGNvcHlyaWdodCBub3RpY2VzLCB5b3UgbXVzdCBpbmNsdWRlIHRoZQorIyAt
Y29weXJpZ2h0IG5vdGljZSBmb3IgdGhlIExpYnJhcnkgYW1vbmcgdGhlbSwgYXMgd2VsbCBhcyBh
IHJlZmVyZW5jZQorIyAtZGlyZWN0aW5nIHRoZSB1c2VyIHRvIHRoZSBjb3B5IG9mIHRoaXMgTGlj
ZW5zZS4gIEFsc28sIHlvdSBtdXN0IGRvIG9uZQorIyAtb2YgdGhlc2UgdGhpbmdzOgorIyArNC4g
WW91IG1heSBjb3B5IGFuZCBkaXN0cmlidXRlIHRoZSBMaWJyYXJ5IChvciBhIHBvcnRpb24gb3Ig
ZGVyaXZhdGl2ZSBvZiBpdCwgdW5kZXIgU2VjdGlvbiAyKSBpbiBvYmplY3QgY29kZSBvciBleGVj
dXRhYmxlIGZvcm0gdW5kZXIgdGhlIHRlcm1zIG9mIFNlY3Rpb25zIDEgYW5kIDIgYWJvdmUgcHJv
dmlkZWQgdGhhdCB5b3UgYWNjb21wYW55IGl0IHdpdGggdGhlIGNvbXBsZXRlIGNvcnJlc3BvbmRp
bmcgbWFjaGluZS1yZWFkYWJsZSBzb3VyY2UgY29kZSwgd2hpY2ggbXVzdCBiZSBkaXN0cmlidXRl
ZCB1bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbnMgMSBhbmQgMiBhYm92ZSBvbiBhIG1lZGl1bSBj
dXN0b21hcmlseSB1c2VkIGZvciBzb2Z0d2FyZSBpbnRlcmNoYW5nZS4KKyMgIAorIyAtICAgIGEp
IEFjY29tcGFueSB0aGUgd29yayB3aXRoIHRoZSBjb21wbGV0ZSBjb3JyZXNwb25kaW5nCisjIC0g
ICAgbWFjaGluZS1yZWFkYWJsZSBzb3VyY2UgY29kZSBmb3IgdGhlIExpYnJhcnkgaW5jbHVkaW5n
IHdoYXRldmVyCisjIC0gICAgY2hhbmdlcyB3ZXJlIHVzZWQgaW4gdGhlIHdvcmsgKHdoaWNoIG11
c3QgYmUgZGlzdHJpYnV0ZWQgdW5kZXIKKyMgLSAgICBTZWN0aW9ucyAxIGFuZCAyIGFib3ZlKTsg
YW5kLCBpZiB0aGUgd29yayBpcyBhbiBleGVjdXRhYmxlIGxpbmtlZAorIyAtICAgIHdpdGggdGhl
IExpYnJhcnksIHdpdGggdGhlIGNvbXBsZXRlIG1hY2hpbmUtcmVhZGFibGUgIndvcmsgdGhhdAor
IyAtICAgIHVzZXMgdGhlIExpYnJhcnkiLCBhcyBvYmplY3QgY29kZSBhbmQvb3Igc291cmNlIGNv
ZGUsIHNvIHRoYXQgdGhlCisjIC0gICAgdXNlciBjYW4gbW9kaWZ5IHRoZSBMaWJyYXJ5IGFuZCB0
aGVuIHJlbGluayB0byBwcm9kdWNlIGEgbW9kaWZpZWQKKyMgLSAgICBleGVjdXRhYmxlIGNvbnRh
aW5pbmcgdGhlIG1vZGlmaWVkIExpYnJhcnkuICAoSXQgaXMgdW5kZXJzdG9vZAorIyAtICAgIHRo
YXQgdGhlIHVzZXIgd2hvIGNoYW5nZXMgdGhlIGNvbnRlbnRzIG9mIGRlZmluaXRpb25zIGZpbGVz
IGluIHRoZQorIyAtICAgIExpYnJhcnkgd2lsbCBub3QgbmVjZXNzYXJpbHkgYmUgYWJsZSB0byBy
ZWNvbXBpbGUgdGhlIGFwcGxpY2F0aW9uCisjIC0gICAgdG8gdXNlIHRoZSBtb2RpZmllZCBkZWZp
bml0aW9ucy4pCisjICtJZiBkaXN0cmlidXRpb24gb2Ygb2JqZWN0IGNvZGUgaXMgbWFkZSBieSBv
ZmZlcmluZyBhY2Nlc3MgdG8gY29weSBmcm9tIGEgZGVzaWduYXRlZCBwbGFjZSwgdGhlbiBvZmZl
cmluZyBlcXVpdmFsZW50IGFjY2VzcyB0byBjb3B5IHRoZSBzb3VyY2UgY29kZSBmcm9tIHRoZSBz
YW1lIHBsYWNlIHNhdGlzZmllcyB0aGUgcmVxdWlyZW1lbnQgdG8gZGlzdHJpYnV0ZSB0aGUgc291
cmNlIGNvZGUsIGV2ZW4gdGhvdWdoIHRoaXJkIHBhcnRpZXMgYXJlIG5vdCBjb21wZWxsZWQgdG8g
Y29weSB0aGUgc291cmNlIGFsb25nIHdpdGggdGhlIG9iamVjdCBjb2RlLgorIyAgCisjIC0gICAg
YikgVXNlIGEgc3VpdGFibGUgc2hhcmVkIGxpYnJhcnkgbWVjaGFuaXNtIGZvciBsaW5raW5nIHdp
dGggdGhlCisjIC0gICAgTGlicmFyeS4gIEEgc3VpdGFibGUgbWVjaGFuaXNtIGlzIG9uZSB0aGF0
ICgxKSB1c2VzIGF0IHJ1biB0aW1lIGEKKyMgLSAgICBjb3B5IG9mIHRoZSBsaWJyYXJ5IGFscmVh
ZHkgcHJlc2VudCBvbiB0aGUgdXNlcidzIGNvbXB1dGVyIHN5c3RlbSwKKyMgLSAgICByYXRoZXIg
dGhhbiBjb3B5aW5nIGxpYnJhcnkgZnVuY3Rpb25zIGludG8gdGhlIGV4ZWN1dGFibGUsIGFuZCAo
MikKKyMgLSAgICB3aWxsIG9wZXJhdGUgcHJvcGVybHkgd2l0aCBhIG1vZGlmaWVkIHZlcnNpb24g
b2YgdGhlIGxpYnJhcnksIGlmCisjIC0gICAgdGhlIHVzZXIgaW5zdGFsbHMgb25lLCBhcyBsb25n
IGFzIHRoZSBtb2RpZmllZCB2ZXJzaW9uIGlzCisjIC0gICAgaW50ZXJmYWNlLWNvbXBhdGlibGUg
d2l0aCB0aGUgdmVyc2lvbiB0aGF0IHRoZSB3b3JrIHdhcyBtYWRlIHdpdGguCisjICs1LiBBIHBy
b2dyYW0gdGhhdCBjb250YWlucyBubyBkZXJpdmF0aXZlIG9mIGFueSBwb3J0aW9uIG9mIHRoZSBM
aWJyYXJ5LCBidXQgaXMgZGVzaWduZWQgdG8gd29yayB3aXRoIHRoZSBMaWJyYXJ5IGJ5IGJlaW5n
IGNvbXBpbGVkIG9yIGxpbmtlZCB3aXRoIGl0LCBpcyBjYWxsZWQgYSAid29yayB0aGF0IHVzZXMg
dGhlIExpYnJhcnkiLiBTdWNoIGEgd29yaywgaW4gaXNvbGF0aW9uLCBpcyBub3QgYSBkZXJpdmF0
aXZlIHdvcmsgb2YgdGhlIExpYnJhcnksIGFuZCB0aGVyZWZvcmUgZmFsbHMgb3V0c2lkZSB0aGUg
c2NvcGUgb2YgdGhpcyBMaWNlbnNlLgorIyAgCisjIC0gICAgYykgQWNjb21wYW55IHRoZSB3b3Jr
IHdpdGggYSB3cml0dGVuIG9mZmVyLCB2YWxpZCBmb3IgYXQKKyMgLSAgICBsZWFzdCB0aHJlZSB5
ZWFycywgdG8gZ2l2ZSB0aGUgc2FtZSB1c2VyIHRoZSBtYXRlcmlhbHMKKyMgLSAgICBzcGVjaWZp
ZWQgaW4gU3Vic2VjdGlvbiA2YSwgYWJvdmUsIGZvciBhIGNoYXJnZSBubyBtb3JlCisjIC0gICAg
dGhhbiB0aGUgY29zdCBvZiBwZXJmb3JtaW5nIHRoaXMgZGlzdHJpYnV0aW9uLgorIyArSG93ZXZl
ciwgbGlua2luZyBhICJ3b3JrIHRoYXQgdXNlcyB0aGUgTGlicmFyeSIgd2l0aCB0aGUgTGlicmFy
eSBjcmVhdGVzIGFuIGV4ZWN1dGFibGUgdGhhdCBpcyBhIGRlcml2YXRpdmUgb2YgdGhlIExpYnJh
cnkgKGJlY2F1c2UgaXQgY29udGFpbnMgcG9ydGlvbnMgb2YgdGhlIExpYnJhcnkpLCByYXRoZXIg
dGhhbiBhICJ3b3JrIHRoYXQgdXNlcyB0aGUgbGlicmFyeSIuIFRoZSBleGVjdXRhYmxlIGlzIHRo
ZXJlZm9yZSBjb3ZlcmVkIGJ5IHRoaXMgTGljZW5zZS4gU2VjdGlvbiA2IHN0YXRlcyB0ZXJtcyBm
b3IgZGlzdHJpYnV0aW9uIG9mIHN1Y2ggZXhlY3V0YWJsZXMuCisjICAKKyMgLSAgICBkKSBJZiBk
aXN0cmlidXRpb24gb2YgdGhlIHdvcmsgaXMgbWFkZSBieSBvZmZlcmluZyBhY2Nlc3MgdG8gY29w
eQorIyAtICAgIGZyb20gYSBkZXNpZ25hdGVkIHBsYWNlLCBvZmZlciBlcXVpdmFsZW50IGFjY2Vz
cyB0byBjb3B5IHRoZSBhYm92ZQorIyAtICAgIHNwZWNpZmllZCBtYXRlcmlhbHMgZnJvbSB0aGUg
c2FtZSBwbGFjZS4KKyMgK1doZW4gYSAid29yayB0aGF0IHVzZXMgdGhlIExpYnJhcnkiIHVzZXMg
bWF0ZXJpYWwgZnJvbSBhIGhlYWRlciBmaWxlIHRoYXQgaXMgcGFydCBvZiB0aGUgTGlicmFyeSwg
dGhlIG9iamVjdCBjb2RlIGZvciB0aGUgd29yayBtYXkgYmUgYSBkZXJpdmF0aXZlIHdvcmsgb2Yg
dGhlIExpYnJhcnkgZXZlbiB0aG91Z2ggdGhlIHNvdXJjZSBjb2RlIGlzIG5vdC4gV2hldGhlciB0
aGlzIGlzIHRydWUgaXMgZXNwZWNpYWxseSBzaWduaWZpY2FudCBpZiB0aGUgd29yayBjYW4gYmUg
bGlua2VkIHdpdGhvdXQgdGhlIExpYnJhcnksIG9yIGlmIHRoZSB3b3JrIGlzIGl0c2VsZiBhIGxp
YnJhcnkuIFRoZSB0aHJlc2hvbGQgZm9yIHRoaXMgdG8gYmUgdHJ1ZSBpcyBub3QgcHJlY2lzZWx5
IGRlZmluZWQgYnkgbGF3LgorIyAgCisjIC0gICAgZSkgVmVyaWZ5IHRoYXQgdGhlIHVzZXIgaGFz
IGFscmVhZHkgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZXNlCisjIC0gICAgbWF0ZXJpYWxzIG9yIHRo
YXQgeW91IGhhdmUgYWxyZWFkeSBzZW50IHRoaXMgdXNlciBhIGNvcHkuCisjICtJZiBzdWNoIGFu
IG9iamVjdCBmaWxlIHVzZXMgb25seSBudW1lcmljYWwgcGFyYW1ldGVycywgZGF0YSBzdHJ1Y3R1
cmUgbGF5b3V0cyBhbmQgYWNjZXNzb3JzLCBhbmQgc21hbGwgbWFjcm9zIGFuZCBzbWFsbCBpbmxp
bmUgZnVuY3Rpb25zICh0ZW4gbGluZXMgb3IgbGVzcyBpbiBsZW5ndGgpLCB0aGVuIHRoZSB1c2Ug
b2YgdGhlIG9iamVjdCBmaWxlIGlzIHVucmVzdHJpY3RlZCwgcmVnYXJkbGVzcyBvZiB3aGV0aGVy
IGl0IGlzIGxlZ2FsbHkgYSBkZXJpdmF0aXZlIHdvcmsuIChFeGVjdXRhYmxlcyBjb250YWluaW5n
IHRoaXMgb2JqZWN0IGNvZGUgcGx1cyBwb3J0aW9ucyBvZiB0aGUgTGlicmFyeSB3aWxsIHN0aWxs
IGZhbGwgdW5kZXIgU2VjdGlvbiA2LikKKyMgIAorIyAtICBGb3IgYW4gZXhlY3V0YWJsZSwgdGhl
IHJlcXVpcmVkIGZvcm0gb2YgdGhlICJ3b3JrIHRoYXQgdXNlcyB0aGUKKyMgLUxpYnJhcnkiIG11
c3QgaW5jbHVkZSBhbnkgZGF0YSBhbmQgdXRpbGl0eSBwcm9ncmFtcyBuZWVkZWQgZm9yCisjIC1y
ZXByb2R1Y2luZyB0aGUgZXhlY3V0YWJsZSBmcm9tIGl0LiAgSG93ZXZlciwgYXMgYSBzcGVjaWFs
IGV4Y2VwdGlvbiwKKyMgLXRoZSBtYXRlcmlhbHMgdG8gYmUgZGlzdHJpYnV0ZWQgbmVlZCBub3Qg
aW5jbHVkZSBhbnl0aGluZyB0aGF0IGlzCisjIC1ub3JtYWxseSBkaXN0cmlidXRlZCAoaW4gZWl0
aGVyIHNvdXJjZSBvciBiaW5hcnkgZm9ybSkgd2l0aCB0aGUgbWFqb3IKKyMgLWNvbXBvbmVudHMg
KGNvbXBpbGVyLCBrZXJuZWwsIGFuZCBzbyBvbikgb2YgdGhlIG9wZXJhdGluZyBzeXN0ZW0gb24K
KyMgLXdoaWNoIHRoZSBleGVjdXRhYmxlIHJ1bnMsIHVubGVzcyB0aGF0IGNvbXBvbmVudCBpdHNl
bGYgYWNjb21wYW5pZXMKKyMgLXRoZSBleGVjdXRhYmxlLgorIyArT3RoZXJ3aXNlLCBpZiB0aGUg
d29yayBpcyBhIGRlcml2YXRpdmUgb2YgdGhlIExpYnJhcnksIHlvdSBtYXkgZGlzdHJpYnV0ZSB0
aGUgb2JqZWN0IGNvZGUgZm9yIHRoZSB3b3JrIHVuZGVyIHRoZSB0ZXJtcyBvZiBTZWN0aW9uIDYu
IEFueSBleGVjdXRhYmxlcyBjb250YWluaW5nIHRoYXQgd29yayBhbHNvIGZhbGwgdW5kZXIgU2Vj
dGlvbiA2LCB3aGV0aGVyIG9yIG5vdCB0aGV5IGFyZSBsaW5rZWQgZGlyZWN0bHkgd2l0aCB0aGUg
TGlicmFyeSBpdHNlbGYuCisjICAKKyMgLSAgSXQgbWF5IGhhcHBlbiB0aGF0IHRoaXMgcmVxdWly
ZW1lbnQgY29udHJhZGljdHMgdGhlIGxpY2Vuc2UKKyMgLXJlc3RyaWN0aW9ucyBvZiBvdGhlciBw
cm9wcmlldGFyeSBsaWJyYXJpZXMgdGhhdCBkbyBub3Qgbm9ybWFsbHkKKyMgLWFjY29tcGFueSB0
aGUgb3BlcmF0aW5nIHN5c3RlbS4gIFN1Y2ggYSBjb250cmFkaWN0aW9uIG1lYW5zIHlvdSBjYW5u
b3QKKyMgLXVzZSBib3RoIHRoZW0gYW5kIHRoZSBMaWJyYXJ5IHRvZ2V0aGVyIGluIGFuIGV4ZWN1
dGFibGUgdGhhdCB5b3UKKyMgLWRpc3RyaWJ1dGUuCisjIC0MCisjIC0gIDcuIFlvdSBtYXkgcGxh
Y2UgbGlicmFyeSBmYWNpbGl0aWVzIHRoYXQgYXJlIGEgd29yayBiYXNlZCBvbiB0aGUKKyMgLUxp
YnJhcnkgc2lkZS1ieS1zaWRlIGluIGEgc2luZ2xlIGxpYnJhcnkgdG9nZXRoZXIgd2l0aCBvdGhl
ciBsaWJyYXJ5CisjIC1mYWNpbGl0aWVzIG5vdCBjb3ZlcmVkIGJ5IHRoaXMgTGljZW5zZSwgYW5k
IGRpc3RyaWJ1dGUgc3VjaCBhIGNvbWJpbmVkCisjIC1saWJyYXJ5LCBwcm92aWRlZCB0aGF0IHRo
ZSBzZXBhcmF0ZSBkaXN0cmlidXRpb24gb2YgdGhlIHdvcmsgYmFzZWQgb24KKyMgLXRoZSBMaWJy
YXJ5IGFuZCBvZiB0aGUgb3RoZXIgbGlicmFyeSBmYWNpbGl0aWVzIGlzIG90aGVyd2lzZQorIyAt
cGVybWl0dGVkLCBhbmQgcHJvdmlkZWQgdGhhdCB5b3UgZG8gdGhlc2UgdHdvIHRoaW5nczoKKyMg
KzYuIEFzIGFuIGV4Y2VwdGlvbiB0byB0aGUgU2VjdGlvbnMgYWJvdmUsIHlvdSBtYXkgYWxzbyBj
b21iaW5lIG9yIGxpbmsgYSAid29yayB0aGF0IHVzZXMgdGhlIExpYnJhcnkiIHdpdGggdGhlIExp
YnJhcnkgdG8gcHJvZHVjZSBhIHdvcmsgY29udGFpbmluZyBwb3J0aW9ucyBvZiB0aGUgTGlicmFy
eSwgYW5kIGRpc3RyaWJ1dGUgdGhhdCB3b3JrIHVuZGVyIHRlcm1zIG9mIHlvdXIgY2hvaWNlLCBw
cm92aWRlZCB0aGF0IHRoZSB0ZXJtcyBwZXJtaXQgbW9kaWZpY2F0aW9uIG9mIHRoZSB3b3JrIGZv
ciB0aGUgY3VzdG9tZXIncyBvd24gdXNlIGFuZCByZXZlcnNlIGVuZ2luZWVyaW5nIGZvciBkZWJ1
Z2dpbmcgc3VjaCBtb2RpZmljYXRpb25zLgorIyAgCisjIC0gICAgYSkgQWNjb21wYW55IHRoZSBj
b21iaW5lZCBsaWJyYXJ5IHdpdGggYSBjb3B5IG9mIHRoZSBzYW1lIHdvcmsKKyMgLSAgICBiYXNl
ZCBvbiB0aGUgTGlicmFyeSwgdW5jb21iaW5lZCB3aXRoIGFueSBvdGhlciBsaWJyYXJ5CisjIC0g
ICAgZmFjaWxpdGllcy4gIFRoaXMgbXVzdCBiZSBkaXN0cmlidXRlZCB1bmRlciB0aGUgdGVybXMg
b2YgdGhlCisjIC0gICAgU2VjdGlvbnMgYWJvdmUuCisjICtZb3UgbXVzdCBnaXZlIHByb21pbmVu
dCBub3RpY2Ugd2l0aCBlYWNoIGNvcHkgb2YgdGhlIHdvcmsgdGhhdCB0aGUgTGlicmFyeSBpcyB1
c2VkIGluIGl0IGFuZCB0aGF0IHRoZSBMaWJyYXJ5IGFuZCBpdHMgdXNlIGFyZSBjb3ZlcmVkIGJ5
IHRoaXMgTGljZW5zZS4gWW91IG11c3Qgc3VwcGx5IGEgY29weSBvZiB0aGlzIExpY2Vuc2UuIElm
IHRoZSB3b3JrIGR1cmluZyBleGVjdXRpb24gZGlzcGxheXMgY29weXJpZ2h0IG5vdGljZXMsIHlv
dSBtdXN0IGluY2x1ZGUgdGhlIGNvcHlyaWdodCBub3RpY2UgZm9yIHRoZSBMaWJyYXJ5IGFtb25n
IHRoZW0sIGFzIHdlbGwgYXMgYSByZWZlcmVuY2UgZGlyZWN0aW5nIHRoZSB1c2VyIHRvIHRoZSBj
b3B5IG9mIHRoaXMgTGljZW5zZS4gQWxzbywgeW91IG11c3QgZG8gb25lIG9mIHRoZXNlIHRoaW5n
czoKKyMgIAorIyAtICAgIGIpIEdpdmUgcHJvbWluZW50IG5vdGljZSB3aXRoIHRoZSBjb21iaW5l
ZCBsaWJyYXJ5IG9mIHRoZSBmYWN0CisjIC0gICAgdGhhdCBwYXJ0IG9mIGl0IGlzIGEgd29yayBi
YXNlZCBvbiB0aGUgTGlicmFyeSwgYW5kIGV4cGxhaW5pbmcKKyMgLSAgICB3aGVyZSB0byBmaW5k
IHRoZSBhY2NvbXBhbnlpbmcgdW5jb21iaW5lZCBmb3JtIG9mIHRoZSBzYW1lIHdvcmsuCisjICsg
ICAgIGEpIEFjY29tcGFueSB0aGUgd29yayB3aXRoIHRoZSBjb21wbGV0ZSBjb3JyZXNwb25kaW5n
IG1hY2hpbmUtcmVhZGFibGUgc291cmNlIGNvZGUgZm9yIHRoZSBMaWJyYXJ5IGluY2x1ZGluZyB3
aGF0ZXZlciBjaGFuZ2VzIHdlcmUgdXNlZCBpbiB0aGUgd29yayAod2hpY2ggbXVzdCBiZSBkaXN0
cmlidXRlZCB1bmRlciBTZWN0aW9ucyAxIGFuZCAyIGFib3ZlKTsgYW5kLCBpZiB0aGUgd29yayBp
cyBhbiBleGVjdXRhYmxlIGxpbmtlZCB3aXRoIHRoZSBMaWJyYXJ5LCB3aXRoIHRoZSBjb21wbGV0
ZSBtYWNoaW5lLXJlYWRhYmxlICJ3b3JrIHRoYXQgdXNlcyB0aGUgTGlicmFyeSIsIGFzIG9iamVj
dCBjb2RlIGFuZC9vciBzb3VyY2UgY29kZSwgc28gdGhhdCB0aGUgdXNlciBjYW4gbW9kaWZ5IHRo
ZSBMaWJyYXJ5IGFuZCB0aGVuIHJlbGluayB0byBwcm9kdWNlIGEgbW9kaWZpZWQgZXhlY3V0YWJs
ZSBjb250YWluaW5nIHRoZSBtb2RpZmllZCBMaWJyYXJ5LiAoSXQgaXMgdW5kZXJzdG9vZCB0aGF0
IHRoZSB1c2VyIHdobyBjaGFuZ2VzIHRoZSBjb250ZW50cyBvZiBkZWZpbml0aW9ucyBmaWxlcyBp
biB0aGUgTGlicmFyeSB3aWxsIG5vdCBuZWNlc3NhcmlseSBiZSBhYmxlIHRvIHJlY29tcGlsZSB0
aGUgYXBwbGljYXRpb24gdG8gdXNlIHRoZSBtb2RpZmllZCBkZWZpbml0aW9ucy4pCisjICAKKyMg
LSAgOC4gWW91IG1heSBub3QgY29weSwgbW9kaWZ5LCBzdWJsaWNlbnNlLCBsaW5rIHdpdGgsIG9y
IGRpc3RyaWJ1dGUKKyMgLXRoZSBMaWJyYXJ5IGV4Y2VwdCBhcyBleHByZXNzbHkgcHJvdmlkZWQg
dW5kZXIgdGhpcyBMaWNlbnNlLiAgQW55CisjIC1hdHRlbXB0IG90aGVyd2lzZSB0byBjb3B5LCBt
b2RpZnksIHN1YmxpY2Vuc2UsIGxpbmsgd2l0aCwgb3IKKyMgLWRpc3RyaWJ1dGUgdGhlIExpYnJh
cnkgaXMgdm9pZCwgYW5kIHdpbGwgYXV0b21hdGljYWxseSB0ZXJtaW5hdGUgeW91cgorIyAtcmln
aHRzIHVuZGVyIHRoaXMgTGljZW5zZS4gIEhvd2V2ZXIsIHBhcnRpZXMgd2hvIGhhdmUgcmVjZWl2
ZWQgY29waWVzLAorIyAtb3IgcmlnaHRzLCBmcm9tIHlvdSB1bmRlciB0aGlzIExpY2Vuc2Ugd2ls
bCBub3QgaGF2ZSB0aGVpciBsaWNlbnNlcworIyAtdGVybWluYXRlZCBzbyBsb25nIGFzIHN1Y2gg
cGFydGllcyByZW1haW4gaW4gZnVsbCBjb21wbGlhbmNlLgorIyArICAgICBiKSBVc2UgYSBzdWl0
YWJsZSBzaGFyZWQgbGlicmFyeSBtZWNoYW5pc20gZm9yIGxpbmtpbmcgd2l0aCB0aGUgTGlicmFy
eS4gQSBzdWl0YWJsZSBtZWNoYW5pc20gaXMgb25lIHRoYXQgKDEpIHVzZXMgYXQgcnVuIHRpbWUg
YSBjb3B5IG9mIHRoZSBsaWJyYXJ5IGFscmVhZHkgcHJlc2VudCBvbiB0aGUgdXNlcidzIGNvbXB1
dGVyIHN5c3RlbSwgcmF0aGVyIHRoYW4gY29weWluZyBsaWJyYXJ5IGZ1bmN0aW9ucyBpbnRvIHRo
ZSBleGVjdXRhYmxlLCBhbmQgKDIpIHdpbGwgb3BlcmF0ZSBwcm9wZXJseSB3aXRoIGEgbW9kaWZp
ZWQgdmVyc2lvbiBvZiB0aGUgbGlicmFyeSwgaWYgdGhlIHVzZXIgaW5zdGFsbHMgb25lLCBhcyBs
b25nIGFzIHRoZSBtb2RpZmllZCB2ZXJzaW9uIGlzIGludGVyZmFjZS1jb21wYXRpYmxlIHdpdGgg
dGhlIHZlcnNpb24gdGhhdCB0aGUgd29yayB3YXMgbWFkZSB3aXRoLgorIyAgCisjIC0gIDkuIFlv
dSBhcmUgbm90IHJlcXVpcmVkIHRvIGFjY2VwdCB0aGlzIExpY2Vuc2UsIHNpbmNlIHlvdSBoYXZl
IG5vdAorIyAtc2lnbmVkIGl0LiAgSG93ZXZlciwgbm90aGluZyBlbHNlIGdyYW50cyB5b3UgcGVy
bWlzc2lvbiB0byBtb2RpZnkgb3IKKyMgLWRpc3RyaWJ1dGUgdGhlIExpYnJhcnkgb3IgaXRzIGRl
cml2YXRpdmUgd29ya3MuICBUaGVzZSBhY3Rpb25zIGFyZQorIyAtcHJvaGliaXRlZCBieSBsYXcg
aWYgeW91IGRvIG5vdCBhY2NlcHQgdGhpcyBMaWNlbnNlLiAgVGhlcmVmb3JlLCBieQorIyAtbW9k
aWZ5aW5nIG9yIGRpc3RyaWJ1dGluZyB0aGUgTGlicmFyeSAob3IgYW55IHdvcmsgYmFzZWQgb24g
dGhlCisjIC1MaWJyYXJ5KSwgeW91IGluZGljYXRlIHlvdXIgYWNjZXB0YW5jZSBvZiB0aGlzIExp
Y2Vuc2UgdG8gZG8gc28sIGFuZAorIyAtYWxsIGl0cyB0ZXJtcyBhbmQgY29uZGl0aW9ucyBmb3Ig
Y29weWluZywgZGlzdHJpYnV0aW5nIG9yIG1vZGlmeWluZworIyAtdGhlIExpYnJhcnkgb3Igd29y
a3MgYmFzZWQgb24gaXQuCisjICsgICAgIGMpIEFjY29tcGFueSB0aGUgd29yayB3aXRoIGEgd3Jp
dHRlbiBvZmZlciwgdmFsaWQgZm9yIGF0IGxlYXN0IHRocmVlIHllYXJzLCB0byBnaXZlIHRoZSBz
YW1lIHVzZXIgdGhlIG1hdGVyaWFscyBzcGVjaWZpZWQgaW4gU3Vic2VjdGlvbiA2YSwgYWJvdmUs
IGZvciBhIGNoYXJnZSBubyBtb3JlIHRoYW4gdGhlIGNvc3Qgb2YgcGVyZm9ybWluZyB0aGlzIGRp
c3RyaWJ1dGlvbi4KKyMgIAorIyAtICAxMC4gRWFjaCB0aW1lIHlvdSByZWRpc3RyaWJ1dGUgdGhl
IExpYnJhcnkgKG9yIGFueSB3b3JrIGJhc2VkIG9uIHRoZQorIyAtTGlicmFyeSksIHRoZSByZWNp
cGllbnQgYXV0b21hdGljYWxseSByZWNlaXZlcyBhIGxpY2Vuc2UgZnJvbSB0aGUKKyMgLW9yaWdp
bmFsIGxpY2Vuc29yIHRvIGNvcHksIGRpc3RyaWJ1dGUsIGxpbmsgd2l0aCBvciBtb2RpZnkgdGhl
IExpYnJhcnkKKyMgLXN1YmplY3QgdG8gdGhlc2UgdGVybXMgYW5kIGNvbmRpdGlvbnMuICBZb3Ug
bWF5IG5vdCBpbXBvc2UgYW55IGZ1cnRoZXIKKyMgLXJlc3RyaWN0aW9ucyBvbiB0aGUgcmVjaXBp
ZW50cycgZXhlcmNpc2Ugb2YgdGhlIHJpZ2h0cyBncmFudGVkIGhlcmVpbi4KKyMgLVlvdSBhcmUg
bm90IHJlc3BvbnNpYmxlIGZvciBlbmZvcmNpbmcgY29tcGxpYW5jZSBieSB0aGlyZCBwYXJ0aWVz
IHdpdGgKKyMgLXRoaXMgTGljZW5zZS4KKyMgLQwKKyMgLSAgMTEuIElmLCBhcyBhIGNvbnNlcXVl
bmNlIG9mIGEgY291cnQganVkZ21lbnQgb3IgYWxsZWdhdGlvbiBvZiBwYXRlbnQKKyMgLWluZnJp
bmdlbWVudCBvciBmb3IgYW55IG90aGVyIHJlYXNvbiAobm90IGxpbWl0ZWQgdG8gcGF0ZW50IGlz
c3VlcyksCisjIC1jb25kaXRpb25zIGFyZSBpbXBvc2VkIG9uIHlvdSAod2hldGhlciBieSBjb3Vy
dCBvcmRlciwgYWdyZWVtZW50IG9yCisjIC1vdGhlcndpc2UpIHRoYXQgY29udHJhZGljdCB0aGUg
Y29uZGl0aW9ucyBvZiB0aGlzIExpY2Vuc2UsIHRoZXkgZG8gbm90CisjIC1leGN1c2UgeW91IGZy
b20gdGhlIGNvbmRpdGlvbnMgb2YgdGhpcyBMaWNlbnNlLiAgSWYgeW91IGNhbm5vdAorIyAtZGlz
dHJpYnV0ZSBzbyBhcyB0byBzYXRpc2Z5IHNpbXVsdGFuZW91c2x5IHlvdXIgb2JsaWdhdGlvbnMg
dW5kZXIgdGhpcworIyAtTGljZW5zZSBhbmQgYW55IG90aGVyIHBlcnRpbmVudCBvYmxpZ2F0aW9u
cywgdGhlbiBhcyBhIGNvbnNlcXVlbmNlIHlvdQorIyAtbWF5IG5vdCBkaXN0cmlidXRlIHRoZSBM
aWJyYXJ5IGF0IGFsbC4gIEZvciBleGFtcGxlLCBpZiBhIHBhdGVudAorIyAtbGljZW5zZSB3b3Vs
ZCBub3QgcGVybWl0IHJveWFsdHktZnJlZSByZWRpc3RyaWJ1dGlvbiBvZiB0aGUgTGlicmFyeSBi
eQorIyAtYWxsIHRob3NlIHdobyByZWNlaXZlIGNvcGllcyBkaXJlY3RseSBvciBpbmRpcmVjdGx5
IHRocm91Z2ggeW91LCB0aGVuCisjIC10aGUgb25seSB3YXkgeW91IGNvdWxkIHNhdGlzZnkgYm90
aCBpdCBhbmQgdGhpcyBMaWNlbnNlIHdvdWxkIGJlIHRvCisjIC1yZWZyYWluIGVudGlyZWx5IGZy
b20gZGlzdHJpYnV0aW9uIG9mIHRoZSBMaWJyYXJ5LgorIyArICAgICBkKSBJZiBkaXN0cmlidXRp
b24gb2YgdGhlIHdvcmsgaXMgbWFkZSBieSBvZmZlcmluZyBhY2Nlc3MgdG8gY29weSBmcm9tIGEg
ZGVzaWduYXRlZCBwbGFjZSwgb2ZmZXIgZXF1aXZhbGVudCBhY2Nlc3MgdG8gY29weSB0aGUgYWJv
dmUgc3BlY2lmaWVkIG1hdGVyaWFscyBmcm9tIHRoZSBzYW1lIHBsYWNlLgorIyAgCisjIC1JZiBh
bnkgcG9ydGlvbiBvZiB0aGlzIHNlY3Rpb24gaXMgaGVsZCBpbnZhbGlkIG9yIHVuZW5mb3JjZWFi
bGUgdW5kZXIgYW55CisjIC1wYXJ0aWN1bGFyIGNpcmN1bXN0YW5jZSwgdGhlIGJhbGFuY2Ugb2Yg
dGhlIHNlY3Rpb24gaXMgaW50ZW5kZWQgdG8gYXBwbHksCisjIC1hbmQgdGhlIHNlY3Rpb24gYXMg
YSB3aG9sZSBpcyBpbnRlbmRlZCB0byBhcHBseSBpbiBvdGhlciBjaXJjdW1zdGFuY2VzLgorIyAr
ICAgICBlKSBWZXJpZnkgdGhhdCB0aGUgdXNlciBoYXMgYWxyZWFkeSByZWNlaXZlZCBhIGNvcHkg
b2YgdGhlc2UgbWF0ZXJpYWxzIG9yIHRoYXQgeW91IGhhdmUgYWxyZWFkeSBzZW50IHRoaXMgdXNl
ciBhIGNvcHkuCisjICAKKyMgLUl0IGlzIG5vdCB0aGUgcHVycG9zZSBvZiB0aGlzIHNlY3Rpb24g
dG8gaW5kdWNlIHlvdSB0byBpbmZyaW5nZSBhbnkKKyMgLXBhdGVudHMgb3Igb3RoZXIgcHJvcGVy
dHkgcmlnaHQgY2xhaW1zIG9yIHRvIGNvbnRlc3QgdmFsaWRpdHkgb2YgYW55CisjIC1zdWNoIGNs
YWltczsgdGhpcyBzZWN0aW9uIGhhcyB0aGUgc29sZSBwdXJwb3NlIG9mIHByb3RlY3RpbmcgdGhl
CisjIC1pbnRlZ3JpdHkgb2YgdGhlIGZyZWUgc29mdHdhcmUgZGlzdHJpYnV0aW9uIHN5c3RlbSB3
aGljaCBpcworIyAtaW1wbGVtZW50ZWQgYnkgcHVibGljIGxpY2Vuc2UgcHJhY3RpY2VzLiAgTWFu
eSBwZW9wbGUgaGF2ZSBtYWRlCisjIC1nZW5lcm91cyBjb250cmlidXRpb25zIHRvIHRoZSB3aWRl
IHJhbmdlIG9mIHNvZnR3YXJlIGRpc3RyaWJ1dGVkCisjIC10aHJvdWdoIHRoYXQgc3lzdGVtIGlu
IHJlbGlhbmNlIG9uIGNvbnNpc3RlbnQgYXBwbGljYXRpb24gb2YgdGhhdAorIyAtc3lzdGVtOyBp
dCBpcyB1cCB0byB0aGUgYXV0aG9yL2Rvbm9yIHRvIGRlY2lkZSBpZiBoZSBvciBzaGUgaXMgd2ls
bGluZworIyAtdG8gZGlzdHJpYnV0ZSBzb2Z0d2FyZSB0aHJvdWdoIGFueSBvdGhlciBzeXN0ZW0g
YW5kIGEgbGljZW5zZWUgY2Fubm90CisjIC1pbXBvc2UgdGhhdCBjaG9pY2UuCisjICtGb3IgYW4g
ZXhlY3V0YWJsZSwgdGhlIHJlcXVpcmVkIGZvcm0gb2YgdGhlICJ3b3JrIHRoYXQgdXNlcyB0aGUg
TGlicmFyeSIgbXVzdCBpbmNsdWRlIGFueSBkYXRhIGFuZCB1dGlsaXR5IHByb2dyYW1zIG5lZWRl
ZCBmb3IgcmVwcm9kdWNpbmcgdGhlIGV4ZWN1dGFibGUgZnJvbSBpdC4gSG93ZXZlciwgYXMgYSBz
cGVjaWFsIGV4Y2VwdGlvbiwgdGhlIG1hdGVyaWFscyB0byBiZSBkaXN0cmlidXRlZCBuZWVkIG5v
dCBpbmNsdWRlIGFueXRoaW5nIHRoYXQgaXMgbm9ybWFsbHkgZGlzdHJpYnV0ZWQgKGluIGVpdGhl
ciBzb3VyY2Ugb3IgYmluYXJ5IGZvcm0pIHdpdGggdGhlIG1ham9yIGNvbXBvbmVudHMgKGNvbXBp
bGVyLCBrZXJuZWwsIGFuZCBzbyBvbikgb2YgdGhlIG9wZXJhdGluZyBzeXN0ZW0gb24gd2hpY2gg
dGhlIGV4ZWN1dGFibGUgcnVucywgdW5sZXNzIHRoYXQgY29tcG9uZW50IGl0c2VsZiBhY2NvbXBh
bmllcyB0aGUgZXhlY3V0YWJsZS4KKyMgIAorIyAtVGhpcyBzZWN0aW9uIGlzIGludGVuZGVkIHRv
IG1ha2UgdGhvcm91Z2hseSBjbGVhciB3aGF0IGlzIGJlbGlldmVkIHRvCisjIC1iZSBhIGNvbnNl
cXVlbmNlIG9mIHRoZSByZXN0IG9mIHRoaXMgTGljZW5zZS4KKyMgK0l0IG1heSBoYXBwZW4gdGhh
dCB0aGlzIHJlcXVpcmVtZW50IGNvbnRyYWRpY3RzIHRoZSBsaWNlbnNlIHJlc3RyaWN0aW9ucyBv
ZiBvdGhlciBwcm9wcmlldGFyeSBsaWJyYXJpZXMgdGhhdCBkbyBub3Qgbm9ybWFsbHkgYWNjb21w
YW55IHRoZSBvcGVyYXRpbmcgc3lzdGVtLiBTdWNoIGEgY29udHJhZGljdGlvbiBtZWFucyB5b3Ug
Y2Fubm90IHVzZSBib3RoIHRoZW0gYW5kIHRoZSBMaWJyYXJ5IHRvZ2V0aGVyIGluIGFuIGV4ZWN1
dGFibGUgdGhhdCB5b3UgZGlzdHJpYnV0ZS4KKyMgIAorIyAtICAxMi4gSWYgdGhlIGRpc3RyaWJ1
dGlvbiBhbmQvb3IgdXNlIG9mIHRoZSBMaWJyYXJ5IGlzIHJlc3RyaWN0ZWQgaW4KKyMgLWNlcnRh
aW4gY291bnRyaWVzIGVpdGhlciBieSBwYXRlbnRzIG9yIGJ5IGNvcHlyaWdodGVkIGludGVyZmFj
ZXMsIHRoZQorIyAtb3JpZ2luYWwgY29weXJpZ2h0IGhvbGRlciB3aG8gcGxhY2VzIHRoZSBMaWJy
YXJ5IHVuZGVyIHRoaXMgTGljZW5zZSBtYXkgYWRkCisjIC1hbiBleHBsaWNpdCBnZW9ncmFwaGlj
YWwgZGlzdHJpYnV0aW9uIGxpbWl0YXRpb24gZXhjbHVkaW5nIHRob3NlIGNvdW50cmllcywKKyMg
LXNvIHRoYXQgZGlzdHJpYnV0aW9uIGlzIHBlcm1pdHRlZCBvbmx5IGluIG9yIGFtb25nIGNvdW50
cmllcyBub3QgdGh1cworIyAtZXhjbHVkZWQuICBJbiBzdWNoIGNhc2UsIHRoaXMgTGljZW5zZSBp
bmNvcnBvcmF0ZXMgdGhlIGxpbWl0YXRpb24gYXMgaWYKKyMgLXdyaXR0ZW4gaW4gdGhlIGJvZHkg
b2YgdGhpcyBMaWNlbnNlLgorIyArNy4gWW91IG1heSBwbGFjZSBsaWJyYXJ5IGZhY2lsaXRpZXMg
dGhhdCBhcmUgYSB3b3JrIGJhc2VkIG9uIHRoZSBMaWJyYXJ5IHNpZGUtYnktc2lkZSBpbiBhIHNp
bmdsZSBsaWJyYXJ5IHRvZ2V0aGVyIHdpdGggb3RoZXIgbGlicmFyeSBmYWNpbGl0aWVzIG5vdCBj
b3ZlcmVkIGJ5IHRoaXMgTGljZW5zZSwgYW5kIGRpc3RyaWJ1dGUgc3VjaCBhIGNvbWJpbmVkIGxp
YnJhcnksIHByb3ZpZGVkIHRoYXQgdGhlIHNlcGFyYXRlIGRpc3RyaWJ1dGlvbiBvZiB0aGUgd29y
ayBiYXNlZCBvbiB0aGUgTGlicmFyeSBhbmQgb2YgdGhlIG90aGVyIGxpYnJhcnkgZmFjaWxpdGll
cyBpcyBvdGhlcndpc2UgcGVybWl0dGVkLCBhbmQgcHJvdmlkZWQgdGhhdCB5b3UgZG8gdGhlc2Ug
dHdvIHRoaW5nczoKKyMgIAorIyAtICAxMy4gVGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiBt
YXkgcHVibGlzaCByZXZpc2VkIGFuZC9vciBuZXcKKyMgLXZlcnNpb25zIG9mIHRoZSBMZXNzZXIg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmcm9tIHRpbWUgdG8gdGltZS4KKyMgLVN1Y2ggbmV3IHZl
cnNpb25zIHdpbGwgYmUgc2ltaWxhciBpbiBzcGlyaXQgdG8gdGhlIHByZXNlbnQgdmVyc2lvbiwK
KyMgLWJ1dCBtYXkgZGlmZmVyIGluIGRldGFpbCB0byBhZGRyZXNzIG5ldyBwcm9ibGVtcyBvciBj
b25jZXJucy4KKyMgKyAgICAgYSkgQWNjb21wYW55IHRoZSBjb21iaW5lZCBsaWJyYXJ5IHdpdGgg
YSBjb3B5IG9mIHRoZSBzYW1lIHdvcmsgYmFzZWQgb24gdGhlIExpYnJhcnksIHVuY29tYmluZWQg
d2l0aCBhbnkgb3RoZXIgbGlicmFyeSBmYWNpbGl0aWVzLiBUaGlzIG11c3QgYmUgZGlzdHJpYnV0
ZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBTZWN0aW9ucyBhYm92ZS4KKyMgIAorIyAtRWFjaCB2
ZXJzaW9uIGlzIGdpdmVuIGEgZGlzdGluZ3Vpc2hpbmcgdmVyc2lvbiBudW1iZXIuICBJZiB0aGUg
TGlicmFyeQorIyAtc3BlY2lmaWVzIGEgdmVyc2lvbiBudW1iZXIgb2YgdGhpcyBMaWNlbnNlIHdo
aWNoIGFwcGxpZXMgdG8gaXQgYW5kCisjIC0iYW55IGxhdGVyIHZlcnNpb24iLCB5b3UgaGF2ZSB0
aGUgb3B0aW9uIG9mIGZvbGxvd2luZyB0aGUgdGVybXMgYW5kCisjIC1jb25kaXRpb25zIGVpdGhl
ciBvZiB0aGF0IHZlcnNpb24gb3Igb2YgYW55IGxhdGVyIHZlcnNpb24gcHVibGlzaGVkIGJ5Cisj
IC10aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLiAgSWYgdGhlIExpYnJhcnkgZG9lcyBub3Qg
c3BlY2lmeSBhCisjIC1saWNlbnNlIHZlcnNpb24gbnVtYmVyLCB5b3UgbWF5IGNob29zZSBhbnkg
dmVyc2lvbiBldmVyIHB1Ymxpc2hlZCBieQorIyAtdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
bi4KKyMgLQwKKyMgLSAgMTQuIElmIHlvdSB3aXNoIHRvIGluY29ycG9yYXRlIHBhcnRzIG9mIHRo
ZSBMaWJyYXJ5IGludG8gb3RoZXIgZnJlZQorIyAtcHJvZ3JhbXMgd2hvc2UgZGlzdHJpYnV0aW9u
IGNvbmRpdGlvbnMgYXJlIGluY29tcGF0aWJsZSB3aXRoIHRoZXNlLAorIyAtd3JpdGUgdG8gdGhl
IGF1dGhvciB0byBhc2sgZm9yIHBlcm1pc3Npb24uICBGb3Igc29mdHdhcmUgd2hpY2ggaXMKKyMg
LWNvcHlyaWdodGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIHdyaXRlIHRvIHRo
ZSBGcmVlCisjIC1Tb2Z0d2FyZSBGb3VuZGF0aW9uOyB3ZSBzb21ldGltZXMgbWFrZSBleGNlcHRp
b25zIGZvciB0aGlzLiAgT3VyCisjIC1kZWNpc2lvbiB3aWxsIGJlIGd1aWRlZCBieSB0aGUgdHdv
IGdvYWxzIG9mIHByZXNlcnZpbmcgdGhlIGZyZWUgc3RhdHVzCisjIC1vZiBhbGwgZGVyaXZhdGl2
ZXMgb2Ygb3VyIGZyZWUgc29mdHdhcmUgYW5kIG9mIHByb21vdGluZyB0aGUgc2hhcmluZworIyAt
YW5kIHJldXNlIG9mIHNvZnR3YXJlIGdlbmVyYWxseS4KKyMgKyAgICAgYikgR2l2ZSBwcm9taW5l
bnQgbm90aWNlIHdpdGggdGhlIGNvbWJpbmVkIGxpYnJhcnkgb2YgdGhlIGZhY3QgdGhhdCBwYXJ0
IG9mIGl0IGlzIGEgd29yayBiYXNlZCBvbiB0aGUgTGlicmFyeSwgYW5kIGV4cGxhaW5pbmcgd2hl
cmUgdG8gZmluZCB0aGUgYWNjb21wYW55aW5nIHVuY29tYmluZWQgZm9ybSBvZiB0aGUgc2FtZSB3
b3JrLgorIyAgCisjIC0JCQkgICAgTk8gV0FSUkFOVFkKKyMgKzguIFlvdSBtYXkgbm90IGNvcHks
IG1vZGlmeSwgc3VibGljZW5zZSwgbGluayB3aXRoLCBvciBkaXN0cmlidXRlIHRoZSBMaWJyYXJ5
IGV4Y2VwdCBhcyBleHByZXNzbHkgcHJvdmlkZWQgdW5kZXIgdGhpcyBMaWNlbnNlLiBBbnkgYXR0
ZW1wdCBvdGhlcndpc2UgdG8gY29weSwgbW9kaWZ5LCBzdWJsaWNlbnNlLCBsaW5rIHdpdGgsIG9y
IGRpc3RyaWJ1dGUgdGhlIExpYnJhcnkgaXMgdm9pZCwgYW5kIHdpbGwgYXV0b21hdGljYWxseSB0
ZXJtaW5hdGUgeW91ciByaWdodHMgdW5kZXIgdGhpcyBMaWNlbnNlLiBIb3dldmVyLCBwYXJ0aWVz
IHdobyBoYXZlIHJlY2VpdmVkIGNvcGllcywgb3IgcmlnaHRzLCBmcm9tIHlvdSB1bmRlciB0aGlz
IExpY2Vuc2Ugd2lsbCBub3QgaGF2ZSB0aGVpciBsaWNlbnNlcyB0ZXJtaW5hdGVkIHNvIGxvbmcg
YXMgc3VjaCBwYXJ0aWVzIHJlbWFpbiBpbiBmdWxsIGNvbXBsaWFuY2UuCisjICAKKyMgLSAgMTUu
IEJFQ0FVU0UgVEhFIExJQlJBUlkgSVMgTElDRU5TRUQgRlJFRSBPRiBDSEFSR0UsIFRIRVJFIElT
IE5PCisjIC1XQVJSQU5UWSBGT1IgVEhFIExJQlJBUlksIFRPIFRIRSBFWFRFTlQgUEVSTUlUVEVE
IEJZIEFQUExJQ0FCTEUgTEFXLgorIyAtRVhDRVBUIFdIRU4gT1RIRVJXSVNFIFNUQVRFRCBJTiBX
UklUSU5HIFRIRSBDT1BZUklHSFQgSE9MREVSUyBBTkQvT1IKKyMgLU9USEVSIFBBUlRJRVMgUFJP
VklERSBUSEUgTElCUkFSWSAiQVMgSVMiIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZCisjIC1LSU5E
LCBFSVRIRVIgRVhQUkVTU0VEIE9SIElNUExJRUQsIElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVE
IFRPLCBUSEUKKyMgLUlNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJ
VE5FU1MgRk9SIEEgUEFSVElDVUxBUgorIyAtUFVSUE9TRS4gIFRIRSBFTlRJUkUgUklTSyBBUyBU
TyBUSEUgUVVBTElUWSBBTkQgUEVSRk9STUFOQ0UgT0YgVEhFCisjIC1MSUJSQVJZIElTIFdJVEgg
WU9VLiAgU0hPVUxEIFRIRSBMSUJSQVJZIFBST1ZFIERFRkVDVElWRSwgWU9VIEFTU1VNRQorIyAt
VEhFIENPU1QgT0YgQUxMIE5FQ0VTU0FSWSBTRVJWSUNJTkcsIFJFUEFJUiBPUiBDT1JSRUNUSU9O
LgorIyArOS4gWW91IGFyZSBub3QgcmVxdWlyZWQgdG8gYWNjZXB0IHRoaXMgTGljZW5zZSwgc2lu
Y2UgeW91IGhhdmUgbm90IHNpZ25lZCBpdC4gSG93ZXZlciwgbm90aGluZyBlbHNlIGdyYW50cyB5
b3UgcGVybWlzc2lvbiB0byBtb2RpZnkgb3IgZGlzdHJpYnV0ZSB0aGUgTGlicmFyeSBvciBpdHMg
ZGVyaXZhdGl2ZSB3b3Jrcy4gVGhlc2UgYWN0aW9ucyBhcmUgcHJvaGliaXRlZCBieSBsYXcgaWYg
eW91IGRvIG5vdCBhY2NlcHQgdGhpcyBMaWNlbnNlLiBUaGVyZWZvcmUsIGJ5IG1vZGlmeWluZyBv
ciBkaXN0cmlidXRpbmcgdGhlIExpYnJhcnkgKG9yIGFueSB3b3JrIGJhc2VkIG9uIHRoZSBMaWJy
YXJ5KSwgeW91IGluZGljYXRlIHlvdXIgYWNjZXB0YW5jZSBvZiB0aGlzIExpY2Vuc2UgdG8gZG8g
c28sIGFuZCBhbGwgaXRzIHRlcm1zIGFuZCBjb25kaXRpb25zIGZvciBjb3B5aW5nLCBkaXN0cmli
dXRpbmcgb3IgbW9kaWZ5aW5nIHRoZSBMaWJyYXJ5IG9yIHdvcmtzIGJhc2VkIG9uIGl0LgorIyAg
CisjIC0gIDE2LiBJTiBOTyBFVkVOVCBVTkxFU1MgUkVRVUlSRUQgQlkgQVBQTElDQUJMRSBMQVcg
T1IgQUdSRUVEIFRPIElOCisjIC1XUklUSU5HIFdJTEwgQU5ZIENPUFlSSUdIVCBIT0xERVIsIE9S
IEFOWSBPVEhFUiBQQVJUWSBXSE8gTUFZIE1PRElGWQorIyAtQU5EL09SIFJFRElTVFJJQlVURSBU
SEUgTElCUkFSWSBBUyBQRVJNSVRURUQgQUJPVkUsIEJFIExJQUJMRSBUTyBZT1UKKyMgLUZPUiBE
QU1BR0VTLCBJTkNMVURJTkcgQU5ZIEdFTkVSQUwsIFNQRUNJQUwsIElOQ0lERU5UQUwgT1IKKyMg
LUNPTlNFUVVFTlRJQUwgREFNQUdFUyBBUklTSU5HIE9VVCBPRiBUSEUgVVNFIE9SIElOQUJJTElU
WSBUTyBVU0UgVEhFCisjIC1MSUJSQVJZIChJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIExP
U1MgT0YgREFUQSBPUiBEQVRBIEJFSU5HCisjIC1SRU5ERVJFRCBJTkFDQ1VSQVRFIE9SIExPU1NF
UyBTVVNUQUlORUQgQlkgWU9VIE9SIFRISVJEIFBBUlRJRVMgT1IgQQorIyAtRkFJTFVSRSBPRiBU
SEUgTElCUkFSWSBUTyBPUEVSQVRFIFdJVEggQU5ZIE9USEVSIFNPRlRXQVJFKSwgRVZFTiBJRgor
IyAtU1VDSCBIT0xERVIgT1IgT1RIRVIgUEFSVFkgSEFTIEJFRU4gQURWSVNFRCBPRiBUSEUgUE9T
U0lCSUxJVFkgT0YgU1VDSAorIyAtREFNQUdFUy4KKyMgKzEwLiBFYWNoIHRpbWUgeW91IHJlZGlz
dHJpYnV0ZSB0aGUgTGlicmFyeSAob3IgYW55IHdvcmsgYmFzZWQgb24gdGhlIExpYnJhcnkpLCB0
aGUgcmVjaXBpZW50IGF1dG9tYXRpY2FsbHkgcmVjZWl2ZXMgYSBsaWNlbnNlIGZyb20gdGhlIG9y
aWdpbmFsIGxpY2Vuc29yIHRvIGNvcHksIGRpc3RyaWJ1dGUsIGxpbmsgd2l0aCBvciBtb2RpZnkg
dGhlIExpYnJhcnkgc3ViamVjdCB0byB0aGVzZSB0ZXJtcyBhbmQgY29uZGl0aW9ucy4gWW91IG1h
eSBub3QgaW1wb3NlIGFueSBmdXJ0aGVyIHJlc3RyaWN0aW9ucyBvbiB0aGUgcmVjaXBpZW50cycg
ZXhlcmNpc2Ugb2YgdGhlIHJpZ2h0cyBncmFudGVkIGhlcmVpbi4gWW91IGFyZSBub3QgcmVzcG9u
c2libGUgZm9yIGVuZm9yY2luZyBjb21wbGlhbmNlIGJ5IHRoaXJkIHBhcnRpZXMgd2l0aCB0aGlz
IExpY2Vuc2UuCisjICAKKyMgLQkJICAgICBFTkQgT0YgVEVSTVMgQU5EIENPTkRJVElPTlMKKyMg
LQwKKyMgLSAgICAgICAgICAgSG93IHRvIEFwcGx5IFRoZXNlIFRlcm1zIHRvIFlvdXIgTmV3IExp
YnJhcmllcworIyArMTEuIElmLCBhcyBhIGNvbnNlcXVlbmNlIG9mIGEgY291cnQganVkZ21lbnQg
b3IgYWxsZWdhdGlvbiBvZiBwYXRlbnQgaW5mcmluZ2VtZW50IG9yIGZvciBhbnkgb3RoZXIgcmVh
c29uIChub3QgbGltaXRlZCB0byBwYXRlbnQgaXNzdWVzKSwgY29uZGl0aW9ucyBhcmUgaW1wb3Nl
ZCBvbiB5b3UgKHdoZXRoZXIgYnkgY291cnQgb3JkZXIsIGFncmVlbWVudCBvciBvdGhlcndpc2Up
IHRoYXQgY29udHJhZGljdCB0aGUgY29uZGl0aW9ucyBvZiB0aGlzIExpY2Vuc2UsIHRoZXkgZG8g
bm90IGV4Y3VzZSB5b3UgZnJvbSB0aGUgY29uZGl0aW9ucyBvZiB0aGlzIExpY2Vuc2UuIElmIHlv
dSBjYW5ub3QgZGlzdHJpYnV0ZSBzbyBhcyB0byBzYXRpc2Z5IHNpbXVsdGFuZW91c2x5IHlvdXIg
b2JsaWdhdGlvbnMgdW5kZXIgdGhpcyBMaWNlbnNlIGFuZCBhbnkgb3RoZXIgcGVydGluZW50IG9i
bGlnYXRpb25zLCB0aGVuIGFzIGEgY29uc2VxdWVuY2UgeW91IG1heSBub3QgZGlzdHJpYnV0ZSB0
aGUgTGlicmFyeSBhdCBhbGwuIEZvciBleGFtcGxlLCBpZiBhIHBhdGVudCBsaWNlbnNlIHdvdWxk
IG5vdCBwZXJtaXQgcm95YWx0eS1mcmVlIHJlZGlzdHJpYnV0aW9uIG9mIHRoZSBMaWJyYXJ5IGJ5
IGFsbCB0aG9zZSB3aG8gcmVjZWl2ZSBjb3BpZXMgZGlyZWN0bHkgb3IgaW5kaXJlY3RseSB0aHJv
dWdoIHlvdSwgdGhlbiB0aGUgb25seSB3YXkgeW91IGNvdWxkIHNhdGlzZnkgYm90aCBpdCBhbmQg
dGhpcyBMaWNlbnNlIHdvdWxkIGJlIHRvIHJlZnJhaW4gZW50aXJlbHkgZnJvbSBkaXN0cmlidXRp
b24gb2YgdGhlIExpYnJhcnkuCisjICAKKyMgLSAgSWYgeW91IGRldmVsb3AgYSBuZXcgbGlicmFy
eSwgYW5kIHlvdSB3YW50IGl0IHRvIGJlIG9mIHRoZSBncmVhdGVzdAorIyAtcG9zc2libGUgdXNl
IHRvIHRoZSBwdWJsaWMsIHdlIHJlY29tbWVuZCBtYWtpbmcgaXQgZnJlZSBzb2Z0d2FyZSB0aGF0
CisjIC1ldmVyeW9uZSBjYW4gcmVkaXN0cmlidXRlIGFuZCBjaGFuZ2UuICBZb3UgY2FuIGRvIHNv
IGJ5IHBlcm1pdHRpbmcKKyMgLXJlZGlzdHJpYnV0aW9uIHVuZGVyIHRoZXNlIHRlcm1zIChvciwg
YWx0ZXJuYXRpdmVseSwgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZQorIyAtb3JkaW5hcnkgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSkuCisjICtJZiBhbnkgcG9ydGlvbiBvZiB0aGlzIHNlY3Rpb24gaXMg
aGVsZCBpbnZhbGlkIG9yIHVuZW5mb3JjZWFibGUgdW5kZXIgYW55IHBhcnRpY3VsYXIgY2lyY3Vt
c3RhbmNlLCB0aGUgYmFsYW5jZSBvZiB0aGUgc2VjdGlvbiBpcyBpbnRlbmRlZCB0byBhcHBseSwg
YW5kIHRoZSBzZWN0aW9uIGFzIGEgd2hvbGUgaXMgaW50ZW5kZWQgdG8gYXBwbHkgaW4gb3RoZXIg
Y2lyY3Vtc3RhbmNlcy4KKyMgIAorIyAtICBUbyBhcHBseSB0aGVzZSB0ZXJtcywgYXR0YWNoIHRo
ZSBmb2xsb3dpbmcgbm90aWNlcyB0byB0aGUgbGlicmFyeS4gIEl0IGlzCisjIC1zYWZlc3QgdG8g
YXR0YWNoIHRoZW0gdG8gdGhlIHN0YXJ0IG9mIGVhY2ggc291cmNlIGZpbGUgdG8gbW9zdCBlZmZl
Y3RpdmVseQorIyAtY29udmV5IHRoZSBleGNsdXNpb24gb2Ygd2FycmFudHk7IGFuZCBlYWNoIGZp
bGUgc2hvdWxkIGhhdmUgYXQgbGVhc3QgdGhlCisjIC0iY29weXJpZ2h0IiBsaW5lIGFuZCBhIHBv
aW50ZXIgdG8gd2hlcmUgdGhlIGZ1bGwgbm90aWNlIGlzIGZvdW5kLgorIyArSXQgaXMgbm90IHRo
ZSBwdXJwb3NlIG9mIHRoaXMgc2VjdGlvbiB0byBpbmR1Y2UgeW91IHRvIGluZnJpbmdlIGFueSBw
YXRlbnRzIG9yIG90aGVyIHByb3BlcnR5IHJpZ2h0IGNsYWltcyBvciB0byBjb250ZXN0IHZhbGlk
aXR5IG9mIGFueSBzdWNoIGNsYWltczsgdGhpcyBzZWN0aW9uIGhhcyB0aGUgc29sZSBwdXJwb3Nl
IG9mIHByb3RlY3RpbmcgdGhlIGludGVncml0eSBvZiB0aGUgZnJlZSBzb2Z0d2FyZSBkaXN0cmli
dXRpb24gc3lzdGVtIHdoaWNoIGlzIGltcGxlbWVudGVkIGJ5IHB1YmxpYyBsaWNlbnNlIHByYWN0
aWNlcy4gTWFueSBwZW9wbGUgaGF2ZSBtYWRlIGdlbmVyb3VzIGNvbnRyaWJ1dGlvbnMgdG8gdGhl
IHdpZGUgcmFuZ2Ugb2Ygc29mdHdhcmUgZGlzdHJpYnV0ZWQgdGhyb3VnaCB0aGF0IHN5c3RlbSBp
biByZWxpYW5jZSBvbiBjb25zaXN0ZW50IGFwcGxpY2F0aW9uIG9mIHRoYXQgc3lzdGVtOyBpdCBp
cyB1cCB0byB0aGUgYXV0aG9yL2Rvbm9yIHRvIGRlY2lkZSBpZiBoZSBvciBzaGUgaXMgd2lsbGlu
ZyB0byBkaXN0cmlidXRlIHNvZnR3YXJlIHRocm91Z2ggYW55IG90aGVyIHN5c3RlbSBhbmQgYSBs
aWNlbnNlZSBjYW5ub3QgaW1wb3NlIHRoYXQgY2hvaWNlLgorIyAgCisjIC0gICAgPG9uZSBsaW5l
IHRvIGdpdmUgdGhlIGxpYnJhcnkncyBuYW1lIGFuZCBhIGJyaWVmIGlkZWEgb2Ygd2hhdCBpdCBk
b2VzLj4KKyMgLSAgICBDb3B5cmlnaHQgKEMpIDx5ZWFyPiAgPG5hbWUgb2YgYXV0aG9yPgorIyAr
VGhpcyBzZWN0aW9uIGlzIGludGVuZGVkIHRvIG1ha2UgdGhvcm91Z2hseSBjbGVhciB3aGF0IGlz
IGJlbGlldmVkIHRvIGJlIGEgY29uc2VxdWVuY2Ugb2YgdGhlIHJlc3Qgb2YgdGhpcyBMaWNlbnNl
LgorIyAgCisjIC0gICAgVGhpcyBsaWJyYXJ5IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVk
aXN0cmlidXRlIGl0IGFuZC9vcgorIyAtICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyMgLSAgICBMaWNlbnNlIGFzIHB1Ymxpc2hl
ZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIKKyMgLSAgICB2ZXJzaW9u
IDIuMSBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lv
bi4KKyMgKzEyLiBJZiB0aGUgZGlzdHJpYnV0aW9uIGFuZC9vciB1c2Ugb2YgdGhlIExpYnJhcnkg
aXMgcmVzdHJpY3RlZCBpbiBjZXJ0YWluIGNvdW50cmllcyBlaXRoZXIgYnkgcGF0ZW50cyBvciBi
eSBjb3B5cmlnaHRlZCBpbnRlcmZhY2VzLCB0aGUgb3JpZ2luYWwgY29weXJpZ2h0IGhvbGRlciB3
aG8gcGxhY2VzIHRoZSBMaWJyYXJ5IHVuZGVyIHRoaXMgTGljZW5zZSBtYXkgYWRkIGFuIGV4cGxp
Y2l0IGdlb2dyYXBoaWNhbCBkaXN0cmlidXRpb24gbGltaXRhdGlvbiBleGNsdWRpbmcgdGhvc2Ug
Y291bnRyaWVzLCBzbyB0aGF0IGRpc3RyaWJ1dGlvbiBpcyBwZXJtaXR0ZWQgb25seSBpbiBvciBh
bW9uZyBjb3VudHJpZXMgbm90IHRodXMgZXhjbHVkZWQuIEluIHN1Y2ggY2FzZSwgdGhpcyBMaWNl
bnNlIGluY29ycG9yYXRlcyB0aGUgbGltaXRhdGlvbiBhcyBpZiB3cml0dGVuIGluIHRoZSBib2R5
IG9mIHRoaXMgTGljZW5zZS4KKyMgIAorIyAtICAgIFRoaXMgbGlicmFyeSBpcyBkaXN0cmlidXRl
ZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorIyAtICAgIGJ1dCBXSVRIT1VU
IEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisjIC0g
ICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAg
U2VlIHRoZSBHTlUKKyMgLSAgICBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9y
ZSBkZXRhaWxzLgorIyArMTMuIFRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24gbWF5IHB1Ymxp
c2ggcmV2aXNlZCBhbmQvb3IgbmV3IHZlcnNpb25zIG9mIHRoZSBMZXNzZXIgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBmcm9tIHRpbWUgdG8gdGltZS4gU3VjaCBuZXcgdmVyc2lvbnMgd2lsbCBiZSBz
aW1pbGFyIGluIHNwaXJpdCB0byB0aGUgcHJlc2VudCB2ZXJzaW9uLCBidXQgbWF5IGRpZmZlciBp
biBkZXRhaWwgdG8gYWRkcmVzcyBuZXcgcHJvYmxlbXMgb3IgY29uY2VybnMuCisjICAKKyMgLSAg
ICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVy
YWwgUHVibGljCisjIC0gICAgTGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgbGlicmFyeTsgaWYgbm90
LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQorIyAtICAgIEZvdW5kYXRpb24sIEluYy4sIDU5
IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1BICAwMjExMS0xMzA3ICBVU0EKKyMg
K0VhY2ggdmVyc2lvbiBpcyBnaXZlbiBhIGRpc3Rpbmd1aXNoaW5nIHZlcnNpb24gbnVtYmVyLiBJ
ZiB0aGUgTGlicmFyeSBzcGVjaWZpZXMgYSB2ZXJzaW9uIG51bWJlciBvZiB0aGlzIExpY2Vuc2Ug
d2hpY2ggYXBwbGllcyB0byBpdCBhbmQgImFueSBsYXRlciB2ZXJzaW9uIiwgeW91IGhhdmUgdGhl
IG9wdGlvbiBvZiBmb2xsb3dpbmcgdGhlIHRlcm1zIGFuZCBjb25kaXRpb25zIGVpdGhlciBvZiB0
aGF0IHZlcnNpb24gb3Igb2YgYW55IGxhdGVyIHZlcnNpb24gcHVibGlzaGVkIGJ5IHRoZSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb24uIElmIHRoZSBMaWJyYXJ5IGRvZXMgbm90IHNwZWNpZnkgYSBs
aWNlbnNlIHZlcnNpb24gbnVtYmVyLCB5b3UgbWF5IGNob29zZSBhbnkgdmVyc2lvbiBldmVyIHB1
Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgorIyAgCisjIC1BbHNvIGFk
ZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFjdCB5b3UgYnkgZWxlY3Ryb25pYyBhbmQgcGFw
ZXIgbWFpbC4KKyMgKzE0LiBJZiB5b3Ugd2lzaCB0byBpbmNvcnBvcmF0ZSBwYXJ0cyBvZiB0aGUg
TGlicmFyeSBpbnRvIG90aGVyIGZyZWUgcHJvZ3JhbXMgd2hvc2UgZGlzdHJpYnV0aW9uIGNvbmRp
dGlvbnMgYXJlIGluY29tcGF0aWJsZSB3aXRoIHRoZXNlLCB3cml0ZSB0byB0aGUgYXV0aG9yIHRv
IGFzayBmb3IgcGVybWlzc2lvbi4gRm9yIHNvZnR3YXJlIHdoaWNoIGlzIGNvcHlyaWdodGVkIGJ5
IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb247IHdlIHNvbWV0aW1lcyBtYWtlIGV4Y2VwdGlvbnMgZm9yIHRoaXMuIE91ciBk
ZWNpc2lvbiB3aWxsIGJlIGd1aWRlZCBieSB0aGUgdHdvIGdvYWxzIG9mIHByZXNlcnZpbmcgdGhl
IGZyZWUgc3RhdHVzIG9mIGFsbCBkZXJpdmF0aXZlcyBvZiBvdXIgZnJlZSBzb2Z0d2FyZSBhbmQg
b2YgcHJvbW90aW5nIHRoZSBzaGFyaW5nIGFuZCByZXVzZSBvZiBzb2Z0d2FyZSBnZW5lcmFsbHku
CisjICAKKyMgLVlvdSBzaG91bGQgYWxzbyBnZXQgeW91ciBlbXBsb3llciAoaWYgeW91IHdvcmsg
YXMgYSBwcm9ncmFtbWVyKSBvciB5b3VyCisjIC1zY2hvb2wsIGlmIGFueSwgdG8gc2lnbiBhICJj
b3B5cmlnaHQgZGlzY2xhaW1lciIgZm9yIHRoZSBsaWJyYXJ5LCBpZgorIyAtbmVjZXNzYXJ5LiAg
SGVyZSBpcyBhIHNhbXBsZTsgYWx0ZXIgdGhlIG5hbWVzOgorIyArTk8gV0FSUkFOVFkKKyMgIAor
IyAtICBZb3lvZHluZSwgSW5jLiwgaGVyZWJ5IGRpc2NsYWltcyBhbGwgY29weXJpZ2h0IGludGVy
ZXN0IGluIHRoZQorIyAtICBsaWJyYXJ5IGBGcm9iJyAoYSBsaWJyYXJ5IGZvciB0d2Vha2luZyBr
bm9icykgd3JpdHRlbiBieSBKYW1lcyBSYW5kb20gSGFja2VyLgorIyArMTUuIEJFQ0FVU0UgVEhF
IExJQlJBUlkgSVMgTElDRU5TRUQgRlJFRSBPRiBDSEFSR0UsIFRIRVJFIElTIE5PIFdBUlJBTlRZ
IEZPUiBUSEUgTElCUkFSWSwgVE8gVEhFIEVYVEVOVCBQRVJNSVRURUQgQlkgQVBQTElDQUJMRSBM
QVcuIEVYQ0VQVCBXSEVOIE9USEVSV0lTRSBTVEFURUQgSU4gV1JJVElORyBUSEUgQ09QWVJJR0hU
IEhPTERFUlMgQU5EL09SIE9USEVSIFBBUlRJRVMgUFJPVklERSBUSEUgTElCUkFSWSAiQVMgSVMi
IFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVJVEhFUiBFWFBSRVNTRUQgT1IgSU1QTElF
RCwgSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFRIRSBJTVBMSUVEIFdBUlJBTlRJRVMg
T0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4g
VEhFIEVOVElSRSBSSVNLIEFTIFRPIFRIRSBRVUFMSVRZIEFORCBQRVJGT1JNQU5DRSBPRiBUSEUg
TElCUkFSWSBJUyBXSVRIIFlPVS4gU0hPVUxEIFRIRSBMSUJSQVJZIFBST1ZFIERFRkVDVElWRSwg
WU9VIEFTU1VNRSBUSEUgQ09TVCBPRiBBTEwgTkVDRVNTQVJZIFNFUlZJQ0lORywgUkVQQUlSIE9S
IENPUlJFQ1RJT04uCisjICAKKyMgLSAgPHNpZ25hdHVyZSBvZiBUeSBDb29uPiwgMSBBcHJpbCAx
OTkwCisjIC0gIFR5IENvb24sIFByZXNpZGVudCBvZiBWaWNlCisjICsxNi4gSU4gTk8gRVZFTlQg
VU5MRVNTIFJFUVVJUkVEIEJZIEFQUExJQ0FCTEUgTEFXIE9SIEFHUkVFRCBUTyBJTiBXUklUSU5H
IFdJTEwgQU5ZIENPUFlSSUdIVCBIT0xERVIsIE9SIEFOWSBPVEhFUiBQQVJUWSBXSE8gTUFZIE1P
RElGWSBBTkQvT1IgUkVESVNUUklCVVRFIFRIRSBMSUJSQVJZIEFTIFBFUk1JVFRFRCBBQk9WRSwg
QkUgTElBQkxFIFRPIFlPVSBGT1IgREFNQUdFUywgSU5DTFVESU5HIEFOWSBHRU5FUkFMLCBTUEVD
SUFMLCBJTkNJREVOVEFMIE9SIENPTlNFUVVFTlRJQUwgREFNQUdFUyBBUklTSU5HIE9VVCBPRiBU
SEUgVVNFIE9SIElOQUJJTElUWSBUTyBVU0UgVEhFIExJQlJBUlkgKElOQ0xVRElORyBCVVQgTk9U
IExJTUlURUQgVE8gTE9TUyBPRiBEQVRBIE9SIERBVEEgQkVJTkcgUkVOREVSRUQgSU5BQ0NVUkFU
RSBPUiBMT1NTRVMgU1VTVEFJTkVEIEJZIFlPVSBPUiBUSElSRCBQQVJUSUVTIE9SIEEgRkFJTFVS
RSBPRiBUSEUgTElCUkFSWSBUTyBPUEVSQVRFIFdJVEggQU5ZIE9USEVSIFNPRlRXQVJFKSwgRVZF
TiBJRiBTVUNIIEhPTERFUiBPUiBPVEhFUiBQQVJUWSBIQVMgQkVFTiBBRFZJU0VEIE9GIFRIRSBQ
T1NTSUJJTElUWSBPRiBTVUNIIERBTUFHRVMuCisjICAKKyMgK0VORCBPRiBURVJNUyBBTkQgQ09O
RElUSU9OUworIyArCisjICtIb3cgdG8gQXBwbHkgVGhlc2UgVGVybXMgdG8gWW91ciBOZXcgTGli
cmFyaWVzCisjICsKKyMgK0lmIHlvdSBkZXZlbG9wIGEgbmV3IGxpYnJhcnksIGFuZCB5b3Ugd2Fu
dCBpdCB0byBiZSBvZiB0aGUgZ3JlYXRlc3QgcG9zc2libGUgdXNlIHRvIHRoZSBwdWJsaWMsIHdl
IHJlY29tbWVuZCBtYWtpbmcgaXQgZnJlZSBzb2Z0d2FyZSB0aGF0IGV2ZXJ5b25lIGNhbiByZWRp
c3RyaWJ1dGUgYW5kIGNoYW5nZS4gWW91IGNhbiBkbyBzbyBieSBwZXJtaXR0aW5nIHJlZGlzdHJp
YnV0aW9uIHVuZGVyIHRoZXNlIHRlcm1zIChvciwgYWx0ZXJuYXRpdmVseSwgdW5kZXIgdGhlIHRl
cm1zIG9mIHRoZSBvcmRpbmFyeSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlKS4KKyMgKworIyArVG8g
YXBwbHkgdGhlc2UgdGVybXMsIGF0dGFjaCB0aGUgZm9sbG93aW5nIG5vdGljZXMgdG8gdGhlIGxp
YnJhcnkuIEl0IGlzIHNhZmVzdCB0byBhdHRhY2ggdGhlbSB0byB0aGUgc3RhcnQgb2YgZWFjaCBz
b3VyY2UgZmlsZSB0byBtb3N0IGVmZmVjdGl2ZWx5IGNvbnZleSB0aGUgZXhjbHVzaW9uIG9mIHdh
cnJhbnR5OyBhbmQgZWFjaCBmaWxlIHNob3VsZCBoYXZlIGF0IGxlYXN0IHRoZSAiY29weXJpZ2h0
IiBsaW5lIGFuZCBhIHBvaW50ZXIgdG8gd2hlcmUgdGhlIGZ1bGwgbm90aWNlIGlzIGZvdW5kLgor
IyArCisjICsgICAgIG9uZSBsaW5lIHRvIGdpdmUgdGhlIGxpYnJhcnkncyBuYW1lIGFuZCBhbiBp
ZGVhIG9mIHdoYXQgaXQgZG9lcy4KKyMgKyAgICAgQ29weXJpZ2h0IChDKSB5ZWFyICBuYW1lIG9m
IGF1dGhvcgorIyArCisjICsgICAgIFRoaXMgbGlicmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5b3Ug
Y2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vu
c2UsIG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisjICsKKyMgKyAgICAg
VGhpcyBsaWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1
c2VmdWwsIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVk
IHdhcnJhbnR5IG9mIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIg
UFVSUE9TRS4gIFNlZSB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBt
b3JlIGRldGFpbHMuCisjICsKKyMgKyAgICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29w
eSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25nIHdpdGggdGhp
cyBsaWJyYXJ5OyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24s
IEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgIDAyMTEw
LTEzMDEgIFVTQSBBbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFjdCB5b3UgYnkg
ZWxlY3Ryb25pYyBhbmQgcGFwZXIgbWFpbC4KKyMgKworIyArWW91IHNob3VsZCBhbHNvIGdldCB5
b3VyIGVtcGxveWVyIChpZiB5b3Ugd29yayBhcyBhIHByb2dyYW1tZXIpIG9yIHlvdXIgc2Nob29s
LCBpZiBhbnksIHRvIHNpZ24gYSAiY29weXJpZ2h0IGRpc2NsYWltZXIiIGZvciB0aGUgbGlicmFy
eSwgaWYgbmVjZXNzYXJ5LiBIZXJlIGlzIGEgc2FtcGxlOyBhbHRlciB0aGUgbmFtZXM6CisjICsK
KyMgK1lveW9keW5lLCBJbmMuLCBoZXJlYnkgZGlzY2xhaW1zIGFsbCBjb3B5cmlnaHQgaW50ZXJl
c3QgaW4KKyMgK3RoZSBsaWJyYXJ5IGBGcm9iJyAoYSBsaWJyYXJ5IGZvciB0d2Vha2luZyBrbm9i
cykgd3JpdHRlbgorIyArYnkgSmFtZXMgUmFuZG9tIEhhY2tlci4KKyMgKworIyArc2lnbmF0dXJl
IG9mIFR5IENvb24sIDEgQXByaWwgMTk5MAorIyArVHkgQ29vbiwgUHJlc2lkZW50IG9mIFZpY2UK
KyMgIFRoYXQncyBhbGwgdGhlcmUgaXMgdG8gaXQhCisjIC0KKyMgLQorIyAKKyMKKworU1VNTUFS
WSA9ICJKU09OLUdMaWIgaW1wbGVtZW50cyBhIGZ1bGwgSlNPTiBwYXJzZXIgdXNpbmcgR0xpYiBh
bmQgR09iamVjdCIKK0RFU0NSSVBUSU9OID0gIlVzZSBKU09OLUdMaWIgaXQgaXMgcG9zc2libGUg
dG8gcGFyc2UgYW5kIGdlbmVyYXRlIHZhbGlkIEpTT05cCisgZGF0YSBzdHJ1Y3R1cmVzLCB1c2lu
ZyBhIERPTS1saWtlIEFQSS4gSlNPTi1HTGliIGFsc28gb2ZmZXJzIEdPYmplY3QgXAoraW50ZWdy
YXRpb24sIHByb3ZpZGluZyB0aGUgYWJpbGl0eSB0byBzZXJpYWxpemUgYW5kIGRlc2VyaWFsaXpl
IEdPYmplY3QgXAoraW5zdGFuY2VzIHRvIGFuZCBmcm9tIEpTT04gZGF0YSB0eXBlcy4iCitIT01F
UEFHRSA9ICJodHRwczovL3dpa2kuZ25vbWUub3JnL1Byb2plY3RzL0pzb25HbGliIgorQlVHVFJB
Q0tFUiA9ICJodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvanNvbi1nbGliL2lzc3VlcyIK
KworTElDRU5TRSA9ICJMR1BMLTIuMS1vbmx5IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9NDE4OTBmNzFmNzQwMzAyYjc4NWMyNzY2MTEyM2JmZjUiCisKK0RFUEVORFMg
PSAiZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIgorCitpbmhlcml0IGdub21lYmFzZSBsaWJfcGFj
a2FnZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2ktZG9jZ2VuIGdldHRleHQgcHRlc3QtZ25vbWUg
bWFucGFnZXMgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuCitHSVJfTUVTT05fRU5BQkxFX0ZMQUcg
PSAnZW5hYmxlZCcKK0dJUl9NRVNPTl9ESVNBQkxFX0ZMQUcgPSAnZGlzYWJsZWQnCitHSURPQ0dF
Tl9NRVNPTl9FTkFCTEVfRkxBRyA9ICdlbmFibGVkJworR0lET0NHRU5fTUVTT05fRElTQUJMRV9G
TEFHID0gJ2Rpc2FibGVkJworCitTUkNfVVJJICs9ICIgZmlsZTovL3J1bi1wdGVzdCIKK1NSQ19V
UklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjFiY2E4ZDY2ZDk2MTA2ZWNjMTQ3ZGYzMTMzYjk1YTVi
Yjc4NGYxZmE2ZjE1ZDA2ZGQ3YzFhOGZiNGExMGFmN2IiCisKK1BBQ0tBR0VDT05GSUcgPz89ICIk
e0BiYi51dGlscy5jb250YWlucygnUFRFU1RfRU5BQkxFRCcsICcxJywgJ3Rlc3RzJywgJycsIGQp
fSIKK1BBQ0tBR0VDT05GSUdbbWFucGFnZXNdID0gIi1EbWFuPXRydWUsLURtYW49ZmFsc2UsbGli
eHNsdC1uYXRpdmUgeG1sdG8tbmF0aXZlIgorUEFDS0FHRUNPTkZJR1t0ZXN0c10gPSAiLUR0ZXN0
cz10cnVlLC1EdGVzdHM9ZmFsc2UiCisKK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNk
ayIKKworIyBDdXJyZW50bHkgaXQncyBub3QgcG9zc2libGUgdG8gZGlzYWJsZSBnZXR0ZXh0IGlu
IE1lc29uLCBzbyB3ZSBuZWVkIHRvIGZvcmNlCisjIHRoaXMgYmFjayBvbi4KK1VTRV9OTFM6Y2xh
c3MtbmF0aXZlID0gInllcyIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9qc29uLWds
aWIvanNvbi1nbGliXzEuOC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2pzb24tZ2xpYi9qc29u
LWdsaWJfMS44LjAuYmIKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDIwOTRlYmUzZTcu
LjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2pzb24tZ2xpYi9qc29uLWdsaWJf
MS44LjAuYmIKKysrIC9kZXYvbnVsbApAQCAtMSwzMSArMCwwIEBACi1TVU1NQVJZID0gIkpTT04t
R0xpYiBpbXBsZW1lbnRzIGEgZnVsbCBKU09OIHBhcnNlciB1c2luZyBHTGliIGFuZCBHT2JqZWN0
IgotREVTQ1JJUFRJT04gPSAiVXNlIEpTT04tR0xpYiBpdCBpcyBwb3NzaWJsZSB0byBwYXJzZSBh
bmQgZ2VuZXJhdGUgdmFsaWQgSlNPTlwKLSBkYXRhIHN0cnVjdHVyZXMsIHVzaW5nIGEgRE9NLWxp
a2UgQVBJLiBKU09OLUdMaWIgYWxzbyBvZmZlcnMgR09iamVjdCBcCi1pbnRlZ3JhdGlvbiwgcHJv
dmlkaW5nIHRoZSBhYmlsaXR5IHRvIHNlcmlhbGl6ZSBhbmQgZGVzZXJpYWxpemUgR09iamVjdCBc
Ci1pbnN0YW5jZXMgdG8gYW5kIGZyb20gSlNPTiBkYXRhIHR5cGVzLiIKLUhPTUVQQUdFID0gImh0
dHBzOi8vd2lraS5nbm9tZS5vcmcvUHJvamVjdHMvSnNvbkdsaWIiCi1CVUdUUkFDS0VSID0gImh0
dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9qc29uLWdsaWIvaXNzdWVzIgotCi1MSUNFTlNF
ID0gIkxHUEwtMi4xLW9ubHkiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT03ZmJjMzM4MzA5YWMzOGZlZmNkNjRiMDRiYjkwM2UzNCIKLQotREVQRU5EUyA9ICJnbGliLTIu
MCBnbGliLTIuMC1uYXRpdmUiCi0KLWluaGVyaXQgZ25vbWViYXNlIGxpYl9wYWNrYWdlIGdvYmpl
Y3QtaW50cm9zcGVjdGlvbiBnaS1kb2NnZW4gZ2V0dGV4dCBwdGVzdC1nbm9tZSBtYW5wYWdlcyB1
cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4KLUdJUl9NRVNPTl9FTkFCTEVfRkxBRyA9ICdlbmFibGVk
JwotR0lSX01FU09OX0RJU0FCTEVfRkxBRyA9ICdkaXNhYmxlZCcKLUdJRE9DR0VOX01FU09OX0VO
QUJMRV9GTEFHID0gJ2VuYWJsZWQnCi1HSURPQ0dFTl9NRVNPTl9ESVNBQkxFX0ZMQUcgPSAnZGlz
YWJsZWQnCi0KLVNSQ19VUkkgKz0gIiBmaWxlOi8vcnVuLXB0ZXN0IgotU1JDX1VSSVthcmNoaXZl
LnNoYTI1NnN1bV0gPSAiOTdlZjVlYjkyY2E4MTEwMzlhZDUwYTY1ZjA2NjMzZjFhYWU2NDc5Mjc4
OTMwN2JlNzE3MDc5NWQ4YjMxOTQ1NCIKLQotUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxz
LmNvbnRhaW5zKCdQVEVTVF9FTkFCTEVEJywgJzEnLCAndGVzdHMnLCAnJywgZCl9IgotUEFDS0FH
RUNPTkZJR1ttYW5wYWdlc10gPSAiLURtYW49dHJ1ZSwtRG1hbj1mYWxzZSxsaWJ4c2x0LW5hdGl2
ZSB4bWx0by1uYXRpdmUiCi1QQUNLQUdFQ09ORklHW3Rlc3RzXSA9ICItRHRlc3RzPXRydWUsLUR0
ZXN0cz1mYWxzZSIKLQotQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotCi0jIEN1
cnJlbnRseSBpdCdzIG5vdCBwb3NzaWJsZSB0byBkaXNhYmxlIGdldHRleHQgaW4gTWVzb24sIHNv
IHdlIG5lZWQgdG8gZm9yY2UKLSMgdGhpcyBiYWNrIG9uLgotVVNFX05MUzpjbGFzcy1uYXRpdmUg
PSAieWVzIgotLSAKMi40NC4wCgo=

--===============1912219002747855367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/json-glib/json-glib-bin: PKGSIZE changed from 33232 to 33280 (+0%)
packages/core2-64-poky-linux/json-glib/json-glib-bin: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-bin: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-dbg: PKGSIZE changed from 997224 to 999328 (+0%)
packages/core2-64-poky-linux/json-glib/json-glib-dbg: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-dbg: FILELIST: removed "/usr/lib/.debug/libjson-glib-1.0.so.0.800.0", added "/usr/lib/.debug/libjson-glib-1.0.so.0.1000.0"
packages/core2-64-poky-linux/json-glib/json-glib-dbg: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-dev: PKGSIZE changed from 457665 to 469481 (+3%)
packages/core2-64-poky-linux/json-glib/json-glib-dev: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-dev: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-doc: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-doc: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ab: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ab: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-as: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-as: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-be: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-be: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-bg: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-bg: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-bn-in: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-bn-in: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-bs: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-bs: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca+valencia: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca+valencia: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-cs: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-cs: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-da: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-da: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-de: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-de: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-el: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-el: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-en-gb: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-en-gb: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-eo: PKGSIZE changed from 3747 to 5430 (+45%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-eo: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-eo: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-es: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-es: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-et: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-et: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-eu: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-eu: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-fa: PKGSIZE changed from 2020 to 6365 (+215%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-fa: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-fa: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-fr: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-fr: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-fur: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-fur: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-gl: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-gl: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-he: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-he: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-hi: PKGSIZE changed from 5374 to 7674 (+43%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-hi: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-hi: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-hr: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-hr: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-hu: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-hu: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-id: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-id: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-it: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-it: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ja: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ja: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ka: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ka: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ko: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ko: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ky: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ky: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-lt: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-lt: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-lv: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-lv: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ml: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ml: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ms: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ms: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-nb: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-nb: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ne: PKGSIZE changed from 5965 to 7461 (+25%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-ne: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ne: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-nl: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-nl: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-oc: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-oc: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-or: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-or: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pa: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-pa: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pl: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-pl: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt-br: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt-br: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ro: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ro: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ru: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ru: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sk: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sk: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sl: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sl: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr+latin: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr+latin: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sv: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sv: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-te: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-te: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-tg: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-tg: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-tr: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-tr: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ug: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ug: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-uk: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-uk: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-vi: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-vi: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-cn: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-cn: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-hk: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-hk: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-tw: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-tw: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-ptest: PKGSIZE changed from 322105 to 318009 (-1%)
packages/core2-64-poky-linux/json-glib/json-glib-ptest: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-ptest: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-src: PKGSIZE changed from 612489 to 627794 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-src: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-src: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-staticdev: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib-staticdev: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib: PKGSIZE changed from 196119 to 192580 (-2%)
packages/core2-64-poky-linux/json-glib/json-glib: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib/json-glib: FILELIST: removed "/usr/lib/libjson-glib-1.0.so.0.800.0", added "/usr/lib/libjson-glib-1.0.so.0.1000.0"
packages/core2-64-poky-linux/json-glib/json-glib: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib: SRC_URI changed from "https://download.gnome.org/sources//json-glib/1.8/json-glib-1.8.0.tar.xz;name=archive file://run-ptest" to "https://download.gnome.org/sources//json-glib/1.10/json-glib-1.10.0.tar.xz;name=archive file://run-ptest"
packages/core2-64-poky-linux/json-glib: PV changed from "1.8.0" to "1.10.0"
packages/core2-64-poky-linux/json-glib: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/json-glib: PACKAGES: added "json-glib-locale-th json-glib-locale-kab"
Changes to packages/core2-64-poky-linux/json-glib (sysroot):
  /usr/lib/libjson-glib-1.0.so.0 changed symlink target from libjson-glib-1.0.so.0.800.0 to libjson-glib-1.0.so.0.1000.0
  /usr/lib/libjson-glib-1.0.so.0.1000.0 was added
  /usr/lib/libjson-glib-1.0.so.0.800.0 was removed

--===============1912219002747855367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1868 targets, 51 skipped, 0 masked, 0 errors.
Removing 155 recipes from the core2-64 sysroot...done.
Removing 170 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-19c2f59911cfa71eca774414763014a6eb2225db"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:19c2f59911cfa71eca774414763014a6eb2225db"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 355 Local 335 Mirrors 0 Missed 20 Current 230 (94% match, 96% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 246 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 248 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 250 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 257 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 258 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 259 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 260 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 261 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running task 849 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_write_config)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe json-glib-1.10.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe json-glib-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-glib-1.10.0-r0: task do_write_config: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 339 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 346 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe json-glib-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 347 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 348 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 923 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 360 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 361 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: Running task 925 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_fetch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 388 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-glib-1.10.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 936 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_unpack)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 390 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 942 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 397 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe json-glib-1.10.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 949 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe json-glib-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_patch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 404 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 956 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 957 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-glib-1.10.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 408 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 961 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 968 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1038 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 434 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 437 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1047 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-setuptools/72.1.0/temp/log.do_packagedata_setscene.2583508
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 438 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: Running task 1053 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 444 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 455 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1074 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 462 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 484 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 499 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 501 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 502 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 510 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 512 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 517 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 519 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 520 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 526 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 531 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 538 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 539 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1173 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 550 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running setscene task 552 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0914254c7e98c2dcacbf6ad346ab81fe83878306674c5c75a61f3c4e871b47e4
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash acdc424ed5e5de695b1f2123d680864873911754c51ef30e7bf18d70f6bbf4db to wss://hashserv.yoctoproject.org/ws ({'taskhash': '56df481cfa42e1b8c20627800db82516bb9d5617cd1d3a99e149dafc7b51e5f5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'acdc424ed5e5de695b1f2123d680864873911754c51ef30e7bf18d70f6bbf4db'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 56df481cfa42e1b8c20627800db82516bb9d5617cd1d3a99e149dafc7b51e5f5 -> acdc424ed5e5de695b1f2123d680864873911754c51ef30e7bf18d70f6bbf4db as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 554 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 555 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 577 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 581 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1503 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1518 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata)
NOTE: Running task 1562 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1626 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_collect_spdx_deps)
NOTE: Running task 1627 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1628 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe json-glib-1.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1629 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_configure)
NOTE: recipe json-glib-1.10.0-r0: task do_configure: Started
NOTE: recipe json-glib-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1630 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1631 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_compile)
NOTE: recipe json-glib-1.10.0-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1632 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1633 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 1634 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Running task 1635 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_populate_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1636 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1637 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_install)
NOTE: recipe json-glib-1.10.0-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 1638 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1639 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_package)
NOTE: Running task 1640 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.10.0-r0: task do_package: Started
NOTE: recipe json-glib-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1641 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to c3e8e3ee6c366292c2eced8d0c978437f8e659f70782233bafdfe80405a29a75
NOTE: Setscene tasks completed
NOTE: Running task 1642 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx)
NOTE: Running task 1643 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_ipk)
NOTE: Running task 1644 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_deb)
NOTE: Running task 1645 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_ipk: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_deb: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_ipk unihash changed to bb35375556a31cbd044c3f43f1a6e7b58ea50e7663fb81683e814121c8cbf5fb
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_deb unihash changed to cc922b8e54c94a7ee07ac34fabc7ec28a0c6652003659f86b6cc7bb1cc4e7aae
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm unihash changed to 06e681d78516ef56827b65173a0e915495cfabee990e87999745f28764d8cc13
NOTE: recipe json-glib-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 1646 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_packagedata)
NOTE: recipe json-glib-1.10.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_packagedata unihash changed to f8a8c87afc0dbabb2a643ece0adccd0589afa571b5fb350fe2500586ce7fd269
NOTE: Setscene tasks completed
NOTE: Running task 1647 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_create_spdx)
NOTE: Running task 1648 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_package_write_ipk)
NOTE: Running task 1649 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_package_write_deb)
NOTE: Running task 1650 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_package_write_rpm)
NOTE: Running task 1651 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_package_qa)
NOTE: recipe json-glib-1.10.0-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.10.0-r0: task do_package_write_ipk: Started
NOTE: recipe json-glib-1.10.0-r0: task do_package_write_deb: Started
NOTE: recipe json-glib-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe json-glib-1.10.0-r0: task do_package_qa: Started
NOTE: recipe json-glib-1.10.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1652 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_create_package_spdx)
NOTE: recipe json-glib-1.10.0-r0: task do_create_package_spdx: Started
NOTE: recipe json-glib-1.10.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_package_write_ipk unihash changed to 5415487bd803222cc5dc3e9a6866fd9c2159a355c9bb482aea0cb9da64831cd8
NOTE: recipe json-glib-1.10.0-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_package_qa unihash changed to fc80c1905998ab8c864f69b11e40c09fa475d37fcb2fabf341dc66c8dc72d79b
NOTE: recipe json-glib-1.10.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_package_write_deb unihash changed to 43dbcac8846adfb1a50a23cc367553a49a986063a35f952c51b80cfe8dd32016
NOTE: recipe json-glib-1.10.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_package_write_rpm unihash changed to 48536eb41a7093e9d604df73e03d1bdf17df5bb3505f9eb6e3922de836b3f487
NOTE: Running noexec task 1653 of 1653 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1653 tasks of which 1606 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:74.1.2-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:74.1.2-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:74.1.2-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:74.1.2-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:74.1.2-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:74.1.2-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:74.1.2-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:74.1.2-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1912219002747855367==--

