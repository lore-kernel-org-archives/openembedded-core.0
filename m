Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BCCC63719
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.46773.1669908627722172798
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FNpjiN9O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010184ce4f7de0-f85ca5c7-0ff8-4c10-a056-941ebd69bf54-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lo++NeHOFfu0PUUvP6Up2st95gW25g+wD09FNyxfAp4=;
	b=FNpjiN9O3g2RthQYMAHvTOjWnRAMnrjXbTH0YlzI4upZkL9ErQQLk6QpFZFdlqRs
	y1qv0G81J+NrWtnTPCzqdRgdvbXYxij9HXmCYskBDNZ80fIoWt0ZR/kkLIRyVzj1kBv
	mE3ixqmHcJdC7UTZCPEN5y7shOEEeXYG5viwBEsU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lo++NeHOFfu0PUUvP6Up2st95gW25g+wD09FNyxfAp4=;
	b=KiLfquSTsvBWVJRWcknFAztgooDu2fhG4fkc15pVVHgnmp8GOrcrZxzpsCnMXclW
	FdhXYQAckuMmZ9HGexXg7KCvY4+RdKxr3oYLTXQLoqNFni9dfFUSHQ/M1Td+sZRt2dN
	gws9TFwxFq4KfQjgeokY76YJ/b8qKUSEeCoihvqY=
Content-Type: multipart/mixed; boundary="===============4268655208974290449=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] texinfo: upgrading to 7.0.1 SUCCEEDED
Message-ID: <01010184ce4f7de0-f85ca5c7-0ff8-4c10-a056-941ebd69bf54-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174164

--===============4268655208974290449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *texinfo* to *7.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-texinfo-upgrade-7.0-7.0.1.patch
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
--===============4268655208974290449==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-texinfo-upgrade-7.0-7.0.1.patch"

RnJvbSBkMzdkOGFmNWY2ZTM2MzYwNTk0MmJmNjNlN2FmZjY1OWNjMDUxZDQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMToxMDo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRl
eGluZm86IHVwZ3JhZGUgNy4wIC0+IDcuMC4xCgotLS0KIC4uLi90ZXhpbmZvL3RleGluZm8vZG9u
dC1kZXBlbmQtb24taGVscDJtYW4ucGF0Y2ggICAgICAgICAgIHwgNiArKystLS0KIC4uLi90ZXhp
bmZvL3t0ZXhpbmZvXzcuMC5iYiA9PiB0ZXhpbmZvXzcuMC4xLmJifSAgICAgICAgICAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RleGluZm8ve3RleGluZm9fNy4wLmJiID0+IHRleGlu
Zm9fNy4wLjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Rl
eGluZm8vdGV4aW5mby9kb250LWRlcGVuZC1vbi1oZWxwMm1hbi5wYXRjaCBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC90ZXhpbmZvL3RleGluZm8vZG9udC1kZXBlbmQtb24taGVscDJtYW4ucGF0Y2gK
aW5kZXggOTY5ZTI4NDRjZC4uNTk3MzgzNDM2NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3RleGluZm8vdGV4aW5mby9kb250LWRlcGVuZC1vbi1oZWxwMm1hbi5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGV4aW5mby90ZXhpbmZvL2RvbnQtZGVwZW5kLW9uLWhl
bHAybWFuLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhMjIzMDEyNTA4MjAwMGExYjI4YjM4
NjdmODZiYWE4ZDgwYjYzZGYyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlOTdlOTc3
OTFkN2JjOGY2MjkxZWE4M2MxMjJmMzBmZGI2NmU4MTEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogRWR3aW4gUGxhdWNodSA8ZWR3aW4ucGxhdWNodS5jYW1hY2hvQGludGVsLmNvbT4K
IERhdGU6IFR1ZSwgMjkgTm92IDIwMTYgMTM6NDM6MjQgLTA2MDAKIFN1YmplY3Q6IFtQQVRDSF0g
ZG9udC1kZXBlbmQtb24taGVscDJtYW4KQEAgLTE0LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1ieTog
RWR3aW4gUGxhdWNodSA8ZWR3aW4ucGxhdWNodS5jYW1hY2hvQGludGVsLmNvbT4KICAyIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L2RvYy9NYWtlZmlsZS5hbSBiL2RvYy9NYWtlZmlsZS5hbQotaW5kZXggYTFmNWI1NC4uNWNmZjQx
ZiAxMDA2NDQKK2luZGV4IDQwN2EzOGMuLjZiNWZmM2UgMTAwNjQ0CiAtLS0gYS9kb2MvTWFrZWZp
bGUuYW0KICsrKyBiL2RvYy9NYWtlZmlsZS5hbQogQEAgLTU1LDcgKzU1LDcgQEAgcmVmY2FyZF9m
aWxlcyA9IHJlZmNhcmQvTWFrZWZpbGUgcmVmY2FyZC90eGljbWRjaGVjayBcCkBAIC0yNCw4ICsy
NCw4IEBAIGluZGV4IGExZjViNTQuLjVjZmY0MWYgMTAwNjQ0CiAtCSAgICAgJChtYW5fTUFOUykg
JChUWElfWExBVEUpIFwKICsJICAgICAkKFRYSV9YTEFURSkgXAogICAgICAgICAgICAgICAkKHJl
ZmNhcmRfZmlsZXMpIFwKKyAgICAgICAgICAgICAgZ2VuZG9jcy5jaGFwdGVyL2dlbmRvY3NfdGVt
cGxhdGUgXAogIAkgICAgIHRleGluZm8tdGV4LXRlc3QudGV4aSB0ZXhpbmZvLXRleC10ZXN0LldJ
RE9XcyBcCi0gICAgICAgICAgICAgIHRleGluZm8tamEudGV4IHNob3J0LXNhbXBsZS1qYS50ZXhp
IFwKIGRpZmYgLS1naXQgYS9tYW4vTWFrZWZpbGUuYW0gYi9tYW4vTWFrZWZpbGUuYW0KIGluZGV4
IGQwY2Q3MmMuLmExOWU1MmEgMTAwNjQ0CiAtLS0gYS9tYW4vTWFrZWZpbGUuYW0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC90ZXhpbmZvL3RleGluZm9fNy4wLmJiIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3RleGluZm8vdGV4aW5mb183LjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGV4aW5mby90ZXhpbmZvXzcu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RleGluZm8vdGV4aW5mb183LjAu
MS5iYgppbmRleCBhODkzM2YyYjdlLi5mMGY5MjExNTk0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvdGV4aW5mby90ZXhpbmZvXzcuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvdGV4aW5mby90ZXhpbmZvXzcuMC4xLmJiCkBAIC0zNSw3ICszNSw3IEBAIFNSQ19VUkkg
PSAiJHtHTlVfTUlSUk9SfS90ZXhpbmZvLyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgICR7VEFS
R0VUX1BBVENIfSBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkyNjFk
NGVlMTFjZGY2YjYxODk1ZTIxM2ZmY2Q2Yjc0NmE2MWE2NGZlMzhiOTc0MWEzYWFhNzMxMjViMzUx
NzAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTNjMDFkZDM0YzliZjExNjg2NmQwM2FhYmQzOGM1
Y2Q5ZWU5NWFjMTAwNDNkNjFhYTMzZGVjMGQyNzgyNWQ4ZCIKIAogdGV4X3RleGluZm8gPSAidGV4
bWYvdGV4L3RleGluZm8iCiAKLS0gCjIuMzEuMQoK

