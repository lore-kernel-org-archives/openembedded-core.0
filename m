Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90690C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 11:51:39 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.6019.1648727498325115896
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 04:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=asFAiLQU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id b19so33400304wrh.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 04:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=noYQ+sHnUL4rNUybrY0SNqVxDuLrfngHjeHQrIsA95w=;
        b=asFAiLQUHhBM5khDyHltRiDxplgL5tewN4QyC/LNAra5ewlvvkxl2OKDDWXdo5citL
         DOkf4Ir4RVlcpfIdOCDqjwhA8DewqiBD1I3UPWyeH2wpdx7lbm+emw/ZW8F8ugQztjL7
         jqJWF8RLAKoSWQlt98BXSQwhAzzybw4VGW2QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=noYQ+sHnUL4rNUybrY0SNqVxDuLrfngHjeHQrIsA95w=;
        b=qM0hLwzUBvK7Rj8tQpaPeR/aQ5jPXn/6ZySHxT71NrfPRaxBVZXIBpIqaAx79yhpik
         n2r8CFQUM6QGX7DkMBEWmO+XG5V1wzQiJZOYUylZ3Tn1pBuqSjpDNCEoY0f3HjGbVv8N
         WMWIIXOjhltAlfPHhj/aVdlydhgTDhXnJYJM8Wyjzg4RtjEau+cnSl55Cdb4ep+fP7za
         sEGRgfdwl9EcVwN+Anet+C80gYXQJDSfIMD5JhGoqcynhr09k7dK1D/Y7Ndj42bmLS0p
         FQ6/5BGT5IQV8ZJ639KgtfktV9nnuLD/r3vzFR42ebkS6NPuU8jrKQEBw4punpO8b84W
         ou6A==
X-Gm-Message-State: AOAM531Qm2hK3xJwE4JknbWgwL5MPw6m9jlQuiY1DwpgIjRw8xOqWhrY
	hnNuBSN6aLBsVaIkuSD2zVrUu/VwPIweY63l
X-Google-Smtp-Source: 
 ABdhPJy6aGFdECEEhwf1bO0jsdYgqDqvarAdp5r1YIxajv4l3nkOLyyu1JceaXUCDNiE3dzQJfG3hw==
X-Received: by 2002:a05:6000:1ace:b0:203:d465:1a83 with SMTP id
 i14-20020a0560001ace00b00203d4651a83mr3919841wry.26.1648727495896;
        Thu, 31 Mar 2022 04:51:35 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6605:7b3b:ef3e:a309])
        by smtp.gmail.com with ESMTPSA id
 i2-20020a05600c354200b0038cb422e3fesm7524023wmq.32.2022.03.31.04.51.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 04:51:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] initscripts: Clean up license handling/identifiers
Date: Thu, 31 Mar 2022 12:51:31 +0100
Message-Id: <20220331115131.1565450-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331115131.1565450-1-richard.purdie@linuxfoundation.org>
References: <20220331115131.1565450-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 11:51:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163812

