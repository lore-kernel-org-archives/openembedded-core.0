Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B604AD4663D
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1428.1768526743617480580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EhdB7y9W;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CeIJcvp7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019bc46883f0-d0777ef8-c2d2-459d-a702-3dbd3cf76302-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8J5GNW3bVXC/rcmIZqw0fkCNh6DoZZFB3XPgWarAKOc=;
	b=EhdB7y9Wp0R0S98xLJavRiSJbF0Ae0ZoxlzxveOvuMRdPvWU64n2KgAIOXhQ/4SM
	IvtP8Pw2Ceim4PbPbLRURYPYm7vOykGYokUIzxV8ZkpRTRr9uQStNp3lI88VKPKBdHs
	ci1cPjjLLqCtq+6x/+8rtxM/Vr8jpys7HKI14w/g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8J5GNW3bVXC/rcmIZqw0fkCNh6DoZZFB3XPgWarAKOc=;
	b=CeIJcvp797gxahZ9SJt89QlTU+2eYAr/rJp9nCCCcQHf7wbOzeLJnIA4ycD/5vr3
	/eFIJDbbqzQojOLgWYS+jLBqXKES2+KEmfbuOcbXlf4PZc4dupdfeKJzfbkM+aAKqR1
	KomEcL1Ca/ArEbI/M68D8tC2u7TtaWe4ba5p9yvA=
Content-Type: multipart/mixed; boundary="===============9151690818116220353=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ifupdown: upgrading to 0.8.45. SUCCEEDED
Message-ID: <0101019bc46883f0-d0777ef8-c2d2-459d-a702-3dbd3cf76302-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229452

--===============9151690818116220353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ifupdown* to *0.8.45.* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ifupdown-upgrade-0.8.44-0.8.45.patch
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
From a09a576f8f0f55d7489c44fb80e149a3c3e9a9f2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 20:06:53 +0000
Subject: [PATCH] ifupdown: upgrade 0.8.44 -> 0.8.45.

---
 .../0001-Define-FNM_EXTMATCH-for-musl.patch   |   2 +-
 ...not-use-dpkg-for-determining-OS-type.patch |   2 +-
 .../0001-ifupdown-skip-wrong-test-case.patch  |   2 +-
 ...t-rely-on-dpkg-architecture-to-set-a.patch |   2 +-
 .../ifupdown/files/tweak-ptest-script.patch   |   2 +-
 ...ifupdown_0.8.44.bb => ifupdown_0.8.45..bb} | 141 +++++++++++++++++-
 6 files changed, 144 insertions(+), 7 deletions(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.44.bb => ifupdown_0.8.45..bb} (25%)

diff --git a/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
index 83fb706be0..27913eaba2 100644
--- a/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
+++ b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
@@ -1,4 +1,4 @@
-From 97b196efe9671d0185d22710371acb52bb7130e2 Mon Sep 17 00:00:00 2001
+From 49354ac403bdbb9c01c5afaa95beeeec40536769 Mon Sep 17 00:00:00 2001
 From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
 Date: Tue, 2 Jul 2019 20:10:42 +0200
 Subject: [PATCH] Define FNM_EXTMATCH for musl
diff --git a/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch b/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
index f84a0a1311..36b066c87c 100644
--- a/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
+++ b/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
@@ -1,4 +1,4 @@
-From 4922e2011a0132c122df4f0cf4d66d565c749060 Mon Sep 17 00:00:00 2001
+From d7feb307f4e267409da3fef9910ec8c04725e08d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 9 Jan 2020 15:38:06 +0100
 Subject: [PATCH] Makefile: do not use dpkg for determining OS type
diff --git a/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
index 8aa227c8ec..5bbee5add0 100644
--- a/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
+++ b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
@@ -1,4 +1,4 @@
-From ea48a9816643482d438e4bb276c90cd6f02847e4 Mon Sep 17 00:00:00 2001
+From 36c83270f5a11e431b57f41de147a2eb4fa23e02 Mon Sep 17 00:00:00 2001
 From: Zqiang <qiang.zhang@windriver.com>
 Date: Mon, 19 Apr 2021 14:15:45 +0800
 Subject: [PATCH] ifupdown: skip wrong test case
diff --git a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
index d47c50f2d5..1333e161dd 100644
--- a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
+++ b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
@@ -1,4 +1,4 @@
-From 68b64a5c9d466352b0c161019bd7255e31db9a4c Mon Sep 17 00:00:00 2001
+From 57c1370eccbc9dccd47985a893ed01c6bfbae4db Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Wed, 6 Aug 2014 14:54:12 -0400
 Subject: [PATCH] defn2[c|man]: don't rely on dpkg-architecture to set arch
