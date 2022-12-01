Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D795AC64E66
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.46825.1669908626848628927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IgGTiZdS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010184ce4f7d6c-9f1207d5-2ce2-4086-903e-f383186afbe9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n60bO17aTmntJ61SUqJ+WVmFwFYdSDz5jwg1BoGqzSk=;
	b=IgGTiZdSnYc1Plf20o5XoktwWmdMyoYdH2J7uPVysaXB0/VbUBkiCySqbmab7lP5
	ntNhQde7vVFH4CLiPlPz6H5kI1mO3Zt1l5fswsK15TRiWm0/cMqalutf4J28xjv2MKe
	I/AZ2yH8tHDYJMCn1wPBiUJbF++dILCmJM0wI4WY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n60bO17aTmntJ61SUqJ+WVmFwFYdSDz5jwg1BoGqzSk=;
	b=YxUDWIhGLyqFubhy1sJCKsJ2IVxTvylLFXYCVNjLmCIQ1HQP+g1hKnLRtb8yhQFp
	hMl7kySm2Udup8keGcbBnHNkCMh9ebL13HpNuuSowJWNcUxHvD1BhL02Fi15JA2Eu5J
	2BHWg4O3wv8HVHJRVxp3VENXhVX4/pLR5z6ibkmo=
Content-Type: multipart/mixed; boundary="===============4534108695718552390=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] swig: upgrading to 4.1.1 SUCCEEDED
Message-ID: <01010184ce4f7d6c-9f1207d5-2ce2-4086-903e-f383186afbe9-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174156

--===============4534108695718552390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *swig* to *4.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-swig-upgrade-4.1.0-4.1.1.patch
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
--===============4534108695718552390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/swig: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/swig: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/swig: SRC_URI changed from "https://downloads.sourceforge.net/swig/swig-4.1.0.tar.gz file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch file://0001-configure-use-pkg-config-for-pcre-detection.patch file://determinism.patch" to "https://downloads.sourceforge.net/swig/swig-4.1.1.tar.gz file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch file://0001-configure-use-pkg-config-for-pcre-detection.patch file://determinism.patch"
packages/core2-32-poky-linux/swig/swig-dbg: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/swig/swig-dbg: PKGSIZE changed from 6984104 to 6983624 (-0%)
packages/core2-32-poky-linux/swig/swig-dbg: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/swig/swig-dev: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/swig/swig-dev: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/swig/swig-doc: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/swig/swig-doc: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/swig/swig-locale: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/swig/swig-locale: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/swig/swig-src: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/swig/swig-src: PKGSIZE changed from 3245461 to 3247169 (+0%)
packages/core2-32-poky-linux/swig/swig-src: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/swig/swig-staticdev: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/swig/swig-staticdev: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/swig/swig: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/swig/swig: PKGSIZE changed from 5335055 to 5341258 (+0%)
packages/core2-32-poky-linux/swig/swig: PV changed from "4.1.0" to "4.1.1"
Changes to packages/core2-32-poky-linux/swig (sysroot):
  /usr/share/swig/4.1.0 moved to /usr/share/swig/4.1.1

--===============4534108695718552390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/swig (sysroot):
  /usr/share/swig/4.1.0 moved to /usr/share/swig/4.1.1

--===============4534108695718552390==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-swig-upgrade-4.1.0-4.1.1.patch"

RnJvbSA2M2MyM2NjODdmNzEyYTZmMDZhOThkNjhjNWJlMThjMmI4YzQyY2FlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMDo0MzowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN3
aWc6IHVwZ3JhZGUgNC4xLjAgLT4gNC4xLjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N3
aWcve3N3aWdfNC4xLjAuYmIgPT4gc3dpZ180LjEuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc3dpZy97c3dpZ180LjEuMC5iYiA9PiBzd2lnXzQuMS4xLmJifSAoNzIlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3N3aWdfNC4xLjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvc3dpZy9zd2lnXzQuMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggNzIlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3N3aWdfNC4xLjAuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3N3aWdfNC4xLjEuYmIKaW5kZXggMGVhYmQ4
ZWQ2MC4uYjllMDE3NTI5OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N3aWcv
c3dpZ180LjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3dpZy9zd2lnXzQuMS4x
LmJiCkBAIC00LDQgKzQsNCBAQCBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1Vc2UtcHJvYy1zZWxm
LWV4ZS1mb3Itc3dpZy1zd2lnbGliLW9uLW5vbi1XaW4zMi1wbGF0LnBhdAogICAgICAgICAgICAg
ZmlsZTovLzAwMDEtY29uZmlndXJlLXVzZS1wa2ctY29uZmlnLWZvci1wY3JlLWRldGVjdGlvbi5w
YXRjaCBcCiAgICAgICAgICAgICBmaWxlOi8vZGV0ZXJtaW5pc20ucGF0Y2ggXAogICAgICAgICAg
ICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDZhOWE4MDk0ZTc4ZjdjZmI2ZjgwYTczY2MyNzFl
MWZlMzg4Yzg2MzhlZDIyNjY4NjIyYzJjNjQ2ZGY1YmIzZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIyYWYwOGFjZWQ4ZmNkNjVjZGI1Y2M2MjQyNjc2ODkxNGJlZGM3MzViMWMyNTAzMjUyMDM3MTZm
NzhlMzlhYzliIgotLSAKMi4zMS4xCgo=

--===============4534108695718552390==--

