Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E260D7867E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 15:55:16 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id p75so3633909wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 07:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EPsj/o4DfJkqOjqUHj7iNXK4S35S9fBFVNiXqcOpCps=;
	b=g3xh+xZlxWr4FpXmav2n53B16emD2wMMhSZC56mXvuNUz8BKFKMT0HwS5kgTTes6+h
	EiwK7ME6y2T8SjyhxKcV91tAPZm1cZZKHIx43+rhHQI3jwANVW1njvlhwowPDOjzlOMY
	wWdDHGHYzutQODE8hJpzr8aTmvVoBJLZEbUHbtFOZhTD5TiJpSbseG4aaCxTWKoHCz3k
	/RBtOZQhILwKXc6/iyMd4SS0p7moAE4Duuz7dVqTzxapkNM+4sL/TyK6Ua3kptumQpes
	ZK8FQzG7cA1eO54fi3EkyUx5LQnRSRcNkiXr0DzgIIkeMdZ9+XW0BoxL3PxRxFwTam33
	8AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EPsj/o4DfJkqOjqUHj7iNXK4S35S9fBFVNiXqcOpCps=;
	b=APzIkgFj83N6JkD8g+uE1g6vbyJXLI18tR7dg70TtG3gi2LXoHi+Uan3qm/hRjfh5u
	2emj1FebG0jb92E4MpIBo9P+tI5yFdKxGUTnLpscvdNznUzqmHXku9hZwgsuQLdoVwOT
	E5+jY3sdaHy4v2uAiJ4F4fBXf4vjFHnai7J0sibtn5FUhSh24RRv86kpyXKWwaEDoi6x
	4n9fXlv6tDd++n0JYZy2sXxiiML+2VknQ1a+Gn9W3C3VAYO6M1T6TWvhGVuG4lvVSSoy
	4lvaH1EQTYvKGil5PB+iNWfWhqXOPixC6xwO+3YFAQnKyaF9dH9i8N78uRE9b6Q0a6LA
	Ii6A==
X-Gm-Message-State: AJaThX5gyAPus/wHNjD/b5BQv202pIRV0qceki1P9qfHzntGttBUjN+z
	xrAnOQTWQd6WCgMR9lTynm6PXnB4
X-Google-Smtp-Source: AGs4zMaxYyu+L54pFbFXfXZ71obEkjzbInvAWP0YcXQTha6AFpUXnzU4boDNaslEZxEdw5etQe0doQ==
X-Received: by 10.28.13.15 with SMTP id 15mr592404wmn.72.1510329316039;
	Fri, 10 Nov 2017 07:55:16 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o8sm26095069wrc.10.2017.11.10.07.55.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Nov 2017 07:55:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2017 15:55:10 +0000
Message-Id: <20171110155510.26427-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171110155510.26427-1-ross.burton@intel.com>
References: <20171110155510.26427-1-ross.burton@intel.com>
Subject: [PATCH 2/2] hostap-utils: remove obsolete driver
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Nov 2017 15:55:17 -0000

