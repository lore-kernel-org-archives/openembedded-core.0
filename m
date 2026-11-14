Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6185.1794633049755897041
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 21:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Tmurk/je;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=j4K8MTl+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1d8772263-04f30e33-81dc-4586-b012-e8a4d7a7ed92-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794633048;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0Qv+rXow4KpoEouWegLBrWuX/rJk2bKpKR/x/evMhoU=;
	b=Tmurk/jeYmc+lm1B9g3K6KOU7zZdvuBMGGrkfHDJCU2E4SnfzoTijs/YPwTItun7
	FokHzQ/bXU3YgdGo8bIqlnUSC/rqwzzbqjFRMbnfLkHpKE4fcjAL3LHzVn8A1nXRZbB
	EoXcMHwsnvO3pS+6SYO4SqF4p9DT09XBWHRVdCyQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794633048;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0Qv+rXow4KpoEouWegLBrWuX/rJk2bKpKR/x/evMhoU=;
	b=j4K8MTl+ml6SpfDVh8XpUmjWPIFr0qZfjKoCqB2gm80KtDqywzrQpoPAAHOpL8bR
	+CX96ychztnPa0AbkJv0mGyuxWGjycjYo6GeVs8DYm6/ATqRguS+IYQe2X+3Nrn4+hf
	XTDd74958kyHRR4y7la6sJK6aAeArVTg0NBXKqMc=
Content-Type: multipart/mixed; boundary="===============8797271167968385062=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 339 SUCCEEDED
Message-ID: <010101a1d8772263-04f30e33-81dc-4586-b012-e8a4d7a7ed92-000000@us-west-2.amazonses.com>
Date: Sat, 14 Nov 2026 05:10:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.14-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 05:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250195

--===============8797271167968385062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *339* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-332-339.patch
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
From ebb8b2f0441f18d95db9193d83d326bc7cf3bbee Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 14 Nov 2026 05:10:45 +0000
Subject: [PATCH] diffoscope: upgrade 332 -> 339

---
 .../diffoscope/{diffoscope_332.bb => diffoscope_339.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_332.bb => diffoscope_339.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_332.bb b/meta/recipes-support/diffoscope/diffoscope_339.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_332.bb
rename to meta/recipes-support/diffoscope/diffoscope_339.bb
index a43b20b460..65c30d29cd 100644
--- a/meta/recipes-support/diffoscope/diffoscope_332.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_339.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "da858807ce2535f1bb5c3942020b01c7aef14f870257c964b70cd4e1f2333206"
+SRC_URI[sha256sum] = "fb033492c16017963bfa04290c3ffd8e3b7884e1226dfaa6da2b1a07368d8e82"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============8797271167968385062==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-332-339.patch"

RnJvbSBlYmI4YjJmMDQ0MWYxOGQ5NWRiOTE5M2Q4M2QzMjZiYzdjZjNiYmVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTQgTm92IDIwMjYgMDU6MTA6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMzMiAtPiAzMzkKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzMyLmJiID0+IGRpZmZvc2NvcGVfMzM5LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMzIuYmIgPT4gZGlmZm9zY29wZV8z
MzkuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMzMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMzkuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMzMi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMzOS5iYgppbmRleCBhNDNiMjBi
NDYwLi42NWMzMGQyOWNkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzMyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMzkuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGE4NTg4
MDdjZTI1MzVmMWJiNWMzOTQyMDIwYjAxYzdhZWYxNGY4NzAyNTdjOTY0YjcwY2Q0ZTFmMjMzMzIw
NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmYjAzMzQ5MmMxNjAxNzk2M2JmYTA0MjkwYzNmZmQ4
ZTNiNzg4NGUxMjI2ZGZhYTZkYTJiMWEwNzM2OGQ4ZTgyIgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============8797271167968385062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-339.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-339.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-332.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-339.dist-info

--===============8797271167968385062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 332 [default] to 339 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "332" to "339"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 332 [default] to 339 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "332" to "339"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 332 [default] to 339 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "332" to "339"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 332 [default] to 339 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "332" to "339"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 332 [default] to 339 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "332" to "339"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 332 [default] to 339 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "332" to "339"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1433312 to 1449388 (+1%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-339.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-339.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 332 [default] to 339 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "332" to "339"
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-332.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-339.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 332 [default] to 339 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "332" to "339"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-332.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-339.dist-info

--===============8797271167968385062==--
