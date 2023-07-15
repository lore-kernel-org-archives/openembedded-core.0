Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA09C05053
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:38 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.6038.1689456455677888225
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X3lANc+g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101895b73b218-8b0588f8-de8a-4374-b4d9-b4b370ed44d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Kd3Ijyj92WYmsBkLoqi4nL3LH06Xx3R59H0fVPmeHzA=;
	b=X3lANc+gINKXJPghWS3v7yCQ6qBSQ+FlCJ8vQORVBbeB/NHdVQlDiRFeHLbWigAb
	RDD4sMUeUnFRMG52N/JoRZV4VvlgnsD4rBj6LniUUADpw7CpEVg3F8WteYbGBUu1ytT
	/LBPI2QlFu27vEw5iCGrAr52gKqMQkwe90oYeDHw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Kd3Ijyj92WYmsBkLoqi4nL3LH06Xx3R59H0fVPmeHzA=;
	b=ZsgD2cZDqlHtkoe00/PJQvtf/xe0neDDUgnfMb0g5dYmCDZRD6o6obnOBMxELpXA
	QJ80q4pqnUeRzIsAPW5orMrhvtUlAwyGf7n3dX7XnOOuKYGIL8/qVDnqeW3DI5BqXv1
	BueiGsg2utX73hBNKBoCfzESzUe4UYk7oWYFjlHE=
Content-Type: multipart/mixed; boundary="===============2990803038182018242=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.8 SUCCEEDED
Message-ID: <010101895b73b218-8b0588f8-de8a-4374-b4d9-b4b370ed44d2-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184394

--===============2990803038182018242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *debianutils* to *5.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.7-5.8.patch
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
From 3693a5058ff32bedd262828d5a6609e5e7b2360a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 20:40:14 +0000
Subject: [PATCH] debianutils: upgrade 5.7 -> 5.8

