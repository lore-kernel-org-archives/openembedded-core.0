Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7089CAC5A4
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:43 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.90000.1756850190080782287
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dXue3iTW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=s3DFTdYX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101990c6ea7d3-a2de85b9-1531-41bb-861b-2d181111d5e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850202;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=e7/ZonOrS03pOWEaR7yM2AyZohikBN7Cl5SlSXIhK2U=;
	b=dXue3iTW67A25s/DjfRlbColQf63MQvHIhF8LTubpsblzWbz6Tb3XQfuq1tC/uxF
	RNG8mcIgem7ihn4TIWeziWDqvVARhYaW0KXKGSwcjqv16bp1aAp7slI0pcu2AddXwcH
	SUS5cMQaTZ6GdteYzw1epmCtRkcZBoJhi3Bvy0Cs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850202;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=e7/ZonOrS03pOWEaR7yM2AyZohikBN7Cl5SlSXIhK2U=;
	b=s3DFTdYXlYldNIcTRzwJkh8j9tHuty3vANSu7HsYz99wSA9Cd1p35fEi5orau1xs
	MgXLonNYNu+6IuPLq8ix3dx9nMEdoZ3Rxg15Fffa/J2v0Q8mE8zUA8slcVuKQLBUMQF
	hisfYw7sUWumEAJjnITg4+lhoUN1y4pnDKhPj4+0=
Content-Type: multipart/mixed; boundary="===============5589844188524373949=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ffmpeg: upgrading to 8.0 FAILED
Message-ID: <010101990c6ea7d3-a2de85b9-1531-41bb-861b-2d181111d5e7-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222819

--===============5589844188524373949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ffmpeg* to *8.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ffmpeg-upgrade-7.1.1-8.0.patch
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
From 1295ad11c998df0895855dd337c38900eb08d3dc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 21:01:01 +0000
Subject: [PATCH] ffmpeg: upgrade 7.1.1 -> 8.0

