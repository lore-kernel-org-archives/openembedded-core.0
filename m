Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA7BC64ED9
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.24448.1665871392851934143
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eUg7b3uc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010183ddac30d6-d8238394-e547-4b5a-a3bc-92b2405ad44d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/bL/P+UAIdK5A0rIkYBi71bU2PCyLZGcCu9yLeeLiyI=;
	b=eUg7b3ucdiOmT823R+1XJZex7p2qHwHjO/d/L93TEaQ4E9kh9iA2Xigu/7NsR4OS
	QquB76w9HkiKZSywS35ivt9YS8WYUfZf0Rb5mt9z5MwcctWFA7WqKY9IkrKFi5g8Mtj
	EdyHV2M2u/k3M8SLMTDgG9fhZhRUUal9tI+OC6ZY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/bL/P+UAIdK5A0rIkYBi71bU2PCyLZGcCu9yLeeLiyI=;
	b=QptZs2A/uH0T09B7FdJohVRDm5TRCp+lkPWGNobiwQLSbHXi1kQXHn0HX2Mj7vMi
	AmfqE6JReDaoakd7IpN+GWySAIpfQfO5WuX7e1K/KIB0J51hqZq4DGPfA2YZTQDAH8e
	5x2Aw6EMTamGKIKcXxMV7J9vMLQ67BtlVRSrN9nY=
Content-Type: multipart/mixed; boundary="===============1880220967628460266=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtd-utils: upgrading to 2.1.5 SUCCEEDED
Message-ID: <01010183ddac30d6-d8238394-e547-4b5a-a3bc-92b2405ad44d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171758

--===============1880220967628460266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtd-utils* to *2.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtd-utils-upgrade-2.1.4-2.1.5.patch
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
--===============1880220967628460266==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtd-utils-upgrade-2.1.4-2.1.5.patch"

