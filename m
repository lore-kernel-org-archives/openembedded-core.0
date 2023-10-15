Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F00C04AB7
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:23 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.102660.1697399113819216805
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fh3jZPIr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LFQ0vClB;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b34df07f1-850d8d88-56da-446f-ad4d-e7364e2cafbb-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LbncqWv6ISKz/Shf8YM+jVVsCV7oIIZ86UkOQkJlIwI=;
	b=fh3jZPIr3iiNBSfgyOZeb3VOyrcdH2gtke4k+tpTK2uXPONQetybFEEcMJrsagBJ
	PshHn3vFSSvJJ6U8dKiWlEwKkAoZft8wjmLePzn1eyuippBGCXMsTPdxQOHPdrOEZQu
	djkb3tUrq8ip/TiD1Nyh7fPZnVOauj/J8h8CwWqY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LbncqWv6ISKz/Shf8YM+jVVsCV7oIIZ86UkOQkJlIwI=;
	b=LFQ0vClB5Ff+hkj58UMDoC0yp2HyCPNkQaWOHvJ8jMq/53iU27kGYjsYGttdXIdl
	DblfbhEL0HU4iR5Zow0Dp1sURlPmHcNFAl7j/pdAQk4FcSByPm6kuP0KqE+Xcr1SNr7
	Goi0WCSJdJU2zFTkIETi9fJEtbu8lxxO+4LaM8SI=
Content-Type: multipart/mixed; boundary="===============9067111234201042312=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.37 SUCCEEDED
Message-ID: <0101018b34df07f1-850d8d88-56da-446f-ad4d-e7364e2cafbb-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189194

--===============9067111234201042312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.37* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.36-3.1.37.patch
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
From 57d5359eb7606acc12fd07110837329abe3453e4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 11:04:01 +0000
Subject: [PATCH] python3-git: upgrade 3.1.36 -> 3.1.37

