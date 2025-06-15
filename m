Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E763C8302D
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.8893.1749993285953782973
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GIiwwvZB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JviI+m4c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019773ba8007-74568bc9-ca93-4d4c-a2f4-b2fb145c33a3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hKPZztOjz6KXgRvFOydH7plORWf2z6y+dPSsADebFVg=;
	b=GIiwwvZBqFGvfrEj1vo5DQgqnWlcdj+UxO/SVI8VXRM2hEu1PuNFLa+eLAlYUpTq
	KtrpTppUjbvL6EYQvrjFoBzNe66hnqC++uoH/+fgc0ZcSkRUFQArpVergDt7wLI+JI5
	R8JIoZ8knL8l6gCAVkMH88sC2gF9hpQ8znlmUmBk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hKPZztOjz6KXgRvFOydH7plORWf2z6y+dPSsADebFVg=;
	b=JviI+m4cbY0Nkl8Yv3PfipEYCGw/neXpLue+vvRDlnn5LNKxTiSgETZKcmTGykGi
	EDevp/ZsxoZlDykXy3ag5dIGSL994hOptMCmT0IZPAb0bWYdmwoOrnHTL0QtliO36w8
	N64QzdIykC4dEqgx3L6m8EEPxrasSpABjHIY5dBg=
Content-Type: multipart/mixed; boundary="===============4915454522574623905=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.23.0 FAILED
Message-ID: <0101019773ba8007-74568bc9-ca93-4d4c-a2f4-b2fb145c33a3-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218696

--===============4915454522574623905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-zipp* to *3.23.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.21.0-3.23.0.patch
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
From 54fa3fd796e148a98811fa87ae781b616ffaf261 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 09:07:24 +0000
Subject: [PATCH] python3-zipp: upgrade 3.21.0 -> 3.23.0

