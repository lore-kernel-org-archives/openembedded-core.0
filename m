Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A6DC25B5B
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.806.1686887482816850072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BzB/cr4M;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010188c2544848-269014a9-34cc-4068-888d-d02d80f117c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Nzc+IWG5OZi+48lOO/2X4OmICkCH5Fm+S6v1zckys28=;
	b=BzB/cr4MrfPoEfRDb/rCnCe1nUKHiaMcNLx/DKWrMrU8RzO0/7DtCZkRQwP82vXV
	xYa20Z9IR+EzG0gUzSjw81CCD690GQ++SY4uFkt8egzwt9pwXhcC9tDzP4qLOPxtbhC
	n/xX07S3BEHh7trCbk/x4Sk1xZDVpGvRlDZp3XZ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Nzc+IWG5OZi+48lOO/2X4OmICkCH5Fm+S6v1zckys28=;
	b=DO//1ytVvvuYvyRpdwCvI+7q7g1KfQA6ZYdoUG1BquGv4t/VNItC5tdrRT4OO2bZ
	HUZoJ+PATr0jro/Yls3v+nKT0Dux13SGEAiTPtjyQtUppC//Nh8bjDGZOmKcta3GQ+7
	uuZ+1TvHJOdqwrdUcNcrafBeWkzYOD9lzwvWFzWw=
Content-Type: multipart/mixed; boundary="===============3121701006196435924=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.3 SUCCEEDED
Message-ID: <01010188c2544848-269014a9-34cc-4068-888d-d02d80f117c5-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182939

--===============3121701006196435924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.2-6.3.patch
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
From 3d714fbbbe10661883c8dc685ef702e54dd0f1d2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 15:38:49 +0000
Subject: [PATCH] ethtool: upgrade 6.2 -> 6.3

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.2.bb => ethtool_6.3.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.2.bb => ethtool_6.3.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index d5cb8705c2..58d7e91adf 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From b4ec6635af4d4a47e9ab7bbd5347e78710d19362 Mon Sep 17 00:00:00 2001
+From 1d3786772fac037cccc6ee70f9a0ff473463140a Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index ebdfd39..c93b79a 100644
+index c1e0012..c460398 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 6.2, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 6.3, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.2.bb b/meta/recipes-extended/ethtool/ethtool_6.3.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.2.bb
rename to meta/recipes-extended/ethtool/ethtool_6.3.bb
index aea03b729d..504e645966 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.2.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "1a9f95c3d8c1795a942220912d72c06a208f1c122a78f7690259402856ff06a0"
+SRC_URI[sha256sum] = "342d37d3fe19da79d0276c4c69c34c61f1ad8f87b06514d664bf1eeb29bfd525"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.39.2


--===============3121701006196435924==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ethtool-upgrade-6.2-6.3.patch"

