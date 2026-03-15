Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE45EFCBC3
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:09 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28794.1773582114361599348
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YwTLWlZB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=b4xlqepw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019cf1bb7139-03755c1e-8d3e-4f5f-9709-9dcc0c23b319-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582119;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ymeZx8yNlEHavS6//Hc18hjXVIgrDBHNvldpFuyerkY=;
	b=YwTLWlZBMofNqyLiqifuRyq5TI9MwXvVyxMofYAoDDIOMWXo+8Y3YfRgpAuHlybw
	qB38HHqBnniZmBWFJ/5YeM4XgNmjJsOCkP4o2ln/OEfgbYjLRy1xcIYqYx10miuLONO
	vp0VvW9/3QGaz9GXVgLQZE1hI40F5t6HaZG9Pc1A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582119;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ymeZx8yNlEHavS6//Hc18hjXVIgrDBHNvldpFuyerkY=;
	b=b4xlqepwVRZDXHDHk4uWHqQ7IYM+JdMi8A0tCHL4IBadbxVziUhjYqybi6/c0yJr
	gQYj+rPMGeSOREmS9/eNyGO6Rshbf6ptKMpRIGr7E5taNRXtIKxnK5lQDjo34bmecSv
	Ajv5HGT9fx4vuX9SVtoIxIAK0GXlVntytmTHRAnA=
Content-Type: multipart/mixed; boundary="===============1777251071850533697=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-shacl2code: upgrading to 1.0.0 SUCCEEDED
Message-ID: <0101019cf1bb7139-03755c1e-8d3e-4f5f-9709-9dcc0c23b319-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233150

--===============1777251071850533697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-shacl2code* to *1.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-shacl2code-upgrade-0.0.24-1.0.0.patch
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
From 288da0ef8d303bb5830a4892e76e352d9889183a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 08:31:39 +0000
Subject: [PATCH] python3-shacl2code: upgrade 0.0.24 -> 1.0.0

---
 ...python3-shacl2code_0.0.24.bb => python3-shacl2code_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_0.0.24.bb => python3-shacl2code_1.0.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb b/meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
index 93ed9a2530..49416b3a04 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "d8b511054ca564b4514b9186ece7f5eb8048cfc5daa6625def1a3adba13c4f66"
+SRC_URI[sha256sum] = "1f9d5cb786bf98d3a7de92218fe5e546143d6aa2aa134098200b06022629d005"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============1777251071850533697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-0.0.24.tar.gz;downloadfilename=shacl2code-0.0.24.tar.gz" to "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-1.0.0.tar.gz;downloadfilename=shacl2code-1.0.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-shacl2code: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dbg: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dbg: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dev: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dev: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-doc: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-doc: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-locale: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-locale: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-src: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-src: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-staticdev: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-staticdev: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python.j2", added "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__main__.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__init__.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/cmd.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/stub.pyi.j2"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGSIZE changed from 1546856 to 1594868 (+3%)
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/cmd.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__init__.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__main__.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/stub.pyi.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python.j2 was removed

--===============1777251071850533697==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-shacl2code-upgrade-0.0.24-1.0.0.patch"

RnJvbSAyODhkYTBlZjhkMzAzYmI1ODMwYTQ4OTJlNzZlMzUyZDk4ODkxODNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDg6MzE6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNoYWNsMmNvZGU6IHVwZ3JhZGUgMC4wLjI0IC0+IDEuMC4wCgotLS0KIC4uLnB5dGhv
bjMtc2hhY2wyY29kZV8wLjAuMjQuYmIgPT4gcHl0aG9uMy1zaGFjbDJjb2RlXzEuMC4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2hhY2wyY29kZV8wLjAu
MjQuYmIgPT4gcHl0aG9uMy1zaGFjbDJjb2RlXzEuMC4wLmJifSAoODElKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzAuMC4yNC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMC4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggODElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzAuMC4yNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNoYWNsMmNvZGVfMS4wLjAuYmIKaW5kZXggOTNl
ZDlhMjUzMC4uNDk0MTZiM2EwNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXNoYWNsMmNvZGVfMC4wLjI0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMC4wLmJiCkBAIC01LDcgKzUsNyBAQCBM
SUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA1
ODJmMzU4NjI4ZjI5OWYyOWMyM2JmNWZiMmY3M2M5IgogCiBQWVBJX1BBQ0tBR0UgPSAic2hhY2wy
Y29kZSIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkOGI1MTEwNTRjYTU2NGI0NTE0YjkxODZlY2U3
ZjVlYjgwNDhjZmM1ZGFhNjYyNWRlZjFhM2FkYmExM2M0ZjY2IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjFmOWQ1Y2I3ODZiZjk4ZDNhN2RlOTIyMThmZTVlNTQ2MTQzZDZhYTJhYTEzNDA5ODIwMGIw
NjAyMjYyOWQwMDUiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuNDcu
MQoK

--===============1777251071850533697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python.j2", added "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__main__.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__init__.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/cmd.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/stub.pyi.j2"
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/cmd.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__init__.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__main__.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/stub.pyi.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python.j2 was removed

--===============1777251071850533697==--

