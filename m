Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D656C88CBA
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.107888.1682976350143008190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=l1RkYZUe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010187d9352512-cf3438d5-c01c-4e95-a5f3-91ae1ed7b521-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fKo3lB8uHne0l1+VPWemLExWAqjXZDPvUuWrgwqGmaI=;
	b=l1RkYZUeqlaY7JtrKgT4RuUwgWKl3g4GntXIwSWuNbrqCt6ZGmzbAu9I3NmLtbdu
	zuHtoypDfMfRnu6G98OKViVPHC5DSg4Tfnip43krVsTPQNBm9MyNKbwYl7mDRz7kge+
	1huvmdmWBfGqvAsAiGpl1QjF64qOF3N4e2lR4XqU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fKo3lB8uHne0l1+VPWemLExWAqjXZDPvUuWrgwqGmaI=;
	b=inwORT9b3MTKuyeOQLOnxztujiwyEls7Pb0HoRDQttBFTtkiTdn7a5GNwxB6FRW9
	gomzUrWGrDb0wd5Ivs5UnJq8MdcgN++Yfq3BtEfTvtQBckmQBQOIGZTwA4siHSiJkY5
	Akas2NOGl8IcuyXBjvmuVQEe9cyszpXLmoxtZR1k=
Content-Type: multipart/mixed; boundary="===============8919897773000239518=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.5.0 SUCCEEDED
Message-ID: <01010187d9352512-cf3438d5-c01c-4e95-a5f3-91ae1ed7b521-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180643

--===============8919897773000239518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysklogd* to *2.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.4.4-2.5.0.patch
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
--===============8919897773000239518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysklogd: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 151536 to 166348 (+10%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGSIZE changed from 9564 to 9554 (-0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 90965 to 92563 (+2%)
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 146769 to 149287 (+2%)
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGSIZE changed from 91877 to 91694 (-0%)

--===============8919897773000239518==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.4.4-2.5.0.patch"

RnJvbSAyODVlYjM5YzBiODA2MWFhZjY1MjcxYjE2NTEyNGZiNmI3MDBjOTZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxNDo0ODoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c2tsb2dkOiB1cGdyYWRlIDIuNC40IC0+IDIuNS4wCgotLS0KIC4uLi9zeXNrbG9nZC97c3lza2xv
Z2RfMi40LjQuYmIgPT4gc3lza2xvZ2RfMi41LjAuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC97c3lza2xvZ2RfMi40LjQuYmIgPT4gc3lza2xvZ2RfMi41
LjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dk
L3N5c2tsb2dkXzIuNC40LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2ts
b2dkXzIuNS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjQuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2tsb2dkXzIuNS4wLmJiCmluZGV4IGExOWI0ZjU4ZWIu
LjA5NmJkMzc2ZDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9z
eXNrbG9nZF8yLjQuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lz
a2xvZ2RfMi41LjAuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL3Ryb2dsb2JpdC9zeXNrbG9nZC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcwog
ICAgICAgICAgICBmaWxlOi8vc3lza2xvZ2QgXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICI1
MWQ0NzE1NDNjZTU5ZWFjZTZkZjZkYTBlNDI2NTg5MTFmMWZiOGMwIgorU1JDUkVWID0gImI2ZDFh
ZTI2NjcxYTg1ZTYwODdjOThlYzhiNjMwODU1ZmM1Mjg4NmEiCiAKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKLS0gCjIuMzkuMgoK

--===============8919897773000239518==--

