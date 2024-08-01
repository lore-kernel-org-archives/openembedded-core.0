Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC72C52D76
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:25 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.75486.1722536823636237147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OkF918LX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3wKYsSBM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101910f324512-bf8f565d-500a-4bcf-9415-99b75113b127-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3dfq+0s33J7UiJlrio88xNxrC6P9EleTfN+aRQ1ph5s=;
	b=OkF918LXCC7W7DWIOixeHAa318xzpmpF1JuIm6OE4UMiXK8RJe/+/ptmCM+oydhi
	YJhSJI8qpmersGm6UivgjZ+fEKe+ENHclmGtvV1ejOYW5a5t5hwZLzxM7epAiOQjmVi
	sUnp9FZuIF8MYrZM9S7y6HN42J51h8DVJR/3b0Ss=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3dfq+0s33J7UiJlrio88xNxrC6P9EleTfN+aRQ1ph5s=;
	b=3wKYsSBM4Sbj3ZRC7aewjbRKw3WvDFOnGqTN8Wmoz21WGBqO0PaMIKXL15PP52AS
	9vULEctX+7kBo97lgs/G2czN2aWmLMpG8rT9Vxl/CbC8Gfl6L7B1xxBLhRwQD2Q4dr9
	clTxk/kCBCPMvIsRa7BvGl4xh0zK/lliRFZUcBSE=
Content-Type: multipart/mixed; boundary="===============1387604727075462843=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lz4: upgrading to 1.10.0 FAILED
Message-ID: <010101910f324512-bf8f565d-500a-4bcf-9415-99b75113b127-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202881

--===============1387604727075462843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lz4* to *1.10.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lz4-upgrade-1.9.4-1.10.0.patch
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
From 3232a1f51d75a972312def6883fbf535eb9f8582 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 17:51:31 +0000
Subject: [PATCH] lz4: upgrade 1.9.4 -> 1.10.0

---
 meta/recipes-support/lz4/lz4_1.10.0.bb | 460 +++++++++++++++++++++++++
 meta/recipes-support/lz4/lz4_1.9.4.bb  |  46 ---
 2 files changed, 460 insertions(+), 46 deletions(-)
 create mode 100644 meta/recipes-support/lz4/lz4_1.10.0.bb
 delete mode 100644 meta/recipes-support/lz4/lz4_1.9.4.bb

diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.10.0.bb
new file mode 100644
index 0000000000..c3cce6afd6
--- /dev/null
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -0,0 +1,460 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- programs/COPYING
+# +++ programs/COPYING
+# @@ -1,339 +1,83 @@
+# -                    GNU GENERAL PUBLIC LICENSE
+# -                       Version 2, June 1991
+# +Full name:
+# +GNU General Public License v2.0 or later
+#  
+# - Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+# - Everyone is permitted to copy and distribute verbatim copies
+# - of this license document, but changing it is not allowed.
+# +Short identifier:
+# +GPL-2.0-or-later
+#  
+# -                            Preamble
+# +Text:
+# +GNU GENERAL PUBLIC LICENSE
+# +Version 2, June 1991
+#  
+# -  The licenses for most software are designed to take away your
+# -freedom to share and change it.  By contrast, the GNU General Public
+# -License is intended to guarantee your freedom to share and change free
+# -software--to make sure the software is free for all its users.  This
+# -General Public License applies to most of the Free Software
+# -Foundation's software and to any other program whose authors commit to
+# -using it.  (Some other Free Software Foundation software is covered by
+# -the GNU Lesser General Public License instead.)  You can apply it to
+# -your programs, too.
+# +Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+# +51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA
+#  
+# -  When we speak of free software, we are referring to freedom, not
+# -price.  Our General Public Licenses are designed to make sure that you
+# -have the freedom to distribute copies of free software (and charge for
+# -this service if you wish), that you receive source code or can get it
+# -if you want it, that you can change the software or use pieces of it
+# -in new free programs; and that you know you can do these things.
+# +Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed.
+#  
+# -  To protect your rights, we need to make restrictions that forbid
+# -anyone to deny you these rights or to ask you to surrender the rights.
+# -These restrictions translate to certain responsibilities for you if you
+# -distribute copies of the software, or if you modify it.
+# +Preamble
+#  
+# -  For example, if you distribute copies of such a program, whether
+# -gratis or for a fee, you must give the recipients all the rights that
+# -you have.  You must make sure that they, too, receive or can get the
+# -source code.  And you must show them these terms so they know their
+# -rights.
+# +The licenses for most software are designed to take away your freedom to share and change it. By contrast, the GNU General Public License is intended to guarantee your freedom to share and change free software--to make sure the software is free for all its users. This General Public License applies to most of the Free Software Foundation's software and to any other program whose authors commit to using it. (Some other Free Software Foundation software is covered by the GNU Lesser General Public License instead.) You can apply it to your programs, too.
+#  
+# -  We protect your rights with two steps: (1) copyright the software, and
+# -(2) offer you this license which gives you legal permission to copy,
+# -distribute and/or modify the software.
+# +When we speak of free software, we are referring to freedom, not price. Our General Public Licenses are designed to make sure that you have the freedom to distribute copies of free software (and charge for this service if you wish), that you receive source code or can get it if you want it, that you can change the software or use pieces of it in new free programs; and that you know you can do these things.
+#  
+# -  Also, for each author's protection and ours, we want to make certain
+# -that everyone understands that there is no warranty for this free
+# -software.  If the software is modified by someone else and passed on, we
+# -want its recipients to know that what they have is not the original, so
+# -that any problems introduced by others will not reflect on the original
+# -authors' reputations.
+# +To protect your rights, we need to make restrictions that forbid anyone to deny you these rights or to ask you to surrender the rights. These restrictions translate to certain responsibilities for you if you distribute copies of the software, or if you modify it.
+#  
+# -  Finally, any free program is threatened constantly by software
+# -patents.  We wish to avoid the danger that redistributors of a free
+# -program will individually obtain patent licenses, in effect making the
+# -program proprietary.  To prevent this, we have made it clear that any
+# -patent must be licensed for everyone's free use or not licensed at all.
+# +For example, if you distribute copies of such a program, whether gratis or for a fee, you must give the recipients all the rights that you have. You must make sure that they, too, receive or can get the source code. And you must show them these terms so they know their rights.
+#  
+# -  The precise terms and conditions for copying, distribution and
+# -modification follow.
+# +We protect your rights with two steps: (1) copyright the software, and (2) offer you this license which gives you legal permission to copy, distribute and/or modify the software.
+#  
+# -                    GNU GENERAL PUBLIC LICENSE
+# -   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+# +Also, for each author's protection and ours, we want to make certain that everyone understands that there is no warranty for this free software. If the software is modified by someone else and passed on, we want its recipients to know that what they have is not the original, so that any problems introduced by others will not reflect on the original authors' reputations.
+#  
+# -  0. This License applies to any program or other work which contains
+# -a notice placed by the copyright holder saying it may be distributed
+# -under the terms of this General Public License.  The "Program", below,
+# -refers to any such program or work, and a "work based on the Program"
+# -means either the Program or any derivative work under copyright law:
+# -that is to say, a work containing the Program or a portion of it,
+# -either verbatim or with modifications and/or translated into another
+# -language.  (Hereinafter, translation is included without limitation in
+# -the term "modification".)  Each licensee is addressed as "you".
+# +Finally, any free program is threatened constantly by software patents. We wish to avoid the danger that redistributors of a free program will individually obtain patent licenses, in effect making the program proprietary. To prevent this, we have made it clear that any patent must be licensed for everyone's free use or not licensed at all.
+#  
+# -Activities other than copying, distribution and modification are not
+# -covered by this License; they are outside its scope.  The act of
+# -running the Program is not restricted, and the output from the Program
+# -is covered only if its contents constitute a work based on the
+# -Program (independent of having been made by running the Program).
+# -Whether that is true depends on what the Program does.
+# +The precise terms and conditions for copying, distribution and modification follow.
+#  
+# -  1. You may copy and distribute verbatim copies of the Program's
+# -source code as you receive it, in any medium, provided that you
+# -conspicuously and appropriately publish on each copy an appropriate
+# -copyright notice and disclaimer of warranty; keep intact all the
+# -notices that refer to this License and to the absence of any warranty;
+# -and give any other recipients of the Program a copy of this License
+# -along with the Program.
+# +TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+#  
+# -You may charge a fee for the physical act of transferring a copy, and
+# -you may at your option offer warranty protection in exchange for a fee.
+# +0. This License applies to any program or other work which contains a notice placed by the copyright holder saying it may be distributed under the terms of this General Public License. The "Program", below, refers to any such program or work, and a "work based on the Program" means either the Program or any derivative work under copyright law: that is to say, a work containing the Program or a portion of it, either verbatim or with modifications and/or translated into another language. (Hereinafter, translation is included without limitation in the term "modification".) Each licensee is addressed as "you".
+# +Activities other than copying, distribution and modification are not covered by this License; they are outside its scope. The act of running the Program is not restricted, and the output from the Program is covered only if its contents constitute a work based on the Program (independent of having been made by running the Program). Whether that is true depends on what the Program does.
+#  
+# -  2. You may modify your copy or copies of the Program or any portion
+# -of it, thus forming a work based on the Program, and copy and
+# -distribute such modifications or work under the terms of Section 1
+# -above, provided that you also meet all of these conditions:
+# +1. You may copy and distribute verbatim copies of the Program's source code as you receive it, in any medium, provided that you conspicuously and appropriately publish on each copy an appropriate copyright notice and disclaimer of warranty; keep intact all the notices that refer to this License and to the absence of any warranty; and give any other recipients of the Program a copy of this License along with the Program.
+# +You may charge a fee for the physical act of transferring a copy, and you may at your option offer warranty protection in exchange for a fee.
+#  
+# -    a) You must cause the modified files to carry prominent notices
+# -    stating that you changed the files and the date of any change.
+# +2. You may modify your copy or copies of the Program or any portion of it, thus forming a work based on the Program, and copy and distribute such modifications or work under the terms of Section 1 above, provided that you also meet all of these conditions:
+# +a) You must cause the modified files to carry prominent notices stating that you changed the files and the date of any change.
+# +b) You must cause any work that you distribute or publish, that in whole or in part contains or is derived from the Program or any part thereof, to be licensed as a whole at no charge to all third parties under the terms of this License.
+# +c) If the modified program normally reads commands interactively when run, you must cause it, when started running for such interactive use in the most ordinary way, to print or display an announcement including an appropriate copyright notice and a notice that there is no warranty (or else, saying that you provide a warranty) and that users may redistribute the program under these conditions, and telling the user how to view a copy of this License. (Exception: if the Program itself is interactive but does not normally print such an announcement, your work based on the Program is not required to print an announcement.)
+# +These requirements apply to the modified work as a whole. If identifiable sections of that work are not derived from the Program, and can be reasonably considered independent and separate works in themselves, then this License, and its terms, do not apply to those sections when you distribute them as separate works. But when you distribute the same sections as part of a whole which is a work based on the Program, the distribution of the whole must be on the terms of this License, whose permissions for other licensees extend to the entire whole, and thus to each and every part regardless of who wrote it.
+#  
+# -    b) You must cause any work that you distribute or publish, that in
+# -    whole or in part contains or is derived from the Program or any
+# -    part thereof, to be licensed as a whole at no charge to all third
+# -    parties under the terms of this License.
+# +Thus, it is not the intent of this section to claim rights or contest your rights to work written entirely by you; rather, the intent is to exercise the right to control the distribution of derivative or collective works based on the Program.
+#  
+# -    c) If the modified program normally reads commands interactively
+# -    when run, you must cause it, when started running for such
+# -    interactive use in the most ordinary way, to print or display an
+# -    announcement including an appropriate copyright notice and a
+# -    notice that there is no warranty (or else, saying that you provide
+# -    a warranty) and that users may redistribute the program under
+# -    these conditions, and telling the user how to view a copy of this
+# -    License.  (Exception: if the Program itself is interactive but
+# -    does not normally print such an announcement, your work based on
+# -    the Program is not required to print an announcement.)
+# +In addition, mere aggregation of another work not based on the Program with the Program (or with a work based on the Program) on a volume of a storage or distribution medium does not bring the other work under the scope of this License.
+#  
+# -These requirements apply to the modified work as a whole.  If
+# -identifiable sections of that work are not derived from the Program,
+# -and can be reasonably considered independent and separate works in
+# -themselves, then this License, and its terms, do not apply to those
+# -sections when you distribute them as separate works.  But when you
+# -distribute the same sections as part of a whole which is a work based
+# -on the Program, the distribution of the whole must be on the terms of
+# -this License, whose permissions for other licensees extend to the
+# -entire whole, and thus to each and every part regardless of who wrote it.
+# +3. You may copy and distribute the Program (or a work based on it, under Section 2) in object code or executable form under the terms of Sections 1 and 2 above provided that you also do one of the following:
+# +a) Accompany it with the complete corresponding machine-readable source code, which must be distributed under the terms of Sections 1 and 2 above on a medium customarily used for software interchange; or,
+# +b) Accompany it with a written offer, valid for at least three years, to give any third party, for a charge no more than your cost of physically performing source distribution, a complete machine-readable copy of the corresponding source code, to be distributed under the terms of Sections 1 and 2 above on a medium customarily used for software interchange; or,
+# +c) Accompany it with the information you received as to the offer to distribute corresponding source code. (This alternative is allowed only for noncommercial distribution and only if you received the program in object code or executable form with such an offer, in accord with Subsection b above.)
+# +The source code for a work means the preferred form of the work for making modifications to it. For an executable work, complete source code means all the source code for all modules it contains, plus any associated interface definition files, plus the scripts used to control compilation and installation of the executable. However, as a special exception, the source code distributed need not include anything that is normally distributed (in either source or binary form) with the major components (compiler, kernel, and so on) of the operating system on which the executable runs, unless that component itself accompanies the executable.
+#  
+# -Thus, it is not the intent of this section to claim rights or contest
+# -your rights to work written entirely by you; rather, the intent is to
+# -exercise the right to control the distribution of derivative or
+# -collective works based on the Program.
+# +If distribution of executable or object code is made by offering access to copy from a designated place, then offering equivalent access to copy the source code from the same place counts as distribution of the source code, even though third parties are not compelled to copy the source along with the object code.
+#  
+# -In addition, mere aggregation of another work not based on the Program
+# -with the Program (or with a work based on the Program) on a volume of
+# -a storage or distribution medium does not bring the other work under
+# -the scope of this License.
+# +4. You may not copy, modify, sublicense, or distribute the Program except as expressly provided under this License. Any attempt otherwise to copy, modify, sublicense or distribute the Program is void, and will automatically terminate your rights under this License. However, parties who have received copies, or rights, from you under this License will not have their licenses terminated so long as such parties remain in full compliance.
+#  
+# -  3. You may copy and distribute the Program (or a work based on it,
+# -under Section 2) in object code or executable form under the terms of
+# -Sections 1 and 2 above provided that you also do one of the following:
+# +5. You are not required to accept this License, since you have not signed it. However, nothing else grants you permission to modify or distribute the Program or its derivative works. These actions are prohibited by law if you do not accept this License. Therefore, by modifying or distributing the Program (or any work based on the Program), you indicate your acceptance of this License to do so, and all its terms and conditions for copying, distributing or modifying the Program or works based on it.
+#  
+# -    a) Accompany it with the complete corresponding machine-readable
+# -    source code, which must be distributed under the terms of Sections
+# -    1 and 2 above on a medium customarily used for software interchange; or,
+# +6. Each time you redistribute the Program (or any work based on the Program), the recipient automatically receives a license from the original licensor to copy, distribute or modify the Program subject to these terms and conditions. You may not impose any further restrictions on the recipients' exercise of the rights granted herein. You are not responsible for enforcing compliance by third parties to this License.
+#  
+# -    b) Accompany it with a written offer, valid for at least three
+# -    years, to give any third party, for a charge no more than your
+# -    cost of physically performing source distribution, a complete
+# -    machine-readable copy of the corresponding source code, to be
+# -    distributed under the terms of Sections 1 and 2 above on a medium
+# -    customarily used for software interchange; or,
+# +7. If, as a consequence of a court judgment or allegation of patent infringement or for any other reason (not limited to patent issues), conditions are imposed on you (whether by court order, agreement or otherwise) that contradict the conditions of this License, they do not excuse you from the conditions of this License. If you cannot distribute so as to satisfy simultaneously your obligations under this License and any other pertinent obligations, then as a consequence you may not distribute the Program at all. For example, if a patent license would not permit royalty-free redistribution of the Program by all those who receive copies directly or indirectly through you, then the only way you could satisfy both it and this License would be to refrain entirely from distribution of the Program.
+# +If any portion of this section is held invalid or unenforceable under any particular circumstance, the balance of the section is intended to apply and the section as a whole is intended to apply in other circumstances.
+#  
+# -    c) Accompany it with the information you received as to the offer
+# -    to distribute corresponding source code.  (This alternative is
+# -    allowed only for noncommercial distribution and only if you
+# -    received the program in object code or executable form with such
+# -    an offer, in accord with Subsection b above.)
+# +It is not the purpose of this section to induce you to infringe any patents or other property right claims or to contest validity of any such claims; this section has the sole purpose of protecting the integrity of the free software distribution system, which is implemented by public license practices. Many people have made generous contributions to the wide range of software distributed through that system in reliance on consistent application of that system; it is up to the author/donor to decide if he or she is willing to distribute software through any other system and a licensee cannot impose that choice.
+#  
+# -The source code for a work means the preferred form of the work for
+# -making modifications to it.  For an executable work, complete source
+# -code means all the source code for all modules it contains, plus any
+# -associated interface definition files, plus the scripts used to
+# -control compilation and installation of the executable.  However, as a
+# -special exception, the source code distributed need not include
+# -anything that is normally distributed (in either source or binary
+# -form) with the major components (compiler, kernel, and so on) of the
+# -operating system on which the executable runs, unless that component
+# -itself accompanies the executable.
+# +This section is intended to make thoroughly clear what is believed to be a consequence of the rest of this License.
+#  
+# -If distribution of executable or object code is made by offering
+# -access to copy from a designated place, then offering equivalent
+# -access to copy the source code from the same place counts as
+# -distribution of the source code, even though third parties are not
+# -compelled to copy the source along with the object code.
+# +8. If the distribution and/or use of the Program is restricted in certain countries either by patents or by copyrighted interfaces, the original copyright holder who places the Program under this License may add an explicit geographical distribution limitation excluding those countries, so that distribution is permitted only in or among countries not thus excluded. In such case, this License incorporates the limitation as if written in the body of this License.
+#  
+# -  4. You may not copy, modify, sublicense, or distribute the Program
+# -except as expressly provided under this License.  Any attempt
+# -otherwise to copy, modify, sublicense or distribute the Program is
+# -void, and will automatically terminate your rights under this License.
+# -However, parties who have received copies, or rights, from you under
+# -this License will not have their licenses terminated so long as such
+# -parties remain in full compliance.
+# +9. The Free Software Foundation may publish revised and/or new versions of the General Public License from time to time. Such new versions will be similar in spirit to the present version, but may differ in detail to address new problems or concerns.
+# +Each version is given a distinguishing version number. If the Program specifies a version number of this License which applies to it and "any later version", you have the option of following the terms and conditions either of that version or of any later version published by the Free Software Foundation. If the Program does not specify a version number of this License, you may choose any version ever published by the Free Software Foundation.
+#  
+# -  5. You are not required to accept this License, since you have not
+# -signed it.  However, nothing else grants you permission to modify or
+# -distribute the Program or its derivative works.  These actions are
+# -prohibited by law if you do not accept this License.  Therefore, by
+# -modifying or distributing the Program (or any work based on the
+# -Program), you indicate your acceptance of this License to do so, and
+# -all its terms and conditions for copying, distributing or modifying
+# -the Program or works based on it.
+# +10. If you wish to incorporate parts of the Program into other free programs whose distribution conditions are different, write to the author to ask for permission. For software which is copyrighted by the Free Software Foundation, write to the Free Software Foundation; we sometimes make exceptions for this. Our decision will be guided by the two goals of preserving the free status of all derivatives of our free software and of promoting the sharing and reuse of software generally.
+# +NO WARRANTY
+#  
+# -  6. Each time you redistribute the Program (or any work based on the
+# -Program), the recipient automatically receives a license from the
+# -original licensor to copy, distribute or modify the Program subject to
+# -these terms and conditions.  You may not impose any further
+# -restrictions on the recipients' exercise of the rights granted herein.
+# -You are not responsible for enforcing compliance by third parties to
+# -this License.
+# +11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+#  
+# -  7. If, as a consequence of a court judgment or allegation of patent
+# -infringement or for any other reason (not limited to patent issues),
+# -conditions are imposed on you (whether by court order, agreement or
+# -otherwise) that contradict the conditions of this License, they do not
+# -excuse you from the conditions of this License.  If you cannot
+# -distribute so as to satisfy simultaneously your obligations under this
+# -License and any other pertinent obligations, then as a consequence you
+# -may not distribute the Program at all.  For example, if a patent
+# -license would not permit royalty-free redistribution of the Program by
+# -all those who receive copies directly or indirectly through you, then
+# -the only way you could satisfy both it and this License would be to
+# -refrain entirely from distribution of the Program.
+# -
+# -If any portion of this section is held invalid or unenforceable under
+# -any particular circumstance, the balance of the section is intended to
+# -apply and the section as a whole is intended to apply in other
+# -circumstances.
+# -
+# -It is not the purpose of this section to induce you to infringe any
+# -patents or other property right claims or to contest validity of any
+# -such claims; this section has the sole purpose of protecting the
+# -integrity of the free software distribution system, which is
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
+# -  8. If the distribution and/or use of the Program is restricted in
+# -certain countries either by patents or by copyrighted interfaces, the
+# -original copyright holder who places the Program under this License
+# -may add an explicit geographical distribution limitation excluding
+# -those countries, so that distribution is permitted only in or among
+# -countries not thus excluded.  In such case, this License incorporates
+# -the limitation as if written in the body of this License.
+# -
+# -  9. The Free Software Foundation may publish revised and/or new versions
+# -of the General Public License from time to time.  Such new versions will
+# -be similar in spirit to the present version, but may differ in detail to
+# -address new problems or concerns.
+# -
+# -Each version is given a distinguishing version number.  If the Program
+# -specifies a version number of this License which applies to it and "any
+# -later version", you have the option of following the terms and conditions
+# -either of that version or of any later version published by the Free
+# -Software Foundation.  If the Program does not specify a version number of
+# -this License, you may choose any version ever published by the Free Software
+# -Foundation.
+# -
+# -  10. If you wish to incorporate parts of the Program into other free
+# -programs whose distribution conditions are different, write to the author
+# -to ask for permission.  For software which is copyrighted by the Free
+# -Software Foundation, write to the Free Software Foundation; we sometimes
+# -make exceptions for this.  Our decision will be guided by the two goals
+# -of preserving the free status of all derivatives of our free software and
+# -of promoting the sharing and reuse of software generally.
+# -
+# -                            NO WARRANTY
+# -
+# -  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+# -FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+# -OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+# -PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
+# -OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+# -MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
+# -TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+# -PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+# -REPAIR OR CORRECTION.
+# -
+# -  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+# -WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+# -REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
+# -INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
+# -OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
+# -TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+# -YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
+# -PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+# -POSSIBILITY OF SUCH DAMAGES.
+# -
+# -                     END OF TERMS AND CONDITIONS
+# -
+# -            How to Apply These Terms to Your New Programs
+# -
+# -  If you develop a new program, and you want it to be of the greatest
+# -possible use to the public, the best way to achieve this is to make it
+# -free software which everyone can redistribute and change under these terms.
+# -
+# -  To do so, attach the following notices to the program.  It is safest
+# -to attach them to the start of each source file to most effectively
+# -convey the exclusion of warranty; and each file should have at least
+# -the "copyright" line and a pointer to where the full notice is found.
+# -
+# -    <one line to give the program's name and a brief idea of what it does.>
+# -    Copyright (C) <year>  <name of author>
+# -
+# -    This program is free software; you can redistribute it and/or modify
+# -    it under the terms of the GNU General Public License as published by
+# -    the Free Software Foundation; either version 2 of the License, or
+# -    (at your option) any later version.
+# -
+# -    This program is distributed in the hope that it will be useful,
+# -    but WITHOUT ANY WARRANTY; without even the implied warranty of
+# -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# -    GNU General Public License for more details.
+# -
+# -    You should have received a copy of the GNU General Public License along
+# -    with this program; if not, write to the Free Software Foundation, Inc.,
+# -    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# -
+# -Also add information on how to contact you by electronic and paper mail.
+# -
+# -If the program is interactive, make it output a short notice like this
+# -when it starts in an interactive mode:
+# -
+# -    Gnomovision version 69, Copyright (C) year name of author
+# -    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+# -    This is free software, and you are welcome to redistribute it
+# -    under certain conditions; type `show c' for details.
+# -
+# -The hypothetical commands `show w' and `show c' should show the appropriate
+# -parts of the General Public License.  Of course, the commands you use may
+# -be called something other than `show w' and `show c'; they could even be
+# -mouse-clicks or menu items--whatever suits your program.
+# -
+# -You should also get your employer (if you work as a programmer) or your
+# -school, if any, to sign a "copyright disclaimer" for the program, if
+# -necessary.  Here is a sample; alter the names:
+# -
+# -  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+# -  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+# -
+# -  <signature of Ty Coon>, 1 April 1989
+# -  Ty Coon, President of Vice
+# -
+# -This General Public License does not permit incorporating your program into
+# -proprietary programs.  If your program is a subroutine library, you may
+# -consider it more useful to permit linking proprietary applications with the
+# -library.  If this is what you want to do, use the GNU Lesser General
+# -Public License instead of this License.
+# +12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,6 +1,6 @@
+#  This repository uses 2 different licenses :
+#  - all files in the `lib` directory use a BSD 2-Clause license
+# -- all other files use a GPLv2 license, unless explicitly stated otherwise
+# +- all other files use a GPL-2.0-or-later license, unless explicitly stated otherwise
+#  
+#  Relevant license is reminded at the top of each source file,
+#  and with presence of COPYING or LICENSE file in associated directories.
+# 
+#
+
+SUMMARY = "Extremely Fast Compression algorithm"
+DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
+HOMEPAGE = "https://github.com/lz4/lz4"
+
+LICENSE = "BSD-2-Clause | GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=5cd5f851b52ec832b10eedb3f01f885a \
+                    file://programs/COPYING;md5=492daf447d6db0e5eb344a7922e7ec25 \
+                    file://LICENSE;md5=c111c47e301c2ffe8776729b40b44477 \
+                    "
+
+PE = "1"
+
+SRCREV = "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
+
+SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
+	   file://run-ptest \
+	   "
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
+
+S = "${WORKDIR}/git"
+
+inherit ptest
+
+CVE_STATUS[CVE-2014-4715] = "fixed-version: Fixed in r118, which is larger than the current version."
+
+EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
+
+do_install() {
+	oe_runmake install
+}
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN}-ptest += "bash"
+
+do_compile_ptest() {
+        oe_runmake -C ${B}/tests/
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests/
+	install --mode=755 ${B}/tests/frametest ${D}${PTEST_PATH}/tests/
+	sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+
+}
+
diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-support/lz4/lz4_1.9.4.bb
deleted file mode 100644
index 51a854d44a..0000000000
--- a/meta/recipes-support/lz4/lz4_1.9.4.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY = "Extremely Fast Compression algorithm"
-DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
-HOMEPAGE = "https://github.com/lz4/lz4"
-
-LICENSE = "BSD-2-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=5cd5f851b52ec832b10eedb3f01f885a \
-                    file://programs/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LICENSE;md5=c5cc3cd6f9274b4d32988096df9c3ec3 \
-                    "
-
-PE = "1"
-
-SRCREV = "5ff839680134437dbf4678f3d0c7b371d84f4964"
-
-SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
-	   file://run-ptest \
-	   "
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-
-S = "${WORKDIR}/git"
-
-inherit ptest
-
-CVE_STATUS[CVE-2014-4715] = "fixed-version: Fixed in r118, which is larger than the current version."
-
-EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
-
-do_install() {
-	oe_runmake install
-}
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS:${PN}-ptest += "bash"
-
-do_compile_ptest() {
-        oe_runmake -C ${B}/tests/
-}
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests/
-	install --mode=755 ${B}/tests/frametest ${D}${PTEST_PATH}/tests/
-	sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
-
-}
-
-- 
2.44.0


