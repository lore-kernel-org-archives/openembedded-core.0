Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D87CCD186
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.30897.1757937285701477369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ex3BlRNi;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ZdCNmT/D;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101994d3a53df-b0afb2c0-1ddd-4560-9f9b-a920e5bdf273-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cLU7JortOej8bBrHIHqWAAGsdSQ3TGPO54TuZOAzeaY=;
	b=ex3BlRNi6OLs0QcD5Q7j/bMW4OIIYMfj2i2ge43DhkKLr2LOSXA9VhIJO5YYqK7F
	II45/mcJVb4U/tCdiFxQjUnoIcxUSTs9oUCuvmynYnZQBAj9coFKCXicc/wvsJnVs03
	BGCcglO69AMM5MBzt1Vr+dgUShVGfYAmE9Px9ZBc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cLU7JortOej8bBrHIHqWAAGsdSQ3TGPO54TuZOAzeaY=;
	b=ZdCNmT/D0afh48gIN8GsDwIHMPkDCFEhOYslW/WotTkiSAF4epPnfPAAW6y+QiGN
	+yMNBK8y4iXDLyIdapkv1XluhXVHgMul6ZO+D5RBL/42uGsSdvo/iWUE2W8CyTYfQUO
	RXf6YI5IPH4ZisFD/DBAYI9Bb0WR4AnB1Oi+a2tM=
Content-Type: multipart/mixed; boundary="===============4776966244220134810=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ffmpeg: upgrading to 8.0 FAILED
Message-ID: <010101994d3a53df-b0afb2c0-1ddd-4560-9f9b-a920e5bdf273-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223462

--===============4776966244220134810==
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
From f05ec27fe014f757e8fd593599ba0c4e780ff84b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 10:52:38 +0000
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


--===============4776966244220134810==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ffmpeg-upgrade-7.1.1-8.0.patch"

