Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8861EC6FD20
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.12457.1662040786025339084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gcTvgO5/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010182f959c498-37801569-d679-40eb-bc73-99cf86aa42c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=udcZbm3PioevRJEVCmSpngONTm0O68yXQY5detdzbyM=;
	b=gcTvgO5/6RBiUNTMoMlqN4BwStU0dkAxxWOAzzw09VO3ztjiImxSEAd9j+aCRlwR
	4YH7Ef7k7PAPh7QonJznNIZG/CN+OBCbkld+VtIlWS2piIqWyBCz9IxnhxemF2OKEs+
	euVNQ+DoscFaomYYEKfDB1j6TLQSwyUph/125e8g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=udcZbm3PioevRJEVCmSpngONTm0O68yXQY5detdzbyM=;
	b=hMJXX1OzPZydnZ39flRQ2AW2822UiyZR9Us9pKCMflwko8K2PcxSUmaluZddywuC
	pAyRqbmRzAxGExxaVI2mdEIhg/RynmNgQzebBfad/+G93nScZh47+e5DJ4U6D/vbkKE
	1zd3LCch4xmCAhZgNor/qMH9Kid/Xk2ZEwAOvaOg=
Content-Type: multipart/mixed; boundary="===============2420150069575653236=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 5.19 SUCCEEDED
Message-ID: 
 <01010182f959c498-37801569-d679-40eb-bc73-99cf86aa42c1-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170175

