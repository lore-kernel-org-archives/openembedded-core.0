Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C4CC4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 05:15:58 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.470.1784438148593595447
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 22:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kY5q8881;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OqStXVBr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f78cd49d3-bfcc600f-e5d5-47d6-a7f4-ef5c104ef650-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784438147;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=KD64bYol6U5Vo4FDYX3rXXZvrUbSPaqMxxrqxWp0crs=;
	b=kY5q8881pzZrJyQEvDvPi+x82IWzo5IGckAWUctLNaSZFF1Hkb4cpoee7MXTtWk+
	qnaaOfjMqAi1mHJmZQvRArncLNbFj5nQUF+vSLvEoz6K2HDP0L3+hoz99WjUbgVeELX
	9bKzW1pau49HJ0tegy45vdVotFOIxKVF5ang4yRE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784438147;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=KD64bYol6U5Vo4FDYX3rXXZvrUbSPaqMxxrqxWp0crs=;
	b=OqStXVBr5vyuHVHE3/sUAdfRznkqsJ/BnB0ugU+QmH2NUObIwIZpKyRw7ycP3YxH
	/o4tIIrlRl1aUGNic7Yvz1b93QAhs5mtdPjSIUDJ56N7U87Jdooikn+J04UrxwJi9gO
	Y2R0icaIvySofNQJUAz3lOyAY7PL3DOlsXmfMkzY=
Content-Type: multipart/mixed; boundary="===============5400221994828437740=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.9.6 SUCCEEDED
Message-ID: <0101019f78cd49d3-bfcc600f-e5d5-47d6-a7f4-ef5c104ef650-000000@us-west-2.amazonses.com>
Date: Sun, 19 Jul 2026 05:15:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.19-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 05:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241272

--===============5400221994828437740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgit2* to *1.9.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgit2-upgrade-1.9.4-1.9.6.patch
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
From 552afb2b5b071352072ad9869f1812efe7c475f8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 19 Jul 2026 05:15:43 +0000
Subject: [PATCH] libgit2: upgrade 1.9.4 -> 1.9.6