RnJvbSBmMDVlYzI3ZmUwMTRmNzU3ZThmZDU5MzU5OWJhMGM0ZTc4MGZmODRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTA6NTI6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
Zm1wZWc6IHVwZ3JhZGUgNy4xLjEgLT4gOC4wCgotLS0KIC4uLi9mZm1wZWcve2ZmbXBlZ183LjEu
MS5iYiA9PiBmZm1wZWdfOC4wLmJifSB8IDEwMSArKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA5OCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy97ZmZtcGVnXzcuMS4xLmJiID0+IGZmbXBlZ184LjAuYmJ9
ICg2NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBl
Z183LjEuMS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfOC4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggNjYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2ZmbXBlZy9mZm1wZWdfNy4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2ZmbXBlZy9mZm1wZWdfOC4wLmJiCmluZGV4IDVhODZhZDU2M2YuLmJhZTk3YmJkMzQgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfNy4xLjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBlZ184LjAuYmIKQEAgLTEsMyAr
MSw5NyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1
cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFz
ZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBj
aGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFn
LgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4n
KQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcuTEdQTHYyLjEKKyMgKysrIENP
UFlJTkcuTEdQTHYyLjEKKyMgQEAgLTU1LDcgKzU1LDcgQEAKKyMgIHRoYXQgd2hhdCB0aGV5IGhh
dmUgaXMgbm90IHRoZSBvcmlnaW5hbCB2ZXJzaW9uLCBzbyB0aGF0IHRoZSBvcmlnaW5hbAorIyAg
YXV0aG9yJ3MgcmVwdXRhdGlvbiB3aWxsIG5vdCBiZSBhZmZlY3RlZCBieSBwcm9ibGVtcyB0aGF0
IG1pZ2h0IGJlCisjICBpbnRyb2R1Y2VkIGJ5IG90aGVycy4KKyMgLQwKKyMgKworIyAgICBGaW5h
bGx5LCBzb2Z0d2FyZSBwYXRlbnRzIHBvc2UgYSBjb25zdGFudCB0aHJlYXQgdG8gdGhlIGV4aXN0
ZW5jZSBvZgorIyAgYW55IGZyZWUgcHJvZ3JhbS4gIFdlIHdpc2ggdG8gbWFrZSBzdXJlIHRoYXQg
YSBjb21wYW55IGNhbm5vdAorIyAgZWZmZWN0aXZlbHkgcmVzdHJpY3QgdGhlIHVzZXJzIG9mIGEg
ZnJlZSBwcm9ncmFtIGJ5IG9idGFpbmluZyBhCisjIEBAIC0xMTEsNyArMTExLDcgQEAKKyMgICJ3
b3JrIGJhc2VkIG9uIHRoZSBsaWJyYXJ5IiBhbmQgYSAid29yayB0aGF0IHVzZXMgdGhlIGxpYnJh
cnkiLiAgVGhlCisjICBmb3JtZXIgY29udGFpbnMgY29kZSBkZXJpdmVkIGZyb20gdGhlIGxpYnJh
cnksIHdoZXJlYXMgdGhlIGxhdHRlciBtdXN0CisjICBiZSBjb21iaW5lZCB3aXRoIHRoZSBsaWJy
YXJ5IGluIG9yZGVyIHRvIHJ1bi4KKyMgLQwKKyMgKworIyAgICAgICAgICAgICAgICAgICAgR05V
IExFU1NFUiBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICAgICBURVJNUyBBTkQgQ09ORElUSU9O
UyBGT1IgQ09QWUlORywgRElTVFJJQlVUSU9OIEFORCBNT0RJRklDQVRJT04KKyMgIAorIyBAQCAt
MTU4LDcgKzE1OCw3IEBACisjICAgIFlvdSBtYXkgY2hhcmdlIGEgZmVlIGZvciB0aGUgcGh5c2lj
YWwgYWN0IG9mIHRyYW5zZmVycmluZyBhIGNvcHksCisjICBhbmQgeW91IG1heSBhdCB5b3VyIG9w
dGlvbiBvZmZlciB3YXJyYW50eSBwcm90ZWN0aW9uIGluIGV4Y2hhbmdlIGZvciBhCisjICBmZWUu
CisjIC0MCisjICsKKyMgICAgMi4gWW91IG1heSBtb2RpZnkgeW91ciBjb3B5IG9yIGNvcGllcyBv
ZiB0aGUgTGlicmFyeSBvciBhbnkgcG9ydGlvbgorIyAgb2YgaXQsIHRodXMgZm9ybWluZyBhIHdv
cmsgYmFzZWQgb24gdGhlIExpYnJhcnksIGFuZCBjb3B5IGFuZAorIyAgZGlzdHJpYnV0ZSBzdWNo
IG1vZGlmaWNhdGlvbnMgb3Igd29yayB1bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbiAxCisjIEBA
IC0yMTYsNyArMjE2LDcgQEAKKyMgIG9yZGluYXJ5IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGhhcyBhcHBlYXJlZCwgdGhlbiB5b3UgY2FuIHNwZWNpZnkKKyMgIHRoYXQgdmVyc2lvbiBpbnN0
ZWFkIGlmIHlvdSB3aXNoLikgIERvIG5vdCBtYWtlIGFueSBvdGhlciBjaGFuZ2UgaW4KKyMgIHRo
ZXNlIG5vdGljZXMuCisjIC0MCisjICsKKyMgICAgT25jZSB0aGlzIGNoYW5nZSBpcyBtYWRlIGlu
IGEgZ2l2ZW4gY29weSwgaXQgaXMgaXJyZXZlcnNpYmxlIGZvcgorIyAgdGhhdCBjb3B5LCBzbyB0
aGUgb3JkaW5hcnkgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXBwbGllcyB0byBhbGwKKyMg
IHN1YnNlcXVlbnQgY29waWVzIGFuZCBkZXJpdmF0aXZlIHdvcmtzIG1hZGUgZnJvbSB0aGF0IGNv
cHkuCisjIEBAIC0yNjcsNyArMjY3LDcgQEAKKyMgIGRpc3RyaWJ1dGUgdGhlIG9iamVjdCBjb2Rl
IGZvciB0aGUgd29yayB1bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbiA2LgorIyAgQW55IGV4ZWN1
dGFibGVzIGNvbnRhaW5pbmcgdGhhdCB3b3JrIGFsc28gZmFsbCB1bmRlciBTZWN0aW9uIDYsCisj
ICB3aGV0aGVyIG9yIG5vdCB0aGV5IGFyZSBsaW5rZWQgZGlyZWN0bHkgd2l0aCB0aGUgTGlicmFy
eSBpdHNlbGYuCisjIC0MCisjICsKKyMgICAgNi4gQXMgYW4gZXhjZXB0aW9uIHRvIHRoZSBTZWN0
aW9ucyBhYm92ZSwgeW91IG1heSBhbHNvIGNvbWJpbmUgb3IKKyMgIGxpbmsgYSAid29yayB0aGF0
IHVzZXMgdGhlIExpYnJhcnkiIHdpdGggdGhlIExpYnJhcnkgdG8gcHJvZHVjZSBhCisjICB3b3Jr
IGNvbnRhaW5pbmcgcG9ydGlvbnMgb2YgdGhlIExpYnJhcnksIGFuZCBkaXN0cmlidXRlIHRoYXQg
d29yaworIyBAQCAtMzI5LDcgKzMyOSw3IEBACisjICBhY2NvbXBhbnkgdGhlIG9wZXJhdGluZyBz
eXN0ZW0uICBTdWNoIGEgY29udHJhZGljdGlvbiBtZWFucyB5b3UgY2Fubm90CisjICB1c2UgYm90
aCB0aGVtIGFuZCB0aGUgTGlicmFyeSB0b2dldGhlciBpbiBhbiBleGVjdXRhYmxlIHRoYXQgeW91
CisjICBkaXN0cmlidXRlLgorIyAtDAorIyArCisjICAgIDcuIFlvdSBtYXkgcGxhY2UgbGlicmFy
eSBmYWNpbGl0aWVzIHRoYXQgYXJlIGEgd29yayBiYXNlZCBvbiB0aGUKKyMgIExpYnJhcnkgc2lk
ZS1ieS1zaWRlIGluIGEgc2luZ2xlIGxpYnJhcnkgdG9nZXRoZXIgd2l0aCBvdGhlciBsaWJyYXJ5
CisjICBmYWNpbGl0aWVzIG5vdCBjb3ZlcmVkIGJ5IHRoaXMgTGljZW5zZSwgYW5kIGRpc3RyaWJ1
dGUgc3VjaCBhIGNvbWJpbmVkCisjIEBAIC0zNzAsNyArMzcwLDcgQEAKKyMgIHJlc3RyaWN0aW9u
cyBvbiB0aGUgcmVjaXBpZW50cycgZXhlcmNpc2Ugb2YgdGhlIHJpZ2h0cyBncmFudGVkIGhlcmVp
bi4KKyMgIFlvdSBhcmUgbm90IHJlc3BvbnNpYmxlIGZvciBlbmZvcmNpbmcgY29tcGxpYW5jZSBi
eSB0aGlyZCBwYXJ0aWVzIHdpdGgKKyMgIHRoaXMgTGljZW5zZS4KKyMgLQwKKyMgKworIyAgICAx
MS4gSWYsIGFzIGEgY29uc2VxdWVuY2Ugb2YgYSBjb3VydCBqdWRnbWVudCBvciBhbGxlZ2F0aW9u
IG9mIHBhdGVudAorIyAgaW5mcmluZ2VtZW50IG9yIGZvciBhbnkgb3RoZXIgcmVhc29uIChub3Qg
bGltaXRlZCB0byBwYXRlbnQgaXNzdWVzKSwKKyMgIGNvbmRpdGlvbnMgYXJlIGltcG9zZWQgb24g
eW91ICh3aGV0aGVyIGJ5IGNvdXJ0IG9yZGVyLCBhZ3JlZW1lbnQgb3IKKyMgQEAgLTQyMiw3ICs0
MjIsNyBAQAorIyAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4gIElmIHRoZSBMaWJyYXJ5
IGRvZXMgbm90IHNwZWNpZnkgYQorIyAgbGljZW5zZSB2ZXJzaW9uIG51bWJlciwgeW91IG1heSBj
aG9vc2UgYW55IHZlcnNpb24gZXZlciBwdWJsaXNoZWQgYnkKKyMgIHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb24uCisjIC0MCisjICsKKyMgICAgMTQuIElmIHlvdSB3aXNoIHRvIGluY29ycG9y
YXRlIHBhcnRzIG9mIHRoZSBMaWJyYXJ5IGludG8gb3RoZXIgZnJlZQorIyAgcHJvZ3JhbXMgd2hv
c2UgZGlzdHJpYnV0aW9uIGNvbmRpdGlvbnMgYXJlIGluY29tcGF0aWJsZSB3aXRoIHRoZXNlLAor
IyAgd3JpdGUgdG8gdGhlIGF1dGhvciB0byBhc2sgZm9yIHBlcm1pc3Npb24uICBGb3Igc29mdHdh
cmUgd2hpY2ggaXMKKyMgQEAgLTQ1Niw3ICs0NTYsNyBAQAorIyAgREFNQUdFUy4KKyMgIAorIyAg
ICAgICAgICAgICAgICAgICAgICAgRU5EIE9GIFRFUk1TIEFORCBDT05ESVRJT05TCisjIC0MCisj
ICsKKyMgICAgICAgICAgICAgSG93IHRvIEFwcGx5IFRoZXNlIFRlcm1zIHRvIFlvdXIgTmV3IExp
YnJhcmllcworIyAgCisjICAgIElmIHlvdSBkZXZlbG9wIGEgbmV3IGxpYnJhcnksIGFuZCB5b3Ug
d2FudCBpdCB0byBiZSBvZiB0aGUgZ3JlYXRlc3QKKyMgCisjCisKIFNVTU1BUlkgPSAiQSBjb21w
bGV0ZSwgY3Jvc3MtcGxhdGZvcm0gc29sdXRpb24gdG8gcmVjb3JkLCBjb252ZXJ0IGFuZCBzdHJl
YW0gYXVkaW8gYW5kIHZpZGVvLiIKIERFU0NSSVBUSU9OID0gIkZGbXBlZyBpcyB0aGUgbGVhZGlu
ZyBtdWx0aW1lZGlhIGZyYW1ld29yaywgYWJsZSB0byBkZWNvZGUsIGVuY29kZSwgdHJhbnNjb2Rl
LCBcCiAgICAgICAgICAgICAgICBtdXgsIGRlbXV4LCBzdHJlYW0sIGZpbHRlciBhbmQgcGxheSBw
cmV0dHkgbXVjaCBhbnl0aGluZyB0aGF0IGh1bWFucyBhbmQgbWFjaGluZXMgXApAQCAtMTksMTIg
KzExMywxMyBAQCBMSUNFTlNFX0ZMQUdTID0gImNvbW1lcmNpYWwiCiAKIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlJTkcuR1BMdjI7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFm
NGE0MjYzIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkcuR1BMdjM7bWQ1PWQz
MjIzOWJjYjY3MzQ2M2FiODc0ZTgwZDQ3ZmFlNTA0IFwKLSAgICAgICAgICAgICAgICAgICAgZmls
ZTovL0NPUFlJTkcuTEdQTHYyLjE7bWQ1PWJkN2E0NDMzMjBhZjhjODEyZTRjMThkMWI3OWRmMDA0
IFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkcuTEdQTHYzO21kNT1lNmE2MDBm
ZDVlMWQ5Y2JkZTJkOTgzNjgwMjMzYWQwMiIKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NP
UFlJTkcuTEdQTHYyLjE7bWQ1PWVlZDIyYjM0NTYxMzI2MTFlM2Q0YWE3YTdlYzY0ZGFjIFwKKyAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkcuTEdQTHYzO21kNT1lNmE2MDBmZDVlMWQ5
Y2JkZTJkOTgzNjgwMjMzYWQwMiBcCisgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9
ICJodHRwczovL3d3dy5mZm1wZWcub3JnL3JlbGVhc2VzLyR7QlB9LnRhci54eiIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjczMzk4NDM5NWUwZGJiZTVjMDQ2YWJkYTJkYzQ5YTU1NDRlN2UwZTFl
MjM2NmJiYTg0OTIyMmFlOWUzYTAzYjEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjI3NTFmY2Ni
NmNjNGM3NzcwODExM2NkNzhiNTYxMDU5YjZmYTkwNGIyNDE2MmZhMGJlMmQ2MDI3M2QyN2I4ZSIK
IAogIyBCdWlsZCBmYWlscyB3aGVuIHRodW1iIGlzIGVuYWJsZWQ6IGh0dHBzOi8vYnVnemlsbGEu
eW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NzcxNwogQVJNX0lOU1RSVUNUSU9OX1NF
VDphcm12NCA9ICJhcm0iCi0tIAoyLjQ3LjEKCg==