---
 .../ffmpeg/{ffmpeg_7.1.1.bb => ffmpeg_8.0.bb} | 101 +++++++++++++++++-
 1 file changed, 98 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_7.1.1.bb => ffmpeg_8.0.bb} (66%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
similarity index 66%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
index 5a86ad563f..bae97bbd34 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
@@ -1,3 +1,97 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING.LGPLv2.1
+# +++ COPYING.LGPLv2.1
+# @@ -55,7 +55,7 @@
+#  that what they have is not the original version, so that the original
+#  author's reputation will not be affected by problems that might be
+#  introduced by others.
+# -
+# +
+#    Finally, software patents pose a constant threat to the existence of
+#  any free program.  We wish to make sure that a company cannot
+#  effectively restrict the users of a free program by obtaining a
+# @@ -111,7 +111,7 @@
+#  "work based on the library" and a "work that uses the library".  The
+#  former contains code derived from the library, whereas the latter must
+#  be combined with the library in order to run.
+# -
+# +
+#                    GNU LESSER GENERAL PUBLIC LICENSE
+#     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+#  
+# @@ -158,7 +158,7 @@
+#    You may charge a fee for the physical act of transferring a copy,
+#  and you may at your option offer warranty protection in exchange for a
+#  fee.
+# -
+# +
+#    2. You may modify your copy or copies of the Library or any portion
+#  of it, thus forming a work based on the Library, and copy and
+#  distribute such modifications or work under the terms of Section 1
+# @@ -216,7 +216,7 @@
+#  ordinary GNU General Public License has appeared, then you can specify
+#  that version instead if you wish.)  Do not make any other change in
+#  these notices.
+# -
+# +
+#    Once this change is made in a given copy, it is irreversible for
+#  that copy, so the ordinary GNU General Public License applies to all
+#  subsequent copies and derivative works made from that copy.
+# @@ -267,7 +267,7 @@
+#  distribute the object code for the work under the terms of Section 6.
+#  Any executables containing that work also fall under Section 6,
+#  whether or not they are linked directly with the Library itself.
+# -
+# +
+#    6. As an exception to the Sections above, you may also combine or
+#  link a "work that uses the Library" with the Library to produce a
+#  work containing portions of the Library, and distribute that work
+# @@ -329,7 +329,7 @@
+#  accompany the operating system.  Such a contradiction means you cannot
+#  use both them and the Library together in an executable that you
+#  distribute.
+# -
+# +
+#    7. You may place library facilities that are a work based on the
+#  Library side-by-side in a single library together with other library
+#  facilities not covered by this License, and distribute such a combined
+# @@ -370,7 +370,7 @@
+#  restrictions on the recipients' exercise of the rights granted herein.
+#  You are not responsible for enforcing compliance by third parties with
+#  this License.
+# -
+# +
+#    11. If, as a consequence of a court judgment or allegation of patent
+#  infringement or for any other reason (not limited to patent issues),
+#  conditions are imposed on you (whether by court order, agreement or
+# @@ -422,7 +422,7 @@
+#  the Free Software Foundation.  If the Library does not specify a
+#  license version number, you may choose any version ever published by
+#  the Free Software Foundation.
+# -
+# +
+#    14. If you wish to incorporate parts of the Library into other free
+#  programs whose distribution conditions are incompatible with these,
+#  write to the author to ask for permission.  For software which is
+# @@ -456,7 +456,7 @@
+#  DAMAGES.
+#  
+#                       END OF TERMS AND CONDITIONS
+# -
+# +
+#             How to Apply These Terms to Your New Libraries
+#  
+#    If you develop a new library, and you want it to be of the greatest
+# 
+#
+
 SUMMARY = "A complete, cross-platform solution to record, convert and stream audio and video."
 DESCRIPTION = "FFmpeg is the leading multimedia framework, able to decode, encode, transcode, \
                mux, demux, stream, filter and play pretty much anything that humans and machines \
@@ -19,12 +113,13 @@ LICENSE_FLAGS = "commercial"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+                    file://COPYING.LGPLv2.1;md5=eed22b3456132611e3d4aa7a7ec64dac \
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+                    "
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1"
+SRC_URI[sha256sum] = "b2751fccb6cc4c77708113cd78b561059b6fa904b24162fa0be2d60273d27b8e"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.47.1


--===============5589844188524373949==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ffmpeg-upgrade-7.1.1-8.0.patch"

RnJvbSAxMjk1YWQxMWM5OThkZjA4OTU4NTVkZDMzN2MzODkwMGViMDhkM2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMTowMTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZm
bXBlZzogdXBncmFkZSA3LjEuMSAtPiA4LjAKCi0tLQogLi4uL2ZmbXBlZy97ZmZtcGVnXzcuMS4x
LmJiID0+IGZmbXBlZ184LjAuYmJ9IHwgMTAxICsrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNo
YW5nZWQsIDk4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZmZtcGVnL3tmZm1wZWdfNy4xLjEuYmIgPT4gZmZtcGVnXzguMC5iYn0g
KDY2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVn
XzcuMS4xLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBlZ184LjAuYmIK
c2ltaWxhcml0eSBpbmRleCA2NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
ZmZtcGVnL2ZmbXBlZ183LjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
ZmZtcGVnL2ZmbXBlZ184LjAuYmIKaW5kZXggNWE4NmFkNTYzZi4uYmFlOTdiYmQzNCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBlZ183LjEuMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVnXzguMC5iYgpAQCAtMSwzICsx
LDk3IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORy5MR1BMdjIuMQorIyArKysgQ09Q
WUlORy5MR1BMdjIuMQorIyBAQCAtNTUsNyArNTUsNyBAQAorIyAgdGhhdCB3aGF0IHRoZXkgaGF2
ZSBpcyBub3QgdGhlIG9yaWdpbmFsIHZlcnNpb24sIHNvIHRoYXQgdGhlIG9yaWdpbmFsCisjICBh
dXRob3IncyByZXB1dGF0aW9uIHdpbGwgbm90IGJlIGFmZmVjdGVkIGJ5IHByb2JsZW1zIHRoYXQg
bWlnaHQgYmUKKyMgIGludHJvZHVjZWQgYnkgb3RoZXJzLgorIyAtDAorIyArCisjICAgIEZpbmFs
bHksIHNvZnR3YXJlIHBhdGVudHMgcG9zZSBhIGNvbnN0YW50IHRocmVhdCB0byB0aGUgZXhpc3Rl
bmNlIG9mCisjICBhbnkgZnJlZSBwcm9ncmFtLiAgV2Ugd2lzaCB0byBtYWtlIHN1cmUgdGhhdCBh
IGNvbXBhbnkgY2Fubm90CisjICBlZmZlY3RpdmVseSByZXN0cmljdCB0aGUgdXNlcnMgb2YgYSBm
cmVlIHByb2dyYW0gYnkgb2J0YWluaW5nIGEKKyMgQEAgLTExMSw3ICsxMTEsNyBAQAorIyAgIndv
cmsgYmFzZWQgb24gdGhlIGxpYnJhcnkiIGFuZCBhICJ3b3JrIHRoYXQgdXNlcyB0aGUgbGlicmFy
eSIuICBUaGUKKyMgIGZvcm1lciBjb250YWlucyBjb2RlIGRlcml2ZWQgZnJvbSB0aGUgbGlicmFy
eSwgd2hlcmVhcyB0aGUgbGF0dGVyIG11c3QKKyMgIGJlIGNvbWJpbmVkIHdpdGggdGhlIGxpYnJh
cnkgaW4gb3JkZXIgdG8gcnVuLgorIyAtDAorIyArCisjICAgICAgICAgICAgICAgICAgICBHTlUg
TEVTU0VSIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgICAgIFRFUk1TIEFORCBDT05ESVRJT05T
IEZPUiBDT1BZSU5HLCBESVNUUklCVVRJT04gQU5EIE1PRElGSUNBVElPTgorIyAgCisjIEBAIC0x
NTgsNyArMTU4LDcgQEAKKyMgICAgWW91IG1heSBjaGFyZ2UgYSBmZWUgZm9yIHRoZSBwaHlzaWNh
bCBhY3Qgb2YgdHJhbnNmZXJyaW5nIGEgY29weSwKKyMgIGFuZCB5b3UgbWF5IGF0IHlvdXIgb3B0
aW9uIG9mZmVyIHdhcnJhbnR5IHByb3RlY3Rpb24gaW4gZXhjaGFuZ2UgZm9yIGEKKyMgIGZlZS4K
KyMgLQwKKyMgKworIyAgICAyLiBZb3UgbWF5IG1vZGlmeSB5b3VyIGNvcHkgb3IgY29waWVzIG9m
IHRoZSBMaWJyYXJ5IG9yIGFueSBwb3J0aW9uCisjICBvZiBpdCwgdGh1cyBmb3JtaW5nIGEgd29y
ayBiYXNlZCBvbiB0aGUgTGlicmFyeSwgYW5kIGNvcHkgYW5kCisjICBkaXN0cmlidXRlIHN1Y2gg
bW9kaWZpY2F0aW9ucyBvciB3b3JrIHVuZGVyIHRoZSB0ZXJtcyBvZiBTZWN0aW9uIDEKKyMgQEAg
LTIxNiw3ICsyMTYsNyBAQAorIyAgb3JkaW5hcnkgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
aGFzIGFwcGVhcmVkLCB0aGVuIHlvdSBjYW4gc3BlY2lmeQorIyAgdGhhdCB2ZXJzaW9uIGluc3Rl
YWQgaWYgeW91IHdpc2guKSAgRG8gbm90IG1ha2UgYW55IG90aGVyIGNoYW5nZSBpbgorIyAgdGhl
c2Ugbm90aWNlcy4KKyMgLQwKKyMgKworIyAgICBPbmNlIHRoaXMgY2hhbmdlIGlzIG1hZGUgaW4g
YSBnaXZlbiBjb3B5LCBpdCBpcyBpcnJldmVyc2libGUgZm9yCisjICB0aGF0IGNvcHksIHNvIHRo
ZSBvcmRpbmFyeSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcHBsaWVzIHRvIGFsbAorIyAg
c3Vic2VxdWVudCBjb3BpZXMgYW5kIGRlcml2YXRpdmUgd29ya3MgbWFkZSBmcm9tIHRoYXQgY29w
eS4KKyMgQEAgLTI2Nyw3ICsyNjcsNyBAQAorIyAgZGlzdHJpYnV0ZSB0aGUgb2JqZWN0IGNvZGUg
Zm9yIHRoZSB3b3JrIHVuZGVyIHRoZSB0ZXJtcyBvZiBTZWN0aW9uIDYuCisjICBBbnkgZXhlY3V0
YWJsZXMgY29udGFpbmluZyB0aGF0IHdvcmsgYWxzbyBmYWxsIHVuZGVyIFNlY3Rpb24gNiwKKyMg
IHdoZXRoZXIgb3Igbm90IHRoZXkgYXJlIGxpbmtlZCBkaXJlY3RseSB3aXRoIHRoZSBMaWJyYXJ5
IGl0c2VsZi4KKyMgLQwKKyMgKworIyAgICA2LiBBcyBhbiBleGNlcHRpb24gdG8gdGhlIFNlY3Rp
b25zIGFib3ZlLCB5b3UgbWF5IGFsc28gY29tYmluZSBvcgorIyAgbGluayBhICJ3b3JrIHRoYXQg
dXNlcyB0aGUgTGlicmFyeSIgd2l0aCB0aGUgTGlicmFyeSB0byBwcm9kdWNlIGEKKyMgIHdvcmsg
Y29udGFpbmluZyBwb3J0aW9ucyBvZiB0aGUgTGlicmFyeSwgYW5kIGRpc3RyaWJ1dGUgdGhhdCB3
b3JrCisjIEBAIC0zMjksNyArMzI5LDcgQEAKKyMgIGFjY29tcGFueSB0aGUgb3BlcmF0aW5nIHN5
c3RlbS4gIFN1Y2ggYSBjb250cmFkaWN0aW9uIG1lYW5zIHlvdSBjYW5ub3QKKyMgIHVzZSBib3Ro
IHRoZW0gYW5kIHRoZSBMaWJyYXJ5IHRvZ2V0aGVyIGluIGFuIGV4ZWN1dGFibGUgdGhhdCB5b3UK
KyMgIGRpc3RyaWJ1dGUuCisjIC0MCisjICsKKyMgICAgNy4gWW91IG1heSBwbGFjZSBsaWJyYXJ5
IGZhY2lsaXRpZXMgdGhhdCBhcmUgYSB3b3JrIGJhc2VkIG9uIHRoZQorIyAgTGlicmFyeSBzaWRl
LWJ5LXNpZGUgaW4gYSBzaW5nbGUgbGlicmFyeSB0b2dldGhlciB3aXRoIG90aGVyIGxpYnJhcnkK
KyMgIGZhY2lsaXRpZXMgbm90IGNvdmVyZWQgYnkgdGhpcyBMaWNlbnNlLCBhbmQgZGlzdHJpYnV0
ZSBzdWNoIGEgY29tYmluZWQKKyMgQEAgLTM3MCw3ICszNzAsNyBAQAorIyAgcmVzdHJpY3Rpb25z
IG9uIHRoZSByZWNpcGllbnRzJyBleGVyY2lzZSBvZiB0aGUgcmlnaHRzIGdyYW50ZWQgaGVyZWlu
LgorIyAgWW91IGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGVuZm9yY2luZyBjb21wbGlhbmNlIGJ5
IHRoaXJkIHBhcnRpZXMgd2l0aAorIyAgdGhpcyBMaWNlbnNlLgorIyAtDAorIyArCisjICAgIDEx
LiBJZiwgYXMgYSBjb25zZXF1ZW5jZSBvZiBhIGNvdXJ0IGp1ZGdtZW50IG9yIGFsbGVnYXRpb24g
b2YgcGF0ZW50CisjICBpbmZyaW5nZW1lbnQgb3IgZm9yIGFueSBvdGhlciByZWFzb24gKG5vdCBs
aW1pdGVkIHRvIHBhdGVudCBpc3N1ZXMpLAorIyAgY29uZGl0aW9ucyBhcmUgaW1wb3NlZCBvbiB5
b3UgKHdoZXRoZXIgYnkgY291cnQgb3JkZXIsIGFncmVlbWVudCBvcgorIyBAQCAtNDIyLDcgKzQy
Miw3IEBACisjICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLiAgSWYgdGhlIExpYnJhcnkg
ZG9lcyBub3Qgc3BlY2lmeSBhCisjICBsaWNlbnNlIHZlcnNpb24gbnVtYmVyLCB5b3UgbWF5IGNo
b29zZSBhbnkgdmVyc2lvbiBldmVyIHB1Ymxpc2hlZCBieQorIyAgdGhlIEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbi4KKyMgLQwKKyMgKworIyAgICAxNC4gSWYgeW91IHdpc2ggdG8gaW5jb3Jwb3Jh
dGUgcGFydHMgb2YgdGhlIExpYnJhcnkgaW50byBvdGhlciBmcmVlCisjICBwcm9ncmFtcyB3aG9z
ZSBkaXN0cmlidXRpb24gY29uZGl0aW9ucyBhcmUgaW5jb21wYXRpYmxlIHdpdGggdGhlc2UsCisj
ICB3cml0ZSB0byB0aGUgYXV0aG9yIHRvIGFzayBmb3IgcGVybWlzc2lvbi4gIEZvciBzb2Z0d2Fy
ZSB3aGljaCBpcworIyBAQCAtNDU2LDcgKzQ1Niw3IEBACisjICBEQU1BR0VTLgorIyAgCisjICAg
ICAgICAgICAgICAgICAgICAgICBFTkQgT0YgVEVSTVMgQU5EIENPTkRJVElPTlMKKyMgLQwKKyMg
KworIyAgICAgICAgICAgICBIb3cgdG8gQXBwbHkgVGhlc2UgVGVybXMgdG8gWW91ciBOZXcgTGli
cmFyaWVzCisjICAKKyMgICAgSWYgeW91IGRldmVsb3AgYSBuZXcgbGlicmFyeSwgYW5kIHlvdSB3
YW50IGl0IHRvIGJlIG9mIHRoZSBncmVhdGVzdAorIyAKKyMKKwogU1VNTUFSWSA9ICJBIGNvbXBs
ZXRlLCBjcm9zcy1wbGF0Zm9ybSBzb2x1dGlvbiB0byByZWNvcmQsIGNvbnZlcnQgYW5kIHN0cmVh
bSBhdWRpbyBhbmQgdmlkZW8uIgogREVTQ1JJUFRJT04gPSAiRkZtcGVnIGlzIHRoZSBsZWFkaW5n
IG11bHRpbWVkaWEgZnJhbWV3b3JrLCBhYmxlIHRvIGRlY29kZSwgZW5jb2RlLCB0cmFuc2NvZGUs
IFwKICAgICAgICAgICAgICAgIG11eCwgZGVtdXgsIHN0cmVhbSwgZmlsdGVyIGFuZCBwbGF5IHBy
ZXR0eSBtdWNoIGFueXRoaW5nIHRoYXQgaHVtYW5zIGFuZCBtYWNoaW5lcyBcCkBAIC0xOSwxMiAr
MTEzLDEzIEBAIExJQ0VOU0VfRkxBR1MgPSAiY29tbWVyY2lhbCIKIAogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORy5HUEx2MjttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0
YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5HUEx2MzttZDU9ZDMy
MjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQgXAotICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vQ09QWUlORy5MR1BMdjIuMTttZDU9YmQ3YTQ0MzMyMGFmOGM4MTJlNGMxOGQxYjc5ZGYwMDQg
XAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5MR1BMdjM7bWQ1PWU2YTYwMGZk
NWUxZDljYmRlMmQ5ODM2ODAyMzNhZDAyIgorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09Q
WUlORy5MR1BMdjIuMTttZDU9ZWVkMjJiMzQ1NjEzMjYxMWUzZDRhYTdhN2VjNjRkYWMgXAorICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5MR1BMdjM7bWQ1PWU2YTYwMGZkNWUxZDlj
YmRlMmQ5ODM2ODAyMzNhZDAyIFwKKyAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0g
Imh0dHBzOi8vd3d3LmZmbXBlZy5vcmcvcmVsZWFzZXMvJHtCUH0udGFyLnh6IgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNzMzOTg0Mzk1ZTBkYmJlNWMwNDZhYmRhMmRjNDlhNTU0NGU3ZTBlMWUy
MzY2YmJhODQ5MjIyYWU5ZTNhMDNiMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMjc1MWZjY2I2
Y2M0Yzc3NzA4MTEzY2Q3OGI1NjEwNTliNmZhOTA0YjI0MTYyZmEwYmUyZDYwMjczZDI3YjhlIgog
CiAjIEJ1aWxkIGZhaWxzIHdoZW4gdGh1bWIgaXMgZW5hYmxlZDogaHR0cHM6Ly9idWd6aWxsYS55
b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD03NzE3CiBBUk1fSU5TVFJVQ1RJT05fU0VU
OmFybXY0ID0gImFybSIKLS0gCjIuNDcuMQoK

--===============5589844188524373949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1940 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1940 targets, 45 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-385f34f6860b2b32f48d88f5bd0b449de6099f05"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:385f34f6860b2b32f48d88f5bd0b449de6099f05"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 140 Local 128 Mirrors 0 Missed 12 Current 345 (91% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1224 of 1387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_recipe_qa)
NOTE: recipe ffmpeg-8.0-r0: task do_recipe_qa: Started
NOTE: recipe ffmpeg-8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1368 of 1387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_fetch)
NOTE: recipe ffmpeg-8.0-r0: task do_fetch: Started
NOTE: recipe ffmpeg-8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1369 of 1387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_unpack)
NOTE: Running task 1370 of 1387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ffmpeg-8.0-r0: task do_unpack: Started
NOTE: recipe ffmpeg-8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ffmpeg-8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ffmpeg-8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1371 of 1387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_patch)
NOTE: Running task 1372 of 1387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_collect_spdx_deps)
NOTE: recipe ffmpeg-8.0-r0: task do_patch: Started
NOTE: recipe ffmpeg-8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe ffmpeg-8.0-r0: task do_patch: Succeeded
NOTE: Running task 1373 of 1387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1374 of 1387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_populate_lic)
NOTE: recipe ffmpeg-8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ffmpeg-8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-8.0-r0: task do_populate_lic: Started
NOTE: recipe ffmpeg-8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1375 of 1387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_configure)
NOTE: recipe ffmpeg-8.0-r0: task do_populate_lic: Succeeded
NOTE: recipe ffmpeg-8.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot', '/srv/pokybuild
 /yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.03.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.8.bb:do
 _populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'zlib', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'bzip2', 'texinfo-dummy-native', 'xz', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxv', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'libogg', 'libtheora', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'make-native', 'nasm-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'groff-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| Unknown option "--enable-postproc".
