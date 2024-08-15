Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DD4C531DD
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.131453.1723748336420532782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dM/ohkJB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DU2+nSPA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019157684045-e18f3d80-d4c5-4ab6-b494-0cf24053a0fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bw+OXVopsaMU8XnDVR2LG/UohDiXQ7+9ln7R4kTkJi8=;
	b=dM/ohkJBf5Mc8ZtB8wul+aopozkeE95qPdQLUh5i2BL2x27mFGhl3h2vKVatFUgV
	iqiMZdh3tArIHzR/1AFnsAe5YYmQxZiTSm44aeMEeViohVKNpZvScF0Idc/HcaF58Vy
	wSVAkfvlqD8Rv4+wGeaScJ+MJwEm67zfu5mxPIpA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bw+OXVopsaMU8XnDVR2LG/UohDiXQ7+9ln7R4kTkJi8=;
	b=DU2+nSPA2SNtxeidCN6Rz70/9Av4XcJ/xLQ57Ps7S5TBgZQ3OCNb1iTRPE+qihlm
	eguPGIPHFbewO75GLnNoyEdU28awf3K3USt/vBW3xyC6SSaiqwwS0/ecS1ayL/oEUUd
	47MXkvcoRdETMYRc12jj1CjXPqYHcaFXWRTzwgj4=
Content-Type: multipart/mixed; boundary="===============4998433343251184375=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lz4: upgrading to 1.10.0 FAILED
Message-ID: <0101019157684045-e18f3d80-d4c5-4ab6-b494-0cf24053a0fc-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203452

--===============4998433343251184375==
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
From 82b8b7a186798d4e5d2383b1e8b31f1110d5ada1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 18:37:37 +0000
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


--===============4998433343251184375==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lz4-upgrade-1.9.4-1.10.0.patch"

