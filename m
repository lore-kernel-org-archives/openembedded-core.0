Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37044.1793167562588307558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 23:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=E2wn9wWJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UiknfKF+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1811d92c7-8ed6e96b-1f23-4c29-abc1-a3a4f32a35b7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793167561;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7n9+gikX7rSfTOp+w+yHAE5FcxNANuw/Bfy31HeyZV8=;
	b=E2wn9wWJDQam2VyyT9zZoCLyF15CGLzrLBEGdKEQ570NPrQ19RS2OBZI9FzZMmNM
	EURG1xEaExOgfrVn/pB2IIE3qSDBTyfoIoetP4CGpLpVVIytT3YqbGFyX0M9NW5RpSd
	RCOqjE7DXBxoq6wuu038VjjAvbZ92H6CA1cGimbI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793167561;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7n9+gikX7rSfTOp+w+yHAE5FcxNANuw/Bfy31HeyZV8=;
	b=UiknfKF+G+sYg8LRBWSSLQTPDhlJEKuxwqDduTwJ5dzcuEwW7GyaRKNKRinh7CP8
	VTeMfvfsOPbBOwKfIepmAbbVfQJx8ni2RehWEDS3CR/ZZ+1zDGJlEbwvK/L0DHoMtoe
	XqBmP7+DagdeHP5rpaMAaLLSQt1t7k7z2wknDwCg=
Content-Type: multipart/mixed; boundary="===============2626517617757241887=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.33.0 SUCCEEDED
Message-ID: <010101a1811d92c7-8ed6e96b-1f23-4c29-abc1-a3a4f32a35b7-000000@us-west-2.amazonses.com>
Date: Wed, 28 Oct 2026 06:06:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.28-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 06:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248782

--===============2626517617757241887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hatchling* to *1.33.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.32.4-1.33.0.patch
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
From eea9067fb950baaa8245c93ae861b2b3a4586b6a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 28 Oct 2026 05:50:47 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.32.4 -> 1.33.0

---
 ...{python3-hatchling_1.32.4.bb => python3-hatchling_1.33.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.32.4.bb => python3-hatchling_1.33.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.32.4.bb b/meta/recipes-devtools/python/python3-hatchling_1.33.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.32.4.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.33.0.bb
index 1420625d9e..04a27e6750 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.32.4.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.33.0.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
 
 DEPENDS += "python3-packaging-native python3-pathspec-native python3-pluggy-native python3-tomlkit-native python3-trove-classifiers-native"
 
-SRC_URI[sha256sum] = "c4468f73144c054d2aab4ef0f0378c43b9878bf07f8ffd6b79690e970d375f07"
+SRC_URI[sha256sum] = "4c422bd4d554fcff5de5b73e9596f85e41e9f97f7e553d8f7595ecb31a627bef"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============2626517617757241887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hatchling: PV changed from "1.32.4" to "1.33.0"
packages/x86-64-v3-poky-linux/python3-hatchling: PKGV changed from 1.32.4 [default] to 1.33.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.32.4.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.33.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.32.4" to "1.33.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.32.4 [default] to 1.33.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.32.4" to "1.33.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.32.4 [default] to 1.33.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.32.4" to "1.33.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.32.4 [default] to 1.33.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.32.4" to "1.33.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.32.4 [default] to 1.33.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.32.4" to "1.33.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.32.4 [default] to 1.33.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.32.4" to "1.33.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.32.4 [default] to 1.33.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.32.4" to "1.33.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.32.4 [default] to 1.33.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 722605 to 722656 (+0%)
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hatchling-1.32.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/hatchling-1.33.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hatchling-1.32.4.dist-info -> /usr/lib/python3.14/site-packages/hatchling-1.33.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.32.4.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.33.0.dist-info
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/RECORD was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/RECORD was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/WHEEL was removed

--===============2626517617757241887==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.32.4-1.33.0.patch"

RnJvbSBlZWE5MDY3ZmI5NTBiYWFhODI0NWM5M2FlODYxYjJiM2E0NTg2YjZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjggT2N0IDIwMjYgMDU6NTA6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjMyLjQgLT4gMS4zMy4wCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjMyLjQuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4zMy4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzIu
NC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjMzLjAuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMyLjQuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzMuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzIuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMzLjAuYmIKaW5kZXggMTQyMDYy
NWQ5ZS4uMDRhMjdlNjc1MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjMyLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMzLjAuYmIKQEAgLTcsNiArNyw2IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKIERFUEVORFMgKz0gInB5dGhvbjMtcGFja2FnaW5n
LW5hdGl2ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBsdWdneS1uYXRpdmUgcHl0
aG9uMy10b21sa2l0LW5hdGl2ZSBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzLW5hdGl2ZSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImM0NDY4ZjczMTQ0YzA1NGQyYWFiNGVmMGYwMzc4YzQzYjk4
NzhiZjA3ZjhmZmQ2Yjc5NjkwZTk3MGQzNzVmMDciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGM0
MjJiZDRkNTU0ZmNmZjVkZTViNzNlOTU5NmY4NWU0MWU5Zjk3ZjdlNTUzZDhmNzU5NWVjYjMxYTYy
N2JlZiIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40Ny4xCgo=

--===============2626517617757241887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hatchling-1.32.4.dist-info -> /usr/lib/python3.14/site-packages/hatchling-1.33.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/hatchling-1.32.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/hatchling-1.33.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.32.4.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.33.0.dist-info
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/RECORD was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/RECORD was removed
  /usr/lib/python3.14/site-packages/flit_core-4.2.0.dist-info/WHEEL was removed

--===============2626517617757241887==--