The license is clear, add an SPDX license identification headers to the scripts
and drop the weird patch, we don't need it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../initscripts/initscripts-1.0/GPLv2.patch   | 347 ------------------
 .../initscripts/initscripts-1.0/alignment.sh  |   4 +
 .../initscripts/initscripts-1.0/banner.sh     |   4 +
 .../initscripts/initscripts-1.0/bootmisc.sh   |   4 +
 .../initscripts/initscripts-1.0/checkfs.sh    |   4 +
 .../initscripts/initscripts-1.0/checkroot.sh  |   4 +
 .../initscripts/initscripts-1.0/devpts.sh     |   4 +
 .../initscripts/initscripts-1.0/dmesg.sh      |   4 +
 .../initscripts/initscripts-1.0/functions     |   3 +
 .../initscripts/initscripts-1.0/halt          |   4 +
 .../initscripts/initscripts-1.0/hostname.sh   |   4 +
 .../initscripts/initscripts-1.0/mountall.sh   |   4 +
 .../initscripts/initscripts-1.0/mountnfs.sh   |   4 +
 .../initscripts-1.0/populate-volatile.sh      |   4 +
 .../initscripts-1.0/read-only-rootfs-hook.sh  |   3 +
 .../initscripts/initscripts-1.0/reboot        |   4 +
 .../initscripts/initscripts-1.0/rmnologin.sh  |   4 +
 .../initscripts/initscripts-1.0/save-rtc.sh   |   4 +
 .../initscripts/initscripts-1.0/sendsigs      |   4 +
 .../initscripts/initscripts-1.0/single        |   4 +
 .../initscripts/initscripts-1.0/sushell       |   3 +
 .../initscripts/initscripts-1.0/sysfs.sh      |   4 +
 .../initscripts/initscripts-1.0/umountfs      |   4 +
 .../initscripts/initscripts-1.0/umountnfs.sh  |   4 +
 .../initscripts/initscripts-1.0/urandom       |   4 +
 .../initscripts/initscripts_1.0.bb            |   3 +-
 26 files changed, 94 insertions(+), 349 deletions(-)
 delete mode 100644 meta/recipes-core/initscripts/initscripts-1.0/GPLv2.patch

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/GPLv2.patch b/meta/recipes-core/initscripts/initscripts-1.0/GPLv2.patch
deleted file mode 100644
index 1ee8181f128..00000000000
--- a/meta/recipes-core/initscripts/initscripts-1.0/GPLv2.patch
+++ /dev/null
@@ -1,347 +0,0 @@
-Upstream-Status: Inappropriate [licensing]
-
-diff --git a/COPYING b/COPYING
-new file mode 100644
-index 0000000..d511905
---- /dev/null
-+++ b/COPYING
-@@ -0,0 +1,339 @@
-+		    GNU GENERAL PUBLIC LICENSE
-+		       Version 2, June 1991
-+
-+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
-+ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-+ Everyone is permitted to copy and distribute verbatim copies
-+ of this license document, but changing it is not allowed.
-+
-+			    Preamble
-+
-+  The licenses for most software are designed to take away your
-+freedom to share and change it.  By contrast, the GNU General Public
-+License is intended to guarantee your freedom to share and change free
-+software--to make sure the software is free for all its users.  This
-+General Public License applies to most of the Free Software
-+Foundation's software and to any other program whose authors commit to
-+using it.  (Some other Free Software Foundation software is covered by
-+the GNU Lesser General Public License instead.)  You can apply it to
-+your programs, too.
-+
-+  When we speak of free software, we are referring to freedom, not
-+price.  Our General Public Licenses are designed to make sure that you
-+have the freedom to distribute copies of free software (and charge for
-+this service if you wish), that you receive source code or can get it
-+if you want it, that you can change the software or use pieces of it
-+in new free programs; and that you know you can do these things.
-+
-+  To protect your rights, we need to make restrictions that forbid
-+anyone to deny you these rights or to ask you to surrender the rights.
-+These restrictions translate to certain responsibilities for you if you
-+distribute copies of the software, or if you modify it.
-+
-+  For example, if you distribute copies of such a program, whether
-+gratis or for a fee, you must give the recipients all the rights that
-+you have.  You must make sure that they, too, receive or can get the
-+source code.  And you must show them these terms so they know their
-+rights.
-+
-+  We protect your rights with two steps: (1) copyright the software, and
-+(2) offer you this license which gives you legal permission to copy,
-+distribute and/or modify the software.
-+
-+  Also, for each author's protection and ours, we want to make certain
-+that everyone understands that there is no warranty for this free
-+software.  If the software is modified by someone else and passed on, we
-+want its recipients to know that what they have is not the original, so
-+that any problems introduced by others will not reflect on the original
-+authors' reputations.
-+
-+  Finally, any free program is threatened constantly by software
-+patents.  We wish to avoid the danger that redistributors of a free
-+program will individually obtain patent licenses, in effect making the
-+program proprietary.  To prevent this, we have made it clear that any
-+patent must be licensed for everyone's free use or not licensed at all.
-+
-+  The precise terms and conditions for copying, distribution and
-+modification follow.
-+
-+		    GNU GENERAL PUBLIC LICENSE
-+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-+
-+  0. This License applies to any program or other work which contains
-+a notice placed by the copyright holder saying it may be distributed
-+under the terms of this General Public License.  The "Program", below,
-+refers to any such program or work, and a "work based on the Program"
-+means either the Program or any derivative work under copyright law:
-+that is to say, a work containing the Program or a portion of it,
-+either verbatim or with modifications and/or translated into another
-+language.  (Hereinafter, translation is included without limitation in
-+the term "modification".)  Each licensee is addressed as "you".
-+
-+Activities other than copying, distribution and modification are not
-+covered by this License; they are outside its scope.  The act of
-+running the Program is not restricted, and the output from the Program
-+is covered only if its contents constitute a work based on the
-+Program (independent of having been made by running the Program).
-+Whether that is true depends on what the Program does.
-+
-+  1. You may copy and distribute verbatim copies of the Program's
-+source code as you receive it, in any medium, provided that you
-+conspicuously and appropriately publish on each copy an appropriate
-+copyright notice and disclaimer of warranty; keep intact all the
-+notices that refer to this License and to the absence of any warranty;
-+and give any other recipients of the Program a copy of this License
-+along with the Program.
-+
-+You may charge a fee for the physical act of transferring a copy, and
-+you may at your option offer warranty protection in exchange for a fee.
-+
-+  2. You may modify your copy or copies of the Program or any portion
-+of it, thus forming a work based on the Program, and copy and
-+distribute such modifications or work under the terms of Section 1
-+above, provided that you also meet all of these conditions:
-+
-+    a) You must cause the modified files to carry prominent notices
-+    stating that you changed the files and the date of any change.
-+
-+    b) You must cause any work that you distribute or publish, that in
-+    whole or in part contains or is derived from the Program or any
-+    part thereof, to be licensed as a whole at no charge to all third
-+    parties under the terms of this License.
-+
-+    c) If the modified program normally reads commands interactively
-+    when run, you must cause it, when started running for such
-+    interactive use in the most ordinary way, to print or display an
-+    announcement including an appropriate copyright notice and a
-+    notice that there is no warranty (or else, saying that you provide
-+    a warranty) and that users may redistribute the program under
-+    these conditions, and telling the user how to view a copy of this
-+    License.  (Exception: if the Program itself is interactive but
-+    does not normally print such an announcement, your work based on
-+    the Program is not required to print an announcement.)
-+
-+These requirements apply to the modified work as a whole.  If
-+identifiable sections of that work are not derived from the Program,
-+and can be reasonably considered independent and separate works in
-+themselves, then this License, and its terms, do not apply to those
-+sections when you distribute them as separate works.  But when you
-+distribute the same sections as part of a whole which is a work based
-+on the Program, the distribution of the whole must be on the terms of
-+this License, whose permissions for other licensees extend to the
-+entire whole, and thus to each and every part regardless of who wrote it.
-+
-+Thus, it is not the intent of this section to claim rights or contest
-+your rights to work written entirely by you; rather, the intent is to
-+exercise the right to control the distribution of derivative or
-+collective works based on the Program.
-+
-+In addition, mere aggregation of another work not based on the Program
-+with the Program (or with a work based on the Program) on a volume of
-+a storage or distribution medium does not bring the other work under
-+the scope of this License.
-+
-+  3. You may copy and distribute the Program (or a work based on it,
-+under Section 2) in object code or executable form under the terms of
-+Sections 1 and 2 above provided that you also do one of the following:
-+
-+    a) Accompany it with the complete corresponding machine-readable
-+    source code, which must be distributed under the terms of Sections
-+    1 and 2 above on a medium customarily used for software interchange; or,
-+
-+    b) Accompany it with a written offer, valid for at least three
-+    years, to give any third party, for a charge no more than your
-+    cost of physically performing source distribution, a complete
-+    machine-readable copy of the corresponding source code, to be
-+    distributed under the terms of Sections 1 and 2 above on a medium
-+    customarily used for software interchange; or,
-+
-+    c) Accompany it with the information you received as to the offer
-+    to distribute corresponding source code.  (This alternative is
-+    allowed only for noncommercial distribution and only if you
-+    received the program in object code or executable form with such
-+    an offer, in accord with Subsection b above.)
-+
-+The source code for a work means the preferred form of the work for
-+making modifications to it.  For an executable work, complete source
-+code means all the source code for all modules it contains, plus any
-+associated interface definition files, plus the scripts used to
-+control compilation and installation of the executable.  However, as a
-+special exception, the source code distributed need not include
-+anything that is normally distributed (in either source or binary
-+form) with the major components (compiler, kernel, and so on) of the
-+operating system on which the executable runs, unless that component
-+itself accompanies the executable.
-+
-+If distribution of executable or object code is made by offering
-+access to copy from a designated place, then offering equivalent
-+access to copy the source code from the same place counts as
-+distribution of the source code, even though third parties are not
-+compelled to copy the source along with the object code.
-+
-+  4. You may not copy, modify, sublicense, or distribute the Program
-+except as expressly provided under this License.  Any attempt
-+otherwise to copy, modify, sublicense or distribute the Program is
-+void, and will automatically terminate your rights under this License.
-+However, parties who have received copies, or rights, from you under
-+this License will not have their licenses terminated so long as such
-+parties remain in full compliance.
-+
-+  5. You are not required to accept this License, since you have not
-+signed it.  However, nothing else grants you permission to modify or
-+distribute the Program or its derivative works.  These actions are
-+prohibited by law if you do not accept this License.  Therefore, by
-+modifying or distributing the Program (or any work based on the
-+Program), you indicate your acceptance of this License to do so, and
-+all its terms and conditions for copying, distributing or modifying
-+the Program or works based on it.
-+
-+  6. Each time you redistribute the Program (or any work based on the
-+Program), the recipient automatically receives a license from the
-+original licensor to copy, distribute or modify the Program subject to
-+these terms and conditions.  You may not impose any further
-+restrictions on the recipients' exercise of the rights granted herein.
-+You are not responsible for enforcing compliance by third parties to
-+this License.
-+
-+  7. If, as a consequence of a court judgment or allegation of patent
-+infringement or for any other reason (not limited to patent issues),
-+conditions are imposed on you (whether by court order, agreement or
-+otherwise) that contradict the conditions of this License, they do not
-+excuse you from the conditions of this License.  If you cannot
-+distribute so as to satisfy simultaneously your obligations under this
-+License and any other pertinent obligations, then as a consequence you
-+may not distribute the Program at all.  For example, if a patent
-+license would not permit royalty-free redistribution of the Program by
-+all those who receive copies directly or indirectly through you, then
-+the only way you could satisfy both it and this License would be to
-+refrain entirely from distribution of the Program.
-+
-+If any portion of this section is held invalid or unenforceable under
-+any particular circumstance, the balance of the section is intended to
-+apply and the section as a whole is intended to apply in other
-+circumstances.
-+
-+It is not the purpose of this section to induce you to infringe any
-+patents or other property right claims or to contest validity of any
-+such claims; this section has the sole purpose of protecting the
-+integrity of the free software distribution system, which is
-+implemented by public license practices.  Many people have made
-+generous contributions to the wide range of software distributed
-+through that system in reliance on consistent application of that
-+system; it is up to the author/donor to decide if he or she is willing
-+to distribute software through any other system and a licensee cannot
-+impose that choice.
-+
-+This section is intended to make thoroughly clear what is believed to
-+be a consequence of the rest of this License.
-+
-+  8. If the distribution and/or use of the Program is restricted in
-+certain countries either by patents or by copyrighted interfaces, the
-+original copyright holder who places the Program under this License
-+may add an explicit geographical distribution limitation excluding
-+those countries, so that distribution is permitted only in or among
-+countries not thus excluded.  In such case, this License incorporates
-+the limitation as if written in the body of this License.
-+
-+  9. The Free Software Foundation may publish revised and/or new versions
-+of the General Public License from time to time.  Such new versions will
-+be similar in spirit to the present version, but may differ in detail to
-+address new problems or concerns.
-+
-+Each version is given a distinguishing version number.  If the Program
-+specifies a version number of this License which applies to it and "any
-+later version", you have the option of following the terms and conditions
-+either of that version or of any later version published by the Free
-+Software Foundation.  If the Program does not specify a version number of
-+this License, you may choose any version ever published by the Free Software
-+Foundation.
-+
-+  10. If you wish to incorporate parts of the Program into other free
-+programs whose distribution conditions are different, write to the author
-+to ask for permission.  For software which is copyrighted by the Free
-+Software Foundation, write to the Free Software Foundation; we sometimes
-+make exceptions for this.  Our decision will be guided by the two goals
-+of preserving the free status of all derivatives of our free software and
-+of promoting the sharing and reuse of software generally.
-+
-+			    NO WARRANTY
-+
-+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
-+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
-+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
-+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
-+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
-+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
-+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
-+REPAIR OR CORRECTION.
-+
-+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
-+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
-+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
-+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
-+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
-+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
-+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
-+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
-+POSSIBILITY OF SUCH DAMAGES.
-+
-+		     END OF TERMS AND CONDITIONS
-+
-+	    How to Apply These Terms to Your New Programs
-+
-+  If you develop a new program, and you want it to be of the greatest
-+possible use to the public, the best way to achieve this is to make it
-+free software which everyone can redistribute and change under these terms.
-+
-+  To do so, attach the following notices to the program.  It is safest
-+to attach them to the start of each source file to most effectively
-+convey the exclusion of warranty; and each file should have at least
-+the "copyright" line and a pointer to where the full notice is found.
-+
-+    <one line to give the program's name and a brief idea of what it does.>
-+    Copyright (C) <year>  <name of author>
-+
-+    This program is free software; you can redistribute it and/or modify
-+    it under the terms of the GNU General Public License as published by
-+    the Free Software Foundation; either version 2 of the License, or
-+    (at your option) any later version.
-+
-+    This program is distributed in the hope that it will be useful,
-+    but WITHOUT ANY WARRANTY; without even the implied warranty of
-+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+    GNU General Public License for more details.
-+
-+    You should have received a copy of the GNU General Public License along
-+    with this program; if not, write to the Free Software Foundation, Inc.,
-+    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-+
-+Also add information on how to contact you by electronic and paper mail.
-+
-+If the program is interactive, make it output a short notice like this
-+when it starts in an interactive mode:
-+
-+    Gnomovision version 69, Copyright (C) year name of author
-+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
-+    This is free software, and you are welcome to redistribute it
-+    under certain conditions; type `show c' for details.
-+
-+The hypothetical commands `show w' and `show c' should show the appropriate
-+parts of the General Public License.  Of course, the commands you use may
-+be called something other than `show w' and `show c'; they could even be
-+mouse-clicks or menu items--whatever suits your program.
-+
-+You should also get your employer (if you work as a programmer) or your
-+school, if any, to sign a "copyright disclaimer" for the program, if
-+necessary.  Here is a sample; alter the names:
-+
-+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
-+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
-+
-+  <signature of Ty Coon>, 1 April 1989
-+  Ty Coon, President of Vice
-+
-+This General Public License does not permit incorporating your program into
-+proprietary programs.  If your program is a subroutine library, you may
-+consider it more useful to permit linking proprietary applications with the
-+library.  If this is what you want to do, use the GNU Lesser General
-+Public License instead of this License.
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/alignment.sh b/meta/recipes-core/initscripts/initscripts-1.0/alignment.sh
index b577b9a03a2..f9eb9fc5ca6 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/alignment.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/alignment.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides: alignment
 # Required-Start:    mountkernfs
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/banner.sh b/meta/recipes-core/initscripts/initscripts-1.0/banner.sh
index 9e2b0912528..dd3dd9d4fc2 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/banner.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/banner.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides: banner
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index 591591f87fd..6068a8c07f6 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          bootmisc
 # Required-Start:    $local_fs mountvirtfs
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh
index 62869451b76..f7a61d8b53e 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          checkfs
 # Required-Start:    checkroot
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
index a63e71b7806..1c7057b0f11 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          checkroot
 # Required-Start:    udev
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/devpts.sh b/meta/recipes-core/initscripts/initscripts-1.0/devpts.sh
index c6043fb1e62..ad5182d3e1e 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/devpts.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/devpts.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          devpts
 # Required-Start: udev
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh b/meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh
index 2b9eba64cf2..07ee533432c 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:             dmesg
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
index 01ad1edd3e0..35aebd4a554 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/functions
+++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
@@ -3,6 +3,9 @@
 # functions     This file contains functions to be used by most or all
 #               shell scripts in the /etc/init.d directory.
 #
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 NORMAL="\\033[0;39m"         # Standard console grey
 SUCCESS="\\033[1;32m"        # Success is green
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/halt b/meta/recipes-core/initscripts/initscripts-1.0/halt
index a56f73421ba..ba967c7650f 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/halt
+++ b/meta/recipes-core/initscripts/initscripts-1.0/halt
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          halt
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh b/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
index 95287cc1392..740f75cb418 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          hostname
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
index 2839d57cbec..e87b291d4e2 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          mountall
 # Required-Start:    mountvirtfs
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
index be9f5970fa7..c08597e725a 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          mountnfs
 # Required-Start:    $local_fs $network $rpcbind
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index b56b72f8334..bc630e871c1 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:             volatile
 # Required-Start:       $local_fs
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
index bd445ddb070..6706a117f75 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -1,4 +1,7 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 . /etc/default/rcS
 
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/reboot b/meta/recipes-core/initscripts/initscripts-1.0/reboot
index 087d8d5da46..91e3972ed9c 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/reboot
+++ b/meta/recipes-core/initscripts/initscripts-1.0/reboot
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          reboot
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh b/meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh
index 76de3418acc..0bbaee7a9da 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          rmnologin
 # Required-Start:    $remote_fs $all
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
index ffa1eee43df..e1e39345b7b 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          save-rtc
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sendsigs b/meta/recipes-core/initscripts/initscripts-1.0/sendsigs
index 34e1b7714bb..15dd4bb76f8 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/sendsigs
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sendsigs
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          sendsigs
 # Required-Start:    
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/single b/meta/recipes-core/initscripts/initscripts-1.0/single
index da82d178a17..1172584170f 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/single
+++ b/meta/recipes-core/initscripts/initscripts-1.0/single
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          single
 # Required-Start:    $local_fs $all killprocs
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sushell b/meta/recipes-core/initscripts/initscripts-1.0/sushell
index c319d95bf74..511291db852 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/sushell
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sushell
@@ -1,4 +1,7 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 [ -z "$SUSHELL" ] && SUSHELL=/bin/sh
 
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
index 4871ee94e56..da9ad485c10 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          mountvirtfs
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/umountfs b/meta/recipes-core/initscripts/initscripts-1.0/umountfs
index 7fb5c58b3e9..a8691e570f7 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/umountfs
+++ b/meta/recipes-core/initscripts/initscripts-1.0/umountfs
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          umountfs
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh
index af075407fd4..b91fa05eede 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          umountnfs
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/urandom b/meta/recipes-core/initscripts/initscripts-1.0/urandom
index af1625b5fde..7be92d3b0a0 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/urandom
+++ b/meta/recipes-core/initscripts/initscripts-1.0/urandom
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 ### BEGIN INIT INFO
 # Provides:          urandom
 # Required-Start:    $local_fs mountvirtfs
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 9429e5881df..2244d1b2923 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fedora-sysv/initscripts"
 DESCRIPTION = "Initscripts provide the basic system startup initialization scripts for the system.  These scripts include actions such as filesystem mounting, fsck, RTC manipulation and other actions routinely performed at system startup.  In addition, the scripts are also used during system shutdown to reverse the actions performed at startup."
 SECTION = "base"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://functions;beginline=7;endline=7;md5=829e563511c9a1d6d41f17a7a4989d6a"
 PR = "r155"
 
 INHIBIT_DEFAULT_DEPS = "1"
@@ -31,7 +31,6 @@ SRC_URI = "file://functions \
            file://read-only-rootfs-hook.sh \
            file://volatiles \
            file://save-rtc.sh \
-           file://GPLv2.patch \
            file://dmesg.sh \
            file://logrotate-dmesg.conf \
            ${@bb.utils.contains('DISTRO_FEATURES','selinux','file://sushell','',d)} \
-- 
2.32.0