RnJvbSAzZDcxNGZiYmJlMTA2NjE4ODNjOGRjNjg1ZWY3MDJlNTRkZDBmMWQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTU6Mzg6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
dGh0b29sOiB1cGdyYWRlIDYuMiAtPiA2LjMKCi0tLQogLi4uL2V0aHRvb2wvZXRodG9vbC9hdm9p
ZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCAgICAgICAgICAgICAgfCA2ICsrKy0tLQogLi4uL2V0aHRv
b2wve2V0aHRvb2xfNi4yLmJiID0+IGV0aHRvb2xfNi4zLmJifSAgICAgICAgICAgICAgfCAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC97ZXRodG9vbF82LjIuYmIgPT4gZXRodG9v
bF82LjMuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRv
b2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKaW5kZXggZDVj
Yjg3MDVjMi4uNThkN2U5MWFkZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0
aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBiNGVjNjYzNWFmNGQ0YTQ3ZTlhYjdiYmQ1MzQ3ZTc4NzEwZDE5
MzYyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxZDM3ODY3NzJmYWMwMzdjY2NjNmVl
NzBmOWEwZmY0NzM0NjMxNDBhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVkb3Ig
RmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBXZWQsIDI4IE1heSAyMDE0IDE4
OjU5OjU0ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV0aHRvb2w6IHVzZSBzZXJpYWwtdGVzdHMg
Y29uZmlnIG5lZWRlZCBieSBwdGVzdC4KQEAgLTE1LDExICsxNSwxMSBAQCBVcHN0cmVhbS1TdGF0
dXM6IEluYXBwcm9wcmlhdGUKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5k
ZXggZWJkZmQzOS4uYzkzYjc5YSAxMDA2NDQKK2luZGV4IGMxZTAwMTIuLmM0NjAzOTggMTAwNjQ0
CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTIsNyArMiw3IEBA
IGRubCBQcm9jZXNzIHRoaXMgZmlsZSB3aXRoIGF1dG9jb25mIHRvIHByb2R1Y2UgYSBjb25maWd1
cmUgc2NyaXB0LgotIEFDX0lOSVQoZXRodG9vbCwgNi4yLCBuZXRkZXZAdmdlci5rZXJuZWwub3Jn
KQorIEFDX0lOSVQoZXRodG9vbCwgNi4zLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnKQogIEFDX1BS
RVJFUSgyLjUyKQogIEFDX0NPTkZJR19TUkNESVIoW2V0aHRvb2wuY10pCiAtQU1fSU5JVF9BVVRP
TUFLRShbZ251IHN1YmRpci1vYmplY3RzXSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9ldGh0b29sL2V0aHRvb2xfNi4yLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRv
b2wvZXRodG9vbF82LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNi4zLmJiCmluZGV4IGFlYTAzYjcyOWQuLjUw
NGU2NDU5NjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRv
b2xfNi4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNi4z
LmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9zb2Z0
d2FyZS9uZXR3b3JrL2V0aHRvb2wvZXRodG9vbC0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBm
aWxlOi8vYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICIxYTlmOTVjM2Q4YzE3OTVhOTQyMjIwOTEyZDcyYzA2YTIwOGYxYzEy
MmE3OGY3NjkwMjU5NDAyODU2ZmYwNmEwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM0MmQzN2Qz
ZmUxOWRhNzlkMDI3NmM0YzY5YzM0YzYxZjFhZDhmODdiMDY1MTRkNjY0YmYxZWViMjliZmQ1MjUi
CiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9zb2Z0
d2FyZS9uZXR3b3JrL2V0aHRvb2wvIgogCi0tIAoyLjM5LjIKCg==