---
 .../{libgit2_1.9.4.bb => libgit2_1.9.6.bb}    | 133 +++++++++++++++++-
 1 file changed, 131 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.9.4.bb => libgit2_1.9.6.bb} (10%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.9.4.bb b/meta/recipes-support/libgit2/libgit2_1.9.6.bb
similarity index 10%
rename from meta/recipes-support/libgit2/libgit2_1.9.4.bb
rename to meta/recipes-support/libgit2/libgit2_1.9.6.bb
index e46e5d49fd..773147e326 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.4.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.6.bb
@@ -1,12 +1,141 @@
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
+# @@ -406,23 +406,85 @@
+#  
+#  ----------------------------------------------------------------------
+#  
+# -The bundled PCRE implementation (deps/pcre/) is licensed under the BSD
+# -license.
+# +The bundled PCRE implementation (deps/pcre2/) is licensed under the
+# +PCRE2 Licence.
+# +
+# +PCRE2 is a library of functions to support regular expressions whose syntax
+# +and semantics are as close as possible to those of the Perl 5 language.
+# +
+# +Releases 10.00 and above of PCRE2 are distributed under the terms of the "BSD"
+# +licence, as specified below, with one exemption for certain binary
+# +redistributions. The documentation for PCRE2, supplied in the "doc" directory,
+# +is distributed under the same terms as the software itself. The data in the
+# +testdata directory is not copyrighted and is in the public domain.
+# +
+# +The basic library functions are written in C and are freestanding. Also
+# +included in the distribution is a just-in-time compiler that can be used to
+# +optimize pattern matching. This is an optional feature that can be omitted when
+# +the library is built. The just-in-time compiler is separately licensed under the
+# +"2-clause BSD" licence.
+# +
+# +
+# +COPYRIGHT
+# +---------
+# +
+# +### The basic library functions
+# +
+# +    Written by:       Philip Hazel
+# +    Email local part: Philip.Hazel
+# +    Email domain:     gmail.com
+# +
+# +    Retired from University of Cambridge Computing Service,
+# +    Cambridge, England.
+# +
+# +    Copyright (c) 1997-2007 University of Cambridge
+# +    Copyright (c) 2007-2024 Philip Hazel
+# +    All rights reserved.
+# +
+# +### PCRE2 Just-In-Time compilation support
+# +
+# +    Written by:       Zoltan Herczeg
+# +    Email local part: hzmester
+# +    Email domain:     freemail.hu
+# +
+# +    Copyright (c) 2010-2024 Zoltan Herczeg
+# +    All rights reserved.
+# +
+# +### Stack-less Just-In-Time compiler
+# +
+# +    Written by:       Zoltan Herczeg
+# +    Email local part: hzmester
+# +    Email domain:     freemail.hu
+# +
+# +    Copyright (c) 2009-2024 Zoltan Herczeg
+# +    All rights reserved.
+# +
+# +The code in the `deps/sljit` directory has its own LICENSE file.
+# +
+# +### All other contributions
+# +
+# +Many other contributors have participated in the authorship of PCRE2. As PCRE2
+# +has never required a Contributor Licensing Agreement, or other copyright
+# +assignment agreement, all contributions have copyright retained by each
+# +original contributor or their employer.
+# +
+# +
+# +THE "BSD" LICENCE
+# +-----------------
+#  
+#  Redistribution and use in source and binary forms, with or without
+#  modification, are permitted provided that the following conditions are met:
+#  
+# -    * Redistributions of source code must retain the above copyright notice,
+# -      this list of conditions and the following disclaimer.
+# -
+# -    * Redistributions in binary form must reproduce the above copyright
+# -      notice, this list of conditions and the following disclaimer in the
+# -      documentation and/or other materials provided with the distribution.
+# -
+# -    * Neither the name of the University of Cambridge nor the name of Google
+# -      Inc. nor the names of their contributors may be used to endorse or
+# -      promote products derived from this software without specific prior
+# -      written permission.
+# +* Redistributions of source code must retain the above copyright notices,
+# +  this list of conditions and the following disclaimer.
+# +
+# +* Redistributions in binary form must reproduce the above copyright
+# +  notices, this list of conditions and the following disclaimer in the
+# +  documentation and/or other materials provided with the distribution.
+# +
+# +* Neither the name of the University of Cambridge nor the names of any
+# +  contributors may be used to endorse or promote products derived from this
+# +  software without specific prior written permission.
+#  
+#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+#  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# @@ -435,6 +497,16 @@
+#  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+#  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+#  POSSIBILITY OF SUCH DAMAGE.
+# +
+# +
+# +EXEMPTION FOR BINARY LIBRARY-LIKE PACKAGES
+# +------------------------------------------
+# +
+# +The second condition in the BSD licence (covering binary redistributions) does
+# +not apply all the way down a chain of software. If binary package A includes
+# +PCRE2, it must respect the condition, but if package B is software that
+# +includes package A, the condition is not imposed on package B unless it uses
+# +PCRE2 independently.
+#  
+#  ----------------------------------------------------------------------
+#  
+# 
+#
+
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
 LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause & Zlib & ISC & LGPL-2.1-or-later & CC0-1.0 & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8289345c8713c385f45ec0c6c8a0d080"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v${PV}"
-SRCREV = "f7164261c9bc0a7e0ebf767c584e5192810a8b24"
+SRCREV = "26055f5af74ab1cf636d272e8a34315496d3f06f"
 
 inherit cmake
 
-- 
2.47.1


--===============5400221994828437740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.9.4", added "/usr/lib/libgit2.so.1.9.6"
Changes to packages/x86-64-v3-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.9 changed symlink target from libgit2.so.1.9.4 to libgit2.so.1.9.6
  /usr/lib/libgit2.so.1.9.4 moved to /usr/lib/libgit2.so.1.9.6

--===============5400221994828437740==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.9.4-1.9.6.patch"

RnJvbSA1NTJhZmIyYjViMDcxMzUyMDcyYWQ5ODY5ZjE4MTJlZmU3YzQ3NWY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTkgSnVsIDIwMjYgMDU6MTU6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnaXQyOiB1cGdyYWRlIDEuOS40IC0+IDEuOS42CgotLS0KIC4uLi97bGliZ2l0Ml8xLjkuNC5i
YiA9PiBsaWJnaXQyXzEuOS42LmJifSAgICB8IDEzMyArKysrKysrKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxMzEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL3tsaWJnaXQyXzEuOS40LmJiID0+IGxpYmdpdDJfMS45
LjYuYmJ9ICgxMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9s
aWJnaXQyXzEuOS40LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJnaXQyXzEu
OS42LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmdpdDIvbGliZ2l0Ml8xLjkuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZ2l0Mi9saWJnaXQyXzEuOS42LmJiCmluZGV4IGU0NmU1ZDQ5ZmQuLjc3MzE0N2UzMjYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0Ml8xLjkuNC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdpdDJfMS45LjYuYmIKQEAg
LTEsMTIgKzEsMTQxIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2
ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMg
dGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4K
KyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJp
emUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRh
dGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1
cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09Q
WUlORworIyBAQCAtNDA2LDIzICs0MDYsODUgQEAKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAg
CisjIC1UaGUgYnVuZGxlZCBQQ1JFIGltcGxlbWVudGF0aW9uIChkZXBzL3BjcmUvKSBpcyBsaWNl
bnNlZCB1bmRlciB0aGUgQlNECisjIC1saWNlbnNlLgorIyArVGhlIGJ1bmRsZWQgUENSRSBpbXBs
ZW1lbnRhdGlvbiAoZGVwcy9wY3JlMi8pIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZQorIyArUENSRTIg
TGljZW5jZS4KKyMgKworIyArUENSRTIgaXMgYSBsaWJyYXJ5IG9mIGZ1bmN0aW9ucyB0byBzdXBw
b3J0IHJlZ3VsYXIgZXhwcmVzc2lvbnMgd2hvc2Ugc3ludGF4CisjICthbmQgc2VtYW50aWNzIGFy
ZSBhcyBjbG9zZSBhcyBwb3NzaWJsZSB0byB0aG9zZSBvZiB0aGUgUGVybCA1IGxhbmd1YWdlLgor
IyArCisjICtSZWxlYXNlcyAxMC4wMCBhbmQgYWJvdmUgb2YgUENSRTIgYXJlIGRpc3RyaWJ1dGVk
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgIkJTRCIKKyMgK2xpY2VuY2UsIGFzIHNwZWNpZmllZCBi
ZWxvdywgd2l0aCBvbmUgZXhlbXB0aW9uIGZvciBjZXJ0YWluIGJpbmFyeQorIyArcmVkaXN0cmli
dXRpb25zLiBUaGUgZG9jdW1lbnRhdGlvbiBmb3IgUENSRTIsIHN1cHBsaWVkIGluIHRoZSAiZG9j
IiBkaXJlY3RvcnksCisjICtpcyBkaXN0cmlidXRlZCB1bmRlciB0aGUgc2FtZSB0ZXJtcyBhcyB0
aGUgc29mdHdhcmUgaXRzZWxmLiBUaGUgZGF0YSBpbiB0aGUKKyMgK3Rlc3RkYXRhIGRpcmVjdG9y
eSBpcyBub3QgY29weXJpZ2h0ZWQgYW5kIGlzIGluIHRoZSBwdWJsaWMgZG9tYWluLgorIyArCisj
ICtUaGUgYmFzaWMgbGlicmFyeSBmdW5jdGlvbnMgYXJlIHdyaXR0ZW4gaW4gQyBhbmQgYXJlIGZy
ZWVzdGFuZGluZy4gQWxzbworIyAraW5jbHVkZWQgaW4gdGhlIGRpc3RyaWJ1dGlvbiBpcyBhIGp1
c3QtaW4tdGltZSBjb21waWxlciB0aGF0IGNhbiBiZSB1c2VkIHRvCisjICtvcHRpbWl6ZSBwYXR0
ZXJuIG1hdGNoaW5nLiBUaGlzIGlzIGFuIG9wdGlvbmFsIGZlYXR1cmUgdGhhdCBjYW4gYmUgb21p
dHRlZCB3aGVuCisjICt0aGUgbGlicmFyeSBpcyBidWlsdC4gVGhlIGp1c3QtaW4tdGltZSBjb21w
aWxlciBpcyBzZXBhcmF0ZWx5IGxpY2Vuc2VkIHVuZGVyIHRoZQorIyArIjItY2xhdXNlIEJTRCIg
bGljZW5jZS4KKyMgKworIyArCisjICtDT1BZUklHSFQKKyMgKy0tLS0tLS0tLQorIyArCisjICsj
IyMgVGhlIGJhc2ljIGxpYnJhcnkgZnVuY3Rpb25zCisjICsKKyMgKyAgICBXcml0dGVuIGJ5OiAg
ICAgICBQaGlsaXAgSGF6ZWwKKyMgKyAgICBFbWFpbCBsb2NhbCBwYXJ0OiBQaGlsaXAuSGF6ZWwK
KyMgKyAgICBFbWFpbCBkb21haW46ICAgICBnbWFpbC5jb20KKyMgKworIyArICAgIFJldGlyZWQg
ZnJvbSBVbml2ZXJzaXR5IG9mIENhbWJyaWRnZSBDb21wdXRpbmcgU2VydmljZSwKKyMgKyAgICBD
YW1icmlkZ2UsIEVuZ2xhbmQuCisjICsKKyMgKyAgICBDb3B5cmlnaHQgKGMpIDE5OTctMjAwNyBV
bml2ZXJzaXR5IG9mIENhbWJyaWRnZQorIyArICAgIENvcHlyaWdodCAoYykgMjAwNy0yMDI0IFBo
aWxpcCBIYXplbAorIyArICAgIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICsKKyMgKyMjIyBQQ1JF
MiBKdXN0LUluLVRpbWUgY29tcGlsYXRpb24gc3VwcG9ydAorIyArCisjICsgICAgV3JpdHRlbiBi
eTogICAgICAgWm9sdGFuIEhlcmN6ZWcKKyMgKyAgICBFbWFpbCBsb2NhbCBwYXJ0OiBoem1lc3Rl
cgorIyArICAgIEVtYWlsIGRvbWFpbjogICAgIGZyZWVtYWlsLmh1CisjICsKKyMgKyAgICBDb3B5
cmlnaHQgKGMpIDIwMTAtMjAyNCBab2x0YW4gSGVyY3plZworIyArICAgIEFsbCByaWdodHMgcmVz
ZXJ2ZWQuCisjICsKKyMgKyMjIyBTdGFjay1sZXNzIEp1c3QtSW4tVGltZSBjb21waWxlcgorIyAr
CisjICsgICAgV3JpdHRlbiBieTogICAgICAgWm9sdGFuIEhlcmN6ZWcKKyMgKyAgICBFbWFpbCBs
b2NhbCBwYXJ0OiBoem1lc3RlcgorIyArICAgIEVtYWlsIGRvbWFpbjogICAgIGZyZWVtYWlsLmh1
CisjICsKKyMgKyAgICBDb3B5cmlnaHQgKGMpIDIwMDktMjAyNCBab2x0YW4gSGVyY3plZworIyAr
ICAgIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICsKKyMgK1RoZSBjb2RlIGluIHRoZSBgZGVwcy9z
bGppdGAgZGlyZWN0b3J5IGhhcyBpdHMgb3duIExJQ0VOU0UgZmlsZS4KKyMgKworIyArIyMjIEFs
bCBvdGhlciBjb250cmlidXRpb25zCisjICsKKyMgK01hbnkgb3RoZXIgY29udHJpYnV0b3JzIGhh
dmUgcGFydGljaXBhdGVkIGluIHRoZSBhdXRob3JzaGlwIG9mIFBDUkUyLiBBcyBQQ1JFMgorIyAr
aGFzIG5ldmVyIHJlcXVpcmVkIGEgQ29udHJpYnV0b3IgTGljZW5zaW5nIEFncmVlbWVudCwgb3Ig
b3RoZXIgY29weXJpZ2h0CisjICthc3NpZ25tZW50IGFncmVlbWVudCwgYWxsIGNvbnRyaWJ1dGlv
bnMgaGF2ZSBjb3B5cmlnaHQgcmV0YWluZWQgYnkgZWFjaAorIyArb3JpZ2luYWwgY29udHJpYnV0
b3Igb3IgdGhlaXIgZW1wbG95ZXIuCisjICsKKyMgKworIyArVEhFICJCU0QiIExJQ0VOQ0UKKyMg
Ky0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291
cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAgbW9kaWZpY2F0aW9uLCBh
cmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zIGFyZSBt
ZXQ6CisjICAKKyMgLSAgICAqIFJlZGlzdHJpYnV0aW9ucyBvZiBzb3VyY2UgY29kZSBtdXN0IHJl
dGFpbiB0aGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSwKKyMgLSAgICAgIHRoaXMgbGlzdCBvZiBj
b25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIuCisjIC0KKyMgLSAgICAqIFJl
ZGlzdHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29w
eXJpZ2h0CisjIC0gICAgICBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUg
Zm9sbG93aW5nIGRpc2NsYWltZXIgaW4gdGhlCisjIC0gICAgICBkb2N1bWVudGF0aW9uIGFuZC9v
ciBvdGhlciBtYXRlcmlhbHMgcHJvdmlkZWQgd2l0aCB0aGUgZGlzdHJpYnV0aW9uLgorIyAtCisj
IC0gICAgKiBOZWl0aGVyIHRoZSBuYW1lIG9mIHRoZSBVbml2ZXJzaXR5IG9mIENhbWJyaWRnZSBu
b3IgdGhlIG5hbWUgb2YgR29vZ2xlCisjIC0gICAgICBJbmMuIG5vciB0aGUgbmFtZXMgb2YgdGhl
aXIgY29udHJpYnV0b3JzIG1heSBiZSB1c2VkIHRvIGVuZG9yc2Ugb3IKKyMgLSAgICAgIHByb21v
dGUgcHJvZHVjdHMgZGVyaXZlZCBmcm9tIHRoaXMgc29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYyBw
cmlvcgorIyAtICAgICAgd3JpdHRlbiBwZXJtaXNzaW9uLgorIyArKiBSZWRpc3RyaWJ1dGlvbnMg
b2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2VzLAor
IyArICB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVy
LgorIyArCisjICsqIFJlZGlzdHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0IHJlcHJvZHVj
ZSB0aGUgYWJvdmUgY29weXJpZ2h0CisjICsgIG5vdGljZXMsIHRoaXMgbGlzdCBvZiBjb25kaXRp
b25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIgaW4gdGhlCisjICsgIGRvY3VtZW50YXRp
b24gYW5kL29yIG90aGVyIG1hdGVyaWFscyBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24u
CisjICsKKyMgKyogTmVpdGhlciB0aGUgbmFtZSBvZiB0aGUgVW5pdmVyc2l0eSBvZiBDYW1icmlk
Z2Ugbm9yIHRoZSBuYW1lcyBvZiBhbnkKKyMgKyAgY29udHJpYnV0b3JzIG1heSBiZSB1c2VkIHRv
IGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0cyBkZXJpdmVkIGZyb20gdGhpcworIyArICBzb2Z0
d2FyZSB3aXRob3V0IHNwZWNpZmljIHByaW9yIHdyaXR0ZW4gcGVybWlzc2lvbi4KKyMgIAorIyAg
VEhJUyBTT0ZUV0FSRSBJUyBQUk9WSURFRCBCWSBUSEUgQ09QWVJJR0hUIEhPTERFUlMgQU5EIENP
TlRSSUJVVE9SUyAiQVMgSVMiCisjICBBTkQgQU5ZIEVYUFJFU1MgT1IgSU1QTElFRCBXQVJSQU5U
SUVTLCBJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgVEhFCisjIEBAIC00MzUsNiArNDk3
LDE2IEBACisjICBDT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwgT1IgVE9SVCAoSU5DTFVESU5H
IE5FR0xJR0VOQ0UgT1IgT1RIRVJXSVNFKQorIyAgQVJJU0lORyBJTiBBTlkgV0FZIE9VVCBPRiBU
SEUgVVNFIE9GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRiBUSEUKKyMgIFBPU1NJ
QklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyArCisjICsKKyMgK0VYRU1QVElPTiBGT1IgQklOQVJZ
IExJQlJBUlktTElLRSBQQUNLQUdFUworIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjICsKKyMgK1RoZSBzZWNvbmQgY29uZGl0aW9uIGluIHRoZSBCU0QgbGlj
ZW5jZSAoY292ZXJpbmcgYmluYXJ5IHJlZGlzdHJpYnV0aW9ucykgZG9lcworIyArbm90IGFwcGx5
IGFsbCB0aGUgd2F5IGRvd24gYSBjaGFpbiBvZiBzb2Z0d2FyZS4gSWYgYmluYXJ5IHBhY2thZ2Ug
QSBpbmNsdWRlcworIyArUENSRTIsIGl0IG11c3QgcmVzcGVjdCB0aGUgY29uZGl0aW9uLCBidXQg
aWYgcGFja2FnZSBCIGlzIHNvZnR3YXJlIHRoYXQKKyMgK2luY2x1ZGVzIHBhY2thZ2UgQSwgdGhl
IGNvbmRpdGlvbiBpcyBub3QgaW1wb3NlZCBvbiBwYWNrYWdlIEIgdW5sZXNzIGl0IHVzZXMKKyMg
K1BDUkUyIGluZGVwZW5kZW50bHkuCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyAKKyMK
KwogU1VNTUFSWSA9ICJ0aGUgR2l0IGxpbmthYmxlIGxpYnJhcnkiCiBIT01FUEFHRSA9ICJodHRw
Oi8vbGliZ2l0Mi5naXRodWIuY29tLyIKIExJQ0VOU0UgPSAiR1BMLTIuMC13aXRoLUdDQy1leGNl
cHRpb24gJiBNSVQgJiBPcGVuU1NMICYgQlNELTMtQ2xhdXNlICYgWmxpYiAmIElTQyAmIExHUEwt
Mi4xLW9yLWxhdGVyICYgQ0MwLTEuMCAmIEJTRC0yLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PThlYWNmZGMxN2M4ZjRkMjE5ZTEzMWEwNzM5NzNiOTdkIgor
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ODI4OTM0NWM4NzEzYzM4NWY0
NWVjMGM2YzhhMGQwODAiCiAKIERFUEVORFMgPSAiY3VybCBvcGVuc3NsIHpsaWIgbGlic3NoMiBs
aWJnY3J5cHQgbGlicGNyZTIiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saWJnaXQy
L2xpYmdpdDIuZ2l0O2JyYW5jaD1tYWludC92MS45O3Byb3RvY29sPWh0dHBzO3RhZz12JHtQVn0i
Ci1TUkNSRVYgPSAiZjcxNjQyNjFjOWJjMGE3ZTBlYmY3NjdjNTg0ZTUxOTI4MTBhOGIyNCIKK1NS
Q1JFViA9ICIyNjA1NWY1YWY3NGFiMWNmNjM2ZDI3MmU4YTM0MzE1NDk2ZDNmMDZmIgogCiBpbmhl
cml0IGNtYWtlCiAKLS0gCjIuNDcuMQoK

--===============5400221994828437740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libgit2: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/libgit2: SRC_URI changed from "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v1.9.4" to "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v1.9.6"
packages/x86-64-v3-poky-linux/libgit2: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: PKGSIZE changed from 11571264 to 11577496 (+0%)
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: FILELIST: removed "/usr/lib/.debug/libgit2.so.1.9.4", added "/usr/lib/.debug/libgit2.so.1.9.6"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dev: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-dev: PKGSIZE changed from 842143 to 842668 (+0%)
packages/x86-64-v3-poky-linux/libgit2/libgit2-dev: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/libgit2/libgit2-doc: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-doc: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/libgit2/libgit2-locale: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-locale: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: PKGSIZE changed from 4626791 to 4630110 (+0%)
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: FILELIST: directory renamed /usr/src/debug/libgit2/1.9.4/src/libgit2/streams -> /usr/src/debug/libgit2/1.9.6/src/libgit2/streams, directory renamed /usr/src/debug/libgit2/1.9.4/include/git2/sys -> /usr/src/debug/libgit2/1.9.6/include/git2/sys, directory renamed /usr/src/debug/libgit2/1.9.4/src/util/hash -> /usr/src/debug/libgit2/1.9.6/src/util/hash, directory renamed /usr/src/debug/libgit2/1.9.4/src/libgit2/transports -> /usr/src/debug/libgit2/1.9.6/src/libgit2/transports, directory renamed /usr/src/debug/libgit2/1.9.4/src/cli/unix -> /usr/src/debug/libgit2/1.9.6/src/cli/unix, directory renamed /usr/src/debug/libgit2/1.9.4/deps/ntlmclient -> /usr/src/debug/libgit2/1.9.6/deps/ntlmclient, directory renamed /usr/src/debug/libgit2/1.9.4/src/util -> /usr/src/debug/libgit2/1.9.6/src/util, directory renamed /usr/src/debug/libgit2/1.9.4/include/git2 -> /usr/src/debug/libgit2/1.9.6/include/git2, directory renamed /usr/src/debug/libgit2/1.9.4/
 deps/xdiff -> /usr/src/debug/libgit2/1.9.6/deps/xdiff, directory renamed /usr/src/debug/libgit2/1.9.4/src/libgit2 -> /usr/src/debug/libgit2/1.9.6/src/libgit2, directory renamed /usr/src/debug/libgit2/1.9.4/src/util/unix -> /usr/src/debug/libgit2/1.9.6/src/util/unix, directory renamed /usr/src/debug/libgit2/1.9.4/src/util/hash/sha1dc -> /usr/src/debug/libgit2/1.9.6/src/util/hash/sha1dc, directory renamed /usr/src/debug/libgit2/1.9.4/src/util/allocators -> /usr/src/debug/libgit2/1.9.6/src/util/allocators, directory renamed /usr/src/debug/libgit2/1.9.4/deps/llhttp -> /usr/src/debug/libgit2/1.9.6/deps/llhttp, directory renamed /usr/src/debug/libgit2/1.9.4/src/cli -> /usr/src/debug/libgit2/1.9.6/src/cli
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/libgit2/libgit2-staticdev: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-staticdev: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/libgit2/libgit2: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.9.4", added "/usr/lib/libgit2.so.1.9.6"
packages/x86-64-v3-poky-linux/libgit2/libgit2: PV changed from "1.9.4" to "1.9.6"
Changes to packages/x86-64-v3-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.9 changed symlink target from libgit2.so.1.9.4 to libgit2.so.1.9.6
  /usr/lib/libgit2.so.1.9.4 moved to /usr/lib/libgit2.so.1.9.6

--===============5400221994828437740==--