diff --git a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
index c1953f0691..8757de9b3a 100644
--- a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
+++ b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
@@ -1,4 +1,4 @@
-From 5eede8950e35404b109cc3cf6a53bf3c84b31cfb Mon Sep 17 00:00:00 2001
+From 7702e61a4e0590b2f1fa513d949a1979d9a7d558 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Mon, 3 Feb 2020 17:33:11 +0800
 Subject: [PATCH] Tweak tests of ifupdown to make it work with oe-core ptest
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.45..bb
similarity index 25%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.45..bb
index 8a8f477361..ef24cd0547 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.45..bb
@@ -1,3 +1,140 @@
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
+# @@ -1,12 +1,12 @@
+# -		    GNU GENERAL PUBLIC LICENSE
+# -		       Version 2, June 1991
+# -
+# - Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+# -     59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# +                    GNU GENERAL PUBLIC LICENSE
+# +                       Version 2, June 1991
+# +
+# + Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# -			    Preamble
+# +                            Preamble
+#  
+#    The licenses for most software are designed to take away your
+#  freedom to share and change it.  By contrast, the GNU General Public
+# @@ -15,7 +15,7 @@
+#  General Public License applies to most of the Free Software
+#  Foundation's software and to any other program whose authors commit to
+#  using it.  (Some other Free Software Foundation software is covered by
+# -the GNU Library General Public License instead.)  You can apply it to
+# +the GNU Lesser General Public License instead.)  You can apply it to
+#  your programs, too.
+#  
+#    When we speak of free software, we are referring to freedom, not
+# @@ -55,8 +55,8 @@
+#  
+#    The precise terms and conditions for copying, distribution and
+#  modification follow.
+# -
+# -		    GNU GENERAL PUBLIC LICENSE
+# +
+# +                    GNU GENERAL PUBLIC LICENSE
+#     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+#  
+#    0. This License applies to any program or other work which contains
+# @@ -110,7 +110,7 @@
+#      License.  (Exception: if the Program itself is interactive but
+#      does not normally print such an announcement, your work based on
+#      the Program is not required to print an announcement.)
+# -
+# +
+#  These requirements apply to the modified work as a whole.  If
+#  identifiable sections of that work are not derived from the Program,
+#  and can be reasonably considered independent and separate works in
+# @@ -168,7 +168,7 @@
+#  access to copy the source code from the same place counts as
+#  distribution of the source code, even though third parties are not
+#  compelled to copy the source along with the object code.
+# -
+# +
+#    4. You may not copy, modify, sublicense, or distribute the Program
+#  except as expressly provided under this License.  Any attempt
+#  otherwise to copy, modify, sublicense or distribute the Program is
+# @@ -225,7 +225,7 @@
+#  
+#  This section is intended to make thoroughly clear what is believed to
+#  be a consequence of the rest of this License.
+# -
+# +
+#    8. If the distribution and/or use of the Program is restricted in
+#  certain countries either by patents or by copyrighted interfaces, the
+#  original copyright holder who places the Program under this License
+# @@ -255,7 +255,7 @@
+#  of preserving the free status of all derivatives of our free software and
+#  of promoting the sharing and reuse of software generally.
+#  
+# -			    NO WARRANTY
+# +                            NO WARRANTY
+#  
+#    11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+#  FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+# @@ -277,9 +277,9 @@
+#  PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+#  POSSIBILITY OF SUCH DAMAGES.
+#  
+# -		     END OF TERMS AND CONDITIONS
+# -
+# -	    How to Apply These Terms to Your New Programs
+# +                     END OF TERMS AND CONDITIONS
+# +
+# +            How to Apply These Terms to Your New Programs
+#  
+#    If you develop a new program, and you want it to be of the greatest
+#  possible use to the public, the best way to achieve this is to make it
+# @@ -303,17 +303,15 @@
+#      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#      GNU General Public License for more details.
+#  
+# -    You should have received a copy of the GNU General Public License
+# -    along with this program; if not, write to the Free Software
+# -    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# -
+# +    You should have received a copy of the GNU General Public License along
+# +    with this program; if not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+#  If the program is interactive, make it output a short notice like this
+#  when it starts in an interactive mode:
+#  
+# -    Gnomovision version 69, Copyright (C) year  name of author
+# +    Gnomovision version 69, Copyright (C) year name of author
+#      Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+#      This is free software, and you are welcome to redistribute it
+#      under certain conditions; type `show c' for details.
+# @@ -330,11 +328,11 @@
+#    Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+#    `Gnomovision' (which makes passes at compilers) written by James Hacker.
+#  
+# -  <signature of Ty Coon>, 1 April 1989
+# -  Ty Coon, President of Vice
+# +  <signature of Moe Ghoul>, 1 April 1989
+# +  Moe Ghoul, President of Vice
+#  
+#  This General Public License does not permit incorporating your program into
+#  proprietary programs.  If your program is a subroutine library, you may
+#  consider it more useful to permit linking proprietary applications with the
+# -library.  If this is what you want to do, use the GNU Library General
+# +library.  If this is what you want to do, use the GNU Lesser General
+#  Public License instead of this License.
+# 
+#
+
 SUMMARY = "ifupdown: basic ifup and ifdown used by initscripts"
 HOMEPAGE = "https://salsa.debian.org/debian/ifupdown"
 DESCRIPTION = "High level tools to configure network interfaces \
@@ -5,7 +142,7 @@ This package provides the tools ifup and ifdown which may be used to \
 configure (or, respectively, deconfigure) network interfaces, based on \
 the file /etc/network/interfaces."
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"
 
 SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=master \
            file://99_network \
