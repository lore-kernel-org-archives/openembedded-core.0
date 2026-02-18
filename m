Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E33E9A057
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1423.1771440102459000300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IMk84vLt;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OIFNjNiW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019c720ed94c-2009b040-525b-4ab2-9613-40999971f57a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440101;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Rnshczm/5GRZB9zF4lNBIjWUVj+S7b6LVews/KOHLKI=;
	b=IMk84vLte/ua6AcQwd68H1rhkVzbZYQKt2EhO7WqncN+FWkACUd8/EqXoyeU+tK2
	Vl57XQesS5Z40gBIO+SH5rHz3w9ydcQMJ0D92oP7bjRtrUMCeY6IRU5yJS7QhphzVmI
	fou0vxeia7frR3dCyW8CLaJFA/94rXIezRrspdNU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440101;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Rnshczm/5GRZB9zF4lNBIjWUVj+S7b6LVews/KOHLKI=;
	b=OIFNjNiWyCF45IlZLuEE8IHrI0l50kkrU+mNAn0nIBQa0bn5b/RqVHSBgNrchJ0U
	dQirpWlDxWhWN4NRdogkZHfLf6+WO8prePgNW+tvQl6r9HmtOdqolaOewJ4Ni6Q+hLi
	dcIIWUgtXL9O6A/6/YyUAdvIxIV3GscXUKFvGBlM=
Content-Type: multipart/mixed; boundary="===============9222707640292307960=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.151.9 SUCCEEDED
Message-ID: <0101019c720ed94c-2009b040-525b-4ab2-9613-40999971f57a-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231353

--===============9222707640292307960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.151.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.151.4-6.151.9.patch
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
From 7fe880a551dbf53a318aa83acb2ab9aca248aaab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 13:03:34 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.151.4 -> 6.151.9

---
 ...hon3-hypothesis_6.151.4.bb => python3-hypothesis_6.151.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.151.4.bb => python3-hypothesis_6.151.9.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.151.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.151.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb
index 425b2e6441..157e4a2ee0 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.151.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "658a62da1c3ccb36746ac2f7dc4bb1a6e76bd314e0dc54c4e1aaba2503d5545c"
+SRC_URI[sha256sum] = "2f284428dda6c3c48c580de0e18470ff9c7f5ef628a647ee8002f38c3f9097ca"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============9222707640292307960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.151.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.151.9.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.151.4.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.151.9.dist-info, removed "/usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__pycache__/lstar.cpython-314.pyc /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/lstar.py /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__init__.py"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.151.4.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.151.9.dist-info
  /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa was removed
  /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__init__.py was removed
  /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/lstar.py was removed
  /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__pycache__ was removed
  /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__pycache__/lstar.cpython-314.pyc was removed

--===============9222707640292307960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.151.4.tar.gz;downloadfilename=hypothesis-6.151.4.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.151.9.tar.gz;downloadfilename=hypothesis-6.151.9.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.151.4" to "6.151.9"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.151.4 [default] to 6.151.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.151.4" to "6.151.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.151.4 [default] to 6.151.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.151.4" to "6.151.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.151.4 [default] to 6.151.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.151.4" to "6.151.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.151.4 [default] to 6.151.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.151.4" to "6.151.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.151.4 [default] to 6.151.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.151.4" to "6.151.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.151.4 [default] to 6.151.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.151.4" to "6.151.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.151.4 [default] to 6.151.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.151.4" to "6.151.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.151.4 [default] to 6.151.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.151.4.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.151.9.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.151.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.151.9.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__init__.py /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/lstar.py /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__pycache__/lstar.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.151.4" to "6.151.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.151.4 [default] to 6.151.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3924129 to 3834994 (-2%)
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.151.4.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.151.9.dist-info
  /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa was removed
  /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__init__.py was removed
  /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/lstar.py was removed
  /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__pycache__ was removed
  /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/hypothesis/internal/conjecture/dfa/__pycache__/lstar.cpython-314.pyc was removed

--===============9222707640292307960==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.151.4-6.151.9.patch"

RnJvbSA3ZmU4ODBhNTUxZGJmNTNhMzE4YWE4M2FjYjJhYjlhY2EyNDhhYWFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTM6MDM6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNTEuNCAtPiA2LjE1MS45CgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE1MS40LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1MS45LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE1MS40LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1MS45LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTUxLjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE1MS45LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTUxLjQuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTUxLjku
YmIKaW5kZXggNDI1YjJlNjQ0MS4uMTU3ZTRhMmVlMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTEuNC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE1MS45LmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2NThhNjJkYTFjM2NjYjM2NzQ2YWMyZjdk
YzRiYjFhNmU3NmJkMzE0ZTBkYzU0YzRlMWFhYmEyNTAzZDU1NDVjIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjJmMjg0NDI4ZGRhNmMzYzQ4YzU4MGRlMGUxODQ3MGZmOWM3ZjVlZjYyOGE2NDdlZTgw
MDJmMzhjM2Y5MDk3Y2EiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============9222707640292307960==--

