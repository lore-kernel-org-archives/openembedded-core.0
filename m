Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E36CA9ECC
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.3712.1684186747944154153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Oi4wDKgL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188215a574b-6002bfd8-650f-4455-8fb3-545c4c5e542a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SQWZwUGDKcGt36ThqfvuCrdM+FcWtJaNx0re/KCsxc4=;
	b=Oi4wDKgL6sEBXPBogwxwb+Tj3w1be11fMs36vLzmzQWTgtSLr+oZ8jVnoj0AjRzF
	zJw0W3+BSWaJlhLEhJVIxM7brOuY8EAA2SxFCT4LWGq07l6syK5c+4cXFvlU9yL+kX3
	DHvTx6Nhi7dWDvS5Jkb5KmQXfjmWeGfEA2TcO6rc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SQWZwUGDKcGt36ThqfvuCrdM+FcWtJaNx0re/KCsxc4=;
	b=a0mSdWsi+iQOt/rRxi9Px/rqO4ivdLWeCYDGXxr+ku/9YeKfkK6QfVQBQKV2Z1N7
	XTmcGtkYuxCHgCXYMBLgBFwAgRHClryU28x6flF+7BbU2oJQj3Z9pGCMeDmlQ5frU6t
	qwoYfW0PeMqsPuKawWXGeul/qFIs+boZQTwT/WU4=
Content-Type: multipart/mixed; boundary="===============0615448794621904341=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.3 SUCCEEDED
Message-ID: <01010188215a574b-6002bfd8-650f-4455-8fb3-545c4c5e542a-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181331