RnJvbSAwM2QzOTkwZjExOWJhMGJjNGViN2IyM2ExYmNhZDBiMTQwOWI3NmY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDk6Mjk6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
dGQtdXRpbHM6IHVwZ3JhZGUgMi4xLjQgLT4gMi4xLjUKCi0tLQogLi4udXNlZC1saW51eC1mcy5o
LWhlYWRlci1mcm9tLWluY2x1ZGVzLnBhdGNoIHwgMzEgLS0tLS0tLS0tLS0tLS0tLS0tLQogbWV0
YS9yZWNpcGVzLWRldnRvb2xzL210ZC9tdGQtdXRpbHNfZ2l0LmJiICAgIHwgIDggKystLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRkL210ZC11dGlscy8wMDAxLXRlc3Rz
LVJlbW92ZS11bnVzZWQtbGludXgtZnMuaC1oZWFkZXItZnJvbS1pbmNsdWRlcy5wYXRjaAoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdGQvbXRkLXV0aWxzLzAwMDEtdGVzdHMt
UmVtb3ZlLXVudXNlZC1saW51eC1mcy5oLWhlYWRlci1mcm9tLWluY2x1ZGVzLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL210ZC9tdGQtdXRpbHMvMDAwMS10ZXN0cy1SZW1vdmUtdW51c2Vk
LWxpbnV4LWZzLmgtaGVhZGVyLWZyb20taW5jbHVkZXMucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDczZDRhODQ3NWYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL210ZC9tdGQtdXRpbHMvMDAwMS10ZXN0cy1SZW1vdmUtdW51c2VkLWxpbnV4LWZzLmgt
aGVhZGVyLWZyb20taW5jbHVkZXMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzMSArMCwwIEBA
Ci1Gcm9tIDZmYjEwYmQxODQ4OGVkODQ3NzY2NzViYzFiMjk4MjgwMGE1MWQ4MzkgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0
ZTogU2F0LCA2IEF1ZyAyMDIyIDIwOjE0OjM4IC0wNzAwCi1TdWJqZWN0OiBbbXRkLXV0aWxzXVtQ
QVRDSF0gdGVzdHM6IFJlbW92ZSB1bnVzZWQgbGludXgvZnMuaCBoZWFkZXIgZnJvbSBpbmNsdWRl
cwotCi1UaGlzIGhlYWRlciBpcyBub3QgbmVlZGVkLCBtb3Jlb3ZlciBpdCBpbmNsdWRlcyBsaW51
eC9tb3VudC5oIHdoaWNoIGlzCi1ub3cgaW4gY29uZmxpY3RbMV0gd2l0aCBnbGliYyBwcm92aWRl
ZCBzeXMvbW91bnQuaCBmcm9tIGdsaWJjIDIuMzYgb253YXJkcwotCi1bMV0gaHR0cHM6Ly9zb3Vy
Y2V3YXJlLm9yZy9nbGliYy93aWtpL1JlbGVhc2UvMi4zNgotCi1VcHN0cmVhbS1TdGF0dXM6IFN1
Ym1pdHRlZCBbaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1tdGQv
MjAyMi1BdWd1c3QvMDk0NjY3Lmh0bWxdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgotLS0tCi0gdGVzdHMvZnMtdGVzdHMvbGliL3Rlc3RzLmMgfCAxIC0KLSAx
IGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvdGVzdHMvZnMtdGVz
dHMvbGliL3Rlc3RzLmMgYi90ZXN0cy9mcy10ZXN0cy9saWIvdGVzdHMuYwotaW5kZXggZDFhMmUw
Yy4uM2RiMDQyNiAxMDA2NDQKLS0tLSBhL3Rlc3RzL2ZzLXRlc3RzL2xpYi90ZXN0cy5jCi0rKysg
Yi90ZXN0cy9mcy10ZXN0cy9saWIvdGVzdHMuYwotQEAgLTM1LDcgKzM1LDYgQEAKLSAjaW5jbHVk
ZSA8c3lzL3Zmcy5oPgotICNpbmNsdWRlIDxzeXMvbW91bnQuaD4KLSAjaW5jbHVkZSA8c3lzL3N0
YXR2ZnMuaD4KLS0jaW5jbHVkZSA8bGludXgvZnMuaD4KLSAjaW5jbHVkZSA8bGludXgvamZmczIu
aD4KLSAKLSAjaW5jbHVkZSAidGVzdHMuaCIKLS0tIAotMi4zNy4xCi0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tdGQvbXRkLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tdGQvbXRkLXV0aWxzX2dpdC5iYgppbmRleCA5NDM2NjZlNTI5Li4yZDc2OTkxZDJm
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRkL210ZC11dGlsc19naXQuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210ZC9tdGQtdXRpbHNfZ2l0LmJiCkBAIC0xMSwx
MiArMTEsMTAgQEAgaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIHVwZGF0ZS1hbHRlcm5hdGl2
ZXMKIERFUEVORFMgPSAiemxpYiBlMmZzcHJvZ3MgdXRpbC1saW51eCIKIFJERVBFTkRTOm10ZC11
dGlscy10ZXN0cyArPSAiYmFzaCIKIAotUFYgPSAiMi4xLjQiCitQViA9ICIyLjEuNSIKIAotU1JD
UkVWID0gImM3ZjFiZmE0NGE4NGQwMjA2MTc4N2UyZjYwOTNkZjVjYzQwYjlmNWMiCi1TUkNfVVJJ
ID0gImdpdDovL2dpdC5pbmZyYWRlYWQub3JnL210ZC11dGlscy5naXQ7YnJhbmNoPW1hc3RlciBc
Ci0gICAgICAgICAgIGZpbGU6Ly8wMDAxLXRlc3RzLVJlbW92ZS11bnVzZWQtbGludXgtZnMuaC1o
ZWFkZXItZnJvbS1pbmNsdWRlcy5wYXRjaCBcCi0gICAgICAgICAgICIKK1NSQ1JFViA9ICIzZjNi
NGNjNmMzMTIwMTA3ZTdhYWEyMWM2NDE1NzcyYTI1NWFjNDljIgorU1JDX1VSSSA9ICJnaXQ6Ly9n
aXQuaW5mcmFkZWFkLm9yZy9tdGQtdXRpbHMuZ2l0O2JyYW5jaD1tYXN0ZXIiCiAKIFMgPSAiJHtX
T1JLRElSfS9naXQiCiAKLS0gCjIuMzEuMQoK

--===============1880220967628460266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtd-utils: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils: SRC_URI changed from "git://git.infradead.org/mtd-utils.git;branch=master file://0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch" to "git://git.infradead.org/mtd-utils.git;branch=master"
packages/core2-32-poky-linux/mtd-utils: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PKGSIZE changed from 6269572 to 6271856 (+0%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dev: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dev: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-doc: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-doc: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-jffs2: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-jffs2: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-locale: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-locale: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-misc: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-misc: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PKGSIZE changed from 1427768 to 1428194 (+0%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-staticdev: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-staticdev: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-tests: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-tests: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PKGV changed from 2.1.4 [default] to 2.1.5 [default]

--===============1880220967628460266==--

