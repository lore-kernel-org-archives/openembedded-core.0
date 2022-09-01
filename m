Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC117C6FA89
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:55 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web12.12469.1662040787615498245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=j02C0PlA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010182f959c74a-1ba687e3-0995-40ae-b9e3-be7e17762f66-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f0aM02bpyV5d7sf0FHG5urRPVI/+a/Hx2q5/5W5Vi+o=;
	b=j02C0PlAwIvERUvAz9gSTon0VoZFTYd8vrAK3hWgUoVm4wgqSeoNfqAN5lXtqBbj
	hI22HvmZkmfT19KgpZPJH4dwKHPkepM2vQy3yRqHw3kpgzEYIGRGGD5p6m+CAX7j5db
	+lkoUKCrGlkLMCI9iIakAx6jba/hugJMM51XLrjk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f0aM02bpyV5d7sf0FHG5urRPVI/+a/Hx2q5/5W5Vi+o=;
	b=dM6hvn8leK2FWOmJ5qiwXjJoamvmhf2DAa4JYt4r8/Kngxo2sr0skbzVbQLfRIu9
	g7fICdLozARQd2kcwXZENTywuAse1Pct8VdmrnLq3NARjSbW4gGMkwCAhmNZgvWkEr/
	vitlT3FaOi3rMRGqof3kFHc9dXTvHD0GaX/82uyI=
Content-Type: multipart/mixed; boundary="===============5370655459608422576=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-tools: upgrading to 2.13.8 SUCCEEDED
Message-ID: 
 <01010182f959c74a-1ba687e3-0995-40ae-b9e3-be7e17762f66-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170206

--===============5370655459608422576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-tools* to *2.13.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lttng-tools-upgrade-2.13.7-2.13.8.patch
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
--===============5370655459608422576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lttng-tools: PV changed from "2.13.7" to "2.13.8"
packages/core2-32-poky-linux/lttng-tools: PKGV changed from 2.13.7 [default] to 2.13.8 [default]
packages/core2-32-poky-linux/lttng-tools: SRC_URI changed from "https://lttng.org/files/lttng-tools/lttng-tools-2.13.7.tar.bz2 file://0001-tests-do-not-strip-a-helper-library.patch file://run-ptest file://lttng-sessiond.service file://determinism.patch file://disable-tests.patch" to "https://lttng.org/files/lttng-tools/lttng-tools-2.13.8.tar.bz2 file://0001-tests-do-not-strip-a-helper-library.patch file://run-ptest file://lttng-sessiond.service file://determinism.patch file://disable-tests.patch"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PKGSIZE changed from 46698152 to 46770912 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PV changed from "2.13.7" to "2.13.8"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PKGV changed from 2.13.7 [default] to 2.13.8 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PV changed from "2.13.7" to "2.13.8"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PKGV changed from 2.13.7 [default] to 2.13.8 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PKGSIZE changed from 297234 to 298831 (+1%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PV changed from "2.13.7" to "2.13.8"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PKGV changed from 2.13.7 [default] to 2.13.8 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-locale: PV changed from "2.13.7" to "2.13.8"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-locale: PKGV changed from 2.13.7 [default] to 2.13.8 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PKGSIZE changed from 16451208 to 16472201 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PV changed from "2.13.7" to "2.13.8"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PKGV changed from 2.13.7 [default] to 2.13.8 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PKGSIZE changed from 6088326 to 6092302 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PV changed from "2.13.7" to "2.13.8"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PKGV changed from 2.13.7 [default] to 2.13.8 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-staticdev: PV changed from "2.13.7" to "2.13.8"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-staticdev: PKGV changed from 2.13.7 [default] to 2.13.8 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PKGSIZE changed from 5631421 to 5651901 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PV changed from "2.13.7" to "2.13.8"
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PKGV changed from 2.13.7 [default] to 2.13.8 [default]

--===============5370655459608422576==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-tools-upgrade-2.13.7-2.13.8.patch"

RnJvbSBiMGM2OWRiZmQ1YmQ0MDIwYWFjYTE4MTc2NzFhMDRmNjU2NmJjMmFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMTo1MToyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
dG5nLXRvb2xzOiB1cGdyYWRlIDIuMTMuNyAtPiAyLjEzLjgKCi0tLQogLi4uL2x0dG5nL3tsdHRu
Zy10b29sc18yLjEzLjcuYmIgPT4gbHR0bmctdG9vbHNfMi4xMy44LmJifSAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy97bHR0bmctdG9vbHNfMi4xMy43LmJiID0+IGx0dG5nLXRv
b2xzXzIuMTMuOC5iYn0gKDk5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0
dG5nL2x0dG5nLXRvb2xzXzIuMTMuNy5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0
bmctdG9vbHNfMi4xMy44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctdG9vbHNfMi4xMy43LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLXRvb2xzXzIuMTMuOC5iYgppbmRleCAxYTk3MmVj
ODM2Li5hODE0ZWI3OWY5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0
dG5nLXRvb2xzXzIuMTMuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5n
LXRvb2xzXzIuMTMuOC5iYgpAQCAtMzksNyArMzksNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vbHR0
bmcub3JnL2ZpbGVzL2x0dG5nLXRvb2xzL2x0dG5nLXRvb2xzLSR7UFZ9LnRhci5iejIgXAogICAg
ICAgICAgICBmaWxlOi8vZGlzYWJsZS10ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImQxN2EwMmU4ZjE3OGE3Y2YzNDAzZTNjOWVkZmI5MGFkM2ExNjI4
ZTIwYWEwYjUxMzE0MDhhZTQ3ZjcyMmYwOGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjFlOTU5
NTc5YjI2MDc5MDkzMGIyMGYzYzdhYTdjZWZiOGE0MGUwZGU4MGQ0YTc3N2MyYmY3OGM2YjM1M2Rj
MSIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcHRlc3QgcGtnY29uZmlnIHVzZXJhZGQgcHl0aG9uMy1k
aXIgbWFucGFnZXMgc3lzdGVtZAogCi0tIAoyLjMxLjEKCg==

--===============5370655459608422576==--

