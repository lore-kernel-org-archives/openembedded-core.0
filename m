Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12031.1795238992781609420
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 21:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aDm4buE2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qnAuhKrJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1fc951888-6df49f4c-030a-4be1-acac-55024f9a87ed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795238992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FX2j4SCG6+sD/lw5q+XWnT4IfaAuLgdhr8CAVVsJcB0=;
	b=aDm4buE27y9iw1aCUG4IT5s/O7PSAsxJ+D+EYZQ6uzSDEODXJX9z+5efwsfQouWo
	Fd1Ttna30wx5PDs0lXMYPSxti83diZoEO/6Q1w791qtQcKEBfb4Lb1ztr6aYhTgLk3l
	oNycVxWQm3g1EDzJZIbsL+JEZqeMzXxWrtaFgdb0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795238992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FX2j4SCG6+sD/lw5q+XWnT4IfaAuLgdhr8CAVVsJcB0=;
	b=qnAuhKrJShCA9lGzq4u0SuNRVxMrKvq5dOOzCxyvzsE+XveG8Etb0M7HiUlZ4lh5
	fEJp0ah1+n0pOe08MQqWq4JisWHnadKAh/h0A7sZAxj6Q1P0n1IzuXTccVRFYErq3wf
	PqUYWTW+vjKpj1QlYqoldNGdMduSuvsxHlG6rP+0=
Content-Type: multipart/mixed; boundary="===============2260682067863003290=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyyaml: upgrading to 6.0.4 SUCCEEDED
Message-ID: <010101a1fc951888-6df49f4c-030a-4be1-acac-55024f9a87ed-000000@us-west-2.amazonses.com>
Date: Sat, 21 Nov 2026 05:29:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.21-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 05:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250835

--===============2260682067863003290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyyaml* to *6.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyyaml-upgrade-6.0.3-6.0.4.patch
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
From 1d614484a139e1afdd59299473f65ec8b320ad2a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 21 Nov 2026 05:15:25 +0000
Subject: [PATCH] python3-pyyaml: upgrade 6.0.3 -> 6.0.4