--===============0615448794621904341==
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
--===============0615448794621904341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGSIZE changed from 24547 to 24621 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3600052 to 3736844 (+4%)
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 39968 to 47818 (+20%)
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1544638 to 1594756 (+3%)
packages/core2-32-poky-linux/ethtool/ethtool-src: FILELIST: directory renamed /usr/src/debug/ethtool/6.2-r0/uapi/linux -> /usr/src/debug/ethtool/6.3-r0/uapi/linux, directory renamed /usr/src/debug/ethtool/6.2-r0/uapi/linux/hdlc -> /usr/src/debug/ethtool/6.3-r0/uapi/linux/hdlc, directory renamed /usr/src/debug/ethtool/6.2-r0 -> /usr/src/debug/ethtool/6.3-r0, removed "/usr/src/debug/ethtool/6.2-r0/netlink/rss.c /usr/src/debug/ethtool/6.2-r0/netlink/module-eeprom.c /usr/src/debug/ethtool/6.2-r0/netlink/strset.c /usr/src/debug/ethtool/6.2-r0/netlink/bitset.c /usr/src/debug/ethtool/6.2-r0/netlink/extapi.h /usr/src/debug/ethtool/6.2-r0/netlink/channels.c /usr/src/debug/ethtool/6.2-r0/netlink/desc-ethtool.c /usr/src/debug/ethtool/6.2-r0/netlink/bitset.h /usr/src/debug/ethtool/6.2-r0/netlink/strset.h /usr/src/debug/ethtool/6.2-r0/netlink/features.c /usr/src/debug/ethtool/6.2-r0/netlink/privflags.c /usr/src/debug/ethtool/6.2-r0/netlink/parser.c /usr/src/debug/ethtool/6.2-r0/netlink/tunnels.c 
 /usr/src/debug/ethtool/6.2-r0/netlink/desc-genlctrl.c /usr/src/debug/ethtool/6.2-r0/netlink/parser.h /usr/src/debug/ethtool/6.2-r0/netlink/eee.c /usr/src/debug/ethtool/6.2-r0/netlink/monitor.c /usr/src/debug/ethtool/6.2-r0/netlink/pause.c /usr/src/debug/ethtool/6.2-r0/netlink/module.c /usr/src/debug/ethtool/6.2-r0/netlink/nlsock.c /usr/src/debug/ethtool/6.2-r0/netlink/permaddr.c /usr/src/debug/ethtool/6.2-r0/netlink/nlsock.h /usr/src/debug/ethtool/6.2-r0/netlink/settings.c /usr/src/debug/ethtool/6.2-r0/netlink/prettymsg.h /usr/src/debug/ethtool/6.2-r0/netlink/rings.c /usr/src/debug/ethtool/6.2-r0/netlink/netlink.h /usr/src/debug/ethtool/6.2-r0/netlink/cable_test.c /usr/src/debug/ethtool/6.2-r0/netlink/prettymsg.c /usr/src/debug/ethtool/6.2-r0/netlink/coalesce.c /usr/src/debug/ethtool/6.2-r0/netlink/fec.c /usr/src/debug/ethtool/6.2-r0/netlink/msgbuff.h /usr/src/debug/ethtool/6.2-r0/netlink/tsinfo.c /usr/src/debug/ethtool/6.2-r0/netlink/msgbuff.c /usr/src/debug/ethtool/6.2-r0/netlink/
 stats.c /usr/src/debug/ethtool/6.2-r0/netlink/desc-rtnl.c /usr/src/debug/ethtool/6.2-r0/netlink/netlink.c", added "/usr/src/debug/ethtool/6.3-r0/netlink/rss.c /usr/src/debug/ethtool/6.3-r0/netlink/module-eeprom.c /usr/src/debug/ethtool/6.3-r0/netlink/strset.c /usr/src/debug/ethtool/6.3-r0/netlink/bitset.c /usr/src/debug/ethtool/6.3-r0/netlink/extapi.h /usr/src/debug/ethtool/6.3-r0/netlink/desc-rtnl.c /usr/src/debug/ethtool/6.3-r0/netlink/bitset.h /usr/src/debug/ethtool/6.3-r0/netlink/channels.c /usr/src/debug/ethtool/6.3-r0/netlink/desc-ethtool.c /usr/src/debug/ethtool/6.3-r0/netlink/strset.h /usr/src/debug/ethtool/6.3-r0/netlink/features.c /usr/src/debug/ethtool/6.3-r0/netlink/privflags.c /usr/src/debug/ethtool/6.3-r0/netlink/parser.c /usr/src/debug/ethtool/6.3-r0/netlink/tunnels.c /usr/src/debug/ethtool/6.3-r0/netlink/desc-genlctrl.c /usr/src/debug/ethtool/6.3-r0/netlink/parser.h /usr/src/debug/ethtool/6.3-r0/netlink/eee.c /usr/src/debug/ethtool/6.3-r0/netlink/monitor.c /usr/src/d
 ebug/ethtool/6.3-r0/netlink/mm.c /usr/src/debug/ethtool/6.3-r0/netlink/pause.c /usr/src/debug/ethtool/6.3-r0/netlink/module.c /usr/src/debug/ethtool/6.3-r0/netlink/nlsock.c /usr/src/debug/ethtool/6.3-r0/netlink/permaddr.c /usr/src/debug/ethtool/6.3-r0/netlink/nlsock.h /usr/src/debug/ethtool/6.3-r0/netlink/settings.c /usr/src/debug/ethtool/6.3-r0/netlink/prettymsg.h /usr/src/debug/ethtool/6.3-r0/netlink/rings.c /usr/src/debug/ethtool/6.3-r0/netlink/cable_test.c /usr/src/debug/ethtool/6.3-r0/netlink/plca.c /usr/src/debug/ethtool/6.3-r0/netlink/prettymsg.c /usr/src/debug/ethtool/6.3-r0/netlink/pse-pd.c /usr/src/debug/ethtool/6.3-r0/netlink/coalesce.c /usr/src/debug/ethtool/6.3-r0/netlink/fec.c /usr/src/debug/ethtool/6.3-r0/netlink/msgbuff.h /usr/src/debug/ethtool/6.3-r0/netlink/tsinfo.c /usr/src/debug/ethtool/6.3-r0/netlink/msgbuff.c /usr/src/debug/ethtool/6.3-r0/netlink/stats.c /usr/src/debug/ethtool/6.3-r0/netlink/netlink.h /usr/src/debug/ethtool/6.3-r0/netlink/netlink.c"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1332537 to 1362532 (+2%)
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool: PKGSIZE changed from 600816 to 617200 (+3%)
packages/core2-32-poky-linux/ethtool: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.2.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.3.tar.gz file://run-ptest file://avoid_parallel_tests.patch"

--===============0615448794621904341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 39968 to 47818 (+20%)

--===============0615448794621904341==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ethtool-upgrade-6.2-6.3.patch"

RnJvbSBhNzI2NzVkMTBiNWE3ZGEyZGE4MTg2N2Q4MjAxNzM0ODU5NzRiOGNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTQ6MDg6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
dGh0b29sOiB1cGdyYWRlIDYuMiAtPiA2LjMKCi0tLQogLi4uL2V0aHRvb2wvZXRodG9vbC9hdm9p
ZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCAgICAgICAgICAgICAgfCA2ICsrKy0tLQogLi4uL2V0aHRv
b2wve2V0aHRvb2xfNi4yLmJiID0+IGV0aHRvb2xfNi4zLmJifSAgICAgICAgICAgICAgfCAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC97ZXRodG9vbF82LjIuYmIgPT4gZXRodG9v
bF82LjMuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRv
b2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKaW5kZXggZDVj
Yjg3MDVjMi4uOGM5NDFiY2Y5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0
aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBiNGVjNjYzNWFmNGQ0YTQ3ZTlhYjdiYmQ1MzQ3ZTc4NzEwZDE5
MzYyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNWU1MzM1NzcyMDhlMmNlMTQ2NTU3
M2EwYTlhMjNmNDRlYWRiZGU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVkb3Ig
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

--===============0615448794621904341==--