--===============2420150069575653236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *5.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-5.18-5.19.patch
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
--===============2420150069575653236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "5.18" to "5.19"
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 5.18 [default] to 5.19 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "5.18" to "5.19"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 5.18 [default] to 5.19 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3396728 to 3442276 (+1%)
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "5.18" to "5.19"
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 5.18 [default] to 5.19 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "5.18" to "5.19"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 5.18 [default] to 5.19 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 39562 to 39648 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "5.18" to "5.19"
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 5.18 [default] to 5.19 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "5.18" to "5.19"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 5.18 [default] to 5.19 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1454970 to 1482732 (+2%)
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "5.18" to "5.19"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 5.18 [default] to 5.19 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: FILELIST: directory renamed /usr/src/debug/ethtool/5.18-r0/uapi/linux -> /usr/src/debug/ethtool/5.19-r0/uapi/linux, directory renamed /usr/src/debug/ethtool/5.18-r0/netlink -> /usr/src/debug/ethtool/5.19-r0/netlink, removed "/usr/src/debug/ethtool/5.18-r0/tg3.c /usr/src/debug/ethtool/5.18-r0/dsa.c /usr/src/debug/ethtool/5.18-r0/fec.c /usr/src/debug/ethtool/5.18-r0/et131x.c /usr/src/debug/ethtool/5.18-r0/e100.c /usr/src/debug/ethtool/5.18-r0/cmis.h /usr/src/debug/ethtool/5.18-r0/de2104x.c /usr/src/debug/ethtool/5.18-r0/lan78xx.c /usr/src/debug/ethtool/5.18-r0/list.h /usr/src/debug/ethtool/5.18-r0/pcnet32.c /usr/src/debug/ethtool/5.18-r0/sfpdiag.c /usr/src/debug/ethtool/5.18-r0/e1000.c /usr/src/debug/ethtool/5.18-r0/vioc.c /usr/src/debug/ethtool/5.18-r0/sff-common.c /usr/src/debug/ethtool/5.18-r0/ethtool.c /usr/src/debug/ethtool/5.18-r0/igb.c /usr/src/debug/ethtool/5.18-r0/realtek.c /usr/src/debug/ethtool/5.18-r0/cmis.c /usr/src/debug/e
 thtool/5.18-r0/vmxnet3.c /usr/src/debug/ethtool/5.18-r0/amd8111e.c /usr/src/debug/ethtool/5.18-r0/igc.c /usr/src/debug/ethtool/5.18-r0/sfpid.c /usr/src/debug/ethtool/5.18-r0/common.h /usr/src/debug/ethtool/5.18-r0/test-cmdline.c /usr/src/debug/ethtool/5.18-r0/sfc.c /usr/src/debug/ethtool/5.18-r0/sff-common.h /usr/src/debug/ethtool/5.18-r0/ixgbe.c /usr/src/debug/ethtool/5.18-r0/ixgbevf.c /usr/src/debug/ethtool/5.18-r0/fjes.c /usr/src/debug/ethtool/5.18-r0/smsc911x.c /usr/src/debug/ethtool/5.18-r0/marvell.c /usr/src/debug/ethtool/5.18-r0/json_print.c /usr/src/debug/ethtool/5.18-r0/fec_8xx.c /usr/src/debug/ethtool/5.18-r0/json_writer.h /usr/src/debug/ethtool/5.18-r0/ixgb.c /usr/src/debug/ethtool/5.18-r0/ibm_emac.c /usr/src/debug/ethtool/5.18-r0/common.c /usr/src/debug/ethtool/5.18-r0/bnxt.c /usr/src/debug/ethtool/5.18-r0/at76c50x-usb.c /usr/src/debug/ethtool/5.18-r0/json_print.h /usr/src/debug/ethtool/5.18-r0/rxclass.c /usr/src/debug/ethtool/5.18-r0/json_writer.c /usr/src/debug/ethtool
 /5.18-r0/tse.c /usr/src/debug/ethtool/5.18-r0/natsemi.c /usr/src/debug/ethtool/5.18-r0/internal.h /usr/src/debug/ethtool/5.18-r0/qsfp.c /usr/src/debug/ethtool/5.18-r0/stmmac.c /usr/src/debug/ethtool/5.18-r0/test-common.c", added "/usr/src/debug/ethtool/5.19-r0/cmis.h /usr/src/debug/ethtool/5.19-r0/cpsw.c /usr/src/debug/ethtool/5.19-r0/igc.c /usr/src/debug/ethtool/5.19-r0/sfpid.c /usr/src/debug/ethtool/5.19-r0/ixgbevf.c /usr/src/debug/ethtool/5.19-r0/fec.c /usr/src/debug/ethtool/5.19-r0/json_writer.h /usr/src/debug/ethtool/5.19-r0/json_print.h /usr/src/debug/ethtool/5.19-r0/common.c /usr/src/debug/ethtool/5.19-r0/vioc.c /usr/src/debug/ethtool/5.19-r0/et131x.c /usr/src/debug/ethtool/5.19-r0/rxclass.c /usr/src/debug/ethtool/5.19-r0/natsemi.c /usr/src/debug/ethtool/5.19-r0/igb.c /usr/src/debug/ethtool/5.19-r0/internal.h /usr/src/debug/ethtool/5.19-r0/json_writer.c /usr/src/debug/ethtool/5.19-r0/lan78xx.c /usr/src/debug/ethtool/5.19-r0/sff-common.h /usr/src/debug/ethtool/5.19-r0/at76c50x
 -usb.c /usr/src/debug/ethtool/5.19-r0/fec_8xx.c /usr/src/debug/ethtool/5.19-r0/smsc911x.c /usr/src/debug/ethtool/5.19-r0/sfc.c /usr/src/debug/ethtool/5.19-r0/test-cmdline.c /usr/src/debug/ethtool/5.19-r0/de2104x.c /usr/src/debug/ethtool/5.19-r0/stmmac.c /usr/src/debug/ethtool/5.19-r0/ibm_emac.c /usr/src/debug/ethtool/5.19-r0/list.h /usr/src/debug/ethtool/5.19-r0/e1000.c /usr/src/debug/ethtool/5.19-r0/test-common.c /usr/src/debug/ethtool/5.19-r0/lan743x.c /usr/src/debug/ethtool/5.19-r0/ixgb.c /usr/src/debug/ethtool/5.19-r0/realtek.c /usr/src/debug/ethtool/5.19-r0/marvell.c /usr/src/debug/ethtool/5.19-r0/vmxnet3.c /usr/src/debug/ethtool/5.19-r0/sfpdiag.c /usr/src/debug/ethtool/5.19-r0/e100.c /usr/src/debug/ethtool/5.19-r0/dsa.c /usr/src/debug/ethtool/5.19-r0/ixgbe.c /usr/src/debug/ethtool/5.19-r0/sff-common.c /usr/src/debug/ethtool/5.19-r0/tg3.c /usr/src/debug/ethtool/5.19-r0/bnxt.c /usr/src/debug/ethtool/5.19-r0/qsfp.c /usr/src/debug/ethtool/5.19-r0/json_print.c /usr/src/debug/ethtoo
 l/5.19-r0/cmis.c /usr/src/debug/ethtool/5.19-r0/tse.c /usr/src/debug/ethtool/5.19-r0/common.h /usr/src/debug/ethtool/5.19-r0/fjes.c /usr/src/debug/ethtool/5.19-r0/amd8111e.c /usr/src/debug/ethtool/5.19-r0/ethtool.c /usr/src/debug/ethtool/5.19-r0/pcnet32.c"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1284335 to 1292476 (+1%)
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "5.18" to "5.19"
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 5.18 [default] to 5.19 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "5.18" to "5.19"
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 5.18 [default] to 5.19 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PKGSIZE changed from 563856 to 572048 (+1%)
packages/core2-32-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-5.18.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-5.19.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-32-poky-linux/ethtool: PV changed from "5.18" to "5.19"
packages/core2-32-poky-linux/ethtool: PKGV changed from 5.18 [default] to 5.19 [default]

