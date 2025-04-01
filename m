Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD68C369A3
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.18081.1743511399894797969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KrFcOEvK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fWUbPAzg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010195f160ab6b-fe098d20-fc4c-496c-82e1-184039518ea4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bHpZOJRl6LAmYxnL872XKp8SRVeu/AP25D2AZAZ5eg4=;
	b=KrFcOEvKD9YSEc3wZPDAMeBVi4m+0ZJNayjqd93CWCHT0/wxYIbk4ugOPO3KxcBW
	vZrmrAtjTMicD+H9umnJvDNzpx0QG+hy5qXRY9/pwcUuVzj+1sPf6YkBfGABk4N9diu
	tAzdxppqAy5HnAcI8nfJO1/nvH/leRnpKay6jeNY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bHpZOJRl6LAmYxnL872XKp8SRVeu/AP25D2AZAZ5eg4=;
	b=fWUbPAzgkOFjAx1Szbm3KlelQ/wcNbPh26Y/9vEYY4yq5Ib4Y1aAmXaxT9EGTKdQ
	fS97nP+j09bzN4mVH3yPUS9MX6bCTsAYCncpWefgCDmBvynw+iKZI1dJpLPRERLFINX
	qWUTEop1Xg4RmQIxM+aStPvK92RzdmTDi38zNJ/c=
Content-Type: multipart/mixed; boundary="===============8102073854959961746=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 8.2.1 SUCCEEDED
Message-ID: <01010195f160ab6b-fe098d20-fc4c-496c-82e1-184039518ea4-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214068

--===============8102073854959961746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *8.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-8.2.0-8.2.1.patch
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
From 1d8d74f94a3501b8a21342d1fad4c8e8de4c1b81 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 09:25:10 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 8.2.0 -> 8.2.1

---
 ...-setuptools-scm_8.2.0.bb => python3-setuptools-scm_8.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_8.2.0.bb => python3-setuptools-scm_8.2.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.2.0.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-scm_8.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb
index ecb79afe47..e35ef7c25e 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "a18396a1bc0219c974d1a74612b11f9dce0d5bd8b1dc55c65f6ac7fd609e8c28"
+SRC_URI[sha256sum] = "51cfdd1deefc9b8c08d1a61e940a59c4dec39eb6c285d33fa2f1b4be26c7874d"
 
 PYPI_PACKAGE = "setuptools_scm"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============8102073854959961746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.2.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-8.2.1.dist-info
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.2.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-8.2.1.dist-info

--===============8102073854959961746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools-scm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-8.2.0.tar.gz;downloadfilename=setuptools_scm-8.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-8.2.1.tar.gz;downloadfilename=setuptools_scm-8.2.1.tar.gz"
packages/core2-64-poky-linux/python3-setuptools-scm: PV changed from "8.2.0" to "8.2.1"
packages/core2-64-poky-linux/python3-setuptools-scm: PKGV changed from 8.2.0 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PV changed from "8.2.0" to "8.2.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PKGV changed from 8.2.0 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PV changed from "8.2.0" to "8.2.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PKGV changed from 8.2.0 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PV changed from "8.2.0" to "8.2.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PKGV changed from 8.2.0 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PV changed from "8.2.0" to "8.2.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PKGV changed from 8.2.0 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PV changed from "8.2.0" to "8.2.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PKGV changed from 8.2.0 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PV changed from "8.2.0" to "8.2.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PKGV changed from 8.2.0 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PV changed from "8.2.0" to "8.2.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 245707 to 246422 (+0%)
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGV changed from 8.2.0 [default] to 8.2.1 [default]
Changes to packages/core2-64-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.2.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-8.2.1.dist-info
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.2.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-8.2.1.dist-info

--===============8102073854959961746==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-8.2.0-8.2.1.patch"

RnJvbSAxZDhkNzRmOTRhMzUwMWI4YTIxMzQyZDFmYWQ0YzhlOGRlNGMxYjgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwOToyNToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1zY206IHVwZ3JhZGUgOC4yLjAgLT4gOC4yLjEKCi0tLQogLi4uLXNl
dHVwdG9vbHMtc2NtXzguMi4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1zY21fOC4yLjEuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zZXR1cHRvb2xzLXNj
bV84LjIuMC5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtc2NtXzguMi4xLmJifSAoOTAlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV84LjIuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLXNjbV84LjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21fOC4yLjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV84LjIuMS5iYgppbmRleCBlY2I3OWFmZTQ3Li5lMzVlZjdjMjVlIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21fOC4yLjAu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMt
c2NtXzguMi4xLmJiCkBAIC02LDcgKzYsNyBAQCBhcmd1bWVudCBvciBpbiBhIFNDTSBtYW5hZ2Vk
IGZpbGUuIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT04MzhjMzY2ZjY5YjcyYzVkZjA1Yzk2ZGZmNzliMzVmMiIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImExODM5NmExYmMwMjE5Yzk3NGQxYTc0NjEyYjExZjlkY2UwZDViZDhiMWRjNTVj
NjVmNmFjN2ZkNjA5ZThjMjgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTFjZmRkMWRlZWZjOWI4
YzA4ZDFhNjFlOTQwYTU5YzRkZWMzOWViNmMyODVkMzNmYTJmMWI0YmUyNmM3ODc0ZCIKIAogUFlQ
SV9QQUNLQUdFID0gInNldHVwdG9vbHNfc2NtIgogVVBTVFJFQU1fQ0hFQ0tfUFlQSV9QQUNLQUdF
ID0gIiR7UFlQSV9QQUNLQUdFfSIKLS0gCjIuNDcuMQoK

--===============8102073854959961746==--