---
 ...-zipp_3.21.0.bb => python3-zipp_3.23.0.bb} | 51 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.21.0.bb => python3-zipp_3.23.0.bb} (10%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.21.0.bb b/meta/recipes-devtools/python/python3-zipp_3.23.0.bb
similarity index 10%
rename from meta/recipes-devtools/python/python3-zipp_3.21.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.23.0.bb
index 135a1ae533..10ce36680b 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.21.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.23.0.bb
@@ -1,9 +1,56 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,17 +1,18 @@
+# -Permission is hereby granted, free of charge, to any person obtaining a copy
+# -of this software and associated documentation files (the "Software"), to
+# -deal in the Software without restriction, including without limitation the
+# -rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+# -sell copies of the Software, and to permit persons to whom the Software is
+# -furnished to do so, subject to the following conditions:
+# +MIT License
+#  
+# -The above copyright notice and this permission notice shall be included in
+# -all copies or substantial portions of the Software.
+# +Copyright (c) 2025 <copyright holders>
+#  
+# -THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# -IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# -FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# -AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# -LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+# -FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+# -IN THE SOFTWARE.
+# +Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
+# +associated documentation files (the "Software"), to deal in the Software without restriction, including
+# +without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# +copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
+# +following conditions:
+# +
+# +The above copyright notice and this permission notice shall be included in all copies or substantial
+# +portions of the Software.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
+# +LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
+# +EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
+# +IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+# +USE OR OTHER DEALINGS IN THE SOFTWARE.
+# 
+#
+
 SUMMARY = "Backport of pathlib-compatible object wrapper for zip files"
 HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1aeae65f25a15b1e46d4381f2f094e0a"
 
-SRC_URI[sha256sum] = "2c9958f6430a2040341a52eb608ed6dd93ef4392e02ffe219417c1b28b5dd1f4"
+SRC_URI[sha256sum] = "a07157588a12518c9d4034df3fbbee09c814741a33ff63c05fa29d26a2404166"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.1


--===============4915454522574623905==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.21.0-3.23.0.patch"

RnJvbSA1NGZhM2ZkNzk2ZTE0OGE5ODgxMWZhODdhZTc4MWI2MTZmZmFmMjYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDk6MDc6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXppcHA6IHVwZ3JhZGUgMy4yMS4wIC0+IDMuMjMuMAoKLS0tCiAuLi4temlwcF8zLjIx
LjAuYmIgPT4gcHl0aG9uMy16aXBwXzMuMjMuMC5iYn0gfCA1MSArKysrKysrKysrKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXppcHBfMy4yMS4wLmJiID0+
IHB5dGhvbjMtemlwcF8zLjIzLjAuYmJ9ICgxMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4yMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4yMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMu
MjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXpp
cHBfMy4yMy4wLmJiCmluZGV4IDEzNWExYWU1MzMuLjEwY2UzNjY4MGIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMjEuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjIzLjAuYmIKQEAgLTEs
OSArMSw1NiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVl
biB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBs
ZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRo
ZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicg
dGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRl
ZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UK
KyMgQEAgLTEsMTcgKzEsMTggQEAKKyMgLVBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZy
ZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkKKyMgLW9mIHRoaXMg
c29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2Fy
ZSIpLCB0bworIyAtZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5j
bHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUKKyMgLXJpZ2h0cyB0byB1c2UsIGNvcHksIG1v
ZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vcgorIyAt
c2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hv
bSB0aGUgU29mdHdhcmUgaXMKKyMgLWZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUg
Zm9sbG93aW5nIGNvbmRpdGlvbnM6CisjICtNSVQgTGljZW5zZQorIyAgCisjIC1UaGUgYWJvdmUg
Y29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNs
dWRlZCBpbgorIyAtYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29m
dHdhcmUuCisjICtDb3B5cmlnaHQgKGMpIDIwMjUgPGNvcHlyaWdodCBob2xkZXJzPgorIyAgCisj
IC1USEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBB
TlkgS0lORCwgRVhQUkVTUyBPUgorIyAtSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRF
RCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisjIC1GSVRORVNTIEZPUiBB
IFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFM
TCBUSEUKKyMgLUFVVEhPUlMgT1IgQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBBTlkg
Q0xBSU0sIERBTUFHRVMgT1IgT1RIRVIKKyMgLUxJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJ
T04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HCisjIC1GUk9NLCBPVVQg
T0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVS
IERFQUxJTkdTCisjIC1JTiBUSEUgU09GVFdBUkUuCisjICtQZXJtaXNzaW9uIGlzIGhlcmVieSBn
cmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5IG9m
IHRoaXMgc29mdHdhcmUgYW5kCisjICthc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRo
ZSAiU29mdHdhcmUiKSwgdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlv
biwgaW5jbHVkaW5nCisjICt3aXRob3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0cyB0byB1c2UsIGNv
cHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9v
ciBzZWxsCisjICtjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMg
dG8gd2hvbSB0aGUgU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRo
ZQorIyArZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjICsKKyMgK1RoZSBhYm92ZSBjb3B5cmlnaHQg
bm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFs
bCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwKKyMgK3BvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyMg
KworIyArVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkg
T0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IgSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QKKyMgK0xJ
TUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLCBGSVRORVNTIEZPUiBB
IFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTworIyArRVZFTlQg
U0hBTEwgVEhFIEFVVEhPUlMgT1IgQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBBTlkg
Q0xBSU0sIERBTUFHRVMgT1IgT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSCisjICtJTiBBTiBBQ1RJ
T04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sIE9VVCBPRiBP
UiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRQorIyArVVNFIE9SIE9USEVS
IERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KKyMgCisjCisKIFNVTU1BUlkgPSAiQmFja3BvcnQg
b2YgcGF0aGxpYi1jb21wYXRpYmxlIG9iamVjdCB3cmFwcGVyIGZvciB6aXAgZmlsZXMiCiBIT01F
UEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vamFyYWNvL3ppcHAiCiBMSUNFTlNFID0gIk1JVCIK
LUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTE0MTY0M2UxMWM0ODg5ODE1
MGRhYTgzODAyZGJjNjVmIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
MWFlYWU2NWYyNWExNWIxZTQ2ZDQzODFmMmYwOTRlMGEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIyYzk5NThmNjQzMGEyMDQwMzQxYTUyZWI2MDhlZDZkZDkzZWY0MzkyZTAyZmZlMjE5NDE3YzFi
MjhiNWRkMWY0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEwNzE1NzU4OGExMjUxOGM5ZDQwMzRk
ZjNmYmJlZTA5YzgxNDc0MWEzM2ZmNjNjMDVmYTI5ZDI2YTI0MDQxNjYiCiAKIERFUEVORFMgKz0g
InB5dGhvbjMtc2V0dXB0b29scy1zY20tbmF0aXZlIgogCi0tIAoyLjQ3LjEKCg==

--===============4915454522574623905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1912 entries from dependency cache.
Parsing recipes...done.
Parsing of 935 .bb files complete (934 cached, 1 parsed). 1910 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d3f7da4b32d279574f235208bb44b6ab4a8f07a4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 313 Local 301 Mirrors 0 Missed 12 Current 340 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1465 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_recipe_qa)
NOTE: recipe python3-zipp-3.23.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1853 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_fetch)
NOTE: recipe python3-zipp-3.23.0-r0: task do_fetch: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1854 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_unpack)
NOTE: Running task 1855 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.23.0-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1856 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_patch)
NOTE: Running task 1857 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-zipp-3.23.0-r0: task do_patch: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-zipp-3.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-zipp-3.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1858 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1859 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_populate_lic)
NOTE: recipe python3-zipp-3.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_populate_lic: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-zipp-3.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1860 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_configure)
NOTE: recipe python3-zipp-3.23.0-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1861 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_compile)
NOTE: recipe python3-zipp-3.23.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| running egg_info
| writing zipp.egg-info/PKG-INFO
| writing dependency_links to zipp.egg-info/dependency_links.txt
| writing requirements to zipp.egg-info/requires.txt
| writing top-level names to zipp.egg-info/top_level.txt
| ERROR setuptools_scm._file_finders.git listing git files failed - pretending there aren't any
| reading manifest file 'zipp.egg-info/SOURCES.txt'
| adding license file 'LICENSE'
| writing manifest file 'zipp.egg-info/SOURCES.txt'
| 
| ERROR Missing dependencies:
| 	coherent.licensed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/run.do_compile.2005309:158 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/zipp-3.23.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/run.do_compile.2005309, line 158
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/run.do_compile.2005309, line 153
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/run.do_compile.2005309, line 169
NOTE: recipe python3-zipp-3.23.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1861 tasks of which 1851 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615090709.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615090709.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/log.do_compile.2005309
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-zipp-3.23.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/run.do_compile.2005309' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/log.do_compile.2005309
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_compile) failed with exit code '1'

--===============4915454522574623905==--