---
 ...{debianutils_5.7.bb => debianutils_5.8.bb} | 335 +++++++++++++++++-
 1 file changed, 333 insertions(+), 2 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_5.7.bb => debianutils_5.8.bb} (10%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.7.bb b/meta/recipes-support/debianutils/debianutils_5.8.bb
similarity index 10%
rename from meta/recipes-support/debianutils/debianutils_5.7.bb
rename to meta/recipes-support/debianutils/debianutils_5.8.bb
index 7d705c6ff4..2ba37f4e82 100644
--- a/meta/recipes-support/debianutils/debianutils_5.7.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.8.bb
@@ -1,3 +1,334 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- debian/copyright
+# +++ debian/copyright
+# @@ -1,161 +1,192 @@
+# -This is the Debian GNU/Linux package debianutils.
+# +Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
+# +Comment: This is the Debian GNU/Linux package debianutils.
+# + It is an original Debian package.  Programs in it were maintained by
+# + Guy Maor <maor@debian.org> and Clint Adams <schizo@debian.org> before.
+#  
+# -It is an original Debian package.  Programs in it were maintained by
+# -Guy Maor <maor@debian.org>, and are now maintained by Clint Adams
+# -<schizo@debian.org>.
+# +Files: *
+# +Copyright: (see individual files)
+# +License: GPL-2+
+#  
+# -All its programs except savelog, and which may be
+# -redistributed under the terms of the GNU GPL, Version 2 or later,
+# -found on Debian systems in the file /usr/share/common-licenses/GPL-2.
+# +Files: installkernel
+# +Copyright:
+# + Copyright (C) 1995 - 1998, Ian A. Murdock <imurdock@debian.org>
+# + Copyright (C) 1998, 1999, Guy Maor
+# + Copyright (C) 2002, Matthew Wilcox
+# + Copyright (C) 2002, 2004, 2005, 2007, 2009  Clint Adams
+# + Copyright (C) 2009  Manoj Srivasta
+# +License: GPL-2+
+#  
+# -which is in the public domain.
+# +Files: ischroot.c
+# +Copyright:
+# + Copyright (C) 2011 Aurelien Jarno <aurel32@debian.org>
+# + Copyright (C) 2015 Andreas Henriksson <andreas@fatal.se>
+# +License: GPL-2+
+#  
+# -savelog may be redistributed under the following terms: (The rest of
+# -this file consists of savelog's distribution terms.)
+# +Files: run-parts.*
+# +Copyright:
+# + Copyright (C) 1994 Ian Jackson.
+# + Copyright (C) 1996 Jeff Noxon <jeff@router.patch.net>
+# + Copyright (C) 1996-1999 Guy Maor <maor@debian.org>
+# + Copyright (C) 2002-2020 Clint Adams
+# +License: GPL-2+
+#  
+# -#ident	"@(#)smail:RELEASE-3_2:COPYING,v 1.2 1996/06/14 18:59:10 woods Exp"
+# +Files: update-shells
+# +Copyright: 2021 Helmut Grohne <helmut@subdivi.de>
+# +License: GPL-2+
+#  
+# -		     SMAIL GENERAL PUBLIC LICENSE
+# -		       (Clarified 11 Feb 1988)
+# +License: GPL-2+
+# + All the package's programs except 'savelog', and 'which' may be
+# + redistributed under the terms of the GNU GPL, Version 2 or later,
+# + found on Debian systems in the file /usr/share/common-licenses/GPL-2.
+#  
+# +Files: which
+# +Copyright: public-domain
+# +License: public-domain
+# + which is in the public domain.
+# +
+# +Files: savelog
+# +Copyright:
+#   Copyright (C)  1988 Landon Curt Noll & Ronald S. Karr
+#   Copyright (C)  1992 Ronald S. Karr
+#   Copyleft (GNU) 1988 Landon Curt Noll & Ronald S. Karr
+# -
+# +License: SMAIL-GPL
+# +                     SMAIL GENERAL PUBLIC LICENSE
+# +                       (Clarified 11 Feb 1988)
+# + .
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license, but changing it is not allowed.  You can also
+#   use this wording to make the terms for other programs.
+# -
+# -  The license agreements of most software companies keep you at the
+# -mercy of those companies.  By contrast, our general public license is
+# -intended to give everyone the right to share SMAIL.  To make sure that
+# -you get the rights we want you to have, we need to make restrictions
+# -that forbid anyone to deny you these rights or to ask you to surrender
+# -the rights.  Hence this license agreement.
+# -
+# -  Specifically, we want to make sure that you have the right to give
+# -away copies of SMAIL, that you receive source code or else can get it
+# -if you want it, that you can change SMAIL or use pieces of it in new
+# -free programs, and that you know you can do these things.
+# -
+# -  To make sure that everyone has such rights, we have to forbid you to
+# -deprive anyone else of these rights.  For example, if you distribute
+# -copies of SMAIL, you must give the recipients all the rights that you
+# -have.  You must make sure that they, too, receive or can get the
+# -source code.  And you must tell them their rights.
+# -
+# -  Also, for our own protection, we must make certain that everyone
+# -finds out that there is no warranty for SMAIL.  If SMAIL is modified by
+# -someone else and passed on, we want its recipients to know that what
+# -they have is not what we distributed, so that any problems introduced
+# -by others will not reflect on our reputation.
+# -
+# -  Therefore we (Landon Curt Noll and Ronald S. Karr) make the following 
+# -terms which say what you must do to be allowed to distribute or change 
+# -SMAIL.
+# -
+# -
+# -			COPYING POLICIES
+# -
+# -  1. You may copy and distribute verbatim copies of SMAIL source code
+# -as you receive it, in any medium, provided that you conspicuously and
+# -appropriately publish on each copy a valid copyright notice "Copyright
+# -(C) 1988 Landon Curt Noll & Ronald S. Karr" (or with whatever year is
+# -appropriate); keep intact the notices on all files that refer to this
+# -License Agreement and to the absence of any warranty; and give any
+# -other recipients of the SMAIL program a copy of this License
+# -Agreement along with the program.  You may charge a distribution fee
+# -for the physical act of transferring a copy.
+# -
+# -  2. You may modify your copy or copies of SMAIL or any portion of it,
+# -and copy and distribute such modifications under the terms of
+# -Paragraph 1 above, provided that you also do the following:
+# -
+# + .
+# +   The license agreements of most software companies keep you at the
+# + mercy of those companies.  By contrast, our general public license is
+# + intended to give everyone the right to share SMAIL.  To make sure that
+# + you get the rights we want you to have, we need to make restrictions
+# + that forbid anyone to deny you these rights or to ask you to surrender
+# + the rights.  Hence this license agreement.
+# + .
+# +   Specifically, we want to make sure that you have the right to give
+# + away copies of SMAIL, that you receive source code or else can get it
+# + if you want it, that you can change SMAIL or use pieces of it in new
+# + free programs, and that you know you can do these things.
+# + .
+# +   To make sure that everyone has such rights, we have to forbid you to
+# + deprive anyone else of these rights.  For example, if you distribute
+# + copies of SMAIL, you must give the recipients all the rights that you
+# + have.  You must make sure that they, too, receive or can get the
+# + source code.  And you must tell them their rights.
+# + .
+# +   Also, for our own protection, we must make certain that everyone
+# + finds out that there is no warranty for SMAIL.  If SMAIL is modified by
+# + someone else and passed on, we want its recipients to know that what
+# + they have is not what we distributed, so that any problems introduced
+# + by others will not reflect on our reputation.
+# + .
+# +   Therefore we (Landon Curt Noll and Ronald S. Karr) make the following
+# + terms which say what you must do to be allowed to distribute or change
+# + SMAIL.
+# + .
+# + .
+# +                         COPYING POLICIES
+# + .
+# +   1. You may copy and distribute verbatim copies of SMAIL source code
+# + as you receive it, in any medium, provided that you conspicuously and
+# + appropriately publish on each copy a valid copyright notice "Copyright
+# + (C) 1988 Landon Curt Noll & Ronald S. Karr" (or with whatever year is
+# + appropriate); keep intact the notices on all files that refer to this
+# + License Agreement and to the absence of any warranty; and give any
+# + other recipients of the SMAIL program a copy of this License
+# + Agreement along with the program.  You may charge a distribution fee
+# + for the physical act of transferring a copy.
+# + .
+# +   2. You may modify your copy or copies of SMAIL or any portion of it,
+# + and copy and distribute such modifications under the terms of
+# + Paragraph 1 above, provided that you also do the following:
+# + .
+#      a) cause the modified files to carry prominent notices stating
+#      that you changed the files and the date of any change; and
+# -
+# + .
+#      b) cause the whole of any work that you distribute or publish,
+#      that in whole or in part contains or is a derivative of SMAIL or
+#      any part thereof, to be licensed at no charge to all third
+#      parties on terms identical to those contained in this License
+#      Agreement (except that you may choose to grant more extensive
+#      warranty protection to some or all third parties, at your option).
+# -
+# + .
+#      c) You may charge a distribution fee for the physical act of
+#      transferring a copy, and you may at your option offer warranty
+#      protection in exchange for a fee.
+# -
+# -Mere aggregation of another unrelated program with this program (or its
+# -derivative) on a volume of a storage or distribution medium does not bring
+# -the other program under the scope of these terms.
+# -
+# -  3. You may copy and distribute SMAIL (or a portion or derivative of it,
+# -under Paragraph 2) in object code or executable form under the terms of
+# -Paragraphs 1 and 2 above provided that you also do one of the following:
+# -
+# + .
+# + Mere aggregation of another unrelated program with this program (or its
+# + derivative) on a volume of a storage or distribution medium does not bring
+# + the other program under the scope of these terms.
+# + .
+# +   3. You may copy and distribute SMAIL (or a portion or derivative of it,
+# + under Paragraph 2) in object code or executable form under the terms of
+# + Paragraphs 1 and 2 above provided that you also do one of the following:
+# + .
+#      a) accompany it with the complete corresponding machine-readable
+#      source code, which must be distributed under the terms of
+#      Paragraphs 1 and 2 above; or,
+# -
+# + .
+#      b) accompany it with a written offer, valid for at least three
+#      years, to give any third party free (except for a nominal
+#      shipping charge) a complete machine-readable copy of the
+#      corresponding source code, to be distributed under the terms of
+#      Paragraphs 1 and 2 above; or,
+# -
+# + .
+#      c) accompany it with the information you received as to where the
+#      corresponding source code may be obtained.  (This alternative is
+#      allowed only for non-commercial distribution and only if you
+#      received the program in object code or executable form alone.)
+# -
+# -For an executable file, complete source code means all the source code for
+# -all modules it contains; but, as a special exception, it need not include
+# -source code for modules which are standard libraries that accompany the
+# -operating system on which the executable file runs.
+# -
+# -  4. You may not copy, sublicense, distribute or transfer SMAIL
+# -except as expressly provided under this License Agreement.  Any attempt
+# -otherwise to copy, sublicense, distribute or transfer SMAIL is void and
+# -your rights to use the program under this License agreement shall be
+# -automatically terminated.  However, parties who have received computer
+# -software programs from you with this License Agreement will not have
+# -their licenses terminated so long as such parties remain in full compliance.
+# -
+# -  5. If you wish to incorporate parts of SMAIL into other free
+# -programs whose distribution conditions are different, write to Landon
+# -Curt Noll & Ronald S. Karr via the Free Software Foundation at 51
+# -Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.  We have not yet
+# -worked out a simple rule that can be stated here, but we will often
+# -permit this.  We will be guided by the two goals of preserving the
+# -free status of all derivatives of our free software and of promoting
+# -the sharing and reuse of software.
+# -
+# -Your comments and suggestions about our licensing policies and our
+# -software are welcome!  This contract was based on the contract made by
+# -the Free Software Foundation.  Please contact the Free Software
+# -Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301,
+# -USA, or call (617) 542-5942 for details on copylefted material in
+# -general.
+# -
+# -		       NO WARRANTY
+# -
+# -  BECAUSE SMAIL IS LICENSED FREE OF CHARGE, WE PROVIDE ABSOLUTELY NO
+# -WARRANTY, TO THE EXTENT PERMITTED BY APPLICABLE STATE LAW.  EXCEPT WHEN
+# -OTHERWISE STATED IN WRITING, LANDON CURT NOLL & RONALD S. KARR AND/OR
+# -OTHER PARTIES PROVIDE SMAIL "AS IS" WITHOUT WARRANTY OF ANY KIND,
+# -EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+# -WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+# -THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF SMAIL IS WITH
+# -YOU.  SHOULD SMAIL PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
+# -NECESSARY SERVICING, REPAIR OR CORRECTION.
+# -
+# -  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW WILL LANDON CURT NOLL &
+# -RONALD S. KARR AND/OR ANY OTHER PARTY WHO MAY MODIFY AND REDISTRIBUTE
+# -SMAIL AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+# -LOST PROFITS, LOST MONIES, OR OTHER SPECIAL, INCIDENTAL OR
+# -CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
+# -(INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
+# -INACCURATE OR LOSSES SUSTAINED BY THIRD PARTIES OR A FAILURE OF THE
+# -PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS) SMAIL, EVEN IF YOU HAVE
+# -BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, OR FOR ANY CLAIM BY
+# -ANY OTHER PARTY.
+# + .
+# + For an executable file, complete source code means all the source code for
+# + all modules it contains; but, as a special exception, it need not include
+# + source code for modules which are standard libraries that accompany the
+# + operating system on which the executable file runs.
+# + .
+# +   4. You may not copy, sublicense, distribute or transfer SMAIL
+# + except as expressly provided under this License Agreement.  Any attempt
+# + otherwise to copy, sublicense, distribute or transfer SMAIL is void and
+# + your rights to use the program under this License agreement shall be
+# + automatically terminated.  However, parties who have received computer
+# + software programs from you with this License Agreement will not have
+# + their licenses terminated so long as such parties remain in full compliance.
+# + .
+# +   5. If you wish to incorporate parts of SMAIL into other free
+# + programs whose distribution conditions are different, write to Landon
+# + Curt Noll & Ronald S. Karr via the Free Software Foundation at 51
+# + Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.  We have not yet
+# + worked out a simple rule that can be stated here, but we will often
+# + permit this.  We will be guided by the two goals of preserving the
+# + free status of all derivatives of our free software and of promoting
+# + the sharing and reuse of software.
+# + .
+# + Your comments and suggestions about our licensing policies and our
+# + software are welcome!  This contract was based on the contract made by
+# + the Free Software Foundation.  Please contact the Free Software
+# + Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301,
+# + USA, or call (617) 542-5942 for details on copylefted material in
+# + general.
+# + .
+# +                         NO WARRANTY
+# + .
+# +   BECAUSE SMAIL IS LICENSED FREE OF CHARGE, WE PROVIDE ABSOLUTELY NO
+# + WARRANTY, TO THE EXTENT PERMITTED BY APPLICABLE STATE LAW.  EXCEPT WHEN
+# + OTHERWISE STATED IN WRITING, LANDON CURT NOLL & RONALD S. KARR AND/OR
+# + OTHER PARTIES PROVIDE SMAIL "AS IS" WITHOUT WARRANTY OF ANY KIND,
+# + EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+# + WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+# + THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF SMAIL IS WITH
+# + YOU.  SHOULD SMAIL PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
+# + NECESSARY SERVICING, REPAIR OR CORRECTION.
+# + .
+# +   IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW WILL LANDON CURT NOLL &
+# + RONALD S. KARR AND/OR ANY OTHER PARTY WHO MAY MODIFY AND REDISTRIBUTE
+# + SMAIL AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+# + LOST PROFITS, LOST MONIES, OR OTHER SPECIAL, INCIDENTAL OR
+# + CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
+# + (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
+# + INACCURATE OR LOSSES SUSTAINED BY THIRD PARTIES OR A FAILURE OF THE
+# + PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS) SMAIL, EVEN IF YOU HAVE
+# + BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, OR FOR ANY CLAIM BY
+# + ANY OTHER PARTY.
+# 
+#
+
 SUMMARY = "Miscellaneous utilities specific to Debian"
 DESCRIPTION = "Provides a number of small utilities which are used \
 primarily by the installation scripts of Debian packages, although \
@@ -6,12 +337,12 @@ HOMEPAGE = "https://packages.debian.org/sid/debianutils"
 BUGTRACKER = "https://bugs.debian.org/cgi-bin/pkgreport.cgi?pkg=debianutils;dist=unstable"
 SECTION = "base"
 LICENSE = "GPL-2.0-only & SMAIL_GPL"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=9b912cd0cc654134c0ef3424a0705b94"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=74765f57ae5dd2b10ffbc39528d98753"
 
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "de14223e5bffe15e374a441302c528ffc1cbed57"
+SRCREV = "69116b856177ceb270908103b5776f897d2863c3"
 
 inherit autotools update-alternatives
 
-- 
2.39.2


--===============2990803038182018242==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.7-5.8.patch"

RnJvbSAzNjkzYTUwNThmZjMyYmVkZDI2MjgyOGQ1YTY2MDllNWU3YjIzNjBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMjA6NDA6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJpYW51dGlsczogdXBncmFkZSA1LjcgLT4gNS44CgotLS0KIC4uLntkZWJpYW51dGlsc181Ljcu
YmIgPT4gZGViaWFudXRpbHNfNS44LmJifSB8IDMzNSArKysrKysrKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAzMzMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy97ZGViaWFudXRpbHNfNS43LmJiID0+IGRlYmlh
bnV0aWxzXzUuOC5iYn0gKDEwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9k
ZWJpYW51dGlscy9kZWJpYW51dGlsc181LjcuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJp
YW51dGlscy9kZWJpYW51dGlsc181LjguYmIKc2ltaWxhcml0eSBpbmRleCAxMCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS43LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181Ljgu
YmIKaW5kZXggN2Q3MDVjNmZmNC4uMmJhMzdmNGU4MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS43LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuOC5iYgpAQCAtMSwzICsxLDMzNCBA
QAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVk
IGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRh
dGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2Vz
IGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAo
ZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIwor
IyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIGRlYmlhbi9jb3B5cmlnaHQKKyMgKysrIGRlYmlhbi9j
b3B5cmlnaHQKKyMgQEAgLTEsMTYxICsxLDE5MiBAQAorIyAtVGhpcyBpcyB0aGUgRGViaWFuIEdO
VS9MaW51eCBwYWNrYWdlIGRlYmlhbnV0aWxzLgorIyArRm9ybWF0OiBodHRwczovL3d3dy5kZWJp
YW4ub3JnL2RvYy9wYWNrYWdpbmctbWFudWFscy9jb3B5cmlnaHQtZm9ybWF0LzEuMC8KKyMgK0Nv
bW1lbnQ6IFRoaXMgaXMgdGhlIERlYmlhbiBHTlUvTGludXggcGFja2FnZSBkZWJpYW51dGlscy4K
KyMgKyBJdCBpcyBhbiBvcmlnaW5hbCBEZWJpYW4gcGFja2FnZS4gIFByb2dyYW1zIGluIGl0IHdl
cmUgbWFpbnRhaW5lZCBieQorIyArIEd1eSBNYW9yIDxtYW9yQGRlYmlhbi5vcmc+IGFuZCBDbGlu
dCBBZGFtcyA8c2NoaXpvQGRlYmlhbi5vcmc+IGJlZm9yZS4KKyMgIAorIyAtSXQgaXMgYW4gb3Jp
Z2luYWwgRGViaWFuIHBhY2thZ2UuICBQcm9ncmFtcyBpbiBpdCB3ZXJlIG1haW50YWluZWQgYnkK
KyMgLUd1eSBNYW9yIDxtYW9yQGRlYmlhbi5vcmc+LCBhbmQgYXJlIG5vdyBtYWludGFpbmVkIGJ5
IENsaW50IEFkYW1zCisjIC08c2NoaXpvQGRlYmlhbi5vcmc+LgorIyArRmlsZXM6ICoKKyMgK0Nv
cHlyaWdodDogKHNlZSBpbmRpdmlkdWFsIGZpbGVzKQorIyArTGljZW5zZTogR1BMLTIrCisjICAK
KyMgLUFsbCBpdHMgcHJvZ3JhbXMgZXhjZXB0IHNhdmVsb2csIGFuZCB3aGljaCBtYXkgYmUKKyMg
LXJlZGlzdHJpYnV0ZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR1BMLCBWZXJzaW9uIDIg
b3IgbGF0ZXIsCisjIC1mb3VuZCBvbiBEZWJpYW4gc3lzdGVtcyBpbiB0aGUgZmlsZSAvdXNyL3No
YXJlL2NvbW1vbi1saWNlbnNlcy9HUEwtMi4KKyMgK0ZpbGVzOiBpbnN0YWxsa2VybmVsCisjICtD
b3B5cmlnaHQ6CisjICsgQ29weXJpZ2h0IChDKSAxOTk1IC0gMTk5OCwgSWFuIEEuIE11cmRvY2sg
PGltdXJkb2NrQGRlYmlhbi5vcmc+CisjICsgQ29weXJpZ2h0IChDKSAxOTk4LCAxOTk5LCBHdXkg
TWFvcgorIyArIENvcHlyaWdodCAoQykgMjAwMiwgTWF0dGhldyBXaWxjb3gKKyMgKyBDb3B5cmln
aHQgKEMpIDIwMDIsIDIwMDQsIDIwMDUsIDIwMDcsIDIwMDkgIENsaW50IEFkYW1zCisjICsgQ29w
eXJpZ2h0IChDKSAyMDA5ICBNYW5vaiBTcml2YXN0YQorIyArTGljZW5zZTogR1BMLTIrCisjICAK
KyMgLXdoaWNoIGlzIGluIHRoZSBwdWJsaWMgZG9tYWluLgorIyArRmlsZXM6IGlzY2hyb290LmMK
KyMgK0NvcHlyaWdodDoKKyMgKyBDb3B5cmlnaHQgKEMpIDIwMTEgQXVyZWxpZW4gSmFybm8gPGF1
cmVsMzJAZGViaWFuLm9yZz4KKyMgKyBDb3B5cmlnaHQgKEMpIDIwMTUgQW5kcmVhcyBIZW5yaWtz
c29uIDxhbmRyZWFzQGZhdGFsLnNlPgorIyArTGljZW5zZTogR1BMLTIrCisjICAKKyMgLXNhdmVs
b2cgbWF5IGJlIHJlZGlzdHJpYnV0ZWQgdW5kZXIgdGhlIGZvbGxvd2luZyB0ZXJtczogKFRoZSBy
ZXN0IG9mCisjIC10aGlzIGZpbGUgY29uc2lzdHMgb2Ygc2F2ZWxvZydzIGRpc3RyaWJ1dGlvbiB0
ZXJtcy4pCisjICtGaWxlczogcnVuLXBhcnRzLioKKyMgK0NvcHlyaWdodDoKKyMgKyBDb3B5cmln
aHQgKEMpIDE5OTQgSWFuIEphY2tzb24uCisjICsgQ29weXJpZ2h0IChDKSAxOTk2IEplZmYgTm94
b24gPGplZmZAcm91dGVyLnBhdGNoLm5ldD4KKyMgKyBDb3B5cmlnaHQgKEMpIDE5OTYtMTk5OSBH
dXkgTWFvciA8bWFvckBkZWJpYW4ub3JnPgorIyArIENvcHlyaWdodCAoQykgMjAwMi0yMDIwIENs
aW50IEFkYW1zCisjICtMaWNlbnNlOiBHUEwtMisKKyMgIAorIyAtI2lkZW50CSJAKCMpc21haWw6
UkVMRUFTRS0zXzI6Q09QWUlORyx2IDEuMiAxOTk2LzA2LzE0IDE4OjU5OjEwIHdvb2RzIEV4cCIK
KyMgK0ZpbGVzOiB1cGRhdGUtc2hlbGxzCisjICtDb3B5cmlnaHQ6IDIwMjEgSGVsbXV0IEdyb2hu
ZSA8aGVsbXV0QHN1YmRpdmkuZGU+CisjICtMaWNlbnNlOiBHUEwtMisKKyMgIAorIyAtCQkgICAg
IFNNQUlMIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgLQkJICAgICAgIChDbGFyaWZpZWQgMTEg
RmViIDE5ODgpCisjICtMaWNlbnNlOiBHUEwtMisKKyMgKyBBbGwgdGhlIHBhY2thZ2UncyBwcm9n
cmFtcyBleGNlcHQgJ3NhdmVsb2cnLCBhbmQgJ3doaWNoJyBtYXkgYmUKKyMgKyByZWRpc3RyaWJ1
dGVkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgVmVyc2lvbiAyIG9yIGxhdGVyLAor
IyArIGZvdW5kIG9uIERlYmlhbiBzeXN0ZW1zIGluIHRoZSBmaWxlIC91c3Ivc2hhcmUvY29tbW9u
LWxpY2Vuc2VzL0dQTC0yLgorIyAgCisjICtGaWxlczogd2hpY2gKKyMgK0NvcHlyaWdodDogcHVi
bGljLWRvbWFpbgorIyArTGljZW5zZTogcHVibGljLWRvbWFpbgorIyArIHdoaWNoIGlzIGluIHRo
ZSBwdWJsaWMgZG9tYWluLgorIyArCisjICtGaWxlczogc2F2ZWxvZworIyArQ29weXJpZ2h0Ogor
IyAgIENvcHlyaWdodCAoQykgIDE5ODggTGFuZG9uIEN1cnQgTm9sbCAmIFJvbmFsZCBTLiBLYXJy
CisjICAgQ29weXJpZ2h0IChDKSAgMTk5MiBSb25hbGQgUy4gS2FycgorIyAgIENvcHlsZWZ0IChH
TlUpIDE5ODggTGFuZG9uIEN1cnQgTm9sbCAmIFJvbmFsZCBTLiBLYXJyCisjIC0KKyMgK0xpY2Vu
c2U6IFNNQUlMLUdQTAorIyArICAgICAgICAgICAgICAgICAgICAgU01BSUwgR0VORVJBTCBQVUJM
SUMgTElDRU5TRQorIyArICAgICAgICAgICAgICAgICAgICAgICAoQ2xhcmlmaWVkIDExIEZlYiAx
OTg4KQorIyArIC4KKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJp
YnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2UsIGJ1dCBjaGFuZ2luZyBp
dCBpcyBub3QgYWxsb3dlZC4gIFlvdSBjYW4gYWxzbworIyAgIHVzZSB0aGlzIHdvcmRpbmcgdG8g
bWFrZSB0aGUgdGVybXMgZm9yIG90aGVyIHByb2dyYW1zLgorIyAtCisjIC0gIFRoZSBsaWNlbnNl
IGFncmVlbWVudHMgb2YgbW9zdCBzb2Z0d2FyZSBjb21wYW5pZXMga2VlcCB5b3UgYXQgdGhlCisj
IC1tZXJjeSBvZiB0aG9zZSBjb21wYW5pZXMuICBCeSBjb250cmFzdCwgb3VyIGdlbmVyYWwgcHVi
bGljIGxpY2Vuc2UgaXMKKyMgLWludGVuZGVkIHRvIGdpdmUgZXZlcnlvbmUgdGhlIHJpZ2h0IHRv
IHNoYXJlIFNNQUlMLiAgVG8gbWFrZSBzdXJlIHRoYXQKKyMgLXlvdSBnZXQgdGhlIHJpZ2h0cyB3
ZSB3YW50IHlvdSB0byBoYXZlLCB3ZSBuZWVkIHRvIG1ha2UgcmVzdHJpY3Rpb25zCisjIC10aGF0
IGZvcmJpZCBhbnlvbmUgdG8gZGVueSB5b3UgdGhlc2UgcmlnaHRzIG9yIHRvIGFzayB5b3UgdG8g
c3VycmVuZGVyCisjIC10aGUgcmlnaHRzLiAgSGVuY2UgdGhpcyBsaWNlbnNlIGFncmVlbWVudC4K
KyMgLQorIyAtICBTcGVjaWZpY2FsbHksIHdlIHdhbnQgdG8gbWFrZSBzdXJlIHRoYXQgeW91IGhh
dmUgdGhlIHJpZ2h0IHRvIGdpdmUKKyMgLWF3YXkgY29waWVzIG9mIFNNQUlMLCB0aGF0IHlvdSBy
ZWNlaXZlIHNvdXJjZSBjb2RlIG9yIGVsc2UgY2FuIGdldCBpdAorIyAtaWYgeW91IHdhbnQgaXQs
IHRoYXQgeW91IGNhbiBjaGFuZ2UgU01BSUwgb3IgdXNlIHBpZWNlcyBvZiBpdCBpbiBuZXcKKyMg
LWZyZWUgcHJvZ3JhbXMsIGFuZCB0aGF0IHlvdSBrbm93IHlvdSBjYW4gZG8gdGhlc2UgdGhpbmdz
LgorIyAtCisjIC0gIFRvIG1ha2Ugc3VyZSB0aGF0IGV2ZXJ5b25lIGhhcyBzdWNoIHJpZ2h0cywg
d2UgaGF2ZSB0byBmb3JiaWQgeW91IHRvCisjIC1kZXByaXZlIGFueW9uZSBlbHNlIG9mIHRoZXNl
IHJpZ2h0cy4gIEZvciBleGFtcGxlLCBpZiB5b3UgZGlzdHJpYnV0ZQorIyAtY29waWVzIG9mIFNN
QUlMLCB5b3UgbXVzdCBnaXZlIHRoZSByZWNpcGllbnRzIGFsbCB0aGUgcmlnaHRzIHRoYXQgeW91
CisjIC1oYXZlLiAgWW91IG11c3QgbWFrZSBzdXJlIHRoYXQgdGhleSwgdG9vLCByZWNlaXZlIG9y
IGNhbiBnZXQgdGhlCisjIC1zb3VyY2UgY29kZS4gIEFuZCB5b3UgbXVzdCB0ZWxsIHRoZW0gdGhl
aXIgcmlnaHRzLgorIyAtCisjIC0gIEFsc28sIGZvciBvdXIgb3duIHByb3RlY3Rpb24sIHdlIG11
c3QgbWFrZSBjZXJ0YWluIHRoYXQgZXZlcnlvbmUKKyMgLWZpbmRzIG91dCB0aGF0IHRoZXJlIGlz
IG5vIHdhcnJhbnR5IGZvciBTTUFJTC4gIElmIFNNQUlMIGlzIG1vZGlmaWVkIGJ5CisjIC1zb21l
b25lIGVsc2UgYW5kIHBhc3NlZCBvbiwgd2Ugd2FudCBpdHMgcmVjaXBpZW50cyB0byBrbm93IHRo
YXQgd2hhdAorIyAtdGhleSBoYXZlIGlzIG5vdCB3aGF0IHdlIGRpc3RyaWJ1dGVkLCBzbyB0aGF0
IGFueSBwcm9ibGVtcyBpbnRyb2R1Y2VkCisjIC1ieSBvdGhlcnMgd2lsbCBub3QgcmVmbGVjdCBv
biBvdXIgcmVwdXRhdGlvbi4KKyMgLQorIyAtICBUaGVyZWZvcmUgd2UgKExhbmRvbiBDdXJ0IE5v
bGwgYW5kIFJvbmFsZCBTLiBLYXJyKSBtYWtlIHRoZSBmb2xsb3dpbmcgCisjIC10ZXJtcyB3aGlj
aCBzYXkgd2hhdCB5b3UgbXVzdCBkbyB0byBiZSBhbGxvd2VkIHRvIGRpc3RyaWJ1dGUgb3IgY2hh
bmdlIAorIyAtU01BSUwuCisjIC0KKyMgLQorIyAtCQkJQ09QWUlORyBQT0xJQ0lFUworIyAtCisj
IC0gIDEuIFlvdSBtYXkgY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMgb2YgU01B
SUwgc291cmNlIGNvZGUKKyMgLWFzIHlvdSByZWNlaXZlIGl0LCBpbiBhbnkgbWVkaXVtLCBwcm92
aWRlZCB0aGF0IHlvdSBjb25zcGljdW91c2x5IGFuZAorIyAtYXBwcm9wcmlhdGVseSBwdWJsaXNo
IG9uIGVhY2ggY29weSBhIHZhbGlkIGNvcHlyaWdodCBub3RpY2UgIkNvcHlyaWdodAorIyAtKEMp
IDE5ODggTGFuZG9uIEN1cnQgTm9sbCAmIFJvbmFsZCBTLiBLYXJyIiAob3Igd2l0aCB3aGF0ZXZl
ciB5ZWFyIGlzCisjIC1hcHByb3ByaWF0ZSk7IGtlZXAgaW50YWN0IHRoZSBub3RpY2VzIG9uIGFs
bCBmaWxlcyB0aGF0IHJlZmVyIHRvIHRoaXMKKyMgLUxpY2Vuc2UgQWdyZWVtZW50IGFuZCB0byB0
aGUgYWJzZW5jZSBvZiBhbnkgd2FycmFudHk7IGFuZCBnaXZlIGFueQorIyAtb3RoZXIgcmVjaXBp
ZW50cyBvZiB0aGUgU01BSUwgcHJvZ3JhbSBhIGNvcHkgb2YgdGhpcyBMaWNlbnNlCisjIC1BZ3Jl
ZW1lbnQgYWxvbmcgd2l0aCB0aGUgcHJvZ3JhbS4gIFlvdSBtYXkgY2hhcmdlIGEgZGlzdHJpYnV0
aW9uIGZlZQorIyAtZm9yIHRoZSBwaHlzaWNhbCBhY3Qgb2YgdHJhbnNmZXJyaW5nIGEgY29weS4K
KyMgLQorIyAtICAyLiBZb3UgbWF5IG1vZGlmeSB5b3VyIGNvcHkgb3IgY29waWVzIG9mIFNNQUlM
IG9yIGFueSBwb3J0aW9uIG9mIGl0LAorIyAtYW5kIGNvcHkgYW5kIGRpc3RyaWJ1dGUgc3VjaCBt
b2RpZmljYXRpb25zIHVuZGVyIHRoZSB0ZXJtcyBvZgorIyAtUGFyYWdyYXBoIDEgYWJvdmUsIHBy
b3ZpZGVkIHRoYXQgeW91IGFsc28gZG8gdGhlIGZvbGxvd2luZzoKKyMgLQorIyArIC4KKyMgKyAg
IFRoZSBsaWNlbnNlIGFncmVlbWVudHMgb2YgbW9zdCBzb2Z0d2FyZSBjb21wYW5pZXMga2VlcCB5
b3UgYXQgdGhlCisjICsgbWVyY3kgb2YgdGhvc2UgY29tcGFuaWVzLiAgQnkgY29udHJhc3QsIG91
ciBnZW5lcmFsIHB1YmxpYyBsaWNlbnNlIGlzCisjICsgaW50ZW5kZWQgdG8gZ2l2ZSBldmVyeW9u
ZSB0aGUgcmlnaHQgdG8gc2hhcmUgU01BSUwuICBUbyBtYWtlIHN1cmUgdGhhdAorIyArIHlvdSBn
ZXQgdGhlIHJpZ2h0cyB3ZSB3YW50IHlvdSB0byBoYXZlLCB3ZSBuZWVkIHRvIG1ha2UgcmVzdHJp
Y3Rpb25zCisjICsgdGhhdCBmb3JiaWQgYW55b25lIHRvIGRlbnkgeW91IHRoZXNlIHJpZ2h0cyBv
ciB0byBhc2sgeW91IHRvIHN1cnJlbmRlcgorIyArIHRoZSByaWdodHMuICBIZW5jZSB0aGlzIGxp
Y2Vuc2UgYWdyZWVtZW50LgorIyArIC4KKyMgKyAgIFNwZWNpZmljYWxseSwgd2Ugd2FudCB0byBt
YWtlIHN1cmUgdGhhdCB5b3UgaGF2ZSB0aGUgcmlnaHQgdG8gZ2l2ZQorIyArIGF3YXkgY29waWVz
IG9mIFNNQUlMLCB0aGF0IHlvdSByZWNlaXZlIHNvdXJjZSBjb2RlIG9yIGVsc2UgY2FuIGdldCBp
dAorIyArIGlmIHlvdSB3YW50IGl0LCB0aGF0IHlvdSBjYW4gY2hhbmdlIFNNQUlMIG9yIHVzZSBw
aWVjZXMgb2YgaXQgaW4gbmV3CisjICsgZnJlZSBwcm9ncmFtcywgYW5kIHRoYXQgeW91IGtub3cg
eW91IGNhbiBkbyB0aGVzZSB0aGluZ3MuCisjICsgLgorIyArICAgVG8gbWFrZSBzdXJlIHRoYXQg
ZXZlcnlvbmUgaGFzIHN1Y2ggcmlnaHRzLCB3ZSBoYXZlIHRvIGZvcmJpZCB5b3UgdG8KKyMgKyBk
ZXByaXZlIGFueW9uZSBlbHNlIG9mIHRoZXNlIHJpZ2h0cy4gIEZvciBleGFtcGxlLCBpZiB5b3Ug
ZGlzdHJpYnV0ZQorIyArIGNvcGllcyBvZiBTTUFJTCwgeW91IG11c3QgZ2l2ZSB0aGUgcmVjaXBp
ZW50cyBhbGwgdGhlIHJpZ2h0cyB0aGF0IHlvdQorIyArIGhhdmUuICBZb3UgbXVzdCBtYWtlIHN1
cmUgdGhhdCB0aGV5LCB0b28sIHJlY2VpdmUgb3IgY2FuIGdldCB0aGUKKyMgKyBzb3VyY2UgY29k
ZS4gIEFuZCB5b3UgbXVzdCB0ZWxsIHRoZW0gdGhlaXIgcmlnaHRzLgorIyArIC4KKyMgKyAgIEFs
c28sIGZvciBvdXIgb3duIHByb3RlY3Rpb24sIHdlIG11c3QgbWFrZSBjZXJ0YWluIHRoYXQgZXZl
cnlvbmUKKyMgKyBmaW5kcyBvdXQgdGhhdCB0aGVyZSBpcyBubyB3YXJyYW50eSBmb3IgU01BSUwu
ICBJZiBTTUFJTCBpcyBtb2RpZmllZCBieQorIyArIHNvbWVvbmUgZWxzZSBhbmQgcGFzc2VkIG9u
LCB3ZSB3YW50IGl0cyByZWNpcGllbnRzIHRvIGtub3cgdGhhdCB3aGF0CisjICsgdGhleSBoYXZl
IGlzIG5vdCB3aGF0IHdlIGRpc3RyaWJ1dGVkLCBzbyB0aGF0IGFueSBwcm9ibGVtcyBpbnRyb2R1
Y2VkCisjICsgYnkgb3RoZXJzIHdpbGwgbm90IHJlZmxlY3Qgb24gb3VyIHJlcHV0YXRpb24uCisj
ICsgLgorIyArICAgVGhlcmVmb3JlIHdlIChMYW5kb24gQ3VydCBOb2xsIGFuZCBSb25hbGQgUy4g
S2FycikgbWFrZSB0aGUgZm9sbG93aW5nCisjICsgdGVybXMgd2hpY2ggc2F5IHdoYXQgeW91IG11
c3QgZG8gdG8gYmUgYWxsb3dlZCB0byBkaXN0cmlidXRlIG9yIGNoYW5nZQorIyArIFNNQUlMLgor
IyArIC4KKyMgKyAuCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgQ09QWUlORyBQT0xJQ0lF
UworIyArIC4KKyMgKyAgIDEuIFlvdSBtYXkgY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBj
b3BpZXMgb2YgU01BSUwgc291cmNlIGNvZGUKKyMgKyBhcyB5b3UgcmVjZWl2ZSBpdCwgaW4gYW55
IG1lZGl1bSwgcHJvdmlkZWQgdGhhdCB5b3UgY29uc3BpY3VvdXNseSBhbmQKKyMgKyBhcHByb3By
aWF0ZWx5IHB1Ymxpc2ggb24gZWFjaCBjb3B5IGEgdmFsaWQgY29weXJpZ2h0IG5vdGljZSAiQ29w
eXJpZ2h0CisjICsgKEMpIDE5ODggTGFuZG9uIEN1cnQgTm9sbCAmIFJvbmFsZCBTLiBLYXJyIiAo
b3Igd2l0aCB3aGF0ZXZlciB5ZWFyIGlzCisjICsgYXBwcm9wcmlhdGUpOyBrZWVwIGludGFjdCB0
aGUgbm90aWNlcyBvbiBhbGwgZmlsZXMgdGhhdCByZWZlciB0byB0aGlzCisjICsgTGljZW5zZSBB
Z3JlZW1lbnQgYW5kIHRvIHRoZSBhYnNlbmNlIG9mIGFueSB3YXJyYW50eTsgYW5kIGdpdmUgYW55
CisjICsgb3RoZXIgcmVjaXBpZW50cyBvZiB0aGUgU01BSUwgcHJvZ3JhbSBhIGNvcHkgb2YgdGhp
cyBMaWNlbnNlCisjICsgQWdyZWVtZW50IGFsb25nIHdpdGggdGhlIHByb2dyYW0uICBZb3UgbWF5
IGNoYXJnZSBhIGRpc3RyaWJ1dGlvbiBmZWUKKyMgKyBmb3IgdGhlIHBoeXNpY2FsIGFjdCBvZiB0
cmFuc2ZlcnJpbmcgYSBjb3B5LgorIyArIC4KKyMgKyAgIDIuIFlvdSBtYXkgbW9kaWZ5IHlvdXIg
Y29weSBvciBjb3BpZXMgb2YgU01BSUwgb3IgYW55IHBvcnRpb24gb2YgaXQsCisjICsgYW5kIGNv
cHkgYW5kIGRpc3RyaWJ1dGUgc3VjaCBtb2RpZmljYXRpb25zIHVuZGVyIHRoZSB0ZXJtcyBvZgor
IyArIFBhcmFncmFwaCAxIGFib3ZlLCBwcm92aWRlZCB0aGF0IHlvdSBhbHNvIGRvIHRoZSBmb2xs
b3dpbmc6CisjICsgLgorIyAgICAgIGEpIGNhdXNlIHRoZSBtb2RpZmllZCBmaWxlcyB0byBjYXJy
eSBwcm9taW5lbnQgbm90aWNlcyBzdGF0aW5nCisjICAgICAgdGhhdCB5b3UgY2hhbmdlZCB0aGUg
ZmlsZXMgYW5kIHRoZSBkYXRlIG9mIGFueSBjaGFuZ2U7IGFuZAorIyAtCisjICsgLgorIyAgICAg
IGIpIGNhdXNlIHRoZSB3aG9sZSBvZiBhbnkgd29yayB0aGF0IHlvdSBkaXN0cmlidXRlIG9yIHB1
Ymxpc2gsCisjICAgICAgdGhhdCBpbiB3aG9sZSBvciBpbiBwYXJ0IGNvbnRhaW5zIG9yIGlzIGEg
ZGVyaXZhdGl2ZSBvZiBTTUFJTCBvcgorIyAgICAgIGFueSBwYXJ0IHRoZXJlb2YsIHRvIGJlIGxp
Y2Vuc2VkIGF0IG5vIGNoYXJnZSB0byBhbGwgdGhpcmQKKyMgICAgICBwYXJ0aWVzIG9uIHRlcm1z
IGlkZW50aWNhbCB0byB0aG9zZSBjb250YWluZWQgaW4gdGhpcyBMaWNlbnNlCisjICAgICAgQWdy
ZWVtZW50IChleGNlcHQgdGhhdCB5b3UgbWF5IGNob29zZSB0byBncmFudCBtb3JlIGV4dGVuc2l2
ZQorIyAgICAgIHdhcnJhbnR5IHByb3RlY3Rpb24gdG8gc29tZSBvciBhbGwgdGhpcmQgcGFydGll
cywgYXQgeW91ciBvcHRpb24pLgorIyAtCisjICsgLgorIyAgICAgIGMpIFlvdSBtYXkgY2hhcmdl
IGEgZGlzdHJpYnV0aW9uIGZlZSBmb3IgdGhlIHBoeXNpY2FsIGFjdCBvZgorIyAgICAgIHRyYW5z
ZmVycmluZyBhIGNvcHksIGFuZCB5b3UgbWF5IGF0IHlvdXIgb3B0aW9uIG9mZmVyIHdhcnJhbnR5
CisjICAgICAgcHJvdGVjdGlvbiBpbiBleGNoYW5nZSBmb3IgYSBmZWUuCisjIC0KKyMgLU1lcmUg
YWdncmVnYXRpb24gb2YgYW5vdGhlciB1bnJlbGF0ZWQgcHJvZ3JhbSB3aXRoIHRoaXMgcHJvZ3Jh
bSAob3IgaXRzCisjIC1kZXJpdmF0aXZlKSBvbiBhIHZvbHVtZSBvZiBhIHN0b3JhZ2Ugb3IgZGlz
dHJpYnV0aW9uIG1lZGl1bSBkb2VzIG5vdCBicmluZworIyAtdGhlIG90aGVyIHByb2dyYW0gdW5k
ZXIgdGhlIHNjb3BlIG9mIHRoZXNlIHRlcm1zLgorIyAtCisjIC0gIDMuIFlvdSBtYXkgY29weSBh
bmQgZGlzdHJpYnV0ZSBTTUFJTCAob3IgYSBwb3J0aW9uIG9yIGRlcml2YXRpdmUgb2YgaXQsCisj
IC11bmRlciBQYXJhZ3JhcGggMikgaW4gb2JqZWN0IGNvZGUgb3IgZXhlY3V0YWJsZSBmb3JtIHVu
ZGVyIHRoZSB0ZXJtcyBvZgorIyAtUGFyYWdyYXBocyAxIGFuZCAyIGFib3ZlIHByb3ZpZGVkIHRo
YXQgeW91IGFsc28gZG8gb25lIG9mIHRoZSBmb2xsb3dpbmc6CisjIC0KKyMgKyAuCisjICsgTWVy
ZSBhZ2dyZWdhdGlvbiBvZiBhbm90aGVyIHVucmVsYXRlZCBwcm9ncmFtIHdpdGggdGhpcyBwcm9n
cmFtIChvciBpdHMKKyMgKyBkZXJpdmF0aXZlKSBvbiBhIHZvbHVtZSBvZiBhIHN0b3JhZ2Ugb3Ig
ZGlzdHJpYnV0aW9uIG1lZGl1bSBkb2VzIG5vdCBicmluZworIyArIHRoZSBvdGhlciBwcm9ncmFt
IHVuZGVyIHRoZSBzY29wZSBvZiB0aGVzZSB0ZXJtcy4KKyMgKyAuCisjICsgICAzLiBZb3UgbWF5
IGNvcHkgYW5kIGRpc3RyaWJ1dGUgU01BSUwgKG9yIGEgcG9ydGlvbiBvciBkZXJpdmF0aXZlIG9m
IGl0LAorIyArIHVuZGVyIFBhcmFncmFwaCAyKSBpbiBvYmplY3QgY29kZSBvciBleGVjdXRhYmxl
IGZvcm0gdW5kZXIgdGhlIHRlcm1zIG9mCisjICsgUGFyYWdyYXBocyAxIGFuZCAyIGFib3ZlIHBy
b3ZpZGVkIHRoYXQgeW91IGFsc28gZG8gb25lIG9mIHRoZSBmb2xsb3dpbmc6CisjICsgLgorIyAg
ICAgIGEpIGFjY29tcGFueSBpdCB3aXRoIHRoZSBjb21wbGV0ZSBjb3JyZXNwb25kaW5nIG1hY2hp
bmUtcmVhZGFibGUKKyMgICAgICBzb3VyY2UgY29kZSwgd2hpY2ggbXVzdCBiZSBkaXN0cmlidXRl
ZCB1bmRlciB0aGUgdGVybXMgb2YKKyMgICAgICBQYXJhZ3JhcGhzIDEgYW5kIDIgYWJvdmU7IG9y
LAorIyAtCisjICsgLgorIyAgICAgIGIpIGFjY29tcGFueSBpdCB3aXRoIGEgd3JpdHRlbiBvZmZl
ciwgdmFsaWQgZm9yIGF0IGxlYXN0IHRocmVlCisjICAgICAgeWVhcnMsIHRvIGdpdmUgYW55IHRo
aXJkIHBhcnR5IGZyZWUgKGV4Y2VwdCBmb3IgYSBub21pbmFsCisjICAgICAgc2hpcHBpbmcgY2hh
cmdlKSBhIGNvbXBsZXRlIG1hY2hpbmUtcmVhZGFibGUgY29weSBvZiB0aGUKKyMgICAgICBjb3Jy
ZXNwb25kaW5nIHNvdXJjZSBjb2RlLCB0byBiZSBkaXN0cmlidXRlZCB1bmRlciB0aGUgdGVybXMg
b2YKKyMgICAgICBQYXJhZ3JhcGhzIDEgYW5kIDIgYWJvdmU7IG9yLAorIyAtCisjICsgLgorIyAg
ICAgIGMpIGFjY29tcGFueSBpdCB3aXRoIHRoZSBpbmZvcm1hdGlvbiB5b3UgcmVjZWl2ZWQgYXMg
dG8gd2hlcmUgdGhlCisjICAgICAgY29ycmVzcG9uZGluZyBzb3VyY2UgY29kZSBtYXkgYmUgb2J0
YWluZWQuICAoVGhpcyBhbHRlcm5hdGl2ZSBpcworIyAgICAgIGFsbG93ZWQgb25seSBmb3Igbm9u
LWNvbW1lcmNpYWwgZGlzdHJpYnV0aW9uIGFuZCBvbmx5IGlmIHlvdQorIyAgICAgIHJlY2VpdmVk
IHRoZSBwcm9ncmFtIGluIG9iamVjdCBjb2RlIG9yIGV4ZWN1dGFibGUgZm9ybSBhbG9uZS4pCisj
IC0KKyMgLUZvciBhbiBleGVjdXRhYmxlIGZpbGUsIGNvbXBsZXRlIHNvdXJjZSBjb2RlIG1lYW5z
IGFsbCB0aGUgc291cmNlIGNvZGUgZm9yCisjIC1hbGwgbW9kdWxlcyBpdCBjb250YWluczsgYnV0
LCBhcyBhIHNwZWNpYWwgZXhjZXB0aW9uLCBpdCBuZWVkIG5vdCBpbmNsdWRlCisjIC1zb3VyY2Ug
Y29kZSBmb3IgbW9kdWxlcyB3aGljaCBhcmUgc3RhbmRhcmQgbGlicmFyaWVzIHRoYXQgYWNjb21w
YW55IHRoZQorIyAtb3BlcmF0aW5nIHN5c3RlbSBvbiB3aGljaCB0aGUgZXhlY3V0YWJsZSBmaWxl
IHJ1bnMuCisjIC0KKyMgLSAgNC4gWW91IG1heSBub3QgY29weSwgc3VibGljZW5zZSwgZGlzdHJp
YnV0ZSBvciB0cmFuc2ZlciBTTUFJTAorIyAtZXhjZXB0IGFzIGV4cHJlc3NseSBwcm92aWRlZCB1
bmRlciB0aGlzIExpY2Vuc2UgQWdyZWVtZW50LiAgQW55IGF0dGVtcHQKKyMgLW90aGVyd2lzZSB0
byBjb3B5LCBzdWJsaWNlbnNlLCBkaXN0cmlidXRlIG9yIHRyYW5zZmVyIFNNQUlMIGlzIHZvaWQg
YW5kCisjIC15b3VyIHJpZ2h0cyB0byB1c2UgdGhlIHByb2dyYW0gdW5kZXIgdGhpcyBMaWNlbnNl
IGFncmVlbWVudCBzaGFsbCBiZQorIyAtYXV0b21hdGljYWxseSB0ZXJtaW5hdGVkLiAgSG93ZXZl
ciwgcGFydGllcyB3aG8gaGF2ZSByZWNlaXZlZCBjb21wdXRlcgorIyAtc29mdHdhcmUgcHJvZ3Jh
bXMgZnJvbSB5b3Ugd2l0aCB0aGlzIExpY2Vuc2UgQWdyZWVtZW50IHdpbGwgbm90IGhhdmUKKyMg
LXRoZWlyIGxpY2Vuc2VzIHRlcm1pbmF0ZWQgc28gbG9uZyBhcyBzdWNoIHBhcnRpZXMgcmVtYWlu
IGluIGZ1bGwgY29tcGxpYW5jZS4KKyMgLQorIyAtICA1LiBJZiB5b3Ugd2lzaCB0byBpbmNvcnBv
cmF0ZSBwYXJ0cyBvZiBTTUFJTCBpbnRvIG90aGVyIGZyZWUKKyMgLXByb2dyYW1zIHdob3NlIGRp
c3RyaWJ1dGlvbiBjb25kaXRpb25zIGFyZSBkaWZmZXJlbnQsIHdyaXRlIHRvIExhbmRvbgorIyAt
Q3VydCBOb2xsICYgUm9uYWxkIFMuIEthcnIgdmlhIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b24gYXQgNTEKKyMgLUZyYW5rbGluIFN0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0x
MzAxLCBVU0EuICBXZSBoYXZlIG5vdCB5ZXQKKyMgLXdvcmtlZCBvdXQgYSBzaW1wbGUgcnVsZSB0
aGF0IGNhbiBiZSBzdGF0ZWQgaGVyZSwgYnV0IHdlIHdpbGwgb2Z0ZW4KKyMgLXBlcm1pdCB0aGlz
LiAgV2Ugd2lsbCBiZSBndWlkZWQgYnkgdGhlIHR3byBnb2FscyBvZiBwcmVzZXJ2aW5nIHRoZQor
IyAtZnJlZSBzdGF0dXMgb2YgYWxsIGRlcml2YXRpdmVzIG9mIG91ciBmcmVlIHNvZnR3YXJlIGFu
ZCBvZiBwcm9tb3RpbmcKKyMgLXRoZSBzaGFyaW5nIGFuZCByZXVzZSBvZiBzb2Z0d2FyZS4KKyMg
LQorIyAtWW91ciBjb21tZW50cyBhbmQgc3VnZ2VzdGlvbnMgYWJvdXQgb3VyIGxpY2Vuc2luZyBw
b2xpY2llcyBhbmQgb3VyCisjIC1zb2Z0d2FyZSBhcmUgd2VsY29tZSEgIFRoaXMgY29udHJhY3Qg
d2FzIGJhc2VkIG9uIHRoZSBjb250cmFjdCBtYWRlIGJ5CisjIC10aGUgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uLiAgUGxlYXNlIGNvbnRhY3QgdGhlIEZyZWUgU29mdHdhcmUKKyMgLUZvdW5kYXRp
b24sIEluYy4sIDUxIEZyYW5rbGluIFN0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0x
MzAxLAorIyAtVVNBLCBvciBjYWxsICg2MTcpIDU0Mi01OTQyIGZvciBkZXRhaWxzIG9uIGNvcHls
ZWZ0ZWQgbWF0ZXJpYWwgaW4KKyMgLWdlbmVyYWwuCisjIC0KKyMgLQkJICAgICAgIE5PIFdBUlJB
TlRZCisjIC0KKyMgLSAgQkVDQVVTRSBTTUFJTCBJUyBMSUNFTlNFRCBGUkVFIE9GIENIQVJHRSwg
V0UgUFJPVklERSBBQlNPTFVURUxZIE5PCisjIC1XQVJSQU5UWSwgVE8gVEhFIEVYVEVOVCBQRVJN
SVRURUQgQlkgQVBQTElDQUJMRSBTVEFURSBMQVcuICBFWENFUFQgV0hFTgorIyAtT1RIRVJXSVNF
IFNUQVRFRCBJTiBXUklUSU5HLCBMQU5ET04gQ1VSVCBOT0xMICYgUk9OQUxEIFMuIEtBUlIgQU5E
L09SCisjIC1PVEhFUiBQQVJUSUVTIFBST1ZJREUgU01BSUwgIkFTIElTIiBXSVRIT1VUIFdBUlJB
TlRZIE9GIEFOWSBLSU5ELAorIyAtRUlUSEVSIEVYUFJFU1NFRCBPUiBJTVBMSUVELCBJTkNMVURJ
TkcsIEJVVCBOT1QgTElNSVRFRCBUTywgVEhFIElNUExJRUQKKyMgLVdBUlJBTlRJRVMgT0YgTUVS
Q0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4KKyMgLVRI
RSBFTlRJUkUgUklTSyBBUyBUTyBUSEUgUVVBTElUWSBBTkQgUEVSRk9STUFOQ0UgT0YgU01BSUwg
SVMgV0lUSAorIyAtWU9VLiAgU0hPVUxEIFNNQUlMIFBST1ZFIERFRkVDVElWRSwgWU9VIEFTU1VN
RSBUSEUgQ09TVCBPRiBBTEwKKyMgLU5FQ0VTU0FSWSBTRVJWSUNJTkcsIFJFUEFJUiBPUiBDT1JS
RUNUSU9OLgorIyAtCisjIC0gIElOIE5PIEVWRU5UIFVOTEVTUyBSRVFVSVJFRCBCWSBBUFBMSUNB
QkxFIExBVyBXSUxMIExBTkRPTiBDVVJUIE5PTEwgJgorIyAtUk9OQUxEIFMuIEtBUlIgQU5EL09S
IEFOWSBPVEhFUiBQQVJUWSBXSE8gTUFZIE1PRElGWSBBTkQgUkVESVNUUklCVVRFCisjIC1TTUFJ
TCBBUyBQRVJNSVRURUQgQUJPVkUsIEJFIExJQUJMRSBUTyBZT1UgRk9SIERBTUFHRVMsIElOQ0xV
RElORyBBTlkKKyMgLUxPU1QgUFJPRklUUywgTE9TVCBNT05JRVMsIE9SIE9USEVSIFNQRUNJQUws
IElOQ0lERU5UQUwgT1IKKyMgLUNPTlNFUVVFTlRJQUwgREFNQUdFUyBBUklTSU5HIE9VVCBPRiBU
SEUgVVNFIE9SIElOQUJJTElUWSBUTyBVU0UKKyMgLShJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVE
IFRPIExPU1MgT0YgREFUQSBPUiBEQVRBIEJFSU5HIFJFTkRFUkVECisjIC1JTkFDQ1VSQVRFIE9S
IExPU1NFUyBTVVNUQUlORUQgQlkgVEhJUkQgUEFSVElFUyBPUiBBIEZBSUxVUkUgT0YgVEhFCisj
IC1QUk9HUkFNIFRPIE9QRVJBVEUgV0lUSCBBTlkgT1RIRVIgUFJPR1JBTVMpIFNNQUlMLCBFVkVO
IElGIFlPVSBIQVZFCisjIC1CRUVOIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GIFNVQ0gg
REFNQUdFUywgT1IgRk9SIEFOWSBDTEFJTSBCWQorIyAtQU5ZIE9USEVSIFBBUlRZLgorIyArIC4K
KyMgKyBGb3IgYW4gZXhlY3V0YWJsZSBmaWxlLCBjb21wbGV0ZSBzb3VyY2UgY29kZSBtZWFucyBh
bGwgdGhlIHNvdXJjZSBjb2RlIGZvcgorIyArIGFsbCBtb2R1bGVzIGl0IGNvbnRhaW5zOyBidXQs
IGFzIGEgc3BlY2lhbCBleGNlcHRpb24sIGl0IG5lZWQgbm90IGluY2x1ZGUKKyMgKyBzb3VyY2Ug
Y29kZSBmb3IgbW9kdWxlcyB3aGljaCBhcmUgc3RhbmRhcmQgbGlicmFyaWVzIHRoYXQgYWNjb21w
YW55IHRoZQorIyArIG9wZXJhdGluZyBzeXN0ZW0gb24gd2hpY2ggdGhlIGV4ZWN1dGFibGUgZmls
ZSBydW5zLgorIyArIC4KKyMgKyAgIDQuIFlvdSBtYXkgbm90IGNvcHksIHN1YmxpY2Vuc2UsIGRp
c3RyaWJ1dGUgb3IgdHJhbnNmZXIgU01BSUwKKyMgKyBleGNlcHQgYXMgZXhwcmVzc2x5IHByb3Zp
ZGVkIHVuZGVyIHRoaXMgTGljZW5zZSBBZ3JlZW1lbnQuICBBbnkgYXR0ZW1wdAorIyArIG90aGVy
d2lzZSB0byBjb3B5LCBzdWJsaWNlbnNlLCBkaXN0cmlidXRlIG9yIHRyYW5zZmVyIFNNQUlMIGlz
IHZvaWQgYW5kCisjICsgeW91ciByaWdodHMgdG8gdXNlIHRoZSBwcm9ncmFtIHVuZGVyIHRoaXMg
TGljZW5zZSBhZ3JlZW1lbnQgc2hhbGwgYmUKKyMgKyBhdXRvbWF0aWNhbGx5IHRlcm1pbmF0ZWQu
ICBIb3dldmVyLCBwYXJ0aWVzIHdobyBoYXZlIHJlY2VpdmVkIGNvbXB1dGVyCisjICsgc29mdHdh
cmUgcHJvZ3JhbXMgZnJvbSB5b3Ugd2l0aCB0aGlzIExpY2Vuc2UgQWdyZWVtZW50IHdpbGwgbm90
IGhhdmUKKyMgKyB0aGVpciBsaWNlbnNlcyB0ZXJtaW5hdGVkIHNvIGxvbmcgYXMgc3VjaCBwYXJ0
aWVzIHJlbWFpbiBpbiBmdWxsIGNvbXBsaWFuY2UuCisjICsgLgorIyArICAgNS4gSWYgeW91IHdp
c2ggdG8gaW5jb3Jwb3JhdGUgcGFydHMgb2YgU01BSUwgaW50byBvdGhlciBmcmVlCisjICsgcHJv
Z3JhbXMgd2hvc2UgZGlzdHJpYnV0aW9uIGNvbmRpdGlvbnMgYXJlIGRpZmZlcmVudCwgd3JpdGUg
dG8gTGFuZG9uCisjICsgQ3VydCBOb2xsICYgUm9uYWxkIFMuIEthcnIgdmlhIHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24gYXQgNTEKKyMgKyBGcmFua2xpbiBTdCwgRmlmdGggRmxvb3IsIEJv
c3RvbiwgTUEgMDIxMTAtMTMwMSwgVVNBLiAgV2UgaGF2ZSBub3QgeWV0CisjICsgd29ya2VkIG91
dCBhIHNpbXBsZSBydWxlIHRoYXQgY2FuIGJlIHN0YXRlZCBoZXJlLCBidXQgd2Ugd2lsbCBvZnRl
bgorIyArIHBlcm1pdCB0aGlzLiAgV2Ugd2lsbCBiZSBndWlkZWQgYnkgdGhlIHR3byBnb2FscyBv
ZiBwcmVzZXJ2aW5nIHRoZQorIyArIGZyZWUgc3RhdHVzIG9mIGFsbCBkZXJpdmF0aXZlcyBvZiBv
dXIgZnJlZSBzb2Z0d2FyZSBhbmQgb2YgcHJvbW90aW5nCisjICsgdGhlIHNoYXJpbmcgYW5kIHJl
dXNlIG9mIHNvZnR3YXJlLgorIyArIC4KKyMgKyBZb3VyIGNvbW1lbnRzIGFuZCBzdWdnZXN0aW9u
cyBhYm91dCBvdXIgbGljZW5zaW5nIHBvbGljaWVzIGFuZCBvdXIKKyMgKyBzb2Z0d2FyZSBhcmUg
d2VsY29tZSEgIFRoaXMgY29udHJhY3Qgd2FzIGJhc2VkIG9uIHRoZSBjb250cmFjdCBtYWRlIGJ5
CisjICsgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4gIFBsZWFzZSBjb250YWN0IHRoZSBG
cmVlIFNvZnR3YXJlCisjICsgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3QsIEZpZnRo
IEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEsCisjICsgVVNBLCBvciBjYWxsICg2MTcpIDU0
Mi01OTQyIGZvciBkZXRhaWxzIG9uIGNvcHlsZWZ0ZWQgbWF0ZXJpYWwgaW4KKyMgKyBnZW5lcmFs
LgorIyArIC4KKyMgKyAgICAgICAgICAgICAgICAgICAgICAgICBOTyBXQVJSQU5UWQorIyArIC4K
KyMgKyAgIEJFQ0FVU0UgU01BSUwgSVMgTElDRU5TRUQgRlJFRSBPRiBDSEFSR0UsIFdFIFBST1ZJ
REUgQUJTT0xVVEVMWSBOTworIyArIFdBUlJBTlRZLCBUTyBUSEUgRVhURU5UIFBFUk1JVFRFRCBC
WSBBUFBMSUNBQkxFIFNUQVRFIExBVy4gIEVYQ0VQVCBXSEVOCisjICsgT1RIRVJXSVNFIFNUQVRF
RCBJTiBXUklUSU5HLCBMQU5ET04gQ1VSVCBOT0xMICYgUk9OQUxEIFMuIEtBUlIgQU5EL09SCisj
ICsgT1RIRVIgUEFSVElFUyBQUk9WSURFIFNNQUlMICJBUyBJUyIgV0lUSE9VVCBXQVJSQU5UWSBP
RiBBTlkgS0lORCwKKyMgKyBFSVRIRVIgRVhQUkVTU0VEIE9SIElNUExJRUQsIElOQ0xVRElORywg
QlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUgSU1QTElFRAorIyArIFdBUlJBTlRJRVMgT0YgTUVSQ0hB
TlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4KKyMgKyBUSEUg
RU5USVJFIFJJU0sgQVMgVE8gVEhFIFFVQUxJVFkgQU5EIFBFUkZPUk1BTkNFIE9GIFNNQUlMIElT
IFdJVEgKKyMgKyBZT1UuICBTSE9VTEQgU01BSUwgUFJPVkUgREVGRUNUSVZFLCBZT1UgQVNTVU1F
IFRIRSBDT1NUIE9GIEFMTAorIyArIE5FQ0VTU0FSWSBTRVJWSUNJTkcsIFJFUEFJUiBPUiBDT1JS
RUNUSU9OLgorIyArIC4KKyMgKyAgIElOIE5PIEVWRU5UIFVOTEVTUyBSRVFVSVJFRCBCWSBBUFBM
SUNBQkxFIExBVyBXSUxMIExBTkRPTiBDVVJUIE5PTEwgJgorIyArIFJPTkFMRCBTLiBLQVJSIEFO
RC9PUiBBTlkgT1RIRVIgUEFSVFkgV0hPIE1BWSBNT0RJRlkgQU5EIFJFRElTVFJJQlVURQorIyAr
IFNNQUlMIEFTIFBFUk1JVFRFRCBBQk9WRSwgQkUgTElBQkxFIFRPIFlPVSBGT1IgREFNQUdFUywg
SU5DTFVESU5HIEFOWQorIyArIExPU1QgUFJPRklUUywgTE9TVCBNT05JRVMsIE9SIE9USEVSIFNQ
RUNJQUwsIElOQ0lERU5UQUwgT1IKKyMgKyBDT05TRVFVRU5USUFMIERBTUFHRVMgQVJJU0lORyBP
VVQgT0YgVEhFIFVTRSBPUiBJTkFCSUxJVFkgVE8gVVNFCisjICsgKElOQ0xVRElORyBCVVQgTk9U
IExJTUlURUQgVE8gTE9TUyBPRiBEQVRBIE9SIERBVEEgQkVJTkcgUkVOREVSRUQKKyMgKyBJTkFD
Q1VSQVRFIE9SIExPU1NFUyBTVVNUQUlORUQgQlkgVEhJUkQgUEFSVElFUyBPUiBBIEZBSUxVUkUg
T0YgVEhFCisjICsgUFJPR1JBTSBUTyBPUEVSQVRFIFdJVEggQU5ZIE9USEVSIFBST0dSQU1TKSBT
TUFJTCwgRVZFTiBJRiBZT1UgSEFWRQorIyArIEJFRU4gQURWSVNFRCBPRiBUSEUgUE9TU0lCSUxJ
VFkgT0YgU1VDSCBEQU1BR0VTLCBPUiBGT1IgQU5ZIENMQUlNIEJZCisjICsgQU5ZIE9USEVSIFBB
UlRZLgorIyAKKyMKKwogU1VNTUFSWSA9ICJNaXNjZWxsYW5lb3VzIHV0aWxpdGllcyBzcGVjaWZp
YyB0byBEZWJpYW4iCiBERVNDUklQVElPTiA9ICJQcm92aWRlcyBhIG51bWJlciBvZiBzbWFsbCB1
dGlsaXRpZXMgd2hpY2ggYXJlIHVzZWQgXAogcHJpbWFyaWx5IGJ5IHRoZSBpbnN0YWxsYXRpb24g
c2NyaXB0cyBvZiBEZWJpYW4gcGFja2FnZXMsIGFsdGhvdWdoIFwKQEAgLTYsMTIgKzMzNywxMiBA
QCBIT01FUEFHRSA9ICJodHRwczovL3BhY2thZ2VzLmRlYmlhbi5vcmcvc2lkL2RlYmlhbnV0aWxz
IgogQlVHVFJBQ0tFUiA9ICJodHRwczovL2J1Z3MuZGViaWFuLm9yZy9jZ2ktYmluL3BrZ3JlcG9y
dC5jZ2k/cGtnPWRlYmlhbnV0aWxzO2Rpc3Q9dW5zdGFibGUiCiBTRUNUSU9OID0gImJhc2UiCiBM
SUNFTlNFID0gIkdQTC0yLjAtb25seSAmIFNNQUlMX0dQTCIKLUxJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL2RlYmlhbi9jb3B5cmlnaHQ7bWQ1PTliOTEyY2QwY2M2NTQxMzRjMGVmMzQyNGEwNzA1
Yjk0IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vZGViaWFuL2NvcHlyaWdodDttZDU9NzQ3
NjVmNTdhZTVkZDJiMTBmZmJjMzk1MjhkOTg3NTMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vc2Fsc2Eu
ZGViaWFuLm9yZy9kZWJpYW4vZGViaWFudXRpbHMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1t
YXN0ZXIgXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJkZTE0MjIzZTViZmZlMTVlMzc0YTQ0
MTMwMmM1MjhmZmMxY2JlZDU3IgorU1JDUkVWID0gIjY5MTE2Yjg1NjE3N2NlYjI3MDkwODEwM2I1
Nzc2Zjg5N2QyODYzYzMiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHVwZGF0ZS1hbHRlcm5hdGl2ZXMK
IAotLSAKMi4zOS4yCgo=

--===============2990803038182018242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.7 [default] to 5.8 [default]
packages/core2-32-poky-linux/debianutils/debianutils-dbg: PV changed from "5.7" to "5.8"
packages/core2-32-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.7 [default] to 5.8 [default]
packages/core2-32-poky-linux/debianutils/debianutils-dev: PV changed from "5.7" to "5.8"
packages/core2-32-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.7 [default] to 5.8 [default]
packages/core2-32-poky-linux/debianutils/debianutils-doc: PV changed from "5.7" to "5.8"
packages/core2-32-poky-linux/debianutils/debianutils-doc: PKGSIZE changed from 13660 to 13725 (+0%)
packages/core2-32-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.7 [default] to 5.8 [default]
packages/core2-32-poky-linux/debianutils/debianutils-locale: PV changed from "5.7" to "5.8"
packages/core2-32-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.7 [default] to 5.8 [default]
packages/core2-32-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.7" to "5.8"
packages/core2-32-poky-linux/debianutils/debianutils-src: PKGV changed from 5.7 [default] to 5.8 [default]
packages/core2-32-poky-linux/debianutils/debianutils-src: PV changed from "5.7" to "5.8"
packages/core2-32-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.7 [default] to 5.8 [default]
packages/core2-32-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.7" to "5.8"
packages/core2-32-poky-linux/debianutils/debianutils: PKGV changed from 5.7 [default] to 5.8 [default]
packages/core2-32-poky-linux/debianutils/debianutils: PV changed from "5.7" to "5.8"
packages/core2-32-poky-linux/debianutils/debianutils: PKGSIZE changed from 47710 to 47888 (+0%)
packages/core2-32-poky-linux/debianutils: PKGV changed from 5.7 [default] to 5.8 [default]
packages/core2-32-poky-linux/debianutils: PV changed from "5.7" to "5.8"

--===============2990803038182018242==--