--===============4776966244220134810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-700931054f79eefe31a464a5313912f917dc069c"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:700931054f79eefe31a464a5313912f917dc069c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 147 Local 137 Mirrors 0 Missed 10 Current 338 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 346 of 485 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_populate_lic_setscene)
NOTE: recipe ffmpeg-8.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe ffmpeg-8.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 485 of 485 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_recipe_qa_setscene)
NOTE: recipe ffmpeg-8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ffmpeg-8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
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
NOTE: recipe ffmpeg-8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ffmpeg-8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_deploy_source_date_epoch unihash changed to edb76ad2ead1ae6bc7cef715bc57e859d6e2217021d09f518b900cedd9480581
NOTE: Setscene tasks completed
NOTE: Running task 1375 of 1387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_configure)
NOTE: recipe ffmpeg-8.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot', '/srv/pokybuild
 /yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.18.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.03.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.8.bb:
 do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot']
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/temp/run.do_configure.1376401:152 exit 1 from '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/sources/ffmpeg-8.0/configure --disable-stripping --enable-pic --enable-shared --enable-pthreads --cross-prefix=x86_64-poky-linux- --ld='x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot' --cc='x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot' --cxx='x86_64-poky-linux-g++  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wf
 ormat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot' --arch=x86_64 --target-os='linux' --enable-cross-compile --extra-cflags=' -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/sources/ffmpeg-8.0=/usr/src/debug/ffmpeg/8.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/build=/usr/src/debug/ffmpeg/8.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot-native=  -pipe  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-s
 ysroot' --extra-ldflags='-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/sources/ffmpeg-8.0=/usr/src/debug/ffmpeg/8.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/build=/usr/src/debug/ffmpeg/8.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot-native=  -Wl,-z,relro,-z,now' --sysroot='/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/recipe-sysroot' ${EXTRA_FFCONF} --libdir=/usr/lib --shlibdir=/usr/lib --datadir=/usr/share/ffmpeg --disable-mipsdsp --disable-mipsdspr2 --cpu=generic --pkg-config=pkg-config --disable-static --enable-alsa --disable-altivec --enable-avcodec --enable-avdevice --enable-avfilter -
 -enable-avformat --enable-bzlib --disable-libfdk-aac --disable-gpl --disable-libgsm --disable-indev=jack --disable-libopus --disable-libvorbis --enable-lzma --disable-libmfx --disable-libmp3lame --disable-openssl --enable-postproc --disable-sdl2 --disable-libspeex --disable-libsrt --enable-swresample --enable-swscale --enable-libtheora --disable-libv4l2 --disable-vaapi --disable-vdpau --disable-libvpx --disable-libx264 --disable-libx265 --enable-libxcb --enable-outdev=xv --enable-zlib'
| WARNING: Backtrace (BB generated script):
| 	#1: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/temp/run.do_configure.1376401, line 152
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/temp/run.do_configure.1376401, line 157
NOTE: recipe ffmpeg-8.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1375 tasks of which 1368 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915105225.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915105225.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/temp/log.do_configure.1376401
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: ffmpeg-8.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/temp/run.do_configure.1376401' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ffmpeg/8.0/temp/log.do_configure.1376401
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb:do_configure) failed with exit code '1'

--===============4776966244220134810==--