RnJvbSA4MmI4YjdhMTg2Nzk4ZDRlNWQyMzgzYjFlOGIzMWYxMTEwZDVhZGExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTg6Mzc6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
ejQ6IHVwZ3JhZGUgMS45LjQgLT4gMS4xMC4wCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2x6
NC9sejRfMS4xMC4wLmJiIHwgNDYwICsrKysrKysrKysrKysrKysrKysrKysrKysKIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2x6NC9sejRfMS45LjQuYmIgIHwgIDQ2IC0tLQogMiBmaWxlcyBjaGFuZ2Vk
LCA0NjAgaW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2x6NF8xLjEwLjAuYmIKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9sejQvbHo0XzEuOS40LmJiCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2x6NF8xLjEwLjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9sejQvbHo0XzEuMTAuMC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li5jM2NjZTZhZmQ2Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0
L2x6NF8xLjEwLjAuYmIKQEAgLTAsMCArMSw0NjAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNf
Q0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMg
VGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBu
ZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5l
ZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2Ug
dmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTog
Y29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBw
cm9ncmFtcy9DT1BZSU5HCisjICsrKyBwcm9ncmFtcy9DT1BZSU5HCisjIEBAIC0xLDMzOSArMSw4
MyBAQAorIyAtICAgICAgICAgICAgICAgICAgICBHTlUgR0VORVJBTCBQVUJMSUMgTElDRU5TRQor
IyAtICAgICAgICAgICAgICAgICAgICAgICBWZXJzaW9uIDIsIEp1bmUgMTk5MQorIyArRnVsbCBu
YW1lOgorIyArR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgdjIuMCBvciBsYXRlcgorIyAgCisj
IC0gQ29weXJpZ2h0IChDKSAxOTg5LCAxOTkxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5j
LiwKKyMgLSA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEw
LTEzMDEgVVNBCisjIC0gRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1
dGUgdmVyYmF0aW0gY29waWVzCisjIC0gb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBidXQgY2hh
bmdpbmcgaXQgaXMgbm90IGFsbG93ZWQuCisjICtTaG9ydCBpZGVudGlmaWVyOgorIyArR1BMLTIu
MC1vci1sYXRlcgorIyAgCisjIC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgUHJlYW1ibGUK
KyMgK1RleHQ6CisjICtHTlUgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyArVmVyc2lvbiAyLCBK
dW5lIDE5OTEKKyMgIAorIyAtICBUaGUgbGljZW5zZXMgZm9yIG1vc3Qgc29mdHdhcmUgYXJlIGRl
c2lnbmVkIHRvIHRha2UgYXdheSB5b3VyCisjIC1mcmVlZG9tIHRvIHNoYXJlIGFuZCBjaGFuZ2Ug
aXQuICBCeSBjb250cmFzdCwgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYworIyAtTGljZW5zZSBpcyBp
bnRlbmRlZCB0byBndWFyYW50ZWUgeW91ciBmcmVlZG9tIHRvIHNoYXJlIGFuZCBjaGFuZ2UgZnJl
ZQorIyAtc29mdHdhcmUtLXRvIG1ha2Ugc3VyZSB0aGUgc29mdHdhcmUgaXMgZnJlZSBmb3IgYWxs
IGl0cyB1c2Vycy4gIFRoaXMKKyMgLUdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXBwbGllcyB0byBt
b3N0IG9mIHRoZSBGcmVlIFNvZnR3YXJlCisjIC1Gb3VuZGF0aW9uJ3Mgc29mdHdhcmUgYW5kIHRv
IGFueSBvdGhlciBwcm9ncmFtIHdob3NlIGF1dGhvcnMgY29tbWl0IHRvCisjIC11c2luZyBpdC4g
IChTb21lIG90aGVyIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiBzb2Z0d2FyZSBpcyBjb3ZlcmVk
IGJ5CisjIC10aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGluc3RlYWQuKSAg
WW91IGNhbiBhcHBseSBpdCB0bworIyAteW91ciBwcm9ncmFtcywgdG9vLgorIyArQ29weXJpZ2h0
IChDKSAxOTg5LCAxOTkxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorIyArNTEgRnJh
bmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxLCBVU0EKKyMg
IAorIyAtICBXaGVuIHdlIHNwZWFrIG9mIGZyZWUgc29mdHdhcmUsIHdlIGFyZSByZWZlcnJpbmcg
dG8gZnJlZWRvbSwgbm90CisjIC1wcmljZS4gIE91ciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlcyBh
cmUgZGVzaWduZWQgdG8gbWFrZSBzdXJlIHRoYXQgeW91CisjIC1oYXZlIHRoZSBmcmVlZG9tIHRv
IGRpc3RyaWJ1dGUgY29waWVzIG9mIGZyZWUgc29mdHdhcmUgKGFuZCBjaGFyZ2UgZm9yCisjIC10
aGlzIHNlcnZpY2UgaWYgeW91IHdpc2gpLCB0aGF0IHlvdSByZWNlaXZlIHNvdXJjZSBjb2RlIG9y
IGNhbiBnZXQgaXQKKyMgLWlmIHlvdSB3YW50IGl0LCB0aGF0IHlvdSBjYW4gY2hhbmdlIHRoZSBz
b2Z0d2FyZSBvciB1c2UgcGllY2VzIG9mIGl0CisjIC1pbiBuZXcgZnJlZSBwcm9ncmFtczsgYW5k
IHRoYXQgeW91IGtub3cgeW91IGNhbiBkbyB0aGVzZSB0aGluZ3MuCisjICtFdmVyeW9uZSBpcyBw
ZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMgb2YgdGhpcyBs
aWNlbnNlIGRvY3VtZW50LCBidXQgY2hhbmdpbmcgaXQgaXMgbm90IGFsbG93ZWQuCisjICAKKyMg
LSAgVG8gcHJvdGVjdCB5b3VyIHJpZ2h0cywgd2UgbmVlZCB0byBtYWtlIHJlc3RyaWN0aW9ucyB0
aGF0IGZvcmJpZAorIyAtYW55b25lIHRvIGRlbnkgeW91IHRoZXNlIHJpZ2h0cyBvciB0byBhc2sg
eW91IHRvIHN1cnJlbmRlciB0aGUgcmlnaHRzLgorIyAtVGhlc2UgcmVzdHJpY3Rpb25zIHRyYW5z
bGF0ZSB0byBjZXJ0YWluIHJlc3BvbnNpYmlsaXRpZXMgZm9yIHlvdSBpZiB5b3UKKyMgLWRpc3Ry
aWJ1dGUgY29waWVzIG9mIHRoZSBzb2Z0d2FyZSwgb3IgaWYgeW91IG1vZGlmeSBpdC4KKyMgK1By
ZWFtYmxlCisjICAKKyMgLSAgRm9yIGV4YW1wbGUsIGlmIHlvdSBkaXN0cmlidXRlIGNvcGllcyBv
ZiBzdWNoIGEgcHJvZ3JhbSwgd2hldGhlcgorIyAtZ3JhdGlzIG9yIGZvciBhIGZlZSwgeW91IG11
c3QgZ2l2ZSB0aGUgcmVjaXBpZW50cyBhbGwgdGhlIHJpZ2h0cyB0aGF0CisjIC15b3UgaGF2ZS4g
IFlvdSBtdXN0IG1ha2Ugc3VyZSB0aGF0IHRoZXksIHRvbywgcmVjZWl2ZSBvciBjYW4gZ2V0IHRo
ZQorIyAtc291cmNlIGNvZGUuICBBbmQgeW91IG11c3Qgc2hvdyB0aGVtIHRoZXNlIHRlcm1zIHNv
IHRoZXkga25vdyB0aGVpcgorIyAtcmlnaHRzLgorIyArVGhlIGxpY2Vuc2VzIGZvciBtb3N0IHNv
ZnR3YXJlIGFyZSBkZXNpZ25lZCB0byB0YWtlIGF3YXkgeW91ciBmcmVlZG9tIHRvIHNoYXJlIGFu
ZCBjaGFuZ2UgaXQuIEJ5IGNvbnRyYXN0LCB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
aXMgaW50ZW5kZWQgdG8gZ3VhcmFudGVlIHlvdXIgZnJlZWRvbSB0byBzaGFyZSBhbmQgY2hhbmdl
IGZyZWUgc29mdHdhcmUtLXRvIG1ha2Ugc3VyZSB0aGUgc29mdHdhcmUgaXMgZnJlZSBmb3IgYWxs
IGl0cyB1c2Vycy4gVGhpcyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFwcGxpZXMgdG8gbW9zdCBv
ZiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uJ3Mgc29mdHdhcmUgYW5kIHRvIGFueSBvdGhl
ciBwcm9ncmFtIHdob3NlIGF1dGhvcnMgY29tbWl0IHRvIHVzaW5nIGl0LiAoU29tZSBvdGhlciBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb24gc29mdHdhcmUgaXMgY292ZXJlZCBieSB0aGUgR05VIExl
c3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGluc3RlYWQuKSBZb3UgY2FuIGFwcGx5IGl0IHRv
IHlvdXIgcHJvZ3JhbXMsIHRvby4KKyMgIAorIyAtICBXZSBwcm90ZWN0IHlvdXIgcmlnaHRzIHdp
dGggdHdvIHN0ZXBzOiAoMSkgY29weXJpZ2h0IHRoZSBzb2Z0d2FyZSwgYW5kCisjIC0oMikgb2Zm
ZXIgeW91IHRoaXMgbGljZW5zZSB3aGljaCBnaXZlcyB5b3UgbGVnYWwgcGVybWlzc2lvbiB0byBj
b3B5LAorIyAtZGlzdHJpYnV0ZSBhbmQvb3IgbW9kaWZ5IHRoZSBzb2Z0d2FyZS4KKyMgK1doZW4g
d2Ugc3BlYWsgb2YgZnJlZSBzb2Z0d2FyZSwgd2UgYXJlIHJlZmVycmluZyB0byBmcmVlZG9tLCBu
b3QgcHJpY2UuIE91ciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlcyBhcmUgZGVzaWduZWQgdG8gbWFr
ZSBzdXJlIHRoYXQgeW91IGhhdmUgdGhlIGZyZWVkb20gdG8gZGlzdHJpYnV0ZSBjb3BpZXMgb2Yg
ZnJlZSBzb2Z0d2FyZSAoYW5kIGNoYXJnZSBmb3IgdGhpcyBzZXJ2aWNlIGlmIHlvdSB3aXNoKSwg
dGhhdCB5b3UgcmVjZWl2ZSBzb3VyY2UgY29kZSBvciBjYW4gZ2V0IGl0IGlmIHlvdSB3YW50IGl0
LCB0aGF0IHlvdSBjYW4gY2hhbmdlIHRoZSBzb2Z0d2FyZSBvciB1c2UgcGllY2VzIG9mIGl0IGlu
IG5ldyBmcmVlIHByb2dyYW1zOyBhbmQgdGhhdCB5b3Uga25vdyB5b3UgY2FuIGRvIHRoZXNlIHRo
aW5ncy4KKyMgIAorIyAtICBBbHNvLCBmb3IgZWFjaCBhdXRob3IncyBwcm90ZWN0aW9uIGFuZCBv
dXJzLCB3ZSB3YW50IHRvIG1ha2UgY2VydGFpbgorIyAtdGhhdCBldmVyeW9uZSB1bmRlcnN0YW5k
cyB0aGF0IHRoZXJlIGlzIG5vIHdhcnJhbnR5IGZvciB0aGlzIGZyZWUKKyMgLXNvZnR3YXJlLiAg
SWYgdGhlIHNvZnR3YXJlIGlzIG1vZGlmaWVkIGJ5IHNvbWVvbmUgZWxzZSBhbmQgcGFzc2VkIG9u
LCB3ZQorIyAtd2FudCBpdHMgcmVjaXBpZW50cyB0byBrbm93IHRoYXQgd2hhdCB0aGV5IGhhdmUg
aXMgbm90IHRoZSBvcmlnaW5hbCwgc28KKyMgLXRoYXQgYW55IHByb2JsZW1zIGludHJvZHVjZWQg
Ynkgb3RoZXJzIHdpbGwgbm90IHJlZmxlY3Qgb24gdGhlIG9yaWdpbmFsCisjIC1hdXRob3JzJyBy
ZXB1dGF0aW9ucy4KKyMgK1RvIHByb3RlY3QgeW91ciByaWdodHMsIHdlIG5lZWQgdG8gbWFrZSBy
ZXN0cmljdGlvbnMgdGhhdCBmb3JiaWQgYW55b25lIHRvIGRlbnkgeW91IHRoZXNlIHJpZ2h0cyBv
ciB0byBhc2sgeW91IHRvIHN1cnJlbmRlciB0aGUgcmlnaHRzLiBUaGVzZSByZXN0cmljdGlvbnMg
dHJhbnNsYXRlIHRvIGNlcnRhaW4gcmVzcG9uc2liaWxpdGllcyBmb3IgeW91IGlmIHlvdSBkaXN0
cmlidXRlIGNvcGllcyBvZiB0aGUgc29mdHdhcmUsIG9yIGlmIHlvdSBtb2RpZnkgaXQuCisjICAK
KyMgLSAgRmluYWxseSwgYW55IGZyZWUgcHJvZ3JhbSBpcyB0aHJlYXRlbmVkIGNvbnN0YW50bHkg
Ynkgc29mdHdhcmUKKyMgLXBhdGVudHMuICBXZSB3aXNoIHRvIGF2b2lkIHRoZSBkYW5nZXIgdGhh
dCByZWRpc3RyaWJ1dG9ycyBvZiBhIGZyZWUKKyMgLXByb2dyYW0gd2lsbCBpbmRpdmlkdWFsbHkg
b2J0YWluIHBhdGVudCBsaWNlbnNlcywgaW4gZWZmZWN0IG1ha2luZyB0aGUKKyMgLXByb2dyYW0g
cHJvcHJpZXRhcnkuICBUbyBwcmV2ZW50IHRoaXMsIHdlIGhhdmUgbWFkZSBpdCBjbGVhciB0aGF0
IGFueQorIyAtcGF0ZW50IG11c3QgYmUgbGljZW5zZWQgZm9yIGV2ZXJ5b25lJ3MgZnJlZSB1c2Ug
b3Igbm90IGxpY2Vuc2VkIGF0IGFsbC4KKyMgK0ZvciBleGFtcGxlLCBpZiB5b3UgZGlzdHJpYnV0
ZSBjb3BpZXMgb2Ygc3VjaCBhIHByb2dyYW0sIHdoZXRoZXIgZ3JhdGlzIG9yIGZvciBhIGZlZSwg
eW91IG11c3QgZ2l2ZSB0aGUgcmVjaXBpZW50cyBhbGwgdGhlIHJpZ2h0cyB0aGF0IHlvdSBoYXZl
LiBZb3UgbXVzdCBtYWtlIHN1cmUgdGhhdCB0aGV5LCB0b28sIHJlY2VpdmUgb3IgY2FuIGdldCB0
aGUgc291cmNlIGNvZGUuIEFuZCB5b3UgbXVzdCBzaG93IHRoZW0gdGhlc2UgdGVybXMgc28gdGhl
eSBrbm93IHRoZWlyIHJpZ2h0cy4KKyMgIAorIyAtICBUaGUgcHJlY2lzZSB0ZXJtcyBhbmQgY29u
ZGl0aW9ucyBmb3IgY29weWluZywgZGlzdHJpYnV0aW9uIGFuZAorIyAtbW9kaWZpY2F0aW9uIGZv
bGxvdy4KKyMgK1dlIHByb3RlY3QgeW91ciByaWdodHMgd2l0aCB0d28gc3RlcHM6ICgxKSBjb3B5
cmlnaHQgdGhlIHNvZnR3YXJlLCBhbmQgKDIpIG9mZmVyIHlvdSB0aGlzIGxpY2Vuc2Ugd2hpY2gg
Z2l2ZXMgeW91IGxlZ2FsIHBlcm1pc3Npb24gdG8gY29weSwgZGlzdHJpYnV0ZSBhbmQvb3IgbW9k
aWZ5IHRoZSBzb2Z0d2FyZS4KKyMgIAorIyAtICAgICAgICAgICAgICAgICAgICBHTlUgR0VORVJB
TCBQVUJMSUMgTElDRU5TRQorIyAtICAgVEVSTVMgQU5EIENPTkRJVElPTlMgRk9SIENPUFlJTkcs
IERJU1RSSUJVVElPTiBBTkQgTU9ESUZJQ0FUSU9OCisjICtBbHNvLCBmb3IgZWFjaCBhdXRob3In
cyBwcm90ZWN0aW9uIGFuZCBvdXJzLCB3ZSB3YW50IHRvIG1ha2UgY2VydGFpbiB0aGF0IGV2ZXJ5
b25lIHVuZGVyc3RhbmRzIHRoYXQgdGhlcmUgaXMgbm8gd2FycmFudHkgZm9yIHRoaXMgZnJlZSBz
b2Z0d2FyZS4gSWYgdGhlIHNvZnR3YXJlIGlzIG1vZGlmaWVkIGJ5IHNvbWVvbmUgZWxzZSBhbmQg
cGFzc2VkIG9uLCB3ZSB3YW50IGl0cyByZWNpcGllbnRzIHRvIGtub3cgdGhhdCB3aGF0IHRoZXkg
aGF2ZSBpcyBub3QgdGhlIG9yaWdpbmFsLCBzbyB0aGF0IGFueSBwcm9ibGVtcyBpbnRyb2R1Y2Vk
IGJ5IG90aGVycyB3aWxsIG5vdCByZWZsZWN0IG9uIHRoZSBvcmlnaW5hbCBhdXRob3JzJyByZXB1
dGF0aW9ucy4KKyMgIAorIyAtICAwLiBUaGlzIExpY2Vuc2UgYXBwbGllcyB0byBhbnkgcHJvZ3Jh
bSBvciBvdGhlciB3b3JrIHdoaWNoIGNvbnRhaW5zCisjIC1hIG5vdGljZSBwbGFjZWQgYnkgdGhl
IGNvcHlyaWdodCBob2xkZXIgc2F5aW5nIGl0IG1heSBiZSBkaXN0cmlidXRlZAorIyAtdW5kZXIg
dGhlIHRlcm1zIG9mIHRoaXMgR2VuZXJhbCBQdWJsaWMgTGljZW5zZS4gIFRoZSAiUHJvZ3JhbSIs
IGJlbG93LAorIyAtcmVmZXJzIHRvIGFueSBzdWNoIHByb2dyYW0gb3Igd29yaywgYW5kIGEgIndv
cmsgYmFzZWQgb24gdGhlIFByb2dyYW0iCisjIC1tZWFucyBlaXRoZXIgdGhlIFByb2dyYW0gb3Ig
YW55IGRlcml2YXRpdmUgd29yayB1bmRlciBjb3B5cmlnaHQgbGF3OgorIyAtdGhhdCBpcyB0byBz
YXksIGEgd29yayBjb250YWluaW5nIHRoZSBQcm9ncmFtIG9yIGEgcG9ydGlvbiBvZiBpdCwKKyMg
LWVpdGhlciB2ZXJiYXRpbSBvciB3aXRoIG1vZGlmaWNhdGlvbnMgYW5kL29yIHRyYW5zbGF0ZWQg
aW50byBhbm90aGVyCisjIC1sYW5ndWFnZS4gIChIZXJlaW5hZnRlciwgdHJhbnNsYXRpb24gaXMg
aW5jbHVkZWQgd2l0aG91dCBsaW1pdGF0aW9uIGluCisjIC10aGUgdGVybSAibW9kaWZpY2F0aW9u
Ii4pICBFYWNoIGxpY2Vuc2VlIGlzIGFkZHJlc3NlZCBhcyAieW91Ii4KKyMgK0ZpbmFsbHksIGFu
eSBmcmVlIHByb2dyYW0gaXMgdGhyZWF0ZW5lZCBjb25zdGFudGx5IGJ5IHNvZnR3YXJlIHBhdGVu
dHMuIFdlIHdpc2ggdG8gYXZvaWQgdGhlIGRhbmdlciB0aGF0IHJlZGlzdHJpYnV0b3JzIG9mIGEg
ZnJlZSBwcm9ncmFtIHdpbGwgaW5kaXZpZHVhbGx5IG9idGFpbiBwYXRlbnQgbGljZW5zZXMsIGlu
IGVmZmVjdCBtYWtpbmcgdGhlIHByb2dyYW0gcHJvcHJpZXRhcnkuIFRvIHByZXZlbnQgdGhpcywg
d2UgaGF2ZSBtYWRlIGl0IGNsZWFyIHRoYXQgYW55IHBhdGVudCBtdXN0IGJlIGxpY2Vuc2VkIGZv
ciBldmVyeW9uZSdzIGZyZWUgdXNlIG9yIG5vdCBsaWNlbnNlZCBhdCBhbGwuCisjICAKKyMgLUFj
dGl2aXRpZXMgb3RoZXIgdGhhbiBjb3B5aW5nLCBkaXN0cmlidXRpb24gYW5kIG1vZGlmaWNhdGlv
biBhcmUgbm90CisjIC1jb3ZlcmVkIGJ5IHRoaXMgTGljZW5zZTsgdGhleSBhcmUgb3V0c2lkZSBp
dHMgc2NvcGUuICBUaGUgYWN0IG9mCisjIC1ydW5uaW5nIHRoZSBQcm9ncmFtIGlzIG5vdCByZXN0
cmljdGVkLCBhbmQgdGhlIG91dHB1dCBmcm9tIHRoZSBQcm9ncmFtCisjIC1pcyBjb3ZlcmVkIG9u
bHkgaWYgaXRzIGNvbnRlbnRzIGNvbnN0aXR1dGUgYSB3b3JrIGJhc2VkIG9uIHRoZQorIyAtUHJv
Z3JhbSAoaW5kZXBlbmRlbnQgb2YgaGF2aW5nIGJlZW4gbWFkZSBieSBydW5uaW5nIHRoZSBQcm9n
cmFtKS4KKyMgLVdoZXRoZXIgdGhhdCBpcyB0cnVlIGRlcGVuZHMgb24gd2hhdCB0aGUgUHJvZ3Jh
bSBkb2VzLgorIyArVGhlIHByZWNpc2UgdGVybXMgYW5kIGNvbmRpdGlvbnMgZm9yIGNvcHlpbmcs
IGRpc3RyaWJ1dGlvbiBhbmQgbW9kaWZpY2F0aW9uIGZvbGxvdy4KKyMgIAorIyAtICAxLiBZb3Ug
bWF5IGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzIG9mIHRoZSBQcm9ncmFtJ3MK
KyMgLXNvdXJjZSBjb2RlIGFzIHlvdSByZWNlaXZlIGl0LCBpbiBhbnkgbWVkaXVtLCBwcm92aWRl
ZCB0aGF0IHlvdQorIyAtY29uc3BpY3VvdXNseSBhbmQgYXBwcm9wcmlhdGVseSBwdWJsaXNoIG9u
IGVhY2ggY29weSBhbiBhcHByb3ByaWF0ZQorIyAtY29weXJpZ2h0IG5vdGljZSBhbmQgZGlzY2xh
aW1lciBvZiB3YXJyYW50eTsga2VlcCBpbnRhY3QgYWxsIHRoZQorIyAtbm90aWNlcyB0aGF0IHJl
ZmVyIHRvIHRoaXMgTGljZW5zZSBhbmQgdG8gdGhlIGFic2VuY2Ugb2YgYW55IHdhcnJhbnR5Owor
IyAtYW5kIGdpdmUgYW55IG90aGVyIHJlY2lwaWVudHMgb2YgdGhlIFByb2dyYW0gYSBjb3B5IG9m
IHRoaXMgTGljZW5zZQorIyAtYWxvbmcgd2l0aCB0aGUgUHJvZ3JhbS4KKyMgK1RFUk1TIEFORCBD
T05ESVRJT05TIEZPUiBDT1BZSU5HLCBESVNUUklCVVRJT04gQU5EIE1PRElGSUNBVElPTgorIyAg
CisjIC1Zb3UgbWF5IGNoYXJnZSBhIGZlZSBmb3IgdGhlIHBoeXNpY2FsIGFjdCBvZiB0cmFuc2Zl
cnJpbmcgYSBjb3B5LCBhbmQKKyMgLXlvdSBtYXkgYXQgeW91ciBvcHRpb24gb2ZmZXIgd2FycmFu
dHkgcHJvdGVjdGlvbiBpbiBleGNoYW5nZSBmb3IgYSBmZWUuCisjICswLiBUaGlzIExpY2Vuc2Ug
YXBwbGllcyB0byBhbnkgcHJvZ3JhbSBvciBvdGhlciB3b3JrIHdoaWNoIGNvbnRhaW5zIGEgbm90
aWNlIHBsYWNlZCBieSB0aGUgY29weXJpZ2h0IGhvbGRlciBzYXlpbmcgaXQgbWF5IGJlIGRpc3Ry
aWJ1dGVkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGlzIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuIFRo
ZSAiUHJvZ3JhbSIsIGJlbG93LCByZWZlcnMgdG8gYW55IHN1Y2ggcHJvZ3JhbSBvciB3b3JrLCBh
bmQgYSAid29yayBiYXNlZCBvbiB0aGUgUHJvZ3JhbSIgbWVhbnMgZWl0aGVyIHRoZSBQcm9ncmFt
IG9yIGFueSBkZXJpdmF0aXZlIHdvcmsgdW5kZXIgY29weXJpZ2h0IGxhdzogdGhhdCBpcyB0byBz
YXksIGEgd29yayBjb250YWluaW5nIHRoZSBQcm9ncmFtIG9yIGEgcG9ydGlvbiBvZiBpdCwgZWl0
aGVyIHZlcmJhdGltIG9yIHdpdGggbW9kaWZpY2F0aW9ucyBhbmQvb3IgdHJhbnNsYXRlZCBpbnRv
IGFub3RoZXIgbGFuZ3VhZ2UuIChIZXJlaW5hZnRlciwgdHJhbnNsYXRpb24gaXMgaW5jbHVkZWQg
d2l0aG91dCBsaW1pdGF0aW9uIGluIHRoZSB0ZXJtICJtb2RpZmljYXRpb24iLikgRWFjaCBsaWNl
bnNlZSBpcyBhZGRyZXNzZWQgYXMgInlvdSIuCisjICtBY3Rpdml0aWVzIG90aGVyIHRoYW4gY29w
eWluZywgZGlzdHJpYnV0aW9uIGFuZCBtb2RpZmljYXRpb24gYXJlIG5vdCBjb3ZlcmVkIGJ5IHRo
aXMgTGljZW5zZTsgdGhleSBhcmUgb3V0c2lkZSBpdHMgc2NvcGUuIFRoZSBhY3Qgb2YgcnVubmlu
ZyB0aGUgUHJvZ3JhbSBpcyBub3QgcmVzdHJpY3RlZCwgYW5kIHRoZSBvdXRwdXQgZnJvbSB0aGUg
UHJvZ3JhbSBpcyBjb3ZlcmVkIG9ubHkgaWYgaXRzIGNvbnRlbnRzIGNvbnN0aXR1dGUgYSB3b3Jr
IGJhc2VkIG9uIHRoZSBQcm9ncmFtIChpbmRlcGVuZGVudCBvZiBoYXZpbmcgYmVlbiBtYWRlIGJ5
IHJ1bm5pbmcgdGhlIFByb2dyYW0pLiBXaGV0aGVyIHRoYXQgaXMgdHJ1ZSBkZXBlbmRzIG9uIHdo
YXQgdGhlIFByb2dyYW0gZG9lcy4KKyMgIAorIyAtICAyLiBZb3UgbWF5IG1vZGlmeSB5b3VyIGNv
cHkgb3IgY29waWVzIG9mIHRoZSBQcm9ncmFtIG9yIGFueSBwb3J0aW9uCisjIC1vZiBpdCwgdGh1
cyBmb3JtaW5nIGEgd29yayBiYXNlZCBvbiB0aGUgUHJvZ3JhbSwgYW5kIGNvcHkgYW5kCisjIC1k
aXN0cmlidXRlIHN1Y2ggbW9kaWZpY2F0aW9ucyBvciB3b3JrIHVuZGVyIHRoZSB0ZXJtcyBvZiBT
ZWN0aW9uIDEKKyMgLWFib3ZlLCBwcm92aWRlZCB0aGF0IHlvdSBhbHNvIG1lZXQgYWxsIG9mIHRo
ZXNlIGNvbmRpdGlvbnM6CisjICsxLiBZb3UgbWF5IGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0
aW0gY29waWVzIG9mIHRoZSBQcm9ncmFtJ3Mgc291cmNlIGNvZGUgYXMgeW91IHJlY2VpdmUgaXQs
IGluIGFueSBtZWRpdW0sIHByb3ZpZGVkIHRoYXQgeW91IGNvbnNwaWN1b3VzbHkgYW5kIGFwcHJv
cHJpYXRlbHkgcHVibGlzaCBvbiBlYWNoIGNvcHkgYW4gYXBwcm9wcmlhdGUgY29weXJpZ2h0IG5v
dGljZSBhbmQgZGlzY2xhaW1lciBvZiB3YXJyYW50eTsga2VlcCBpbnRhY3QgYWxsIHRoZSBub3Rp
Y2VzIHRoYXQgcmVmZXIgdG8gdGhpcyBMaWNlbnNlIGFuZCB0byB0aGUgYWJzZW5jZSBvZiBhbnkg
d2FycmFudHk7IGFuZCBnaXZlIGFueSBvdGhlciByZWNpcGllbnRzIG9mIHRoZSBQcm9ncmFtIGEg
Y29weSBvZiB0aGlzIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUgUHJvZ3JhbS4KKyMgK1lvdSBtYXkg
Y2hhcmdlIGEgZmVlIGZvciB0aGUgcGh5c2ljYWwgYWN0IG9mIHRyYW5zZmVycmluZyBhIGNvcHks
IGFuZCB5b3UgbWF5IGF0IHlvdXIgb3B0aW9uIG9mZmVyIHdhcnJhbnR5IHByb3RlY3Rpb24gaW4g
ZXhjaGFuZ2UgZm9yIGEgZmVlLgorIyAgCisjIC0gICAgYSkgWW91IG11c3QgY2F1c2UgdGhlIG1v
ZGlmaWVkIGZpbGVzIHRvIGNhcnJ5IHByb21pbmVudCBub3RpY2VzCisjIC0gICAgc3RhdGluZyB0
aGF0IHlvdSBjaGFuZ2VkIHRoZSBmaWxlcyBhbmQgdGhlIGRhdGUgb2YgYW55IGNoYW5nZS4KKyMg
KzIuIFlvdSBtYXkgbW9kaWZ5IHlvdXIgY29weSBvciBjb3BpZXMgb2YgdGhlIFByb2dyYW0gb3Ig
YW55IHBvcnRpb24gb2YgaXQsIHRodXMgZm9ybWluZyBhIHdvcmsgYmFzZWQgb24gdGhlIFByb2dy
YW0sIGFuZCBjb3B5IGFuZCBkaXN0cmlidXRlIHN1Y2ggbW9kaWZpY2F0aW9ucyBvciB3b3JrIHVu
ZGVyIHRoZSB0ZXJtcyBvZiBTZWN0aW9uIDEgYWJvdmUsIHByb3ZpZGVkIHRoYXQgeW91IGFsc28g
bWVldCBhbGwgb2YgdGhlc2UgY29uZGl0aW9uczoKKyMgK2EpIFlvdSBtdXN0IGNhdXNlIHRoZSBt
b2RpZmllZCBmaWxlcyB0byBjYXJyeSBwcm9taW5lbnQgbm90aWNlcyBzdGF0aW5nIHRoYXQgeW91
IGNoYW5nZWQgdGhlIGZpbGVzIGFuZCB0aGUgZGF0ZSBvZiBhbnkgY2hhbmdlLgorIyArYikgWW91
IG11c3QgY2F1c2UgYW55IHdvcmsgdGhhdCB5b3UgZGlzdHJpYnV0ZSBvciBwdWJsaXNoLCB0aGF0
IGluIHdob2xlIG9yIGluIHBhcnQgY29udGFpbnMgb3IgaXMgZGVyaXZlZCBmcm9tIHRoZSBQcm9n
cmFtIG9yIGFueSBwYXJ0IHRoZXJlb2YsIHRvIGJlIGxpY2Vuc2VkIGFzIGEgd2hvbGUgYXQgbm8g
Y2hhcmdlIHRvIGFsbCB0aGlyZCBwYXJ0aWVzIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGlzIExpY2Vu
c2UuCisjICtjKSBJZiB0aGUgbW9kaWZpZWQgcHJvZ3JhbSBub3JtYWxseSByZWFkcyBjb21tYW5k
cyBpbnRlcmFjdGl2ZWx5IHdoZW4gcnVuLCB5b3UgbXVzdCBjYXVzZSBpdCwgd2hlbiBzdGFydGVk
IHJ1bm5pbmcgZm9yIHN1Y2ggaW50ZXJhY3RpdmUgdXNlIGluIHRoZSBtb3N0IG9yZGluYXJ5IHdh
eSwgdG8gcHJpbnQgb3IgZGlzcGxheSBhbiBhbm5vdW5jZW1lbnQgaW5jbHVkaW5nIGFuIGFwcHJv
cHJpYXRlIGNvcHlyaWdodCBub3RpY2UgYW5kIGEgbm90aWNlIHRoYXQgdGhlcmUgaXMgbm8gd2Fy
cmFudHkgKG9yIGVsc2UsIHNheWluZyB0aGF0IHlvdSBwcm92aWRlIGEgd2FycmFudHkpIGFuZCB0
aGF0IHVzZXJzIG1heSByZWRpc3RyaWJ1dGUgdGhlIHByb2dyYW0gdW5kZXIgdGhlc2UgY29uZGl0
aW9ucywgYW5kIHRlbGxpbmcgdGhlIHVzZXIgaG93IHRvIHZpZXcgYSBjb3B5IG9mIHRoaXMgTGlj
ZW5zZS4gKEV4Y2VwdGlvbjogaWYgdGhlIFByb2dyYW0gaXRzZWxmIGlzIGludGVyYWN0aXZlIGJ1
dCBkb2VzIG5vdCBub3JtYWxseSBwcmludCBzdWNoIGFuIGFubm91bmNlbWVudCwgeW91ciB3b3Jr
IGJhc2VkIG9uIHRoZSBQcm9ncmFtIGlzIG5vdCByZXF1aXJlZCB0byBwcmludCBhbiBhbm5vdW5j
ZW1lbnQuKQorIyArVGhlc2UgcmVxdWlyZW1lbnRzIGFwcGx5IHRvIHRoZSBtb2RpZmllZCB3b3Jr
IGFzIGEgd2hvbGUuIElmIGlkZW50aWZpYWJsZSBzZWN0aW9ucyBvZiB0aGF0IHdvcmsgYXJlIG5v
dCBkZXJpdmVkIGZyb20gdGhlIFByb2dyYW0sIGFuZCBjYW4gYmUgcmVhc29uYWJseSBjb25zaWRl
cmVkIGluZGVwZW5kZW50IGFuZCBzZXBhcmF0ZSB3b3JrcyBpbiB0aGVtc2VsdmVzLCB0aGVuIHRo
aXMgTGljZW5zZSwgYW5kIGl0cyB0ZXJtcywgZG8gbm90IGFwcGx5IHRvIHRob3NlIHNlY3Rpb25z
IHdoZW4geW91IGRpc3RyaWJ1dGUgdGhlbSBhcyBzZXBhcmF0ZSB3b3Jrcy4gQnV0IHdoZW4geW91
IGRpc3RyaWJ1dGUgdGhlIHNhbWUgc2VjdGlvbnMgYXMgcGFydCBvZiBhIHdob2xlIHdoaWNoIGlz
IGEgd29yayBiYXNlZCBvbiB0aGUgUHJvZ3JhbSwgdGhlIGRpc3RyaWJ1dGlvbiBvZiB0aGUgd2hv
bGUgbXVzdCBiZSBvbiB0aGUgdGVybXMgb2YgdGhpcyBMaWNlbnNlLCB3aG9zZSBwZXJtaXNzaW9u
cyBmb3Igb3RoZXIgbGljZW5zZWVzIGV4dGVuZCB0byB0aGUgZW50aXJlIHdob2xlLCBhbmQgdGh1
cyB0byBlYWNoIGFuZCBldmVyeSBwYXJ0IHJlZ2FyZGxlc3Mgb2Ygd2hvIHdyb3RlIGl0LgorIyAg
CisjIC0gICAgYikgWW91IG11c3QgY2F1c2UgYW55IHdvcmsgdGhhdCB5b3UgZGlzdHJpYnV0ZSBv
ciBwdWJsaXNoLCB0aGF0IGluCisjIC0gICAgd2hvbGUgb3IgaW4gcGFydCBjb250YWlucyBvciBp
cyBkZXJpdmVkIGZyb20gdGhlIFByb2dyYW0gb3IgYW55CisjIC0gICAgcGFydCB0aGVyZW9mLCB0
byBiZSBsaWNlbnNlZCBhcyBhIHdob2xlIGF0IG5vIGNoYXJnZSB0byBhbGwgdGhpcmQKKyMgLSAg
ICBwYXJ0aWVzIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGlzIExpY2Vuc2UuCisjICtUaHVzLCBpdCBp
cyBub3QgdGhlIGludGVudCBvZiB0aGlzIHNlY3Rpb24gdG8gY2xhaW0gcmlnaHRzIG9yIGNvbnRl
c3QgeW91ciByaWdodHMgdG8gd29yayB3cml0dGVuIGVudGlyZWx5IGJ5IHlvdTsgcmF0aGVyLCB0
aGUgaW50ZW50IGlzIHRvIGV4ZXJjaXNlIHRoZSByaWdodCB0byBjb250cm9sIHRoZSBkaXN0cmli
dXRpb24gb2YgZGVyaXZhdGl2ZSBvciBjb2xsZWN0aXZlIHdvcmtzIGJhc2VkIG9uIHRoZSBQcm9n
cmFtLgorIyAgCisjIC0gICAgYykgSWYgdGhlIG1vZGlmaWVkIHByb2dyYW0gbm9ybWFsbHkgcmVh
ZHMgY29tbWFuZHMgaW50ZXJhY3RpdmVseQorIyAtICAgIHdoZW4gcnVuLCB5b3UgbXVzdCBjYXVz
ZSBpdCwgd2hlbiBzdGFydGVkIHJ1bm5pbmcgZm9yIHN1Y2gKKyMgLSAgICBpbnRlcmFjdGl2ZSB1
c2UgaW4gdGhlIG1vc3Qgb3JkaW5hcnkgd2F5LCB0byBwcmludCBvciBkaXNwbGF5IGFuCisjIC0g
ICAgYW5ub3VuY2VtZW50IGluY2x1ZGluZyBhbiBhcHByb3ByaWF0ZSBjb3B5cmlnaHQgbm90aWNl
IGFuZCBhCisjIC0gICAgbm90aWNlIHRoYXQgdGhlcmUgaXMgbm8gd2FycmFudHkgKG9yIGVsc2Us
IHNheWluZyB0aGF0IHlvdSBwcm92aWRlCisjIC0gICAgYSB3YXJyYW50eSkgYW5kIHRoYXQgdXNl
cnMgbWF5IHJlZGlzdHJpYnV0ZSB0aGUgcHJvZ3JhbSB1bmRlcgorIyAtICAgIHRoZXNlIGNvbmRp
dGlvbnMsIGFuZCB0ZWxsaW5nIHRoZSB1c2VyIGhvdyB0byB2aWV3IGEgY29weSBvZiB0aGlzCisj
IC0gICAgTGljZW5zZS4gIChFeGNlcHRpb246IGlmIHRoZSBQcm9ncmFtIGl0c2VsZiBpcyBpbnRl
cmFjdGl2ZSBidXQKKyMgLSAgICBkb2VzIG5vdCBub3JtYWxseSBwcmludCBzdWNoIGFuIGFubm91
bmNlbWVudCwgeW91ciB3b3JrIGJhc2VkIG9uCisjIC0gICAgdGhlIFByb2dyYW0gaXMgbm90IHJl
cXVpcmVkIHRvIHByaW50IGFuIGFubm91bmNlbWVudC4pCisjICtJbiBhZGRpdGlvbiwgbWVyZSBh
Z2dyZWdhdGlvbiBvZiBhbm90aGVyIHdvcmsgbm90IGJhc2VkIG9uIHRoZSBQcm9ncmFtIHdpdGgg
dGhlIFByb2dyYW0gKG9yIHdpdGggYSB3b3JrIGJhc2VkIG9uIHRoZSBQcm9ncmFtKSBvbiBhIHZv
bHVtZSBvZiBhIHN0b3JhZ2Ugb3IgZGlzdHJpYnV0aW9uIG1lZGl1bSBkb2VzIG5vdCBicmluZyB0
aGUgb3RoZXIgd29yayB1bmRlciB0aGUgc2NvcGUgb2YgdGhpcyBMaWNlbnNlLgorIyAgCisjIC1U
aGVzZSByZXF1aXJlbWVudHMgYXBwbHkgdG8gdGhlIG1vZGlmaWVkIHdvcmsgYXMgYSB3aG9sZS4g
IElmCisjIC1pZGVudGlmaWFibGUgc2VjdGlvbnMgb2YgdGhhdCB3b3JrIGFyZSBub3QgZGVyaXZl
ZCBmcm9tIHRoZSBQcm9ncmFtLAorIyAtYW5kIGNhbiBiZSByZWFzb25hYmx5IGNvbnNpZGVyZWQg
aW5kZXBlbmRlbnQgYW5kIHNlcGFyYXRlIHdvcmtzIGluCisjIC10aGVtc2VsdmVzLCB0aGVuIHRo
aXMgTGljZW5zZSwgYW5kIGl0cyB0ZXJtcywgZG8gbm90IGFwcGx5IHRvIHRob3NlCisjIC1zZWN0
aW9ucyB3aGVuIHlvdSBkaXN0cmlidXRlIHRoZW0gYXMgc2VwYXJhdGUgd29ya3MuICBCdXQgd2hl
biB5b3UKKyMgLWRpc3RyaWJ1dGUgdGhlIHNhbWUgc2VjdGlvbnMgYXMgcGFydCBvZiBhIHdob2xl
IHdoaWNoIGlzIGEgd29yayBiYXNlZAorIyAtb24gdGhlIFByb2dyYW0sIHRoZSBkaXN0cmlidXRp
b24gb2YgdGhlIHdob2xlIG11c3QgYmUgb24gdGhlIHRlcm1zIG9mCisjIC10aGlzIExpY2Vuc2Us
IHdob3NlIHBlcm1pc3Npb25zIGZvciBvdGhlciBsaWNlbnNlZXMgZXh0ZW5kIHRvIHRoZQorIyAt
ZW50aXJlIHdob2xlLCBhbmQgdGh1cyB0byBlYWNoIGFuZCBldmVyeSBwYXJ0IHJlZ2FyZGxlc3Mg
b2Ygd2hvIHdyb3RlIGl0LgorIyArMy4gWW91IG1heSBjb3B5IGFuZCBkaXN0cmlidXRlIHRoZSBQ
cm9ncmFtIChvciBhIHdvcmsgYmFzZWQgb24gaXQsIHVuZGVyIFNlY3Rpb24gMikgaW4gb2JqZWN0
IGNvZGUgb3IgZXhlY3V0YWJsZSBmb3JtIHVuZGVyIHRoZSB0ZXJtcyBvZiBTZWN0aW9ucyAxIGFu
ZCAyIGFib3ZlIHByb3ZpZGVkIHRoYXQgeW91IGFsc28gZG8gb25lIG9mIHRoZSBmb2xsb3dpbmc6
CisjICthKSBBY2NvbXBhbnkgaXQgd2l0aCB0aGUgY29tcGxldGUgY29ycmVzcG9uZGluZyBtYWNo
aW5lLXJlYWRhYmxlIHNvdXJjZSBjb2RlLCB3aGljaCBtdXN0IGJlIGRpc3RyaWJ1dGVkIHVuZGVy
IHRoZSB0ZXJtcyBvZiBTZWN0aW9ucyAxIGFuZCAyIGFib3ZlIG9uIGEgbWVkaXVtIGN1c3RvbWFy
aWx5IHVzZWQgZm9yIHNvZnR3YXJlIGludGVyY2hhbmdlOyBvciwKKyMgK2IpIEFjY29tcGFueSBp
dCB3aXRoIGEgd3JpdHRlbiBvZmZlciwgdmFsaWQgZm9yIGF0IGxlYXN0IHRocmVlIHllYXJzLCB0
byBnaXZlIGFueSB0aGlyZCBwYXJ0eSwgZm9yIGEgY2hhcmdlIG5vIG1vcmUgdGhhbiB5b3VyIGNv
c3Qgb2YgcGh5c2ljYWxseSBwZXJmb3JtaW5nIHNvdXJjZSBkaXN0cmlidXRpb24sIGEgY29tcGxl
dGUgbWFjaGluZS1yZWFkYWJsZSBjb3B5IG9mIHRoZSBjb3JyZXNwb25kaW5nIHNvdXJjZSBjb2Rl
LCB0byBiZSBkaXN0cmlidXRlZCB1bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbnMgMSBhbmQgMiBh
Ym92ZSBvbiBhIG1lZGl1bSBjdXN0b21hcmlseSB1c2VkIGZvciBzb2Z0d2FyZSBpbnRlcmNoYW5n
ZTsgb3IsCisjICtjKSBBY2NvbXBhbnkgaXQgd2l0aCB0aGUgaW5mb3JtYXRpb24geW91IHJlY2Vp
dmVkIGFzIHRvIHRoZSBvZmZlciB0byBkaXN0cmlidXRlIGNvcnJlc3BvbmRpbmcgc291cmNlIGNv
ZGUuIChUaGlzIGFsdGVybmF0aXZlIGlzIGFsbG93ZWQgb25seSBmb3Igbm9uY29tbWVyY2lhbCBk
aXN0cmlidXRpb24gYW5kIG9ubHkgaWYgeW91IHJlY2VpdmVkIHRoZSBwcm9ncmFtIGluIG9iamVj
dCBjb2RlIG9yIGV4ZWN1dGFibGUgZm9ybSB3aXRoIHN1Y2ggYW4gb2ZmZXIsIGluIGFjY29yZCB3
aXRoIFN1YnNlY3Rpb24gYiBhYm92ZS4pCisjICtUaGUgc291cmNlIGNvZGUgZm9yIGEgd29yayBt
ZWFucyB0aGUgcHJlZmVycmVkIGZvcm0gb2YgdGhlIHdvcmsgZm9yIG1ha2luZyBtb2RpZmljYXRp
b25zIHRvIGl0LiBGb3IgYW4gZXhlY3V0YWJsZSB3b3JrLCBjb21wbGV0ZSBzb3VyY2UgY29kZSBt
ZWFucyBhbGwgdGhlIHNvdXJjZSBjb2RlIGZvciBhbGwgbW9kdWxlcyBpdCBjb250YWlucywgcGx1
cyBhbnkgYXNzb2NpYXRlZCBpbnRlcmZhY2UgZGVmaW5pdGlvbiBmaWxlcywgcGx1cyB0aGUgc2Ny
aXB0cyB1c2VkIHRvIGNvbnRyb2wgY29tcGlsYXRpb24gYW5kIGluc3RhbGxhdGlvbiBvZiB0aGUg
ZXhlY3V0YWJsZS4gSG93ZXZlciwgYXMgYSBzcGVjaWFsIGV4Y2VwdGlvbiwgdGhlIHNvdXJjZSBj
b2RlIGRpc3RyaWJ1dGVkIG5lZWQgbm90IGluY2x1ZGUgYW55dGhpbmcgdGhhdCBpcyBub3JtYWxs
eSBkaXN0cmlidXRlZCAoaW4gZWl0aGVyIHNvdXJjZSBvciBiaW5hcnkgZm9ybSkgd2l0aCB0aGUg
bWFqb3IgY29tcG9uZW50cyAoY29tcGlsZXIsIGtlcm5lbCwgYW5kIHNvIG9uKSBvZiB0aGUgb3Bl
cmF0aW5nIHN5c3RlbSBvbiB3aGljaCB0aGUgZXhlY3V0YWJsZSBydW5zLCB1bmxlc3MgdGhhdCBj
b21wb25lbnQgaXRzZWxmIGFjY29tcGFuaWVzIHRoZSBleGVjdXRhYmxlLgorIyAgCisjIC1UaHVz
LCBpdCBpcyBub3QgdGhlIGludGVudCBvZiB0aGlzIHNlY3Rpb24gdG8gY2xhaW0gcmlnaHRzIG9y
IGNvbnRlc3QKKyMgLXlvdXIgcmlnaHRzIHRvIHdvcmsgd3JpdHRlbiBlbnRpcmVseSBieSB5b3U7
IHJhdGhlciwgdGhlIGludGVudCBpcyB0bworIyAtZXhlcmNpc2UgdGhlIHJpZ2h0IHRvIGNvbnRy
b2wgdGhlIGRpc3RyaWJ1dGlvbiBvZiBkZXJpdmF0aXZlIG9yCisjIC1jb2xsZWN0aXZlIHdvcmtz
IGJhc2VkIG9uIHRoZSBQcm9ncmFtLgorIyArSWYgZGlzdHJpYnV0aW9uIG9mIGV4ZWN1dGFibGUg
b3Igb2JqZWN0IGNvZGUgaXMgbWFkZSBieSBvZmZlcmluZyBhY2Nlc3MgdG8gY29weSBmcm9tIGEg
ZGVzaWduYXRlZCBwbGFjZSwgdGhlbiBvZmZlcmluZyBlcXVpdmFsZW50IGFjY2VzcyB0byBjb3B5
IHRoZSBzb3VyY2UgY29kZSBmcm9tIHRoZSBzYW1lIHBsYWNlIGNvdW50cyBhcyBkaXN0cmlidXRp
b24gb2YgdGhlIHNvdXJjZSBjb2RlLCBldmVuIHRob3VnaCB0aGlyZCBwYXJ0aWVzIGFyZSBub3Qg
Y29tcGVsbGVkIHRvIGNvcHkgdGhlIHNvdXJjZSBhbG9uZyB3aXRoIHRoZSBvYmplY3QgY29kZS4K
KyMgIAorIyAtSW4gYWRkaXRpb24sIG1lcmUgYWdncmVnYXRpb24gb2YgYW5vdGhlciB3b3JrIG5v
dCBiYXNlZCBvbiB0aGUgUHJvZ3JhbQorIyAtd2l0aCB0aGUgUHJvZ3JhbSAob3Igd2l0aCBhIHdv
cmsgYmFzZWQgb24gdGhlIFByb2dyYW0pIG9uIGEgdm9sdW1lIG9mCisjIC1hIHN0b3JhZ2Ugb3Ig
ZGlzdHJpYnV0aW9uIG1lZGl1bSBkb2VzIG5vdCBicmluZyB0aGUgb3RoZXIgd29yayB1bmRlcgor
IyAtdGhlIHNjb3BlIG9mIHRoaXMgTGljZW5zZS4KKyMgKzQuIFlvdSBtYXkgbm90IGNvcHksIG1v
ZGlmeSwgc3VibGljZW5zZSwgb3IgZGlzdHJpYnV0ZSB0aGUgUHJvZ3JhbSBleGNlcHQgYXMgZXhw
cmVzc2x5IHByb3ZpZGVkIHVuZGVyIHRoaXMgTGljZW5zZS4gQW55IGF0dGVtcHQgb3RoZXJ3aXNl
IHRvIGNvcHksIG1vZGlmeSwgc3VibGljZW5zZSBvciBkaXN0cmlidXRlIHRoZSBQcm9ncmFtIGlz
IHZvaWQsIGFuZCB3aWxsIGF1dG9tYXRpY2FsbHkgdGVybWluYXRlIHlvdXIgcmlnaHRzIHVuZGVy
IHRoaXMgTGljZW5zZS4gSG93ZXZlciwgcGFydGllcyB3aG8gaGF2ZSByZWNlaXZlZCBjb3BpZXMs
IG9yIHJpZ2h0cywgZnJvbSB5b3UgdW5kZXIgdGhpcyBMaWNlbnNlIHdpbGwgbm90IGhhdmUgdGhl
aXIgbGljZW5zZXMgdGVybWluYXRlZCBzbyBsb25nIGFzIHN1Y2ggcGFydGllcyByZW1haW4gaW4g
ZnVsbCBjb21wbGlhbmNlLgorIyAgCisjIC0gIDMuIFlvdSBtYXkgY29weSBhbmQgZGlzdHJpYnV0
ZSB0aGUgUHJvZ3JhbSAob3IgYSB3b3JrIGJhc2VkIG9uIGl0LAorIyAtdW5kZXIgU2VjdGlvbiAy
KSBpbiBvYmplY3QgY29kZSBvciBleGVjdXRhYmxlIGZvcm0gdW5kZXIgdGhlIHRlcm1zIG9mCisj
IC1TZWN0aW9ucyAxIGFuZCAyIGFib3ZlIHByb3ZpZGVkIHRoYXQgeW91IGFsc28gZG8gb25lIG9m
IHRoZSBmb2xsb3dpbmc6CisjICs1LiBZb3UgYXJlIG5vdCByZXF1aXJlZCB0byBhY2NlcHQgdGhp
cyBMaWNlbnNlLCBzaW5jZSB5b3UgaGF2ZSBub3Qgc2lnbmVkIGl0LiBIb3dldmVyLCBub3RoaW5n
IGVsc2UgZ3JhbnRzIHlvdSBwZXJtaXNzaW9uIHRvIG1vZGlmeSBvciBkaXN0cmlidXRlIHRoZSBQ
cm9ncmFtIG9yIGl0cyBkZXJpdmF0aXZlIHdvcmtzLiBUaGVzZSBhY3Rpb25zIGFyZSBwcm9oaWJp
dGVkIGJ5IGxhdyBpZiB5b3UgZG8gbm90IGFjY2VwdCB0aGlzIExpY2Vuc2UuIFRoZXJlZm9yZSwg
YnkgbW9kaWZ5aW5nIG9yIGRpc3RyaWJ1dGluZyB0aGUgUHJvZ3JhbSAob3IgYW55IHdvcmsgYmFz
ZWQgb24gdGhlIFByb2dyYW0pLCB5b3UgaW5kaWNhdGUgeW91ciBhY2NlcHRhbmNlIG9mIHRoaXMg
TGljZW5zZSB0byBkbyBzbywgYW5kIGFsbCBpdHMgdGVybXMgYW5kIGNvbmRpdGlvbnMgZm9yIGNv
cHlpbmcsIGRpc3RyaWJ1dGluZyBvciBtb2RpZnlpbmcgdGhlIFByb2dyYW0gb3Igd29ya3MgYmFz
ZWQgb24gaXQuCisjICAKKyMgLSAgICBhKSBBY2NvbXBhbnkgaXQgd2l0aCB0aGUgY29tcGxldGUg
Y29ycmVzcG9uZGluZyBtYWNoaW5lLXJlYWRhYmxlCisjIC0gICAgc291cmNlIGNvZGUsIHdoaWNo
IG11c3QgYmUgZGlzdHJpYnV0ZWQgdW5kZXIgdGhlIHRlcm1zIG9mIFNlY3Rpb25zCisjIC0gICAg
MSBhbmQgMiBhYm92ZSBvbiBhIG1lZGl1bSBjdXN0b21hcmlseSB1c2VkIGZvciBzb2Z0d2FyZSBp
bnRlcmNoYW5nZTsgb3IsCisjICs2LiBFYWNoIHRpbWUgeW91IHJlZGlzdHJpYnV0ZSB0aGUgUHJv
Z3JhbSAob3IgYW55IHdvcmsgYmFzZWQgb24gdGhlIFByb2dyYW0pLCB0aGUgcmVjaXBpZW50IGF1
dG9tYXRpY2FsbHkgcmVjZWl2ZXMgYSBsaWNlbnNlIGZyb20gdGhlIG9yaWdpbmFsIGxpY2Vuc29y
IHRvIGNvcHksIGRpc3RyaWJ1dGUgb3IgbW9kaWZ5IHRoZSBQcm9ncmFtIHN1YmplY3QgdG8gdGhl
c2UgdGVybXMgYW5kIGNvbmRpdGlvbnMuIFlvdSBtYXkgbm90IGltcG9zZSBhbnkgZnVydGhlciBy
ZXN0cmljdGlvbnMgb24gdGhlIHJlY2lwaWVudHMnIGV4ZXJjaXNlIG9mIHRoZSByaWdodHMgZ3Jh
bnRlZCBoZXJlaW4uIFlvdSBhcmUgbm90IHJlc3BvbnNpYmxlIGZvciBlbmZvcmNpbmcgY29tcGxp
YW5jZSBieSB0aGlyZCBwYXJ0aWVzIHRvIHRoaXMgTGljZW5zZS4KKyMgIAorIyAtICAgIGIpIEFj
Y29tcGFueSBpdCB3aXRoIGEgd3JpdHRlbiBvZmZlciwgdmFsaWQgZm9yIGF0IGxlYXN0IHRocmVl
CisjIC0gICAgeWVhcnMsIHRvIGdpdmUgYW55IHRoaXJkIHBhcnR5LCBmb3IgYSBjaGFyZ2Ugbm8g
bW9yZSB0aGFuIHlvdXIKKyMgLSAgICBjb3N0IG9mIHBoeXNpY2FsbHkgcGVyZm9ybWluZyBzb3Vy
Y2UgZGlzdHJpYnV0aW9uLCBhIGNvbXBsZXRlCisjIC0gICAgbWFjaGluZS1yZWFkYWJsZSBjb3B5
IG9mIHRoZSBjb3JyZXNwb25kaW5nIHNvdXJjZSBjb2RlLCB0byBiZQorIyAtICAgIGRpc3RyaWJ1
dGVkIHVuZGVyIHRoZSB0ZXJtcyBvZiBTZWN0aW9ucyAxIGFuZCAyIGFib3ZlIG9uIGEgbWVkaXVt
CisjIC0gICAgY3VzdG9tYXJpbHkgdXNlZCBmb3Igc29mdHdhcmUgaW50ZXJjaGFuZ2U7IG9yLAor
IyArNy4gSWYsIGFzIGEgY29uc2VxdWVuY2Ugb2YgYSBjb3VydCBqdWRnbWVudCBvciBhbGxlZ2F0
aW9uIG9mIHBhdGVudCBpbmZyaW5nZW1lbnQgb3IgZm9yIGFueSBvdGhlciByZWFzb24gKG5vdCBs
aW1pdGVkIHRvIHBhdGVudCBpc3N1ZXMpLCBjb25kaXRpb25zIGFyZSBpbXBvc2VkIG9uIHlvdSAo
d2hldGhlciBieSBjb3VydCBvcmRlciwgYWdyZWVtZW50IG9yIG90aGVyd2lzZSkgdGhhdCBjb250
cmFkaWN0IHRoZSBjb25kaXRpb25zIG9mIHRoaXMgTGljZW5zZSwgdGhleSBkbyBub3QgZXhjdXNl
IHlvdSBmcm9tIHRoZSBjb25kaXRpb25zIG9mIHRoaXMgTGljZW5zZS4gSWYgeW91IGNhbm5vdCBk
aXN0cmlidXRlIHNvIGFzIHRvIHNhdGlzZnkgc2ltdWx0YW5lb3VzbHkgeW91ciBvYmxpZ2F0aW9u
cyB1bmRlciB0aGlzIExpY2Vuc2UgYW5kIGFueSBvdGhlciBwZXJ0aW5lbnQgb2JsaWdhdGlvbnMs
IHRoZW4gYXMgYSBjb25zZXF1ZW5jZSB5b3UgbWF5IG5vdCBkaXN0cmlidXRlIHRoZSBQcm9ncmFt
IGF0IGFsbC4gRm9yIGV4YW1wbGUsIGlmIGEgcGF0ZW50IGxpY2Vuc2Ugd291bGQgbm90IHBlcm1p
dCByb3lhbHR5LWZyZWUgcmVkaXN0cmlidXRpb24gb2YgdGhlIFByb2dyYW0gYnkgYWxsIHRob3Nl
IHdobyByZWNlaXZlIGNvcGllcyBkaXJlY3RseSBvciBpbmRpcmVjdGx5IHRocm91Z2ggeW91LCB0
aGVuIHRoZSBvbmx5IHdheSB5b3UgY291bGQgc2F0aXNmeSBib3RoIGl0IGFuZCB0aGlzIExpY2Vu
c2Ugd291bGQgYmUgdG8gcmVmcmFpbiBlbnRpcmVseSBmcm9tIGRpc3RyaWJ1dGlvbiBvZiB0aGUg
UHJvZ3JhbS4KKyMgK0lmIGFueSBwb3J0aW9uIG9mIHRoaXMgc2VjdGlvbiBpcyBoZWxkIGludmFs
aWQgb3IgdW5lbmZvcmNlYWJsZSB1bmRlciBhbnkgcGFydGljdWxhciBjaXJjdW1zdGFuY2UsIHRo
ZSBiYWxhbmNlIG9mIHRoZSBzZWN0aW9uIGlzIGludGVuZGVkIHRvIGFwcGx5IGFuZCB0aGUgc2Vj
dGlvbiBhcyBhIHdob2xlIGlzIGludGVuZGVkIHRvIGFwcGx5IGluIG90aGVyIGNpcmN1bXN0YW5j
ZXMuCisjICAKKyMgLSAgICBjKSBBY2NvbXBhbnkgaXQgd2l0aCB0aGUgaW5mb3JtYXRpb24geW91
IHJlY2VpdmVkIGFzIHRvIHRoZSBvZmZlcgorIyAtICAgIHRvIGRpc3RyaWJ1dGUgY29ycmVzcG9u
ZGluZyBzb3VyY2UgY29kZS4gIChUaGlzIGFsdGVybmF0aXZlIGlzCisjIC0gICAgYWxsb3dlZCBv
bmx5IGZvciBub25jb21tZXJjaWFsIGRpc3RyaWJ1dGlvbiBhbmQgb25seSBpZiB5b3UKKyMgLSAg
ICByZWNlaXZlZCB0aGUgcHJvZ3JhbSBpbiBvYmplY3QgY29kZSBvciBleGVjdXRhYmxlIGZvcm0g
d2l0aCBzdWNoCisjIC0gICAgYW4gb2ZmZXIsIGluIGFjY29yZCB3aXRoIFN1YnNlY3Rpb24gYiBh
Ym92ZS4pCisjICtJdCBpcyBub3QgdGhlIHB1cnBvc2Ugb2YgdGhpcyBzZWN0aW9uIHRvIGluZHVj
ZSB5b3UgdG8gaW5mcmluZ2UgYW55IHBhdGVudHMgb3Igb3RoZXIgcHJvcGVydHkgcmlnaHQgY2xh
aW1zIG9yIHRvIGNvbnRlc3QgdmFsaWRpdHkgb2YgYW55IHN1Y2ggY2xhaW1zOyB0aGlzIHNlY3Rp
b24gaGFzIHRoZSBzb2xlIHB1cnBvc2Ugb2YgcHJvdGVjdGluZyB0aGUgaW50ZWdyaXR5IG9mIHRo
ZSBmcmVlIHNvZnR3YXJlIGRpc3RyaWJ1dGlvbiBzeXN0ZW0sIHdoaWNoIGlzIGltcGxlbWVudGVk
IGJ5IHB1YmxpYyBsaWNlbnNlIHByYWN0aWNlcy4gTWFueSBwZW9wbGUgaGF2ZSBtYWRlIGdlbmVy
b3VzIGNvbnRyaWJ1dGlvbnMgdG8gdGhlIHdpZGUgcmFuZ2Ugb2Ygc29mdHdhcmUgZGlzdHJpYnV0
ZWQgdGhyb3VnaCB0aGF0IHN5c3RlbSBpbiByZWxpYW5jZSBvbiBjb25zaXN0ZW50IGFwcGxpY2F0
aW9uIG9mIHRoYXQgc3lzdGVtOyBpdCBpcyB1cCB0byB0aGUgYXV0aG9yL2Rvbm9yIHRvIGRlY2lk
ZSBpZiBoZSBvciBzaGUgaXMgd2lsbGluZyB0byBkaXN0cmlidXRlIHNvZnR3YXJlIHRocm91Z2gg
YW55IG90aGVyIHN5c3RlbSBhbmQgYSBsaWNlbnNlZSBjYW5ub3QgaW1wb3NlIHRoYXQgY2hvaWNl
LgorIyAgCisjIC1UaGUgc291cmNlIGNvZGUgZm9yIGEgd29yayBtZWFucyB0aGUgcHJlZmVycmVk
IGZvcm0gb2YgdGhlIHdvcmsgZm9yCisjIC1tYWtpbmcgbW9kaWZpY2F0aW9ucyB0byBpdC4gIEZv
ciBhbiBleGVjdXRhYmxlIHdvcmssIGNvbXBsZXRlIHNvdXJjZQorIyAtY29kZSBtZWFucyBhbGwg
dGhlIHNvdXJjZSBjb2RlIGZvciBhbGwgbW9kdWxlcyBpdCBjb250YWlucywgcGx1cyBhbnkKKyMg
LWFzc29jaWF0ZWQgaW50ZXJmYWNlIGRlZmluaXRpb24gZmlsZXMsIHBsdXMgdGhlIHNjcmlwdHMg
dXNlZCB0bworIyAtY29udHJvbCBjb21waWxhdGlvbiBhbmQgaW5zdGFsbGF0aW9uIG9mIHRoZSBl
eGVjdXRhYmxlLiAgSG93ZXZlciwgYXMgYQorIyAtc3BlY2lhbCBleGNlcHRpb24sIHRoZSBzb3Vy
Y2UgY29kZSBkaXN0cmlidXRlZCBuZWVkIG5vdCBpbmNsdWRlCisjIC1hbnl0aGluZyB0aGF0IGlz
IG5vcm1hbGx5IGRpc3RyaWJ1dGVkIChpbiBlaXRoZXIgc291cmNlIG9yIGJpbmFyeQorIyAtZm9y
bSkgd2l0aCB0aGUgbWFqb3IgY29tcG9uZW50cyAoY29tcGlsZXIsIGtlcm5lbCwgYW5kIHNvIG9u
KSBvZiB0aGUKKyMgLW9wZXJhdGluZyBzeXN0ZW0gb24gd2hpY2ggdGhlIGV4ZWN1dGFibGUgcnVu
cywgdW5sZXNzIHRoYXQgY29tcG9uZW50CisjIC1pdHNlbGYgYWNjb21wYW5pZXMgdGhlIGV4ZWN1
dGFibGUuCisjICtUaGlzIHNlY3Rpb24gaXMgaW50ZW5kZWQgdG8gbWFrZSB0aG9yb3VnaGx5IGNs
ZWFyIHdoYXQgaXMgYmVsaWV2ZWQgdG8gYmUgYSBjb25zZXF1ZW5jZSBvZiB0aGUgcmVzdCBvZiB0
aGlzIExpY2Vuc2UuCisjICAKKyMgLUlmIGRpc3RyaWJ1dGlvbiBvZiBleGVjdXRhYmxlIG9yIG9i
amVjdCBjb2RlIGlzIG1hZGUgYnkgb2ZmZXJpbmcKKyMgLWFjY2VzcyB0byBjb3B5IGZyb20gYSBk
ZXNpZ25hdGVkIHBsYWNlLCB0aGVuIG9mZmVyaW5nIGVxdWl2YWxlbnQKKyMgLWFjY2VzcyB0byBj
b3B5IHRoZSBzb3VyY2UgY29kZSBmcm9tIHRoZSBzYW1lIHBsYWNlIGNvdW50cyBhcworIyAtZGlz
dHJpYnV0aW9uIG9mIHRoZSBzb3VyY2UgY29kZSwgZXZlbiB0aG91Z2ggdGhpcmQgcGFydGllcyBh
cmUgbm90CisjIC1jb21wZWxsZWQgdG8gY29weSB0aGUgc291cmNlIGFsb25nIHdpdGggdGhlIG9i
amVjdCBjb2RlLgorIyArOC4gSWYgdGhlIGRpc3RyaWJ1dGlvbiBhbmQvb3IgdXNlIG9mIHRoZSBQ
cm9ncmFtIGlzIHJlc3RyaWN0ZWQgaW4gY2VydGFpbiBjb3VudHJpZXMgZWl0aGVyIGJ5IHBhdGVu
dHMgb3IgYnkgY29weXJpZ2h0ZWQgaW50ZXJmYWNlcywgdGhlIG9yaWdpbmFsIGNvcHlyaWdodCBo
b2xkZXIgd2hvIHBsYWNlcyB0aGUgUHJvZ3JhbSB1bmRlciB0aGlzIExpY2Vuc2UgbWF5IGFkZCBh
biBleHBsaWNpdCBnZW9ncmFwaGljYWwgZGlzdHJpYnV0aW9uIGxpbWl0YXRpb24gZXhjbHVkaW5n
IHRob3NlIGNvdW50cmllcywgc28gdGhhdCBkaXN0cmlidXRpb24gaXMgcGVybWl0dGVkIG9ubHkg
aW4gb3IgYW1vbmcgY291bnRyaWVzIG5vdCB0aHVzIGV4Y2x1ZGVkLiBJbiBzdWNoIGNhc2UsIHRo
aXMgTGljZW5zZSBpbmNvcnBvcmF0ZXMgdGhlIGxpbWl0YXRpb24gYXMgaWYgd3JpdHRlbiBpbiB0
aGUgYm9keSBvZiB0aGlzIExpY2Vuc2UuCisjICAKKyMgLSAgNC4gWW91IG1heSBub3QgY29weSwg
bW9kaWZ5LCBzdWJsaWNlbnNlLCBvciBkaXN0cmlidXRlIHRoZSBQcm9ncmFtCisjIC1leGNlcHQg
YXMgZXhwcmVzc2x5IHByb3ZpZGVkIHVuZGVyIHRoaXMgTGljZW5zZS4gIEFueSBhdHRlbXB0Cisj
IC1vdGhlcndpc2UgdG8gY29weSwgbW9kaWZ5LCBzdWJsaWNlbnNlIG9yIGRpc3RyaWJ1dGUgdGhl
IFByb2dyYW0gaXMKKyMgLXZvaWQsIGFuZCB3aWxsIGF1dG9tYXRpY2FsbHkgdGVybWluYXRlIHlv
dXIgcmlnaHRzIHVuZGVyIHRoaXMgTGljZW5zZS4KKyMgLUhvd2V2ZXIsIHBhcnRpZXMgd2hvIGhh
dmUgcmVjZWl2ZWQgY29waWVzLCBvciByaWdodHMsIGZyb20geW91IHVuZGVyCisjIC10aGlzIExp
Y2Vuc2Ugd2lsbCBub3QgaGF2ZSB0aGVpciBsaWNlbnNlcyB0ZXJtaW5hdGVkIHNvIGxvbmcgYXMg
c3VjaAorIyAtcGFydGllcyByZW1haW4gaW4gZnVsbCBjb21wbGlhbmNlLgorIyArOS4gVGhlIEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbiBtYXkgcHVibGlzaCByZXZpc2VkIGFuZC9vciBuZXcgdmVy
c2lvbnMgb2YgdGhlIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZnJvbSB0aW1lIHRvIHRpbWUuIFN1
Y2ggbmV3IHZlcnNpb25zIHdpbGwgYmUgc2ltaWxhciBpbiBzcGlyaXQgdG8gdGhlIHByZXNlbnQg
dmVyc2lvbiwgYnV0IG1heSBkaWZmZXIgaW4gZGV0YWlsIHRvIGFkZHJlc3MgbmV3IHByb2JsZW1z
IG9yIGNvbmNlcm5zLgorIyArRWFjaCB2ZXJzaW9uIGlzIGdpdmVuIGEgZGlzdGluZ3Vpc2hpbmcg
dmVyc2lvbiBudW1iZXIuIElmIHRoZSBQcm9ncmFtIHNwZWNpZmllcyBhIHZlcnNpb24gbnVtYmVy
IG9mIHRoaXMgTGljZW5zZSB3aGljaCBhcHBsaWVzIHRvIGl0IGFuZCAiYW55IGxhdGVyIHZlcnNp
b24iLCB5b3UgaGF2ZSB0aGUgb3B0aW9uIG9mIGZvbGxvd2luZyB0aGUgdGVybXMgYW5kIGNvbmRp
dGlvbnMgZWl0aGVyIG9mIHRoYXQgdmVyc2lvbiBvciBvZiBhbnkgbGF0ZXIgdmVyc2lvbiBwdWJs
aXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4gSWYgdGhlIFByb2dyYW0gZG9l
cyBub3Qgc3BlY2lmeSBhIHZlcnNpb24gbnVtYmVyIG9mIHRoaXMgTGljZW5zZSwgeW91IG1heSBj
aG9vc2UgYW55IHZlcnNpb24gZXZlciBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbi4KKyMgIAorIyAtICA1LiBZb3UgYXJlIG5vdCByZXF1aXJlZCB0byBhY2NlcHQgdGhp
cyBMaWNlbnNlLCBzaW5jZSB5b3UgaGF2ZSBub3QKKyMgLXNpZ25lZCBpdC4gIEhvd2V2ZXIsIG5v
dGhpbmcgZWxzZSBncmFudHMgeW91IHBlcm1pc3Npb24gdG8gbW9kaWZ5IG9yCisjIC1kaXN0cmli
dXRlIHRoZSBQcm9ncmFtIG9yIGl0cyBkZXJpdmF0aXZlIHdvcmtzLiAgVGhlc2UgYWN0aW9ucyBh
cmUKKyMgLXByb2hpYml0ZWQgYnkgbGF3IGlmIHlvdSBkbyBub3QgYWNjZXB0IHRoaXMgTGljZW5z
ZS4gIFRoZXJlZm9yZSwgYnkKKyMgLW1vZGlmeWluZyBvciBkaXN0cmlidXRpbmcgdGhlIFByb2dy
YW0gKG9yIGFueSB3b3JrIGJhc2VkIG9uIHRoZQorIyAtUHJvZ3JhbSksIHlvdSBpbmRpY2F0ZSB5
b3VyIGFjY2VwdGFuY2Ugb2YgdGhpcyBMaWNlbnNlIHRvIGRvIHNvLCBhbmQKKyMgLWFsbCBpdHMg
dGVybXMgYW5kIGNvbmRpdGlvbnMgZm9yIGNvcHlpbmcsIGRpc3RyaWJ1dGluZyBvciBtb2RpZnlp
bmcKKyMgLXRoZSBQcm9ncmFtIG9yIHdvcmtzIGJhc2VkIG9uIGl0LgorIyArMTAuIElmIHlvdSB3
aXNoIHRvIGluY29ycG9yYXRlIHBhcnRzIG9mIHRoZSBQcm9ncmFtIGludG8gb3RoZXIgZnJlZSBw
cm9ncmFtcyB3aG9zZSBkaXN0cmlidXRpb24gY29uZGl0aW9ucyBhcmUgZGlmZmVyZW50LCB3cml0
ZSB0byB0aGUgYXV0aG9yIHRvIGFzayBmb3IgcGVybWlzc2lvbi4gRm9yIHNvZnR3YXJlIHdoaWNo
IGlzIGNvcHlyaWdodGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIHdyaXRlIHRv
IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IHdlIHNvbWV0aW1lcyBtYWtlIGV4Y2VwdGlv
bnMgZm9yIHRoaXMuIE91ciBkZWNpc2lvbiB3aWxsIGJlIGd1aWRlZCBieSB0aGUgdHdvIGdvYWxz
IG9mIHByZXNlcnZpbmcgdGhlIGZyZWUgc3RhdHVzIG9mIGFsbCBkZXJpdmF0aXZlcyBvZiBvdXIg
ZnJlZSBzb2Z0d2FyZSBhbmQgb2YgcHJvbW90aW5nIHRoZSBzaGFyaW5nIGFuZCByZXVzZSBvZiBz
b2Z0d2FyZSBnZW5lcmFsbHkuCisjICtOTyBXQVJSQU5UWQorIyAgCisjIC0gIDYuIEVhY2ggdGlt
ZSB5b3UgcmVkaXN0cmlidXRlIHRoZSBQcm9ncmFtIChvciBhbnkgd29yayBiYXNlZCBvbiB0aGUK
KyMgLVByb2dyYW0pLCB0aGUgcmVjaXBpZW50IGF1dG9tYXRpY2FsbHkgcmVjZWl2ZXMgYSBsaWNl
bnNlIGZyb20gdGhlCisjIC1vcmlnaW5hbCBsaWNlbnNvciB0byBjb3B5LCBkaXN0cmlidXRlIG9y
IG1vZGlmeSB0aGUgUHJvZ3JhbSBzdWJqZWN0IHRvCisjIC10aGVzZSB0ZXJtcyBhbmQgY29uZGl0
aW9ucy4gIFlvdSBtYXkgbm90IGltcG9zZSBhbnkgZnVydGhlcgorIyAtcmVzdHJpY3Rpb25zIG9u
IHRoZSByZWNpcGllbnRzJyBleGVyY2lzZSBvZiB0aGUgcmlnaHRzIGdyYW50ZWQgaGVyZWluLgor
IyAtWW91IGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGVuZm9yY2luZyBjb21wbGlhbmNlIGJ5IHRo
aXJkIHBhcnRpZXMgdG8KKyMgLXRoaXMgTGljZW5zZS4KKyMgKzExLiBCRUNBVVNFIFRIRSBQUk9H
UkFNIElTIExJQ0VOU0VEIEZSRUUgT0YgQ0hBUkdFLCBUSEVSRSBJUyBOTyBXQVJSQU5UWSBGT1Ig
VEhFIFBST0dSQU0sIFRPIFRIRSBFWFRFTlQgUEVSTUlUVEVEIEJZIEFQUExJQ0FCTEUgTEFXLiBF
WENFUFQgV0hFTiBPVEhFUldJU0UgU1RBVEVEIElOIFdSSVRJTkcgVEhFIENPUFlSSUdIVCBIT0xE
RVJTIEFORC9PUiBPVEhFUiBQQVJUSUVTIFBST1ZJREUgVEhFIFBST0dSQU0gIkFTIElTIiBXSVRI
T1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFSVRIRVIgRVhQUkVTU0VEIE9SIElNUExJRUQsIElO
Q0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUgSU1QTElFRCBXQVJSQU5USUVTIE9GIE1F
UkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuIFRIRSBF
TlRJUkUgUklTSyBBUyBUTyBUSEUgUVVBTElUWSBBTkQgUEVSRk9STUFOQ0UgT0YgVEhFIFBST0dS
QU0gSVMgV0lUSCBZT1UuIFNIT1VMRCBUSEUgUFJPR1JBTSBQUk9WRSBERUZFQ1RJVkUsIFlPVSBB
U1NVTUUgVEhFIENPU1QgT0YgQUxMIE5FQ0VTU0FSWSBTRVJWSUNJTkcsIFJFUEFJUiBPUiBDT1JS
RUNUSU9OLgorIyAgCisjIC0gIDcuIElmLCBhcyBhIGNvbnNlcXVlbmNlIG9mIGEgY291cnQganVk
Z21lbnQgb3IgYWxsZWdhdGlvbiBvZiBwYXRlbnQKKyMgLWluZnJpbmdlbWVudCBvciBmb3IgYW55
IG90aGVyIHJlYXNvbiAobm90IGxpbWl0ZWQgdG8gcGF0ZW50IGlzc3VlcyksCisjIC1jb25kaXRp
b25zIGFyZSBpbXBvc2VkIG9uIHlvdSAod2hldGhlciBieSBjb3VydCBvcmRlciwgYWdyZWVtZW50
IG9yCisjIC1vdGhlcndpc2UpIHRoYXQgY29udHJhZGljdCB0aGUgY29uZGl0aW9ucyBvZiB0aGlz
IExpY2Vuc2UsIHRoZXkgZG8gbm90CisjIC1leGN1c2UgeW91IGZyb20gdGhlIGNvbmRpdGlvbnMg
b2YgdGhpcyBMaWNlbnNlLiAgSWYgeW91IGNhbm5vdAorIyAtZGlzdHJpYnV0ZSBzbyBhcyB0byBz
YXRpc2Z5IHNpbXVsdGFuZW91c2x5IHlvdXIgb2JsaWdhdGlvbnMgdW5kZXIgdGhpcworIyAtTGlj
ZW5zZSBhbmQgYW55IG90aGVyIHBlcnRpbmVudCBvYmxpZ2F0aW9ucywgdGhlbiBhcyBhIGNvbnNl
cXVlbmNlIHlvdQorIyAtbWF5IG5vdCBkaXN0cmlidXRlIHRoZSBQcm9ncmFtIGF0IGFsbC4gIEZv
ciBleGFtcGxlLCBpZiBhIHBhdGVudAorIyAtbGljZW5zZSB3b3VsZCBub3QgcGVybWl0IHJveWFs
dHktZnJlZSByZWRpc3RyaWJ1dGlvbiBvZiB0aGUgUHJvZ3JhbSBieQorIyAtYWxsIHRob3NlIHdo
byByZWNlaXZlIGNvcGllcyBkaXJlY3RseSBvciBpbmRpcmVjdGx5IHRocm91Z2ggeW91LCB0aGVu
CisjIC10aGUgb25seSB3YXkgeW91IGNvdWxkIHNhdGlzZnkgYm90aCBpdCBhbmQgdGhpcyBMaWNl
bnNlIHdvdWxkIGJlIHRvCisjIC1yZWZyYWluIGVudGlyZWx5IGZyb20gZGlzdHJpYnV0aW9uIG9m
IHRoZSBQcm9ncmFtLgorIyAtCisjIC1JZiBhbnkgcG9ydGlvbiBvZiB0aGlzIHNlY3Rpb24gaXMg
aGVsZCBpbnZhbGlkIG9yIHVuZW5mb3JjZWFibGUgdW5kZXIKKyMgLWFueSBwYXJ0aWN1bGFyIGNp
cmN1bXN0YW5jZSwgdGhlIGJhbGFuY2Ugb2YgdGhlIHNlY3Rpb24gaXMgaW50ZW5kZWQgdG8KKyMg
LWFwcGx5IGFuZCB0aGUgc2VjdGlvbiBhcyBhIHdob2xlIGlzIGludGVuZGVkIHRvIGFwcGx5IGlu
IG90aGVyCisjIC1jaXJjdW1zdGFuY2VzLgorIyAtCisjIC1JdCBpcyBub3QgdGhlIHB1cnBvc2Ug
b2YgdGhpcyBzZWN0aW9uIHRvIGluZHVjZSB5b3UgdG8gaW5mcmluZ2UgYW55CisjIC1wYXRlbnRz
IG9yIG90aGVyIHByb3BlcnR5IHJpZ2h0IGNsYWltcyBvciB0byBjb250ZXN0IHZhbGlkaXR5IG9m
IGFueQorIyAtc3VjaCBjbGFpbXM7IHRoaXMgc2VjdGlvbiBoYXMgdGhlIHNvbGUgcHVycG9zZSBv
ZiBwcm90ZWN0aW5nIHRoZQorIyAtaW50ZWdyaXR5IG9mIHRoZSBmcmVlIHNvZnR3YXJlIGRpc3Ry
aWJ1dGlvbiBzeXN0ZW0sIHdoaWNoIGlzCisjIC1pbXBsZW1lbnRlZCBieSBwdWJsaWMgbGljZW5z
ZSBwcmFjdGljZXMuICBNYW55IHBlb3BsZSBoYXZlIG1hZGUKKyMgLWdlbmVyb3VzIGNvbnRyaWJ1
dGlvbnMgdG8gdGhlIHdpZGUgcmFuZ2Ugb2Ygc29mdHdhcmUgZGlzdHJpYnV0ZWQKKyMgLXRocm91
Z2ggdGhhdCBzeXN0ZW0gaW4gcmVsaWFuY2Ugb24gY29uc2lzdGVudCBhcHBsaWNhdGlvbiBvZiB0
aGF0CisjIC1zeXN0ZW07IGl0IGlzIHVwIHRvIHRoZSBhdXRob3IvZG9ub3IgdG8gZGVjaWRlIGlm
IGhlIG9yIHNoZSBpcyB3aWxsaW5nCisjIC10byBkaXN0cmlidXRlIHNvZnR3YXJlIHRocm91Z2gg
YW55IG90aGVyIHN5c3RlbSBhbmQgYSBsaWNlbnNlZSBjYW5ub3QKKyMgLWltcG9zZSB0aGF0IGNo
b2ljZS4KKyMgLQorIyAtVGhpcyBzZWN0aW9uIGlzIGludGVuZGVkIHRvIG1ha2UgdGhvcm91Z2hs
eSBjbGVhciB3aGF0IGlzIGJlbGlldmVkIHRvCisjIC1iZSBhIGNvbnNlcXVlbmNlIG9mIHRoZSBy
ZXN0IG9mIHRoaXMgTGljZW5zZS4KKyMgLQorIyAtICA4LiBJZiB0aGUgZGlzdHJpYnV0aW9uIGFu
ZC9vciB1c2Ugb2YgdGhlIFByb2dyYW0gaXMgcmVzdHJpY3RlZCBpbgorIyAtY2VydGFpbiBjb3Vu
dHJpZXMgZWl0aGVyIGJ5IHBhdGVudHMgb3IgYnkgY29weXJpZ2h0ZWQgaW50ZXJmYWNlcywgdGhl
CisjIC1vcmlnaW5hbCBjb3B5cmlnaHQgaG9sZGVyIHdobyBwbGFjZXMgdGhlIFByb2dyYW0gdW5k
ZXIgdGhpcyBMaWNlbnNlCisjIC1tYXkgYWRkIGFuIGV4cGxpY2l0IGdlb2dyYXBoaWNhbCBkaXN0
cmlidXRpb24gbGltaXRhdGlvbiBleGNsdWRpbmcKKyMgLXRob3NlIGNvdW50cmllcywgc28gdGhh
dCBkaXN0cmlidXRpb24gaXMgcGVybWl0dGVkIG9ubHkgaW4gb3IgYW1vbmcKKyMgLWNvdW50cmll
cyBub3QgdGh1cyBleGNsdWRlZC4gIEluIHN1Y2ggY2FzZSwgdGhpcyBMaWNlbnNlIGluY29ycG9y
YXRlcworIyAtdGhlIGxpbWl0YXRpb24gYXMgaWYgd3JpdHRlbiBpbiB0aGUgYm9keSBvZiB0aGlz
IExpY2Vuc2UuCisjIC0KKyMgLSAgOS4gVGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiBtYXkg
cHVibGlzaCByZXZpc2VkIGFuZC9vciBuZXcgdmVyc2lvbnMKKyMgLW9mIHRoZSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGZyb20gdGltZSB0byB0aW1lLiAgU3VjaCBuZXcgdmVyc2lvbnMgd2lsbAor
IyAtYmUgc2ltaWxhciBpbiBzcGlyaXQgdG8gdGhlIHByZXNlbnQgdmVyc2lvbiwgYnV0IG1heSBk
aWZmZXIgaW4gZGV0YWlsIHRvCisjIC1hZGRyZXNzIG5ldyBwcm9ibGVtcyBvciBjb25jZXJucy4K
KyMgLQorIyAtRWFjaCB2ZXJzaW9uIGlzIGdpdmVuIGEgZGlzdGluZ3Vpc2hpbmcgdmVyc2lvbiBu
dW1iZXIuICBJZiB0aGUgUHJvZ3JhbQorIyAtc3BlY2lmaWVzIGEgdmVyc2lvbiBudW1iZXIgb2Yg
dGhpcyBMaWNlbnNlIHdoaWNoIGFwcGxpZXMgdG8gaXQgYW5kICJhbnkKKyMgLWxhdGVyIHZlcnNp
b24iLCB5b3UgaGF2ZSB0aGUgb3B0aW9uIG9mIGZvbGxvd2luZyB0aGUgdGVybXMgYW5kIGNvbmRp
dGlvbnMKKyMgLWVpdGhlciBvZiB0aGF0IHZlcnNpb24gb3Igb2YgYW55IGxhdGVyIHZlcnNpb24g
cHVibGlzaGVkIGJ5IHRoZSBGcmVlCisjIC1Tb2Z0d2FyZSBGb3VuZGF0aW9uLiAgSWYgdGhlIFBy
b2dyYW0gZG9lcyBub3Qgc3BlY2lmeSBhIHZlcnNpb24gbnVtYmVyIG9mCisjIC10aGlzIExpY2Vu
c2UsIHlvdSBtYXkgY2hvb3NlIGFueSB2ZXJzaW9uIGV2ZXIgcHVibGlzaGVkIGJ5IHRoZSBGcmVl
IFNvZnR3YXJlCisjIC1Gb3VuZGF0aW9uLgorIyAtCisjIC0gIDEwLiBJZiB5b3Ugd2lzaCB0byBp
bmNvcnBvcmF0ZSBwYXJ0cyBvZiB0aGUgUHJvZ3JhbSBpbnRvIG90aGVyIGZyZWUKKyMgLXByb2dy
YW1zIHdob3NlIGRpc3RyaWJ1dGlvbiBjb25kaXRpb25zIGFyZSBkaWZmZXJlbnQsIHdyaXRlIHRv
IHRoZSBhdXRob3IKKyMgLXRvIGFzayBmb3IgcGVybWlzc2lvbi4gIEZvciBzb2Z0d2FyZSB3aGlj
aCBpcyBjb3B5cmlnaHRlZCBieSB0aGUgRnJlZQorIyAtU29mdHdhcmUgRm91bmRhdGlvbiwgd3Jp
dGUgdG8gdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgd2Ugc29tZXRpbWVzCisjIC1tYWtl
IGV4Y2VwdGlvbnMgZm9yIHRoaXMuICBPdXIgZGVjaXNpb24gd2lsbCBiZSBndWlkZWQgYnkgdGhl
IHR3byBnb2FscworIyAtb2YgcHJlc2VydmluZyB0aGUgZnJlZSBzdGF0dXMgb2YgYWxsIGRlcml2
YXRpdmVzIG9mIG91ciBmcmVlIHNvZnR3YXJlIGFuZAorIyAtb2YgcHJvbW90aW5nIHRoZSBzaGFy
aW5nIGFuZCByZXVzZSBvZiBzb2Z0d2FyZSBnZW5lcmFsbHkuCisjIC0KKyMgLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBOTyBXQVJSQU5UWQorIyAtCisjIC0gIDExLiBCRUNBVVNFIFRIRSBQ
Uk9HUkFNIElTIExJQ0VOU0VEIEZSRUUgT0YgQ0hBUkdFLCBUSEVSRSBJUyBOTyBXQVJSQU5UWQor
IyAtRk9SIFRIRSBQUk9HUkFNLCBUTyBUSEUgRVhURU5UIFBFUk1JVFRFRCBCWSBBUFBMSUNBQkxF
IExBVy4gIEVYQ0VQVCBXSEVOCisjIC1PVEhFUldJU0UgU1RBVEVEIElOIFdSSVRJTkcgVEhFIENP
UFlSSUdIVCBIT0xERVJTIEFORC9PUiBPVEhFUiBQQVJUSUVTCisjIC1QUk9WSURFIFRIRSBQUk9H
UkFNICJBUyBJUyIgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRUlUSEVSIEVYUFJFU1NF
RAorIyAtT1IgSU1QTElFRCwgSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFRIRSBJTVBM
SUVEIFdBUlJBTlRJRVMgT0YKKyMgLU1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UuICBUSEUgRU5USVJFIFJJU0sgQVMKKyMgLVRPIFRIRSBRVUFMSVRZ
IEFORCBQRVJGT1JNQU5DRSBPRiBUSEUgUFJPR1JBTSBJUyBXSVRIIFlPVS4gIFNIT1VMRCBUSEUK
KyMgLVBST0dSQU0gUFJPVkUgREVGRUNUSVZFLCBZT1UgQVNTVU1FIFRIRSBDT1NUIE9GIEFMTCBO
RUNFU1NBUlkgU0VSVklDSU5HLAorIyAtUkVQQUlSIE9SIENPUlJFQ1RJT04uCisjIC0KKyMgLSAg
MTIuIElOIE5PIEVWRU5UIFVOTEVTUyBSRVFVSVJFRCBCWSBBUFBMSUNBQkxFIExBVyBPUiBBR1JF
RUQgVE8gSU4gV1JJVElORworIyAtV0lMTCBBTlkgQ09QWVJJR0hUIEhPTERFUiwgT1IgQU5ZIE9U
SEVSIFBBUlRZIFdITyBNQVkgTU9ESUZZIEFORC9PUgorIyAtUkVESVNUUklCVVRFIFRIRSBQUk9H
UkFNIEFTIFBFUk1JVFRFRCBBQk9WRSwgQkUgTElBQkxFIFRPIFlPVSBGT1IgREFNQUdFUywKKyMg
LUlOQ0xVRElORyBBTlkgR0VORVJBTCwgU1BFQ0lBTCwgSU5DSURFTlRBTCBPUiBDT05TRVFVRU5U
SUFMIERBTUFHRVMgQVJJU0lORworIyAtT1VUIE9GIFRIRSBVU0UgT1IgSU5BQklMSVRZIFRPIFVT
RSBUSEUgUFJPR1JBTSAoSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRAorIyAtVE8gTE9TUyBPRiBE
QVRBIE9SIERBVEEgQkVJTkcgUkVOREVSRUQgSU5BQ0NVUkFURSBPUiBMT1NTRVMgU1VTVEFJTkVE
IEJZCisjIC1ZT1UgT1IgVEhJUkQgUEFSVElFUyBPUiBBIEZBSUxVUkUgT0YgVEhFIFBST0dSQU0g
VE8gT1BFUkFURSBXSVRIIEFOWSBPVEhFUgorIyAtUFJPR1JBTVMpLCBFVkVOIElGIFNVQ0ggSE9M
REVSIE9SIE9USEVSIFBBUlRZIEhBUyBCRUVOIEFEVklTRUQgT0YgVEhFCisjIC1QT1NTSUJJTElU
WSBPRiBTVUNIIERBTUFHRVMuCisjIC0KKyMgLSAgICAgICAgICAgICAgICAgICAgIEVORCBPRiBU
RVJNUyBBTkQgQ09ORElUSU9OUworIyAtCisjIC0gICAgICAgICAgICBIb3cgdG8gQXBwbHkgVGhl
c2UgVGVybXMgdG8gWW91ciBOZXcgUHJvZ3JhbXMKKyMgLQorIyAtICBJZiB5b3UgZGV2ZWxvcCBh
IG5ldyBwcm9ncmFtLCBhbmQgeW91IHdhbnQgaXQgdG8gYmUgb2YgdGhlIGdyZWF0ZXN0CisjIC1w
b3NzaWJsZSB1c2UgdG8gdGhlIHB1YmxpYywgdGhlIGJlc3Qgd2F5IHRvIGFjaGlldmUgdGhpcyBp
cyB0byBtYWtlIGl0CisjIC1mcmVlIHNvZnR3YXJlIHdoaWNoIGV2ZXJ5b25lIGNhbiByZWRpc3Ry
aWJ1dGUgYW5kIGNoYW5nZSB1bmRlciB0aGVzZSB0ZXJtcy4KKyMgLQorIyAtICBUbyBkbyBzbywg
YXR0YWNoIHRoZSBmb2xsb3dpbmcgbm90aWNlcyB0byB0aGUgcHJvZ3JhbS4gIEl0IGlzIHNhZmVz
dAorIyAtdG8gYXR0YWNoIHRoZW0gdG8gdGhlIHN0YXJ0IG9mIGVhY2ggc291cmNlIGZpbGUgdG8g
bW9zdCBlZmZlY3RpdmVseQorIyAtY29udmV5IHRoZSBleGNsdXNpb24gb2Ygd2FycmFudHk7IGFu
ZCBlYWNoIGZpbGUgc2hvdWxkIGhhdmUgYXQgbGVhc3QKKyMgLXRoZSAiY29weXJpZ2h0IiBsaW5l
IGFuZCBhIHBvaW50ZXIgdG8gd2hlcmUgdGhlIGZ1bGwgbm90aWNlIGlzIGZvdW5kLgorIyAtCisj
IC0gICAgPG9uZSBsaW5lIHRvIGdpdmUgdGhlIHByb2dyYW0ncyBuYW1lIGFuZCBhIGJyaWVmIGlk
ZWEgb2Ygd2hhdCBpdCBkb2VzLj4KKyMgLSAgICBDb3B5cmlnaHQgKEMpIDx5ZWFyPiAgPG5hbWUg
b2YgYXV0aG9yPgorIyAtCisjIC0gICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyMgLSAgICBpdCB1bmRlciB0aGUg
dGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQor
IyAtICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2Yg
dGhlIExpY2Vuc2UsIG9yCisjIC0gICAgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lv
bi4KKyMgLQorIyAtICAgIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0
aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorIyAtICAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsg
d2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisjIC0gICAgTUVSQ0hBTlRBQklM
SVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorIyAtICAg
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisjIC0KKyMgLSAg
ICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBhbG9uZworIyAtICAgIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRl
IHRvIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4sCisjIC0gICAgNTEgRnJhbmts
aW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQS4KKyMgLQor
IyAtQWxzbyBhZGQgaW5mb3JtYXRpb24gb24gaG93IHRvIGNvbnRhY3QgeW91IGJ5IGVsZWN0cm9u
aWMgYW5kIHBhcGVyIG1haWwuCisjIC0KKyMgLUlmIHRoZSBwcm9ncmFtIGlzIGludGVyYWN0aXZl
LCBtYWtlIGl0IG91dHB1dCBhIHNob3J0IG5vdGljZSBsaWtlIHRoaXMKKyMgLXdoZW4gaXQgc3Rh
cnRzIGluIGFuIGludGVyYWN0aXZlIG1vZGU6CisjIC0KKyMgLSAgICBHbm9tb3Zpc2lvbiB2ZXJz
aW9uIDY5LCBDb3B5cmlnaHQgKEMpIHllYXIgbmFtZSBvZiBhdXRob3IKKyMgLSAgICBHbm9tb3Zp
c2lvbiBjb21lcyB3aXRoIEFCU09MVVRFTFkgTk8gV0FSUkFOVFk7IGZvciBkZXRhaWxzIHR5cGUg
YHNob3cgdycuCisjIC0gICAgVGhpcyBpcyBmcmVlIHNvZnR3YXJlLCBhbmQgeW91IGFyZSB3ZWxj
b21lIHRvIHJlZGlzdHJpYnV0ZSBpdAorIyAtICAgIHVuZGVyIGNlcnRhaW4gY29uZGl0aW9uczsg
dHlwZSBgc2hvdyBjJyBmb3IgZGV0YWlscy4KKyMgLQorIyAtVGhlIGh5cG90aGV0aWNhbCBjb21t
YW5kcyBgc2hvdyB3JyBhbmQgYHNob3cgYycgc2hvdWxkIHNob3cgdGhlIGFwcHJvcHJpYXRlCisj
IC1wYXJ0cyBvZiB0aGUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZS4gIE9mIGNvdXJzZSwgdGhlIGNv
bW1hbmRzIHlvdSB1c2UgbWF5CisjIC1iZSBjYWxsZWQgc29tZXRoaW5nIG90aGVyIHRoYW4gYHNo
b3cgdycgYW5kIGBzaG93IGMnOyB0aGV5IGNvdWxkIGV2ZW4gYmUKKyMgLW1vdXNlLWNsaWNrcyBv
ciBtZW51IGl0ZW1zLS13aGF0ZXZlciBzdWl0cyB5b3VyIHByb2dyYW0uCisjIC0KKyMgLVlvdSBz
aG91bGQgYWxzbyBnZXQgeW91ciBlbXBsb3llciAoaWYgeW91IHdvcmsgYXMgYSBwcm9ncmFtbWVy
KSBvciB5b3VyCisjIC1zY2hvb2wsIGlmIGFueSwgdG8gc2lnbiBhICJjb3B5cmlnaHQgZGlzY2xh
aW1lciIgZm9yIHRoZSBwcm9ncmFtLCBpZgorIyAtbmVjZXNzYXJ5LiAgSGVyZSBpcyBhIHNhbXBs
ZTsgYWx0ZXIgdGhlIG5hbWVzOgorIyAtCisjIC0gIFlveW9keW5lLCBJbmMuLCBoZXJlYnkgZGlz
Y2xhaW1zIGFsbCBjb3B5cmlnaHQgaW50ZXJlc3QgaW4gdGhlIHByb2dyYW0KKyMgLSAgYEdub21v
dmlzaW9uJyAod2hpY2ggbWFrZXMgcGFzc2VzIGF0IGNvbXBpbGVycykgd3JpdHRlbiBieSBKYW1l
cyBIYWNrZXIuCisjIC0KKyMgLSAgPHNpZ25hdHVyZSBvZiBUeSBDb29uPiwgMSBBcHJpbCAxOTg5
CisjIC0gIFR5IENvb24sIFByZXNpZGVudCBvZiBWaWNlCisjIC0KKyMgLVRoaXMgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSBkb2VzIG5vdCBwZXJtaXQgaW5jb3Jwb3JhdGluZyB5b3VyIHByb2dyYW0g
aW50bworIyAtcHJvcHJpZXRhcnkgcHJvZ3JhbXMuICBJZiB5b3VyIHByb2dyYW0gaXMgYSBzdWJy
b3V0aW5lIGxpYnJhcnksIHlvdSBtYXkKKyMgLWNvbnNpZGVyIGl0IG1vcmUgdXNlZnVsIHRvIHBl
cm1pdCBsaW5raW5nIHByb3ByaWV0YXJ5IGFwcGxpY2F0aW9ucyB3aXRoIHRoZQorIyAtbGlicmFy
eS4gIElmIHRoaXMgaXMgd2hhdCB5b3Ugd2FudCB0byBkbywgdXNlIHRoZSBHTlUgTGVzc2VyIEdl
bmVyYWwKKyMgLVB1YmxpYyBMaWNlbnNlIGluc3RlYWQgb2YgdGhpcyBMaWNlbnNlLgorIyArMTIu
IElOIE5PIEVWRU5UIFVOTEVTUyBSRVFVSVJFRCBCWSBBUFBMSUNBQkxFIExBVyBPUiBBR1JFRUQg
VE8gSU4gV1JJVElORyBXSUxMIEFOWSBDT1BZUklHSFQgSE9MREVSLCBPUiBBTlkgT1RIRVIgUEFS
VFkgV0hPIE1BWSBNT0RJRlkgQU5EL09SIFJFRElTVFJJQlVURSBUSEUgUFJPR1JBTSBBUyBQRVJN
SVRURUQgQUJPVkUsIEJFIExJQUJMRSBUTyBZT1UgRk9SIERBTUFHRVMsIElOQ0xVRElORyBBTlkg
R0VORVJBTCwgU1BFQ0lBTCwgSU5DSURFTlRBTCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMgQVJJ
U0lORyBPVVQgT0YgVEhFIFVTRSBPUiBJTkFCSUxJVFkgVE8gVVNFIFRIRSBQUk9HUkFNIChJTkNM
VURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIExPU1MgT0YgREFUQSBPUiBEQVRBIEJFSU5HIFJFTkRF
UkVEIElOQUNDVVJBVEUgT1IgTE9TU0VTIFNVU1RBSU5FRCBCWSBZT1UgT1IgVEhJUkQgUEFSVElF
UyBPUiBBIEZBSUxVUkUgT0YgVEhFIFBST0dSQU0gVE8gT1BFUkFURSBXSVRIIEFOWSBPVEhFUiBQ
Uk9HUkFNUyksIEVWRU4gSUYgU1VDSCBIT0xERVIgT1IgT1RIRVIgUEFSVFkgSEFTIEJFRU4gQURW
SVNFRCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0VTLgorIyAtLS0gTElDRU5TRQor
IyArKysgTElDRU5TRQorIyBAQCAtMSw2ICsxLDYgQEAKKyMgIFRoaXMgcmVwb3NpdG9yeSB1c2Vz
IDIgZGlmZmVyZW50IGxpY2Vuc2VzIDoKKyMgIC0gYWxsIGZpbGVzIGluIHRoZSBgbGliYCBkaXJl
Y3RvcnkgdXNlIGEgQlNEIDItQ2xhdXNlIGxpY2Vuc2UKKyMgLS0gYWxsIG90aGVyIGZpbGVzIHVz
ZSBhIEdQTHYyIGxpY2Vuc2UsIHVubGVzcyBleHBsaWNpdGx5IHN0YXRlZCBvdGhlcndpc2UKKyMg
Ky0gYWxsIG90aGVyIGZpbGVzIHVzZSBhIEdQTC0yLjAtb3ItbGF0ZXIgbGljZW5zZSwgdW5sZXNz
IGV4cGxpY2l0bHkgc3RhdGVkIG90aGVyd2lzZQorIyAgCisjICBSZWxldmFudCBsaWNlbnNlIGlz
IHJlbWluZGVkIGF0IHRoZSB0b3Agb2YgZWFjaCBzb3VyY2UgZmlsZSwKKyMgIGFuZCB3aXRoIHBy
ZXNlbmNlIG9mIENPUFlJTkcgb3IgTElDRU5TRSBmaWxlIGluIGFzc29jaWF0ZWQgZGlyZWN0b3Jp
ZXMuCisjIAorIworCitTVU1NQVJZID0gIkV4dHJlbWVseSBGYXN0IENvbXByZXNzaW9uIGFsZ29y
aXRobSIKK0RFU0NSSVBUSU9OID0gIkxaNCBpcyBhIHZlcnkgZmFzdCBsb3NzbGVzcyBjb21wcmVz
c2lvbiBhbGdvcml0aG0sIHByb3ZpZGluZyBjb21wcmVzc2lvbiBzcGVlZCBhdCA0MDAgTUIvcyBw
ZXIgY29yZSwgc2NhbGFibGUgd2l0aCBtdWx0aS1jb3JlcyBDUFUuIEl0IGFsc28gZmVhdHVyZXMg
YW4gZXh0cmVtZWx5IGZhc3QgZGVjb2Rlciwgd2l0aCBzcGVlZCBpbiBtdWx0aXBsZSBHQi9zIHBl
ciBjb3JlLCB0eXBpY2FsbHkgcmVhY2hpbmcgUkFNIHNwZWVkIGxpbWl0cyBvbiBtdWx0aS1jb3Jl
IHN5c3RlbXMuIgorSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2x6NC9sejQiCisKK0xJ
Q0VOU0UgPSAiQlNELTItQ2xhdXNlIHwgR1BMLTIuMC1vbmx5IgorTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vbGliL0xJQ0VOU0U7bWQ1PTVjZDVmODUxYjUyZWM4MzJiMTBlZWRiM2YwMWY4ODVh
IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3Byb2dyYW1zL0NPUFlJTkc7bWQ1PTQ5MmRh
ZjQ0N2Q2ZGIwZTVlYjM0NGE3OTIyZTdlYzI1IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTov
L0xJQ0VOU0U7bWQ1PWMxMTFjNDdlMzAxYzJmZmU4Nzc2NzI5YjQwYjQ0NDc3IFwKKyAgICAgICAg
ICAgICAgICAgICAgIgorCitQRSA9ICIxIgorCitTUkNSRVYgPSAiZWJiMzcwY2E4M2FmMTkzMjEy
ZGY0ZGNiYWRjYzVkODdiYzBkZTJmMCIKKworU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2x6
NC9sejQuZ2l0O2JyYW5jaD1yZWxlYXNlO3Byb3RvY29sPWh0dHBzIFwKKwkgICBmaWxlOi8vcnVu
LXB0ZXN0IFwKKwkgICAiCitVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+
LiopIgorCitTID0gIiR7V09SS0RJUn0vZ2l0IgorCitpbmhlcml0IHB0ZXN0CisKK0NWRV9TVEFU
VVNbQ1ZFLTIwMTQtNDcxNV0gPSAiZml4ZWQtdmVyc2lvbjogRml4ZWQgaW4gcjExOCwgd2hpY2gg
aXMgbGFyZ2VyIHRoYW4gdGhlIGN1cnJlbnQgdmVyc2lvbi4iCisKK0VYVFJBX09FTUFLRSA9ICJQ
UkVGSVg9JHtwcmVmaXh9IENDPScke0NDfScgQ0ZMQUdTPScke0NGTEFHU30nIERFU1RESVI9JHtE
fSBMSUJESVI9JHtsaWJkaXJ9IElOQ0xVREVESVI9JHtpbmNsdWRlZGlyfSBCVUlMRF9TVEFUSUM9
bm8iCisKK2RvX2luc3RhbGwoKSB7CisJb2VfcnVubWFrZSBpbnN0YWxsCit9CisKK0JCQ0xBU1NF
WFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKKworUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0gImJh
c2giCisKK2RvX2NvbXBpbGVfcHRlc3QoKSB7CisgICAgICAgIG9lX3J1bm1ha2UgLUMgJHtCfS90
ZXN0cy8KK30KKworZG9faW5zdGFsbF9wdGVzdCgpIHsKKwlpbnN0YWxsIC1kICR7RH0ke1BURVNU
X1BBVEh9L3Rlc3RzLworCWluc3RhbGwgLS1tb2RlPTc1NSAke0J9L3Rlc3RzL2ZyYW1ldGVzdCAk
e0R9JHtQVEVTVF9QQVRIfS90ZXN0cy8KKwlzZWQgLWkgInMjQFBURVNUX1BBVEhAIyR7UFRFU1Rf
UEFUSH0jZyIgJHtEfSR7UFRFU1RfUEFUSH0vcnVuLXB0ZXN0CisKK30KKwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2x6NF8xLjkuNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2x6NC9sejRfMS45LjQuYmIKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDUxYTg1
NGQ0NGEuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2x6NF8xLjku
NC5iYgorKysgL2Rldi9udWxsCkBAIC0xLDQ2ICswLDAgQEAKLVNVTU1BUlkgPSAiRXh0cmVtZWx5
IEZhc3QgQ29tcHJlc3Npb24gYWxnb3JpdGhtIgotREVTQ1JJUFRJT04gPSAiTFo0IGlzIGEgdmVy
eSBmYXN0IGxvc3NsZXNzIGNvbXByZXNzaW9uIGFsZ29yaXRobSwgcHJvdmlkaW5nIGNvbXByZXNz
aW9uIHNwZWVkIGF0IDQwMCBNQi9zIHBlciBjb3JlLCBzY2FsYWJsZSB3aXRoIG11bHRpLWNvcmVz
IENQVS4gSXQgYWxzbyBmZWF0dXJlcyBhbiBleHRyZW1lbHkgZmFzdCBkZWNvZGVyLCB3aXRoIHNw
ZWVkIGluIG11bHRpcGxlIEdCL3MgcGVyIGNvcmUsIHR5cGljYWxseSByZWFjaGluZyBSQU0gc3Bl
ZWQgbGltaXRzIG9uIG11bHRpLWNvcmUgc3lzdGVtcy4iCi1IT01FUEFHRSA9ICJodHRwczovL2dp
dGh1Yi5jb20vbHo0L2x6NCIKLQotTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UgfCBHUEwtMi4wLW9u
bHkiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9saWIvTElDRU5TRTttZDU9NWNkNWY4NTFi
NTJlYzgzMmIxMGVlZGIzZjAxZjg4NWEgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vcHJv
Z3JhbXMvQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXAotICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRTttZDU9YzVjYzNjZDZmOTI3NGI0ZDMyOTg4
MDk2ZGY5YzNlYzMgXAotICAgICAgICAgICAgICAgICAgICAiCi0KLVBFID0gIjEiCi0KLVNSQ1JF
ViA9ICI1ZmY4Mzk2ODAxMzQ0MzdkYmY0Njc4ZjNkMGM3YjM3MWQ4NGY0OTY0IgotCi1TUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vbHo0L2x6NC5naXQ7YnJhbmNoPXJlbGVhc2U7cHJvdG9jb2w9
aHR0cHMgXAotCSAgIGZpbGU6Ly9ydW4tcHRlc3QgXAotCSAgICIKLVVQU1RSRUFNX0NIRUNLX0dJ
VFRBR1JFR0VYID0gInYoP1A8cHZlcj4uKikiCi0KLVMgPSAiJHtXT1JLRElSfS9naXQiCi0KLWlu
aGVyaXQgcHRlc3QKLQotQ1ZFX1NUQVRVU1tDVkUtMjAxNC00NzE1XSA9ICJmaXhlZC12ZXJzaW9u
OiBGaXhlZCBpbiByMTE4LCB3aGljaCBpcyBsYXJnZXIgdGhhbiB0aGUgY3VycmVudCB2ZXJzaW9u
LiIKLQotRVhUUkFfT0VNQUtFID0gIlBSRUZJWD0ke3ByZWZpeH0gQ0M9JyR7Q0N9JyBDRkxBR1M9
JyR7Q0ZMQUdTfScgREVTVERJUj0ke0R9IExJQkRJUj0ke2xpYmRpcn0gSU5DTFVERURJUj0ke2lu
Y2x1ZGVkaXJ9IEJVSUxEX1NUQVRJQz1ubyIKLQotZG9faW5zdGFsbCgpIHsKLQlvZV9ydW5tYWtl
IGluc3RhbGwKLX0KLQotQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotCi1SREVQ
RU5EUzoke1BOfS1wdGVzdCArPSAiYmFzaCIKLQotZG9fY29tcGlsZV9wdGVzdCgpIHsKLSAgICAg
ICAgb2VfcnVubWFrZSAtQyAke0J9L3Rlc3RzLwotfQotCi1kb19pbnN0YWxsX3B0ZXN0KCkgewot
CWluc3RhbGwgLWQgJHtEfSR7UFRFU1RfUEFUSH0vdGVzdHMvCi0JaW5zdGFsbCAtLW1vZGU9NzU1
ICR7Qn0vdGVzdHMvZnJhbWV0ZXN0ICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzLwotCXNlZCAtaSAi
cyNAUFRFU1RfUEFUSEAjJHtQVEVTVF9QQVRIfSNnIiAke0R9JHtQVEVTVF9QQVRIfS9ydW4tcHRl
c3QKLQotfQotCi0tIAoyLjQ0LjAKCg==