--===============3121701006196435924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGSIZE changed from 24547 to 24621 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3626984 to 3765416 (+4%)
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 39968 to 47818 (+20%)
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1544678 to 1594796 (+3%)
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: FILELIST: directory renamed /usr/src/debug/ethtool/6.2-r0 -> /usr/src/debug/ethtool/6.3-r0, directory renamed /usr/src/debug/ethtool/6.2-r0/uapi/linux -> /usr/src/debug/ethtool/6.3-r0/uapi/linux, directory renamed /usr/src/debug/ethtool/6.2-r0/uapi/linux/hdlc -> /usr/src/debug/ethtool/6.3-r0/uapi/linux/hdlc, removed "/usr/src/debug/ethtool/6.2-r0/netlink/rss.c /usr/src/debug/ethtool/6.2-r0/netlink/prettymsg.c /usr/src/debug/ethtool/6.2-r0/netlink/features.c /usr/src/debug/ethtool/6.2-r0/netlink/prettymsg.h /usr/src/debug/ethtool/6.2-r0/netlink/bitset.h /usr/src/debug/ethtool/6.2-r0/netlink/permaddr.c /usr/src/debug/ethtool/6.2-r0/netlink/bitset.c /usr/src/debug/ethtool/6.2-r0/netlink/pause.c /usr/src/debug/ethtool/6.2-r0/netlink/privflags.c /usr/src/debug/ethtool/6.2-r0/netlink/desc-ethtool.c /usr/src/debug/ethtool/6.2-r0/netlink/tsinfo.c /usr/src/debug/ethtool/6.2-r0/netlink/extapi.h /usr/src/debug/ethtool/6.2-r0/netlink/rings.c /usr
 /src/debug/ethtool/6.2-r0/netlink/msgbuff.c /usr/src/debug/ethtool/6.2-r0/netlink/netlink.c /usr/src/debug/ethtool/6.2-r0/netlink/stats.c /usr/src/debug/ethtool/6.2-r0/netlink/strset.c /usr/src/debug/ethtool/6.2-r0/netlink/msgbuff.h /usr/src/debug/ethtool/6.2-r0/netlink/netlink.h /usr/src/debug/ethtool/6.2-r0/netlink/channels.c /usr/src/debug/ethtool/6.2-r0/netlink/coalesce.c /usr/src/debug/ethtool/6.2-r0/netlink/strset.h /usr/src/debug/ethtool/6.2-r0/netlink/parser.h /usr/src/debug/ethtool/6.2-r0/netlink/tunnels.c /usr/src/debug/ethtool/6.2-r0/netlink/fec.c /usr/src/debug/ethtool/6.2-r0/netlink/module-eeprom.c /usr/src/debug/ethtool/6.2-r0/netlink/nlsock.c /usr/src/debug/ethtool/6.2-r0/netlink/parser.c /usr/src/debug/ethtool/6.2-r0/netlink/nlsock.h /usr/src/debug/ethtool/6.2-r0/netlink/settings.c /usr/src/debug/ethtool/6.2-r0/netlink/eee.c /usr/src/debug/ethtool/6.2-r0/netlink/module.c /usr/src/debug/ethtool/6.2-r0/netlink/cable_test.c /usr/src/debug/ethtool/6.2-r0/netlink/desc-rtn
 l.c /usr/src/debug/ethtool/6.2-r0/netlink/monitor.c /usr/src/debug/ethtool/6.2-r0/netlink/desc-genlctrl.c", added "/usr/src/debug/ethtool/6.3-r0/netlink/rss.c /usr/src/debug/ethtool/6.3-r0/netlink/prettymsg.c /usr/src/debug/ethtool/6.3-r0/netlink/features.c /usr/src/debug/ethtool/6.3-r0/netlink/prettymsg.h /usr/src/debug/ethtool/6.3-r0/netlink/bitset.h /usr/src/debug/ethtool/6.3-r0/netlink/bitset.c /usr/src/debug/ethtool/6.3-r0/netlink/permaddr.c /usr/src/debug/ethtool/6.3-r0/netlink/pause.c /usr/src/debug/ethtool/6.3-r0/netlink/privflags.c /usr/src/debug/ethtool/6.3-r0/netlink/desc-ethtool.c /usr/src/debug/ethtool/6.3-r0/netlink/tsinfo.c /usr/src/debug/ethtool/6.3-r0/netlink/mm.c /usr/src/debug/ethtool/6.3-r0/netlink/extapi.h /usr/src/debug/ethtool/6.3-r0/netlink/rings.c /usr/src/debug/ethtool/6.3-r0/netlink/msgbuff.c /usr/src/debug/ethtool/6.3-r0/netlink/netlink.c /usr/src/debug/ethtool/6.3-r0/netlink/stats.c /usr/src/debug/ethtool/6.3-r0/netlink/strset.c /usr/src/debug/ethtool/6.
 3-r0/netlink/msgbuff.h /usr/src/debug/ethtool/6.3-r0/netlink/netlink.h /usr/src/debug/ethtool/6.3-r0/netlink/channels.c /usr/src/debug/ethtool/6.3-r0/netlink/coalesce.c /usr/src/debug/ethtool/6.3-r0/netlink/strset.h /usr/src/debug/ethtool/6.3-r0/netlink/parser.h /usr/src/debug/ethtool/6.3-r0/netlink/pse-pd.c /usr/src/debug/ethtool/6.3-r0/netlink/tunnels.c /usr/src/debug/ethtool/6.3-r0/netlink/fec.c /usr/src/debug/ethtool/6.3-r0/netlink/module-eeprom.c /usr/src/debug/ethtool/6.3-r0/netlink/nlsock.c /usr/src/debug/ethtool/6.3-r0/netlink/parser.c /usr/src/debug/ethtool/6.3-r0/netlink/nlsock.h /usr/src/debug/ethtool/6.3-r0/netlink/settings.c /usr/src/debug/ethtool/6.3-r0/netlink/eee.c /usr/src/debug/ethtool/6.3-r0/netlink/module.c /usr/src/debug/ethtool/6.3-r0/netlink/cable_test.c /usr/src/debug/ethtool/6.3-r0/netlink/desc-rtnl.c /usr/src/debug/ethtool/6.3-r0/netlink/monitor.c /usr/src/debug/ethtool/6.3-r0/netlink/plca.c /usr/src/debug/ethtool/6.3-r0/netlink/desc-genlctrl.c"
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1332537 to 1362532 (+2%)
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool: PKGSIZE changed from 600816 to 617200 (+3%)
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.2.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.3.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-32-poky-linux/ethtool: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool: PKGV changed from 6.2 [default] to 6.3 [default]

--===============3121701006196435924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 39968 to 47818 (+20%)

--===============3121701006196435924==--