HostAP is the user-space part of the Intersil Prism 2/2.5/3 wifi chipset.  It's
also a decade old and obsolete, so remove it from oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/distro_alias.inc          |   1 -
 meta/conf/distro/include/maintainers.inc           |   2 -
 meta/recipes-bsp/hostap/files/COPYING.patch        | 346 ---------------------
 meta/recipes-bsp/hostap/files/hostap-fw-load.patch |  22 --
 meta/recipes-bsp/hostap/files/hostap_cs.conf       | 193 ------------
 .../hostap/files/hostap_cs.conf-upstream           | 191 ------------
 meta/recipes-bsp/hostap/files/hostap_cs.modalias   |  28 --
 meta/recipes-bsp/hostap/hostap-conf_1.0.bb         |  23 --
 ...-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch |  36 ---
 .../hostap/hostap-utils-0.4.7/ldflags.patch        |  27 --
 meta/recipes-bsp/hostap/hostap-utils.inc           |  27 --
 meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb      |   5 -
 12 files changed, 901 deletions(-)
 delete mode 100644 meta/recipes-bsp/hostap/files/COPYING.patch
 delete mode 100644 meta/recipes-bsp/hostap/files/hostap-fw-load.patch
 delete mode 100644 meta/recipes-bsp/hostap/files/hostap_cs.conf
 delete mode 100644 meta/recipes-bsp/hostap/files/hostap_cs.conf-upstream
 delete mode 100644 meta/recipes-bsp/hostap/files/hostap_cs.modalias
 delete mode 100644 meta/recipes-bsp/hostap/hostap-conf_1.0.bb
 delete mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
 delete mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
 delete mode 100644 meta/recipes-bsp/hostap/hostap-utils.inc
 delete mode 100644 meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 3b0411c3547..1a217daa390 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -138,7 +138,6 @@ DISTRO_PN_ALIAS_pn-gtk-sato-engine = "OpenedHand"
 DISTRO_PN_ALIAS_pn-gtk-icon-utils-native = "OSPDT"
 DISTRO_PN_ALIAS_pn-systemd-boot = "Ubuntu=systemd-boot Fedora=systemd-boot"
 DISTRO_PN_ALIAS_pn-hello-mod = "OE-Core"
-DISTRO_PN_ALIAS_pn-hostap-conf = "OE-Core"
 DISTRO_PN_ALIAS_pn-hwlatdetect = "OSPDT"
 DISTRO_PN_ALIAS_pn-icecc-create-env = "OE-Core"
 DISTRO_PN_ALIAS_pn-init-ifupdown = "Debian=ifupdown Ubuntu=ifupdown"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 38789b217cd..856a6b763bf 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -262,8 +262,6 @@ RECIPE_MAINTAINER_pn-harfbuzz = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-hdparm = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-help2man-native = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