@@ -16,7 +153,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=mast
            file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
            file://tweak-ptest-script.patch \
            "
-SRCREV = "7d44f9ce6717a4a496fd46f28c52e12dbf5bafdd"
+SRCREV = "7a1cd3105143eb151357a30a38809c081321ac92"
 
 inherit ptest update-alternatives
 
-- 
2.47.1


--===============9151690818116220353==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ifupdown-upgrade-0.8.44-0.8.45.patch"

RnJvbSBhMDlhNTc2ZjhmMGY1NWQ3NDg5YzQ0ZmI4MGUxNDlhM2MzZTlhOWYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjA6MDY6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
ZnVwZG93bjogdXBncmFkZSAwLjguNDQgLT4gMC44LjQ1LgoKLS0tCiAuLi4vMDAwMS1EZWZpbmUt
Rk5NX0VYVE1BVENILWZvci1tdXNsLnBhdGNoICAgfCAgIDIgKy0KIC4uLm5vdC11c2UtZHBrZy1m
b3ItZGV0ZXJtaW5pbmctT1MtdHlwZS5wYXRjaCB8ICAgMiArLQogLi4uLzAwMDEtaWZ1cGRvd24t
c2tpcC13cm9uZy10ZXN0LWNhc2UucGF0Y2ggIHwgICAyICstCiAuLi50LXJlbHktb24tZHBrZy1h
cmNoaXRlY3R1cmUtdG8tc2V0LWEucGF0Y2ggfCAgIDIgKy0KIC4uLi9pZnVwZG93bi9maWxlcy90
d2Vhay1wdGVzdC1zY3JpcHQucGF0Y2ggICB8ICAgMiArLQogLi4uaWZ1cGRvd25fMC44LjQ0LmJi
ID0+IGlmdXBkb3duXzAuOC40NS4uYmJ9IHwgMTQxICsrKysrKysrKysrKysrKysrLQogNiBmaWxl
cyBjaGFuZ2VkLCAxNDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtY29yZS9pZnVwZG93bi97aWZ1cGRvd25fMC44LjQ0LmJiID0+IGlmdXBkb3duXzAu
OC40NS4uYmJ9ICgyNSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24v
ZmlsZXMvMDAwMS1EZWZpbmUtRk5NX0VYVE1BVENILWZvci1tdXNsLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvMDAwMS1EZWZpbmUtRk5NX0VYVE1BVENILWZvci1tdXNs
LnBhdGNoCmluZGV4IDgzZmI3MDZiZTAuLjI3OTEzZWFiYTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2lmdXBkb3duL2ZpbGVzLzAwMDEtRGVmaW5lLUZOTV9FWFRNQVRDSC1mb3ItbXVz
bC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9pZnVwZG93bi9maWxlcy8wMDAxLURlZmlu
ZS1GTk1fRVhUTUFUQ0gtZm9yLW11c2wucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk3YjE5
NmVmZTk2NzFkMDE4NWQyMjcxMDM3MWFjYjUyYmI3MTMwZTIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDQ5MzU0YWM0MDNiZGJiOWMwMWM1YWZhYTk1YmVlZWVjNDA1MzY3NjkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBPbGVrc2FuZHIgS3JhdmNodWsgPG9wZW4uc291cmNl
QG9sZWtzYW5kci1rcmF2Y2h1ay5jb20+CiBEYXRlOiBUdWUsIDIgSnVsIDIwMTkgMjA6MTA6NDIg
KzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGVmaW5lIEZOTV9FWFRNQVRDSCBmb3IgbXVzbApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvMDAwMS1NYWtlZmlsZS1k
by1ub3QtdXNlLWRwa2ctZm9yLWRldGVybWluaW5nLU9TLXR5cGUucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS9pZnVwZG93bi9maWxlcy8wMDAxLU1ha2VmaWxlLWRvLW5vdC11c2UtZHBrZy1mb3It
ZGV0ZXJtaW5pbmctT1MtdHlwZS5wYXRjaAppbmRleCBmODRhMGExMzExLi4zNmIwNjZjODdjIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9pZnVwZG93bi9maWxlcy8wMDAxLU1ha2VmaWxl
LWRvLW5vdC11c2UtZHBrZy1mb3ItZGV0ZXJtaW5pbmctT1MtdHlwZS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29yZS9pZnVwZG93bi9maWxlcy8wMDAxLU1ha2VmaWxlLWRvLW5vdC11c2UtZHBr
Zy1mb3ItZGV0ZXJtaW5pbmctT1MtdHlwZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDky
MmUyMDExYTAxMzJjMTIyZGY0ZjBjZjRkNjZkNTY1Yzc0OTA2MCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gZDdmZWIzMDdmNGUyNjc0MDlkYTNmZWY5OTEwZWM4YzA0NzI1ZTA4ZCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCA5IEphbiAyMDIwIDE1OjM4OjA2ICswMTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIE1ha2VmaWxlOiBkbyBub3QgdXNlIGRwa2cgZm9yIGRldGVybWluaW5nIE9T
IHR5cGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2ZpbGVzLzAwMDEt
aWZ1cGRvd24tc2tpcC13cm9uZy10ZXN0LWNhc2UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9p
ZnVwZG93bi9maWxlcy8wMDAxLWlmdXBkb3duLXNraXAtd3JvbmctdGVzdC1jYXNlLnBhdGNoCmlu
ZGV4IDhhYTIyN2M4ZWMuLjViYmVlNWFkZDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L2lmdXBkb3duL2ZpbGVzLzAwMDEtaWZ1cGRvd24tc2tpcC13cm9uZy10ZXN0LWNhc2UucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvMDAwMS1pZnVwZG93bi1za2lw
LXdyb25nLXRlc3QtY2FzZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZWE0OGE5ODE2NjQz
NDgyZDQzOGU0YmIyNzZjOTBjZDZmMDI4NDdlNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMzZjODMyNzBmNWExMWU0MzFiNTdmNDFkZTE0N2EyZWI0ZmEyM2UwMiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFpxaWFuZyA8cWlhbmcuemhhbmdAd2luZHJpdmVyLmNvbT4KIERh
dGU6IE1vbiwgMTkgQXByIDIwMjEgMTQ6MTU6NDUgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gaWZ1
cGRvd246IHNraXAgd3JvbmcgdGVzdCBjYXNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9pZnVwZG93bi9maWxlcy9kZWZuMi1jLW1hbi1kb24tdC1yZWx5LW9uLWRwa2ctYXJjaGl0ZWN0
dXJlLXRvLXNldC1hLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvZGVm
bjItYy1tYW4tZG9uLXQtcmVseS1vbi1kcGtnLWFyY2hpdGVjdHVyZS10by1zZXQtYS5wYXRjaApp
bmRleCBkNDdjNTBmMmQ1Li4xMzMzZTE2MWRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9pZnVwZG93bi9maWxlcy9kZWZuMi1jLW1hbi1kb24tdC1yZWx5LW9uLWRwa2ctYXJjaGl0ZWN0
dXJlLXRvLXNldC1hLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2ZpbGVz
L2RlZm4yLWMtbWFuLWRvbi10LXJlbHktb24tZHBrZy1hcmNoaXRlY3R1cmUtdG8tc2V0LWEucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY4YjY0YTVjOWQ0NjYzNTJiMGMxNjEwMTliZDcyNTVl
MzFkYjlhNGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU3YzEzNzBlY2NiYzlkY2Nk
NDc5ODVhODkzZWQwMWM2YmZiYWU0ZGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQ
YXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwg
NiBBdWcgMjAxNCAxNDo1NDoxMiAtMDQwMAogU3ViamVjdDogW1BBVENIXSBkZWZuMltjfG1hbl06
IGRvbid0IHJlbHkgb24gZHBrZy1hcmNoaXRlY3R1cmUgdG8gc2V0IGFyY2gKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2ZpbGVzL3R3ZWFrLXB0ZXN0LXNjcmlwdC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2ZpbGVzL3R3ZWFrLXB0ZXN0LXNjcmlwdC5w
YXRjaAppbmRleCBjMTk1M2YwNjkxLi44NzU3ZGU5YjNhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9pZnVwZG93bi9maWxlcy90d2Vhay1wdGVzdC1zY3JpcHQucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvdHdlYWstcHRlc3Qtc2NyaXB0LnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA1ZWVkZTg5NTBlMzU0MDRiMTA5Y2MzY2Y2YTUzYmYzYzg0YjMx
Y2ZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3NzAyZTYxYTRlMDU5MGIyZjFmYTUx
M2Q5NDlhMTk3OWQ5YTdkNTU4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEth
bmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDMgRmViIDIwMjAgMTc6MzM6
MTEgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gVHdlYWsgdGVzdHMgb2YgaWZ1cGRvd24gdG8gbWFr
ZSBpdCB3b3JrIHdpdGggb2UtY29yZSBwdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvaWZ1cGRvd24vaWZ1cGRvd25fMC44LjQ0LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRv
d24vaWZ1cGRvd25fMC44LjQ1Li5iYgpzaW1pbGFyaXR5IGluZGV4IDI1JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtY29yZS9pZnVwZG93bi9pZnVwZG93bl8wLjguNDQuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2lmdXBkb3duXzAuOC40NS4uYmIKaW5kZXggOGE4ZjQ3
NzM2MS4uZWYyNGNkMDU0NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24v
aWZ1cGRvd25fMC44LjQ0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2lmdXBk
b3duXzAuOC40NS4uYmIKQEAgLTEsMyArMSwxNDAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNf
Q0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMg
VGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBu
ZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5l
ZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2Ug
dmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTog
Y29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBD
T1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0xLDEyICsxLDEyIEBACisjIC0JCSAgICBHTlUg
R0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyAtCQkgICAgICAgVmVyc2lvbiAyLCBKdW5lIDE5OTEK
KyMgLQorIyAtIENvcHlyaWdodCAoQykgMTk4OSwgMTk5MSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b24sIEluYy4KKyMgLSAgICAgNTkgVGVtcGxlIFBsYWNlLCBTdWl0ZSAzMzAsIEJvc3RvbiwgTUEg
IDAyMTExLTEzMDcgIFVTQQorIyArICAgICAgICAgICAgICAgICAgICBHTlUgR0VORVJBTCBQVUJM
SUMgTElDRU5TRQorIyArICAgICAgICAgICAgICAgICAgICAgICBWZXJzaW9uIDIsIEp1bmUgMTk5
MQorIyArCisjICsgQ29weXJpZ2h0IChDKSAxOTg5LCAxOTkxIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbiwgSW5jLiwKKyMgKyA8aHR0cHM6Ly9mc2Yub3JnLz4KKyMgICBFdmVyeW9uZSBpcyBwZXJt
aXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlz
IGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAor
IyAtCQkJICAgIFByZWFtYmxlCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgUHJlYW1i
bGUKKyMgIAorIyAgICBUaGUgbGljZW5zZXMgZm9yIG1vc3Qgc29mdHdhcmUgYXJlIGRlc2lnbmVk
IHRvIHRha2UgYXdheSB5b3VyCisjICBmcmVlZG9tIHRvIHNoYXJlIGFuZCBjaGFuZ2UgaXQuICBC
eSBjb250cmFzdCwgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYworIyBAQCAtMTUsNyArMTUsNyBAQAor
IyAgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcHBsaWVzIHRvIG1vc3Qgb2YgdGhlIEZyZWUgU29m
dHdhcmUKKyMgIEZvdW5kYXRpb24ncyBzb2Z0d2FyZSBhbmQgdG8gYW55IG90aGVyIHByb2dyYW0g
d2hvc2UgYXV0aG9ycyBjb21taXQgdG8KKyMgIHVzaW5nIGl0LiAgKFNvbWUgb3RoZXIgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uIHNvZnR3YXJlIGlzIGNvdmVyZWQgYnkKKyMgLXRoZSBHTlUgTGli
cmFyeSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGluc3RlYWQuKSAgWW91IGNhbiBhcHBseSBpdCB0
bworIyArdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBpbnN0ZWFkLikgIFlv
dSBjYW4gYXBwbHkgaXQgdG8KKyMgIHlvdXIgcHJvZ3JhbXMsIHRvby4KKyMgIAorIyAgICBXaGVu
IHdlIHNwZWFrIG9mIGZyZWUgc29mdHdhcmUsIHdlIGFyZSByZWZlcnJpbmcgdG8gZnJlZWRvbSwg
bm90CisjIEBAIC01NSw4ICs1NSw4IEBACisjICAKKyMgICAgVGhlIHByZWNpc2UgdGVybXMgYW5k
IGNvbmRpdGlvbnMgZm9yIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBhbmQKKyMgIG1vZGlmaWNhdGlv
biBmb2xsb3cuCisjIC0MCisjIC0JCSAgICBHTlUgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyAr
CisjICsgICAgICAgICAgICAgICAgICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICAg
ICBURVJNUyBBTkQgQ09ORElUSU9OUyBGT1IgQ09QWUlORywgRElTVFJJQlVUSU9OIEFORCBNT0RJ
RklDQVRJT04KKyMgIAorIyAgICAwLiBUaGlzIExpY2Vuc2UgYXBwbGllcyB0byBhbnkgcHJvZ3Jh
bSBvciBvdGhlciB3b3JrIHdoaWNoIGNvbnRhaW5zCisjIEBAIC0xMTAsNyArMTEwLDcgQEAKKyMg
ICAgICBMaWNlbnNlLiAgKEV4Y2VwdGlvbjogaWYgdGhlIFByb2dyYW0gaXRzZWxmIGlzIGludGVy
YWN0aXZlIGJ1dAorIyAgICAgIGRvZXMgbm90IG5vcm1hbGx5IHByaW50IHN1Y2ggYW4gYW5ub3Vu
Y2VtZW50LCB5b3VyIHdvcmsgYmFzZWQgb24KKyMgICAgICB0aGUgUHJvZ3JhbSBpcyBub3QgcmVx
dWlyZWQgdG8gcHJpbnQgYW4gYW5ub3VuY2VtZW50LikKKyMgLQwKKyMgKworIyAgVGhlc2UgcmVx
dWlyZW1lbnRzIGFwcGx5IHRvIHRoZSBtb2RpZmllZCB3b3JrIGFzIGEgd2hvbGUuICBJZgorIyAg
aWRlbnRpZmlhYmxlIHNlY3Rpb25zIG9mIHRoYXQgd29yayBhcmUgbm90IGRlcml2ZWQgZnJvbSB0
aGUgUHJvZ3JhbSwKKyMgIGFuZCBjYW4gYmUgcmVhc29uYWJseSBjb25zaWRlcmVkIGluZGVwZW5k
ZW50IGFuZCBzZXBhcmF0ZSB3b3JrcyBpbgorIyBAQCAtMTY4LDcgKzE2OCw3IEBACisjICBhY2Nl
c3MgdG8gY29weSB0aGUgc291cmNlIGNvZGUgZnJvbSB0aGUgc2FtZSBwbGFjZSBjb3VudHMgYXMK
KyMgIGRpc3RyaWJ1dGlvbiBvZiB0aGUgc291cmNlIGNvZGUsIGV2ZW4gdGhvdWdoIHRoaXJkIHBh
cnRpZXMgYXJlIG5vdAorIyAgY29tcGVsbGVkIHRvIGNvcHkgdGhlIHNvdXJjZSBhbG9uZyB3aXRo
IHRoZSBvYmplY3QgY29kZS4KKyMgLQwKKyMgKworIyAgICA0LiBZb3UgbWF5IG5vdCBjb3B5LCBt
b2RpZnksIHN1YmxpY2Vuc2UsIG9yIGRpc3RyaWJ1dGUgdGhlIFByb2dyYW0KKyMgIGV4Y2VwdCBh
cyBleHByZXNzbHkgcHJvdmlkZWQgdW5kZXIgdGhpcyBMaWNlbnNlLiAgQW55IGF0dGVtcHQKKyMg
IG90aGVyd2lzZSB0byBjb3B5LCBtb2RpZnksIHN1YmxpY2Vuc2Ugb3IgZGlzdHJpYnV0ZSB0aGUg
UHJvZ3JhbSBpcworIyBAQCAtMjI1LDcgKzIyNSw3IEBACisjICAKKyMgIFRoaXMgc2VjdGlvbiBp
cyBpbnRlbmRlZCB0byBtYWtlIHRob3JvdWdobHkgY2xlYXIgd2hhdCBpcyBiZWxpZXZlZCB0bwor
IyAgYmUgYSBjb25zZXF1ZW5jZSBvZiB0aGUgcmVzdCBvZiB0aGlzIExpY2Vuc2UuCisjIC0MCisj
ICsKKyMgICAgOC4gSWYgdGhlIGRpc3RyaWJ1dGlvbiBhbmQvb3IgdXNlIG9mIHRoZSBQcm9ncmFt
IGlzIHJlc3RyaWN0ZWQgaW4KKyMgIGNlcnRhaW4gY291bnRyaWVzIGVpdGhlciBieSBwYXRlbnRz
IG9yIGJ5IGNvcHlyaWdodGVkIGludGVyZmFjZXMsIHRoZQorIyAgb3JpZ2luYWwgY29weXJpZ2h0
IGhvbGRlciB3aG8gcGxhY2VzIHRoZSBQcm9ncmFtIHVuZGVyIHRoaXMgTGljZW5zZQorIyBAQCAt
MjU1LDcgKzI1NSw3IEBACisjICBvZiBwcmVzZXJ2aW5nIHRoZSBmcmVlIHN0YXR1cyBvZiBhbGwg
ZGVyaXZhdGl2ZXMgb2Ygb3VyIGZyZWUgc29mdHdhcmUgYW5kCisjICBvZiBwcm9tb3RpbmcgdGhl
IHNoYXJpbmcgYW5kIHJldXNlIG9mIHNvZnR3YXJlIGdlbmVyYWxseS4KKyMgIAorIyAtCQkJICAg
IE5PIFdBUlJBTlRZCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgTk8gV0FSUkFOVFkK
KyMgIAorIyAgICAxMS4gQkVDQVVTRSBUSEUgUFJPR1JBTSBJUyBMSUNFTlNFRCBGUkVFIE9GIENI
QVJHRSwgVEhFUkUgSVMgTk8gV0FSUkFOVFkKKyMgIEZPUiBUSEUgUFJPR1JBTSwgVE8gVEhFIEVY
VEVOVCBQRVJNSVRURUQgQlkgQVBQTElDQUJMRSBMQVcuICBFWENFUFQgV0hFTgorIyBAQCAtMjc3
LDkgKzI3Nyw5IEBACisjICBQUk9HUkFNUyksIEVWRU4gSUYgU1VDSCBIT0xERVIgT1IgT1RIRVIg
UEFSVFkgSEFTIEJFRU4gQURWSVNFRCBPRiBUSEUKKyMgIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFN
QUdFUy4KKyMgIAorIyAtCQkgICAgIEVORCBPRiBURVJNUyBBTkQgQ09ORElUSU9OUworIyAtDAor
IyAtCSAgICBIb3cgdG8gQXBwbHkgVGhlc2UgVGVybXMgdG8gWW91ciBOZXcgUHJvZ3JhbXMKKyMg
KyAgICAgICAgICAgICAgICAgICAgIEVORCBPRiBURVJNUyBBTkQgQ09ORElUSU9OUworIyArCisj
ICsgICAgICAgICAgICBIb3cgdG8gQXBwbHkgVGhlc2UgVGVybXMgdG8gWW91ciBOZXcgUHJvZ3Jh
bXMKKyMgIAorIyAgICBJZiB5b3UgZGV2ZWxvcCBhIG5ldyBwcm9ncmFtLCBhbmQgeW91IHdhbnQg
aXQgdG8gYmUgb2YgdGhlIGdyZWF0ZXN0CisjICBwb3NzaWJsZSB1c2UgdG8gdGhlIHB1YmxpYywg
dGhlIGJlc3Qgd2F5IHRvIGFjaGlldmUgdGhpcyBpcyB0byBtYWtlIGl0CisjIEBAIC0zMDMsMTcg
KzMwMywxNSBAQAorIyAgICAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJ
Q1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKKyMgICAgICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAgCisjIC0gICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVk
IGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyMgLSAgICBhbG9uZyB3
aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQorIyAt
ICAgIEZvdW5kYXRpb24sIEluYy4sIDU5IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24s
IE1BICAwMjExMS0xMzA3ICBVU0EKKyMgLQorIyArICAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZl
ZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25nCisjICsgICAg
d2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgc2VlIDxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vu
c2VzLz4uCisjICAKKyMgIEFsc28gYWRkIGluZm9ybWF0aW9uIG9uIGhvdyB0byBjb250YWN0IHlv
dSBieSBlbGVjdHJvbmljIGFuZCBwYXBlciBtYWlsLgorIyAgCisjICBJZiB0aGUgcHJvZ3JhbSBp
cyBpbnRlcmFjdGl2ZSwgbWFrZSBpdCBvdXRwdXQgYSBzaG9ydCBub3RpY2UgbGlrZSB0aGlzCisj
ICB3aGVuIGl0IHN0YXJ0cyBpbiBhbiBpbnRlcmFjdGl2ZSBtb2RlOgorIyAgCisjIC0gICAgR25v
bW92aXNpb24gdmVyc2lvbiA2OSwgQ29weXJpZ2h0IChDKSB5ZWFyICBuYW1lIG9mIGF1dGhvcgor
IyArICAgIEdub21vdmlzaW9uIHZlcnNpb24gNjksIENvcHlyaWdodCAoQykgeWVhciBuYW1lIG9m
IGF1dGhvcgorIyAgICAgIEdub21vdmlzaW9uIGNvbWVzIHdpdGggQUJTT0xVVEVMWSBOTyBXQVJS
QU5UWTsgZm9yIGRldGFpbHMgdHlwZSBgc2hvdyB3Jy4KKyMgICAgICBUaGlzIGlzIGZyZWUgc29m
dHdhcmUsIGFuZCB5b3UgYXJlIHdlbGNvbWUgdG8gcmVkaXN0cmlidXRlIGl0CisjICAgICAgdW5k
ZXIgY2VydGFpbiBjb25kaXRpb25zOyB0eXBlIGBzaG93IGMnIGZvciBkZXRhaWxzLgorIyBAQCAt
MzMwLDExICszMjgsMTEgQEAKKyMgICAgWW95b2R5bmUsIEluYy4sIGhlcmVieSBkaXNjbGFpbXMg
YWxsIGNvcHlyaWdodCBpbnRlcmVzdCBpbiB0aGUgcHJvZ3JhbQorIyAgICBgR25vbW92aXNpb24n
ICh3aGljaCBtYWtlcyBwYXNzZXMgYXQgY29tcGlsZXJzKSB3cml0dGVuIGJ5IEphbWVzIEhhY2tl
ci4KKyMgIAorIyAtICA8c2lnbmF0dXJlIG9mIFR5IENvb24+LCAxIEFwcmlsIDE5ODkKKyMgLSAg
VHkgQ29vbiwgUHJlc2lkZW50IG9mIFZpY2UKKyMgKyAgPHNpZ25hdHVyZSBvZiBNb2UgR2hvdWw+
LCAxIEFwcmlsIDE5ODkKKyMgKyAgTW9lIEdob3VsLCBQcmVzaWRlbnQgb2YgVmljZQorIyAgCisj
ICBUaGlzIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZG9lcyBub3QgcGVybWl0IGluY29ycG9yYXRp
bmcgeW91ciBwcm9ncmFtIGludG8KKyMgIHByb3ByaWV0YXJ5IHByb2dyYW1zLiAgSWYgeW91ciBw
cm9ncmFtIGlzIGEgc3Vicm91dGluZSBsaWJyYXJ5LCB5b3UgbWF5CisjICBjb25zaWRlciBpdCBt
b3JlIHVzZWZ1bCB0byBwZXJtaXQgbGlua2luZyBwcm9wcmlldGFyeSBhcHBsaWNhdGlvbnMgd2l0
aCB0aGUKKyMgLWxpYnJhcnkuICBJZiB0aGlzIGlzIHdoYXQgeW91IHdhbnQgdG8gZG8sIHVzZSB0
aGUgR05VIExpYnJhcnkgR2VuZXJhbAorIyArbGlicmFyeS4gIElmIHRoaXMgaXMgd2hhdCB5b3Ug
d2FudCB0byBkbywgdXNlIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwKKyMgIFB1YmxpYyBMaWNlbnNl
IGluc3RlYWQgb2YgdGhpcyBMaWNlbnNlLgorIyAKKyMKKwogU1VNTUFSWSA9ICJpZnVwZG93bjog
YmFzaWMgaWZ1cCBhbmQgaWZkb3duIHVzZWQgYnkgaW5pdHNjcmlwdHMiCiBIT01FUEFHRSA9ICJo
dHRwczovL3NhbHNhLmRlYmlhbi5vcmcvZGViaWFuL2lmdXBkb3duIgogREVTQ1JJUFRJT04gPSAi
SGlnaCBsZXZlbCB0b29scyB0byBjb25maWd1cmUgbmV0d29yayBpbnRlcmZhY2VzIFwKQEAgLTUs
NyArMTQyLDcgQEAgVGhpcyBwYWNrYWdlIHByb3ZpZGVzIHRoZSB0b29scyBpZnVwIGFuZCBpZmRv
d24gd2hpY2ggbWF5IGJlIHVzZWQgdG8gXAogY29uZmlndXJlIChvciwgcmVzcGVjdGl2ZWx5LCBk
ZWNvbmZpZ3VyZSkgbmV0d29yayBpbnRlcmZhY2VzLCBiYXNlZCBvbiBcCiB0aGUgZmlsZSAvZXRj
L25ldHdvcmsvaW50ZXJmYWNlcy4iCiBMSUNFTlNFID0gIkdQTC0yLjAtb25seSIKLUxJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTk0ZDU1ZDUxMmE5YmEzNmNhYTliN2RmMDc5
YmFlMTlmIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NTcwYTliMzc0
OWRkMDQ2M2ExNzc4ODAzYjEyYTZkY2UiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vc2Fsc2EuZGViaWFu
Lm9yZy9kZWJpYW4vaWZ1cGRvd24uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAog
ICAgICAgICAgICBmaWxlOi8vOTlfbmV0d29yayBcCkBAIC0xNiw3ICsxNTMsNyBAQCBTUkNfVVJJ
ID0gImdpdDovL3NhbHNhLmRlYmlhbi5vcmcvZGViaWFuL2lmdXBkb3duLmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9bWFzdAogICAgICAgICAgICBmaWxlOi8vZGVmbjItYy1tYW4tZG9uLXQtcmVs
eS1vbi1kcGtnLWFyY2hpdGVjdHVyZS10by1zZXQtYS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly90d2Vhay1wdGVzdC1zY3JpcHQucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiN2Q0
NGY5Y2U2NzE3YTRhNDk2ZmQ0NmYyOGM1MmUxMmRiZjViYWZkZCIKK1NSQ1JFViA9ICI3YTFjZDMx
MDUxNDNlYjE1MTM1N2EzMGEzODgwOWMwODEzMjFhYzkyIgogCiBpbmhlcml0IHB0ZXN0IHVwZGF0
ZS1hbHRlcm5hdGl2ZXMKIAotLSAKMi40Ny4xCgo=