--===============2420150069575653236==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ethtool-upgrade-5.18-5.19.patch"

RnJvbSAzODY5NDc5ZjUxZjI2MWNlZDNkZGQyMmIzMjU1NzVlMmVkMWE3NmVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwODowNjoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV0
aHRvb2w6IHVwZ3JhZGUgNS4xOCAtPiA1LjE5CgotLS0KIC4uLi9ldGh0b29sL2V0aHRvb2wvYXZv
aWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggICAgICAgICAgICAgIHwgNiArKystLS0KIC4uLi9ldGh0
b29sL3tldGh0b29sXzUuMTguYmIgPT4gZXRodG9vbF81LjE5LmJifSAgICAgICAgICAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wve2V0aHRvb2xfNS4xOC5iYiA9PiBldGh0
b29sXzUuMTkuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0
aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKaW5kZXgg
NDM5MWE5MTc2Ny4uZjI1MzE2OWRkNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiMDI3MDQ4NmVjYTAyZTFiNzBlZmY3NTE3OTM2ZmFkNzdi
YjFmYjhlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNDBmNzFiYzcyMjJiNmViZjRi
MmE1ZGQ1MTQ4ZjlmZjg2ZDFlNmQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVk
b3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBXZWQsIDI4IE1heSAyMDE0
IDE4OjU5OjU0ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV0aHRvb2w6IHVzZSBzZXJpYWwtdGVz
dHMgY29uZmlnIG5lZWRlZCBieSBwdGVzdC4KQEAgLTE1LDExICsxNSwxMSBAQCBVcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwot
aW5kZXggYzExZjJiMS4uMmJkMmI4MyAxMDA2NDQKK2luZGV4IGNjMzUyNWMuLjg3M2FmOWIgMTAw
NjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTIsNyArMiw3
IEBAIGRubCBQcm9jZXNzIHRoaXMgZmlsZSB3aXRoIGF1dG9jb25mIHRvIHByb2R1Y2UgYSBjb25m
aWd1cmUgc2NyaXB0LgotIEFDX0lOSVQoZXRodG9vbCwgNS4xOCwgbmV0ZGV2QHZnZXIua2VybmVs
Lm9yZykKKyBBQ19JTklUKGV0aHRvb2wsIDUuMTksIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcpCiAg
QUNfUFJFUkVRKDIuNTIpCiAgQUNfQ09ORklHX1NSQ0RJUihbZXRodG9vbC5jXSkKIC1BTV9JTklU
X0FVVE9NQUtFKFtnbnUgc3ViZGlyLW9iamVjdHNdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF81LjE4LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2V0aHRvb2wvZXRodG9vbF81LjE5LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNS4xOC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF81LjE5LmJiCmluZGV4IGI0Zjc0
ZTdmNWIuLjhjOTk1YjIxZTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0
b29sL2V0aHRvb2xfNS4xOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9l
dGh0b29sXzUuMTkuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19N
SVJST1J9L3NvZnR3YXJlL25ldHdvcmsvZXRodG9vbC9ldGh0b29sLSR7UFZ9LnRhci5neiBcCiAg
ICAgICAgICAgIGZpbGU6Ly9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBcCiAgICAgICAgICAg
ICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjcwMDkxZjk1NDQ4ZWJhODUxZjlmOTgwNDA1OWQw
ZTIzN2YxZDkwOTA2NDA0NmY5ZTNjNmRjODkyYWExZThhZmUiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMjQ0MTJkY2Q0YWM4ODYxNzdhYmQ2ODI4MmVmYTk4OTE0YTRkZDI0OTcyMThlMjk4ZTcwNDll
OWNiNzJiMjMzNiIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvcHViL3NvZnR3YXJlL25ldHdvcmsvZXRodG9vbC8iCiAKLS0gCjIuMzEuMQoK

--===============2420150069575653236==--

