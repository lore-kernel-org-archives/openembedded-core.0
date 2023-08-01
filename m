Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509D6C04A94
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.17601.1690907330666630348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GhpZl3Wb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ihyzjxW7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010189b1ee4551-72b3912c-2f44-4ed0-a1da-cb8078d2f274-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907330;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/vt8nurENxlr3+n7YxFos1YwC3a6ala0n8eS9zfuh9w=;
	b=GhpZl3Wb0kKINR7YXOMAwUNgpZBRTFij/KI2lbaOrG2f/eMcpXPYsTU4edi2ysgW
	rDv32GMfEIpf8frbgFenhnXQ/U51CA+PNpC+oyuUcRwrLRTKCYwbUakJnc5leEOuWck
	kJRF+emz7gqSNOxXzpnigW/20FMRkv/a+L6Um/yo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907330;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/vt8nurENxlr3+n7YxFos1YwC3a6ala0n8eS9zfuh9w=;
	b=ihyzjxW7OROSP72vuXU0ip9ueZfzW55TQB618HrFoPIPQ3edJWsLBk17n93ZKUL/
	UIPuw7b2qCDZenzSkF+s/4PagdhzTnKGac+EhYmF89Lrcg1dYkHSV7eHsTUDz6xC8D5
	QatE1FE3HpAo15V/J2wktcERxtgvHGiAMwKdOv1A=
Content-Type: multipart/mixed; boundary="===============7703023843315725122=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtc: upgrading to 1.7.0 SUCCEEDED
Message-ID: <01010189b1ee4551-72b3912c-2f44-4ed0-a1da-cb8078d2f274-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185289

--===============7703023843315725122==
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
From abe6a232366d54c9adb31b93a6998c17c14959ad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 09:52:43 +0000
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


--===============7703023843315725122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtc: SRC_URI changed from "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master file://0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch" to "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main file://0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch"
packages/core2-32-poky-linux/python3-dtc: PKGV changed from 1.6.1+gitAUTOINC+c001fc01a4 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc-dbg: PKGSIZE changed from 397820 to 398260 (+0%)
packages/core2-32-poky-linux/python3-dtc/python3-dtc-dbg: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-dbg: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc-dev: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-dev: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc-doc: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-doc: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc-locale: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-locale: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc-src: PKGSIZE changed from 392915 to 391490 (-0%)
packages/core2-32-poky-linux/python3-dtc/python3-dtc-src: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-src: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc-staticdev: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
packages/core2-32-poky-linux/python3-dtc/python3-dtc-staticdev: PV changed from "1.6.1+gitAUTOINC+c001fc01a4" to "1.7.0"
packages/core2-32-poky-linux/python3-dtc/python3-dtc: PKGSIZE changed from 288990 to 285769 (-1%)
packages/core2-32-poky-linux/python3-dtc/python3-dtc: PKGV changed from 1.6.1+git0+c001fc01a4 to 1.7.0 [default]
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

--===============7703023843315725122==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtc-upgrade-1.6.1-1.7.0.patch"

RnJvbSBhYmU2YTIzMjM2NmQ1NGM5YWRiMzFiOTNhNjk5OGMxN2MxNDk1OWFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAwOTo1Mjo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRjOiB1cGdyYWRlIDEuNi4xIC0+IDEuNy4wCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1kdGNfMS42LjEuYmIgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdGNfMS42LjEuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRjXzEuNi4xLmJiCmluZGV4IGE4NjhiZDAxMDku
LmUzZDQ2MzZkMTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1kdGNfMS42LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWR0Y18xLjYuMS5iYgpAQCAtNiwxNyArNiwxNyBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb25s
eSB8IEJTRC0yLUNsYXVzZSIKIAogREVQRU5EUyA9ICJmbGV4LW5hdGl2ZSBiaXNvbi1uYXRpdmUg
c3dpZy1uYXRpdmUgcHl0aG9uMy1zZXR1cHRvb2xzLXNjbS1uYXRpdmUgbGlieWFtbCBkdGMiCiAK
LVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS91dGlscy9kdGMvZHRjLmdp
dDticmFuY2g9bWFzdGVyIFwKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS91dGlscy9kdGMvZHRjLmdpdDticmFuY2g9bWFpbiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LVJldmVydC1saWJmZHQtb3ZlcmxheS1tYWtlLW92ZXJsYXlfZ2V0X3RhcmdldC1wdWJsaWMucGF0
Y2ggXAotICAgICAgICAgICIKKyAgICAgICAgICAgIgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdS
RUdFWCA9ICJ2KD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9weWxpYmZkdC9saWJmZHQuaTtiZWdpbmxpbmU9MTtlbmRsaW5lPTY7bWQ1PWFmZGEwODhj
OTc0MTc0YTI5MTA4YzhkODBiNWRjZTkwIgogCi1TUkNSRVYgPSAiYzAwMWZjMDFhNDNlN2EwNjQ0
N2MwNmVhM2Q1MGJkNjA2NDEzMjJiOCIKK1NSQ1JFViA9ICIwMzlhOTk0MTRlNzc4MzMyZDhmOWMw
NGNiZDMwNzJlMWRjYzYyNzk4IgogCi1QViA9ICIxLjYuMStnaXQke1NSQ1BWfSIKK1BWID0gIjEu
Ny4wIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogUFlQQV9XSEVFTCA9ICIke1N9L2Rpc3QvbGli
ZmR0LTEuNi4yKi53aGwiCi0tIAoyLjM5LjIKCg==

--===============7703023843315725122==
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

--===============7703023843315725122==--

