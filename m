Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CCBC30639
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.173809.1692224344540192985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CIybLZwH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kNRHTnai;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a006e4eba-fc1dbe89-e918-4f78-8972-52a0702a0913-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5WeN1C4wcTsMFbTdUly0Rhi1fJ8+IQZeWyt7ZMeXTuI=;
	b=CIybLZwHMybzXmD5ySHbnCQBSo3kl5+RjMhI2aBTxrYaXbRTQlAAcoGdQnoNQWUg
	OWzIjEc552mEkp2SD2z6TTrp5dSSFat/HPo5G3VUEngtVAA8Ic0QIHlLfYB5FCXegew
	7zU96rXvg2HbPGdYhMBhrjcbBRDVR6vTLwOcxm0A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5WeN1C4wcTsMFbTdUly0Rhi1fJ8+IQZeWyt7ZMeXTuI=;
	b=kNRHTnaiy+wnVNtIwRY09NdvAx6REoBnn1OIPfh6zC4Yreh73EUAVVAqFCWH5rnz
	2LlRN321Dmx7XlUQMQ9vZ4gQM3HKFv/iZVFnAf6W2qc+T8GVt4mkWprcKc8j4G91a0F
	s4OQIbEE6I1fkZsY0BCXO00YM9wBZ6XoTw117a1k=
Content-Type: multipart/mixed; boundary="===============1005973751999088778=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtc: upgrading to 1.7.0 SUCCEEDED
Message-ID: <0101018a006e4eba-fc1dbe89-e918-4f78-8972-52a0702a0913-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186180

--===============1005973751999088778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtc* to *1.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtc-upgrade-1.6.1-1.7.0.patch
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
From c170c74ae6dc2721dcba4202492748e54cc89ebc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 05:05:20 +0000
Subject: [PATCH] python3-dtc: upgrade 1.6.1 -> 1.7.0

---
 meta/recipes-devtools/python/python3-dtc_1.6.1.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-dtc_1.6.1.bb b/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
index a868bd0109..e3d4636d15 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
@@ -6,17 +6,17 @@ LICENSE = "GPL-2.0-only | BSD-2-Clause"
 
 DEPENDS = "flex-native bison-native swig-native python3-setuptools-scm-native libyaml dtc"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main \
            file://0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch \
-          "
+           "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
 
-SRCREV = "c001fc01a43e7a06447c06ea3d50bd60641322b8"
+SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
 
-PV = "1.6.1+git${SRCPV}"
+PV = "1.7.0"
 S = "${WORKDIR}/git"
 
 PYPA_WHEEL = "${S}/dist/libfdt-1.6.2*.whl"
-- 
2.39.2


--===============1005973751999088778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtc: PKGV changed from 1.6.1+gitAUTOINC+c001fc01a4 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc: SRC_URI changed from "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master file://0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch" to "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main file://0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch"
packages/core2-32-poky-linux/python3-dtc/python3-dtc-dbg: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-dbg: PKGSIZE changed from 397820 to 398260 (+0%)
packages/core2-32-poky-linux/python3-dtc/python3-dtc-dbg: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc-dev: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-dev: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc-doc: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-doc: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc-locale: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-locale: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc-src: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-src: PKGSIZE changed from 392915 to 391490 (-0%)
packages/core2-32-poky-linux/python3-dtc/python3-dtc-src: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc-staticdev: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-staticdev: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc: PKGSIZE changed from 288990 to 285769 (-1%)
packages/core2-32-poky-linux/python3-dtc/python3-dtc: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
Changes to packages/core2-32-poky-linux/python3-dtc (sysroot):
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info was added
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info/BSD-2-Clause was added
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info/GPL was added
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info was removed
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info/BSD-2-Clause was removed
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info/GPL was removed
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info/WHEEL was removed

--===============1005973751999088778==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtc-upgrade-1.6.1-1.7.0.patch"

RnJvbSBjMTcwYzc0YWU2ZGMyNzIxZGNiYTQyMDI0OTI3NDhlNTRjYzg5ZWJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDU6MDU6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0YzogdXBncmFkZSAxLjYuMSAtPiAxLjcuMAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRjXzEuNi4xLmJiIHwgOCArKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRjXzEuNi4xLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0Y18xLjYuMS5iYgppbmRleCBhODY4YmQwMTA5
Li5lM2Q0NjM2ZDE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZHRjXzEuNi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1kdGNfMS42LjEuYmIKQEAgLTYsMTcgKzYsMTcgQEAgTElDRU5TRSA9ICJHUEwtMi4wLW9u
bHkgfCBCU0QtMi1DbGF1c2UiCiAKIERFUEVORFMgPSAiZmxleC1uYXRpdmUgYmlzb24tbmF0aXZl
IHN3aWctbmF0aXZlIHB5dGhvbjMtc2V0dXB0b29scy1zY20tbmF0aXZlIGxpYnlhbWwgZHRjIgog
Ci1TUkNfVVJJID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vdXRpbHMvZHRjL2R0Yy5n
aXQ7YnJhbmNoPW1hc3RlciBcCitTUkNfVVJJID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vdXRpbHMvZHRjL2R0Yy5naXQ7YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1SZXZlcnQtbGliZmR0LW92ZXJsYXktbWFrZS1vdmVybGF5X2dldF90YXJnZXQtcHVibGljLnBh
dGNoIFwKLSAgICAgICAgICAiCisgICAgICAgICAgICIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFH
UkVHRVggPSAidig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vcHlsaWJmZHQvbGliZmR0Lmk7YmVnaW5saW5lPTE7ZW5kbGluZT02O21kNT1hZmRhMDg4
Yzk3NDE3NGEyOTEwOGM4ZDgwYjVkY2U5MCIKIAotU1JDUkVWID0gImMwMDFmYzAxYTQzZTdhMDY0
NDdjMDZlYTNkNTBiZDYwNjQxMzIyYjgiCitTUkNSRVYgPSAiMDM5YTk5NDE0ZTc3ODMzMmQ4Zjlj
MDRjYmQzMDcyZTFkY2M2Mjc5OCIKIAotUFYgPSAiMS42LjErZ2l0JHtTUkNQVn0iCitQViA9ICIx
LjcuMCIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIFBZUEFfV0hFRUwgPSAiJHtTfS9kaXN0L2xp
YmZkdC0xLjYuMioud2hsIgotLSAKMi4zOS4yCgo=

--===============1005973751999088778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dtc/python3-dtc-dbg: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-dev: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-doc: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-locale: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-src: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-staticdev: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
Changes to packages/core2-32-poky-linux/python3-dtc (sysroot):
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info was added
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info/BSD-2-Clause was added
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info/GPL was added
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/libfdt-1.7.1.dev0+g039a994.d20230209.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info was removed
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info/BSD-2-Clause was removed
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info/GPL was removed
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/libfdt-1.6.2.dev43+gc001fc0.d20220204.dist-info/WHEEL was removed

--===============1005973751999088778==--

