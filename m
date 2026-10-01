Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97820CA5FA5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 06:31:41 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5326.1790836300624696147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 23:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nEOdYKHR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AhqBD3vh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0f629577c-74cb8068-7a7a-4111-b885-94554486c63c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790836299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KNOhYRapiVDO16rEy8d2DrYjJ7Pz/SoFgL6ZGVql6rs=;
	b=nEOdYKHR1s8fAAamlKay119WVmeqgcW5bmOg9ziEvROOIiua6lsUGVmFuI4arofW
	TRmA2d0lB/eaKtYsRG5SJzEVvKW5PxVAXM+CexOAfWb0vV3MQY3gFU7gYZrQClAAPqF
	jn0KtIe9w35kv2/zetk5lm52N7Izc0WJQUHVYINg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790836299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KNOhYRapiVDO16rEy8d2DrYjJ7Pz/SoFgL6ZGVql6rs=;
	b=AhqBD3vhT08oOmY4S+UO3bqMJ3Eo1r9LtSanYaP+dxJFSnSeSLflV+i05ahQ9M45
	OwmUediNlkNHvUtyMenTjxogHah0bcak/hZ4Kstppk/Ne9krlIRV9neomVlNxZeKoyi
	XnqHGkoMsZVn6b6d3GuU1EpAnTihw7pIBByWEEu8=
Content-Type: multipart/mixed; boundary="===============1231352977033090186=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.2.0 SUCCEEDED
Message-ID: <010101a0f629577c-74cb8068-7a7a-4111-b885-94554486c63c-000000@us-west-2.amazonses.com>
Date: Thu, 1 Oct 2026 06:31:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 06:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247002

--===============1231352977033090186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-git* to *3.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.62-3.2.0.patch
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
From a8596a7b5fe4274a2079d7a135e3c28c6d0f976e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Oct 2026 05:19:56 +0000
Subject: [PATCH] python3-git: upgrade 3.1.62 -> 3.2.0

3.2.0
=====

Drops support for Python 3.7 (5 years after its EOL).
Security fixes for

If you can, also try and provide feedback on the upcoming v4 branch
 - patches welcome.

See the following for all changes.
https://github.com/gitpython-developers/GitPython/releases/tag/3.2.0
---
 .../python/{python3-git_3.1.62.bb => python3-git_3.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.62.bb => python3-git_3.2.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.62.bb b/meta/recipes-devtools/python/python3-git_3.2.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.62.bb
rename to meta/recipes-devtools/python/python3-git_3.2.0.bb
index ad912886bb..990507fb76 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.62.bb
+++ b/meta/recipes-devtools/python/python3-git_3.2.0.bb
@@ -14,7 +14,7 @@ CVE_PRODUCT = "gitpython_project:gitpython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1791de66309bc0c7cfca40bf8d2e3de7ca091cbf94e6051be1ad0722c61062af"
+SRC_URI[sha256sum] = "fb92310af6844d96adc95ca066ed2e617c00e1dbd146a326626c81e72e18cc2e"
 
 DEPENDS += " python3-gitdb"
 
-- 
2.47.1


--===============1231352977033090186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-git/python3-git: FILELIST: directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/licenses -> /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info -> /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-git (sysroot):
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info was added
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info was removed
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/licenses/AUTHORS was removed
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/WHEEL was removed

--===============1231352977033090186==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.62-3.2.0.patch"

RnJvbSBhODU5NmE3YjVmZTQyNzRhMjA3OWQ3YTEzNWUzYzI4YzZkMGY5NzZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBPY3QgMjAyNiAwNToxOTo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZ2l0OiB1cGdyYWRlIDMuMS42MiAtPiAzLjIuMAoKMy4yLjAKPT09PT0KCkRyb3BzIHN1
cHBvcnQgZm9yIFB5dGhvbiAzLjcgKDUgeWVhcnMgYWZ0ZXIgaXRzIEVPTCkuClNlY3VyaXR5IGZp
eGVzIGZvcgoKSWYgeW91IGNhbiwgYWxzbyB0cnkgYW5kIHByb3ZpZGUgZmVlZGJhY2sgb24gdGhl
IHVwY29taW5nIHY0IGJyYW5jaAogLSBwYXRjaGVzIHdlbGNvbWUuCgpTZWUgdGhlIGZvbGxvd2lu
ZyBmb3IgYWxsIGNoYW5nZXMuCmh0dHBzOi8vZ2l0aHViLmNvbS9naXRweXRob24tZGV2ZWxvcGVy
cy9HaXRQeXRob24vcmVsZWFzZXMvdGFnLzMuMi4wCi0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy1n
aXRfMy4xLjYyLmJiID0+IHB5dGhvbjMtZ2l0XzMuMi4wLmJifSAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1naXRfMy4xLjYyLmJiID0+IHB5dGhvbjMtZ2l0
XzMuMi4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1naXRfMy4xLjYyLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWdpdF8zLjIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS42Mi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjIuMC5iYgppbmRleCBh
ZDkxMjg4NmJiLi45OTA1MDdmYjc2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS42Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZ2l0XzMuMi4wLmJiCkBAIC0xNCw3ICsxNCw3IEBAIENWRV9QUk9EVUNU
ID0gImdpdHB5dGhvbl9wcm9qZWN0OmdpdHB5dGhvbiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9z
ZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE3OTFkZTY2MzA5
YmMwYzdjZmNhNDBiZjhkMmUzZGU3Y2EwOTFjYmY5NGU2MDUxYmUxYWQwNzIyYzYxMDYyYWYiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZmI5MjMxMGFmNjg0NGQ5NmFkYzk1Y2EwNjZlZDJlNjE3YzAw
ZTFkYmQxNDZhMzI2NjI2YzgxZTcyZTE4Y2MyZSIKIAogREVQRU5EUyArPSAiIHB5dGhvbjMtZ2l0
ZGIiCiAKLS0gCjIuNDcuMQoK

--===============1231352977033090186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/g/gitpython/gitpython-3.1.62.tar.gz" to "https://files.pythonhosted.org/packages/source/g/gitpython/gitpython-3.2.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-git: PKGV changed from 3.1.62 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-git: PV changed from "3.1.62" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.62 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.62" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.62 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.62" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.62 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.62" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.62 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.62" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.62 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-src: PV changed from "3.1.62" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.62 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.62" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-git/python3-git: PKGV changed from 3.1.62 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git: FILELIST: directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/licenses -> /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info -> /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info
packages/x86-64-v3-poky-linux/python3-git/python3-git: PKGSIZE changed from 1652294 to 1702769 (+3%)
packages/x86-64-v3-poky-linux/python3-git/python3-git: PV changed from "3.1.62" to "3.2.0"
Changes to packages/x86-64-v3-poky-linux/python3-git (sysroot):
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info was added
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/gitpython-3.2.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info was removed
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/licenses/AUTHORS was removed
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/WHEEL was removed

--===============1231352977033090186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-git-changelog.txt"

3.2.0
=====

Drops support for Python 3.7 (5 years after its EOL).
Security fixes for

If you can, also try and provide feedback on the upcoming v4 branch
 - patches welcome.

See the following for all changes.
https://github.com/gitpython-developers/GitPython/releases/tag/3.2.0

--===============1231352977033090186==--