-RECIPE_MAINTAINER_pn-hostap-conf = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-hostap-utils = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-hwlatdetect = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-i2c-tools = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-icecc-create-env-native = "Alexander Kanavin <alexander.kanavin@intel.com>"
diff --git a/meta/recipes-bsp/hostap/files/COPYING.patch b/meta/recipes-bsp/hostap/files/COPYING.patch
deleted file mode 100644
index 05c70c92e5d..00000000000
--- a/meta/recipes-bsp/hostap/files/COPYING.patch
+++ /dev/null
@@ -1,346 +0,0 @@
-Upstream-Status: Inappropriate [other]
-
-diff -ruN hostap-conf-1.0-orig/COPYING hostap-conf-1.0/COPYING
---- hostap-conf-1.0-orig/COPYING	1970-01-01 08:00:00.000000000 +0800
-+++ hostap-conf-1.0/COPYING	2010-12-09 16:36:48.000000000 +0800
-@@ -0,0 +1,340 @@
-+		    GNU GENERAL PUBLIC LICENSE
-+		       Version 2, June 1991
-+
-+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
-+                       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
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
-+the GNU Library General Public License instead.)  You can apply it to
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
-+    You should have received a copy of the GNU General Public License
-+    along with this program; if not, write to the Free Software
-+    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-+
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
-+library.  If this is what you want to do, use the GNU Library General
-+Public License instead of this License.
diff --git a/meta/recipes-bsp/hostap/files/hostap-fw-load.patch b/meta/recipes-bsp/hostap/files/hostap-fw-load.patch
deleted file mode 100644
index 050bdc113c4..00000000000
--- a/meta/recipes-bsp/hostap/files/hostap-fw-load.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
-Upstream-Status: Inappropriate [configuration]
-
---- hostap-utils-0.2.4/hostap_fw_load~hostap-fw-load
-+++ hostap-utils-0.2.4/hostap_fw_load
-@@ -6,9 +6,9 @@
- # Firmware images for the card
- # TODO: could try to select correct firmware type automatically
- 
--PRI=/etc/pcmcia/PM010102.HEX
--STA=/etc/pcmcia/RF010802.HEX
--PRISM2_SREC=/usr/local/bin/prism2_srec
-+PRI=/etc/pcmcia/pm010102.hex
-+STA=/etc/pcmcia/rf010804.hex
-+PRISM2_SREC=/usr/sbin/prism2_srec
- 
- set -e
- 
diff --git a/meta/recipes-bsp/hostap/files/hostap_cs.conf b/meta/recipes-bsp/hostap/files/hostap_cs.conf
deleted file mode 100644
index 8dda82aad35..00000000000
--- a/meta/recipes-bsp/hostap/files/hostap_cs.conf
+++ /dev/null
@@ -1,193 +0,0 @@
-module "hostap_cs" opts "channel=3 iw_mode=2 essid=any ignore_cis_vcc=1"
-
-card "Actiontec 802CI2"
-  manfid 0x1668, 0x0101
-  bind "hostap_cs"
-
-card "AirWay 802.11 Adapter (PCMCIA)"
-  #version "AirWay", "802.11 Adapter (PCMCIA)"
-  manfid 0x0261, 0x0002
-  bind "hostap_cs"
-
-card "Asus SpaceLink WL110"
-   manfid 0x02aa,0x0002
-   bind "hostap_cs"
-
-## handhelds.org bug 964
-card "Belkin F5D6060 Ethernet"
-   #version "PCMCIA", "11M WLAN Card v2.5", "ISL37300P", "RevA"
-   manfid 0x0274, 0x1612
-   bind "hostap_cs"
-
-card "Compaq 11Mbps Wireless PC Card"
-  manfid 0x028a, 0x0002
-  bind "hostap_cs"
-
-card "Compaq WL100 11 Mbps Wireless Adapter"
-  manfid 0x0138, 0x0002
-  bind "hostap_cs"
-
-card "Compaq HNW-100 11 Mbps Wireless Adapter"
-  manfid 0x028a, 0x0002
-  bind "hostap_cs"
-
-card "D-Link DWL-650"
-  version "D", "Link DWL-650 11Mbps WLAN Card"
-  bind "hostap_cs"
-
-card "D-Link DRC-650"
-  version "D", "Link DRC-650 11Mbps WLAN Card"
-  bind "hostap_cs"
-
-card "D-Link DCF660"
-  manfid 0xd601, 0x0005
-  bind "hostap_cs"
-
-card "Farallon SkyLINE"
-  version "INTERSIL", "HFA384x/IEEE"
-  bind "hostap_cs"
-
-card "HyperLink Wireless PC Card 11Mbps"
-  version "HyperLink", "Wireless PC Card 11Mbps"
-  bind "hostap_cs"
-
-# card "Intersil PRISM2 11 Mbps Wireless Adapter"
-#   manfid 0x0156, 0x0002
-#  bind "hostap_cs"
-
-card "LA4111 Spectrum24 Wireless LAN PC Card"
-  version "Symbol Technologies"
-  bind "hostap_cs"
-
-card "Linksys WPC11 11Mbps 802.11b WLAN Card"
-  version "Instant Wireless ", " Network PC CARD", "Version 01.02"
-  bind "hostap_cs"
-
-card "Linksys WCF11 11Mbps 802.11b WLAN Card"
-   manfid 0x0274, 0x3301                                   
-   bind "hostap_cs" 
-
-## handhelds.org bug #790
-card "Linksys Wireless CompactFlash Card WCF12"
-  manfid 0x028a, 0x0673
-  bind "hostap_cs"
-
-card "Linksys WLAN CF Card"
-  manfid 0x0274, 0x3301
-  bind "hostap_cs"
-
-card "NETGEAR MA701 Wireless CF Card"
-  manfid 0xd601, 0x0002
-  bind "hostap_cs"
-
-card "Nortel Networks eMobility 802.11 Wireless Adapter"
-  manfid 0x01eb, 0x080a
-  bind "hostap_cs"
-
-card "PLANEX GeoWave GW-CF110"
-  version "PLANEX", "GeoWave/GW-CF110"
-  bind "hostap_cs"
-
-card "PROXIM LAN PC CARD HARMONY 80211B"
-  version "PROXIM", "LAN PC CARD HARMONY 80211B"
-  bind "hostap_cs"
-
-card "Proxim RangeLAN/DS"
-  version "PROXIM","RangeLAN-DS/LAN PC CARD"
-  manfid 0x0126, 0x8000
-  bind "hostap_cs"
-
-card "Safeway 802.11b Wireless Adapter"
-  manfid 0xd601, 0x0002
-  bind "hostap_cs"
-
-card "SAMSUNG 11Mbps WLAN Card"
-  version "SAMSUNG", "11Mbps WLAN Card"
-  bind "hostap_cs"
-
-# needs firmware upload via hostap_fw_load
-card "SanDisk ConnectPlus OEM (0MB)"
-   manfid 0xd601, 0x0010
-   bind "hostap_cs"
-
-# needs special activation (>=hostap 0.3.2 only) plus firmware upload
-card "SanDisk ConnectPlus w/ Memory"
-   version "SanDisk", "ConnectPlus"
-   manfid 0xd601, 0x0101
-   bind "hostap_cs" to 0
-#   bind "ide-cs" to 1
-
-card "Senao/Origo 80211b WLAN Card"
-   manfid 0x000b,0x7100
-   bind "hostap_cs"
-
-card "Sitecom WL-007 WLAN CF Card"
-  manfid 0xd601, 0x0004
-  bind "hostap_cs"
-
-card "SMC2632 802.11 (prism2) Card"
-  version "SMC", "SMC2632W", "Version 01.02", ""
-  bind "hostap_cs"
-
-card "SpeedStream SS1021 Wireless Adapter"
-  #version "Siemens", "SpeedStream Wireless PCMCIA"
-  manfid 0x02ac, 0x0002
-  bind "hostap_cs"
-
-card "ZCOMAX AirRunner/XI-300"
-  #version "ZCOMAX", "AirRunner/XI-300"
-  manfid 0xd601, 0x0002
-  bind "hostap_cs"
-
-card "Zonet ZCF1100"
-  manfid 0x000b, 0x7100
-  bind "hostap_cs"
-  
-card "Wireless LAN Adapter Version 01.02"
-   version "Wireless", "LAN Adapter", "Version 01.02"
-#   manfid 0x0156, 0x0002
-   bind "hostap_cs"
-
-card "Ambicom WL1100C 11Mbs Card 802.11b"
-  version "AmbiCom", "WL1100C 802.11b CF-Card", "2.2"
-  manfid 0xd601,0x0002
-  bind "hostap_cs"
-
-card "Ambicom WL1100C 11Mbs Card 802.11b"
-  manfid 0xd601,0x0002
-  bind "hostap_cs"
-
-card "Sandisk Connect SDWCFB-000"
-  manfid 0xd601,0x0005
-  bind "hostap_cs"
-
-# Cards with Intersil firmware (Prism chipset)
-
-card "Linksys WPC11 11Mbps 802.11b WLAN Card"
-  version "The Linksys Group, Inc.", "Instant Wireless Network PC Card", "ISL37300P", "RevA"
-  bind "hostap_cs"
-
-card "Linksys CompactFlash Wireless Card"
-  version "Linksys", "Wireless CompactFlash Card"
-  bind "hostap_cs"
-
-card "ACTIONTEC PRISM Wireless LAN PC Card"
-  version "ACTIONTEC", "PRISM Wireless LAN PC Card"
-  bind "hostap_cs"
-
-card "Linksys WPC11 Version 3"
-  manfid 0x0274,0x1613
-  bind "hostap_cs"
-
-card "BENQ AWL100"
-  version "BENQ", "AWL100 PCMCIA ADAPTER"
-  bind "hostap_cs"
-
-card "Pretec WLAN"
-  version "Pretec", "CompactWLAN Card 802.11b", "2.5"
-  manfid 0x0156, 0x0002
-  bind "hostap_cs"
-
-card "TrendNet TEW PC16"
-  manfid 0x0274, 0x1601
-  bind "hostap_cs"
diff --git a/meta/recipes-bsp/hostap/files/hostap_cs.conf-upstream b/meta/recipes-bsp/hostap/files/hostap_cs.conf-upstream
deleted file mode 100644
index 5b7385a7cbb..00000000000
--- a/meta/recipes-bsp/hostap/files/hostap_cs.conf-upstream
+++ /dev/null
@@ -1,191 +0,0 @@
-device "hostap_cs"
-   class "network" module "hostap", "hostap_cs"
-
-card "Intersil PRISM2 Reference Design 11Mb/s WLAN Card"
-   version "INTERSIL", "HFA384x/IEEE"
-   bind "hostap_cs"
-
-card "Compaq WL100 11Mb/s WLAN Card"
-   manfid 0x0138, 0x0002
-   bind "hostap_cs"
-
-card "Compaq WL200"
-   version "Compaq", "WL200_11Mbps_Wireless_PCI_Card"
-   bind "hostap_cs"
-
-card "EMTAC A2424i 11Mbps WLAN Card"
-   manfid 0xc250, 0x0002
-#   cis "cis/Emtac.dat"
-   bind "hostap_cs"
-
-card "Linksys WPC11 11Mbps WLAN Card"
-   version "Instant Wireless ", " Network PC CARD", "Version 01.02"
-   bind "hostap_cs"
-
-card "Linksys WPC11 Ver 2.5 11Mbps WLAN Card"
-   manfid 0x0274, 0x1612
-   bind "hostap_cs"
-
-card "Linksys WPC11 Ver 3 11Mbps WLAN Card"
-   manfid 0x0274, 0x1613
-   bind "hostap_cs"
-
-card "Linksys WCF12 Wireless CompactFlash Card"
-   version "Linksys", "Wireless CompactFlash Card"
-   bind "hostap_cs"
-
-card "D-Link DWL-650 11Mbps WLAN Card"
-   version "D", "Link DWL-650 11Mbps WLAN Card", "Version 01.02"
-   bind "hostap_cs"
-
-card "D-Link DRC-650 11Mbps WLAN Card"
-#  version "D", "Link DRC-650 11Mbps WLAN Card", "Version 01.02"
-   manfid 0x028a, 0x0002
-   bind "hostap_cs"
-
-card "ZoomAir 4100 11Mb/s WLAN Card"
-   version "ZoomAir 11Mbps High", "Rate wireless Networking"
-   bind "hostap_cs"
-
-card "Addtron AWP-100 11Mbps WLAN Card"
-   version "Addtron", "AWP-100 Wireless PCMCIA", "Version 01.02"
-   bind "hostap_cs"
-
-card "Samsung SWL2000-N 11Mb/s WLAN Card"
-   manfid 0x0250, 0x0002
-   bind "hostap_cs"
-
-card "SMC 2632W 11Mbps WLAN Card"
-   version "SMC", "SMC2632W", "Version 01.02"
-   bind "hostap_cs"
-
-card "BroMax Freeport 11Mbps WLAN Card"
-   version "Intersil", "PRISM 2_5 PCMCIA ADAPTER", "ISL37300P", "Eval-RevA"
-   bind "hostap_cs"
-
-card "Z-Com XI300 11Mb/s WLAN Card"
-   manfid 0xd601, 0x0002
-   bind "hostap_cs"
-
-card "Zcomax XI-325H 200mW"
-#   version " ", "IEEE 802.11 Wireless LAN/PC Card"
-   manfid 0xd601, 0x0005
-   bind "hostap_cs"
-
-card "3Com AirConnect PCI 777A"
-   manfid 0x0101, 0x0777
-   bind "hostap_cs"
-
-card "U.S. Robotics IEEE 802.11b PC-CARD"
-   version "U.S. Robotics", "IEEE 802.11b PC-CARD", "Version 01.02"
-#   manfid 0x0156, 0x0002
-   bind "hostap_cs"
-
-card "Longshine LCR-8531 11Mbps WLAN PCMCIA CARD"
-   version "OEM", "PRISM2 IEEE 802.11 PC-Card", "Version 01.02"
-#   manfid 0x0156, 0x0002
-   bind "hostap_cs"
-
-card "Philips 802.11b WLAN PCMCIA"
-   manfid 0x000b, 0x7300
-   bind "hostap_cs"
-
-card "Proxim RangeLAN"
-#   version "PROXIM", "RangeLAN-DS/LAN PC CARD"
-   manfid 0x0126, 0x8000
-   bind "hostap_cs"
-
-card "Buffalo WLI-CF-S11G"
-   version "BUFFALO", "WLI-CF-S11G"
-#  manfid 0x026f, 0x030b
-   bind "hostap_cs"
-
-card "Level-One WPC-0100"
-   version "Digital Data Communications", "WPC-0100", "Version 00.00"
-   manfid 0x0156, 0x0002
-   bind "hostap_cs"
-
-card "Belkin 802.11b WLAN PCMCIA"
-   version "Belkin", "11Mbps Wireless Notebook Network Adapter", "Version 01.02"
-   manfid 0x0156, 0x0002
-   bind "hostap_cs"
-
-card "Senao SL-2011CD/SL-2011CDPLUS"
-   version "INTERSIL", "HFA384x/IEEE", "Version 01.02"
-   manfid 0x0156, 0x0002
-   bind "hostap_cs"
-
-card "Fulbond Airbond XI-300B"
-   version " ", "IEEE 802.11 Wireless LAN/PC Card"
-   manfid 0xd601, 0x0002
-   bind "hostap_cs"
-
-card "Netgear MA401"
-   version "NETGEAR MA401 Wireless PC", "Card", "Version 01.00"
-#   manfid 0x0156, 0x0002
-   bind "hostap_cs"
-
-card "D-Link DWL-650 Rev. P1"
-   version "D-Link", "DWL-650 Wireless PC Card RevP", "ISL37101P-10", "A3"
-#   manfid 0x000b, 0x7110
-   bind "hostap_cs"
-
-card "SonicWALL Long Range Wireless Card"
-   version "SonicWALL", "Long Range Wireless Card", "ISL37100P", "1.0"
-   manfid 0x000b, 0x7100
-   bind "hostap_cs"
-
-card "Senao NL-2011CD PLUS Ext2 Mercury"
-   version "WLAN", "11Mbps_PC-Card_3.0", "ISL37100P", "Eval-RevA"
-   manfid 0x000b, 0x7100
-   bind "hostap_cs"
-
-card "Airvast WL100"
-   version "AIRVAST", "IEEE 802.11b Wireless PCMCIA Card", "HFA3863"
-   manfid 0x50c2, 0x0001
-   bind "hostap_cs"
-
-card "Microsoft Wireless Notebook Adapter MN-520 1.0.3"
-   version "Microsoft", "Wireless Notebook Adapter MN-520", "", "1.0.3"
-   manfid 0x02d2, 0x0001
-   bind "hostap_cs"
-
-card "NETGEAR MA401RA"
-   version "NETGEAR MA401RA Wireless PC", "Card", "ISL37300P", "Eval-RevA"
-   manfid 0x000b, 0x7300
-   bind "hostap_cs"
-
-card "Allied Telesyn AT-WCL452"
-   version "Allied Telesyn", "AT-WCL452 Wireless PCMCIA Radio", "Ver. 1.00"
-   manfid 0xc00f, 0x0000
-   bind "hostap_cs"
-
-card "corega WL PCCL-11"
-   version "corega", "WL PCCL-11", "ISL37300P", "RevA"
-   manfid 0xc00f, 0x0000
-   bind "hostap_cs"
-
-card "SanDisk ConnectPlus"
-   version "SanDisk", "ConnectPlus"
-   manfid 0xd601, 0x0101
-   bind "hostap_cs" to 0
-   bind "ide-cs" to 1
-
-card "ASUS WL-100 8011b WLAN PC Card"
-   version "ASUS", "802_11b_PC_CARD_25", "Version 01.00"
-   manfid 0x02aa, 0x0002
-   bind "hostap_cs"
-
-card "ZyXel Zyair B-101 802.11b WLAN card"
-   version " ", "IEEE 802.11 Wireless LAN/PC Card"
-   manfid 0xd601, 0x0010
-   bind "hostap_cs"
-
-card "WLAN PRISM PCMCIA CARD 37300P RevB6"
-   version "WLAN", "PRISM PCMCIA CARD", "37300P", "Revision B6"
-   manfid 0x50c2, 0x7300
-   bind "hostap_cs"
-
-
-# Optional configuration parameters for hostap_cs.o
-# module "hostap_cs" opts "channel=3 iw_mode=3 essid=test ignore_cis_vcc=0"
diff --git a/meta/recipes-bsp/hostap/files/hostap_cs.modalias b/meta/recipes-bsp/hostap/files/hostap_cs.modalias
deleted file mode 100644
index 28483515103..00000000000
--- a/meta/recipes-bsp/hostap/files/hostap_cs.modalias
+++ /dev/null
@@ -1,28 +0,0 @@
-# product info: "Pretec", "CompactWLAN Card 802.11b", "2.5"
-alias pcmcia:m0156c0002f06fn00pfn00pa1CADD3E5pbE697636Cpc7A5BFCF1pd00000000 hostap_cs
-
-# manufacturer ID which exist in orinoco_cs AND in hostap_cs
-alias pcmcia:m000Bc7100f06fn00pfn00pa*pb*pc*pd* hostap_cs
-alias pcmcia:m000Bc7300f06fn00pfn00pa*pb*pc*pd* hostap_cs
-alias pcmcia:m0126c8000f06fn00pfn00pa*pb*pc*pd* hostap_cs
-alias pcmcia:m0138c0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
-alias pcmcia:m0250c0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
-alias pcmcia:m0274c1612f06fn00pfn00pa*pb*pc*pd* hostap_cs
-alias pcmcia:m0274c1613f06fn00pfn00pa*pb*pc*pd* hostap_cs
-alias pcmcia:m028Ac0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
-alias pcmcia:m02AAc0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
-alias pcmcia:m50C2c7300f06fn00pfn00pa*pb*pc*pd* hostap_cs
-alias pcmcia:mD601c0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
-alias pcmcia:mD601c0005f06fn00pfn00pa*pb*pc*pd* hostap_cs
-
-# product info: "Linksys", "Wireless CompactFlash Card", "", ""
-alias pcmcia:m028Ac0673f06fn00pfn00pa0733CC81pb0C52F395pc00000000pd00000000 hostap_cs
-
-# product info:"PLANEX COMMUNICATION INC","PLANEX GW-CF11X Wireless CF Card", "", ""
-alias pcmcia:mD601c0010f06fn00pfn00pa4703CF68pbFAD7318Dpc00000000pd00000000 hostap_cs
-
-# 0x0156, 0x0002 and "Version 01.02" only appear for Prism based cards.
-alias pcmcia:m0156c0002f06fn00pfn00pa*pb*pc4B74BAA0pd00000000 hostap_cs
-
-# "BUFFALO", "WLI-CF-S11G", "", ""
-alias pcmcia:m026Fc030Bf06fn00pfn00pa2DECECE3pb82067C18pc00000000pd00000000 hostap_cs
diff --git a/meta/recipes-bsp/hostap/hostap-conf_1.0.bb b/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
deleted file mode 100644
index e1d4c5477cb..00000000000
--- a/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Configuration files for HostAP (wifi) driver"
-DESCRIPTION = "PCMCIA-cs configuration files for wireless LAN cards based on Intersil's Prism2/2.5/3 chipset."
-SECTION = "kernel/modules"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-PR = "r15"
-
-SRC_URI = "file://hostap_cs.modalias \
-           file://COPYING.patch"
-
-inherit allarch
-
-S = "${WORKDIR}"
-
-do_compile() {
-}
-
-do_install() {
-	install -d ${D}${sysconfdir}/modprobe.d
-
-	install -m 0644 ${WORKDIR}/hostap_cs.modalias ${D}${sysconfdir}/modprobe.d/hostap_cs.conf
-}
-
diff --git a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
deleted file mode 100644
index b44dca3ec8b..00000000000
--- a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 742fb110d9841a04b3ced256b0bf80ff304dcaff Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 31 Aug 2015 05:45:08 +0000
-Subject: [PATCH] Define _u32/__s32/__u16/__s16/__u8 in terms of c99 types
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- wireless_copy.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/wireless_copy.h b/wireless_copy.h
-index 8208258..1171a35 100644
---- a/wireless_copy.h
-+++ b/wireless_copy.h
-@@ -86,11 +86,11 @@
- #else
- #include <sys/types.h>
- #include <net/if.h>
--typedef __uint32_t __u32;
--typedef __int32_t __s32;
--typedef __uint16_t __u16;
--typedef __int16_t __s16;
--typedef __uint8_t __u8;
-+typedef u_int32_t __u32;
-+typedef int32_t __s32;
-+typedef u_int16_t __u16;
-+typedef int16_t __s16;
-+typedef u_int8_t __u8;
- #ifndef __user
- #define __user
- #endif /* __user */
--- 
-2.5.1
-
diff --git a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
deleted file mode 100644
index 3e99d0d92e3..00000000000
--- a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Obey LDFLAGS
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-Status: Pending
-
---- hostap-utils-0.4.7.orig/Makefile
-+++ hostap-utils-0.4.7/Makefile
-@@ -14,17 +14,17 @@ prism2_srec.o: prism2_srec.c util.h
- hostap_crypt_conf: hostap_crypt_conf.c
-
- hostap_diag: hostap_diag.o util.o
--	$(CC) -o hostap_diag $(CFLAGS) hostap_diag.o util.o
-+	$(CC) -o hostap_diag $(CFLAGS) $(LDFLAGS) hostap_diag.o util.o
-
- hostap_diag.o: hostap_diag.c util.h
-
- util.o: util.c util.h
-
- hostap_io_debug: hostap_io_debug.c
--	$(CC) -o hostap_io_debug $(CFLAGS) hostap_io_debug.c
-+	$(CC) -o hostap_io_debug $(CFLAGS) $(LDFLAGS) hostap_io_debug.c
-
- hostap_rid: hostap_rid.o util.o
--	$(CC) -o hostap_rid $(CFLAGS) hostap_rid.o util.o
-+	$(CC) -o hostap_rid $(CFLAGS) $(LDFLAGS) hostap_rid.o util.o
-
- hostap_rid.o: hostap_rid.c util.h
diff --git a/meta/recipes-bsp/hostap/hostap-utils.inc b/meta/recipes-bsp/hostap/hostap-utils.inc
deleted file mode 100644
index 6d98e3a888b..00000000000
--- a/meta/recipes-bsp/hostap/hostap-utils.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "User mode helpers for the hostap driver"
-DESCRIPTION = "The hostap driver supports Host AP mode, it allows for IEEE 802.11 \
-management functions on the host computer and allows the system to act as an access point."
-HOMEPAGE = "https://w1.fi"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-			file://util.c;beginline=1;endline=9;md5=d3b9280851302e5ba34e5fb717489b6d"
-SECTION = "kernel/userland"
-PR = "r4"
-
-SRC_URI = "https://w1.fi/releases/hostap-utils-${PV}.tar.gz \
-           file://hostap-fw-load.patch \
-           file://0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch \
-"
-S = "${WORKDIR}/hostap-utils-${PV}"
-
-BINARIES = "hostap_crypt_conf hostap_diag hostap_fw_load hostap_io_debug \
-	    hostap_rid prism2_param prism2_srec split_combined_hex"
-
-do_install() {
-	install -d ${D}${sbindir}/
-	for f in ${BINARIES}
-	do
-		install -m 0755 $f ${D}${sbindir}/
-	done
-}
-
diff --git a/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb b/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb
deleted file mode 100644
index be5481f6f7b..00000000000
--- a/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require hostap-utils.inc
-
-SRC_URI += "file://ldflags.patch"
-SRC_URI[md5sum] = "afe041581b8f01666e353bec20917c85"
-SRC_URI[sha256sum] = "c6f598d8e356c1620fa009eca0a700bf1105e16817eefd77d891994261009355"
-- 
2.11.0


