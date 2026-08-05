Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BC8C56205
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:47:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34044.1785908854472515113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uysPdwPg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wLc5RO5d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019fd0767b29-758e5ea2-453d-418b-9ca5-2bf004ef9068-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785908853;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=taClOvIU/ITHW+mihu5fFbuY0XyXTFXKTUQbWJSVsDk=;
	b=uysPdwPgWXkHayNIkIQHNpGnEXB1GMTQYb0Y6tGaMsxGGzm94Qo54iSMjNR8u/+X
	KgARghYVXxsbX0TyKAeqYDMFCWjGK9MB/hN0LYKcn9YGQRHjsI7SUiPwLwrhVmwBTn/
	oXk0s06356HNEM5a6AUUrDa11NN+AHbbkLqUuQ+k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785908853;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=taClOvIU/ITHW+mihu5fFbuY0XyXTFXKTUQbWJSVsDk=;
	b=wLc5RO5dJEq2hDipo1JYlYf/ivZ9VoYQyMHxJYLp09LZ5qT7vWlrMJWwBF/c4p6p
	jUl1Mfm691KUCILb4rOqRjUAu+s7MDvTPcbDPy0laauC13YfaQEdzJXGXk2epMGfojF
	eC2ozxfZsUZqb7DmzW5Usc4Y0YHDy/iPbSEB0CWI=
Content-Type: multipart/mixed; boundary="===============0787818017772578792=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.66 SUCCEEDED
Message-ID: <0101019fd0767b29-758e5ea2-453d-418b-9ca5-2bf004ef9068-000000@us-west-2.amazonses.com>
Date: Wed, 5 Aug 2026 05:47:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 05:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242815

--===============0787818017772578792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.66* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.65-2.66.patch
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
From dd9dcf54ce1da72ece86228e59b7bfea093e8136 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Aug 2026 05:47:27 +0000
Subject: [PATCH] repo: upgrade 2.65 -> 2.66

