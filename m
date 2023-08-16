Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13557C3063F
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.173800.1692224343876250445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VJh7VnC+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=K7MzYcHC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a006e4f18-4c351246-b196-485b-a160-ef497db478a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224344;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=FfHVE973lO1VEsl4mZePkT+f7LkMSxgEnU6xA658eUU=;
	b=VJh7VnC+4dOZL5pznE9Jn51gcF8wRcrFcFB5J8Dr1XFTmDz7+aQLFg7Ii5J77a2v
	gmzPYZRuStc3UfJkenU4U6CESykFck3n5hg5Bljbgipgv3/obieiYC2TV2cuLKnWGNP
	E6sYZ0KWGzbIOwR0pK+qKx0+r2G1v+vklakDvUrw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224344;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=FfHVE973lO1VEsl4mZePkT+f7LkMSxgEnU6xA658eUU=;
	b=K7MzYcHCiypbZaGvPvMIma1wT5Hskta3M4Jte1c3ZlHhOOwy4rNX0HwSKTqAQgLT
	K8yDWNA7UcZBT2nZA83yw5Gdi1lw27FXyqyFqZWh5eDFbsvrmPegwnnGEbK+V2cY0WZ
	er8oqT6ut/kWgNEb9i1GhSbjfs9tMqXO4xiKlcjM=
Content-Type: multipart/mixed; boundary="===============1043454300352497109=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.29.1 SUCCEEDED
Message-ID: <0101018a006e4f18-4c351246-b196-485b-a160-ef497db478a9-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186178

--===============1043454300352497109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dbusmock* to *0.29.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.29.0-0.29.1.patch
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
From 10d54369d252ace6262241b5556b56c217901002 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 04:57:50 +0000
Subject: [PATCH] python3-dbusmock: upgrade 0.29.0 -> 0.29.1

---
 .../{python3-dbusmock_0.29.0.bb => python3-dbusmock_0.29.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.29.0.bb => python3-dbusmock_0.29.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.29.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.29.1.bb
index 64e0ae8811..09bae0e19f 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.29.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "3efdb3d800386b65e8854d8ee4538764241382b4e664423ad7d959c9008dd408"
+SRC_URI[sha256sum] = "b03590057c236d352c38973f4b71ae2c97b3a1cb1dc6f03278ce4072a3716a74"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.39.2


--===============1043454300352497109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dbusmock: PKGV changed from 0.29.0 [default] to 0.29.1 [default]
packages/core2-32-poky-linux/python3-dbusmock: PV changed from "0.29.0" to "0.29.1"
packages/core2-32-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.29.0.tar.gz;downloadfilename=python-dbusmock-0.29.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.29.1.tar.gz;downloadfilename=python-dbusmock-0.29.1.tar.gz"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.29.0 [default] to 0.29.1 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.29.0" to "0.29.1"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.29.0 [default] to 0.29.1 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.29.0" to "0.29.1"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.29.0 [default] to 0.29.1 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.29.0" to "0.29.1"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.29.0 [default] to 0.29.1 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.29.0" to "0.29.1"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.29.0 [default] to 0.29.1 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.29.0" to "0.29.1"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.29.0 [default] to 0.29.1 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.29.0" to "0.29.1"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 457628 to 458081 (+0%)
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.29.0 [default] to 0.29.1 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.29.0" to "0.29.1"
Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.11/site-packages/python_dbusmock-0.29.0.dist-info moved to /usr/lib/python3.11/site-packages/python_dbusmock-0.29.1.dist-info

--===============1043454300352497109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.11/site-packages/python_dbusmock-0.29.0.dist-info moved to /usr/lib/python3.11/site-packages/python_dbusmock-0.29.1.dist-info

--===============1043454300352497109==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.29.0-0.29.1.patch"

RnJvbSAxMGQ1NDM2OWQyNTJhY2U2MjYyMjQxYjU1NTZiNTZjMjE3OTAxMDAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDQ6NTc6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWRidXNtb2NrOiB1cGdyYWRlIDAuMjkuMCAtPiAwLjI5LjEKCi0tLQogLi4uL3tweXRo
b24zLWRidXNtb2NrXzAuMjkuMC5iYiA9PiBweXRob24zLWRidXNtb2NrXzAuMjkuMS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kYnVzbW9ja18wLjI5LjAu
YmIgPT4gcHl0aG9uMy1kYnVzbW9ja18wLjI5LjEuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMjkuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kYnVzbW9ja18wLjI5LjEuYmIKc2lt
aWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWRidXNtb2NrXzAuMjkuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMjkuMS5iYgppbmRleCA2NGUwYWU4ODExLi4w
OWJhZTBlMTlmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZGJ1c21vY2tfMC4yOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kYnVzbW9ja18wLjI5LjEuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9weXRob24tZGJ1c21vY2svIgogTElDRU5TRSA9ICJHUEwt
My4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lNmE2MDBm
ZDVlMWQ5Y2JkZTJkOTgzNjgwMjMzYWQwMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNlZmRi
M2Q4MDAzODZiNjVlODg1NGQ4ZWU0NTM4NzY0MjQxMzgyYjRlNjY0NDIzYWQ3ZDk1OWM5MDA4ZGQ0
MDgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjAzNTkwMDU3YzIzNmQzNTJjMzg5NzNmNGI3MWFl
MmM5N2IzYTFjYjFkYzZmMDMyNzhjZTQwNzJhMzcxNmE3NCIKIAogUFlQSV9QQUNLQUdFID0gInB5
dGhvbi1kYnVzbW9jayIKIAotLSAKMi4zOS4yCgo=

--===============1043454300352497109==--

