Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75337C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 05:40:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42913.1789969211187786112
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 22:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IqhCgchp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qO85ifpM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0c27a9cb8-c815d337-7530-4b15-944f-a7859d327022-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789969210;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QE2WYclCgpegf6rxk4dZGHDUuD62ytq/ag/STHYv6LY=;
	b=IqhCgchpORWELbNbKTAs6PSu2LZfTEJxGDjUR6NpXru/hTD/ertr7JMHeCHIBMqQ
	aKANtlaMrsE6Pz6klXLUexsLpB9HU0i+X2wYI7ihtZtczXm2swifdtLdtaYSBrZbNO9
	p4b4x6pijCe1QVSrqLjxo+TdjbmZyjiOBKk7x59U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789969210;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QE2WYclCgpegf6rxk4dZGHDUuD62ytq/ag/STHYv6LY=;
	b=qO85ifpML/xop9BnFHNwz2H6qDjbSZ4+D+kagaSnkwADH5aaCwcXUq5BEuRerwOz
	SPAYYJN2GhsFYlA9PGrzl5LWLBjNfrk7ZlqK/i3vv6yO7gsI6EVFAy5hxBw1CSRCtkB
	Pwrnfd8VffZae4nM62WDWUdW46FHNCoqnxxLJM4E=
Content-Type: multipart/mixed; boundary="===============2191562785685208148=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fribidi: upgrading to 1.0.17 SUCCEEDED
Message-ID: <010101a0c27a9cb8-c815d337-7530-4b15-944f-a7859d327022-000000@us-west-2.amazonses.com>
Date: Mon, 21 Sep 2026 05:40:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.21-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246283

--===============2191562785685208148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fribidi* to *1.0.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fribidi-upgrade-1.0.16-1.0.17.patch
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
From 7962b90e04401e895b76e3063d4a96b1dd2b231f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 21 Sep 2026 05:37:25 +0000
Subject: [PATCH] fribidi: upgrade 1.0.16 -> 1.0.17

Source: ChangeLog