--===============1387604727075462843==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lz4-upgrade-1.9.4-1.10.0.patch"

RnJvbSAzMjMyYTFmNTFkNzVhOTcyMzEyZGVmNjg4M2ZiZjUzNWViOWY4NTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNzo1MTozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx6
NDogdXBncmFkZSAxLjkuNCAtPiAxLjEwLjAKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0
L2x6NF8xLjEwLjAuYmIgfCA0NjAgKysrKysrKysrKysrKysrKysrKysrKysrKwogbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbHo0L2x6NF8xLjkuNC5iYiAgfCAgNDYgLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDQ2MCBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9sejQvbHo0XzEuMTAuMC5iYgogZGVsZXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2x6NC9sejRfMS45LjQuYmIKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9sejQvbHo0XzEuMTAuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2x6NC9sejRfMS4xMC4wLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LmMzY2NlNmFmZDYKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9sejQv
bHo0XzEuMTAuMC5iYgpAQCAtMCwwICsxLDQ2MCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19D
SEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBU
aGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5l
dyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVl
ZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2
aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBj
b3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIHBy
b2dyYW1zL0NPUFlJTkcKKyMgKysrIHByb2dyYW1zL0NPUFlJTkcKKyMgQEAgLTEsMzM5ICsxLDgz
IEBACisjIC0gICAgICAgICAgICAgICAgICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisj
IC0gICAgICAgICAgICAgICAgICAgICAgIFZlcnNpb24gMiwgSnVuZSAxOTkxCisjICtGdWxsIG5h
bWU6CisjICtHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2Mi4wIG9yIGxhdGVyCisjICAKKyMg
LSBDb3B5cmlnaHQgKEMpIDE5ODksIDE5OTEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMu
LAorIyAtIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAt
MTMwMSBVU0EKKyMgLSBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0
ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgLSBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFu
Z2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgK1Nob3J0IGlkZW50aWZpZXI6CisjICtHUEwtMi4w
LW9yLWxhdGVyCisjICAKKyMgLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBQcmVhbWJsZQor
IyArVGV4dDoKKyMgK0dOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICtWZXJzaW9uIDIsIEp1
bmUgMTk5MQorIyAgCisjIC0gIFRoZSBsaWNlbnNlcyBmb3IgbW9zdCBzb2Z0d2FyZSBhcmUgZGVz
aWduZWQgdG8gdGFrZSBhd2F5IHlvdXIKKyMgLWZyZWVkb20gdG8gc2hhcmUgYW5kIGNoYW5nZSBp
dC4gIEJ5IGNvbnRyYXN0LCB0aGUgR05VIEdlbmVyYWwgUHVibGljCisjIC1MaWNlbnNlIGlzIGlu
dGVuZGVkIHRvIGd1YXJhbnRlZSB5b3VyIGZyZWVkb20gdG8gc2hhcmUgYW5kIGNoYW5nZSBmcmVl
CisjIC1zb2Z0d2FyZS0tdG8gbWFrZSBzdXJlIHRoZSBzb2Z0d2FyZSBpcyBmcmVlIGZvciBhbGwg
aXRzIHVzZXJzLiAgVGhpcworIyAtR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcHBsaWVzIHRvIG1v
c3Qgb2YgdGhlIEZyZWUgU29mdHdhcmUKKyMgLUZvdW5kYXRpb24ncyBzb2Z0d2FyZSBhbmQgdG8g
YW55IG90aGVyIHByb2dyYW0gd2hvc2UgYXV0aG9ycyBjb21taXQgdG8KKyMgLXVzaW5nIGl0LiAg
KFNvbWUgb3RoZXIgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uIHNvZnR3YXJlIGlzIGNvdmVyZWQg
YnkKKyMgLXRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgaW5zdGVhZC4pICBZ
b3UgY2FuIGFwcGx5IGl0IHRvCisjIC15b3VyIHByb2dyYW1zLCB0b28uCisjICtDb3B5cmlnaHQg
KEMpIDE5ODksIDE5OTEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisjICs1MSBGcmFu
a2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEsIFVTQQorIyAg
CisjIC0gIFdoZW4gd2Ugc3BlYWsgb2YgZnJlZSBzb2Z0d2FyZSwgd2UgYXJlIHJlZmVycmluZyB0
byBmcmVlZG9tLCBub3QKKyMgLXByaWNlLiAgT3VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2VzIGFy
ZSBkZXNpZ25lZCB0byBtYWtlIHN1cmUgdGhhdCB5b3UKKyMgLWhhdmUgdGhlIGZyZWVkb20gdG8g
ZGlzdHJpYnV0ZSBjb3BpZXMgb2YgZnJlZSBzb2Z0d2FyZSAoYW5kIGNoYXJnZSBmb3IKKyMgLXRo
aXMgc2VydmljZSBpZiB5b3Ugd2lzaCksIHRoYXQgeW91IHJlY2VpdmUgc291cmNlIGNvZGUgb3Ig
Y2FuIGdldCBpdAorIyAtaWYgeW91IHdhbnQgaXQsIHRoYXQgeW91IGNhbiBjaGFuZ2UgdGhlIHNv
ZnR3YXJlIG9yIHVzZSBwaWVjZXMgb2YgaXQKKyMgLWluIG5ldyBmcmVlIHByb2dyYW1zOyBhbmQg
dGhhdCB5b3Uga25vdyB5b3UgY2FuIGRvIHRoZXNlIHRoaW5ncy4KKyMgK0V2ZXJ5b25lIGlzIHBl
cm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcyBvZiB0aGlzIGxp
Y2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyAt
ICBUbyBwcm90ZWN0IHlvdXIgcmlnaHRzLCB3ZSBuZWVkIHRvIG1ha2UgcmVzdHJpY3Rpb25zIHRo
YXQgZm9yYmlkCisjIC1hbnlvbmUgdG8gZGVueSB5b3UgdGhlc2UgcmlnaHRzIG9yIHRvIGFzayB5
b3UgdG8gc3VycmVuZGVyIHRoZSByaWdodHMuCisjIC1UaGVzZSByZXN0cmljdGlvbnMgdHJhbnNs
YXRlIHRvIGNlcnRhaW4gcmVzcG9uc2liaWxpdGllcyBmb3IgeW91IGlmIHlvdQorIyAtZGlzdHJp
YnV0ZSBjb3BpZXMgb2YgdGhlIHNvZnR3YXJlLCBvciBpZiB5b3UgbW9kaWZ5IGl0LgorIyArUHJl
YW1ibGUKKyMgIAorIyAtICBGb3IgZXhhbXBsZSwgaWYgeW91IGRpc3RyaWJ1dGUgY29waWVzIG9m
IHN1Y2ggYSBwcm9ncmFtLCB3aGV0aGVyCisjIC1ncmF0aXMgb3IgZm9yIGEgZmVlLCB5b3UgbXVz
dCBnaXZlIHRoZSByZWNpcGllbnRzIGFsbCB0aGUgcmlnaHRzIHRoYXQKKyMgLXlvdSBoYXZlLiAg
WW91IG11c3QgbWFrZSBzdXJlIHRoYXQgdGhleSwgdG9vLCByZWNlaXZlIG9yIGNhbiBnZXQgdGhl
CisjIC1zb3VyY2UgY29kZS4gIEFuZCB5b3UgbXVzdCBzaG93IHRoZW0gdGhlc2UgdGVybXMgc28g
dGhleSBrbm93IHRoZWlyCisjIC1yaWdodHMuCisjICtUaGUgbGljZW5zZXMgZm9yIG1vc3Qgc29m
dHdhcmUgYXJlIGRlc2lnbmVkIHRvIHRha2UgYXdheSB5b3VyIGZyZWVkb20gdG8gc2hhcmUgYW5k
IGNoYW5nZSBpdC4gQnkgY29udHJhc3QsIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBp
cyBpbnRlbmRlZCB0byBndWFyYW50ZWUgeW91ciBmcmVlZG9tIHRvIHNoYXJlIGFuZCBjaGFuZ2Ug
ZnJlZSBzb2Z0d2FyZS0tdG8gbWFrZSBzdXJlIHRoZSBzb2Z0d2FyZSBpcyBmcmVlIGZvciBhbGwg
aXRzIHVzZXJzLiBUaGlzIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXBwbGllcyB0byBtb3N0IG9m
IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24ncyBzb2Z0d2FyZSBhbmQgdG8gYW55IG90aGVy
IHByb2dyYW0gd2hvc2UgYXV0aG9ycyBjb21taXQgdG8gdXNpbmcgaXQuIChTb21lIG90aGVyIEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbiBzb2Z0d2FyZSBpcyBjb3ZlcmVkIGJ5IHRoZSBHTlUgTGVz
c2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgaW5zdGVhZC4pIFlvdSBjYW4gYXBwbHkgaXQgdG8g
eW91ciBwcm9ncmFtcywgdG9vLgorIyAgCisjIC0gIFdlIHByb3RlY3QgeW91ciByaWdodHMgd2l0
aCB0d28gc3RlcHM6ICgxKSBjb3B5cmlnaHQgdGhlIHNvZnR3YXJlLCBhbmQKKyMgLSgyKSBvZmZl
ciB5b3UgdGhpcyBsaWNlbnNlIHdoaWNoIGdpdmVzIHlvdSBsZWdhbCBwZXJtaXNzaW9uIHRvIGNv
cHksCisjIC1kaXN0cmlidXRlIGFuZC9vciBtb2RpZnkgdGhlIHNvZnR3YXJlLgorIyArV2hlbiB3
ZSBzcGVhayBvZiBmcmVlIHNvZnR3YXJlLCB3ZSBhcmUgcmVmZXJyaW5nIHRvIGZyZWVkb20sIG5v
dCBwcmljZS4gT3VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2VzIGFyZSBkZXNpZ25lZCB0byBtYWtl
IHN1cmUgdGhhdCB5b3UgaGF2ZSB0aGUgZnJlZWRvbSB0byBkaXN0cmlidXRlIGNvcGllcyBvZiBm
cmVlIHNvZnR3YXJlIChhbmQgY2hhcmdlIGZvciB0aGlzIHNlcnZpY2UgaWYgeW91IHdpc2gpLCB0
aGF0IHlvdSByZWNlaXZlIHNvdXJjZSBjb2RlIG9yIGNhbiBnZXQgaXQgaWYgeW91IHdhbnQgaXQs
IHRoYXQgeW91IGNhbiBjaGFuZ2UgdGhlIHNvZnR3YXJlIG9yIHVzZSBwaWVjZXMgb2YgaXQgaW4g
bmV3IGZyZWUgcHJvZ3JhbXM7IGFuZCB0aGF0IHlvdSBrbm93IHlvdSBjYW4gZG8gdGhlc2UgdGhp
bmdzLgorIyAgCisjIC0gIEFsc28sIGZvciBlYWNoIGF1dGhvcidzIHByb3RlY3Rpb24gYW5kIG91
cnMsIHdlIHdhbnQgdG8gbWFrZSBjZXJ0YWluCisjIC10aGF0IGV2ZXJ5b25lIHVuZGVyc3RhbmRz
IHRoYXQgdGhlcmUgaXMgbm8gd2FycmFudHkgZm9yIHRoaXMgZnJlZQorIyAtc29mdHdhcmUuICBJ
ZiB0aGUgc29mdHdhcmUgaXMgbW9kaWZpZWQgYnkgc29tZW9uZSBlbHNlIGFuZCBwYXNzZWQgb24s
IHdlCisjIC13YW50IGl0cyByZWNpcGllbnRzIHRvIGtub3cgdGhhdCB3aGF0IHRoZXkgaGF2ZSBp
cyBub3QgdGhlIG9yaWdpbmFsLCBzbworIyAtdGhhdCBhbnkgcHJvYmxlbXMgaW50cm9kdWNlZCBi
eSBvdGhlcnMgd2lsbCBub3QgcmVmbGVjdCBvbiB0aGUgb3JpZ2luYWwKKyMgLWF1dGhvcnMnIHJl
cHV0YXRpb25zLgorIyArVG8gcHJvdGVjdCB5b3VyIHJpZ2h0cywgd2UgbmVlZCB0byBtYWtlIHJl
c3RyaWN0aW9ucyB0aGF0IGZvcmJpZCBhbnlvbmUgdG8gZGVueSB5b3UgdGhlc2UgcmlnaHRzIG9y
IHRvIGFzayB5b3UgdG8gc3VycmVuZGVyIHRoZSByaWdodHMuIFRoZXNlIHJlc3RyaWN0aW9ucyB0
cmFuc2xhdGUgdG8gY2VydGFpbiByZXNwb25zaWJpbGl0aWVzIGZvciB5b3UgaWYgeW91IGRpc3Ry
aWJ1dGUgY29waWVzIG9mIHRoZSBzb2Z0d2FyZSwgb3IgaWYgeW91IG1vZGlmeSBpdC4KKyMgIAor
IyAtICBGaW5hbGx5LCBhbnkgZnJlZSBwcm9ncmFtIGlzIHRocmVhdGVuZWQgY29uc3RhbnRseSBi
eSBzb2Z0d2FyZQorIyAtcGF0ZW50cy4gIFdlIHdpc2ggdG8gYXZvaWQgdGhlIGRhbmdlciB0aGF0
IHJlZGlzdHJpYnV0b3JzIG9mIGEgZnJlZQorIyAtcHJvZ3JhbSB3aWxsIGluZGl2aWR1YWxseSBv
YnRhaW4gcGF0ZW50IGxpY2Vuc2VzLCBpbiBlZmZlY3QgbWFraW5nIHRoZQorIyAtcHJvZ3JhbSBw
cm9wcmlldGFyeS4gIFRvIHByZXZlbnQgdGhpcywgd2UgaGF2ZSBtYWRlIGl0IGNsZWFyIHRoYXQg
YW55CisjIC1wYXRlbnQgbXVzdCBiZSBsaWNlbnNlZCBmb3IgZXZlcnlvbmUncyBmcmVlIHVzZSBv
ciBub3QgbGljZW5zZWQgYXQgYWxsLgorIyArRm9yIGV4YW1wbGUsIGlmIHlvdSBkaXN0cmlidXRl
IGNvcGllcyBvZiBzdWNoIGEgcHJvZ3JhbSwgd2hldGhlciBncmF0aXMgb3IgZm9yIGEgZmVlLCB5
b3UgbXVzdCBnaXZlIHRoZSByZWNpcGllbnRzIGFsbCB0aGUgcmlnaHRzIHRoYXQgeW91IGhhdmUu
IFlvdSBtdXN0IG1ha2Ugc3VyZSB0aGF0IHRoZXksIHRvbywgcmVjZWl2ZSBvciBjYW4gZ2V0IHRo
ZSBzb3VyY2UgY29kZS4gQW5kIHlvdSBtdXN0IHNob3cgdGhlbSB0aGVzZSB0ZXJtcyBzbyB0aGV5
IGtub3cgdGhlaXIgcmlnaHRzLgorIyAgCisjIC0gIFRoZSBwcmVjaXNlIHRlcm1zIGFuZCBjb25k
aXRpb25zIGZvciBjb3B5aW5nLCBkaXN0cmlidXRpb24gYW5kCisjIC1tb2RpZmljYXRpb24gZm9s
bG93LgorIyArV2UgcHJvdGVjdCB5b3VyIHJpZ2h0cyB3aXRoIHR3byBzdGVwczogKDEpIGNvcHly
aWdodCB0aGUgc29mdHdhcmUsIGFuZCAoMikgb2ZmZXIgeW91IHRoaXMgbGljZW5zZSB3aGljaCBn
aXZlcyB5b3UgbGVnYWwgcGVybWlzc2lvbiB0byBjb3B5LCBkaXN0cmlidXRlIGFuZC9vciBtb2Rp
ZnkgdGhlIHNvZnR3YXJlLgorIyAgCisjIC0gICAgICAgICAgICAgICAgICAgIEdOVSBHRU5FUkFM
IFBVQkxJQyBMSUNFTlNFCisjIC0gICBURVJNUyBBTkQgQ09ORElUSU9OUyBGT1IgQ09QWUlORywg
RElTVFJJQlVUSU9OIEFORCBNT0RJRklDQVRJT04KKyMgK0Fsc28sIGZvciBlYWNoIGF1dGhvcidz
IHByb3RlY3Rpb24gYW5kIG91cnMsIHdlIHdhbnQgdG8gbWFrZSBjZXJ0YWluIHRoYXQgZXZlcnlv
bmUgdW5kZXJzdGFuZHMgdGhhdCB0aGVyZSBpcyBubyB3YXJyYW50eSBmb3IgdGhpcyBmcmVlIHNv
ZnR3YXJlLiBJZiB0aGUgc29mdHdhcmUgaXMgbW9kaWZpZWQgYnkgc29tZW9uZSBlbHNlIGFuZCBw
YXNzZWQgb24sIHdlIHdhbnQgaXRzIHJlY2lwaWVudHMgdG8ga25vdyB0aGF0IHdoYXQgdGhleSBo
YXZlIGlzIG5vdCB0aGUgb3JpZ2luYWwsIHNvIHRoYXQgYW55IHByb2JsZW1zIGludHJvZHVjZWQg
Ynkgb3RoZXJzIHdpbGwgbm90IHJlZmxlY3Qgb24gdGhlIG9yaWdpbmFsIGF1dGhvcnMnIHJlcHV0
YXRpb25zLgorIyAgCisjIC0gIDAuIFRoaXMgTGljZW5zZSBhcHBsaWVzIHRvIGFueSBwcm9ncmFt
IG9yIG90aGVyIHdvcmsgd2hpY2ggY29udGFpbnMKKyMgLWEgbm90aWNlIHBsYWNlZCBieSB0aGUg
Y29weXJpZ2h0IGhvbGRlciBzYXlpbmcgaXQgbWF5IGJlIGRpc3RyaWJ1dGVkCisjIC11bmRlciB0
aGUgdGVybXMgb2YgdGhpcyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLiAgVGhlICJQcm9ncmFtIiwg
YmVsb3csCisjIC1yZWZlcnMgdG8gYW55IHN1Y2ggcHJvZ3JhbSBvciB3b3JrLCBhbmQgYSAid29y
ayBiYXNlZCBvbiB0aGUgUHJvZ3JhbSIKKyMgLW1lYW5zIGVpdGhlciB0aGUgUHJvZ3JhbSBvciBh
bnkgZGVyaXZhdGl2ZSB3b3JrIHVuZGVyIGNvcHlyaWdodCBsYXc6CisjIC10aGF0IGlzIHRvIHNh
eSwgYSB3b3JrIGNvbnRhaW5pbmcgdGhlIFByb2dyYW0gb3IgYSBwb3J0aW9uIG9mIGl0LAorIyAt
ZWl0aGVyIHZlcmJhdGltIG9yIHdpdGggbW9kaWZpY2F0aW9ucyBhbmQvb3IgdHJhbnNsYXRlZCBp
bnRvIGFub3RoZXIKKyMgLWxhbmd1YWdlLiAgKEhlcmVpbmFmdGVyLCB0cmFuc2xhdGlvbiBpcyBp
bmNsdWRlZCB3aXRob3V0IGxpbWl0YXRpb24gaW4KKyMgLXRoZSB0ZXJtICJtb2RpZmljYXRpb24i
LikgIEVhY2ggbGljZW5zZWUgaXMgYWRkcmVzc2VkIGFzICJ5b3UiLgorIyArRmluYWxseSwgYW55
IGZyZWUgcHJvZ3JhbSBpcyB0aHJlYXRlbmVkIGNvbnN0YW50bHkgYnkgc29mdHdhcmUgcGF0ZW50
cy4gV2Ugd2lzaCB0byBhdm9pZCB0aGUgZGFuZ2VyIHRoYXQgcmVkaXN0cmlidXRvcnMgb2YgYSBm
cmVlIHByb2dyYW0gd2lsbCBpbmRpdmlkdWFsbHkgb2J0YWluIHBhdGVudCBsaWNlbnNlcywgaW4g
ZWZmZWN0IG1ha2luZyB0aGUgcHJvZ3JhbSBwcm9wcmlldGFyeS4gVG8gcHJldmVudCB0aGlzLCB3
ZSBoYXZlIG1hZGUgaXQgY2xlYXIgdGhhdCBhbnkgcGF0ZW50IG11c3QgYmUgbGljZW5zZWQgZm9y
IGV2ZXJ5b25lJ3MgZnJlZSB1c2Ugb3Igbm90IGxpY2Vuc2VkIGF0IGFsbC4KKyMgIAorIyAtQWN0
aXZpdGllcyBvdGhlciB0aGFuIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBhbmQgbW9kaWZpY2F0aW9u
IGFyZSBub3QKKyMgLWNvdmVyZWQgYnkgdGhpcyBMaWNlbnNlOyB0aGV5IGFyZSBvdXRzaWRlIGl0
cyBzY29wZS4gIFRoZSBhY3Qgb2YKKyMgLXJ1bm5pbmcgdGhlIFByb2dyYW0gaXMgbm90IHJlc3Ry
aWN0ZWQsIGFuZCB0aGUgb3V0cHV0IGZyb20gdGhlIFByb2dyYW0KKyMgLWlzIGNvdmVyZWQgb25s
eSBpZiBpdHMgY29udGVudHMgY29uc3RpdHV0ZSBhIHdvcmsgYmFzZWQgb24gdGhlCisjIC1Qcm9n
cmFtIChpbmRlcGVuZGVudCBvZiBoYXZpbmcgYmVlbiBtYWRlIGJ5IHJ1bm5pbmcgdGhlIFByb2dy
YW0pLgorIyAtV2hldGhlciB0aGF0IGlzIHRydWUgZGVwZW5kcyBvbiB3aGF0IHRoZSBQcm9ncmFt
IGRvZXMuCisjICtUaGUgcHJlY2lzZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBmb3IgY29weWluZywg
ZGlzdHJpYnV0aW9uIGFuZCBtb2RpZmljYXRpb24gZm9sbG93LgorIyAgCisjIC0gIDEuIFlvdSBt
YXkgY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMgb2YgdGhlIFByb2dyYW0ncwor
IyAtc291cmNlIGNvZGUgYXMgeW91IHJlY2VpdmUgaXQsIGluIGFueSBtZWRpdW0sIHByb3ZpZGVk
IHRoYXQgeW91CisjIC1jb25zcGljdW91c2x5IGFuZCBhcHByb3ByaWF0ZWx5IHB1Ymxpc2ggb24g
ZWFjaCBjb3B5IGFuIGFwcHJvcHJpYXRlCisjIC1jb3B5cmlnaHQgbm90aWNlIGFuZCBkaXNjbGFp
bWVyIG9mIHdhcnJhbnR5OyBrZWVwIGludGFjdCBhbGwgdGhlCisjIC1ub3RpY2VzIHRoYXQgcmVm
ZXIgdG8gdGhpcyBMaWNlbnNlIGFuZCB0byB0aGUgYWJzZW5jZSBvZiBhbnkgd2FycmFudHk7Cisj
IC1hbmQgZ2l2ZSBhbnkgb3RoZXIgcmVjaXBpZW50cyBvZiB0aGUgUHJvZ3JhbSBhIGNvcHkgb2Yg
dGhpcyBMaWNlbnNlCisjIC1hbG9uZyB3aXRoIHRoZSBQcm9ncmFtLgorIyArVEVSTVMgQU5EIENP
TkRJVElPTlMgRk9SIENPUFlJTkcsIERJU1RSSUJVVElPTiBBTkQgTU9ESUZJQ0FUSU9OCisjICAK
KyMgLVlvdSBtYXkgY2hhcmdlIGEgZmVlIGZvciB0aGUgcGh5c2ljYWwgYWN0IG9mIHRyYW5zZmVy
cmluZyBhIGNvcHksIGFuZAorIyAteW91IG1heSBhdCB5b3VyIG9wdGlvbiBvZmZlciB3YXJyYW50
eSBwcm90ZWN0aW9uIGluIGV4Y2hhbmdlIGZvciBhIGZlZS4KKyMgKzAuIFRoaXMgTGljZW5zZSBh
cHBsaWVzIHRvIGFueSBwcm9ncmFtIG9yIG90aGVyIHdvcmsgd2hpY2ggY29udGFpbnMgYSBub3Rp
Y2UgcGxhY2VkIGJ5IHRoZSBjb3B5cmlnaHQgaG9sZGVyIHNheWluZyBpdCBtYXkgYmUgZGlzdHJp
YnV0ZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoaXMgR2VuZXJhbCBQdWJsaWMgTGljZW5zZS4gVGhl
ICJQcm9ncmFtIiwgYmVsb3csIHJlZmVycyB0byBhbnkgc3VjaCBwcm9ncmFtIG9yIHdvcmssIGFu
ZCBhICJ3b3JrIGJhc2VkIG9uIHRoZSBQcm9ncmFtIiBtZWFucyBlaXRoZXIgdGhlIFByb2dyYW0g
b3IgYW55IGRlcml2YXRpdmUgd29yayB1bmRlciBjb3B5cmlnaHQgbGF3OiB0aGF0IGlzIHRvIHNh
eSwgYSB3b3JrIGNvbnRhaW5pbmcgdGhlIFByb2dyYW0gb3IgYSBwb3J0aW9uIG9mIGl0LCBlaXRo
ZXIgdmVyYmF0aW0gb3Igd2l0aCBtb2RpZmljYXRpb25zIGFuZC9vciB0cmFuc2xhdGVkIGludG8g
YW5vdGhlciBsYW5ndWFnZS4gKEhlcmVpbmFmdGVyLCB0cmFuc2xhdGlvbiBpcyBpbmNsdWRlZCB3
aXRob3V0IGxpbWl0YXRpb24gaW4gdGhlIHRlcm0gIm1vZGlmaWNhdGlvbiIuKSBFYWNoIGxpY2Vu
c2VlIGlzIGFkZHJlc3NlZCBhcyAieW91Ii4KKyMgK0FjdGl2aXRpZXMgb3RoZXIgdGhhbiBjb3B5
aW5nLCBkaXN0cmlidXRpb24gYW5kIG1vZGlmaWNhdGlvbiBhcmUgbm90IGNvdmVyZWQgYnkgdGhp
cyBMaWNlbnNlOyB0aGV5IGFyZSBvdXRzaWRlIGl0cyBzY29wZS4gVGhlIGFjdCBvZiBydW5uaW5n
IHRoZSBQcm9ncmFtIGlzIG5vdCByZXN0cmljdGVkLCBhbmQgdGhlIG91dHB1dCBmcm9tIHRoZSBQ
cm9ncmFtIGlzIGNvdmVyZWQgb25seSBpZiBpdHMgY29udGVudHMgY29uc3RpdHV0ZSBhIHdvcmsg
YmFzZWQgb24gdGhlIFByb2dyYW0gKGluZGVwZW5kZW50IG9mIGhhdmluZyBiZWVuIG1hZGUgYnkg
cnVubmluZyB0aGUgUHJvZ3JhbSkuIFdoZXRoZXIgdGhhdCBpcyB0cnVlIGRlcGVuZHMgb24gd2hh
dCB0aGUgUHJvZ3JhbSBkb2VzLgorIyAgCisjIC0gIDIuIFlvdSBtYXkgbW9kaWZ5IHlvdXIgY29w
eSBvciBjb3BpZXMgb2YgdGhlIFByb2dyYW0gb3IgYW55IHBvcnRpb24KKyMgLW9mIGl0LCB0aHVz
IGZvcm1pbmcgYSB3b3JrIGJhc2VkIG9uIHRoZSBQcm9ncmFtLCBhbmQgY29weSBhbmQKKyMgLWRp
c3RyaWJ1dGUgc3VjaCBtb2RpZmljYXRpb25zIG9yIHdvcmsgdW5kZXIgdGhlIHRlcm1zIG9mIFNl
Y3Rpb24gMQorIyAtYWJvdmUsIHByb3ZpZGVkIHRoYXQgeW91IGFsc28gbWVldCBhbGwgb2YgdGhl
c2UgY29uZGl0aW9uczoKKyMgKzEuIFlvdSBtYXkgY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRp
bSBjb3BpZXMgb2YgdGhlIFByb2dyYW0ncyBzb3VyY2UgY29kZSBhcyB5b3UgcmVjZWl2ZSBpdCwg
aW4gYW55IG1lZGl1bSwgcHJvdmlkZWQgdGhhdCB5b3UgY29uc3BpY3VvdXNseSBhbmQgYXBwcm9w
cmlhdGVseSBwdWJsaXNoIG9uIGVhY2ggY29weSBhbiBhcHByb3ByaWF0ZSBjb3B5cmlnaHQgbm90
aWNlIGFuZCBkaXNjbGFpbWVyIG9mIHdhcnJhbnR5OyBrZWVwIGludGFjdCBhbGwgdGhlIG5vdGlj
ZXMgdGhhdCByZWZlciB0byB0aGlzIExpY2Vuc2UgYW5kIHRvIHRoZSBhYnNlbmNlIG9mIGFueSB3
YXJyYW50eTsgYW5kIGdpdmUgYW55IG90aGVyIHJlY2lwaWVudHMgb2YgdGhlIFByb2dyYW0gYSBj
b3B5IG9mIHRoaXMgTGljZW5zZSBhbG9uZyB3aXRoIHRoZSBQcm9ncmFtLgorIyArWW91IG1heSBj
aGFyZ2UgYSBmZWUgZm9yIHRoZSBwaHlzaWNhbCBhY3Qgb2YgdHJhbnNmZXJyaW5nIGEgY29weSwg
YW5kIHlvdSBtYXkgYXQgeW91ciBvcHRpb24gb2ZmZXIgd2FycmFudHkgcHJvdGVjdGlvbiBpbiBl
eGNoYW5nZSBmb3IgYSBmZWUuCisjICAKKyMgLSAgICBhKSBZb3UgbXVzdCBjYXVzZSB0aGUgbW9k
aWZpZWQgZmlsZXMgdG8gY2FycnkgcHJvbWluZW50IG5vdGljZXMKKyMgLSAgICBzdGF0aW5nIHRo
YXQgeW91IGNoYW5nZWQgdGhlIGZpbGVzIGFuZCB0aGUgZGF0ZSBvZiBhbnkgY2hhbmdlLgorIyAr
Mi4gWW91IG1heSBtb2RpZnkgeW91ciBjb3B5IG9yIGNvcGllcyBvZiB0aGUgUHJvZ3JhbSBvciBh
bnkgcG9ydGlvbiBvZiBpdCwgdGh1cyBmb3JtaW5nIGEgd29yayBiYXNlZCBvbiB0aGUgUHJvZ3Jh
bSwgYW5kIGNvcHkgYW5kIGRpc3RyaWJ1dGUgc3VjaCBtb2RpZmljYXRpb25zIG9yIHdvcmsgdW5k
ZXIgdGhlIHRlcm1zIG9mIFNlY3Rpb24gMSBhYm92ZSwgcHJvdmlkZWQgdGhhdCB5b3UgYWxzbyBt
ZWV0IGFsbCBvZiB0aGVzZSBjb25kaXRpb25zOgorIyArYSkgWW91IG11c3QgY2F1c2UgdGhlIG1v
ZGlmaWVkIGZpbGVzIHRvIGNhcnJ5IHByb21pbmVudCBub3RpY2VzIHN0YXRpbmcgdGhhdCB5b3Ug
Y2hhbmdlZCB0aGUgZmlsZXMgYW5kIHRoZSBkYXRlIG9mIGFueSBjaGFuZ2UuCisjICtiKSBZb3Ug
bXVzdCBjYXVzZSBhbnkgd29yayB0aGF0IHlvdSBkaXN0cmlidXRlIG9yIHB1Ymxpc2gsIHRoYXQg
aW4gd2hvbGUgb3IgaW4gcGFydCBjb250YWlucyBvciBpcyBkZXJpdmVkIGZyb20gdGhlIFByb2dy
YW0gb3IgYW55IHBhcnQgdGhlcmVvZiwgdG8gYmUgbGljZW5zZWQgYXMgYSB3aG9sZSBhdCBubyBj
aGFyZ2UgdG8gYWxsIHRoaXJkIHBhcnRpZXMgdW5kZXIgdGhlIHRlcm1zIG9mIHRoaXMgTGljZW5z
ZS4KKyMgK2MpIElmIHRoZSBtb2RpZmllZCBwcm9ncmFtIG5vcm1hbGx5IHJlYWRzIGNvbW1hbmRz
IGludGVyYWN0aXZlbHkgd2hlbiBydW4sIHlvdSBtdXN0IGNhdXNlIGl0LCB3aGVuIHN0YXJ0ZWQg
cnVubmluZyBmb3Igc3VjaCBpbnRlcmFjdGl2ZSB1c2UgaW4gdGhlIG1vc3Qgb3JkaW5hcnkgd2F5
LCB0byBwcmludCBvciBkaXNwbGF5IGFuIGFubm91bmNlbWVudCBpbmNsdWRpbmcgYW4gYXBwcm9w
cmlhdGUgY29weXJpZ2h0IG5vdGljZSBhbmQgYSBub3RpY2UgdGhhdCB0aGVyZSBpcyBubyB3YXJy
YW50eSAob3IgZWxzZSwgc2F5aW5nIHRoYXQgeW91IHByb3ZpZGUgYSB3YXJyYW50eSkgYW5kIHRo
YXQgdXNlcnMgbWF5IHJlZGlzdHJpYnV0ZSB0aGUgcHJvZ3JhbSB1bmRlciB0aGVzZSBjb25kaXRp
b25zLCBhbmQgdGVsbGluZyB0aGUgdXNlciBob3cgdG8gdmlldyBhIGNvcHkgb2YgdGhpcyBMaWNl
bnNlLiAoRXhjZXB0aW9uOiBpZiB0aGUgUHJvZ3JhbSBpdHNlbGYgaXMgaW50ZXJhY3RpdmUgYnV0
IGRvZXMgbm90IG5vcm1hbGx5IHByaW50IHN1Y2ggYW4gYW5ub3VuY2VtZW50LCB5b3VyIHdvcmsg
YmFzZWQgb24gdGhlIFByb2dyYW0gaXMgbm90IHJlcXVpcmVkIHRvIHByaW50IGFuIGFubm91bmNl
bWVudC4pCisjICtUaGVzZSByZXF1aXJlbWVudHMgYXBwbHkgdG8gdGhlIG1vZGlmaWVkIHdvcmsg
YXMgYSB3aG9sZS4gSWYgaWRlbnRpZmlhYmxlIHNlY3Rpb25zIG9mIHRoYXQgd29yayBhcmUgbm90
IGRlcml2ZWQgZnJvbSB0aGUgUHJvZ3JhbSwgYW5kIGNhbiBiZSByZWFzb25hYmx5IGNvbnNpZGVy
ZWQgaW5kZXBlbmRlbnQgYW5kIHNlcGFyYXRlIHdvcmtzIGluIHRoZW1zZWx2ZXMsIHRoZW4gdGhp
cyBMaWNlbnNlLCBhbmQgaXRzIHRlcm1zLCBkbyBub3QgYXBwbHkgdG8gdGhvc2Ugc2VjdGlvbnMg
d2hlbiB5b3UgZGlzdHJpYnV0ZSB0aGVtIGFzIHNlcGFyYXRlIHdvcmtzLiBCdXQgd2hlbiB5b3Ug
ZGlzdHJpYnV0ZSB0aGUgc2FtZSBzZWN0aW9ucyBhcyBwYXJ0IG9mIGEgd2hvbGUgd2hpY2ggaXMg
YSB3b3JrIGJhc2VkIG9uIHRoZSBQcm9ncmFtLCB0aGUgZGlzdHJpYnV0aW9uIG9mIHRoZSB3aG9s
ZSBtdXN0IGJlIG9uIHRoZSB0ZXJtcyBvZiB0aGlzIExpY2Vuc2UsIHdob3NlIHBlcm1pc3Npb25z
IGZvciBvdGhlciBsaWNlbnNlZXMgZXh0ZW5kIHRvIHRoZSBlbnRpcmUgd2hvbGUsIGFuZCB0aHVz
IHRvIGVhY2ggYW5kIGV2ZXJ5IHBhcnQgcmVnYXJkbGVzcyBvZiB3aG8gd3JvdGUgaXQuCisjICAK
KyMgLSAgICBiKSBZb3UgbXVzdCBjYXVzZSBhbnkgd29yayB0aGF0IHlvdSBkaXN0cmlidXRlIG9y
IHB1Ymxpc2gsIHRoYXQgaW4KKyMgLSAgICB3aG9sZSBvciBpbiBwYXJ0IGNvbnRhaW5zIG9yIGlz
IGRlcml2ZWQgZnJvbSB0aGUgUHJvZ3JhbSBvciBhbnkKKyMgLSAgICBwYXJ0IHRoZXJlb2YsIHRv
IGJlIGxpY2Vuc2VkIGFzIGEgd2hvbGUgYXQgbm8gY2hhcmdlIHRvIGFsbCB0aGlyZAorIyAtICAg
IHBhcnRpZXMgdW5kZXIgdGhlIHRlcm1zIG9mIHRoaXMgTGljZW5zZS4KKyMgK1RodXMsIGl0IGlz
IG5vdCB0aGUgaW50ZW50IG9mIHRoaXMgc2VjdGlvbiB0byBjbGFpbSByaWdodHMgb3IgY29udGVz
dCB5b3VyIHJpZ2h0cyB0byB3b3JrIHdyaXR0ZW4gZW50aXJlbHkgYnkgeW91OyByYXRoZXIsIHRo
ZSBpbnRlbnQgaXMgdG8gZXhlcmNpc2UgdGhlIHJpZ2h0IHRvIGNvbnRyb2wgdGhlIGRpc3RyaWJ1
dGlvbiBvZiBkZXJpdmF0aXZlIG9yIGNvbGxlY3RpdmUgd29ya3MgYmFzZWQgb24gdGhlIFByb2dy
YW0uCisjICAKKyMgLSAgICBjKSBJZiB0aGUgbW9kaWZpZWQgcHJvZ3JhbSBub3JtYWxseSByZWFk
cyBjb21tYW5kcyBpbnRlcmFjdGl2ZWx5CisjIC0gICAgd2hlbiBydW4sIHlvdSBtdXN0IGNhdXNl
IGl0LCB3aGVuIHN0YXJ0ZWQgcnVubmluZyBmb3Igc3VjaAorIyAtICAgIGludGVyYWN0aXZlIHVz
ZSBpbiB0aGUgbW9zdCBvcmRpbmFyeSB3YXksIHRvIHByaW50IG9yIGRpc3BsYXkgYW4KKyMgLSAg
ICBhbm5vdW5jZW1lbnQgaW5jbHVkaW5nIGFuIGFwcHJvcHJpYXRlIGNvcHlyaWdodCBub3RpY2Ug
YW5kIGEKKyMgLSAgICBub3RpY2UgdGhhdCB0aGVyZSBpcyBubyB3YXJyYW50eSAob3IgZWxzZSwg
c2F5aW5nIHRoYXQgeW91IHByb3ZpZGUKKyMgLSAgICBhIHdhcnJhbnR5KSBhbmQgdGhhdCB1c2Vy
cyBtYXkgcmVkaXN0cmlidXRlIHRoZSBwcm9ncmFtIHVuZGVyCisjIC0gICAgdGhlc2UgY29uZGl0
aW9ucywgYW5kIHRlbGxpbmcgdGhlIHVzZXIgaG93IHRvIHZpZXcgYSBjb3B5IG9mIHRoaXMKKyMg
LSAgICBMaWNlbnNlLiAgKEV4Y2VwdGlvbjogaWYgdGhlIFByb2dyYW0gaXRzZWxmIGlzIGludGVy
YWN0aXZlIGJ1dAorIyAtICAgIGRvZXMgbm90IG5vcm1hbGx5IHByaW50IHN1Y2ggYW4gYW5ub3Vu
Y2VtZW50LCB5b3VyIHdvcmsgYmFzZWQgb24KKyMgLSAgICB0aGUgUHJvZ3JhbSBpcyBub3QgcmVx
dWlyZWQgdG8gcHJpbnQgYW4gYW5ub3VuY2VtZW50LikKKyMgK0luIGFkZGl0aW9uLCBtZXJlIGFn
Z3JlZ2F0aW9uIG9mIGFub3RoZXIgd29yayBub3QgYmFzZWQgb24gdGhlIFByb2dyYW0gd2l0aCB0
aGUgUHJvZ3JhbSAob3Igd2l0aCBhIHdvcmsgYmFzZWQgb24gdGhlIFByb2dyYW0pIG9uIGEgdm9s
dW1lIG9mIGEgc3RvcmFnZSBvciBkaXN0cmlidXRpb24gbWVkaXVtIGRvZXMgbm90IGJyaW5nIHRo
ZSBvdGhlciB3b3JrIHVuZGVyIHRoZSBzY29wZSBvZiB0aGlzIExpY2Vuc2UuCisjICAKKyMgLVRo
ZXNlIHJlcXVpcmVtZW50cyBhcHBseSB0byB0aGUgbW9kaWZpZWQgd29yayBhcyBhIHdob2xlLiAg
SWYKKyMgLWlkZW50aWZpYWJsZSBzZWN0aW9ucyBvZiB0aGF0IHdvcmsgYXJlIG5vdCBkZXJpdmVk
IGZyb20gdGhlIFByb2dyYW0sCisjIC1hbmQgY2FuIGJlIHJlYXNvbmFibHkgY29uc2lkZXJlZCBp
bmRlcGVuZGVudCBhbmQgc2VwYXJhdGUgd29ya3MgaW4KKyMgLXRoZW1zZWx2ZXMsIHRoZW4gdGhp
cyBMaWNlbnNlLCBhbmQgaXRzIHRlcm1zLCBkbyBub3QgYXBwbHkgdG8gdGhvc2UKKyMgLXNlY3Rp
b25zIHdoZW4geW91IGRpc3RyaWJ1dGUgdGhlbSBhcyBzZXBhcmF0ZSB3b3Jrcy4gIEJ1dCB3aGVu
IHlvdQorIyAtZGlzdHJpYnV0ZSB0aGUgc2FtZSBzZWN0aW9ucyBhcyBwYXJ0IG9mIGEgd2hvbGUg
d2hpY2ggaXMgYSB3b3JrIGJhc2VkCisjIC1vbiB0aGUgUHJvZ3JhbSwgdGhlIGRpc3RyaWJ1dGlv
biBvZiB0aGUgd2hvbGUgbXVzdCBiZSBvbiB0aGUgdGVybXMgb2YKKyMgLXRoaXMgTGljZW5zZSwg
d2hvc2UgcGVybWlzc2lvbnMgZm9yIG90aGVyIGxpY2Vuc2VlcyBleHRlbmQgdG8gdGhlCisjIC1l
bnRpcmUgd2hvbGUsIGFuZCB0aHVzIHRvIGVhY2ggYW5kIGV2ZXJ5IHBhcnQgcmVnYXJkbGVzcyBv
ZiB3aG8gd3JvdGUgaXQuCisjICszLiBZb3UgbWF5IGNvcHkgYW5kIGRpc3RyaWJ1dGUgdGhlIFBy
b2dyYW0gKG9yIGEgd29yayBiYXNlZCBvbiBpdCwgdW5kZXIgU2VjdGlvbiAyKSBpbiBvYmplY3Qg
Y29kZSBvciBleGVjdXRhYmxlIGZvcm0gdW5kZXIgdGhlIHRlcm1zIG9mIFNlY3Rpb25zIDEgYW5k
IDIgYWJvdmUgcHJvdmlkZWQgdGhhdCB5b3UgYWxzbyBkbyBvbmUgb2YgdGhlIGZvbGxvd2luZzoK
KyMgK2EpIEFjY29tcGFueSBpdCB3aXRoIHRoZSBjb21wbGV0ZSBjb3JyZXNwb25kaW5nIG1hY2hp
bmUtcmVhZGFibGUgc291cmNlIGNvZGUsIHdoaWNoIG11c3QgYmUgZGlzdHJpYnV0ZWQgdW5kZXIg
dGhlIHRlcm1zIG9mIFNlY3Rpb25zIDEgYW5kIDIgYWJvdmUgb24gYSBtZWRpdW0gY3VzdG9tYXJp
bHkgdXNlZCBmb3Igc29mdHdhcmUgaW50ZXJjaGFuZ2U7IG9yLAorIyArYikgQWNjb21wYW55IGl0
IHdpdGggYSB3cml0dGVuIG9mZmVyLCB2YWxpZCBmb3IgYXQgbGVhc3QgdGhyZWUgeWVhcnMsIHRv
IGdpdmUgYW55IHRoaXJkIHBhcnR5LCBmb3IgYSBjaGFyZ2Ugbm8gbW9yZSB0aGFuIHlvdXIgY29z
dCBvZiBwaHlzaWNhbGx5IHBlcmZvcm1pbmcgc291cmNlIGRpc3RyaWJ1dGlvbiwgYSBjb21wbGV0
ZSBtYWNoaW5lLXJlYWRhYmxlIGNvcHkgb2YgdGhlIGNvcnJlc3BvbmRpbmcgc291cmNlIGNvZGUs
IHRvIGJlIGRpc3RyaWJ1dGVkIHVuZGVyIHRoZSB0ZXJtcyBvZiBTZWN0aW9ucyAxIGFuZCAyIGFi
b3ZlIG9uIGEgbWVkaXVtIGN1c3RvbWFyaWx5IHVzZWQgZm9yIHNvZnR3YXJlIGludGVyY2hhbmdl
OyBvciwKKyMgK2MpIEFjY29tcGFueSBpdCB3aXRoIHRoZSBpbmZvcm1hdGlvbiB5b3UgcmVjZWl2
ZWQgYXMgdG8gdGhlIG9mZmVyIHRvIGRpc3RyaWJ1dGUgY29ycmVzcG9uZGluZyBzb3VyY2UgY29k
ZS4gKFRoaXMgYWx0ZXJuYXRpdmUgaXMgYWxsb3dlZCBvbmx5IGZvciBub25jb21tZXJjaWFsIGRp
c3RyaWJ1dGlvbiBhbmQgb25seSBpZiB5b3UgcmVjZWl2ZWQgdGhlIHByb2dyYW0gaW4gb2JqZWN0
IGNvZGUgb3IgZXhlY3V0YWJsZSBmb3JtIHdpdGggc3VjaCBhbiBvZmZlciwgaW4gYWNjb3JkIHdp
dGggU3Vic2VjdGlvbiBiIGFib3ZlLikKKyMgK1RoZSBzb3VyY2UgY29kZSBmb3IgYSB3b3JrIG1l
YW5zIHRoZSBwcmVmZXJyZWQgZm9ybSBvZiB0aGUgd29yayBmb3IgbWFraW5nIG1vZGlmaWNhdGlv
bnMgdG8gaXQuIEZvciBhbiBleGVjdXRhYmxlIHdvcmssIGNvbXBsZXRlIHNvdXJjZSBjb2RlIG1l
YW5zIGFsbCB0aGUgc291cmNlIGNvZGUgZm9yIGFsbCBtb2R1bGVzIGl0IGNvbnRhaW5zLCBwbHVz
IGFueSBhc3NvY2lhdGVkIGludGVyZmFjZSBkZWZpbml0aW9uIGZpbGVzLCBwbHVzIHRoZSBzY3Jp
cHRzIHVzZWQgdG8gY29udHJvbCBjb21waWxhdGlvbiBhbmQgaW5zdGFsbGF0aW9uIG9mIHRoZSBl
eGVjdXRhYmxlLiBIb3dldmVyLCBhcyBhIHNwZWNpYWwgZXhjZXB0aW9uLCB0aGUgc291cmNlIGNv
ZGUgZGlzdHJpYnV0ZWQgbmVlZCBub3QgaW5jbHVkZSBhbnl0aGluZyB0aGF0IGlzIG5vcm1hbGx5
IGRpc3RyaWJ1dGVkIChpbiBlaXRoZXIgc291cmNlIG9yIGJpbmFyeSBmb3JtKSB3aXRoIHRoZSBt
YWpvciBjb21wb25lbnRzIChjb21waWxlciwga2VybmVsLCBhbmQgc28gb24pIG9mIHRoZSBvcGVy
YXRpbmcgc3lzdGVtIG9uIHdoaWNoIHRoZSBleGVjdXRhYmxlIHJ1bnMsIHVubGVzcyB0aGF0IGNv
bXBvbmVudCBpdHNlbGYgYWNjb21wYW5pZXMgdGhlIGV4ZWN1dGFibGUuCisjICAKKyMgLVRodXMs
IGl0IGlzIG5vdCB0aGUgaW50ZW50IG9mIHRoaXMgc2VjdGlvbiB0byBjbGFpbSByaWdodHMgb3Ig
Y29udGVzdAorIyAteW91ciByaWdodHMgdG8gd29yayB3cml0dGVuIGVudGlyZWx5IGJ5IHlvdTsg
cmF0aGVyLCB0aGUgaW50ZW50IGlzIHRvCisjIC1leGVyY2lzZSB0aGUgcmlnaHQgdG8gY29udHJv
bCB0aGUgZGlzdHJpYnV0aW9uIG9mIGRlcml2YXRpdmUgb3IKKyMgLWNvbGxlY3RpdmUgd29ya3Mg
YmFzZWQgb24gdGhlIFByb2dyYW0uCisjICtJZiBkaXN0cmlidXRpb24gb2YgZXhlY3V0YWJsZSBv
ciBvYmplY3QgY29kZSBpcyBtYWRlIGJ5IG9mZmVyaW5nIGFjY2VzcyB0byBjb3B5IGZyb20gYSBk
ZXNpZ25hdGVkIHBsYWNlLCB0aGVuIG9mZmVyaW5nIGVxdWl2YWxlbnQgYWNjZXNzIHRvIGNvcHkg
dGhlIHNvdXJjZSBjb2RlIGZyb20gdGhlIHNhbWUgcGxhY2UgY291bnRzIGFzIGRpc3RyaWJ1dGlv
biBvZiB0aGUgc291cmNlIGNvZGUsIGV2ZW4gdGhvdWdoIHRoaXJkIHBhcnRpZXMgYXJlIG5vdCBj
b21wZWxsZWQgdG8gY29weSB0aGUgc291cmNlIGFsb25nIHdpdGggdGhlIG9iamVjdCBjb2RlLgor
IyAgCisjIC1JbiBhZGRpdGlvbiwgbWVyZSBhZ2dyZWdhdGlvbiBvZiBhbm90aGVyIHdvcmsgbm90
IGJhc2VkIG9uIHRoZSBQcm9ncmFtCisjIC13aXRoIHRoZSBQcm9ncmFtIChvciB3aXRoIGEgd29y
ayBiYXNlZCBvbiB0aGUgUHJvZ3JhbSkgb24gYSB2b2x1bWUgb2YKKyMgLWEgc3RvcmFnZSBvciBk
aXN0cmlidXRpb24gbWVkaXVtIGRvZXMgbm90IGJyaW5nIHRoZSBvdGhlciB3b3JrIHVuZGVyCisj
IC10aGUgc2NvcGUgb2YgdGhpcyBMaWNlbnNlLgorIyArNC4gWW91IG1heSBub3QgY29weSwgbW9k
aWZ5LCBzdWJsaWNlbnNlLCBvciBkaXN0cmlidXRlIHRoZSBQcm9ncmFtIGV4Y2VwdCBhcyBleHBy
ZXNzbHkgcHJvdmlkZWQgdW5kZXIgdGhpcyBMaWNlbnNlLiBBbnkgYXR0ZW1wdCBvdGhlcndpc2Ug
dG8gY29weSwgbW9kaWZ5LCBzdWJsaWNlbnNlIG9yIGRpc3RyaWJ1dGUgdGhlIFByb2dyYW0gaXMg
dm9pZCwgYW5kIHdpbGwgYXV0b21hdGljYWxseSB0ZXJtaW5hdGUgeW91ciByaWdodHMgdW5kZXIg
dGhpcyBMaWNlbnNlLiBIb3dldmVyLCBwYXJ0aWVzIHdobyBoYXZlIHJlY2VpdmVkIGNvcGllcywg
b3IgcmlnaHRzLCBmcm9tIHlvdSB1bmRlciB0aGlzIExpY2Vuc2Ugd2lsbCBub3QgaGF2ZSB0aGVp
ciBsaWNlbnNlcyB0ZXJtaW5hdGVkIHNvIGxvbmcgYXMgc3VjaCBwYXJ0aWVzIHJlbWFpbiBpbiBm
dWxsIGNvbXBsaWFuY2UuCisjICAKKyMgLSAgMy4gWW91IG1heSBjb3B5IGFuZCBkaXN0cmlidXRl
IHRoZSBQcm9ncmFtIChvciBhIHdvcmsgYmFzZWQgb24gaXQsCisjIC11bmRlciBTZWN0aW9uIDIp
IGluIG9iamVjdCBjb2RlIG9yIGV4ZWN1dGFibGUgZm9ybSB1bmRlciB0aGUgdGVybXMgb2YKKyMg
LVNlY3Rpb25zIDEgYW5kIDIgYWJvdmUgcHJvdmlkZWQgdGhhdCB5b3UgYWxzbyBkbyBvbmUgb2Yg
dGhlIGZvbGxvd2luZzoKKyMgKzUuIFlvdSBhcmUgbm90IHJlcXVpcmVkIHRvIGFjY2VwdCB0aGlz
IExpY2Vuc2UsIHNpbmNlIHlvdSBoYXZlIG5vdCBzaWduZWQgaXQuIEhvd2V2ZXIsIG5vdGhpbmcg
ZWxzZSBncmFudHMgeW91IHBlcm1pc3Npb24gdG8gbW9kaWZ5IG9yIGRpc3RyaWJ1dGUgdGhlIFBy
b2dyYW0gb3IgaXRzIGRlcml2YXRpdmUgd29ya3MuIFRoZXNlIGFjdGlvbnMgYXJlIHByb2hpYml0
ZWQgYnkgbGF3IGlmIHlvdSBkbyBub3QgYWNjZXB0IHRoaXMgTGljZW5zZS4gVGhlcmVmb3JlLCBi
eSBtb2RpZnlpbmcgb3IgZGlzdHJpYnV0aW5nIHRoZSBQcm9ncmFtIChvciBhbnkgd29yayBiYXNl
ZCBvbiB0aGUgUHJvZ3JhbSksIHlvdSBpbmRpY2F0ZSB5b3VyIGFjY2VwdGFuY2Ugb2YgdGhpcyBM
aWNlbnNlIHRvIGRvIHNvLCBhbmQgYWxsIGl0cyB0ZXJtcyBhbmQgY29uZGl0aW9ucyBmb3IgY29w
eWluZywgZGlzdHJpYnV0aW5nIG9yIG1vZGlmeWluZyB0aGUgUHJvZ3JhbSBvciB3b3JrcyBiYXNl
ZCBvbiBpdC4KKyMgIAorIyAtICAgIGEpIEFjY29tcGFueSBpdCB3aXRoIHRoZSBjb21wbGV0ZSBj
b3JyZXNwb25kaW5nIG1hY2hpbmUtcmVhZGFibGUKKyMgLSAgICBzb3VyY2UgY29kZSwgd2hpY2gg
bXVzdCBiZSBkaXN0cmlidXRlZCB1bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbnMKKyMgLSAgICAx
IGFuZCAyIGFib3ZlIG9uIGEgbWVkaXVtIGN1c3RvbWFyaWx5IHVzZWQgZm9yIHNvZnR3YXJlIGlu
dGVyY2hhbmdlOyBvciwKKyMgKzYuIEVhY2ggdGltZSB5b3UgcmVkaXN0cmlidXRlIHRoZSBQcm9n
cmFtIChvciBhbnkgd29yayBiYXNlZCBvbiB0aGUgUHJvZ3JhbSksIHRoZSByZWNpcGllbnQgYXV0
b21hdGljYWxseSByZWNlaXZlcyBhIGxpY2Vuc2UgZnJvbSB0aGUgb3JpZ2luYWwgbGljZW5zb3Ig
dG8gY29weSwgZGlzdHJpYnV0ZSBvciBtb2RpZnkgdGhlIFByb2dyYW0gc3ViamVjdCB0byB0aGVz
ZSB0ZXJtcyBhbmQgY29uZGl0aW9ucy4gWW91IG1heSBub3QgaW1wb3NlIGFueSBmdXJ0aGVyIHJl
c3RyaWN0aW9ucyBvbiB0aGUgcmVjaXBpZW50cycgZXhlcmNpc2Ugb2YgdGhlIHJpZ2h0cyBncmFu
dGVkIGhlcmVpbi4gWW91IGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGVuZm9yY2luZyBjb21wbGlh
bmNlIGJ5IHRoaXJkIHBhcnRpZXMgdG8gdGhpcyBMaWNlbnNlLgorIyAgCisjIC0gICAgYikgQWNj
b21wYW55IGl0IHdpdGggYSB3cml0dGVuIG9mZmVyLCB2YWxpZCBmb3IgYXQgbGVhc3QgdGhyZWUK
KyMgLSAgICB5ZWFycywgdG8gZ2l2ZSBhbnkgdGhpcmQgcGFydHksIGZvciBhIGNoYXJnZSBubyBt
b3JlIHRoYW4geW91cgorIyAtICAgIGNvc3Qgb2YgcGh5c2ljYWxseSBwZXJmb3JtaW5nIHNvdXJj
ZSBkaXN0cmlidXRpb24sIGEgY29tcGxldGUKKyMgLSAgICBtYWNoaW5lLXJlYWRhYmxlIGNvcHkg
b2YgdGhlIGNvcnJlc3BvbmRpbmcgc291cmNlIGNvZGUsIHRvIGJlCisjIC0gICAgZGlzdHJpYnV0
ZWQgdW5kZXIgdGhlIHRlcm1zIG9mIFNlY3Rpb25zIDEgYW5kIDIgYWJvdmUgb24gYSBtZWRpdW0K
KyMgLSAgICBjdXN0b21hcmlseSB1c2VkIGZvciBzb2Z0d2FyZSBpbnRlcmNoYW5nZTsgb3IsCisj
ICs3LiBJZiwgYXMgYSBjb25zZXF1ZW5jZSBvZiBhIGNvdXJ0IGp1ZGdtZW50IG9yIGFsbGVnYXRp
b24gb2YgcGF0ZW50IGluZnJpbmdlbWVudCBvciBmb3IgYW55IG90aGVyIHJlYXNvbiAobm90IGxp
bWl0ZWQgdG8gcGF0ZW50IGlzc3VlcyksIGNvbmRpdGlvbnMgYXJlIGltcG9zZWQgb24geW91ICh3
aGV0aGVyIGJ5IGNvdXJ0IG9yZGVyLCBhZ3JlZW1lbnQgb3Igb3RoZXJ3aXNlKSB0aGF0IGNvbnRy
YWRpY3QgdGhlIGNvbmRpdGlvbnMgb2YgdGhpcyBMaWNlbnNlLCB0aGV5IGRvIG5vdCBleGN1c2Ug
eW91IGZyb20gdGhlIGNvbmRpdGlvbnMgb2YgdGhpcyBMaWNlbnNlLiBJZiB5b3UgY2Fubm90IGRp
c3RyaWJ1dGUgc28gYXMgdG8gc2F0aXNmeSBzaW11bHRhbmVvdXNseSB5b3VyIG9ibGlnYXRpb25z
IHVuZGVyIHRoaXMgTGljZW5zZSBhbmQgYW55IG90aGVyIHBlcnRpbmVudCBvYmxpZ2F0aW9ucywg
dGhlbiBhcyBhIGNvbnNlcXVlbmNlIHlvdSBtYXkgbm90IGRpc3RyaWJ1dGUgdGhlIFByb2dyYW0g
YXQgYWxsLiBGb3IgZXhhbXBsZSwgaWYgYSBwYXRlbnQgbGljZW5zZSB3b3VsZCBub3QgcGVybWl0
IHJveWFsdHktZnJlZSByZWRpc3RyaWJ1dGlvbiBvZiB0aGUgUHJvZ3JhbSBieSBhbGwgdGhvc2Ug
d2hvIHJlY2VpdmUgY29waWVzIGRpcmVjdGx5IG9yIGluZGlyZWN0bHkgdGhyb3VnaCB5b3UsIHRo
ZW4gdGhlIG9ubHkgd2F5IHlvdSBjb3VsZCBzYXRpc2Z5IGJvdGggaXQgYW5kIHRoaXMgTGljZW5z
ZSB3b3VsZCBiZSB0byByZWZyYWluIGVudGlyZWx5IGZyb20gZGlzdHJpYnV0aW9uIG9mIHRoZSBQ
cm9ncmFtLgorIyArSWYgYW55IHBvcnRpb24gb2YgdGhpcyBzZWN0aW9uIGlzIGhlbGQgaW52YWxp
ZCBvciB1bmVuZm9yY2VhYmxlIHVuZGVyIGFueSBwYXJ0aWN1bGFyIGNpcmN1bXN0YW5jZSwgdGhl
IGJhbGFuY2Ugb2YgdGhlIHNlY3Rpb24gaXMgaW50ZW5kZWQgdG8gYXBwbHkgYW5kIHRoZSBzZWN0
aW9uIGFzIGEgd2hvbGUgaXMgaW50ZW5kZWQgdG8gYXBwbHkgaW4gb3RoZXIgY2lyY3Vtc3RhbmNl
cy4KKyMgIAorIyAtICAgIGMpIEFjY29tcGFueSBpdCB3aXRoIHRoZSBpbmZvcm1hdGlvbiB5b3Ug
cmVjZWl2ZWQgYXMgdG8gdGhlIG9mZmVyCisjIC0gICAgdG8gZGlzdHJpYnV0ZSBjb3JyZXNwb25k
aW5nIHNvdXJjZSBjb2RlLiAgKFRoaXMgYWx0ZXJuYXRpdmUgaXMKKyMgLSAgICBhbGxvd2VkIG9u
bHkgZm9yIG5vbmNvbW1lcmNpYWwgZGlzdHJpYnV0aW9uIGFuZCBvbmx5IGlmIHlvdQorIyAtICAg
IHJlY2VpdmVkIHRoZSBwcm9ncmFtIGluIG9iamVjdCBjb2RlIG9yIGV4ZWN1dGFibGUgZm9ybSB3
aXRoIHN1Y2gKKyMgLSAgICBhbiBvZmZlciwgaW4gYWNjb3JkIHdpdGggU3Vic2VjdGlvbiBiIGFi
b3ZlLikKKyMgK0l0IGlzIG5vdCB0aGUgcHVycG9zZSBvZiB0aGlzIHNlY3Rpb24gdG8gaW5kdWNl
IHlvdSB0byBpbmZyaW5nZSBhbnkgcGF0ZW50cyBvciBvdGhlciBwcm9wZXJ0eSByaWdodCBjbGFp
bXMgb3IgdG8gY29udGVzdCB2YWxpZGl0eSBvZiBhbnkgc3VjaCBjbGFpbXM7IHRoaXMgc2VjdGlv
biBoYXMgdGhlIHNvbGUgcHVycG9zZSBvZiBwcm90ZWN0aW5nIHRoZSBpbnRlZ3JpdHkgb2YgdGhl
IGZyZWUgc29mdHdhcmUgZGlzdHJpYnV0aW9uIHN5c3RlbSwgd2hpY2ggaXMgaW1wbGVtZW50ZWQg
YnkgcHVibGljIGxpY2Vuc2UgcHJhY3RpY2VzLiBNYW55IHBlb3BsZSBoYXZlIG1hZGUgZ2VuZXJv
dXMgY29udHJpYnV0aW9ucyB0byB0aGUgd2lkZSByYW5nZSBvZiBzb2Z0d2FyZSBkaXN0cmlidXRl
ZCB0aHJvdWdoIHRoYXQgc3lzdGVtIGluIHJlbGlhbmNlIG9uIGNvbnNpc3RlbnQgYXBwbGljYXRp
b24gb2YgdGhhdCBzeXN0ZW07IGl0IGlzIHVwIHRvIHRoZSBhdXRob3IvZG9ub3IgdG8gZGVjaWRl
IGlmIGhlIG9yIHNoZSBpcyB3aWxsaW5nIHRvIGRpc3RyaWJ1dGUgc29mdHdhcmUgdGhyb3VnaCBh
bnkgb3RoZXIgc3lzdGVtIGFuZCBhIGxpY2Vuc2VlIGNhbm5vdCBpbXBvc2UgdGhhdCBjaG9pY2Uu
CisjICAKKyMgLVRoZSBzb3VyY2UgY29kZSBmb3IgYSB3b3JrIG1lYW5zIHRoZSBwcmVmZXJyZWQg
Zm9ybSBvZiB0aGUgd29yayBmb3IKKyMgLW1ha2luZyBtb2RpZmljYXRpb25zIHRvIGl0LiAgRm9y
IGFuIGV4ZWN1dGFibGUgd29yaywgY29tcGxldGUgc291cmNlCisjIC1jb2RlIG1lYW5zIGFsbCB0
aGUgc291cmNlIGNvZGUgZm9yIGFsbCBtb2R1bGVzIGl0IGNvbnRhaW5zLCBwbHVzIGFueQorIyAt
YXNzb2NpYXRlZCBpbnRlcmZhY2UgZGVmaW5pdGlvbiBmaWxlcywgcGx1cyB0aGUgc2NyaXB0cyB1
c2VkIHRvCisjIC1jb250cm9sIGNvbXBpbGF0aW9uIGFuZCBpbnN0YWxsYXRpb24gb2YgdGhlIGV4
ZWN1dGFibGUuICBIb3dldmVyLCBhcyBhCisjIC1zcGVjaWFsIGV4Y2VwdGlvbiwgdGhlIHNvdXJj
ZSBjb2RlIGRpc3RyaWJ1dGVkIG5lZWQgbm90IGluY2x1ZGUKKyMgLWFueXRoaW5nIHRoYXQgaXMg
bm9ybWFsbHkgZGlzdHJpYnV0ZWQgKGluIGVpdGhlciBzb3VyY2Ugb3IgYmluYXJ5CisjIC1mb3Jt
KSB3aXRoIHRoZSBtYWpvciBjb21wb25lbnRzIChjb21waWxlciwga2VybmVsLCBhbmQgc28gb24p
IG9mIHRoZQorIyAtb3BlcmF0aW5nIHN5c3RlbSBvbiB3aGljaCB0aGUgZXhlY3V0YWJsZSBydW5z
LCB1bmxlc3MgdGhhdCBjb21wb25lbnQKKyMgLWl0c2VsZiBhY2NvbXBhbmllcyB0aGUgZXhlY3V0
YWJsZS4KKyMgK1RoaXMgc2VjdGlvbiBpcyBpbnRlbmRlZCB0byBtYWtlIHRob3JvdWdobHkgY2xl
YXIgd2hhdCBpcyBiZWxpZXZlZCB0byBiZSBhIGNvbnNlcXVlbmNlIG9mIHRoZSByZXN0IG9mIHRo
aXMgTGljZW5zZS4KKyMgIAorIyAtSWYgZGlzdHJpYnV0aW9uIG9mIGV4ZWN1dGFibGUgb3Igb2Jq
ZWN0IGNvZGUgaXMgbWFkZSBieSBvZmZlcmluZworIyAtYWNjZXNzIHRvIGNvcHkgZnJvbSBhIGRl
c2lnbmF0ZWQgcGxhY2UsIHRoZW4gb2ZmZXJpbmcgZXF1aXZhbGVudAorIyAtYWNjZXNzIHRvIGNv
cHkgdGhlIHNvdXJjZSBjb2RlIGZyb20gdGhlIHNhbWUgcGxhY2UgY291bnRzIGFzCisjIC1kaXN0
cmlidXRpb24gb2YgdGhlIHNvdXJjZSBjb2RlLCBldmVuIHRob3VnaCB0aGlyZCBwYXJ0aWVzIGFy
ZSBub3QKKyMgLWNvbXBlbGxlZCB0byBjb3B5IHRoZSBzb3VyY2UgYWxvbmcgd2l0aCB0aGUgb2Jq
ZWN0IGNvZGUuCisjICs4LiBJZiB0aGUgZGlzdHJpYnV0aW9uIGFuZC9vciB1c2Ugb2YgdGhlIFBy
b2dyYW0gaXMgcmVzdHJpY3RlZCBpbiBjZXJ0YWluIGNvdW50cmllcyBlaXRoZXIgYnkgcGF0ZW50
cyBvciBieSBjb3B5cmlnaHRlZCBpbnRlcmZhY2VzLCB0aGUgb3JpZ2luYWwgY29weXJpZ2h0IGhv
bGRlciB3aG8gcGxhY2VzIHRoZSBQcm9ncmFtIHVuZGVyIHRoaXMgTGljZW5zZSBtYXkgYWRkIGFu
IGV4cGxpY2l0IGdlb2dyYXBoaWNhbCBkaXN0cmlidXRpb24gbGltaXRhdGlvbiBleGNsdWRpbmcg
dGhvc2UgY291bnRyaWVzLCBzbyB0aGF0IGRpc3RyaWJ1dGlvbiBpcyBwZXJtaXR0ZWQgb25seSBp
biBvciBhbW9uZyBjb3VudHJpZXMgbm90IHRodXMgZXhjbHVkZWQuIEluIHN1Y2ggY2FzZSwgdGhp
cyBMaWNlbnNlIGluY29ycG9yYXRlcyB0aGUgbGltaXRhdGlvbiBhcyBpZiB3cml0dGVuIGluIHRo
ZSBib2R5IG9mIHRoaXMgTGljZW5zZS4KKyMgIAorIyAtICA0LiBZb3UgbWF5IG5vdCBjb3B5LCBt
b2RpZnksIHN1YmxpY2Vuc2UsIG9yIGRpc3RyaWJ1dGUgdGhlIFByb2dyYW0KKyMgLWV4Y2VwdCBh
cyBleHByZXNzbHkgcHJvdmlkZWQgdW5kZXIgdGhpcyBMaWNlbnNlLiAgQW55IGF0dGVtcHQKKyMg
LW90aGVyd2lzZSB0byBjb3B5LCBtb2RpZnksIHN1YmxpY2Vuc2Ugb3IgZGlzdHJpYnV0ZSB0aGUg
UHJvZ3JhbSBpcworIyAtdm9pZCwgYW5kIHdpbGwgYXV0b21hdGljYWxseSB0ZXJtaW5hdGUgeW91
ciByaWdodHMgdW5kZXIgdGhpcyBMaWNlbnNlLgorIyAtSG93ZXZlciwgcGFydGllcyB3aG8gaGF2
ZSByZWNlaXZlZCBjb3BpZXMsIG9yIHJpZ2h0cywgZnJvbSB5b3UgdW5kZXIKKyMgLXRoaXMgTGlj
ZW5zZSB3aWxsIG5vdCBoYXZlIHRoZWlyIGxpY2Vuc2VzIHRlcm1pbmF0ZWQgc28gbG9uZyBhcyBz
dWNoCisjIC1wYXJ0aWVzIHJlbWFpbiBpbiBmdWxsIGNvbXBsaWFuY2UuCisjICs5LiBUaGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uIG1heSBwdWJsaXNoIHJldmlzZWQgYW5kL29yIG5ldyB2ZXJz
aW9ucyBvZiB0aGUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmcm9tIHRpbWUgdG8gdGltZS4gU3Vj
aCBuZXcgdmVyc2lvbnMgd2lsbCBiZSBzaW1pbGFyIGluIHNwaXJpdCB0byB0aGUgcHJlc2VudCB2
ZXJzaW9uLCBidXQgbWF5IGRpZmZlciBpbiBkZXRhaWwgdG8gYWRkcmVzcyBuZXcgcHJvYmxlbXMg
b3IgY29uY2VybnMuCisjICtFYWNoIHZlcnNpb24gaXMgZ2l2ZW4gYSBkaXN0aW5ndWlzaGluZyB2
ZXJzaW9uIG51bWJlci4gSWYgdGhlIFByb2dyYW0gc3BlY2lmaWVzIGEgdmVyc2lvbiBudW1iZXIg
b2YgdGhpcyBMaWNlbnNlIHdoaWNoIGFwcGxpZXMgdG8gaXQgYW5kICJhbnkgbGF0ZXIgdmVyc2lv
biIsIHlvdSBoYXZlIHRoZSBvcHRpb24gb2YgZm9sbG93aW5nIHRoZSB0ZXJtcyBhbmQgY29uZGl0
aW9ucyBlaXRoZXIgb2YgdGhhdCB2ZXJzaW9uIG9yIG9mIGFueSBsYXRlciB2ZXJzaW9uIHB1Ymxp
c2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLiBJZiB0aGUgUHJvZ3JhbSBkb2Vz
IG5vdCBzcGVjaWZ5IGEgdmVyc2lvbiBudW1iZXIgb2YgdGhpcyBMaWNlbnNlLCB5b3UgbWF5IGNo
b29zZSBhbnkgdmVyc2lvbiBldmVyIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uLgorIyAgCisjIC0gIDUuIFlvdSBhcmUgbm90IHJlcXVpcmVkIHRvIGFjY2VwdCB0aGlz
IExpY2Vuc2UsIHNpbmNlIHlvdSBoYXZlIG5vdAorIyAtc2lnbmVkIGl0LiAgSG93ZXZlciwgbm90
aGluZyBlbHNlIGdyYW50cyB5b3UgcGVybWlzc2lvbiB0byBtb2RpZnkgb3IKKyMgLWRpc3RyaWJ1
dGUgdGhlIFByb2dyYW0gb3IgaXRzIGRlcml2YXRpdmUgd29ya3MuICBUaGVzZSBhY3Rpb25zIGFy
ZQorIyAtcHJvaGliaXRlZCBieSBsYXcgaWYgeW91IGRvIG5vdCBhY2NlcHQgdGhpcyBMaWNlbnNl
LiAgVGhlcmVmb3JlLCBieQorIyAtbW9kaWZ5aW5nIG9yIGRpc3RyaWJ1dGluZyB0aGUgUHJvZ3Jh
bSAob3IgYW55IHdvcmsgYmFzZWQgb24gdGhlCisjIC1Qcm9ncmFtKSwgeW91IGluZGljYXRlIHlv
dXIgYWNjZXB0YW5jZSBvZiB0aGlzIExpY2Vuc2UgdG8gZG8gc28sIGFuZAorIyAtYWxsIGl0cyB0
ZXJtcyBhbmQgY29uZGl0aW9ucyBmb3IgY29weWluZywgZGlzdHJpYnV0aW5nIG9yIG1vZGlmeWlu
ZworIyAtdGhlIFByb2dyYW0gb3Igd29ya3MgYmFzZWQgb24gaXQuCisjICsxMC4gSWYgeW91IHdp
c2ggdG8gaW5jb3Jwb3JhdGUgcGFydHMgb2YgdGhlIFByb2dyYW0gaW50byBvdGhlciBmcmVlIHBy
b2dyYW1zIHdob3NlIGRpc3RyaWJ1dGlvbiBjb25kaXRpb25zIGFyZSBkaWZmZXJlbnQsIHdyaXRl
IHRvIHRoZSBhdXRob3IgdG8gYXNrIGZvciBwZXJtaXNzaW9uLiBGb3Igc29mdHdhcmUgd2hpY2gg
aXMgY29weXJpZ2h0ZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgd3JpdGUgdG8g
dGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgd2Ugc29tZXRpbWVzIG1ha2UgZXhjZXB0aW9u
cyBmb3IgdGhpcy4gT3VyIGRlY2lzaW9uIHdpbGwgYmUgZ3VpZGVkIGJ5IHRoZSB0d28gZ29hbHMg
b2YgcHJlc2VydmluZyB0aGUgZnJlZSBzdGF0dXMgb2YgYWxsIGRlcml2YXRpdmVzIG9mIG91ciBm
cmVlIHNvZnR3YXJlIGFuZCBvZiBwcm9tb3RpbmcgdGhlIHNoYXJpbmcgYW5kIHJldXNlIG9mIHNv
ZnR3YXJlIGdlbmVyYWxseS4KKyMgK05PIFdBUlJBTlRZCisjICAKKyMgLSAgNi4gRWFjaCB0aW1l
IHlvdSByZWRpc3RyaWJ1dGUgdGhlIFByb2dyYW0gKG9yIGFueSB3b3JrIGJhc2VkIG9uIHRoZQor
IyAtUHJvZ3JhbSksIHRoZSByZWNpcGllbnQgYXV0b21hdGljYWxseSByZWNlaXZlcyBhIGxpY2Vu
c2UgZnJvbSB0aGUKKyMgLW9yaWdpbmFsIGxpY2Vuc29yIHRvIGNvcHksIGRpc3RyaWJ1dGUgb3Ig
bW9kaWZ5IHRoZSBQcm9ncmFtIHN1YmplY3QgdG8KKyMgLXRoZXNlIHRlcm1zIGFuZCBjb25kaXRp
b25zLiAgWW91IG1heSBub3QgaW1wb3NlIGFueSBmdXJ0aGVyCisjIC1yZXN0cmljdGlvbnMgb24g
dGhlIHJlY2lwaWVudHMnIGV4ZXJjaXNlIG9mIHRoZSByaWdodHMgZ3JhbnRlZCBoZXJlaW4uCisj
IC1Zb3UgYXJlIG5vdCByZXNwb25zaWJsZSBmb3IgZW5mb3JjaW5nIGNvbXBsaWFuY2UgYnkgdGhp
cmQgcGFydGllcyB0bworIyAtdGhpcyBMaWNlbnNlLgorIyArMTEuIEJFQ0FVU0UgVEhFIFBST0dS
QU0gSVMgTElDRU5TRUQgRlJFRSBPRiBDSEFSR0UsIFRIRVJFIElTIE5PIFdBUlJBTlRZIEZPUiBU
SEUgUFJPR1JBTSwgVE8gVEhFIEVYVEVOVCBQRVJNSVRURUQgQlkgQVBQTElDQUJMRSBMQVcuIEVY
Q0VQVCBXSEVOIE9USEVSV0lTRSBTVEFURUQgSU4gV1JJVElORyBUSEUgQ09QWVJJR0hUIEhPTERF
UlMgQU5EL09SIE9USEVSIFBBUlRJRVMgUFJPVklERSBUSEUgUFJPR1JBTSAiQVMgSVMiIFdJVEhP
VVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVJVEhFUiBFWFBSRVNTRUQgT1IgSU1QTElFRCwgSU5D
TFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFRIRSBJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVS
Q0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gVEhFIEVO
VElSRSBSSVNLIEFTIFRPIFRIRSBRVUFMSVRZIEFORCBQRVJGT1JNQU5DRSBPRiBUSEUgUFJPR1JB
TSBJUyBXSVRIIFlPVS4gU0hPVUxEIFRIRSBQUk9HUkFNIFBST1ZFIERFRkVDVElWRSwgWU9VIEFT
U1VNRSBUSEUgQ09TVCBPRiBBTEwgTkVDRVNTQVJZIFNFUlZJQ0lORywgUkVQQUlSIE9SIENPUlJF
Q1RJT04uCisjICAKKyMgLSAgNy4gSWYsIGFzIGEgY29uc2VxdWVuY2Ugb2YgYSBjb3VydCBqdWRn
bWVudCBvciBhbGxlZ2F0aW9uIG9mIHBhdGVudAorIyAtaW5mcmluZ2VtZW50IG9yIGZvciBhbnkg
b3RoZXIgcmVhc29uIChub3QgbGltaXRlZCB0byBwYXRlbnQgaXNzdWVzKSwKKyMgLWNvbmRpdGlv
bnMgYXJlIGltcG9zZWQgb24geW91ICh3aGV0aGVyIGJ5IGNvdXJ0IG9yZGVyLCBhZ3JlZW1lbnQg
b3IKKyMgLW90aGVyd2lzZSkgdGhhdCBjb250cmFkaWN0IHRoZSBjb25kaXRpb25zIG9mIHRoaXMg
TGljZW5zZSwgdGhleSBkbyBub3QKKyMgLWV4Y3VzZSB5b3UgZnJvbSB0aGUgY29uZGl0aW9ucyBv
ZiB0aGlzIExpY2Vuc2UuICBJZiB5b3UgY2Fubm90CisjIC1kaXN0cmlidXRlIHNvIGFzIHRvIHNh
dGlzZnkgc2ltdWx0YW5lb3VzbHkgeW91ciBvYmxpZ2F0aW9ucyB1bmRlciB0aGlzCisjIC1MaWNl
bnNlIGFuZCBhbnkgb3RoZXIgcGVydGluZW50IG9ibGlnYXRpb25zLCB0aGVuIGFzIGEgY29uc2Vx
dWVuY2UgeW91CisjIC1tYXkgbm90IGRpc3RyaWJ1dGUgdGhlIFByb2dyYW0gYXQgYWxsLiAgRm9y
IGV4YW1wbGUsIGlmIGEgcGF0ZW50CisjIC1saWNlbnNlIHdvdWxkIG5vdCBwZXJtaXQgcm95YWx0
eS1mcmVlIHJlZGlzdHJpYnV0aW9uIG9mIHRoZSBQcm9ncmFtIGJ5CisjIC1hbGwgdGhvc2Ugd2hv
IHJlY2VpdmUgY29waWVzIGRpcmVjdGx5IG9yIGluZGlyZWN0bHkgdGhyb3VnaCB5b3UsIHRoZW4K
KyMgLXRoZSBvbmx5IHdheSB5b3UgY291bGQgc2F0aXNmeSBib3RoIGl0IGFuZCB0aGlzIExpY2Vu
c2Ugd291bGQgYmUgdG8KKyMgLXJlZnJhaW4gZW50aXJlbHkgZnJvbSBkaXN0cmlidXRpb24gb2Yg
dGhlIFByb2dyYW0uCisjIC0KKyMgLUlmIGFueSBwb3J0aW9uIG9mIHRoaXMgc2VjdGlvbiBpcyBo
ZWxkIGludmFsaWQgb3IgdW5lbmZvcmNlYWJsZSB1bmRlcgorIyAtYW55IHBhcnRpY3VsYXIgY2ly
Y3Vtc3RhbmNlLCB0aGUgYmFsYW5jZSBvZiB0aGUgc2VjdGlvbiBpcyBpbnRlbmRlZCB0bworIyAt
YXBwbHkgYW5kIHRoZSBzZWN0aW9uIGFzIGEgd2hvbGUgaXMgaW50ZW5kZWQgdG8gYXBwbHkgaW4g
b3RoZXIKKyMgLWNpcmN1bXN0YW5jZXMuCisjIC0KKyMgLUl0IGlzIG5vdCB0aGUgcHVycG9zZSBv
ZiB0aGlzIHNlY3Rpb24gdG8gaW5kdWNlIHlvdSB0byBpbmZyaW5nZSBhbnkKKyMgLXBhdGVudHMg
b3Igb3RoZXIgcHJvcGVydHkgcmlnaHQgY2xhaW1zIG9yIHRvIGNvbnRlc3QgdmFsaWRpdHkgb2Yg
YW55CisjIC1zdWNoIGNsYWltczsgdGhpcyBzZWN0aW9uIGhhcyB0aGUgc29sZSBwdXJwb3NlIG9m
IHByb3RlY3RpbmcgdGhlCisjIC1pbnRlZ3JpdHkgb2YgdGhlIGZyZWUgc29mdHdhcmUgZGlzdHJp
YnV0aW9uIHN5c3RlbSwgd2hpY2ggaXMKKyMgLWltcGxlbWVudGVkIGJ5IHB1YmxpYyBsaWNlbnNl
IHByYWN0aWNlcy4gIE1hbnkgcGVvcGxlIGhhdmUgbWFkZQorIyAtZ2VuZXJvdXMgY29udHJpYnV0
aW9ucyB0byB0aGUgd2lkZSByYW5nZSBvZiBzb2Z0d2FyZSBkaXN0cmlidXRlZAorIyAtdGhyb3Vn
aCB0aGF0IHN5c3RlbSBpbiByZWxpYW5jZSBvbiBjb25zaXN0ZW50IGFwcGxpY2F0aW9uIG9mIHRo
YXQKKyMgLXN5c3RlbTsgaXQgaXMgdXAgdG8gdGhlIGF1dGhvci9kb25vciB0byBkZWNpZGUgaWYg
aGUgb3Igc2hlIGlzIHdpbGxpbmcKKyMgLXRvIGRpc3RyaWJ1dGUgc29mdHdhcmUgdGhyb3VnaCBh
bnkgb3RoZXIgc3lzdGVtIGFuZCBhIGxpY2Vuc2VlIGNhbm5vdAorIyAtaW1wb3NlIHRoYXQgY2hv
aWNlLgorIyAtCisjIC1UaGlzIHNlY3Rpb24gaXMgaW50ZW5kZWQgdG8gbWFrZSB0aG9yb3VnaGx5
IGNsZWFyIHdoYXQgaXMgYmVsaWV2ZWQgdG8KKyMgLWJlIGEgY29uc2VxdWVuY2Ugb2YgdGhlIHJl
c3Qgb2YgdGhpcyBMaWNlbnNlLgorIyAtCisjIC0gIDguIElmIHRoZSBkaXN0cmlidXRpb24gYW5k
L29yIHVzZSBvZiB0aGUgUHJvZ3JhbSBpcyByZXN0cmljdGVkIGluCisjIC1jZXJ0YWluIGNvdW50
cmllcyBlaXRoZXIgYnkgcGF0ZW50cyBvciBieSBjb3B5cmlnaHRlZCBpbnRlcmZhY2VzLCB0aGUK
KyMgLW9yaWdpbmFsIGNvcHlyaWdodCBob2xkZXIgd2hvIHBsYWNlcyB0aGUgUHJvZ3JhbSB1bmRl
ciB0aGlzIExpY2Vuc2UKKyMgLW1heSBhZGQgYW4gZXhwbGljaXQgZ2VvZ3JhcGhpY2FsIGRpc3Ry
aWJ1dGlvbiBsaW1pdGF0aW9uIGV4Y2x1ZGluZworIyAtdGhvc2UgY291bnRyaWVzLCBzbyB0aGF0
IGRpc3RyaWJ1dGlvbiBpcyBwZXJtaXR0ZWQgb25seSBpbiBvciBhbW9uZworIyAtY291bnRyaWVz
IG5vdCB0aHVzIGV4Y2x1ZGVkLiAgSW4gc3VjaCBjYXNlLCB0aGlzIExpY2Vuc2UgaW5jb3Jwb3Jh
dGVzCisjIC10aGUgbGltaXRhdGlvbiBhcyBpZiB3cml0dGVuIGluIHRoZSBib2R5IG9mIHRoaXMg
TGljZW5zZS4KKyMgLQorIyAtICA5LiBUaGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uIG1heSBw
dWJsaXNoIHJldmlzZWQgYW5kL29yIG5ldyB2ZXJzaW9ucworIyAtb2YgdGhlIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZnJvbSB0aW1lIHRvIHRpbWUuICBTdWNoIG5ldyB2ZXJzaW9ucyB3aWxsCisj
IC1iZSBzaW1pbGFyIGluIHNwaXJpdCB0byB0aGUgcHJlc2VudCB2ZXJzaW9uLCBidXQgbWF5IGRp
ZmZlciBpbiBkZXRhaWwgdG8KKyMgLWFkZHJlc3MgbmV3IHByb2JsZW1zIG9yIGNvbmNlcm5zLgor
IyAtCisjIC1FYWNoIHZlcnNpb24gaXMgZ2l2ZW4gYSBkaXN0aW5ndWlzaGluZyB2ZXJzaW9uIG51
bWJlci4gIElmIHRoZSBQcm9ncmFtCisjIC1zcGVjaWZpZXMgYSB2ZXJzaW9uIG51bWJlciBvZiB0
aGlzIExpY2Vuc2Ugd2hpY2ggYXBwbGllcyB0byBpdCBhbmQgImFueQorIyAtbGF0ZXIgdmVyc2lv
biIsIHlvdSBoYXZlIHRoZSBvcHRpb24gb2YgZm9sbG93aW5nIHRoZSB0ZXJtcyBhbmQgY29uZGl0
aW9ucworIyAtZWl0aGVyIG9mIHRoYXQgdmVyc2lvbiBvciBvZiBhbnkgbGF0ZXIgdmVyc2lvbiBw
dWJsaXNoZWQgYnkgdGhlIEZyZWUKKyMgLVNvZnR3YXJlIEZvdW5kYXRpb24uICBJZiB0aGUgUHJv
Z3JhbSBkb2VzIG5vdCBzcGVjaWZ5IGEgdmVyc2lvbiBudW1iZXIgb2YKKyMgLXRoaXMgTGljZW5z
ZSwgeW91IG1heSBjaG9vc2UgYW55IHZlcnNpb24gZXZlciBwdWJsaXNoZWQgYnkgdGhlIEZyZWUg
U29mdHdhcmUKKyMgLUZvdW5kYXRpb24uCisjIC0KKyMgLSAgMTAuIElmIHlvdSB3aXNoIHRvIGlu
Y29ycG9yYXRlIHBhcnRzIG9mIHRoZSBQcm9ncmFtIGludG8gb3RoZXIgZnJlZQorIyAtcHJvZ3Jh
bXMgd2hvc2UgZGlzdHJpYnV0aW9uIGNvbmRpdGlvbnMgYXJlIGRpZmZlcmVudCwgd3JpdGUgdG8g
dGhlIGF1dGhvcgorIyAtdG8gYXNrIGZvciBwZXJtaXNzaW9uLiAgRm9yIHNvZnR3YXJlIHdoaWNo
IGlzIGNvcHlyaWdodGVkIGJ5IHRoZSBGcmVlCisjIC1Tb2Z0d2FyZSBGb3VuZGF0aW9uLCB3cml0
ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyB3ZSBzb21ldGltZXMKKyMgLW1ha2Ug
ZXhjZXB0aW9ucyBmb3IgdGhpcy4gIE91ciBkZWNpc2lvbiB3aWxsIGJlIGd1aWRlZCBieSB0aGUg
dHdvIGdvYWxzCisjIC1vZiBwcmVzZXJ2aW5nIHRoZSBmcmVlIHN0YXR1cyBvZiBhbGwgZGVyaXZh
dGl2ZXMgb2Ygb3VyIGZyZWUgc29mdHdhcmUgYW5kCisjIC1vZiBwcm9tb3RpbmcgdGhlIHNoYXJp
bmcgYW5kIHJldXNlIG9mIHNvZnR3YXJlIGdlbmVyYWxseS4KKyMgLQorIyAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIE5PIFdBUlJBTlRZCisjIC0KKyMgLSAgMTEuIEJFQ0FVU0UgVEhFIFBS
T0dSQU0gSVMgTElDRU5TRUQgRlJFRSBPRiBDSEFSR0UsIFRIRVJFIElTIE5PIFdBUlJBTlRZCisj
IC1GT1IgVEhFIFBST0dSQU0sIFRPIFRIRSBFWFRFTlQgUEVSTUlUVEVEIEJZIEFQUExJQ0FCTEUg
TEFXLiAgRVhDRVBUIFdIRU4KKyMgLU9USEVSV0lTRSBTVEFURUQgSU4gV1JJVElORyBUSEUgQ09Q
WVJJR0hUIEhPTERFUlMgQU5EL09SIE9USEVSIFBBUlRJRVMKKyMgLVBST1ZJREUgVEhFIFBST0dS
QU0gIkFTIElTIiBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFSVRIRVIgRVhQUkVTU0VE
CisjIC1PUiBJTVBMSUVELCBJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgVEhFIElNUExJ
RUQgV0FSUkFOVElFUyBPRgorIyAtTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBB
UlRJQ1VMQVIgUFVSUE9TRS4gIFRIRSBFTlRJUkUgUklTSyBBUworIyAtVE8gVEhFIFFVQUxJVFkg
QU5EIFBFUkZPUk1BTkNFIE9GIFRIRSBQUk9HUkFNIElTIFdJVEggWU9VLiAgU0hPVUxEIFRIRQor
IyAtUFJPR1JBTSBQUk9WRSBERUZFQ1RJVkUsIFlPVSBBU1NVTUUgVEhFIENPU1QgT0YgQUxMIE5F
Q0VTU0FSWSBTRVJWSUNJTkcsCisjIC1SRVBBSVIgT1IgQ09SUkVDVElPTi4KKyMgLQorIyAtICAx
Mi4gSU4gTk8gRVZFTlQgVU5MRVNTIFJFUVVJUkVEIEJZIEFQUExJQ0FCTEUgTEFXIE9SIEFHUkVF
RCBUTyBJTiBXUklUSU5HCisjIC1XSUxMIEFOWSBDT1BZUklHSFQgSE9MREVSLCBPUiBBTlkgT1RI
RVIgUEFSVFkgV0hPIE1BWSBNT0RJRlkgQU5EL09SCisjIC1SRURJU1RSSUJVVEUgVEhFIFBST0dS
QU0gQVMgUEVSTUlUVEVEIEFCT1ZFLCBCRSBMSUFCTEUgVE8gWU9VIEZPUiBEQU1BR0VTLAorIyAt
SU5DTFVESU5HIEFOWSBHRU5FUkFMLCBTUEVDSUFMLCBJTkNJREVOVEFMIE9SIENPTlNFUVVFTlRJ
QUwgREFNQUdFUyBBUklTSU5HCisjIC1PVVQgT0YgVEhFIFVTRSBPUiBJTkFCSUxJVFkgVE8gVVNF
IFRIRSBQUk9HUkFNIChJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVECisjIC1UTyBMT1NTIE9GIERB
VEEgT1IgREFUQSBCRUlORyBSRU5ERVJFRCBJTkFDQ1VSQVRFIE9SIExPU1NFUyBTVVNUQUlORUQg
QlkKKyMgLVlPVSBPUiBUSElSRCBQQVJUSUVTIE9SIEEgRkFJTFVSRSBPRiBUSEUgUFJPR1JBTSBU
TyBPUEVSQVRFIFdJVEggQU5ZIE9USEVSCisjIC1QUk9HUkFNUyksIEVWRU4gSUYgU1VDSCBIT0xE
RVIgT1IgT1RIRVIgUEFSVFkgSEFTIEJFRU4gQURWSVNFRCBPRiBUSEUKKyMgLVBPU1NJQklMSVRZ
IE9GIFNVQ0ggREFNQUdFUy4KKyMgLQorIyAtICAgICAgICAgICAgICAgICAgICAgRU5EIE9GIFRF
Uk1TIEFORCBDT05ESVRJT05TCisjIC0KKyMgLSAgICAgICAgICAgIEhvdyB0byBBcHBseSBUaGVz
ZSBUZXJtcyB0byBZb3VyIE5ldyBQcm9ncmFtcworIyAtCisjIC0gIElmIHlvdSBkZXZlbG9wIGEg
bmV3IHByb2dyYW0sIGFuZCB5b3Ugd2FudCBpdCB0byBiZSBvZiB0aGUgZ3JlYXRlc3QKKyMgLXBv
c3NpYmxlIHVzZSB0byB0aGUgcHVibGljLCB0aGUgYmVzdCB3YXkgdG8gYWNoaWV2ZSB0aGlzIGlz
IHRvIG1ha2UgaXQKKyMgLWZyZWUgc29mdHdhcmUgd2hpY2ggZXZlcnlvbmUgY2FuIHJlZGlzdHJp
YnV0ZSBhbmQgY2hhbmdlIHVuZGVyIHRoZXNlIHRlcm1zLgorIyAtCisjIC0gIFRvIGRvIHNvLCBh
dHRhY2ggdGhlIGZvbGxvd2luZyBub3RpY2VzIHRvIHRoZSBwcm9ncmFtLiAgSXQgaXMgc2FmZXN0
CisjIC10byBhdHRhY2ggdGhlbSB0byB0aGUgc3RhcnQgb2YgZWFjaCBzb3VyY2UgZmlsZSB0byBt
b3N0IGVmZmVjdGl2ZWx5CisjIC1jb252ZXkgdGhlIGV4Y2x1c2lvbiBvZiB3YXJyYW50eTsgYW5k
IGVhY2ggZmlsZSBzaG91bGQgaGF2ZSBhdCBsZWFzdAorIyAtdGhlICJjb3B5cmlnaHQiIGxpbmUg
YW5kIGEgcG9pbnRlciB0byB3aGVyZSB0aGUgZnVsbCBub3RpY2UgaXMgZm91bmQuCisjIC0KKyMg
LSAgICA8b25lIGxpbmUgdG8gZ2l2ZSB0aGUgcHJvZ3JhbSdzIG5hbWUgYW5kIGEgYnJpZWYgaWRl
YSBvZiB3aGF0IGl0IGRvZXMuPgorIyAtICAgIENvcHlyaWdodCAoQykgPHllYXI+ICA8bmFtZSBv
ZiBhdXRob3I+CisjIC0KKyMgLSAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91
IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorIyAtICAgIGl0IHVuZGVyIHRoZSB0
ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Cisj
IC0gICAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0
aGUgTGljZW5zZSwgb3IKKyMgLSAgICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9u
LgorIyAtCisjIC0gICAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRo
YXQgaXQgd2lsbCBiZSB1c2VmdWwsCisjIC0gICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3
aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyMgLSAgICBNRVJDSEFOVEFCSUxJ
VFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisjIC0gICAg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgLQorIyAtICAg
IFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGFsb25nCisjIC0gICAgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUg
dG8gdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgLSAgICA1MSBGcmFua2xp
biBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBLgorIyAtCisj
IC1BbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFjdCB5b3UgYnkgZWxlY3Ryb25p
YyBhbmQgcGFwZXIgbWFpbC4KKyMgLQorIyAtSWYgdGhlIHByb2dyYW0gaXMgaW50ZXJhY3RpdmUs
IG1ha2UgaXQgb3V0cHV0IGEgc2hvcnQgbm90aWNlIGxpa2UgdGhpcworIyAtd2hlbiBpdCBzdGFy
dHMgaW4gYW4gaW50ZXJhY3RpdmUgbW9kZToKKyMgLQorIyAtICAgIEdub21vdmlzaW9uIHZlcnNp
b24gNjksIENvcHlyaWdodCAoQykgeWVhciBuYW1lIG9mIGF1dGhvcgorIyAtICAgIEdub21vdmlz
aW9uIGNvbWVzIHdpdGggQUJTT0xVVEVMWSBOTyBXQVJSQU5UWTsgZm9yIGRldGFpbHMgdHlwZSBg
c2hvdyB3Jy4KKyMgLSAgICBUaGlzIGlzIGZyZWUgc29mdHdhcmUsIGFuZCB5b3UgYXJlIHdlbGNv
bWUgdG8gcmVkaXN0cmlidXRlIGl0CisjIC0gICAgdW5kZXIgY2VydGFpbiBjb25kaXRpb25zOyB0
eXBlIGBzaG93IGMnIGZvciBkZXRhaWxzLgorIyAtCisjIC1UaGUgaHlwb3RoZXRpY2FsIGNvbW1h
bmRzIGBzaG93IHcnIGFuZCBgc2hvdyBjJyBzaG91bGQgc2hvdyB0aGUgYXBwcm9wcmlhdGUKKyMg
LXBhcnRzIG9mIHRoZSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLiAgT2YgY291cnNlLCB0aGUgY29t
bWFuZHMgeW91IHVzZSBtYXkKKyMgLWJlIGNhbGxlZCBzb21ldGhpbmcgb3RoZXIgdGhhbiBgc2hv
dyB3JyBhbmQgYHNob3cgYyc7IHRoZXkgY291bGQgZXZlbiBiZQorIyAtbW91c2UtY2xpY2tzIG9y
IG1lbnUgaXRlbXMtLXdoYXRldmVyIHN1aXRzIHlvdXIgcHJvZ3JhbS4KKyMgLQorIyAtWW91IHNo
b3VsZCBhbHNvIGdldCB5b3VyIGVtcGxveWVyIChpZiB5b3Ugd29yayBhcyBhIHByb2dyYW1tZXIp
IG9yIHlvdXIKKyMgLXNjaG9vbCwgaWYgYW55LCB0byBzaWduIGEgImNvcHlyaWdodCBkaXNjbGFp
bWVyIiBmb3IgdGhlIHByb2dyYW0sIGlmCisjIC1uZWNlc3NhcnkuICBIZXJlIGlzIGEgc2FtcGxl
OyBhbHRlciB0aGUgbmFtZXM6CisjIC0KKyMgLSAgWW95b2R5bmUsIEluYy4sIGhlcmVieSBkaXNj
bGFpbXMgYWxsIGNvcHlyaWdodCBpbnRlcmVzdCBpbiB0aGUgcHJvZ3JhbQorIyAtICBgR25vbW92
aXNpb24nICh3aGljaCBtYWtlcyBwYXNzZXMgYXQgY29tcGlsZXJzKSB3cml0dGVuIGJ5IEphbWVz
IEhhY2tlci4KKyMgLQorIyAtICA8c2lnbmF0dXJlIG9mIFR5IENvb24+LCAxIEFwcmlsIDE5ODkK
KyMgLSAgVHkgQ29vbiwgUHJlc2lkZW50IG9mIFZpY2UKKyMgLQorIyAtVGhpcyBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGRvZXMgbm90IHBlcm1pdCBpbmNvcnBvcmF0aW5nIHlvdXIgcHJvZ3JhbSBp
bnRvCisjIC1wcm9wcmlldGFyeSBwcm9ncmFtcy4gIElmIHlvdXIgcHJvZ3JhbSBpcyBhIHN1YnJv
dXRpbmUgbGlicmFyeSwgeW91IG1heQorIyAtY29uc2lkZXIgaXQgbW9yZSB1c2VmdWwgdG8gcGVy
bWl0IGxpbmtpbmcgcHJvcHJpZXRhcnkgYXBwbGljYXRpb25zIHdpdGggdGhlCisjIC1saWJyYXJ5
LiAgSWYgdGhpcyBpcyB3aGF0IHlvdSB3YW50IHRvIGRvLCB1c2UgdGhlIEdOVSBMZXNzZXIgR2Vu
ZXJhbAorIyAtUHVibGljIExpY2Vuc2UgaW5zdGVhZCBvZiB0aGlzIExpY2Vuc2UuCisjICsxMi4g
SU4gTk8gRVZFTlQgVU5MRVNTIFJFUVVJUkVEIEJZIEFQUExJQ0FCTEUgTEFXIE9SIEFHUkVFRCBU
TyBJTiBXUklUSU5HIFdJTEwgQU5ZIENPUFlSSUdIVCBIT0xERVIsIE9SIEFOWSBPVEhFUiBQQVJU
WSBXSE8gTUFZIE1PRElGWSBBTkQvT1IgUkVESVNUUklCVVRFIFRIRSBQUk9HUkFNIEFTIFBFUk1J
VFRFRCBBQk9WRSwgQkUgTElBQkxFIFRPIFlPVSBGT1IgREFNQUdFUywgSU5DTFVESU5HIEFOWSBH
RU5FUkFMLCBTUEVDSUFMLCBJTkNJREVOVEFMIE9SIENPTlNFUVVFTlRJQUwgREFNQUdFUyBBUklT
SU5HIE9VVCBPRiBUSEUgVVNFIE9SIElOQUJJTElUWSBUTyBVU0UgVEhFIFBST0dSQU0gKElOQ0xV
RElORyBCVVQgTk9UIExJTUlURUQgVE8gTE9TUyBPRiBEQVRBIE9SIERBVEEgQkVJTkcgUkVOREVS
RUQgSU5BQ0NVUkFURSBPUiBMT1NTRVMgU1VTVEFJTkVEIEJZIFlPVSBPUiBUSElSRCBQQVJUSUVT
IE9SIEEgRkFJTFVSRSBPRiBUSEUgUFJPR1JBTSBUTyBPUEVSQVRFIFdJVEggQU5ZIE9USEVSIFBS
T0dSQU1TKSwgRVZFTiBJRiBTVUNIIEhPTERFUiBPUiBPVEhFUiBQQVJUWSBIQVMgQkVFTiBBRFZJ
U0VEIE9GIFRIRSBQT1NTSUJJTElUWSBPRiBTVUNIIERBTUFHRVMuCisjIC0tLSBMSUNFTlNFCisj
ICsrKyBMSUNFTlNFCisjIEBAIC0xLDYgKzEsNiBAQAorIyAgVGhpcyByZXBvc2l0b3J5IHVzZXMg
MiBkaWZmZXJlbnQgbGljZW5zZXMgOgorIyAgLSBhbGwgZmlsZXMgaW4gdGhlIGBsaWJgIGRpcmVj
dG9yeSB1c2UgYSBCU0QgMi1DbGF1c2UgbGljZW5zZQorIyAtLSBhbGwgb3RoZXIgZmlsZXMgdXNl
IGEgR1BMdjIgbGljZW5zZSwgdW5sZXNzIGV4cGxpY2l0bHkgc3RhdGVkIG90aGVyd2lzZQorIyAr
LSBhbGwgb3RoZXIgZmlsZXMgdXNlIGEgR1BMLTIuMC1vci1sYXRlciBsaWNlbnNlLCB1bmxlc3Mg
ZXhwbGljaXRseSBzdGF0ZWQgb3RoZXJ3aXNlCisjICAKKyMgIFJlbGV2YW50IGxpY2Vuc2UgaXMg
cmVtaW5kZWQgYXQgdGhlIHRvcCBvZiBlYWNoIHNvdXJjZSBmaWxlLAorIyAgYW5kIHdpdGggcHJl
c2VuY2Ugb2YgQ09QWUlORyBvciBMSUNFTlNFIGZpbGUgaW4gYXNzb2NpYXRlZCBkaXJlY3Rvcmll
cy4KKyMgCisjCisKK1NVTU1BUlkgPSAiRXh0cmVtZWx5IEZhc3QgQ29tcHJlc3Npb24gYWxnb3Jp
dGhtIgorREVTQ1JJUFRJT04gPSAiTFo0IGlzIGEgdmVyeSBmYXN0IGxvc3NsZXNzIGNvbXByZXNz
aW9uIGFsZ29yaXRobSwgcHJvdmlkaW5nIGNvbXByZXNzaW9uIHNwZWVkIGF0IDQwMCBNQi9zIHBl
ciBjb3JlLCBzY2FsYWJsZSB3aXRoIG11bHRpLWNvcmVzIENQVS4gSXQgYWxzbyBmZWF0dXJlcyBh
biBleHRyZW1lbHkgZmFzdCBkZWNvZGVyLCB3aXRoIHNwZWVkIGluIG11bHRpcGxlIEdCL3MgcGVy
IGNvcmUsIHR5cGljYWxseSByZWFjaGluZyBSQU0gc3BlZWQgbGltaXRzIG9uIG11bHRpLWNvcmUg
c3lzdGVtcy4iCitIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vbHo0L2x6NCIKKworTElD
RU5TRSA9ICJCU0QtMi1DbGF1c2UgfCBHUEwtMi4wLW9ubHkiCitMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9saWIvTElDRU5TRTttZDU9NWNkNWY4NTFiNTJlYzgzMmIxMGVlZGIzZjAxZjg4NWEg
XAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vcHJvZ3JhbXMvQ09QWUlORzttZDU9NDkyZGFm
NDQ3ZDZkYjBlNWViMzQ0YTc5MjJlN2VjMjUgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
TElDRU5TRTttZDU9YzExMWM0N2UzMDFjMmZmZTg3NzY3MjliNDBiNDQ0NzcgXAorICAgICAgICAg
ICAgICAgICAgICAiCisKK1BFID0gIjEiCisKK1NSQ1JFViA9ICJlYmIzNzBjYTgzYWYxOTMyMTJk
ZjRkY2JhZGNjNWQ4N2JjMGRlMmYwIgorCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbHo0
L2x6NC5naXQ7YnJhbmNoPXJlbGVhc2U7cHJvdG9jb2w9aHR0cHMgXAorCSAgIGZpbGU6Ly9ydW4t
cHRlc3QgXAorCSAgICIKK1VQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj4u
KikiCisKK1MgPSAiJHtXT1JLRElSfS9naXQiCisKK2luaGVyaXQgcHRlc3QKKworQ1ZFX1NUQVRV
U1tDVkUtMjAxNC00NzE1XSA9ICJmaXhlZC12ZXJzaW9uOiBGaXhlZCBpbiByMTE4LCB3aGljaCBp
cyBsYXJnZXIgdGhhbiB0aGUgY3VycmVudCB2ZXJzaW9uLiIKKworRVhUUkFfT0VNQUtFID0gIlBS
RUZJWD0ke3ByZWZpeH0gQ0M9JyR7Q0N9JyBDRkxBR1M9JyR7Q0ZMQUdTfScgREVTVERJUj0ke0R9
IExJQkRJUj0ke2xpYmRpcn0gSU5DTFVERURJUj0ke2luY2x1ZGVkaXJ9IEJVSUxEX1NUQVRJQz1u
byIKKworZG9faW5zdGFsbCgpIHsKKwlvZV9ydW5tYWtlIGluc3RhbGwKK30KKworQkJDTEFTU0VY
VEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgorCitSREVQRU5EUzoke1BOfS1wdGVzdCArPSAiYmFz
aCIKKworZG9fY29tcGlsZV9wdGVzdCgpIHsKKyAgICAgICAgb2VfcnVubWFrZSAtQyAke0J9L3Rl
c3RzLworfQorCitkb19pbnN0YWxsX3B0ZXN0KCkgeworCWluc3RhbGwgLWQgJHtEfSR7UFRFU1Rf
UEFUSH0vdGVzdHMvCisJaW5zdGFsbCAtLW1vZGU9NzU1ICR7Qn0vdGVzdHMvZnJhbWV0ZXN0ICR7
RH0ke1BURVNUX1BBVEh9L3Rlc3RzLworCXNlZCAtaSAicyNAUFRFU1RfUEFUSEAjJHtQVEVTVF9Q
QVRIfSNnIiAke0R9JHtQVEVTVF9QQVRIfS9ydW4tcHRlc3QKKworfQorCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9sejQvbHo0XzEuOS40LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbHo0L2x6NF8xLjkuNC5iYgpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNTFhODU0
ZDQ0YS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9sejQvbHo0XzEuOS40
LmJiCisrKyAvZGV2L251bGwKQEAgLTEsNDYgKzAsMCBAQAotU1VNTUFSWSA9ICJFeHRyZW1lbHkg
RmFzdCBDb21wcmVzc2lvbiBhbGdvcml0aG0iCi1ERVNDUklQVElPTiA9ICJMWjQgaXMgYSB2ZXJ5
IGZhc3QgbG9zc2xlc3MgY29tcHJlc3Npb24gYWxnb3JpdGhtLCBwcm92aWRpbmcgY29tcHJlc3Np
b24gc3BlZWQgYXQgNDAwIE1CL3MgcGVyIGNvcmUsIHNjYWxhYmxlIHdpdGggbXVsdGktY29yZXMg
Q1BVLiBJdCBhbHNvIGZlYXR1cmVzIGFuIGV4dHJlbWVseSBmYXN0IGRlY29kZXIsIHdpdGggc3Bl
ZWQgaW4gbXVsdGlwbGUgR0IvcyBwZXIgY29yZSwgdHlwaWNhbGx5IHJlYWNoaW5nIFJBTSBzcGVl
ZCBsaW1pdHMgb24gbXVsdGktY29yZSBzeXN0ZW1zLiIKLUhPTUVQQUdFID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9sejQvbHo0IgotCi1MSUNFTlNFID0gIkJTRC0yLUNsYXVzZSB8IEdQTC0yLjAtb25s
eSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2xpYi9MSUNFTlNFO21kNT01Y2Q1Zjg1MWI1
MmVjODMyYjEwZWVkYjNmMDFmODg1YSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9wcm9n
cmFtcy9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCi0gICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFO21kNT1jNWNjM2NkNmY5Mjc0YjRkMzI5ODgw
OTZkZjljM2VjMyBcCi0gICAgICAgICAgICAgICAgICAgICIKLQotUEUgPSAiMSIKLQotU1JDUkVW
ID0gIjVmZjgzOTY4MDEzNDQzN2RiZjQ2NzhmM2QwYzdiMzcxZDg0ZjQ5NjQiCi0KLVNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9sejQvbHo0LmdpdDticmFuY2g9cmVsZWFzZTtwcm90b2NvbD1o
dHRwcyBcCi0JICAgZmlsZTovL3J1bi1wdGVzdCBcCi0JICAgIgotVVBTVFJFQU1fQ0hFQ0tfR0lU
VEFHUkVHRVggPSAidig/UDxwdmVyPi4qKSIKLQotUyA9ICIke1dPUktESVJ9L2dpdCIKLQotaW5o
ZXJpdCBwdGVzdAotCi1DVkVfU1RBVFVTW0NWRS0yMDE0LTQ3MTVdID0gImZpeGVkLXZlcnNpb246
IEZpeGVkIGluIHIxMTgsIHdoaWNoIGlzIGxhcmdlciB0aGFuIHRoZSBjdXJyZW50IHZlcnNpb24u
IgotCi1FWFRSQV9PRU1BS0UgPSAiUFJFRklYPSR7cHJlZml4fSBDQz0nJHtDQ30nIENGTEFHUz0n
JHtDRkxBR1N9JyBERVNURElSPSR7RH0gTElCRElSPSR7bGliZGlyfSBJTkNMVURFRElSPSR7aW5j
bHVkZWRpcn0gQlVJTERfU1RBVElDPW5vIgotCi1kb19pbnN0YWxsKCkgewotCW9lX3J1bm1ha2Ug
aW5zdGFsbAotfQotCi1CQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0KLVJERVBF
TkRTOiR7UE59LXB0ZXN0ICs9ICJiYXNoIgotCi1kb19jb21waWxlX3B0ZXN0KCkgewotICAgICAg
ICBvZV9ydW5tYWtlIC1DICR7Qn0vdGVzdHMvCi19Ci0KLWRvX2luc3RhbGxfcHRlc3QoKSB7Ci0J
aW5zdGFsbCAtZCAke0R9JHtQVEVTVF9QQVRIfS90ZXN0cy8KLQlpbnN0YWxsIC0tbW9kZT03NTUg
JHtCfS90ZXN0cy9mcmFtZXRlc3QgJHtEfSR7UFRFU1RfUEFUSH0vdGVzdHMvCi0Jc2VkIC1pICJz
I0BQVEVTVF9QQVRIQCMke1BURVNUX1BBVEh9I2ciICR7RH0ke1BURVNUX1BBVEh9L3J1bi1wdGVz
dAotCi19Ci0KLS0gCjIuNDQuMAoK

