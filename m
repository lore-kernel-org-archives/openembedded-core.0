Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2775.1795845424834437509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 21:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mHRbq14T;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lZJOzWs9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a220ba82fc-68d83238-8827-42dc-b331-4aba7c59ed2c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795845424;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tSMR+FbO79lAkWKFF0s5Z50jqbubmkF/tolkCSnt5fU=;
	b=mHRbq14TOzi6UXSGSqDYdbb9QQ27TpJl+q5hDYoaHgT7FK44BNp3HkKUxU1jrh1G
	EkdFodkIACFYQNjJMOzvbhQHgjrXXiHAKY/b2Uj5414JtCSh831X6/w9t/lJIHsvHXr
	kB6XdoPirG+EKQAwxaBEIjB5J8JT8xtbUZOJqXLo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795845424;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tSMR+FbO79lAkWKFF0s5Z50jqbubmkF/tolkCSnt5fU=;
	b=lZJOzWs9CObjOy0wzGEPUKj+CaGuQaQo2b3Cu8kPaalKagMZPx9YHVJqL5YlBh6O
	KjCN4cgjkCRlM9r15cMQPs/xzms8xRSR4caCzdczryq29RQMPWHtqqtpeb2xzeewk4a
	FTRlNbZn8ECDuWny/8Om2tIDFNvwzPUk7y6u6+UY=
Content-Type: multipart/mixed; boundary="===============2222787539201409912=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.170.23 SUCCEEDED
Message-ID: <010101a220ba82fc-68d83238-8827-42dc-b331-4aba7c59ed2c-000000@us-west-2.amazonses.com>
Date: Sat, 28 Nov 2026 05:57:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.28-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 05:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251477

--===============2222787539201409912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.170.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.170.12-6.170.23.patch
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
From 90ee3d3db0912912755bf8e679e654eae00a74d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 28 Nov 2026 05:45:18 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.170.12 -> 6.170.23

---
 ...n3-hypothesis_6.170.12.bb => python3-hypothesis_6.170.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.170.12.bb => python3-hypothesis_6.170.23.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb b/meta/recipes-devtools/python/python3-hypothesis_6.170.23.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.170.23.bb
index 564b1d1845..efbf36a1ea 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.170.23.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "92b353d21a010b50b638c730ce67cb631ca78a369b146bcc28b3488f83136e35"
+SRC_URI[sha256sum] = "96d966475f85255277d36e94c10b6854c46aa7c768124de79439b8017b9c5809"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============2222787539201409912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.170.12 [default] to 6.170.23 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.170.12.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.30.1 crate://crates.io/pyo3-build-config/0.30.1 crate://crates.io/pyo3-ffi/0.30.1 crate://crates.io/pyo3-macros/0.30.1 crate://crates.io/pyo3-macros-backend/0.30.1 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.9 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io
 /wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.170.23.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.30.1 crate://crates.io/pyo3-build-config/0.30.1 crate://crates.io/pyo3-ffi/0.30.1 crate://crates.io/pyo3-macros/0.30.1 crate://crates.io/pyo3-macros-backend/0.30.1 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crat
 e://crates.io/syn/3.0.9 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.170.12" to "6.170.23"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.170.12 [default] to 6.170.23 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.170.12" to "6.170.23"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.170.12 [default] to 6.170.23 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.170.12" to "6.170.23"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.170.12 [default] to 6.170.23 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.170.12" to "6.170.23"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.170.12 [default] to 6.170.23 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.170.12" to "6.170.23"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.170.12 [default] to 6.170.23 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.170.12" to "6.170.23"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.170.12 [default] to 6.170.23 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.170.12" to "6.170.23"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.170.12 [default] to 6.170.23 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.170.12" to "6.170.23"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.15/site-packages/hypothesis-6.170.12.dist-info -> /usr/lib/python3.15/site-packages/hypothesis-6.170.23.dist-info, directory renamed /usr/lib/python3.15/site-packages/hypothesis-6.170.12.dist-info/licenses -> /usr/lib/python3.15/site-packages/hypothesis-6.170.23.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.170.12 [default] to 6.170.23 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4715332 to 4730867 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.170.12" to "6.170.23"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.15/site-packages/hypothesis-6.170.12.dist-info moved to /usr/lib/python3.15/site-packages/hypothesis-6.170.23.dist-info

--===============2222787539201409912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.15/site-packages/hypothesis-6.170.12.dist-info -> /usr/lib/python3.15/site-packages/hypothesis-6.170.23.dist-info, directory renamed /usr/lib/python3.15/site-packages/hypothesis-6.170.12.dist-info/licenses -> /usr/lib/python3.15/site-packages/hypothesis-6.170.23.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.15/site-packages/hypothesis-6.170.12.dist-info moved to /usr/lib/python3.15/site-packages/hypothesis-6.170.23.dist-info

--===============2222787539201409912==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.170.12-6.170.23.patch"

RnJvbSA5MGVlM2QzZGIwOTEyOTEyNzU1YmY4ZTY3OWU2NTRlYWUwMGE3NGQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjggTm92IDIwMjYgMDU6NDU6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNzAuMTIgLT4gNi4xNzAuMjMKCi0tLQogLi4u
bjMtaHlwb3RoZXNpc182LjE3MC4xMi5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi4xNzAuMjMu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTcwLjEyLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE3MC4yMy5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE3MC4xMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBv
dGhlc2lzXzYuMTcwLjIzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTcwLjEyLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182
LjE3MC4yMy5iYgppbmRleCA1NjRiMWQxODQ1Li5lZmJmMzZhMWVhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE3MC4xMi5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE3
MC4yMy5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0
X3JsZS5weSBcCiAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTJiMzUzZDIxYTAxMGI1
MGI2MzhjNzMwY2U2N2NiNjMxY2E3OGEzNjliMTQ2YmNjMjhiMzQ4OGY4MzEzNmUzNSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI5NmQ5NjY0NzVmODUyNTUyNzdkMzZlOTRjMTBiNjg1NGM0NmFhN2M3
NjgxMjRkZTc5NDM5YjgwMTdiOWM1ODA5IgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBw
eXRob24zLWF0dHJzIFwKLS0gCjIuNDcuMQoK

--===============2222787539201409912==--
