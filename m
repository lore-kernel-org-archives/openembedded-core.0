Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834ABE9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1391.1771440099913837195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0AsbAVp1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sATCkznt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c720ee68b-95243140-644b-462f-8dd3-df2ef0d5f97b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440105;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UhVTI5F77MX4y3M0Xyqfi/Ff74X1vcCXTh+RtGi2t/A=;
	b=0AsbAVp1zAvko65x6vDUZV/98ERlTfx37krThKhXoTzxTVipdp6MA4g9Zv/luIcn
	QymCHRyA3pPiX+2EB5dPBDe8SIOUM5ailFWbupB9VjfmuHKxObIAOr5XFdgszJbnqW7
	jrXgzM2MoS9obN++JvkvIpKSa8CIq89R4UPof+3Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440105;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UhVTI5F77MX4y3M0Xyqfi/Ff74X1vcCXTh+RtGi2t/A=;
	b=sATCkzntDTClIsygrpvvWV0AdNnfoC9DoCNgO0BMEtec0kO2AsQ17zTC4TpY+WtS
	WKJwVTIVksaFu9qLYmh+/SD+Ldezn/9gZaehAe45b+he2Sdu7lwq0xmPUfI9MBbxk+i
	qx1bbYvZ1XW6x+C++VEL5mzljwVqFqNm1Lg/UVVk=
Content-Type: multipart/mixed; boundary="===============8437377986322724280=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.6.0 SUCCEEDED
Message-ID: <0101019c720ee68b-95243140-644b-462f-8dd3-df2ef0d5f97b-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231363

--===============8437377986322724280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.5.3-0.6.0.patch
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
From fffeee7126e4b0eab558fd1865fa7837b3711cc3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 14:10:19 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.5.3 -> 0.6.0

---
 .../{python3-wcwidth_0.5.3.bb => python3-wcwidth_0.6.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.5.3.bb => python3-wcwidth_0.6.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb b/meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb
index 8dd0584dcd..874b30b7dd 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "53123b7af053c74e9fe2e92ac810301f6139e64379031f7124574212fb3b4091"
+SRC_URI[sha256sum] = "cdc4e4262d6ef9a1a57e018384cbeb1208d8abbc64176027e2c2455c81313159"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.1


--===============8437377986322724280==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.5.3-0.6.0.patch"

RnJvbSBmZmZlZWU3MTI2ZTRiMGVhYjU1OGZkMTg2NWZhNzgzN2IzNzExY2MzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTQ6MTA6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdjd2lkdGg6IHVwZ3JhZGUgMC41LjMgLT4gMC42LjAKCi0tLQogLi4uL3tweXRob24z
LXdjd2lkdGhfMC41LjMuYmIgPT4gcHl0aG9uMy13Y3dpZHRoXzAuNi4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13Y3dpZHRoXzAuNS4zLmJiID0+
IHB5dGhvbjMtd2N3aWR0aF8wLjYuMC5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjUuMy5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuNi4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13
Y3dpZHRoXzAuNS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2N3aWR0aF8wLjYuMC5iYgppbmRleCA4ZGQwNTg0ZGNkLi44NzRiMzBiN2RkIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjUu
My5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8w
LjYuMC5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2px
dWFzdC93Y3dpZHRoIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT1iMTU5NzljMzlhMjU0Mzg5MmZjYThjZDg2YjRiNTJjYiIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjUzMTIzYjdhZjA1M2M3NGU5ZmUyZTkyYWM4MTAzMDFmNjEzOWU2NDM3
OTAzMWY3MTI0NTc0MjEyZmIzYjQwOTEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2RjNGU0MjYy
ZDZlZjlhMWE1N2UwMTgzODRjYmViMTIwOGQ4YWJiYzY0MTc2MDI3ZTJjMjQ1NWM4MTMxMzE1OSIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0t
IAoyLjQ3LjEKCg==

--===============8437377986322724280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.5.3.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.5.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.5.3.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/WHEEL was removed

--===============8437377986322724280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.5.3" to "0.6.0"
packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.5.3 [default] to 0.6.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.5.3.tar.gz;downloadfilename=wcwidth-0.5.3.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.6.0.tar.gz;downloadfilename=wcwidth-0.6.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.5.3" to "0.6.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.5.3 [default] to 0.6.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.5.3" to "0.6.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.5.3 [default] to 0.6.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.5.3" to "0.6.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.5.3 [default] to 0.6.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.5.3" to "0.6.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.5.3 [default] to 0.6.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.5.3" to "0.6.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 115396 to 118993 (+3%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.5.3 [default] to 0.6.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.5.3" to "0.6.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.5.3 [default] to 0.6.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.5.3" to "0.6.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.5.3 [default] to 0.6.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.5.3" to "0.6.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 472795 to 483083 (+2%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.5.3 [default] to 0.6.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.5.3.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.5.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.5.3.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/WHEEL was removed

--===============8437377986322724280==--