--===============1387604727075462843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1885 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-bbe28f4565b1f8a287a77528fd1a7bd35fe15e94"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bbe28f4565b1f8a287a77528fd1a7bd35fe15e94"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 198 Local 184 Mirrors 0 Missed 14 Current 286 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 358 of 484 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: Running setscene task 370 of 484 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_create_spdx_setscene)
NOTE: Running task 859 of 1385 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_recipe_qa)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1363 of 1385 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_fetch)
NOTE: recipe lz4-1_1.10.0-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1364 of 1385 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_unpack)
NOTE: Running task 1365 of 1385 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.10.0-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1366 of 1385 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_patch)
NOTE: Running task 1367 of 1385 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_collect_spdx_deps)
NOTE: recipe lz4-1_1.10.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1368 of 1385 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1369 of 1385 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_lic)
NOTE: recipe lz4-1_1.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_lic: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1370 of 1385 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_configure)
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_lic: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_configure: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1371 of 1385 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe lz4-1_1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1372 of 1385 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_compile)
NOTE: recipe lz4-1_1.10.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75 PREFIX=/usr CC=x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/recipe-sysroot CFLAGS= -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/git=/usr/src/debug/lz4/1.10.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/git=/usr/src/debug/lz4/1.10.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/git=/usr/src/debug/lz4/1.10.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/git=/usr/src/debug/lz4/1.10.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1
 .10.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/recipe-sysroot-native=  -pipe DESTDIR=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/image LIBDIR=/usr/lib INCLUDEDIR=/usr/include BUILD_STATIC=no
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/git/lib'
| compiling dynamic library 1.10.0
| creating pkgconfig
| creating versioned links
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/git/lib'
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/git/programs'
| /bin/sh: /usr/lib/lz4.h: No such file or directory
| /bin/sh: /usr/lib/lz4.h: No such file or directory
| /bin/sh: /usr/lib/lz4.h: No such file or directory
| /bin/sh: /usr/lib/lz4.h: No such file or directory
| /bin/sh: /usr/lib/lz4.h: No such file or directory
| /bin/sh: /usr/lib/lz4.h: No such file or directory
| bench.c:47:10: fatal error: xxhash.h: No such file or directory
|    47 | #include "xxhash.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: bench.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| lz4io.c:59:10: fatal error: lz4.h: No such file or directory
|    59 | #include "lz4.h"       /* required for legacy format */
|       |          ^~~~~~~
| compilation terminated.
| lz4cli.c:53:10: fatal error: lz4hc.h: No such file or directory
|    53 | #include "lz4hc.h"    /* LZ4HC_CLEVEL_MAX */
|       |          ^~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: lz4io.o] Error 1
| make[1]: *** [<builtin>: lz4cli.o] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/git/programs'
| make: *** [Makefile:63: lz4-release] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.2605140:179 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.2605140, line 179
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.2605140, line 164
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.2605140, line 169
| 	#4: base_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.2605140, line 147
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.2605140, line 141
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.2605140, line 189
NOTE: recipe lz4-1_1.10.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1372 tasks of which 1361 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801175050.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801175050.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: lz4-1_1.10.0-r0 do_compile: oe_runmake failed
ERROR: lz4-1_1.10.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.2605140', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/log.do_compile.2605140
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_compile) failed with exit code '1'

--===============1387604727075462843==--