Bumped version to 1.0.17
lib: resolve FSI base direction in one linear pass, not per-FSI rescan
ci: capture the real test-suite.log from distcheck's nested rebuild
lib: replace N0 bracket-pairing linked list with a flat sorted array
lib: pool-allocate FriBidiRun nodes in embedding-level resolution
fribidi_reorder_line: implement L2 reordering in linear time
test: include stdbool.h in test-reorder-nsm.c
meson: fix parallel build race for test-reorder-nsm
gen-unicode-version: fix MSVC link failure by avoiding strncasecmp
Fix fribidi_set_reorder_nsm()/fribidi_set_mirroring() not affecting
gen-arabic-shaping-tab: fix remaining -Wformat= mismatch on
gen-unicode-version: replace non-portable strcasestr with a portable
Define _FRIBIDI_TYPE_SENTINEL/_FRIBIDI_PAR_SENTINEL in both enum
gen-arabic-shaping-tab: fix -Wformat-overflow warning on GCC 14
Update Unicode character databases to v18.0.0
Fix quadratic behavior in N0 bracket pairing preceding-strong search
Fix out-of-bounds read on trailing '_'
fribidi-main: fix truncation of lines/output containing embedded
Pair brackets by canonical equivalence only, per UAX #9 BD16
Remove unused appveyor yaml file
github actions: Use current python version
Update old FSF address
Remove unnecessary custom prototypes for getenv and getopt
Remove unused travis file
github actions: Install help2man to fix ubuntu build
Update TODO - remove readme item
Don't require help2man unless building docs
Generate fribidi.1 man page
Fix typos in docs: "an string" -> "a string"
github actions: Update python version to 3.12
Update github actions versions
Add GNU Mailutils to USERS
Fix typo
Fix error handling for file operations
Fix stack buffer overflow when parsing equivalence
remove compiler flag "-ansi"
debug: don't pass a comma "," in a #define
Bump version to 1.0.16
Fix CI failure
Update Unicode character databases to v16.0.0
Fix typo in fribidi-caprtl2utf8.c that caused compilation warning
Bumped version to 1.0.15
Bumped version to 1.0.14
Update unicode character databases to v15.1.0.
Update test cases to Unicode 15.1
meson: fix build with -Dbin=false and -Dtests=true
Bumped version to 1.0.13
simplify visibility handling
meson: fix two meson warnings
Update test cases to Unicode 15.0
meson: fix two meson warnings
meson: Override dependencies to improve usage as a subproject
ci: Upload logs on build failure
ci: Update python version in github workflows
meson: Override dependencies to improve usage as a subproject
Update test cases to Unicode 15.0
simplify visibility handling
remove useless library arguments applied to executables
Made fribidi_utf8_to_unicode() skip incomplete utf8 encoded code points
Bumped version to 1.0.12
Add -DFRIBIDI_LIB_STATIC to libfribidi_dep
Fix SEGV issue in fribidi_remove_bidi_marks
Protected against garbage in the CapRTL encoder
Fix the stack buffer overflow issue
Include -DFRIBIDI_LIB_STATIC in pkg-config output by default when
meson:  Don't hardcode python3 in tests
Update test

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../{fribidi_1.0.16.bb => fribidi_1.0.17.bb}  | 96 ++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.16.bb => fribidi_1.0.17.bb} (15%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.16.bb b/meta/recipes-support/fribidi/fribidi_1.0.17.bb
similarity index 15%
rename from meta/recipes-support/fribidi/fribidi_1.0.16.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.17.bb
index 9f75446da2..636f6df220 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.16.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.17.bb
@@ -1,3 +1,95 @@
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
+# @@ -1,8 +1,8 @@
+# -		  GNU LESSER GENERAL PUBLIC LICENSE
+# -		       Version 2.1, February 1999
+# +                  GNU LESSER GENERAL PUBLIC LICENSE
+# +                       Version 2.1, February 1999
+#  
+#   Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+# -     51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -10,7 +10,7 @@
+#   as the successor of the GNU Library Public License, version 2, hence
+#   the version number 2.1.]
+#  
+# -			    Preamble
+# +                            Preamble
+#  
+#    The licenses for most software are designed to take away your
+#  freedom to share and change it.  By contrast, the GNU General Public
+# @@ -112,7 +112,7 @@
+#  former contains code derived from the library, whereas the latter must
+#  be combined with the library in order to run.
+#  
+# -		  GNU LESSER GENERAL PUBLIC LICENSE
+# +                  GNU LESSER GENERAL PUBLIC LICENSE
+#     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+#  
+#    0. This License Agreement applies to any software library or other
+# @@ -146,7 +146,7 @@
+#  on the Library (independent of the use of the Library in a tool for
+#  writing it).  Whether that is true depends on what the Library does
+#  and what the program that uses the Library does.
+# -  
+# +
+#    1. You may copy and distribute verbatim copies of the Library's
+#  complete source code as you receive it, in any medium, provided that
+#  you conspicuously and appropriately publish on each copy an
+# @@ -432,7 +432,7 @@
+#  of all derivatives of our free software and of promoting the sharing
+#  and reuse of software generally.
+#  
+# -			    NO WARRANTY
+# +                            NO WARRANTY
+#  
+#    15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
+#  WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
+# @@ -455,7 +455,7 @@
+#  SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
+#  DAMAGES.
+#  
+# -		     END OF TERMS AND CONDITIONS
+# +                     END OF TERMS AND CONDITIONS
+#  
+#             How to Apply These Terms to Your New Libraries
+#  
+# @@ -484,8 +484,7 @@
+#      Lesser General Public License for more details.
+#  
+#      You should have received a copy of the GNU Lesser General Public
+# -    License along with this library; if not, write to the Free Software
+# -    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# +    License along with this library; if not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# @@ -496,9 +495,7 @@
+#    Yoyodyne, Inc., hereby disclaims all copyright interest in the
+#    library `Frob' (a library for tweaking knobs) written by James Random Hacker.
+#  
+# -  <signature of Ty Coon>, 1 April 1990
+# -  Ty Coon, President of Vice
+# +  <signature of Moe Ghoul>, 1 April 1990
+# +  Moe Ghoul, President of Vice
+#  
+#  That's all there is to it!
+# -
+# -
+# 
+#
+
 SUMMARY = "Free Implementation of the Unicode Bidirectional Algorithm"
 DESCRIPTION = "It provides utility functions to aid in the development \
 of interactive editors and widgets that implement BiDi functionality. \
@@ -7,11 +99,11 @@ SECTION = "libs"
 HOMEPAGE = "http://fribidi.org/"
 BUGTRACKER = "https://github.com/fribidi/fribidi/issues"
 LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "1b1cde5b235d40479e91be2f0e88a309e3214c8ab470ec8a2744d82a5a9ea05c"
+SRC_URI[sha256sum] = "6949dcde27d41cebad1fd741fcafc36d55a1020d2d872d4a6eb3914caabbada2"
 
 inherit meson lib_package pkgconfig github-releases
 
-- 
2.47.1


--===============2191562785685208148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="fribidi-changelog.txt"

Q2hhbmdlbG9nIGZvciBmcmliaWRpOiAxLjAuMTYgLT4gMS4wLjE3ClNvdXJjZTogQ2hhbmdlTG9n
CgpCdW1wZWQgdmVyc2lvbiB0byAxLjAuMTcKbGliOiByZXNvbHZlIEZTSSBiYXNlIGRpcmVjdGlv
biBpbiBvbmUgbGluZWFyIHBhc3MsIG5vdCBwZXItRlNJIHJlc2NhbgpjaTogY2FwdHVyZSB0aGUg
cmVhbCB0ZXN0LXN1aXRlLmxvZyBmcm9tIGRpc3RjaGVjaydzIG5lc3RlZCByZWJ1aWxkCmxpYjog
cmVwbGFjZSBOMCBicmFja2V0LXBhaXJpbmcgbGlua2VkIGxpc3Qgd2l0aCBhIGZsYXQgc29ydGVk
IGFycmF5CmxpYjogcG9vbC1hbGxvY2F0ZSBGcmlCaWRpUnVuIG5vZGVzIGluIGVtYmVkZGluZy1s
ZXZlbCByZXNvbHV0aW9uCmZyaWJpZGlfcmVvcmRlcl9saW5lOiBpbXBsZW1lbnQgTDIgcmVvcmRl
cmluZyBpbiBsaW5lYXIgdGltZQp0ZXN0OiBpbmNsdWRlIHN0ZGJvb2wuaCBpbiB0ZXN0LXJlb3Jk
ZXItbnNtLmMKbWVzb246IGZpeCBwYXJhbGxlbCBidWlsZCByYWNlIGZvciB0ZXN0LXJlb3JkZXIt
bnNtCmdlbi11bmljb2RlLXZlcnNpb246IGZpeCBNU1ZDIGxpbmsgZmFpbHVyZSBieSBhdm9pZGlu
ZyBzdHJuY2FzZWNtcApGaXggZnJpYmlkaV9zZXRfcmVvcmRlcl9uc20oKS9mcmliaWRpX3NldF9t
aXJyb3JpbmcoKSBub3QgYWZmZWN0aW5nCmdlbi1hcmFiaWMtc2hhcGluZy10YWI6IGZpeCByZW1h
aW5pbmcgLVdmb3JtYXQ9IG1pc21hdGNoIG9uCmdlbi11bmljb2RlLXZlcnNpb246IHJlcGxhY2Ug
bm9uLXBvcnRhYmxlIHN0cmNhc2VzdHIgd2l0aCBhIHBvcnRhYmxlCkRlZmluZSBfRlJJQklESV9U
WVBFX1NFTlRJTkVML19GUklCSURJX1BBUl9TRU5USU5FTCBpbiBib3RoIGVudW0KZ2VuLWFyYWJp
Yy1zaGFwaW5nLXRhYjogZml4IC1XZm9ybWF0LW92ZXJmbG93IHdhcm5pbmcgb24gR0NDIDE0ClVw
ZGF0ZSBVbmljb2RlIGNoYXJhY3RlciBkYXRhYmFzZXMgdG8gdjE4LjAuMApGaXggcXVhZHJhdGlj
IGJlaGF2aW9yIGluIE4wIGJyYWNrZXQgcGFpcmluZyBwcmVjZWRpbmctc3Ryb25nIHNlYXJjaApG
aXggb3V0LW9mLWJvdW5kcyByZWFkIG9uIHRyYWlsaW5nICdfJwpmcmliaWRpLW1haW46IGZpeCB0
cnVuY2F0aW9uIG9mIGxpbmVzL291dHB1dCBjb250YWluaW5nIGVtYmVkZGVkClBhaXIgYnJhY2tl
dHMgYnkgY2Fub25pY2FsIGVxdWl2YWxlbmNlIG9ubHksIHBlciBVQVggIzkgQkQxNgpSZW1vdmUg
dW51c2VkIGFwcHZleW9yIHlhbWwgZmlsZQpnaXRodWIgYWN0aW9uczogVXNlIGN1cnJlbnQgcHl0
aG9uIHZlcnNpb24KVXBkYXRlIG9sZCBGU0YgYWRkcmVzcwpSZW1vdmUgdW5uZWNlc3NhcnkgY3Vz
dG9tIHByb3RvdHlwZXMgZm9yIGdldGVudiBhbmQgZ2V0b3B0ClJlbW92ZSB1bnVzZWQgdHJhdmlz
IGZpbGUKZ2l0aHViIGFjdGlvbnM6IEluc3RhbGwgaGVscDJtYW4gdG8gZml4IHVidW50dSBidWls
ZApVcGRhdGUgVE9ETyAtIHJlbW92ZSByZWFkbWUgaXRlbQpEb24ndCByZXF1aXJlIGhlbHAybWFu
IHVubGVzcyBidWlsZGluZyBkb2NzCkdlbmVyYXRlIGZyaWJpZGkuMSBtYW4gcGFnZQpGaXggdHlw
b3MgaW4gZG9jczogImFuIHN0cmluZyIgLT4gImEgc3RyaW5nIgpnaXRodWIgYWN0aW9uczogVXBk
YXRlIHB5dGhvbiB2ZXJzaW9uIHRvIDMuMTIKVXBkYXRlIGdpdGh1YiBhY3Rpb25zIHZlcnNpb25z
CkFkZCBHTlUgTWFpbHV0aWxzIHRvIFVTRVJTCkZpeCB0eXBvCkZpeCBlcnJvciBoYW5kbGluZyBm
b3IgZmlsZSBvcGVyYXRpb25zCkZpeCBzdGFjayBidWZmZXIgb3ZlcmZsb3cgd2hlbiBwYXJzaW5n
IGVxdWl2YWxlbmNlCnJlbW92ZSBjb21waWxlciBmbGFnICItYW5zaSIKZGVidWc6IGRvbid0IHBh
c3MgYSBjb21tYSAiLCIgaW4gYSAjZGVmaW5lCkJ1bXAgdmVyc2lvbiB0byAxLjAuMTYKRml4IENJ
IGZhaWx1cmUKVXBkYXRlIFVuaWNvZGUgY2hhcmFjdGVyIGRhdGFiYXNlcyB0byB2MTYuMC4wCkZp
eCB0eXBvIGluIGZyaWJpZGktY2FwcnRsMnV0ZjguYyB0aGF0IGNhdXNlZCBjb21waWxhdGlvbiB3
YXJuaW5nCkJ1bXBlZCB2ZXJzaW9uIHRvIDEuMC4xNQpCdW1wZWQgdmVyc2lvbiB0byAxLjAuMTQK
VXBkYXRlIHVuaWNvZGUgY2hhcmFjdGVyIGRhdGFiYXNlcyB0byB2MTUuMS4wLgpVcGRhdGUgdGVz
dCBjYXNlcyB0byBVbmljb2RlIDE1LjEKbWVzb246IGZpeCBidWlsZCB3aXRoIC1EYmluPWZhbHNl
IGFuZCAtRHRlc3RzPXRydWUKQnVtcGVkIHZlcnNpb24gdG8gMS4wLjEzCnNpbXBsaWZ5IHZpc2li
aWxpdHkgaGFuZGxpbmcKbWVzb246IGZpeCB0d28gbWVzb24gd2FybmluZ3MKVXBkYXRlIHRlc3Qg
Y2FzZXMgdG8gVW5pY29kZSAxNS4wCm1lc29uOiBmaXggdHdvIG1lc29uIHdhcm5pbmdzCm1lc29u
OiBPdmVycmlkZSBkZXBlbmRlbmNpZXMgdG8gaW1wcm92ZSB1c2FnZSBhcyBhIHN1YnByb2plY3QK
Y2k6IFVwbG9hZCBsb2dzIG9uIGJ1aWxkIGZhaWx1cmUKY2k6IFVwZGF0ZSBweXRob24gdmVyc2lv
biBpbiBnaXRodWIgd29ya2Zsb3dzCm1lc29uOiBPdmVycmlkZSBkZXBlbmRlbmNpZXMgdG8gaW1w
cm92ZSB1c2FnZSBhcyBhIHN1YnByb2plY3QKVXBkYXRlIHRlc3QgY2FzZXMgdG8gVW5pY29kZSAx
NS4wCnNpbXBsaWZ5IHZpc2liaWxpdHkgaGFuZGxpbmcKcmVtb3ZlIHVzZWxlc3MgbGlicmFyeSBh
cmd1bWVudHMgYXBwbGllZCB0byBleGVjdXRhYmxlcwpNYWRlIGZyaWJpZGlfdXRmOF90b191bmlj
b2RlKCkgc2tpcCBpbmNvbXBsZXRlIHV0ZjggZW5jb2RlZCBjb2RlIHBvaW50cwpCdW1wZWQgdmVy
c2lvbiB0byAxLjAuMTIKQWRkIC1ERlJJQklESV9MSUJfU1RBVElDIHRvIGxpYmZyaWJpZGlfZGVw
CkZpeCBTRUdWIGlzc3VlIGluIGZyaWJpZGlfcmVtb3ZlX2JpZGlfbWFya3MKUHJvdGVjdGVkIGFn
YWluc3QgZ2FyYmFnZSBpbiB0aGUgQ2FwUlRMIGVuY29kZXIKRml4IHRoZSBzdGFjayBidWZmZXIg
b3ZlcmZsb3cgaXNzdWUKSW5jbHVkZSAtREZSSUJJRElfTElCX1NUQVRJQyBpbiBwa2ctY29uZmln
IG91dHB1dCBieSBkZWZhdWx0IHdoZW4KbWVzb246ICBEb24ndCBoYXJkY29kZSBweXRob24zIGlu
IHRlc3RzClVwZGF0ZSB0ZXN0IGNhc2VzIHRvIFVuaWNvZGUgMTQuMAptZXNvbjogIERvbid0IGhh
cmRjb2RlIHB5dGhvbjMgaW4gdGVzdHMKVXBkYXRlIHRlc3QgY2FzZXMgdG8gVW5pY29kZSAxNC4w
CkJ1bXBlZCB2ZXJzaW9uIHRvIDEuMC4xMQpbY2ldIEZpeCBjMm1hbiBwYXRoCltjaV0gVXBsb2Fk
IGRpc3QgdGFyYmFsbApPcGVuIEdpdEh1YiBDSTogYnVpbGQgd2l0aCBtYWtlClVwZGF0ZSB0byBV
bmljb2RlIDE0LjAKZml4IHR5cG8gaW4gdHJhbnNwYXJlbnRfZ2VuZXJhbF9jYXRlZ29yaWVzW10K
W2NpXSBmaXggZW52IHNldApbY2ldIGFkZCBjMm1hbiBidWlsZCBzdGVwCltjaV0gbWFrZSBpbml0
Ck9wZW4gR2l0SHViIENJOiBidWlsZCB3aXRoIG1lc29uCltjaV0gYWRkIHNvbWUgY29tbWVudHMK
W2NpXSBmaXggbXN2YyBzZXQgdXAKW2NpXSBtZXJnZSBpbnRvIG9uZSBqb2JzCltjaV0gdGVzdCBt
c3ZjCltjaV0gYWRkIHdpbgpbY2ldIGFkZCBtYWNPUwpbY2ldIG5vdCBidWlsZCBkb2NzCltjaV0g
aW5pdCBCdWlsZCB3aXRoIG1lc29uCk9ubHkgbWVyZ2UgcnVucyB3aXRoIHRoZSBzYW1lIGlzb2xh
dGUgbGV2ZWwuClByZXZlbnQgaXNvbGF0ZSBsZXZlbCBmcm9tIGJlaW5nIGRlY3JlYXNlZCBpZiBp
dCBpcyBhbHJlZHkgemVybwpbbWVzb25dIGZpeCBERVBSRUNBVElPTgpNZXJnZSBicmFuY2ggJ21h
c3RlcicgaW50byBtZXNvbi13YXJuaW5nCmZyaWJpZGktY29tbW9uLmg6IGRlZmluZSBGUklCSURJ
X0VOVFJZIHdoZW4gaXQgaXMgbm90IGRlZmluZWQKRG8gbm90IHBhc3MgYSBOVUxMIHN0cmluZyBw
b2ludGVyIHRvIHByaW50ZigpIGluCm1lc29uOiBhZGQgZnJpYmlkaV9zdGF0aWNfY2FyZ3MgdG8g
ZXh0cmFfY2ZsYWdzClttZXNvbi9mcmliaWRpXSBmaXggREVQUkVDQVRJT04KbWVzb246IGFkZCBm
cmliaWRpX3N0YXRpY19jYXJncyB0byBleHRyYV9jZmxhZ3MKZnJpYmlkaS1jb21tb24uaDogZGVm
aW5lIEZSSUJJRElfRU5UUlkgd2hlbiBpdCBpcyBub3QgZGVmaW5lZApTa2lwIGlzb2xhdGVzIGlu
IGZyaWJpZGlfZ2V0X3Bhcl9kaXJlY3Rpb24KQWRkIGEgZnV6emVyIHRvIGZyaWJpZGkKRml4ZWQg
ZGFuZ2xpbmcgcG9pbnRlciBwcm9ibGVtIGZvdW5kIGJ5IGZ1enppbmcKUmV2ZXJ0IHdoaXRlc3Bh
Y2UgY2hhbmdlcy4KRG8gbm90IHBhc3MgYSBOVUxMIHN0cmluZyBwb2ludGVyIHRvIHByaW50Zigp
IGluCkJ1bXBlZCB2ZXJzaW9uIHRvIDEuMC4xMApGaXggRlJJQklESV9FTlRSWSBvbiBXaW5kb3dz
CmZyaWJpZGktY29tbW9uLmg6IGluIHN0YXRpYyBtb2RlLCBkZWZpbmUgRlJJQklESV9FTlRSWSBv
bmx5IGlmIG5vdAptZXNvbjogcmVtb3ZlIHdyb25nIGFkZGl0aW9uYWwgJ2V4dGVybicgaW4gRlJJ
QklESV9FTlRSWQpGaXggRlJJQklESV9FTlRSWSBvbiBXaW5kb3dzCkRyb3Agbm9uLWV4aXN0ZW50
IC0tY2hhbmdlcyBmcm9tIGhlbHAgdGV4dAptZXNvbjogVXNlIHRoZSBgZGVidWdgIG9wdGlvbiBk
aXJlY3RseSBpbnN0ZWFkIG9mIGBidWlsZHR5cGVgCm1lc29uOiBhbGxvdyB0byBkaXNhYmxlIGJ1
aWxkaW5nIHRlc3RzIGFuZCBiaW5hcmllcwptZXNvbjogVXNlIHRoZSBgZGVidWdgIG9wdGlvbiBk
aXJlY3RseSBpbnN0ZWFkIG9mIGBidWlsZHR5cGVgCm1lc29uOiBhbGxvdyB0byBkaXNhYmxlIGJ1
aWxkaW5nIHRlc3RzIGFuZCBiaW5hcmllcwpCdW1wZWQgdmVyc2lvbiB0byAxLjAuOQpGaXhlZCBi
dWcgaW4gYWxnb3JpdGhtIGNhdXNpbmcgZXJyb25lb3VzIGNvbm5lY3Rpb25zIGJldHdlZW4gaXNv
bGF0ZQpDaGFuZ2VkIFwtMSB0byBcKG1pMSBpbiBmcmliaWRpX3JlbW92ZV9iaWRpX21hcmtzIGRv
Y3MuIElzc3VlICMxMzUKVXNlIExERkxBR1NfRk9SX0JVSUxEIGZvciBjcm9zcyBjb21waWxhdGlv
biAjMTE1Cldvcmthcm91bmQgZm9yIG1hbjJjIGVycm9yLiBJc3N1ZSAjMTI5LgpSZXN0b3JlZCBt
aXN0YWtlbmx5IHJlbW92ZWQgZGVwcmVjYXRlZCBmdW5jdGlvbgphdXRvdG9vbHM6IGdlbmVyYXRl
IHh6IGFyY2hpdmUgaW5zdGVhZCBvZiBiemlwMiBvbmUKQnVtcGVkIHZlcnNpb24gdG8gMS4wLjgK
Rml4ZWQgYnVnIGluIHRoZSB0aGUgYWxnbyBmb3IgbXVsdGlwbGUgaXNvbGF0ZXMgYXQgZGlmZmVy
ZW50IGxldmVscwpUcnVuY2F0ZSBpc29sYXRlX2xldmVsIHRvIEZSSUJJRElfQklESV9NQVhfRVhQ
TElDSVRfTEVWRUwKRml4IG1pc3BsYWNlZCBleHRlcm5hbCAiQyIgcG9zaXRpb24gbmVjZXNzYXJ5
IGZvciBDKysgY29tcGlsYXRpb24KVXBkYXRlZCB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIHVu
ZGVwcmVjYXRlZCBmcmliaWRpX2xvZzJ2aXMoKQpTb21lIGNsZWFudXAgb2YgbXkgbGFzdCBkZWRl
cHJlY2F0aW9uIGNoYW5nZXMuClVuZGVwcmVjYXRlZCBmcmliaWRpX3JlbW92ZV9iaWRpX21hcmtz
KCkgYW5kIGZyaWJpZGlfbG9nMnZpcygpLgpBZGRlZCBSRUFETUUubWQgdG8gdGhlIGRpc3RyaWJ1
dGlvbiB0YXJiYWxsIChmaXhlcyAjMTI1KQpCdW1wZWQgdmVyc2lvbiB0byAxLjAuNwpSZXBsYWNl
IFJFQURNRSBzeW1saW5rIHdpdGggcGxhaW4gdGV4dCBmaWxlLgpCdW1wZWQgdmVyc2lvbiB0byAx
LjAuNgphZGQgdGhlIEVGTCBhcyB1c2VycwpBdm9pZCB1c2Ugb2YgbGliYydzIGJzZWFyY2ggZm9y
IHBlcmZvcm1hbmNlIGFuZCBwb3J0YWJpbGl0eSByZWFzb25zCk1ha2UgcGFyYW1ldGVyIHF1YWxp
ZmllcnMgbWF0Y2ggYmV0d2VlbiBkZWNsYXJhdGlvbiBhbmQgZGVmaW5pdGlvbgpCbGluZCBmaXgg
Zm9yIFBhbmdvIGJ1aWxkClByb3Blcmx5IGV4cG9ydCBmcmliaWRpX3VuaWNvZGVfdmVyc2lvbgpV
cGRhdGVkIFRyYXZpcyBzZXR0aW5ncwpGaXhlZCB0eXBvClJlbW92ZWQgc3VkbwpSZXZlcnQgInRy
YXZpcy55bWw6IFVzZSB0aGUgbWVzb24gc3RhYmxlIGJyYW5jaCB0byB3b3JrYXJvdW5kCk1pc2Mu
IHNvdXJjZSBjb21tZW50IGFuZCBkb2N1bWVudGF0aW9uIHR5cG8gZml4ZXMKbWVzb246IFBhc3Mg
dmlzaWJpbGl0eSBhcmdzIHRvIHRlc3QgZXhlY3V0YWJsZQptZXNvbjogUGFzcyB2aXNpYmlsaXR5
IGFyZ3MgdG8gdGhlIGV4ZWN1dGFibGVzCkRlcGVuZCBvbiB0aGUgZ2VuZXJhdGVkIGhlYWRlcnMg
ZXhwbGljaXRseQpBZGQgQXBwVmV5b3IgQ0kgc3VwcG9ydAp0cmF2aXMueW1sOiBVc2UgdGhlIG1l
c29uIHN0YWJsZSBicmFuY2ggdG8gd29ya2Fyb3VuZCByZWdyZXNzaW9uCm1lc29uOiBEZWNsYXJl
IGxpYmZyaWJpZGkgYXMgYSBkZXBlbmRlbmN5IGZvciB1c2FnZSBhcyBhIHN1YnByb2plY3QKdGVz
dHM6IEZpeCBidWlsZCBvbiBwcmUtQzk5IGNvbXBpbGVycwpCdWlsZCBhbHNvIHdpdGggbWVzb24g
b24gVHJhdmlzCkJ1aWxkIGdlbmVyYXRvciBleGVjdXRhYmxlcyBuYXRpdmVseQpSZW1vdmVkIEhB
VkVfQ09ORklHX0ggZnJvbSBwdWJsaWMgQVBJCkZpeGVkIGJ1ZyBQRlJJQklESV9UWVBFX1BERl9M
UkkgaXMgdW5kZWZpbmVkLiBJc3N1ZSAjNjkKVXBkYXRlZCBORVdTIGZpbGUuCkJ1bXBlZCB2ZXJz
aW9uIHRvIDEuMC41CkZpeGVkIHJlbWFpbmluZyAxNiBjaGFyIHRlc3RzIGVycm9ycy4KUmVtb3Zl
IHNraXBwaW5nIHRlc3RzIGFuZCBmaXhlZCB0d28gdGVzdCBlcnJvcnMuClJlZHVjZSBkeW5hbWlj
IGFsbG9jYXRpb25zIGJ5IHVzaW5nIGFycmF5cyBmb3IgYWxsIHNtYWxsIGFycmF5cy4KQnVtcGVk
IHZlcnNpb24gdG8gMS4wLjQuClVwZGF0ZSB0byBVbmljb2RlIDExCm1lc29uOiBkb2NzOiBkb24n
dCByZXF1aXJlIGMybWFuIGZvciB0YXJiYWxsIHdpdGggcHJlLWdlbmVyYXRlZApVcGRhdGUgdG8g
VW5pY29kZSAxMQpVcGRhdGVkIE5FV1MgZmlsZS4KQnVtcGVkIHZlcnNpb24gdG8gdjEuMC4zCkZp
eGVkIHVuaW5pdGlhbGl6ZWQgbWVtb3J5IGFjY2Vzcy4gSXNzdWUgIzU4LgpGaXhlZCBjb21waWxh
dGlvbiBlcnJvcnMgaW4gZGVidWcgbW9kZQpVcGRhdGUgLnRyYXZpcy55bWwKUmV2ZXJ0ICJBZGQg
YW4gb3B0aW9uIHRvIGRpc2FibGUgYnVpbGRpbmcgZG9jdW1lbnRhdGlvbiIKQWRkIHRlc3RfQ2Fw
UlRMX2lzb2xhdGUuKiB0byB0ZXN0L01ha2VmaWxlLmFtClZlcnNpb24gMS4wLjIgcmVsZWFzZSB1
cGRhdGUKTWFkZSB0aGUgUkVBRE1FIGFuZCB0aGUgSElTVE9SWSBtb3JlIHVwIHRvIGRhdGUuCkdM
aWIgaXMgZ29uZQpGaXggbWVtb3J5IGxlYWtzClJlbmFtZSBhdXRvdG9vbHMgdGVzdCBleGVjdXRh
YmxlcyBhcyB3ZWxsClJlbmFtZSB0ZXN0LmMgYW5kIHRlc3QtY2hhcmFjdGVyLmMgdG8gbWF0Y2gg
dW5pY29kZSB0ZXN0IG5hbWVzClR3byB0ZXN0IGZpeGVzIGZvciBtZXNvbi4KUmVtb3ZlIGdsaWIg
ZGVwZW5kYW5jeSBmcm9tIHRlc3QuYyBhbmQgdGVzdC1jaGFyYWN0ZXIuYyAuCkZpeCBtZW1vcnkg
bGVhawptZXNvbjogZml4IGRvY3MgaW5zdGFsbAp0ZXN0LXJ1bm5lci5weTogRml4IHJ1bm5pbmcg
b24gVmlzdWFsIFN0dWRpbyBidWlsZHMKZ2VuLWJyYWNrZXRzLXRhYi5jOiBEZWNsYXJlIHZhcmlh
YmxlcyBhdCB0b3Atb2YtYmxvY2sKcGFja3RhYi5jOiBEb24ndCB1c2UgcG93IGFzIHZhcmlhYmxl
IG5hbWUKQWRkZWQgc29tZSBtb3JlIHRoYW5rcyEKVXBkYXRlZCBUSEFOS1MgZmlsZS4KVXBkYXRl
IEFVVEhPUlMgZmlsZSB0byByZWZsZWN0IHRoZSBjdXJyZW50IHN0YXRlIG1vcmUgYWNjdXJhdGVs
eS4KVXNlIHNhbWUgYzJtYW4gb3B0aW9ucyBpbiBtZXNvbiBhcyBpbiBhdXRvdG9vbHMKQWRkZWQg
aW5mbyB0byBSRUFETUUgZmlsZSBhYm91dCBjb21tZXJjaWFsIGxpY2Vuc2luZyBvcHRpb25zLgpB
ZGQgc3VwcG9ydCBmb3IgYnVpbGRpbmcgd2l0aCB0aGUgTWVzb24gYnVpbGQgc3lzdGVtCmJ1aWxk
OiBkaXN0IE1lc29uIGJ1aWxkIGZpbGVzIGluIGF1dG90b29scyB0YXJiYWxsCm1lc29uOiBmaXgg
YnVpbGQgd2l0aCBtc3ZjCmZyaWJpZGktY29uZmlnOiBhZGQgZGVmaW5lIGZvciB3aGVuIGZyaWJp
ZGkgd2FzIGJ1aWx0IHdpdGggTVNWQwpBZGQgc3VwcG9ydCBmb3IgYnVpbGRpbmcgd2l0aCB0aGUg
TWVzb24gYnVpbGQgc3lzdGVtCkZpeCBidWlsZCB3aXRoIERFQlVHIGRlZmluZWQKbGliOiBkZWNv
cmF0ZSBmcmliaWRpX3ZlcnNpb25faW5mbyB3aXRoIEZSSUJJRElfRU5UUlkKRHJvcCBGUklCSURJ
X05BTUVTUEFDRSBhbmQgaXRzIHZhcmlhbnRzCkZvbGQgY2hhcnNldCBpbnRvIGxpYgpEcm9wIC0t
ZGlzYWJsZS1jaGFyc2V0cwpGaXggLS1kaXNhYmxlLWRlcHJlY2F0ZWQgYW5kIC0tZGlzYWJsZS1j
aGFyc2V0cwpDVlMgaXMgbG9uZyBkZWFkIGFuZCBidXJpZWQgW2NpIHNraXBdCkZpeCBkb2N1bWVu
dGF0aW9uIGluc3RhbGxhdGlvbiBvbiBGcmVlQlNEClNob3cgYWxsIGxvZ3Mgb24gZmFpbHVyZQpC
dWlsZCBjMm1hbiBvbiBUcmF2aXMKQWRkIGFuIG9wdGlvbiB0byBkaXNhYmxlIGJ1aWxkaW5nIGRv
Y3VtZW50YXRpb24KTWFrZSB0aGUgcnVsZXMgZm9yIGdlbmVyYXRlZCBmaWxlcyBsb29rIG5pY2Vy
CkRyb3AgdGhlIHJlc3Qgb2YgI2lmIEZPTyswClJlcGxhY2UgYm9vdHN0cmFwIHdpdGggc2ltcGxl
ciBhdXRvZ2VuLnNoCk1vdmUgZnJpYmlkaS12cy11bmljb2RlIHRvIHRlc3QgZGlyClRyeSBmaXhp
bmcgcGFyYWxsZWwgYnVpbGQgZnJvbSBnaXQgY2hlY2tvdXQKUmVtb3ZlIG5vdGVzLm9yZwpLZWVw
IG1pY3JvIHZlcnNpb24gaW4gZnVsbCB2ZXJzaW9uIGV2ZW4gaWYgMApSZWxlYXNlIDEuMC4xCkZp
eCBvZiBtaW5vciByZWZlcmVuY2UgZXJyb3IuCk1pc2MuIHR5cG9zCkZpeCBwYXJhbGxlbCBidWls
ZApNaXNjLiB0eXBvcwpVcGRhdGUgZ2l0Lm1rClRvd2FyZHMgZml4aW5nIG91dC1vZi10cmVlIGJ1
aWxkcwpbZ2VuLnRhYl0gUmVtb3ZlIHJlbGlhbmNlIG9uIFZQQVRICkZpeCBub24tZGVidWcgYnVp
bGQKUHJlcGFyaW5nIGZvciByZWxlYXNlIDEuMC4wLgpGaXggY2xhbmcgY3Jvc3MgY29tcGlsZXMK
Rml4IGNsYW5nIGNvbXBpbGVzCkxlc3MgaGFja2lzaCBjcm9zcyBjb21waWxhdGlvbiBzdXBwb3J0
LgpTaW1wbGlzdGljIGNyb3NzIGNvbXBpbGF0aW9uIHN1cHBvcnQgZnJvbSBhIGdjYyBiYXNlZCBz
eXN0ZW0uCkRvIG5vdCBjYWxsIGJvb3RzdHJhcCBmcm9tIG1ha2UKVXBkYXRlIHN5bWJvbCBsaXN0
CkZpeCBzb25hbWUKTWlzYyB3YXJuaW5nIGZpeGVzCkZpeCBidWlsZApEcm9wIENWUyBrZXl3b3Jk
cyB0aGF0IG1ha2Ugbm8gc2Vuc2Ugbm93CkRvYyBmaXhlcwpEb2N1bWVudCBmcmliaWRpX2dldF9i
cmFja2V0cwpGaXggZG9jIGJ1aWxkClRoaW5rbyEKRml4IGJ1aWxkaW5nIHdpdGggLVdlcnJvcj11
bmRlZgpGaXggbWFrZSBkaXN0Y2hlY2sKU2hvdyB0ZXN0LXN1aXRlLmxvZyBvbiBmYWlsdXJlCkZp
eCBtYWtlIGRpc3RjaGVjawpGaXggYnVpbGQgd2l0aCAtV2Vycm9yPXVuZGVmClNpbXBsaWZ5IGZy
aWJpZGktdHlwZXMuaCBhIGJpdApGUklCSURJX0NIVU5LX1NJWkUgaXMgbm90IHVzZWQgYW55d2hl
cmUKU2V0dXAgVHJhdmlzIENJIGJ1aWxkcwpVcGRhdGVkIHRoZSBDYXBSVEwgcmVmZXJlbmNlIHRl
c3QuCkZpeGVkIGNyaXRpY2FsIGJ1ZyBpbiBmcmliaWRpX2dldF9icmFja2V0X3R5cGVzKCkuCkNs
ZWFuIHVwIG9mIGRlYWQgY29kZS4KVXBkYXRlZCBsaWNlbnNpbmcgaW5saW5lIGRvY3VtZW50YXRp
b24uClJ1biBmcmliaWRpLXZzLXVuaWNvZGUgdGVzdHMgd2l0aCBtYWtlIGNoZWNrCkRpc2FibGUg
bWFrZSBkaXN0Y2hlY2sgb24gVHJhdmlzIGZvciBub3cKQWRkIFRyYXZpcyBDSSBzdXBwb3J0ClJl
c3RvcmUgY2FsbCB0byBmcmliaWRpX3VuaWNvZGVfdG9fY2hhcnNldApUdXJuZWQgRnJpYmlkaUJy
YWNrZXRUeXBlIGludG8gYSBzaW1wbGUgVUlOVDMyIGluc3RlYWQgb2YgYSBzdHJ1Y3QuCkZpeGVk
IHJldmVyc2VkIGxvZ2ljcyBpbiBvcHRpbWl6YXRpb24gaW4gZnJpYmlkaS1icmFja2V0X3R5cGVz
KCkuCkRyb3AgZ2xpYiBkZXBlbmRlbmN5ClJlbW92ZSBtb3JlIHJlbW5hbnRzIG9mIEdMaWIgc3Vw
cG9ydApEcm9wIEdMaWIgdXNlIGluIHRoZSBsaWJyYXJ5IGFuZCBtYWluIHByb2dyYW0KVW51c2Vk
IG1hY3JvCkNvcHkgQkVHSU4vRU5EX0lHTk9SRV9ERVBSRUNBVElPTlMgZnJvbSBHTGliCkp1c3Qg
dXNlIHRoZSBHQ0MgYXR0cmlidXRlcyBoZXJlIGRpcmVjdGx5IGFzIHdlbGwKVGhlc2UgZGVmaW5p
dGlvbnMgZG9u4oCZdCBkZXBlbmQgb24gR0xpYgpDb3B5IExJS0VMWS9VTkxJS0VMWSBmcm9tIEdM
aWIKRml4ZWQgcG90ZW50aWFsIGNyYXNoIGluIHRoZSBnZW4tYnJhY2tldHMtdGFiIGNvZGUuCkdv
dCByaWQgb2YgcmVtYWluaW5nIHdhcm5pbmdzLgpDaGFuZ2VkIGZyaWJpZGlfbG9nMnZpcyAoZGVw
cmVjYXRlZCBidXQgdWJpcXVpdGl0b3VzKSB0byB1c2UgbmV3IGFwaS4KTWVyZ2UgcmVtb3RlLXRy
YWNraW5nIGJyYW5jaCAnZnJpYmlkaS9tYXN0ZXInIGludG8gdW5pY29kZS0xMApSZXN0b3JlZCB0
aGUgb2xkIEFQSSBhbmQgbWFkZSBpdCBkZXByZWNhdGVkLgpVcGRhdGUgUkVBRE1FLm1kClJlbW92
ZSBnZW5lcmF0ZWQgTWFrZWZpbGUKTWVyZ2UgcmVtb3RlLXRyYWNraW5nIGJyYW5jaCAnZnJpYmlk
aS91bmljb2RlLTEwJyBpbnRvIHVuaWNvZGUtMTAKRml4ZWQgY29tcGlsYXRpb24gZXJyb3JzLgpV
c2UgdHJ1ZS9mYWxzZSBpbnN0ZWFkIG9mIFRSVUUvRkFMU0UgZm9yIGNvbnNpc3RlbmN5Ck1ha2Ug
aXQgY29tcGlsZQpGaXggdHlwbwpBZGRlZCBVbmljb2RlIDYuMyBzdXBwb3J0IChhbmQgYmV5b25k
KQpVcGRhdGVkIFVuaWNvZGUgZGF0YSB0YWJsZXMgdG8gdmVyc2lvbiAxMC4KRml4IGJ1aWxkIHdp
dGhvdXQgZ2xpYgpBY3R1YWxseSBhZGQgZnJpYmlkaS12cy11bmljb2RlL01ha2VmaWxlLmFtClJl
bW92ZSBiaXRyb3QgY29kZQpVbnVzZWQgdmFyaWFibGUgd2FybmluZ3MKSWdub3JlIG91ciBvd24g
ZGVwcmVjYXRpb25zClJlbW92ZSBTQ29uc3RydWN0CkJ1aWxkIGZyaWJpZGktdnMtdW5pY29kZSBi
aW5hcmllcwpNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdkb3YvZG92LXVuaWNvZGU2MycK
UmV2ZXJ0ICJBZGQgZnJpYmlkaV9yZW9yZGVyX3J1bnMoKSIKTW9zdGx5IG5vdGVzIGFuZCBzb21l
IGNvbXBpbGF0aW9uIGlzc3Vlcy4KRG92J3Mgd29yayBhcmVhIGZvciB1bmljb2RlNjMgZGV2ZWxv
cG1lbnQuCkZpeGVkIGFsbCByZW1haW5pbmcgQmlkaVRlc3QudHh0IGJ1Z3MuClNvbHZlZCBtYXgg
bGV2ZWwgcmVsYXRlZCBidWcuCkluaXRpYWwgdW5pY29kZTYzIHN1cHBvcnQuClJlbW92ZSBjdXN0
b20gbWVtb3J5IGFsbG9jYXRvcgpObyBuZWVkIGZvciB0aGUgd2FycHBlciBmdW5jdGlvbiBub3cK
UmVtb3ZlIGN1c3RvbSBtZW1vcnkgYWxsb2NhdG9yCkFkZCBmcmliaWRpX3Jlb3JkZXJfcnVucygp
Ck1pbm9yCjAuMTkuNwpGaXggbWlzYyBhdXRvdG9vbHMgd2FybmluZ3MKVXBkYXRlZCBteSBlbWFp
bC4KaWdub3JlIENPTFVNTlMgZm9yIC0taGVscCBhbmQgLS10ZXN0Ck9ubHkgaW5jbHVkZSBwdWJs
aWMgZ2xpYi5oCkZpeCB3YXJuaW5nClN1cHBvcnQgNC1ieXRlIFVURi04IHNlcXVlbmNlcwpEaXNh
YmxlIG1lbW9yeSBwb29sIGJ5IGRlZmF1bHQKMC4xOS42ClBvcnQgdGVzdCBzdWl0ZSB0byBhdXRv
bWFrZSAxLjEzClJldmVydCAiVHJ5IHRvIGhlbHAgc29tZSBidWlsZHMgKG9uIFdpbmRvd3MsIG5v
IGxlc3MpIgpUcnkgdG8gaGVscCBzb21lIGJ1aWxkcyAob24gV2luZG93cywgbm8gbGVzcykKSW52
b2tlIHBrZy1jb25maWcgbWFjcm9zIHByb3Blcmx5CkZpeCBtaXNwcmludApGaXggcnVsZSBYOCB3
aGVuIHBhcmFncmFwaC1zZXBhcmF0b3IgaXMgcHJlc2VudApGaXggYnVnIHdpdGggcnVsZSBXNQpG
aXggdGVzdCB3aGVuIEVYRUVYVCBpcyBub3QgZW1wdHkKUmVtb3ZlIG9sZCBjcnVmdApGaXggZXhw
b3J0LXN5bWJvbHMgb24gV2luZG93cwpGaXggdGhlb3JldGljYWxseSBwb3NzaWJsZSBvdmVyZmxv
dwowLjE5LjUKVXBkYXRlIHRvIFVuaWNvZGUgNi4yClVwZGF0ZSBGU0YgYWRkcmVzcwpCdWcgNTQx
NDkgLSBGaXggdHlwbyBpbiBmcmliaWRpIGhlbHAgaW5mb3JtYXRpb24KTWlub3IKMC4xOS40CkFk
ZCBnaXQubWsKVXBkYXRlIENoYW5nZUxvZyBnZW5lcmF0aW9uIHRvIGdpdApVcGRhdGUgVW5pY29k
ZSBkYXRhIGZpbGVzIHRvIDYuMS4wCk1vZGVybml6ZSBhdXRvZm9vIGEgYml0Ck1pbm9yIG9wdGlt
aXphdGlvbiBpbiBzdHJ1Y3QgbGF5b3V0IGZvciA2NGJpdCBzeXN0ZW1zClVwZGF0ZSB0byBVbmlj
b2RlIDYuMC4wIGFuZCBidW1wIHZlcnNpb24gdG8gMC4xOS4zCkZpeCBidWlsZCB3aXRob3V0IGNo
YXJzZXQgY29udmVydGVycwpJbmNsdWRlIHRvcGxldmVsIGdsaWIuaCBvbmx5ClN1cHBvcnQgd2lu
MzIgYmVuY2htYXJraW5nCltkb2NdIE1ha2Ugc3VyZSBhIG1pbnVzIGlzIHVzZWQsIG5vdCBhIGh5
cGhlbi4KTkVXUywgY29uZmlndXJlLmFjOiBSZWxlYXNlZCBHTlUgRnJpQmlkaSAwLjE5LjIuCkJ1
Z3ppbGxhIOKAkyBCdWcgMjA4ODcgUHJvYmxlbSB3aXRoIGhhbmRsaW5nIGEgY2VydGFpbiBzZXF1
ZW5jZSBvZgpBZGQgQWJzb2x1dGVUZWxuZXQuCkZpeCB0eXBvcy4KSGFuZGxlIFJMTS9MUk0gaW4g
Q1AxMjU1IGNoYXJzZXQgY29udmVydGVyLiAgKCMxNTMyOCwgQXJ0eW9tKQpVcGRhdGUgdG8gVW5p
Y29kZSBDaGFyYWN0ZXIgRGF0YWJhc2UgNS4xLjAKUmVsZWFzZWQgR05VIEZyaUJpZGkgMC4xOS4x
LgpSZW1vdmUgUlBNIHZlcnNpb25pbmcgY3J1ZnQuClJlbW92ZSBzcGVjIGZpbGUuICBOb2JvZHkg
dXNlcyB1cHN0cmVhbSBzcGVjIGZpbGVzIHRoZXNlIGRheXMuCkFkZCByZW1haW5pbmcgaXNzdWVz
IGJlZm9yZSBhIHJlbGVhc2UgY2FuIGJlIG1hZGUuCkF2b2lkIG5vbi1jb25zdCBzdHJ1Y3QgaW5p
dGlhbGl6ZXIuCk1ha2Ugc3VyZSB3ZSBlcnIgaWYgc3RyaW5naXplIGlzIG5vdCBhdmFpbGFibGUu
CkNoZWNrIGZvciAoZGVmaW5lZChXSU4zMikpIHx8IChkZWZpbmVkKF9XSU4zMl9XQ0UpKSB0byBk
ZXRlY3QgV2luQ0UgdG9vClNraXAgZXhwbGljaXRzLWxpc3QgcmVpbnNlcnRpb24gaWYgbGlzdCBp
cyBlbXB0eS4KVXBkYXRlIHRvIFVuaWNvZGUgQ2hhcmFjdGVyIERhdGFiYXNlIDUuMC4wLgpBZGQg
Tm9raWEgOTExMCBIZWJyZXcgU3VwcG9ydCBwYWNrYWdlLgpNb3JlIGNvbW1lbnRzLgpOb3RlIGFi
b3V0IGxpbmUtYnJlYWtpbmcuClVzZSAtbm8tdW5kZWZpbmVkIHVuY29uZGl0aW9uYWxseS4KQWRk
IGFuIG9wdGlvbiAtLWRpc2FibGUtZGVwcmVjYXRlZC4KQWRkIGV4dHJhIGJyYWNlcyB0byBzaHV0
IGdjYyB3YXJuaW5ncyB1cC4KU2h1dCBnY2Mgd2FybmluZ3MgdXAuClVzZSBtZW1jcHkgZm9yIGR1
cGxpY2F0aW5nIHN0ci4KSW5jbHVkZSBzdHJpbmcuaC4KQWRkZWQgSGVicmV3U2VydmljZS4KQWRk
ZWQgZnJpYmlkaV9nZXRfdHlwZV9pbnRlcm5hbCBhcyBhIGRlcHJlY2F0ZWQgc3ltYm9sLgpBZGRl
ZCBOYW5vLVguClNldCBURVNUU19FTlZJUk9OTUVOVD0vYmluL3NoIHRvIGF2b2lkIHByb2JsZW0g
d2hlbiBydW5uaW5nIHdpdGgKQWRkZWQgYSBGSVhNRSBhYm91dCBub3QgaGFuZGxpbmcgRmlyc3Qu
Lkxhc3QgcmFuZ2VzIGluIFVuaWNvZGVEYXRhLnR4dC4KQXJhYmljIHNoYXBpbmcgc3VwcG9ydCBh
ZGRlZC4KUmVwbGFjZWQgYnVnIFVSTC4KVXNlIHNlZCBpbnN0ZWFkIG9mICQoU0VEKS4KVXBkYXRl
ZCBhbmQgYW5ub3RhdGVkLgpNb3ZlZCBCaUNvbiB1cCwgc2luY2UgaXQncyBhbiBlYXN5IHNhbXBs
ZSB0byBzdHVkeS4KQmV0dGVyIGhhbmRsaW5nIG9mIHN5cy90aW1lcy5oLiAgQWxzbywgZG9uJ3Qg
cGFzcyAtcGVkYW50aWMgdG8gZ2NjLgpBZGRlZCBmcmliaWRpX3ZlcnNpb25faW5mby4KVXNlIGNh
cGl0YWwgaGV4IGRpZ2l0cy4KU21hbGwgY2hhbmdlIHRvIG5vdCBydW4gbGlidG9vbCBpZiB0aGUg
cGFja2FnZSBkb2Vzbid0IHVzZSBpdC4KTWlub3IuCkNvdXBsZSBpdGVtcyBhZGRlZCA7KS4KU21h
bGwgY2hhbmdlcyB0byBzaHV0IGdjYyB3YXJuaW5ncyB1cC4KU21hbGwgZWRpdHMuCk1pc2MgZml4
ZXMuCkluIFVuaWNvZGUgNC4xLjAsIHRoZSBSZWFkTWUudHh0IGRvZXNuJ3QgY29udGFpbiB0aGUg
VW5pY29kZSB2ZXJzaW9uCkV4dHJhIHNwYWNlIHJlbW92ZWQhClNtYWxsIGZpeGVzLgpBbiBpbnRl
Z3JhdGVkIENhcFJUTCB0byBVVEYtOCBjb252ZXJ0ZXIgYWRkZWQuCkFkZGVkLiAgRW51bWVyYXRl
cyBiaWRpIGNoYXIgdHlwZXMgaW50byBzdGRvdXQuClVuaWNvZGUgNC4xIGNoYXJhY3RlciBkYXRh
YmFzZSB1cGRhdGUuCkJldHRlciBjb252ZXJzaW9uIHRhYmxlIGZyb20gQ2FwUlRMIHRvIFVuaWNv
ZGUuCk1hZGUgdGhlIHdvcmRpbmcgYSBsaXR0bGUgbW9yZSBmb3JtYWwsIHJlbW92ZWQgam9rZXMg
YW5kIHNhZCBzdG9yaWVzLgpDb3JyZWN0aW5nIHRoZSB0YWJsZS4KQ2xlYXJpbmcgc29tZSB0eXBv
cy4KQWRkaW5nIENhcFJUTCB0byBVbmljb2RlIChVVEYtOCkgY29udmVydG9yLgpBZGRlZCBHZXJl
c2guCk1pbm9yIGNoYW5nZSBpbiBjb21tZW50czogIFVzaW5nICJBdXRob3JzKHMpIiBpbiB0aGUg
ZmlsZSBoZWFkZXIuCkhlcmUgYW5kIHRoZXJlIHNtYWxsIGltcHJvdmVtZW50cy4KQWRkZWQuICBM
aXN0IG9mIHByb2plY3RzIHVzaW5nIEZyaUJpZGkuCkFkZGVkIHRlc3RfVVRGLThfcmVvcmRlcm5z
bSB0byBNYWtlZmlsZS4KSGVyZSBhbmQgdGhlcmUgZml4ZXMsIGZvdW5kIGJ5IHRyeWluZyB0byBj
b21waWxlIG9uIHNmLm5ldCBDb21waWxlCldlbGwsIGp1c3QgdGVzdGluZyBuZXcgbWFpbGRpZmYg
c2NyaXB0LgpBbm90aGVyIFRPRE8gaXRlbSBhZGRlZC4KQm9yaW5nIGFkZGl0aW9uIG9mIG5ldyBU
T0RPIGl0ZW1zIDotKC4KVHdvIHNtYWxsIGZpeGVzIHRvIG1ha2UgY29tcGlsYXRpb24gd2l0aCAt
RERPTlRfSEFWRV9GUklCSURJX0NPTkZJR19IClJlaW1wbGVtZW50ZWQgQXJhYmljIGpvaW5pbmcu
ICBIb3BlZnVsbGx5IGl0J3MgY29uZm9ybWluZyB0byB0aGUKV2UgbmVlZCBiaWRpX3R5cGVzIGFs
bCBvdmVyIHRoZSBwbGFjZSAoaW4gam9pbmluZywgaW4gc2hhcGluZywgLi4uKSwgc28KRml4ZWQg
YSBidWcgaW4gZnJpYmlkaV9sb2cydmlzKCksIGFsc28gY2hhbmdlZCBmcmliaWRpX3Jlb3JkZXJf
bGluZSgpClJldmVyIGJhY2sgdG8gb3VyIG9sZCBsZXZlbCBzZXR0aW5nIGZvciBCTiBhbmQgZXhw
bGljaXRzLiAgVGhlIG5ldwpGaXhlZCBnb29kIGNhdGNoIGJ5IE1hcmsgRGF2aXMgdGhhdCBydWxl
IEwxIGlzIHBhcnRseSBkb25lIGFmdGVyIGxpbmUKT2gsIG5vIG5lZWQgdG8gYWRkIHRhYmxlcyBm
b3IgZ2VuZXJhbCBjYXRlZ29yeSBDZiwgaXQgY2FuIHJvdWdobHkKQXJhYmljIGpvaW5pbmcgaXMg
YWxtb3N0IGNvbXBsZXRlLiAgR29pbmcgZm9yIFNoYXBpbmcuCk9vcHMsIEkgY2hhbmdlZCBQZXJz
aWFuIFllaCB0byBBcmFiaWMgWWVoIGxhc3QgdGltZSA6Ij4uClJlcGxhY2UgQXJhYmljIFllaCB3
aXRoIFBlcnNpYW4gWWVoLgpmcmliaWRpLWJpZGktdHlwZS5bY2hdIG1lcmdlZCBpbnRvIGZyaWJp
ZGktYmlkaS10eXBlcy5bY2hdLgpmcmliaWRpX2dldF9iaWRpX3R5cGVzIGlzIGJhY2suICBBbGxv
dyBwYXNzaW5nIGJpZGkgdHlwZXMgdG8KRmlyc3Qgam9pbmluZyBzdHVmZiBjaGVja2VkIGluLiAg
R2VuZXJhdGUgam9pbmluZyB0YWJsZSB1c2luZwpXb3chISEgIEkgdXNlIHRoZSB3b25kZXJmdWwg
cGFja3RhYiB0byBjb21wcmVzcyB0aGUgbWlycm9yaW5nClJlZHVuZGFudCBhbmQgY29tcGF0aWJp
bGl0eSBzdHVmZiByZW1vdmVkLiAgQSBmZXcgbWFjcm9zIGFkZGVkLApOb3Qgc2VyaW91cyBjaGFu
Z2VkLiAgR29pbmcgdG8gcmVtb3ZlIGVhc3ktdG8tcmVwbGFjZSBjb21wYXRpYmlsaXR5CkZpbmFs
bHkgZG9uZSB3aXRoIHRoZSBjbGVhbiBBUEkgZm9yIGJpZGkgZnVuY3Rpb25hbGl0eS4gIFRoZSBB
UEkgaXMKSXNvbGF0aW5nIGJpZGkgcmVvcmRlcmluZyBjYWxsLCB0YWtlIDEuCkFueW9uZSBzZWVu
IG15IGxvZyA7LSkuCkNsZWFuaW5nIHVwIGhlcmUgYW5kIHRoZXJlLiAgTGFzdCBsaW5nZXJzIGJl
Zm9yZSBhZGRpbmcgam9pbmluZy4KR05VIENvZGluZyBTdGFuZGFyZHMgYXBwbGllZCBhbmQgdHlw
b3MgZml4ZWQuCkdOVSBDb2RpbmcgU3RhbmRhcmRzIGFwcGxpZWQgd2hlcmUgYXBwcm9wcmlhdGUu
ClRvIGJlIG1vdmVkIHRvIGdlbi50YWIvCldlIG5lZWQgVW5pY29kZURhdGEudHh0IGZvciBzaGFw
aW5nIHRhYmxlcywgc28gc2VlbXMgbGlrZSB3ZSBhcmUKVHdlYWtlZCB0aGUgaGVhZGVycyBhZ2Fp
bi4gIEFjY29yZGluZyB0byBHTlUgR1BMIG5vdy4KT2ssIG5vdyBETEwgYnVpbGQgd29ya3Mgd2l0
aCBDeWd3aW4uICBTdGlsbCByZW1haW5zIHRvIHRlc3Qgd2l0aCBNaW5ndy4KT2ssIHNlZW1zIGxp
a2UgdGhlcmUgYXJlIGEgZmV3IGJpdHMgd3JvbmcgaW4gUGFuZ28sIGFuZCBJIHNpbXBseQpTZWVt
cyBsaWtlIHVzaW5nICRidWlsZF9vcyBpbnN0ZWFkIG9mIGJyb2tlbiAkaG9zdCBzaG91bGQgZml4
IHRoZQpUcnlpbmcgdG8gYnVpbGQgRExMIG9uIEN5Z3dpbi4KRGVmaW5lIGV4dHJhIEdOVSBmdW5j
dGlvbiBhdHRyaWJ1dGVzIG9ubHkgaWYgdXNpbmcgR0xJQi4KQWRkZWQgYSBkdW1teSBnZXR0ZXh0
LmggdGhhdCBzaW1wbHkgZGVmaW5lcyAiZ2V0dGV4dCIgdG8gbnVsbC4KQW5vdGhlciBvb3BzLiAg
WW91IGtub3csIGl0J3MgNzozMCBpbiB0aGUgbW9ybmluZyEKTXkgb29wcy4gIFNvcnJ5LgpBZGRl
ZCAkKEVYRUVYVCkgdG8gYmluYXJpZXMgd2UgYnVpbGQgYW5kIHJ1biwgdG8gbWFrZSBjeWd3aW4t
c2FmZS4KTW92ZWQgZ2VuLnRhYiB0byB0aGUgZmlyc3Qgc3ViZGlyLgpTbWFsbCBmaXhlcy4KV2hl
biByZWFkaW5nIERlcml2ZWRCaWRpQ2xhc3MudHh0LCBzaG91bGQgb25seSBkZWZhdWx0IHRvIEwu
Ck1ha2UgZ2VuLW1pcnJvcmluZy10YWIgYW5kIGdlbi11bmljb2RlLXZlcnNpb24gd29yay4gIGdl
bi50YWIvCk1ha2luZyBnZW4tYmlkaS10YWIgd29yaywgYW5kIG1vcmUgY2xlYW4gdXAuCmdlbi11
bmljb2RlLXZlcnNpb24gaXMgb3BlcmF0aW9uYWwgbm93LgpCZXR0ZXIgaGFuZGxpbmcgd2l0aCBV
bmljb2RlIGluZm8uClVwZGF0ZWQgLmN2c2lnbm9yZSBmaWxlcy4KVXBkYXRlZCB0aGUgZ2VuLnRh
YiB0byB3b3JrIGFnYWluLiAgT3RoZXIgZml4ZXMgaGVyZSBhbmQgdGhlcmUuCkNsZWFuaW5nIGhl
cmUgYW5kIHRoZXJlLiAgV2UgbWF5IGJlIHJlYWR5IGZvciBhIHJlbGVhc2UgdG9uaWdodCA6KS4K
TW9yZSBUT0RPLiAgQW5kIGNoYW5nZSBhdXRvY29uZiByZXF1aXJlbWVudCB0byAyLjU2IGZyb20g
Mi41OS4KQ2hhbmdlZCB0aGUgcnVuIGRhdGEgc3RydWN0dXJlIGZyb20gYSBkb3VibGUtdGVybWlu
YXRlZCBkZXF1ZSwgdG8gYQpDbGVhbmluZyB1cCBleHBvcnRlZCBzeW1ib2xzLgpBZGRlZCBGcmlC
aWRpUnVuIHR5cGUsIHByaXZhdGUgZm9yIG5vdy4gIE1vdmVkIGFsbCBsaWJyYXJ5LXdpZGUKTm90
aGluZyByZWFsbHkgaW1wb3J0YW50LgpGaXJzdCB0cnkgdG8gaW50ZWdyYXRlIGMybWFuIG1hbnVh
bCBnZW5lcmF0aW9uIGluIGJ1aWxkIHN5c3RlbS4KSGVhZGVyIGNoYW5nZWQgc28gUkNTIGhlYWRl
ciBhbmQgQXV0aG9ycyBmb2xsb3cgdGhlIGNvcHlyaWdodCBub3RpY2UuCk5ldyBpdGVtcyBhZGRl
ZC4gIFNob3VsZCBiZSBjbGVhcmVkIGJlZm9yZSB0aGUgcmVsZWFzZS4KTW9yZSAuY3ZzaWdub3Jl
J3MgYWRkZWQuClJlbmFtZWQgc3ViZGlyIHRhYmxlZ2VuIHRvIGdlbnRhYmxlLgpNb3JlIHJlY292
ZXJ5IGFmdGVyIHRoZSB1bmludGVudGlvbmFseSBybSAtZiAqLmMhCk5vICNpZmRlZiBvciAjaWZu
ZGVmIHdoZW4gcG9zc2libGUuICAjaWYgb3IgI2lmICEgaXMgYSBiZXR0ZXIgd2F5ClRoZSBDaGFu
Z2VMb2cgZnJvbSB0aGUgb2xkIGRheXMuCkluaXRpYWwgcmV2aXNpb24K

--===============2191562785685208148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fribidi/fribidi-bin: PV changed from "1.0.16" to "1.0.17"
packages/x86-64-v3-poky-linux/fribidi/fribidi-bin: PKGV changed from 1.0.16 [default] to 1.0.17 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi-dbg: PV changed from "1.0.16" to "1.0.17"
packages/x86-64-v3-poky-linux/fribidi/fribidi-dbg: PKGV changed from 1.0.16 [default] to 1.0.17 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi-dbg: PKGSIZE changed from 230688 to 239344 (+4%)
packages/x86-64-v3-poky-linux/fribidi/fribidi-dev: PV changed from "1.0.16" to "1.0.17"
packages/x86-64-v3-poky-linux/fribidi/fribidi-dev: PKGV changed from 1.0.16 [default] to 1.0.17 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi-dev: PKGSIZE changed from 79915 to 80154 (+0%)
packages/x86-64-v3-poky-linux/fribidi/fribidi-doc: FILELIST: added "/usr/share/man/man1/fribidi.1"
packages/x86-64-v3-poky-linux/fribidi/fribidi-doc: PV changed from "1.0.16" to "1.0.17"
packages/x86-64-v3-poky-linux/fribidi/fribidi-doc: PKGV changed from 1.0.16 [default] to 1.0.17 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi-doc: PKGSIZE changed from 67822 to 70733 (+4%)
packages/x86-64-v3-poky-linux/fribidi/fribidi-locale: PV changed from "1.0.16" to "1.0.17"
packages/x86-64-v3-poky-linux/fribidi/fribidi-locale: PKGV changed from 1.0.16 [default] to 1.0.17 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi-src: FILELIST: directory renamed /usr/src/debug/fribidi/1.0.16/lib -> /usr/src/debug/fribidi/1.0.17/lib, directory renamed /usr/src/debug/fribidi/1.0.16/bin -> /usr/src/debug/fribidi/1.0.17/bin
packages/x86-64-v3-poky-linux/fribidi/fribidi-src: PV changed from "1.0.16" to "1.0.17"
packages/x86-64-v3-poky-linux/fribidi/fribidi-src: PKGV changed from 1.0.16 [default] to 1.0.17 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi-src: PKGSIZE changed from 827564 to 834827 (+1%)
packages/x86-64-v3-poky-linux/fribidi/fribidi-staticdev: PV changed from "1.0.16" to "1.0.17"
packages/x86-64-v3-poky-linux/fribidi/fribidi-staticdev: PKGV changed from 1.0.16 [default] to 1.0.17 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi: PV changed from "1.0.16" to "1.0.17"
packages/x86-64-v3-poky-linux/fribidi/fribidi: PKGV changed from 1.0.16 [default] to 1.0.17 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi: PKGSIZE changed from 129099 to 129107 (+0%)
packages/x86-64-v3-poky-linux/fribidi: SRC_URI changed from "https://github.com/fribidi/fribidi/releases//download/v1.0.16/fribidi-1.0.16.tar.xz" to "https://github.com/fribidi/fribidi/releases//download/v1.0.17/fribidi-1.0.17.tar.xz"
packages/x86-64-v3-poky-linux/fribidi: PV changed from "1.0.16" to "1.0.17"
packages/x86-64-v3-poky-linux/fribidi: PKGV changed from 1.0.16 [default] to 1.0.17 [default]

--===============2191562785685208148==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fribidi-upgrade-1.0.16-1.0.17.patch"

RnJvbSA3OTYyYjkwZTA0NDAxZTg5NWI3NmUzMDYzZDRhOTZiMWRkMmIyMzFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjEgU2VwIDIwMjYgMDU6Mzc6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
cmliaWRpOiB1cGdyYWRlIDEuMC4xNiAtPiAxLjAuMTcKClNvdXJjZTogQ2hhbmdlTG9nCgpCdW1w
ZWQgdmVyc2lvbiB0byAxLjAuMTcKbGliOiByZXNvbHZlIEZTSSBiYXNlIGRpcmVjdGlvbiBpbiBv
bmUgbGluZWFyIHBhc3MsIG5vdCBwZXItRlNJIHJlc2NhbgpjaTogY2FwdHVyZSB0aGUgcmVhbCB0
ZXN0LXN1aXRlLmxvZyBmcm9tIGRpc3RjaGVjaydzIG5lc3RlZCByZWJ1aWxkCmxpYjogcmVwbGFj
ZSBOMCBicmFja2V0LXBhaXJpbmcgbGlua2VkIGxpc3Qgd2l0aCBhIGZsYXQgc29ydGVkIGFycmF5
CmxpYjogcG9vbC1hbGxvY2F0ZSBGcmlCaWRpUnVuIG5vZGVzIGluIGVtYmVkZGluZy1sZXZlbCBy
ZXNvbHV0aW9uCmZyaWJpZGlfcmVvcmRlcl9saW5lOiBpbXBsZW1lbnQgTDIgcmVvcmRlcmluZyBp
biBsaW5lYXIgdGltZQp0ZXN0OiBpbmNsdWRlIHN0ZGJvb2wuaCBpbiB0ZXN0LXJlb3JkZXItbnNt
LmMKbWVzb246IGZpeCBwYXJhbGxlbCBidWlsZCByYWNlIGZvciB0ZXN0LXJlb3JkZXItbnNtCmdl
bi11bmljb2RlLXZlcnNpb246IGZpeCBNU1ZDIGxpbmsgZmFpbHVyZSBieSBhdm9pZGluZyBzdHJu
Y2FzZWNtcApGaXggZnJpYmlkaV9zZXRfcmVvcmRlcl9uc20oKS9mcmliaWRpX3NldF9taXJyb3Jp
bmcoKSBub3QgYWZmZWN0aW5nCmdlbi1hcmFiaWMtc2hhcGluZy10YWI6IGZpeCByZW1haW5pbmcg
LVdmb3JtYXQ9IG1pc21hdGNoIG9uCmdlbi11bmljb2RlLXZlcnNpb246IHJlcGxhY2Ugbm9uLXBv
cnRhYmxlIHN0cmNhc2VzdHIgd2l0aCBhIHBvcnRhYmxlCkRlZmluZSBfRlJJQklESV9UWVBFX1NF
TlRJTkVML19GUklCSURJX1BBUl9TRU5USU5FTCBpbiBib3RoIGVudW0KZ2VuLWFyYWJpYy1zaGFw
aW5nLXRhYjogZml4IC1XZm9ybWF0LW92ZXJmbG93IHdhcm5pbmcgb24gR0NDIDE0ClVwZGF0ZSBV
bmljb2RlIGNoYXJhY3RlciBkYXRhYmFzZXMgdG8gdjE4LjAuMApGaXggcXVhZHJhdGljIGJlaGF2
aW9yIGluIE4wIGJyYWNrZXQgcGFpcmluZyBwcmVjZWRpbmctc3Ryb25nIHNlYXJjaApGaXggb3V0
LW9mLWJvdW5kcyByZWFkIG9uIHRyYWlsaW5nICdfJwpmcmliaWRpLW1haW46IGZpeCB0cnVuY2F0
aW9uIG9mIGxpbmVzL291dHB1dCBjb250YWluaW5nIGVtYmVkZGVkClBhaXIgYnJhY2tldHMgYnkg
Y2Fub25pY2FsIGVxdWl2YWxlbmNlIG9ubHksIHBlciBVQVggIzkgQkQxNgpSZW1vdmUgdW51c2Vk
IGFwcHZleW9yIHlhbWwgZmlsZQpnaXRodWIgYWN0aW9uczogVXNlIGN1cnJlbnQgcHl0aG9uIHZl
cnNpb24KVXBkYXRlIG9sZCBGU0YgYWRkcmVzcwpSZW1vdmUgdW5uZWNlc3NhcnkgY3VzdG9tIHBy
b3RvdHlwZXMgZm9yIGdldGVudiBhbmQgZ2V0b3B0ClJlbW92ZSB1bnVzZWQgdHJhdmlzIGZpbGUK
Z2l0aHViIGFjdGlvbnM6IEluc3RhbGwgaGVscDJtYW4gdG8gZml4IHVidW50dSBidWlsZApVcGRh
dGUgVE9ETyAtIHJlbW92ZSByZWFkbWUgaXRlbQpEb24ndCByZXF1aXJlIGhlbHAybWFuIHVubGVz
cyBidWlsZGluZyBkb2NzCkdlbmVyYXRlIGZyaWJpZGkuMSBtYW4gcGFnZQpGaXggdHlwb3MgaW4g
ZG9jczogImFuIHN0cmluZyIgLT4gImEgc3RyaW5nIgpnaXRodWIgYWN0aW9uczogVXBkYXRlIHB5
dGhvbiB2ZXJzaW9uIHRvIDMuMTIKVXBkYXRlIGdpdGh1YiBhY3Rpb25zIHZlcnNpb25zCkFkZCBH
TlUgTWFpbHV0aWxzIHRvIFVTRVJTCkZpeCB0eXBvCkZpeCBlcnJvciBoYW5kbGluZyBmb3IgZmls
ZSBvcGVyYXRpb25zCkZpeCBzdGFjayBidWZmZXIgb3ZlcmZsb3cgd2hlbiBwYXJzaW5nIGVxdWl2
YWxlbmNlCnJlbW92ZSBjb21waWxlciBmbGFnICItYW5zaSIKZGVidWc6IGRvbid0IHBhc3MgYSBj
b21tYSAiLCIgaW4gYSAjZGVmaW5lCkJ1bXAgdmVyc2lvbiB0byAxLjAuMTYKRml4IENJIGZhaWx1
cmUKVXBkYXRlIFVuaWNvZGUgY2hhcmFjdGVyIGRhdGFiYXNlcyB0byB2MTYuMC4wCkZpeCB0eXBv
IGluIGZyaWJpZGktY2FwcnRsMnV0ZjguYyB0aGF0IGNhdXNlZCBjb21waWxhdGlvbiB3YXJuaW5n
CkJ1bXBlZCB2ZXJzaW9uIHRvIDEuMC4xNQpCdW1wZWQgdmVyc2lvbiB0byAxLjAuMTQKVXBkYXRl
IHVuaWNvZGUgY2hhcmFjdGVyIGRhdGFiYXNlcyB0byB2MTUuMS4wLgpVcGRhdGUgdGVzdCBjYXNl
cyB0byBVbmljb2RlIDE1LjEKbWVzb246IGZpeCBidWlsZCB3aXRoIC1EYmluPWZhbHNlIGFuZCAt
RHRlc3RzPXRydWUKQnVtcGVkIHZlcnNpb24gdG8gMS4wLjEzCnNpbXBsaWZ5IHZpc2liaWxpdHkg
aGFuZGxpbmcKbWVzb246IGZpeCB0d28gbWVzb24gd2FybmluZ3MKVXBkYXRlIHRlc3QgY2FzZXMg
dG8gVW5pY29kZSAxNS4wCm1lc29uOiBmaXggdHdvIG1lc29uIHdhcm5pbmdzCm1lc29uOiBPdmVy
cmlkZSBkZXBlbmRlbmNpZXMgdG8gaW1wcm92ZSB1c2FnZSBhcyBhIHN1YnByb2plY3QKY2k6IFVw
bG9hZCBsb2dzIG9uIGJ1aWxkIGZhaWx1cmUKY2k6IFVwZGF0ZSBweXRob24gdmVyc2lvbiBpbiBn
aXRodWIgd29ya2Zsb3dzCm1lc29uOiBPdmVycmlkZSBkZXBlbmRlbmNpZXMgdG8gaW1wcm92ZSB1
c2FnZSBhcyBhIHN1YnByb2plY3QKVXBkYXRlIHRlc3QgY2FzZXMgdG8gVW5pY29kZSAxNS4wCnNp
bXBsaWZ5IHZpc2liaWxpdHkgaGFuZGxpbmcKcmVtb3ZlIHVzZWxlc3MgbGlicmFyeSBhcmd1bWVu
dHMgYXBwbGllZCB0byBleGVjdXRhYmxlcwpNYWRlIGZyaWJpZGlfdXRmOF90b191bmljb2RlKCkg
c2tpcCBpbmNvbXBsZXRlIHV0ZjggZW5jb2RlZCBjb2RlIHBvaW50cwpCdW1wZWQgdmVyc2lvbiB0
byAxLjAuMTIKQWRkIC1ERlJJQklESV9MSUJfU1RBVElDIHRvIGxpYmZyaWJpZGlfZGVwCkZpeCBT
RUdWIGlzc3VlIGluIGZyaWJpZGlfcmVtb3ZlX2JpZGlfbWFya3MKUHJvdGVjdGVkIGFnYWluc3Qg
Z2FyYmFnZSBpbiB0aGUgQ2FwUlRMIGVuY29kZXIKRml4IHRoZSBzdGFjayBidWZmZXIgb3ZlcmZs
b3cgaXNzdWUKSW5jbHVkZSAtREZSSUJJRElfTElCX1NUQVRJQyBpbiBwa2ctY29uZmlnIG91dHB1
dCBieSBkZWZhdWx0IHdoZW4KbWVzb246ICBEb24ndCBoYXJkY29kZSBweXRob24zIGluIHRlc3Rz
ClVwZGF0ZSB0ZXN0CgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAgY2hh
cmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2htZW50
IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uL3tmcmliaWRpXzEuMC4xNi5iYiA9PiBmcmliaWRp
XzEuMC4xNy5iYn0gIHwgOTYgKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDk0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZnJpYmlkaS97ZnJpYmlkaV8xLjAuMTYuYmIgPT4gZnJpYmlkaV8xLjAuMTcuYmJ9ICgxNSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZnJpYmlkaS9mcmliaWRpXzEuMC4x
Ni5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ZyaWJpZGkvZnJpYmlkaV8xLjAuMTcuYmIKc2lt
aWxhcml0eSBpbmRleCAxNSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZnJpYmlk
aS9mcmliaWRpXzEuMC4xNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZnJpYmlk
aS9mcmliaWRpXzEuMC4xNy5iYgppbmRleCA5Zjc1NDQ2ZGEyLi42MzZmNmRmMjIwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9mcmliaWRpL2ZyaWJpZGlfMS4wLjE2LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2ZyaWJpZGkvZnJpYmlkaV8xLjAuMTcuYmIKQEAgLTEsMyAr
MSw5NSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1
cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFz
ZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBj
aGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFn
LgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4n
KQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMg
QEAgLTEsOCArMSw4IEBACisjIC0JCSAgR05VIExFU1NFUiBHRU5FUkFMIFBVQkxJQyBMSUNFTlNF
CisjIC0JCSAgICAgICBWZXJzaW9uIDIuMSwgRmVicnVhcnkgMTk5OQorIyArICAgICAgICAgICAg
ICAgICAgR05VIExFU1NFUiBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICsgICAgICAgICAgICAg
ICAgICAgICAgIFZlcnNpb24gMi4xLCBGZWJydWFyeSAxOTk5CisjICAKKyMgICBDb3B5cmlnaHQg
KEMpIDE5OTEsIDE5OTkgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisjIC0gICAgIDUx
IEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgIDAyMTEwLTEzMDEgIFVT
QQorIyArIDxodHRwczovL2ZzZi5vcmcvPgorIyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBj
b3B5IGFuZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5zZSBk
b2N1bWVudCwgYnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxvd2VkLgorIyAgCisjIEBAIC0xMCw3
ICsxMCw3IEBACisjICAgYXMgdGhlIHN1Y2Nlc3NvciBvZiB0aGUgR05VIExpYnJhcnkgUHVibGlj
IExpY2Vuc2UsIHZlcnNpb24gMiwgaGVuY2UKKyMgICB0aGUgdmVyc2lvbiBudW1iZXIgMi4xLl0K
KyMgIAorIyAtCQkJICAgIFByZWFtYmxlCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
UHJlYW1ibGUKKyMgIAorIyAgICBUaGUgbGljZW5zZXMgZm9yIG1vc3Qgc29mdHdhcmUgYXJlIGRl
c2lnbmVkIHRvIHRha2UgYXdheSB5b3VyCisjICBmcmVlZG9tIHRvIHNoYXJlIGFuZCBjaGFuZ2Ug
aXQuICBCeSBjb250cmFzdCwgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYworIyBAQCAtMTEyLDcgKzEx
Miw3IEBACisjICBmb3JtZXIgY29udGFpbnMgY29kZSBkZXJpdmVkIGZyb20gdGhlIGxpYnJhcnks
IHdoZXJlYXMgdGhlIGxhdHRlciBtdXN0CisjICBiZSBjb21iaW5lZCB3aXRoIHRoZSBsaWJyYXJ5
IGluIG9yZGVyIHRvIHJ1bi4KKyMgIAwKKyMgLQkJICBHTlUgTEVTU0VSIEdFTkVSQUwgUFVCTElD
IExJQ0VOU0UKKyMgKyAgICAgICAgICAgICAgICAgIEdOVSBMRVNTRVIgR0VORVJBTCBQVUJMSUMg
TElDRU5TRQorIyAgICAgVEVSTVMgQU5EIENPTkRJVElPTlMgRk9SIENPUFlJTkcsIERJU1RSSUJV
VElPTiBBTkQgTU9ESUZJQ0FUSU9OCisjICAKKyMgICAgMC4gVGhpcyBMaWNlbnNlIEFncmVlbWVu
dCBhcHBsaWVzIHRvIGFueSBzb2Z0d2FyZSBsaWJyYXJ5IG9yIG90aGVyCisjIEBAIC0xNDYsNyAr
MTQ2LDcgQEAKKyMgIG9uIHRoZSBMaWJyYXJ5IChpbmRlcGVuZGVudCBvZiB0aGUgdXNlIG9mIHRo
ZSBMaWJyYXJ5IGluIGEgdG9vbCBmb3IKKyMgIHdyaXRpbmcgaXQpLiAgV2hldGhlciB0aGF0IGlz
IHRydWUgZGVwZW5kcyBvbiB3aGF0IHRoZSBMaWJyYXJ5IGRvZXMKKyMgIGFuZCB3aGF0IHRoZSBw
cm9ncmFtIHRoYXQgdXNlcyB0aGUgTGlicmFyeSBkb2VzLgorIyAtICAKKyMgKworIyAgICAxLiBZ
b3UgbWF5IGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzIG9mIHRoZSBMaWJyYXJ5
J3MKKyMgIGNvbXBsZXRlIHNvdXJjZSBjb2RlIGFzIHlvdSByZWNlaXZlIGl0LCBpbiBhbnkgbWVk
aXVtLCBwcm92aWRlZCB0aGF0CisjICB5b3UgY29uc3BpY3VvdXNseSBhbmQgYXBwcm9wcmlhdGVs
eSBwdWJsaXNoIG9uIGVhY2ggY29weSBhbgorIyBAQCAtNDMyLDcgKzQzMiw3IEBACisjICBvZiBh
bGwgZGVyaXZhdGl2ZXMgb2Ygb3VyIGZyZWUgc29mdHdhcmUgYW5kIG9mIHByb21vdGluZyB0aGUg
c2hhcmluZworIyAgYW5kIHJldXNlIG9mIHNvZnR3YXJlIGdlbmVyYWxseS4KKyMgIAorIyAtCQkJ
ICAgIE5PIFdBUlJBTlRZCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgTk8gV0FSUkFO
VFkKKyMgIAorIyAgICAxNS4gQkVDQVVTRSBUSEUgTElCUkFSWSBJUyBMSUNFTlNFRCBGUkVFIE9G
IENIQVJHRSwgVEhFUkUgSVMgTk8KKyMgIFdBUlJBTlRZIEZPUiBUSEUgTElCUkFSWSwgVE8gVEhF
IEVYVEVOVCBQRVJNSVRURUQgQlkgQVBQTElDQUJMRSBMQVcuCisjIEBAIC00NTUsNyArNDU1LDcg
QEAKKyMgIFNVQ0ggSE9MREVSIE9SIE9USEVSIFBBUlRZIEhBUyBCRUVOIEFEVklTRUQgT0YgVEhF
IFBPU1NJQklMSVRZIE9GIFNVQ0gKKyMgIERBTUFHRVMuCisjICAKKyMgLQkJICAgICBFTkQgT0Yg
VEVSTVMgQU5EIENPTkRJVElPTlMKKyMgKyAgICAgICAgICAgICAgICAgICAgIEVORCBPRiBURVJN
UyBBTkQgQ09ORElUSU9OUworIyAgDAorIyAgICAgICAgICAgICBIb3cgdG8gQXBwbHkgVGhlc2Ug
VGVybXMgdG8gWW91ciBOZXcgTGlicmFyaWVzCisjICAKKyMgQEAgLTQ4NCw4ICs0ODQsNyBAQAor
IyAgICAgIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisj
ICAKKyMgICAgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgTGVz
c2VyIEdlbmVyYWwgUHVibGljCisjIC0gICAgTGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgbGlicmFy
eTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQorIyAtICAgIEZvdW5kYXRpb24s
IEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgIDAyMTEw
LTEzMDEgIFVTQQorIyArICAgIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGlzIGxpYnJhcnk7IGlmIG5v
dCwgc2VlIDxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisjICAKKyMgIEFsc28gYWRk
IGluZm9ybWF0aW9uIG9uIGhvdyB0byBjb250YWN0IHlvdSBieSBlbGVjdHJvbmljIGFuZCBwYXBl
ciBtYWlsLgorIyAgCisjIEBAIC00OTYsOSArNDk1LDcgQEAKKyMgICAgWW95b2R5bmUsIEluYy4s
IGhlcmVieSBkaXNjbGFpbXMgYWxsIGNvcHlyaWdodCBpbnRlcmVzdCBpbiB0aGUKKyMgICAgbGli
cmFyeSBgRnJvYicgKGEgbGlicmFyeSBmb3IgdHdlYWtpbmcga25vYnMpIHdyaXR0ZW4gYnkgSmFt
ZXMgUmFuZG9tIEhhY2tlci4KKyMgIAorIyAtICA8c2lnbmF0dXJlIG9mIFR5IENvb24+LCAxIEFw
cmlsIDE5OTAKKyMgLSAgVHkgQ29vbiwgUHJlc2lkZW50IG9mIFZpY2UKKyMgKyAgPHNpZ25hdHVy
ZSBvZiBNb2UgR2hvdWw+LCAxIEFwcmlsIDE5OTAKKyMgKyAgTW9lIEdob3VsLCBQcmVzaWRlbnQg
b2YgVmljZQorIyAgCisjICBUaGF0J3MgYWxsIHRoZXJlIGlzIHRvIGl0IQorIyAtCisjIC0KKyMg
CisjCisKIFNVTU1BUlkgPSAiRnJlZSBJbXBsZW1lbnRhdGlvbiBvZiB0aGUgVW5pY29kZSBCaWRp
cmVjdGlvbmFsIEFsZ29yaXRobSIKIERFU0NSSVBUSU9OID0gIkl0IHByb3ZpZGVzIHV0aWxpdHkg
ZnVuY3Rpb25zIHRvIGFpZCBpbiB0aGUgZGV2ZWxvcG1lbnQgXAogb2YgaW50ZXJhY3RpdmUgZWRp
dG9ycyBhbmQgd2lkZ2V0cyB0aGF0IGltcGxlbWVudCBCaURpIGZ1bmN0aW9uYWxpdHkuIFwKQEAg
LTcsMTEgKzk5LDExIEBAIFNFQ1RJT04gPSAibGlicyIKIEhPTUVQQUdFID0gImh0dHA6Ly9mcmli
aWRpLm9yZy8iCiBCVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0aHViLmNvbS9mcmliaWRpL2ZyaWJp
ZGkvaXNzdWVzIgogTElDRU5TRSA9ICJMR1BMLTIuMS1vci1sYXRlciIKLUxJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWE5MTY0NjdiOTEwNzZlNjMxZGQ4ZWRiNzQyNDc2OWM3
IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGJmNjYxYzFlMzc5M2U1
NWM4ZDEwNTFiYzVlMGFlMjEiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25s
b2FkL3Yke1BWfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMWIxY2RlNWIyMzVkNDA0NzllOTFiZTJmMGU4OGEzMDllMzIxNGM4YWI0NzBlYzhhMjc0
NGQ4MmE1YTllYTA1YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2OTQ5ZGNkZTI3ZDQxY2ViYWQx
ZmQ3NDFmY2FmYzM2ZDU1YTEwMjBkMmQ4NzJkNGE2ZWIzOTE0Y2FhYmJhZGEyIgogCiBpbmhlcml0
IG1lc29uIGxpYl9wYWNrYWdlIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKIAotLSAKMi40Ny4x
Cgo=

--===============2191562785685208148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/fribidi/fribidi-doc: FILELIST: added "/usr/share/man/man1/fribidi.1"

--===============2191562785685208148==--