--===============9151690818116220353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ifupdown/ifupdown-dbg: PKGV changed from 0.8.44 [default] to 0.8.45. [default]
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-dbg: PV changed from "0.8.44" to "0.8.45."
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-dbg: PKGSIZE changed from 215488 to 215336 (-0%)
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-dev: PKGV changed from 0.8.44 [default] to 0.8.45. [default]
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-dev: PV changed from "0.8.44" to "0.8.45."
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-doc: PKGV changed from 0.8.44 [default] to 0.8.45. [default]
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-doc: PV changed from "0.8.44" to "0.8.45."
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-locale: PKGV changed from 0.8.44 [default] to 0.8.45. [default]
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-locale: PV changed from "0.8.44" to "0.8.45."
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-ptest: PKGV changed from 0.8.44 [default] to 0.8.45. [default]
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-ptest: PV changed from "0.8.44" to "0.8.45."
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-src: PKGV changed from 0.8.44 [default] to 0.8.45. [default]
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-src: FILELIST: directory renamed /usr/src/debug/ifupdown/0.8.44 -> /usr/src/debug/ifupdown/0.8.45.
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-src: PV changed from "0.8.44" to "0.8.45."
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-src: PKGSIZE changed from 115527 to 115546 (+0%)
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-staticdev: PKGV changed from 0.8.44 [default] to 0.8.45. [default]
packages/x86-64-v3-poky-linux/ifupdown/ifupdown-staticdev: PV changed from "0.8.44" to "0.8.45."
packages/x86-64-v3-poky-linux/ifupdown/ifupdown: PKGV changed from 0.8.44 [default] to 0.8.45. [default]
packages/x86-64-v3-poky-linux/ifupdown/ifupdown: PV changed from "0.8.44" to "0.8.45."
packages/x86-64-v3-poky-linux/ifupdown: PKGV changed from 0.8.44 [default] to 0.8.45. [default]
packages/x86-64-v3-poky-linux/ifupdown: PV changed from "0.8.44" to "0.8.45."

--===============9151690818116220353==--

