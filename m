Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39D8D172BE
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:56 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29192.1769951570363277194
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uOHvQf8s;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KxGuP5QB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019c1955a6c8-a158375d-a8ca-46a5-b920-d4cf74226b38-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NZH1gOlr4WCZDdyIqTkKaSvrcvqq7WtMw3epApY0/TA=;
	b=uOHvQf8sXhL0NbEqUUiF11N0WBtTySR6HlX2QuYLPRu/v2vgE4Iw0bb6cqTfuDwM
	LBxgWxtmGZNAz6pGigZEyRrDKr74+UybRkFcKZuJnjj7gPy1BalUc+ZJizlYS31Mcz4
	hykvNW3sfygWDVjE5PJofevUCKyjH98+qmiV91hU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NZH1gOlr4WCZDdyIqTkKaSvrcvqq7WtMw3epApY0/TA=;
	b=KxGuP5QBOed2lriXTusDeCJxqjwgHbFCFwfS/rSc0221+DvvUk3WRJu/c4x1f0WV
	m1dI5J5y9N+YBzTgIlo6Tovl5MmHVbuJewSBVBMkeRMbGb4Yr6n5s210KmWvq1K0lkD
	lRzHfHaAp9Aepbt54LrM631L6a5K/ZZhKixetjts=
Content-Type: multipart/mixed; boundary="===============5054767757786404851=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pathspec: upgrading to 1.0.4 SUCCEEDED
Message-ID: <0101019c1955a6c8-a158375d-a8ca-46a5-b920-d4cf74226b38-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230283

--===============5054767757786404851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pathspec* to *1.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pathspec-upgrade-1.0.3-1.0.4.patch
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
From 94b960b468e6532a83ea976b2176bcd5e067dde1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 08:41:15 +0000
Subject: [PATCH] python3-pathspec: upgrade 1.0.3 -> 1.0.4

---
 .../{python3-pathspec_1.0.3.bb => python3-pathspec_1.0.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_1.0.3.bb => python3-pathspec_1.0.4.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_1.0.3.bb b/meta/recipes-devtools/python/python3-pathspec_1.0.4.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
rename to meta/recipes-devtools/python/python3-pathspec_1.0.4.bb
index 58651bced2..bcdc04dfb0 100644
--- a/meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_1.0.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "bac5cf97ae2c2876e2d25ebb15078eb04d76e4b98921ee31c6f85ade8b59444d"
+SRC_URI[sha256sum] = "0210e2ae8a21a9137c0d470578cb0e595af87edaa6ebf12ff176f14a02e0e645"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============5054767757786404851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pathspec-1.0.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/pathspec-1.0.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pathspec-1.0.3.dist-info -> /usr/lib/python3.14/site-packages/pathspec-1.0.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.14/site-packages/pathspec-1.0.3.dist-info moved to /usr/lib/python3.14/site-packages/pathspec-1.0.4.dist-info

--===============5054767757786404851==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pathspec-upgrade-1.0.3-1.0.4.patch"

RnJvbSA5NGI5NjBiNDY4ZTY1MzJhODNlYTk3NmIyMTc2YmNkNWUwNjdkZGUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwODo0MToxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGF0aHNwZWM6IHVwZ3JhZGUgMS4wLjMgLT4gMS4wLjQKCi0tLQogLi4uL3tweXRob24z
LXBhdGhzcGVjXzEuMC4zLmJiID0+IHB5dGhvbjMtcGF0aHNwZWNfMS4wLjQuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYXRoc3BlY18xLjAuMy5iYiA9
PiBweXRob24zLXBhdGhzcGVjXzEuMC40LmJifSAoODAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYXRoc3BlY18xLjAuMy5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYXRoc3BlY18xLjAuNC5iYgpzaW1pbGFyaXR5
IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGF0aHNwZWNfMS4wLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wYXRoc3BlY18xLjAuNC5iYgppbmRleCA1ODY1MWJjZWQyLi5iY2RjMDRkZmIw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGF0aHNw
ZWNfMS4wLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBh
dGhzcGVjXzEuMC40LmJiCkBAIC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIK
IExJQ0VOU0UgPSAiTVBMLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTgxNWNhNTk5YzlkZjI0N2EwYzdmNjE5YmFiMTIzZGFkIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYmFjNWNmOTdhZTJjMjg3NmUyZDI1ZWJiMTUwNzhlYjA0ZDc2ZTRiOTg5MjFlZTMxYzZm
ODVhZGU4YjU5NDQ0ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMjEwZTJhZThhMjFhOTEzN2Mw
ZDQ3MDU3OGNiMGU1OTVhZjg3ZWRhYTZlYmYxMmZmMTc2ZjE0YTAyZTBlNjQ1IgogCiBpbmhlcml0
IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQogCi0tIAoyLjQ3LjEKCg==

--===============5054767757786404851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pathspec: PV changed from "1.0.3" to "1.0.4"
packages/x86-64-v3-poky-linux/python3-pathspec: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-1.0.3.tar.gz;downloadfilename=pathspec-1.0.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-1.0.4.tar.gz;downloadfilename=pathspec-1.0.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-pathspec: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-dbg: PV changed from "1.0.3" to "1.0.4"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-dbg: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-dev: PV changed from "1.0.3" to "1.0.4"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-dev: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-doc: PV changed from "1.0.3" to "1.0.4"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-doc: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-locale: PV changed from "1.0.3" to "1.0.4"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-locale: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-src: PV changed from "1.0.3" to "1.0.4"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-src: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-staticdev: PV changed from "1.0.3" to "1.0.4"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-staticdev: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: PV changed from "1.0.3" to "1.0.4"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: PKGSIZE changed from 306207 to 306953 (+0%)
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pathspec-1.0.3.dist-info -> /usr/lib/python3.14/site-packages/pathspec-1.0.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/pathspec-1.0.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/pathspec-1.0.4.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.14/site-packages/pathspec-1.0.3.dist-info moved to /usr/lib/python3.14/site-packages/pathspec-1.0.4.dist-info

--===============5054767757786404851==--

