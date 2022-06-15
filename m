Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF9ACCA49B
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4447.1655298221819388125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=B97xoLr1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 0101018167765f67-dc14f561-a75e-48dd-a5f7-f54a4fba66d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ebEyGL/GwgIpSIgM6O9I2B3mZxJlk9PR4aI+nesBdxM=;
	b=B97xoLr19hBAnz6VInDpjzBrrCE9y30G2Oh68SAtEG9q8bIrCBkmwV34g3ZEoH9b
	Sg+lyyY4pS8vf7TKiAgHboaNCI7k81ZhdEQFmVj1cKfJAYYDlBqnUrrG2Q0m49Mxwme
	gnLovxk1oTWzpEabHbOAyB5usVBgMxdCnLYobqwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ebEyGL/GwgIpSIgM6O9I2B3mZxJlk9PR4aI+nesBdxM=;
	b=ik0iVldbG7WkIbf54InumDcC2x8z/iNuLxQ43Rn98I2tgGPWM5NUHqPIEjQjM388
	OR4+qAW03l/ENnQ/M2TGJOk8pP4t/pc1FkGj9IoLilhJzsXTf8lbZeO5yrMTaAPhIAF
	KfV38uBp3NSfElAouQCk/rmffGwq6VzuMcYTO8Y0=
Content-Type: multipart/mixed; boundary="===============6974029483388915760=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Weinberger <richard@nod.at>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 1.5 SUCCEEDED
Message-ID: 
 <0101018167765f67-dc14f561-a75e-48dd-a5f7-f54a4fba66d4-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:39 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166952

--===============6974029483388915760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *erofs-utils* to *1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.4-1.5.patch
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
--===============6974029483388915760==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.4-1.5.patch"

From a7018bb7566308fba3eafa425d4b774a69f7ed1e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 07:10:55 +0000
Subject: [PATCH] erofs-utils: upgrade 1.4 -> 1.5

---
 ...0001-fsck-main.c-add-missing-include.patch |  26 --
 .../erofs-utils/erofs-utils_1.4.bb            |  27 --
 .../erofs-utils/erofs-utils_1.5.bb            | 409 ++++++++++++++++++
 3 files changed, 409 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch
 delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch
deleted file mode 100644
index c3b3c0bd56..0000000000
--- a/meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 821778286843b8e88d0cd73a97d20b5a2fff8ea1 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 6 Dec 2021 20:12:54 +0100
-Subject: [PATCH] fsck/main.c: add missing include
-
-Otherwise musl C library builds fail with missing S_IFMT/S_IFDIR
-definitions.
-
-Upstream-Status: Submitted [email to linux-erofs@lists.ozlabs.org,hsiangkao@linux.alibaba.com]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- fsck/main.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/fsck/main.c b/fsck/main.c
-index aefa881..ad48e35 100644
---- a/fsck/main.c
-+++ b/fsck/main.c
-@@ -6,6 +6,7 @@
- #include <stdlib.h>
- #include <getopt.h>
- #include <time.h>
-+#include <sys/stat.h>
- #include "erofs/print.h"
- #include "erofs/io.h"
- #include "erofs/decompress.h"
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
deleted file mode 100644
index e5e19e75b4..0000000000
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Tools for erofs filesystems"
-LICENSE = "GPL-2.0-or-later"
-SECTION = "base"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94fa01670a2a8f2d3ab2de15004e0848"
-HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
-
-SRCREV = "ee97fe5fb77c737df0f77d92ab0d92edd3a11be6"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master \
-           file://0001-fsck-main.c-add-missing-include.patch \
-           "
-
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "util-linux-libuuid"
-
-inherit pkgconfig autotools
-
-PACKAGECONFIG ??= "lz4"
-PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
-
-EXTRA_OECONF = "${PACKAGECONFIG_CONFARGS} --disable-fuse"
-
-CFLAGS:append:powerpc64le = " -D__SANE_USERSPACE_TYPES__"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
new file mode 100644
index 0000000000..7a5c8c7131
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
@@ -0,0 +1,409 @@
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
+# @@ -1,359 +1,15 @@
+# -Valid-License-Identifier: GPL-2.0
+# -Valid-License-Identifier: GPL-2.0-only
+# -Valid-License-Identifier: GPL-2.0+
+# -Valid-License-Identifier: GPL-2.0-or-later
+# -SPDX-URL: https://spdx.org/licenses/GPL-2.0.html
+# -Usage-Guide:
+# -  To use this license in source code, put one of the following SPDX
+# -  tag/value pairs into a comment according to the placement
+# -  guidelines in the licensing rules documentation.
+# -  For 'GNU General Public License (GPL) version 2 only' use:
+# -    SPDX-License-Identifier: GPL-2.0
+# -  or
+# -    SPDX-License-Identifier: GPL-2.0-only
+# -  For 'GNU General Public License (GPL) version 2 or any later version' use:
+# -    SPDX-License-Identifier: GPL-2.0+
+# -  or
+# -    SPDX-License-Identifier: GPL-2.0-or-later
+# -License-Text:
+# +erofs-utils uses two different license patterns:
+#  
+# -		    GNU GENERAL PUBLIC LICENSE
+# -		       Version 2, June 1991
+# + - most liberofs files in `lib` and `include` directories
+# +   use GPL-2.0+ OR Apache-2.0 dual license;
+#  
+# - Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+# -                       51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+# - Everyone is permitted to copy and distribute verbatim copies
+# - of this license document, but changing it is not allowed.
+# + - all other files use GPL-2.0+ license, unless
+# +   explicitly stated otherwise.
+#  
+# -			    Preamble
+# +Relevant licenses can be found in the LICENSES directory.
+#  
+# -  The licenses for most software are designed to take away your
+# -freedom to share and change it.  By contrast, the GNU General Public
+# -License is intended to guarantee your freedom to share and change free
+# -software--to make sure the software is free for all its users.  This
+# -General Public License applies to most of the Free Software
+# -Foundation's software and to any other program whose authors commit to
+# -using it.  (Some other Free Software Foundation software is covered by
+# -the GNU Library General Public License instead.)  You can apply it to
+# -your programs, too.
+# -
+# -  When we speak of free software, we are referring to freedom, not
+# -price.  Our General Public Licenses are designed to make sure that you
+# -have the freedom to distribute copies of free software (and charge for
+# -this service if you wish), that you receive source code or can get it
+# -if you want it, that you can change the software or use pieces of it
+# -in new free programs; and that you know you can do these things.
+# -
+# -  To protect your rights, we need to make restrictions that forbid
+# -anyone to deny you these rights or to ask you to surrender the rights.
+# -These restrictions translate to certain responsibilities for you if you
+# -distribute copies of the software, or if you modify it.
+# -
+# -  For example, if you distribute copies of such a program, whether
+# -gratis or for a fee, you must give the recipients all the rights that
+# -you have.  You must make sure that they, too, receive or can get the
+# -source code.  And you must show them these terms so they know their
+# -rights.
+# -
+# -  We protect your rights with two steps: (1) copyright the software, and
+# -(2) offer you this license which gives you legal permission to copy,
+# -distribute and/or modify the software.
+# -
+# -  Also, for each author's protection and ours, we want to make certain
+# -that everyone understands that there is no warranty for this free
+# -software.  If the software is modified by someone else and passed on, we
+# -want its recipients to know that what they have is not the original, so
+# -that any problems introduced by others will not reflect on the original
+# -authors' reputations.
+# -
+# -  Finally, any free program is threatened constantly by software
+# -patents.  We wish to avoid the danger that redistributors of a free
+# -program will individually obtain patent licenses, in effect making the
+# -program proprietary.  To prevent this, we have made it clear that any
+# -patent must be licensed for everyone's free use or not licensed at all.
+# -
+# -  The precise terms and conditions for copying, distribution and
+# -modification follow.
+# -
+# -		    GNU GENERAL PUBLIC LICENSE
+# -   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+# -
+# -  0. This License applies to any program or other work which contains
+# -a notice placed by the copyright holder saying it may be distributed
+# -under the terms of this General Public License.  The "Program", below,
+# -refers to any such program or work, and a "work based on the Program"
+# -means either the Program or any derivative work under copyright law:
+# -that is to say, a work containing the Program or a portion of it,
+# -either verbatim or with modifications and/or translated into another
+# -language.  (Hereinafter, translation is included without limitation in
+# -the term "modification".)  Each licensee is addressed as "you".
+# -
+# -Activities other than copying, distribution and modification are not
+# -covered by this License; they are outside its scope.  The act of
+# -running the Program is not restricted, and the output from the Program
+# -is covered only if its contents constitute a work based on the
+# -Program (independent of having been made by running the Program).
+# -Whether that is true depends on what the Program does.
+# -
+# -  1. You may copy and distribute verbatim copies of the Program's
+# -source code as you receive it, in any medium, provided that you
+# -conspicuously and appropriately publish on each copy an appropriate
+# -copyright notice and disclaimer of warranty; keep intact all the
+# -notices that refer to this License and to the absence of any warranty;
+# -and give any other recipients of the Program a copy of this License
+# -along with the Program.
+# -
+# -You may charge a fee for the physical act of transferring a copy, and
+# -you may at your option offer warranty protection in exchange for a fee.
+# -
+# -  2. You may modify your copy or copies of the Program or any portion
+# -of it, thus forming a work based on the Program, and copy and
+# -distribute such modifications or work under the terms of Section 1
+# -above, provided that you also meet all of these conditions:
+# -
+# -    a) You must cause the modified files to carry prominent notices
+# -    stating that you changed the files and the date of any change.
+# -
+# -    b) You must cause any work that you distribute or publish, that in
+# -    whole or in part contains or is derived from the Program or any
+# -    part thereof, to be licensed as a whole at no charge to all third
+# -    parties under the terms of this License.
+# -
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
+# -
+# -These requirements apply to the modified work as a whole.  If
+# -identifiable sections of that work are not derived from the Program,
+# -and can be reasonably considered independent and separate works in
+# -themselves, then this License, and its terms, do not apply to those
+# -sections when you distribute them as separate works.  But when you
+# -distribute the same sections as part of a whole which is a work based
+# -on the Program, the distribution of the whole must be on the terms of
+# -this License, whose permissions for other licensees extend to the
+# -entire whole, and thus to each and every part regardless of who wrote it.
+# -
+# -Thus, it is not the intent of this section to claim rights or contest
+# -your rights to work written entirely by you; rather, the intent is to
+# -exercise the right to control the distribution of derivative or
+# -collective works based on the Program.
+# -
+# -In addition, mere aggregation of another work not based on the Program
+# -with the Program (or with a work based on the Program) on a volume of
+# -a storage or distribution medium does not bring the other work under
+# -the scope of this License.
+# -
+# -  3. You may copy and distribute the Program (or a work based on it,
+# -under Section 2) in object code or executable form under the terms of
+# -Sections 1 and 2 above provided that you also do one of the following:
+# -
+# -    a) Accompany it with the complete corresponding machine-readable
+# -    source code, which must be distributed under the terms of Sections
+# -    1 and 2 above on a medium customarily used for software interchange; or,
+# -
+# -    b) Accompany it with a written offer, valid for at least three
+# -    years, to give any third party, for a charge no more than your
+# -    cost of physically performing source distribution, a complete
+# -    machine-readable copy of the corresponding source code, to be
+# -    distributed under the terms of Sections 1 and 2 above on a medium
+# -    customarily used for software interchange; or,
+# -
+# -    c) Accompany it with the information you received as to the offer
+# -    to distribute corresponding source code.  (This alternative is
+# -    allowed only for noncommercial distribution and only if you
+# -    received the program in object code or executable form with such
+# -    an offer, in accord with Subsection b above.)
+# -
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
+# -
+# -If distribution of executable or object code is made by offering
+# -access to copy from a designated place, then offering equivalent
+# -access to copy the source code from the same place counts as
+# -distribution of the source code, even though third parties are not
+# -compelled to copy the source along with the object code.
+# -
+# -  4. You may not copy, modify, sublicense, or distribute the Program
+# -except as expressly provided under this License.  Any attempt
+# -otherwise to copy, modify, sublicense or distribute the Program is
+# -void, and will automatically terminate your rights under this License.
+# -However, parties who have received copies, or rights, from you under
+# -this License will not have their licenses terminated so long as such
+# -parties remain in full compliance.
+# -
+# -  5. You are not required to accept this License, since you have not
+# -signed it.  However, nothing else grants you permission to modify or
+# -distribute the Program or its derivative works.  These actions are
+# -prohibited by law if you do not accept this License.  Therefore, by
+# -modifying or distributing the Program (or any work based on the
+# -Program), you indicate your acceptance of this License to do so, and
+# -all its terms and conditions for copying, distributing or modifying
+# -the Program or works based on it.
+# -
+# -  6. Each time you redistribute the Program (or any work based on the
+# -Program), the recipient automatically receives a license from the
+# -original licensor to copy, distribute or modify the Program subject to
+# -these terms and conditions.  You may not impose any further
+# -restrictions on the recipients' exercise of the rights granted herein.
+# -You are not responsible for enforcing compliance by third parties to
+# -this License.
+# -
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
+# -			    NO WARRANTY
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
+# -		     END OF TERMS AND CONDITIONS
+# -
+# -	    How to Apply These Terms to Your New Programs
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
+# -    You should have received a copy of the GNU General Public License
+# -    along with this program; if not, write to the Free Software
+# -    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+# -
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
+# -library.  If this is what you want to do, use the GNU Library General
+# -Public License instead of this License.
+# +This model is selected to emphasize that
+# +files in `lib` and `include` directory are designed to be included into
+# +3rd-party applications, while all other files, are intended to be used
+# +"as is", as part of their intended scenarios, with no intention to
+# +support 3rd-party integration use cases.
+# 
+#
+
+SUMMARY = "Tools for erofs filesystems"
+LICENSE = "GPL-2.0-or-later"
+SECTION = "base"
+LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
+HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
+
+SRCREV = "a2821a66b42aee5430bccee82c280e38d1e9ab29"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master"
+
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "util-linux-libuuid"
+
+inherit pkgconfig autotools
+
+PACKAGECONFIG ??= "lz4"
+PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
+
+EXTRA_OECONF = "${PACKAGECONFIG_CONFARGS} --disable-fuse"
+
+CFLAGS:append:powerpc64le = " -D__SANE_USERSPACE_TYPES__"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1