| See /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/sources/ffmpeg-8.0/configure --help for available options.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/temp/run.do_configure.1548837:152 exit 1 from '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/sources/ffmpeg-8.0/configure --disable-stripping --enable-pic --enable-shared --enable-pthreads --cross-prefix=x86_64-poky-linux- --ld='x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot' --cc='x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot' --cxx='x86_64-poky-linux-g++  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wf
 ormat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot' --arch=x86_64 --target-os='linux' --enable-cross-compile --extra-cflags=' -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/sources/ffmpeg-8.0=/usr/src/debug/ffmpeg/8.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/build=/usr/src/debug/ffmpeg/8.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot-native=  -pipe  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-s
 ysroot' --extra-ldflags='-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/sources/ffmpeg-8.0=/usr/src/debug/ffmpeg/8.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/build=/usr/src/debug/ffmpeg/8.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot-native=  -Wl,-z,relro,-z,now' --sysroot='/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot' ${EXTRA_FFCONF} --libdir=/usr/lib --shlibdir=/usr/lib --datadir=/usr/share/ffmpeg --disable-mipsdsp --disable-mipsdspr2 --cpu=generic --pkg-config=pkg-config --disable-static --enable-alsa --disable-altivec --enable-avcodec --enable-avdevice --enable-avfilter -
 -enable-avformat --enable-bzlib --disable-libfdk-aac --disable-gpl --disable-libgsm --disable-indev=jack --disable-libopus --disable-libvorbis --enable-lzma --disable-libmfx --disable-libmp3lame --disable-openssl --enable-postproc --disable-sdl2 --disable-libspeex --disable-libsrt --enable-swresample --enable-swscale --enable-libtheora --disable-libv4l2 --disable-vaapi --disable-vdpau --disable-libvpx --disable-libx264 --disable-libx265 --enable-libxcb --enable-outdev=xv --enable-zlib'
| WARNING: Backtrace (BB generated script):
| 	#1: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/temp/run.do_configure.1548837, line 152
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/temp/run.do_configure.1548837, line 157
NOTE: recipe ffmpeg-8.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1375 tasks of which 1366 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250902210046.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250902210046.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/temp/log.do_configure.1548837
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: ffmpeg-8.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/temp/run.do_configure.1548837' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/temp/log.do_configure.1548837
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_configure) failed with exit code '1'

--===============5589844188524373949==--