--===============4998433343251184375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-69498dbf1f70fbd607c408d9feaf93fed9da353a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:69498dbf1f70fbd607c408d9feaf93fed9da353a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 202 Local 191 Mirrors 0 Missed 11 Current 282 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 354 of 484 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 484 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 364 of 484 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 365 of 484 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 484 of 484 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
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
NOTE: Running task 1369 of 1385 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_configure)
NOTE: recipe lz4-1_1.10.0-r0: task do_collect_spdx_deps: Succeeded
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
| lz4cli.c:53:10: fatal error: lz4hc.h: No such file or directory
|    53 | #include "lz4hc.h"    /* LZ4HC_CLEVEL_MAX */
|       |          ^~~~~~~~~
| compilation terminated.
| lz4io.c:59:10: fatal error: lz4.h: No such file or directory
|    59 | #include "lz4.h"       /* required for legacy format */
|       |          ^~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: bench.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: *** [<builtin>: lz4cli.o] Error 1
| make[1]: *** [<builtin>: lz4io.o] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/git/programs'
| make: *** [Makefile:63: lz4-release] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.4121213:179 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.4121213, line 179
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.4121213, line 164
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.4121213, line 169
| 	#4: base_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.4121213, line 147
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.4121213, line 141
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.4121213, line 189
NOTE: recipe lz4-1_1.10.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1372 tasks of which 1364 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815183714.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815183714.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: lz4-1_1.10.0-r0 do_compile: oe_runmake failed
ERROR: lz4-1_1.10.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/run.do_compile.4121213', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lz4/1.10.0/temp/log.do_compile.4121213
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_compile) failed with exit code '1'

--===============4998433343251184375==--