--===============4268655208974290449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/texinfo/info-doc: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/info-doc: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/info-doc: PKGSIZE changed from 118234 to 118239 (+0%)
packages/core2-32-poky-linux/texinfo/info: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/info: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo: SRC_URI changed from "https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.tar.gz file://disable-native-tools.patch file://link-zip.patch file://dont-depend-on-help2man.patch file://use_host_makedoc.patch" to "https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.1.tar.gz file://disable-native-tools.patch file://link-zip.patch file://dont-depend-on-help2man.patch file://use_host_makedoc.patch"
packages/core2-32-poky-linux/texinfo: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-dbg: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-dbg: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-dbg: PKGSIZE changed from 1136572 to 1136908 (+0%)
packages/core2-32-poky-linux/texinfo/texinfo-dev: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-dev: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-doc: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-doc: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-doc: PKGSIZE changed from 1948984 to 1949021 (+0%)
packages/core2-32-poky-linux/texinfo/texinfo-locale-ca.us-ascii: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ca.us-ascii: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ca: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ca: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-cs: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-cs: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-da: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-da: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-de.us-ascii: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-de.us-ascii: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-de: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-de: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-el: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-el: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-eo: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-eo: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-es: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-es: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-fi: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-fi: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-fr: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-fr: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-he: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-he: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-hr: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-hr: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-hu: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-hu: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-id: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-id: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-it: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-it: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ja: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ja: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-nb: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-nb: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-nl: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-nl: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-no.us-ascii: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-no.us-ascii: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pl: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pl: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt-br.us-ascii: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt-br.us-ascii: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt-br: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt-br: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt.us-ascii: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt.us-ascii: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ro: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ro: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ru: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ru: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-rw: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-rw: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-sl: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-sl: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-sr: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-sr: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-sv: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-sv: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-tr: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-tr: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-uk: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-uk: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-vi: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-vi: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-zh-cn: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-zh-cn: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-zh-tw: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-locale-zh-tw: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-src: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-src: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo-src: PKGSIZE changed from 1599814 to 1599984 (+0%)
packages/core2-32-poky-linux/texinfo/texinfo-staticdev: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo-staticdev: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo: PV changed from "7.0" to "7.0.1"
packages/core2-32-poky-linux/texinfo/texinfo: PKGV changed from 7.0 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/texinfo/texinfo: PKGSIZE changed from 6246986 to 6255161 (+0%)

--===============4268655208974290449==--

