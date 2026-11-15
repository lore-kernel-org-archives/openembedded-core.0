Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2968.1794721856172191744
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 21:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oer0wH7h;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VwPDRKXj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1ddc2367d-50c00ba5-d8f5-45ff-af01-99b3f69506f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794721855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1f3PkG14ZDBxc3QSOaU917ttECb+ceQcdvCSpF/wcUs=;
	b=oer0wH7hI98IQx3+Gw+vT8lZb9412Xt+DQZdBl+7WWczlSjibU48IIX9DJ+NjbV5
	ishQkaqm7wtF25GZD9MoDC0zC+QZW887pI1B1C3mgROZYXNx2JCzPnrkfUSSlWpqELT
	gqTpTlm4M9gfFcYyEvUyS5DYvcO3bh0BE2kwcKj0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794721855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1f3PkG14ZDBxc3QSOaU917ttECb+ceQcdvCSpF/wcUs=;
	b=VwPDRKXjAzhirgxefuFd6RJZ8PnI+bPaPVU4lKXgHCjnVbJR+x+cFyhE0M25MdmZ
	8s3s16NysjT7PAbHBzRAUDnPswNl/J73XuaAt+Dd8J9qLw/gIbDay1vgmmh3Wc3FRxQ
	HELhVbSxFVtZzup6V+ROqlSWEKUMxU5dSBuZKCvA=
Content-Type: multipart/mixed; boundary="===============6687660961800949459=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.2.1 SUCCEEDED
Message-ID: <010101a1ddc2367d-50c00ba5-d8f5-45ff-af01-99b3f69506f6-000000@us-west-2.amazonses.com>
Date: Sun, 15 Nov 2026 05:50:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 05:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250226

--===============6687660961800949459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-git* to *3.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.2.0-3.2.1.patch
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
From 2638aeed71025c3b8a5641012b47f22510ecf758 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Nov 2026 05:26:37 +0000
Subject: [PATCH] python3-git: upgrade 3.2.0 -> 3.2.1

3.2.1
=====

Security fixes for

If you can, also try and provide feedback on the upcoming v4 branch
 - patches welcome.

See the following for all changes.
https://github.com/gitpython-developers/GitPython/releases/tag/3.2.1

 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