---
 ...n3-git_3.1.36.bb => python3-git_3.1.37.bb} | 65 ++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.36.bb => python3-git_3.1.37.bb} (22%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.36.bb b/meta/recipes-devtools/python/python3-git_3.1.37.bb
similarity index 22%
rename from meta/recipes-devtools/python/python3-git_3.1.36.bb
rename to meta/recipes-devtools/python/python3-git_3.1.37.bb
index ab1b0f2353..7860c9bbdd 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.36.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.37.bb
@@ -1,3 +1,64 @@
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
+# @@ -1,30 +1,29 @@
+#  Copyright (C) 2008, 2009 Michael Trier and contributors
+#  All rights reserved.
+#  
+# -Redistribution and use in source and binary forms, with or without 
+# -modification, are permitted provided that the following conditions 
+# +Redistribution and use in source and binary forms, with or without
+# +modification, are permitted provided that the following conditions
+#  are met:
+#  
+# -* Redistributions of source code must retain the above copyright 
+# +* Redistributions of source code must retain the above copyright
+#  notice, this list of conditions and the following disclaimer.
+#  
+# -* Redistributions in binary form must reproduce the above copyright 
+# -notice, this list of conditions and the following disclaimer in the 
+# +* Redistributions in binary form must reproduce the above copyright
+# +notice, this list of conditions and the following disclaimer in the
+#  documentation and/or other materials provided with the distribution.
+#  
+# -* Neither the name of the GitPython project nor the names of 
+# -its contributors may be used to endorse or promote products derived 
+# +* Neither the name of the GitPython project nor the names of
+# +its contributors may be used to endorse or promote products derived
+#  from this software without specific prior written permission.
+#  
+# -THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
+# -"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
+# -LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
+# -A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
+# -OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
+# -SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
+# -TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
+# -PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
+# -LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
+# -NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
+# +THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# +"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+# +LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+# +A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+# +OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+# +SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
+# +TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+# +PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+# +LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+# +NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+#  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# -
+# 
+#
+
 SUMMARY = "Python library used to interact with Git repositories"
 DESCRIPTION = "GitPython provides object model read and write access to \
 a git repository. Access repository information conveniently, alter the \
@@ -6,13 +67,13 @@ access with big-files support."
 HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
 
 PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4bb0c2a6995e85064140d31a33289aa5dce80133a23d36fcd372d716c54d3ebf"
+SRC_URI[sha256sum] = "f9b9ddc0761c125d5780eab2d64be4873fc6817c2899cbcb34b02344bdc7bc54"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.39.2


--===============9067111234201042312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.36.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.37.dist-info

--===============9067111234201042312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.36.tar.gz;downloadfilename=GitPython-3.1.36.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.37.tar.gz;downloadfilename=GitPython-3.1.37.tar.gz"
packages/core2-32-poky-linux/python3-git: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 1338870 to 1343995 (+0%)
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.36" to "3.1.37"
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.36.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.37.dist-info

--===============9067111234201042312==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.36-3.1.37.patch"

RnJvbSA1N2Q1MzU5ZWI3NjA2YWNjMTJmZDA3MTEwODM3MzI5YWJlMzQ1M2U0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTE6MDQ6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWdpdDogdXBncmFkZSAzLjEuMzYgLT4gMy4xLjM3CgotLS0KIC4uLm4zLWdpdF8zLjEu
MzYuYmIgPT4gcHl0aG9uMy1naXRfMy4xLjM3LmJifSB8IDY1ICsrKysrKysrKysrKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZ2l0XzMuMS4zNi5iYiA9PiBw
eXRob24zLWdpdF8zLjEuMzcuYmJ9ICgyMiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMzYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zNy5iYgpzaW1pbGFyaXR5IGluZGV4IDIyJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zNi5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEu
MzcuYmIKaW5kZXggYWIxYjBmMjM1My4uNzg2MGM5YmJkZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMzYuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMzcuYmIKQEAgLTEsMyArMSw2NCBA
QAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVk
IGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRh
dGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2Vz
IGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAo
ZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIwor
IyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEs
MzAgKzEsMjkgQEAKKyMgIENvcHlyaWdodCAoQykgMjAwOCwgMjAwOSBNaWNoYWVsIFRyaWVyIGFu
ZCBjb250cmlidXRvcnMKKyMgIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICAKKyMgLVJlZGlzdHJp
YnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91
dCAKKyMgLW1vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xs
b3dpbmcgY29uZGl0aW9ucyAKKyMgK1JlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFu
ZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyArbW9kaWZpY2F0aW9uLCBhcmUgcGVy
bWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zCisjICBhcmUgbWV0
OgorIyAgCisjIC0qIFJlZGlzdHJpYnV0aW9ucyBvZiBzb3VyY2UgY29kZSBtdXN0IHJldGFpbiB0
aGUgYWJvdmUgY29weXJpZ2h0IAorIyArKiBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUg
bXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodAorIyAgbm90aWNlLCB0aGlzIGxpc3Qgb2Yg
Y29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLgorIyAgCisjIC0qIFJlZGlz
dHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29weXJp
Z2h0IAorIyAtbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2lu
ZyBkaXNjbGFpbWVyIGluIHRoZSAKKyMgKyogUmVkaXN0cmlidXRpb25zIGluIGJpbmFyeSBmb3Jt
IG11c3QgcmVwcm9kdWNlIHRoZSBhYm92ZSBjb3B5cmlnaHQKKyMgK25vdGljZSwgdGhpcyBsaXN0
IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lciBpbiB0aGUKKyMgIGRv
Y3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVyaWFscyBwcm92aWRlZCB3aXRoIHRoZSBkaXN0
cmlidXRpb24uCisjICAKKyMgLSogTmVpdGhlciB0aGUgbmFtZSBvZiB0aGUgR2l0UHl0aG9uIHBy
b2plY3Qgbm9yIHRoZSBuYW1lcyBvZiAKKyMgLWl0cyBjb250cmlidXRvcnMgbWF5IGJlIHVzZWQg
dG8gZW5kb3JzZSBvciBwcm9tb3RlIHByb2R1Y3RzIGRlcml2ZWQgCisjICsqIE5laXRoZXIgdGhl
IG5hbWUgb2YgdGhlIEdpdFB5dGhvbiBwcm9qZWN0IG5vciB0aGUgbmFtZXMgb2YKKyMgK2l0cyBj
b250cmlidXRvcnMgbWF5IGJlIHVzZWQgdG8gZW5kb3JzZSBvciBwcm9tb3RlIHByb2R1Y3RzIGRl
cml2ZWQKKyMgIGZyb20gdGhpcyBzb2Z0d2FyZSB3aXRob3V0IHNwZWNpZmljIHByaW9yIHdyaXR0
ZW4gcGVybWlzc2lvbi4KKyMgIAorIyAtVEhJUyBTT0ZUV0FSRSBJUyBQUk9WSURFRCBCWSBUSEUg
Q09QWVJJR0hUIEhPTERFUlMgQU5EIENPTlRSSUJVVE9SUyAKKyMgLSJBUyBJUyIgQU5EIEFOWSBF
WFBSRVNTIE9SIElNUExJRUQgV0FSUkFOVElFUywgSU5DTFVESU5HLCBCVVQgTk9UIAorIyAtTElN
SVRFRCBUTywgVEhFIElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJ
VE5FU1MgRk9SIAorIyAtQSBQQVJUSUNVTEFSIFBVUlBPU0UgQVJFIERJU0NMQUlNRUQuIElOIE5P
IEVWRU5UIFNIQUxMIFRIRSBDT1BZUklHSFQgCisjIC1PV05FUiBPUiBDT05UUklCVVRPUlMgQkUg
TElBQkxFIEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwgSU5DSURFTlRBTCwgCisjIC1TUEVDSUFM
LCBFWEVNUExBUlksIE9SIENPTlNFUVVFTlRJQUwgREFNQUdFUyAoSU5DTFVESU5HLCBCVVQgTk9U
IExJTUlURUQgCisjIC1UTywgUFJPQ1VSRU1FTlQgT0YgU1VCU1RJVFVURSBHT09EUyBPUiBTRVJW
SUNFUzsgTE9TUyBPRiBVU0UsIERBVEEsIE9SIAorIyAtUFJPRklUUzsgT1IgQlVTSU5FU1MgSU5U
RVJSVVBUSU9OKSBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWSBPRiAKKyMgLUxJQUJJ
TElUWSwgV0hFVEhFUiBJTiBDT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwgT1IgVE9SVCAoSU5D
TFVESU5HIAorIyAtTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcgSU4gQU5ZIFdBWSBP
VVQgT0YgVEhFIFVTRSBPRiBUSElTIAorIyArVEhJUyBTT0ZUV0FSRSBJUyBQUk9WSURFRCBCWSBU
SEUgQ09QWVJJR0hUIEhPTERFUlMgQU5EIENPTlRSSUJVVE9SUworIyArIkFTIElTIiBBTkQgQU5Z
IEVYUFJFU1MgT1IgSU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcsIEJVVCBOT1QKKyMgK0xJ
TUlURUQgVE8sIFRIRSBJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBG
SVRORVNTIEZPUgorIyArQSBQQVJUSUNVTEFSIFBVUlBPU0UgQVJFIERJU0NMQUlNRUQuIElOIE5P
IEVWRU5UIFNIQUxMIFRIRSBDT1BZUklHSFQKKyMgK09XTkVSIE9SIENPTlRSSUJVVE9SUyBCRSBM
SUFCTEUgRk9SIEFOWSBESVJFQ1QsIElORElSRUNULCBJTkNJREVOVEFMLAorIyArU1BFQ0lBTCwg
RVhFTVBMQVJZLCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMgKElOQ0xVRElORywgQlVUIE5PVCBM
SU1JVEVECisjICtUTywgUFJPQ1VSRU1FTlQgT0YgU1VCU1RJVFVURSBHT09EUyBPUiBTRVJWSUNF
UzsgTE9TUyBPRiBVU0UsIERBVEEsIE9SCisjICtQUk9GSVRTOyBPUiBCVVNJTkVTUyBJTlRFUlJV
UFRJT04pIEhPV0VWRVIgQ0FVU0VEIEFORCBPTiBBTlkgVEhFT1JZIE9GCisjICtMSUFCSUxJVFks
IFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJVFksIE9SIFRPUlQgKElOQ0xVRElO
RworIyArTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcgSU4gQU5ZIFdBWSBPVVQgT0Yg
VEhFIFVTRSBPRiBUSElTCisjICBTT0ZUV0FSRSwgRVZFTiBJRiBBRFZJU0VEIE9GIFRIRSBQT1NT
SUJJTElUWSBPRiBTVUNIIERBTUFHRS4KKyMgLQorIyAKKyMKKwogU1VNTUFSWSA9ICJQeXRob24g
bGlicmFyeSB1c2VkIHRvIGludGVyYWN0IHdpdGggR2l0IHJlcG9zaXRvcmllcyIKIERFU0NSSVBU
SU9OID0gIkdpdFB5dGhvbiBwcm92aWRlcyBvYmplY3QgbW9kZWwgcmVhZCBhbmQgd3JpdGUgYWNj
ZXNzIHRvIFwKIGEgZ2l0IHJlcG9zaXRvcnkuIEFjY2VzcyByZXBvc2l0b3J5IGluZm9ybWF0aW9u
IGNvbnZlbmllbnRseSwgYWx0ZXIgdGhlIFwKQEAgLTYsMTMgKzY3LDEzIEBAIGFjY2VzcyB3aXRo
IGJpZy1maWxlcyBzdXBwb3J0LiIKIEhPTUVQQUdFID0gImh0dHA6Ly9naXRodWIuY29tL2dpdHB5
dGhvbi1kZXZlbG9wZXJzL0dpdFB5dGhvbiIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElD
RU5TRSA9ICJCU0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT04YjhkMjZjMzdjMWQ1YTA0ZjliMDE4NmVkYmViYzE4MyIKK0xJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTUyNzlhN2FiMzY5YmEzMzY5ODlkY2YyYTEwN2U1YzhlIgog
CiBQWVBJX1BBQ0tBR0UgPSAiR2l0UHl0aG9uIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVw
dG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGJiMGMyYTY5OTVlODUw
NjQxNDBkMzFhMzMyODlhYTVkY2U4MDEzM2EyM2QzNmZjZDM3MmQ3MTZjNTRkM2ViZiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJmOWI5ZGRjMDc2MWMxMjVkNTc4MGVhYjJkNjRiZTQ4NzNmYzY4MTdj
Mjg5OWNiY2IzNGIwMjM0NGJkYzdiYzU0IgogCiBERVBFTkRTICs9ICIgJHtQWVRIT05fUE59LWdp
dGRiIgogCi0tIAoyLjM5LjIKCg==

--===============9067111234201042312==--

