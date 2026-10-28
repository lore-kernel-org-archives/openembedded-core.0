Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36892.1793167562304195787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 23:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tC06o06a;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rccGsLGt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1811d91fa-2b752bee-2117-423b-8157-cc715d5fa628-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793167561;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=js4hl8EAfc5lxrVTyPJfpUr94C+rde/O1fqeJFbm5T4=;
	b=tC06o06augLf7Sh2SpefB3Oroiv5K8w9owtPGFe2l7YleROvqsKS+RmXYoGd+z7J
	eco/Q8CVc3g98dK+G0deWtngex4/g2iM9+v1f6HLbEiDOzXNbUbQQEjou1aswNweiNa
	v8rmanAtb/TJJtXdPkj73siK+P3moAp6fDC9aFpc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793167561;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=js4hl8EAfc5lxrVTyPJfpUr94C+rde/O1fqeJFbm5T4=;
	b=rccGsLGt+yb1IYGuO82BThmXHUl46vdPvWkp9VrF9LkTmBNOLDpmZVqwE9SCiKXP
	X2xijvJ8yi7ExpLBBu2hjx77WomevlXs/FlVjwuknA2kCeDD1YvJ6rAV5QuTQWq+txq
	sNIIaKzN2RAFBnLA9LCjFLNBZDqvTEqal3MoUFvI=
Content-Type: multipart/mixed; boundary="===============7445203711446837614=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-flit-core: upgrading to 4.2.0 SUCCEEDED
Message-ID: <010101a1811d91fa-2b752bee-2117-423b-8157-cc715d5fa628-000000@us-west-2.amazonses.com>
Date: Wed, 28 Oct 2026 06:06:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.28-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 06:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248779

--===============7445203711446837614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-flit-core* to *4.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-flit-core-upgrade-3.12.0-4.2.0.patch
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
From f532f779fea223ca4bb4ce58344a201668794066 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 28 Oct 2026 05:47:14 +0000
Subject: [PATCH] python3-flit-core: upgrade 3.12.0 -> 4.2.0

---
 .../{python3-flit-core_3.12.0.bb => python3-flit-core_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.12.0.bb => python3-flit-core_4.2.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb b/meta/recipes-devtools/python/python3-flit-core_4.2.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_4.2.0.bb
index 786906b4b4..5f490ca303 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_4.2.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "18f63100d6f94385c6ed57a72073443e1a71a4acb4339491615d0f16d6ff01b2"
+SRC_URI[sha256sum] = "84e4e4d8fdd45ba2613800a3ebc6834de26d47ec9746efc3719f94181137b460"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============7445203711446837614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.o /lib/*.la /lib/lib*.so"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/bin/* /lib/*.so.* /sbin/*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/bin/* /lib/*.so.* /sbin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/python3-flit-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/f/flit_core/flit_core-3.12.0.tar.gz" to "https://files.pythonhosted.org/packages/source/f/flit_core/flit_core-4.2.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-flit-core: PV changed from "3.12.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-flit-core: PKGV changed from 3.12.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-dbg: PV changed from "3.12.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-dbg: PKGV changed from 3.12.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-dev: PV changed from "3.12.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-dev: PKGV changed from 3.12.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-doc: PV changed from "3.12.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-doc: PKGV changed from 3.12.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-locale: PV changed from "3.12.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-locale: PKGV changed from 3.12.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-src: PV changed from "3.12.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-src: PKGV changed from 3.12.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-staticdev: PV changed from "3.12.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-staticdev: PKGV changed from 3.12.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core: PV changed from "3.12.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core: PKGV changed from 3.12.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info -> /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info -> /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core: PKGSIZE changed from 323957 to 336813 (+4%)
Changes to packages/x86-64-v3-poky-linux/python3-flit-core (sysroot):
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/RECORD was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/RECORD was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/WHEEL was removed

--===============7445203711446837614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info -> /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info -> /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-flit-core (sysroot):
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/RECORD was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/RECORD was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/WHEEL was removed

--===============7445203711446837614==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-flit-core-upgrade-3.12.0-4.2.0.patch"

RnJvbSBmNTMyZjc3OWZlYTIyM2NhNGJiNGNlNTgzNDRhMjAxNjY4Nzk0MDY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjggT2N0IDIwMjYgMDU6NDc6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWZsaXQtY29yZTogdXBncmFkZSAzLjEyLjAgLT4gNC4yLjAKCi0tLQogLi4uL3tweXRo
b24zLWZsaXQtY29yZV8zLjEyLjAuYmIgPT4gcHl0aG9uMy1mbGl0LWNvcmVfNC4yLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1mbGl0LWNvcmVfMy4xMi4w
LmJiID0+IHB5dGhvbjMtZmxpdC1jb3JlXzQuMi4wLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1mbGl0LWNvcmVfMy4xMi4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZsaXQtY29yZV80LjIuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzMuMTIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWZsaXQtY29yZV80LjIuMC5iYgppbmRleCA3ODY5MDZiNGI0
Li41ZjQ5MGNhMzAzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZmxpdC1jb3JlXzMuMTIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzQuMi4wLmJiCkBAIC04LDcgKzgsNyBAQCBCVUdUUkFDS0VS
ID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL2ZsaXQvaXNzdWVzIgogTElDRU5TRSA9ICJCU0Qt
My1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT00MWViNzhm
YThhODcyOTgzYTg4MmM2OTRhODMwNWYwOCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE4ZjYz
MTAwZDZmOTQzODVjNmVkNTdhNzIwNzM0NDNlMWE3MWE0YWNiNDMzOTQ5MTYxNWQwZjE2ZDZmZjAx
YjIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODRlNGU0ZDhmZGQ0NWJhMjYxMzgwMGEzZWJjNjgz
NGRlMjZkNDdlYzk3NDZlZmMzNzE5Zjk0MTgxMTM3YjQ2MCIKIAogaW5oZXJpdCBweXBpIHB5dGhv
bl9mbGl0X2NvcmUKIAotLSAKMi40Ny4xCgo=

--===============7445203711446837614==--
