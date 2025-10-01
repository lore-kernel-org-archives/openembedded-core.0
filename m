Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68EBCCD198
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:23 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.18084.1759325542594473931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2iVFe0A1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=V1uie/AM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101999ff956b7-bdc00aa9-c59d-4f21-9f77-139d501d9abf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rcjKq+oOiOdU+xIeqJkYBfZMjsnJ5S508Tno9pgTQAI=;
	b=2iVFe0A1MN4Kk2m+LQ2ew+bV/0NYAq4qPRyTM6Te19mUaThoaceqqswxwQoACsXO
	Je2zB4GdyswlaOD1GQqvP8gZ2n4I8f7LmZtFTODiZvJqnIPvf66z+tosRqHzZOxeMRb
	5ZhIB3sH0bXiiHGb9h7RdD2UF0PNcAbMdLyvyawo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rcjKq+oOiOdU+xIeqJkYBfZMjsnJ5S508Tno9pgTQAI=;
	b=V1uie/AMS/zr2UsnDY52cureMlnGyPOs+04KiRY1L3vOzMH+JHdjgPDvnOS3z3Vi
	ad7CjmWL76mR3RvK/s2ajrqIjv365FCTONlBXKS2b8voCO/8ZKo0C+rLo4q0z1SiII8
	HOtStfYVEV6k83jpHDugDTcqw/H3kXzWIeF4ddHo=
Content-Type: multipart/mixed; boundary="===============5181057973160362649=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyyaml: upgrading to 6.0.3 SUCCEEDED
Message-ID: <010101999ff956b7-bdc00aa9-c59d-4f21-9f77-139d501d9abf-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224245

--===============5181057973160362649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyyaml* to *6.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyyaml-upgrade-6.0.2-6.0.3.patch
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
From 5a46c6c88a7bb54091d09286418d90a1cfa0a82c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 09:27:31 +0000
Subject: [PATCH] python3-pyyaml: upgrade 6.0.2 -> 6.0.3

---
 .../python/{python3-pyyaml_6.0.2.bb => python3-pyyaml_6.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyyaml_6.0.2.bb => python3-pyyaml_6.0.3.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
rename to meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
index 7ebe3f7d9f..7e2b088ca5 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pyyaml.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
 
-SRC_URI[sha256sum] = "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
+SRC_URI[sha256sum] = "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
 
 SRC_URI += "\
     https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca571220c966bbfe2ac43c335/tests/test_dump_load.py;name=test \
-- 
2.47.1


--===============5181057973160362649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyyaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyyaml/pyyaml-6.0.2.tar.gz;downloadfilename=pyyaml-6.0.2.tar.gz https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca571220c966bbfe2ac43c335/tests/test_dump_load.py;name=test" to "https://files.pythonhosted.org/packages/source/p/pyyaml/pyyaml-6.0.3.tar.gz;downloadfilename=pyyaml-6.0.3.tar.gz https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca571220c966bbfe2ac43c335/tests/test_dump_load.py;name=test"
packages/x86-64-v3-poky-linux/python3-pyyaml: PKGV changed from 6.0.2 [default] to 6.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml: PV changed from "6.0.2" to "6.0.3"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-dbg: PKGV changed from 6.0.2 [default] to 6.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-dbg: PV changed from "6.0.2" to "6.0.3"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-dev: PKGV changed from 6.0.2 [default] to 6.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-dev: PV changed from "6.0.2" to "6.0.3"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-doc: PKGV changed from 6.0.2 [default] to 6.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-doc: PV changed from "6.0.2" to "6.0.3"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-locale: PKGV changed from 6.0.2 [default] to 6.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-locale: PV changed from "6.0.2" to "6.0.3"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-ptest: PKGV changed from 6.0.2 [default] to 6.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-ptest: PV changed from "6.0.2" to "6.0.3"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-src: PKGV changed from 6.0.2 [default] to 6.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-src: PKGSIZE changed from 1382893 to 1382967 (+0%)
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-src: PV changed from "6.0.2" to "6.0.3"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-staticdev: PKGV changed from 6.0.2 [default] to 6.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-staticdev: PV changed from "6.0.2" to "6.0.3"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml: PKGV changed from 6.0.2 [default] to 6.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml: PKGSIZE changed from 749955 to 750006 (+0%)
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml: PV changed from "6.0.2" to "6.0.3"
Changes to packages/x86-64-v3-poky-linux/python3-pyyaml (sysroot):
  /usr/lib/python3.13/site-packages/pyyaml-6.0.2.dist-info moved to /usr/lib/python3.13/site-packages/pyyaml-6.0.3.dist-info

--===============5181057973160362649==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyyaml-upgrade-6.0.2-6.0.3.patch"

RnJvbSA1YTQ2YzZjODhhN2JiNTQwOTFkMDkyODY0MThkOTBhMWNmYTBhODJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwOToyNzozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl5YW1sOiB1cGdyYWRlIDYuMC4yIC0+IDYuMC4zCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHl5YW1sXzYuMC4yLmJiID0+IHB5dGhvbjMtcHl5YW1sXzYuMC4zLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl5YW1sXzYuMC4yLmJiID0+IHB5
dGhvbjMtcHl5YW1sXzYuMC4zLmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weXlhbWxfNi4wLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl5YW1sXzYuMC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggODgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXlhbWxf
Ni4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eXlhbWxfNi4wLjMuYmIKaW5kZXggN2ViZTNmN2Q5Zi4uN2UyYjA4OGNhNSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5eWFtbF82LjAuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl5YW1sXzYuMC4zLmJiCkBA
IC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5eWFtbC5vcmcvIgogTElDRU5TRSA9
ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT02ZDgyNDI2NjBh
ODM3MWFkZDVmZTU0N2FkZjA4MzA3OSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ1ODRkOWVj
OTFhZDY1ODYxY2MwOGQ0MmU4MzQzMjRlZjg5MGEwODJlNTkxMDM3YWJlMTE0ODUwZmY3YmJjM2Ui
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDc2NjIzMzczNDIxZGYyMmZiNGNmODgxNzAyMGNiYjdl
ZjE1YzcyNWI5ZDVlNDVmMTdlMTg5YmZjMzg0MTkwZiIKIAogU1JDX1VSSSArPSAiXAogICAgIGh0
dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS95YW1sL3B5eWFtbC9hOThmZDYwODhlODFk
N2FjYTU3MTIyMGM5NjZiYmZlMmFjNDNjMzM1L3Rlc3RzL3Rlc3RfZHVtcF9sb2FkLnB5O25hbWU9
dGVzdCBcCi0tIAoyLjQ3LjEKCg==

--===============5181057973160362649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-pyyaml (sysroot):
  /usr/lib/python3.13/site-packages/pyyaml-6.0.2.dist-info moved to /usr/lib/python3.13/site-packages/pyyaml-6.0.3.dist-info

--===============5181057973160362649==--