6.0.4 (2026-11-20)
---
 .../python/{python3-pyyaml_6.0.3.bb => python3-pyyaml_6.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyyaml_6.0.3.bb => python3-pyyaml_6.0.4.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.4.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
rename to meta/recipes-devtools/python/python3-pyyaml_6.0.4.bb
index 849e2c9cc8..a61f8e2279 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pyyaml.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
 
-SRC_URI[sha256sum] = "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
+SRC_URI[sha256sum] = "e24bf71af8a432d7808fabff134d38dfe16d3cbb41f2873bb4b1e42422de0a1a"
 
 SRC_URI += "\
     https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca571220c966bbfe2ac43c335/tests/test_dump_load.py;name=test \
-- 
2.47.1


--===============2260682067863003290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-ptest: FILELIST: added "/usr/lib/python3-pyyaml/ptest/tests/test_libyaml_recursion_control.py /usr/lib/python3-pyyaml/ptest/tests/test_merge.py"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml: FILELIST: directory renamed /usr/lib/python3.15/site-packages/pyyaml-6.0.3.dist-info -> /usr/lib/python3.15/site-packages/pyyaml-6.0.4.dist-info, directory renamed /usr/lib/python3.15/site-packages/pyyaml-6.0.3.dist-info/licenses -> /usr/lib/python3.15/site-packages/pyyaml-6.0.4.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pyyaml (sysroot):
  /usr/lib/python3.15/site-packages/pyyaml-6.0.3.dist-info moved to /usr/lib/python3.15/site-packages/pyyaml-6.0.4.dist-info

--===============2260682067863003290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pyyaml-changelog.txt"

6.0.4 (2026-11-20)

--===============2260682067863003290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyyaml: PV changed from "6.0.3" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-pyyaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyyaml/pyyaml-6.0.3.tar.gz https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca571220c966bbfe2ac43c335/tests/test_dump_load.py;name=test" to "https://files.pythonhosted.org/packages/source/p/pyyaml/pyyaml-6.0.4.tar.gz https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca571220c966bbfe2ac43c335/tests/test_dump_load.py;name=test"
packages/x86-64-v3-poky-linux/python3-pyyaml: PKGV changed from 6.0.3 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-dbg: PV changed from "6.0.3" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-dbg: PKGSIZE changed from 1337176 to 1360472 (+2%)
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-dbg: PKGV changed from 6.0.3 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-dev: PV changed from "6.0.3" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-dev: PKGV changed from 6.0.3 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-doc: PV changed from "6.0.3" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-doc: PKGV changed from 6.0.3 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-locale: PV changed from "6.0.3" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-locale: PKGV changed from 6.0.3 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-ptest: PV changed from "6.0.3" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-ptest: PKGSIZE changed from 231214 to 236083 (+2%)
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-ptest: FILELIST: added "/usr/lib/python3-pyyaml/ptest/tests/test_libyaml_recursion_control.py /usr/lib/python3-pyyaml/ptest/tests/test_merge.py"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-ptest: PKGV changed from 6.0.3 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-src: PV changed from "6.0.3" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-src: PKGSIZE changed from 1381557 to 1423352 (+3%)
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-src: FILELIST: directory renamed /usr/src/debug/python3-pyyaml/6.0.3/yaml -> /usr/src/debug/python3-pyyaml/6.0.4/yaml
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-src: PKGV changed from 6.0.3 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-staticdev: PV changed from "6.0.3" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml-staticdev: PKGV changed from 6.0.3 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml: PV changed from "6.0.3" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml: PKGSIZE changed from 749747 to 755321 (+1%)
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml: FILELIST: directory renamed /usr/lib/python3.15/site-packages/pyyaml-6.0.3.dist-info -> /usr/lib/python3.15/site-packages/pyyaml-6.0.4.dist-info, directory renamed /usr/lib/python3.15/site-packages/pyyaml-6.0.3.dist-info/licenses -> /usr/lib/python3.15/site-packages/pyyaml-6.0.4.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pyyaml/python3-pyyaml: PKGV changed from 6.0.3 [default] to 6.0.4 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pyyaml (sysroot):
  /usr/lib/python3.15/site-packages/pyyaml-6.0.3.dist-info moved to /usr/lib/python3.15/site-packages/pyyaml-6.0.4.dist-info

--===============2260682067863003290==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyyaml-upgrade-6.0.3-6.0.4.patch"

RnJvbSAxZDYxNDQ4NGExMzllMWFmZGQ1OTI5OTQ3M2Y2NWVjOGIzMjBhZDJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjEgTm92IDIwMjYgMDU6MTU6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5eWFtbDogdXBncmFkZSA2LjAuMyAtPiA2LjAuNAoKNi4wLjQgKDIwMjYtMTEtMjAp
Ci0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy1weXlhbWxfNi4wLjMuYmIgPT4gcHl0aG9uMy1weXlh
bWxfNi4wLjQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1w
eXlhbWxfNi4wLjMuYmIgPT4gcHl0aG9uMy1weXlhbWxfNi4wLjQuYmJ9ICg4OCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5eWFtbF82LjAuMy5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXlhbWxfNi4wLjQuYmIK
c2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5eWFtbF82LjAuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5eWFtbF82LjAuNC5iYgppbmRleCA4NDllMmM5Y2M4Li5hNjFm
OGUyMjc5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHl5YW1sXzYuMC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weXlhbWxfNi4wLjQuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vcHl5
YW1sLm9yZy8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PTZkODI0MjY2MGE4MzcxYWRkNWZlNTQ3YWRmMDgzMDc5IgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiZDc2NjIzMzczNDIxZGYyMmZiNGNmODgxNzAyMGNiYjdlZjE1YzcyNWI5ZDVl
NDVmMTdlMTg5YmZjMzg0MTkwZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlMjRiZjcxYWY4YTQz
MmQ3ODA4ZmFiZmYxMzRkMzhkZmUxNmQzY2JiNDFmMjg3M2JiNGIxZTQyNDIyZGUwYTFhIgogCiBT
UkNfVVJJICs9ICJcCiAgICAgaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3lhbWwv
cHl5YW1sL2E5OGZkNjA4OGU4MWQ3YWNhNTcxMjIwYzk2NmJiZmUyYWM0M2MzMzUvdGVzdHMvdGVz
dF9kdW1wX2xvYWQucHk7bmFtZT10ZXN0IFwKLS0gCjIuNDcuMQoK

--===============2260682067863003290==--
