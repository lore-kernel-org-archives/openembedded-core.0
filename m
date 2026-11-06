Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.491.1793944902881868872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rDVerx0j;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EJ2aWNwv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1af72d8da-777abbdc-c24d-4c25-8ad8-b466f6a0e4b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793944902;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DH1dinKVSjdeo4ITMw1TGBwLkBMPdYvJhvcz5MAsHVQ=;
	b=rDVerx0jCcNQ/wvDRdLWH50GgB6mBLef7jvzNQbQtjkZ0ox7s4Kj/MJjz5+wcnlP
	XGph9NRzGnUCdecrF13bkL2jCfAyN8nS5aD5ajKCw6EvVEONTm/Fhy7nkfhzax7mGRG
	CdCFAm2QG0RLXhPiccSEeF3EmbjtmFIz6dt5A7gQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793944902;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DH1dinKVSjdeo4ITMw1TGBwLkBMPdYvJhvcz5MAsHVQ=;
	b=EJ2aWNwvE/a1lch8V5jALmXi+9l/Ya+D8VN+NGStwcdHeNYQQexvhY7lCBEv6yyx
	XwGrVoUnooTm0tiS9Pi1DStMQBiLFLLL6xoZ416SOoS4vJyXGbBgZep5U/Z0D+L6Y5u
	RXzoXPaos+Og4UuA/0xvRYcvmaMLtBNyUsYfJitE=
Content-Type: multipart/mixed; boundary="===============1584658193484296865=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 337 SUCCEEDED
Message-ID: <010101a1af72d8da-777abbdc-c24d-4c25-8ad8-b466f6a0e4b8-000000@us-west-2.amazonses.com>
Date: Fri, 6 Nov 2026 06:01:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.06-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249595

--===============1584658193484296865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *337* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-332-337.patch
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
From 65d0a3e663c43e5862b3c12562ea30a2d54b7e1b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 6 Nov 2026 06:01:32 +0000
Subject: [PATCH] diffoscope: upgrade 332 -> 337

---
 .../diffoscope/{diffoscope_332.bb => diffoscope_337.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_332.bb => diffoscope_337.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_332.bb b/meta/recipes-support/diffoscope/diffoscope_337.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_332.bb
rename to meta/recipes-support/diffoscope/diffoscope_337.bb
index a43b20b460..c3c6adb3d1 100644
--- a/meta/recipes-support/diffoscope/diffoscope_332.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_337.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "da858807ce2535f1bb5c3942020b01c7aef14f870257c964b70cd4e1f2333206"
+SRC_URI[sha256sum] = "ca1c12904e7ef441649c34675de50496d2228a709662864a613844ee207e4dcd"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============1584658193484296865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "332" to "337"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 332 [default] to 337 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "332" to "337"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 332 [default] to 337 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "332" to "337"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 332 [default] to 337 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "332" to "337"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 332 [default] to 337 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "332" to "337"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 332 [default] to 337 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "332" to "337"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 332 [default] to 337 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "332" to "337"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-337.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-337.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1433312 to 1448530 (+1%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 332 [default] to 337 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "332" to "337"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 332 [default] to 337 [default]
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-332.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-337.tar.gz"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-332.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-337.dist-info

--===============1584658193484296865==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-332-337.patch"

RnJvbSA2NWQwYTNlNjYzYzQzZTU4NjJiM2MxMjU2MmVhMzBhMmQ1NGI3ZTFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNiBOb3YgMjAyNiAwNjowMTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMzMyIC0+IDMzNwoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8zMzIuYmIgPT4gZGlmZm9zY29wZV8zMzcuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzMzMi5iYiA9PiBkaWZmb3Njb3BlXzMz
Ny5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMzMyLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzMzNy5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMzMyLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMzM3LmJiCmluZGV4IGE0M2IyMGI0
NjAuLmMzYzZhZGIzZDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMzIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMzNy5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT1kMzIyMzliY2I2NzM0NjNhYjg3NGU4MGQ0N2ZhZTUwNCIKIAog
aW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkYTg1ODgw
N2NlMjUzNWYxYmI1YzM5NDIwMjBiMDFjN2FlZjE0Zjg3MDI1N2M5NjRiNzBjZDRlMWYyMzMzMjA2
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNhMWMxMjkwNGU3ZWY0NDE2NDljMzQ2NzVkZTUwNDk2
ZDIyMjhhNzA5NjYyODY0YTYxMzg0NGVlMjA3ZTRkY2QiCiAKIFJERVBFTkRTOiR7UE59ICs9ICJc
CiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDcuMQoK

--===============1584658193484296865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-337.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-337.dist-info
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-332.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-337.dist-info

--===============1584658193484296865==--