d9da609 project: preserve -c optimization when revision is a SHA-1
4bec297 command: Respect smart sync override declaratively by default
54fa31c project: derive HEAD fallback from git's own default branch
29b6630 project: make GetHead file-read fallback reftable-aware
0b82311 sync: allow syncing groups with repo sync -g group
06c4f9e git_superproject: don't filter rewritten manifest
dd11303 sync: Deprecate fetch-submodules flag names
eeba6f2 hooks: pass yes flag when available
1729aae project: Skip superproject upstream check for MetaProjects
978adb7 sync: Add CLI flag for globally disabling submodule fetch
0398c67 color: Replace anonymous sentinel with named class
3bb4871 rebase: Resolve revisionExpr to tracking branch for --onto-manifest
---
 meta/recipes-devtools/repo/{repo_2.65.bb => repo_2.66.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.65.bb => repo_2.66.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.65.bb b/meta/recipes-devtools/repo/repo_2.66.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.65.bb
rename to meta/recipes-devtools/repo/repo_2.66.bb
index 2a235b7ec5..e03cf7f019 100644
--- a/meta/recipes-devtools/repo/repo_2.65.bb
+++ b/meta/recipes-devtools/repo/repo_2.66.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "35bbf701d04de5c6a71937279bc3d16f6ce36808"
+SRCREV = "d9da609d8c120bb882a43196a4a6b7f183418304"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============0787818017772578792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repo-changelog.txt"

Changelog for repo: 2.65 -> 2.66

d9da609 project: preserve -c optimization when revision is a SHA-1
4bec297 command: Respect smart sync override declaratively by default
54fa31c project: derive HEAD fallback from git's own default branch
29b6630 project: make GetHead file-read fallback reftable-aware
0b82311 sync: allow syncing groups with repo sync -g group
06c4f9e git_superproject: don't filter rewritten manifest
dd11303 sync: Deprecate fetch-submodules flag names
eeba6f2 hooks: pass yes flag when available
1729aae project: Skip superproject upstream check for MetaProjects
978adb7 sync: Add CLI flag for globally disabling submodule fetch
0398c67 color: Replace anonymous sentinel with named class
3bb4871 rebase: Resolve revisionExpr to tracking branch for --onto-manifest

--===============0787818017772578792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: PV changed from "2.65" to "2.66"
packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.65" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.66"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.65 [default] to 2.66 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.65" to "2.66"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.65 [default] to 2.66 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.65" to "2.66"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.65 [default] to 2.66 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.65" to "2.66"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.65 [default] to 2.66 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.65" to "2.66"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.65 [default] to 2.66 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.65" to "2.66"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.65 [default] to 2.66 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.65" to "2.66"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.65 [default] to 2.66 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.65" to "2.66"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.65 [default] to 2.66 [default]

--===============0787818017772578792==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.65-2.66.patch"

RnJvbSBkZDlkY2Y1NGNlMWRhNzJlY2U4NjIyOGU1OWI3YmZlYTA5M2U4MTM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBBdWcgMjAyNiAwNTo0NzoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi42NSAtPiAyLjY2CgpkOWRhNjA5IHByb2plY3Q6IHByZXNlcnZlIC1jIG9w
dGltaXphdGlvbiB3aGVuIHJldmlzaW9uIGlzIGEgU0hBLTEKNGJlYzI5NyBjb21tYW5kOiBSZXNw
ZWN0IHNtYXJ0IHN5bmMgb3ZlcnJpZGUgZGVjbGFyYXRpdmVseSBieSBkZWZhdWx0CjU0ZmEzMWMg
cHJvamVjdDogZGVyaXZlIEhFQUQgZmFsbGJhY2sgZnJvbSBnaXQncyBvd24gZGVmYXVsdCBicmFu
Y2gKMjliNjYzMCBwcm9qZWN0OiBtYWtlIEdldEhlYWQgZmlsZS1yZWFkIGZhbGxiYWNrIHJlZnRh
YmxlLWF3YXJlCjBiODIzMTEgc3luYzogYWxsb3cgc3luY2luZyBncm91cHMgd2l0aCByZXBvIHN5
bmMgLWcgZ3JvdXAKMDZjNGY5ZSBnaXRfc3VwZXJwcm9qZWN0OiBkb24ndCBmaWx0ZXIgcmV3cml0
dGVuIG1hbmlmZXN0CmRkMTEzMDMgc3luYzogRGVwcmVjYXRlIGZldGNoLXN1Ym1vZHVsZXMgZmxh
ZyBuYW1lcwplZWJhNmYyIGhvb2tzOiBwYXNzIHllcyBmbGFnIHdoZW4gYXZhaWxhYmxlCjE3Mjlh
YWUgcHJvamVjdDogU2tpcCBzdXBlcnByb2plY3QgdXBzdHJlYW0gY2hlY2sgZm9yIE1ldGFQcm9q
ZWN0cwo5NzhhZGI3IHN5bmM6IEFkZCBDTEkgZmxhZyBmb3IgZ2xvYmFsbHkgZGlzYWJsaW5nIHN1
Ym1vZHVsZSBmZXRjaAowMzk4YzY3IGNvbG9yOiBSZXBsYWNlIGFub255bW91cyBzZW50aW5lbCB3
aXRoIG5hbWVkIGNsYXNzCjNiYjQ4NzEgcmViYXNlOiBSZXNvbHZlIHJldmlzaW9uRXhwciB0byB0
cmFja2luZyBicmFuY2ggZm9yIC0tb250by1tYW5pZmVzdAotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9yZXBvL3tyZXBvXzIuNjUuYmIgPT4gcmVwb18yLjY2LmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9yZXBvL3tyZXBvXzIuNjUuYmIgPT4gcmVwb18yLjY2LmJifSAoOTQlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42NS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42Ni5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjUuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42Ni5iYgppbmRleCAyYTIzNWI3
ZWM1Li5lMDNjZjdmMDE5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9y
ZXBvXzIuNjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjY2LmJi
CkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDovL2dl
cnJpdC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9
bWFpbjt0YWc9diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjM1YmJmNzAxZDA0ZGU1
YzZhNzE5MzcyNzliYzNkMTZmNmNlMzY4MDgiCitTUkNSRVYgPSAiZDlkYTYwOWQ4YzEyMGJiODgy
YTQzMTk2YTRhNmI3ZjE4MzQxODMwNCIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2ds
ZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmll
dy9naXQtcmVwby5naXQiCiAKLS0gCjIuNDcuMQoK

--===============0787818017772578792==--