--===============6974029483388915760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 642840 to 654680 (+2%)
packages/core2-32-poky-linux/erofs-utils/erofs-utils-dbg: PKGV changed from 1.4 [default] to 1.5 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-dbg: PV changed from "1.4" to "1.5"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-dev: PKGV changed from 1.4 [default] to 1.5 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-dev: PV changed from "1.4" to "1.5"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 5744 to 7642 (+33%)
packages/core2-32-poky-linux/erofs-utils/erofs-utils-doc: PKGV changed from 1.4 [default] to 1.5 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-doc: FILELIST: added "/usr/share/man/man1/fsck.erofs.1"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-doc: PV changed from "1.4" to "1.5"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-locale: PKGV changed from 1.4 [default] to 1.5 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-locale: PV changed from "1.4" to "1.5"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-src: PKGSIZE changed from 267775 to 295843 (+10%)
packages/core2-32-poky-linux/erofs-utils/erofs-utils-src: PKGV changed from 1.4 [default] to 1.5 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-src: FILELIST: directory renamed /usr/src/debug/erofs-utils/1.4-r0/git/mkfs -> /usr/src/debug/erofs-utils/1.5-r0/git/dump, directory renamed /usr/src/debug/erofs-utils/1.4-r0/git/fsck -> /usr/src/debug/erofs-utils/1.5-r0/git/mkfs, directory renamed /usr/src/debug/erofs-utils/1.4-r0/git/dump -> /usr/src/debug/erofs-utils/1.5-r0/git/fsck, directory renamed /usr/src/debug/erofs-utils/1.4-r0/git/include -> /usr/src/debug/erofs-utils/1.5-r0/git/include, removed "/usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/block_list.h /usr/src/debug/erofs-utils/1.4-r0/git/lib/super.c /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/compress.h /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/blobchunk.h /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/io.h /usr/src/debug/erofs-utils/1.4-r0/git/lib/data.c /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/xattr.h /usr/src/debug/erofs-utils/1.4-r0/git/lib/compress.c /usr/src/debug/erofs-u
 tils/1.4-r0/git/include/erofs/decompress.h /usr/src/debug/erofs-utils/1.4-r0/git/lib/compressor.c /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/err.h /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/exclude.h /usr/src/debug/erofs-utils/1.4-r0/git/lib/zmap.c /usr/src/debug/erofs-utils/1.4-r0/git/lib/config.c /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/list.h /usr/src/debug/erofs-utils/1.4-r0/git/lib/inode.c /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/config.h /usr/src/debug/erofs-utils/1.4-r0/git/lib/compressor_lz4hc.c /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/hashmap.h /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/cache.h /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/compress_hints.h /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/inode.h /usr/src/debug/erofs-utils/1.4-r0/git/lib/compressor.h /usr/src/debug/erofs-utils/1.4-r0/git/lib/compressor_lz4.c /usr/src/debug/erofs-utils/1.4-r0/git/lib/cache.c /usr/src/debug/erofs-utils/1.4-r0
 /git/include/erofs/flex-array.h /usr/src/debug/erofs-utils/1.4-r0/git/lib/compress_hints.c /usr/src/debug/erofs-utils/1.4-r0/git/lib/sha256.c /usr/src/debug/erofs-utils/1.4-r0/git/lib/decompress.c /usr/src/debug/erofs-utils/1.4-r0/git/lib/namei.c /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/hashtable.h /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/internal.h /usr/src/debug/erofs-utils/1.4-r0/git/lib/hashmap.c /usr/src/debug/erofs-utils/1.4-r0/git/lib/exclude.c /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/print.h /usr/src/debug/erofs-utils/1.4-r0/git/lib/blobchunk.c /usr/src/debug/erofs-utils/1.4-r0/git/lib/io.c /usr/src/debug/erofs-utils/1.4-r0/git/lib/xattr.c /usr/src/debug/erofs-utils/1.4-r0/git/include/erofs/defs.h", added "/usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/hashtable.h /usr/src/debug/erofs-utils/1.5-r0/git/lib/io.c /usr/src/debug/erofs-utils/1.5-r0/git/lib/exclude.c /usr/src/debug/erofs-utils/1.5-r0/git/lib/inode.c /usr/src/debug/erofs-utils/
 1.5-r0/git/include/erofs/hashmap.h /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/inode.h /usr/src/debug/erofs-utils/1.5-r0/git/lib/compressor.h /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/config.h /usr/src/debug/erofs-utils/1.5-r0/git/lib/config.c /usr/src/debug/erofs-utils/1.5-r0/git/lib/namei.c /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/io.h /usr/src/debug/erofs-utils/1.5-r0/git/lib/decompress.c /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/cache.h /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/err.h /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/list.h /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/block_list.h /usr/src/debug/erofs-utils/1.5-r0/git/lib/cache.c /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/exclude.h /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/compress_hints.h /usr/src/debug/erofs-utils/1.5-r0/git/lib/blobchunk.c /usr/src/debug/erofs-utils/1.5-r0/git/lib/sha256.c /usr/src/debug/erofs-utils/1.5-r0/git/include
 /erofs/flex-array.h /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/xattr.h /usr/src/debug/erofs-utils/1.5-r0/git/lib/dir.c /usr/src/debug/erofs-utils/1.5-r0/git/lib/compressor.c /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/print.h /usr/src/debug/erofs-utils/1.5-r0/git/lib/zmap.c /usr/src/debug/erofs-utils/1.5-r0/git/lib/super.c /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/dir.h /usr/src/debug/erofs-utils/1.5-r0/git/lib/xattr.c /usr/src/debug/erofs-utils/1.5-r0/git/lib/compressor_lz4.c /usr/src/debug/erofs-utils/1.5-r0/git/lib/hashmap.c /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/internal.h /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/compress.h /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/decompress.h /usr/src/debug/erofs-utils/1.5-r0/git/include/erofs/defs.h /usr/src/debug/erofs-utils/1.5-r0/git/lib/compress.c /usr/src/debug/erofs-utils/1.5-r0/git/lib/compress_hints.c /usr/src/debug/erofs-utils/1.5-r0/git/lib/data.c /usr/src/debug/erofs-util
 s/1.5-r0/git/include/erofs/blobchunk.h /usr/src/debug/erofs-utils/1.5-r0/git/lib/compressor_lz4hc.c"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-src: PV changed from "1.4" to "1.5"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-staticdev: PKGV changed from 1.4 [default] to 1.5 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-staticdev: PV changed from "1.4" to "1.5"
packages/core2-32-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 230680 to 259476 (+12%)
packages/core2-32-poky-linux/erofs-utils/erofs-utils: PKGV changed from 1.4 [default] to 1.5 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils: PV changed from "1.4" to "1.5"
packages/core2-32-poky-linux/erofs-utils: PKGV changed from 1.4 [default] to 1.5 [default]
packages/core2-32-poky-linux/erofs-utils: SRC_URI changed from "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master file://0001-fsck-main.c-add-missing-include.patch" to "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master"
packages/core2-32-poky-linux/erofs-utils: PV changed from "1.4" to "1.5"

--===============6974029483388915760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 5744 to 7642 (+33%)
packages/core2-32-poky-linux/erofs-utils/erofs-utils-doc: FILELIST: added "/usr/share/man/man1/fsck.erofs.1"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-src: PKGSIZE changed from 267775 to 295843 (+10%)
packages/core2-32-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 230680 to 259476 (+12%)

--===============6974029483388915760==--

