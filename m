Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87434C25B42
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.8488.1698848704282896022
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CeiO8ChH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QzIXZro3;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b8b4604ec-a440fe86-4592-4e53-b71d-675969c2285b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zr5IbPNjro4S1hAorFUmjNhTDtFNxF/93JNt1tIvk6c=;
	b=CeiO8ChHBnLlOwFwbWDJPyT7igZRLaU7MDPAqpdP41uh8/HuACcd2AjKRhjrMClq
	m+9FxAQJjh4T8HvkBm/9lr6TN4g/gEj0iWBJl0DfqP7fc2HRyrRpZnKGq4KADX9E3NA
	5l1GeyZMklIQcdi3TATFO+BVWrWwPhxUSEprIl7k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zr5IbPNjro4S1hAorFUmjNhTDtFNxF/93JNt1tIvk6c=;
	b=QzIXZro3b9UJj3ZMI4MlnWAvbmzEBhtd7gDKL1995X0FeEJIKScJVpNxdwdX2YCF
	x41lJ6CRNviwSAKR9leh7iwG1rG58nVcgnnFAC4nV8bsY57NSw/K0+bxmYjz4i7Uhrv
	3qKVKqcqhgCvshZWqIgUKNTirp2JDQ8QgWbIw5qY=
Content-Type: multipart/mixed; boundary="===============3637615413717925341=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-psutil: upgrading to 5.9.6 SUCCEEDED
Message-ID: <0101018b8b4604ec-a440fe86-4592-4e53-b71d-675969c2285b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189954

--===============3637615413717925341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-psutil* to *5.9.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-psutil-upgrade-5.9.5-5.9.6.patch
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
From 1552cc8f1e00b47b2e3f4330a9edde875c1a462c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:14:13 +0000
Subject: [PATCH] python3-psutil: upgrade 5.9.5 -> 5.9.6

---
 .../python/{python3-psutil_5.9.5.bb => python3-psutil_5.9.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_5.9.5.bb => python3-psutil_5.9.6.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.5.bb b/meta/recipes-devtools/python/python3-psutil_5.9.6.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_5.9.5.bb
rename to meta/recipes-devtools/python/python3-psutil_5.9.6.bb
index c84e2225b8..df4f776b7b 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.5.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.6.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "5410638e4df39c54d957fc51ce03048acd8e6d60abc0f5107af51e5fb566eb3c"
+SRC_URI[sha256sum] = "e4b92ddcd7dd4cdd3f900180ea1e104932c7bce234fb88976e2a3b296441225a"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============3637615413717925341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-psutil: PKGV changed from 5.9.5 [default] to 5.9.6 [default]
packages/core2-64-poky-linux/python3-psutil: PV changed from "5.9.5" to "5.9.6"
packages/core2-64-poky-linux/python3-psutil: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.5.tar.gz;downloadfilename=psutil-5.9.5.tar.gz" to "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.6.tar.gz;downloadfilename=psutil-5.9.6.tar.gz"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-dbg: PKGV changed from 5.9.5 [default] to 5.9.6 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-dbg: PV changed from "5.9.5" to "5.9.6"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-dbg: PKGSIZE changed from 105656 to 106864 (+1%)
packages/core2-64-poky-linux/python3-psutil/python3-psutil-dev: PKGV changed from 5.9.5 [default] to 5.9.6 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-dev: PV changed from "5.9.5" to "5.9.6"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-doc: PKGV changed from 5.9.5 [default] to 5.9.6 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-doc: PV changed from "5.9.5" to "5.9.6"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-locale: PKGV changed from 5.9.5 [default] to 5.9.6 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-locale: PV changed from "5.9.5" to "5.9.6"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-src: PKGV changed from 5.9.5 [default] to 5.9.6 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-src: PV changed from "5.9.5" to "5.9.6"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-src: PKGSIZE changed from 61218 to 61868 (+1%)
packages/core2-64-poky-linux/python3-psutil/python3-psutil-staticdev: PKGV changed from 5.9.5 [default] to 5.9.6 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-staticdev: PV changed from "5.9.5" to "5.9.6"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-tests: PKGV changed from 5.9.5 [default] to 5.9.6 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-tests: PV changed from "5.9.5" to "5.9.6"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-tests: PKGSIZE changed from 1342645 to 1349484 (+1%)
packages/core2-64-poky-linux/python3-psutil/python3-psutil: PKGV changed from 5.9.5 [default] to 5.9.6 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil: PV changed from "5.9.5" to "5.9.6"
packages/core2-64-poky-linux/python3-psutil/python3-psutil: PKGSIZE changed from 870911 to 874088 (+0%)
Changes to packages/core2-64-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.11/site-packages/psutil-5.9.5.dist-info moved to /usr/lib/python3.11/site-packages/psutil-5.9.6.dist-info

--===============3637615413717925341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.11/site-packages/psutil-5.9.5.dist-info moved to /usr/lib/python3.11/site-packages/psutil-5.9.6.dist-info

--===============3637615413717925341==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-psutil-upgrade-5.9.5-5.9.6.patch"

RnJvbSAxNTUyY2M4ZjFlMDBiNDdiMmUzZjQzMzBhOWVkZGU4NzVjMWE0NjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOToxNDoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHN1dGlsOiB1cGdyYWRlIDUuOS41IC0+IDUuOS42CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHN1dGlsXzUuOS41LmJiID0+IHB5dGhvbjMtcHN1dGlsXzUuOS42LmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHN1dGlsXzUuOS41LmJiID0+IHB5
dGhvbjMtcHN1dGlsXzUuOS42LmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxfNS45LjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzUuOS42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTAl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxf
NS45LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
c3V0aWxfNS45LjYuYmIKaW5kZXggYzg0ZTIyMjViOC4uZGY0Zjc3NmI3YiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF81LjkuNS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzUuOS42LmJiCkBA
IC0zLDcgKzMsNyBAQCBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWE5YzcyMTEzYTg0M2QwZDczMmEwYWMxYzIwMGQ4MWIxIgog
SE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3BzdXRpbC8iCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI1NDEwNjM4ZTRkZjM5YzU0ZDk1N2ZjNTFjZTAzMDQ4YWNkOGU2ZDYwYWJj
MGY1MTA3YWY1MWU1ZmI1NjZlYjNjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU0YjkyZGRjZDdk
ZDRjZGQzZjkwMDE4MGVhMWUxMDQ5MzJjN2JjZTIzNGZiODg5NzZlMmEzYjI5NjQ0MTIyNWEiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM5LjIKCg==

--===============3637615413717925341==--