---
 .../python/{python3-git_3.2.0.bb => python3-git_3.2.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.2.0.bb => python3-git_3.2.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.2.0.bb b/meta/recipes-devtools/python/python3-git_3.2.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.2.0.bb
rename to meta/recipes-devtools/python/python3-git_3.2.1.bb
index 990507fb76..cfa5f2b57a 100644
--- a/meta/recipes-devtools/python/python3-git_3.2.0.bb
+++ b/meta/recipes-devtools/python/python3-git_3.2.1.bb
@@ -14,7 +14,7 @@ CVE_PRODUCT = "gitpython_project:gitpython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "fb92310af6844d96adc95ca066ed2e617c00e1dbd146a326626c81e72e18cc2e"
+SRC_URI[sha256sum] = "0f1229ec5c057bdabdeeda8bda4f17bda679ab33dbccc00f24e6a480553c8613"
 
 DEPENDS += " python3-gitdb"
 
-- 
2.47.1


--===============6687660961800949459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-git: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-git: PV changed from "3.2.0" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/g/gitpython/gitpython-3.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/g/gitpython/gitpython-3.2.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-dbg: PV changed from "3.2.0" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-dev: PV changed from "3.2.0" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-doc: PV changed from "3.2.0" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-locale: PV changed from "3.2.0" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-git/python3-git-src: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-src: PV changed from "3.2.0" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.2.0" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-git/python3-git: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git: PKGSIZE changed from 1702769 to 1723828 (+1%)
packages/x86-64-v3-poky-linux/python3-git/python3-git: FILELIST: directory renamed /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info -> /usr/lib/python3.14/site-packages/gitpython-3.2.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/gitpython-3.2.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-git/python3-git: PV changed from "3.2.0" to "3.2.1"
Changes to packages/x86-64-v3-poky-linux/python3-git (sysroot):
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info moved to /usr/lib/python3.14/site-packages/gitpython-3.2.1.dist-info

--===============6687660961800949459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-git/python3-git: FILELIST: directory renamed /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info -> /usr/lib/python3.14/site-packages/gitpython-3.2.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/gitpython-3.2.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-git (sysroot):
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info moved to /usr/lib/python3.14/site-packages/gitpython-3.2.1.dist-info

--===============6687660961800949459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-git-changelog.txt"

3.2.1
=====

Security fixes for

If you can, also try and provide feedback on the upcoming v4 branch
 - patches welcome.

See the following for all changes.
https://github.com/gitpython-developers/GitPython/releases/tag/3.2.1

 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.
 - patches welcome.

--===============6687660961800949459==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.2.0-3.2.1.patch"

RnJvbSAyNjM4YWVlZDcxMDI1YzNiOGE1NjQxMDEyYjQ3ZjIyNTEwZWNmNzU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTm92IDIwMjYgMDU6MjY6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWdpdDogdXBncmFkZSAzLjIuMCAtPiAzLjIuMQoKMy4yLjEKPT09PT0KClNlY3VyaXR5
IGZpeGVzIGZvcgoKSWYgeW91IGNhbiwgYWxzbyB0cnkgYW5kIHByb3ZpZGUgZmVlZGJhY2sgb24g
dGhlIHVwY29taW5nIHY0IGJyYW5jaAogLSBwYXRjaGVzIHdlbGNvbWUuCgpTZWUgdGhlIGZvbGxv
d2luZyBmb3IgYWxsIGNoYW5nZXMuCmh0dHBzOi8vZ2l0aHViLmNvbS9naXRweXRob24tZGV2ZWxv
cGVycy9HaXRQeXRob24vcmVsZWFzZXMvdGFnLzMuMi4xCgogLSBwYXRjaGVzIHdlbGNvbWUuCiAt
IHBhdGNoZXMgd2VsY29tZS4KIC0gcGF0Y2hlcyB3ZWxjb21lLgogLSBwYXRjaGVzIHdlbGNvbWUu
CiAtIHBhdGNoZXMgd2VsY29tZS4KIC0gcGF0Y2hlcyB3ZWxjb21lLgogLSBwYXRjaGVzIHdlbGNv
bWUuCiAtIHBhdGNoZXMgd2VsY29tZS4KIC0gcGF0Y2hlcyB3ZWxjb21lLgogLSBwYXRjaGVzIHdl
bGNvbWUuCiAtIHBhdGNoZXMgd2VsY29tZS4KLS0tCiAuLi4vcHl0aG9uL3tweXRob24zLWdpdF8z
LjIuMC5iYiA9PiBweXRob24zLWdpdF8zLjIuMS5iYn0gICAgICAgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWdpdF8zLjIuMC5iYiA9PiBweXRob24zLWdpdF8zLjIu
MS5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZ2l0XzMuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWdpdF8zLjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMi4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMi4xLmJiCmluZGV4IDk5MDUwN2Zi
NzYuLmNmYTVmMmI1N2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1naXRfMy4yLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWdpdF8zLjIuMS5iYgpAQCAtMTQsNyArMTQsNyBAQCBDVkVfUFJPRFVDVCA9ICJnaXRw
eXRob25fcHJvamVjdDpnaXRweXRob24iCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29s
c19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmYjkyMzEwYWY2ODQ0ZDk2YWRj
OTVjYTA2NmVkMmU2MTdjMDBlMWRiZDE0NmEzMjY2MjZjODFlNzJlMThjYzJlIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjBmMTIyOWVjNWMwNTdiZGFiZGVlZGE4YmRhNGYxN2JkYTY3OWFiMzNkYmNj
YzAwZjI0ZTZhNDgwNTUzYzg2MTMiCiAKIERFUEVORFMgKz0gIiBweXRob24zLWdpdGRiIgogCi0t
IAoyLjQ3LjEKCg==

--===============6687660961800949459==--
