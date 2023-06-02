Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7368DCA9EBD
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.7540.1685693434435589128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VICCT5kB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101887b288742-f5072c5a-56e9-4c92-976b-df7f83bb4139-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O4n9uAkxVzrkm32qwb9zs6N6EiF9ylKnEaEPU8xVNCU=;
	b=VICCT5kBvuKa3sZIW1/VpxcSjOrlWYJV15wWT14+Z5XPPqT6L+Vzba4ltJI+1R2/
	o69Gr6skJSOdGgImJg9xCA63ZZle3jcvrE2YuQxz/XTgZTRbH9vIH8EOvNz0JYfybQs
	n9HgkM8kX1/utQBaMcstULbbESrvfAVUJIkkIrbc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O4n9uAkxVzrkm32qwb9zs6N6EiF9ylKnEaEPU8xVNCU=;
	b=hJK4htBOygWGRBV0D4UciccJ5HueqQbufZjJl1psfIrM13cuxU+YOB1Sl/rhQvxS
	CehbkQu+8wyAZW+tyqtzeFo3NhR8fwmEN8Cyf+jfgs0RCBZR3fNq2fzvtENA3Nbnf8t
	P5Mvv43VJSaGvAmBE+ChX2Q2+D1Ti3Hca5p8atmU=
Content-Type: multipart/mixed; boundary="===============0803964201297586431=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gawk: upgrading to 5.2.2 SUCCEEDED
Message-ID: <010101887b288742-f5072c5a-56e9-4c92-976b-df7f83bb4139-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182217

--===============0803964201297586431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gawk* to *5.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gawk-upgrade-5.2.1-5.2.2.patch
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
--===============0803964201297586431==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gawk-upgrade-5.2.1-5.2.2.patch"

RnJvbSBmOWY0MzMyMDBhMmYwMmQyODBkNTNlZGEyMjczZTg1ZTlhNGRjNzVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxOToyNzozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdh
d2s6IHVwZ3JhZGUgNS4yLjEgLT4gNS4yLjIKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dh
d2sve2dhd2tfNS4yLjEuYmIgPT4gZ2F3a181LjIuMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvZ2F3ay97Z2F3a181LjIuMS5iYiA9PiBnYXdrXzUuMi4yLmJifSAoOTclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2tfNS4yLjEuYmIgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2tfNS4yLjEuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2tfNS4yLjIuYmIKaW5kZXggNzY4Yzhl
YjM2NC4uM2MxOGI2OTExYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dhd2sv
Z2F3a181LjIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMi4y
LmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9nYXdrL2dhd2st
JHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAg
ICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUyOWU3YzhjNmFjZjIxZmYzYTYxODNmNGQ3NjNj
NjMyODEwOTA4OTg5YzI0Njc1Yzc3OTk1ZDUxYWMzN2I3OWMiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiOTQ1YWVmN2NjZmYxMDFmMjBiMjJhMTA4MDJiYzAwNWU5OTRhYjJiOGVhM2U3MjRjYzFhMTk3
YzYyZjQxZjY1MCIKIAogaW5oZXJpdCBhdXRvdG9vbHMgZ2V0dGV4dCB0ZXhpbmZvIHVwZGF0ZS1h
bHRlcm5hdGl2ZXMKIAotLSAKMi4zOS4yCgo=

--===============0803964201297586431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gawk/gawk-doc: FILELIST: added "/usr/share/info/gawk_process-flow.png /usr/share/info/gawk_array-elements.png /usr/share/info/gawk_statist.jpg /usr/share/info/gawk_api-figure2.png /usr/share/info/gawk_general-program.png /usr/share/info/gawk_api-figure1.png /usr/share/info/gawk_api-figure3.png"
packages/core2-32-poky-linux/gawk/gawk-ptest: FILELIST: added "/usr/lib/gawk/ptest/test/fieldassign.in /usr/lib/gawk/ptest/test/elemnew2.ok /usr/lib/gawk/ptest/test/fieldassign.ok /usr/lib/gawk/ptest/test/elemnew3.ok /usr/lib/gawk/ptest/test/elemnew1.awk /usr/lib/gawk/ptest/test/asortsymtab.ok /usr/lib/gawk/ptest/test/elemnew2.awk /usr/lib/gawk/ptest/test/elemnew1.ok /usr/lib/gawk/ptest/test/asortsymtab.awk /usr/lib/gawk/ptest/test/elemnew3.awk /usr/lib/gawk/ptest/test/fieldassign.awk"
packages/core2-32-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.2.1", added "/usr/bin/gawk-5.2.2"

--===============0803964201297586431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gawk/gawk-dbg: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-dbg: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-dbg: PKGSIZE changed from 2139724 to 2145916 (+0%)
packages/core2-32-poky-linux/gawk/gawk-dev: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-dev: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-dev: PKGSIZE changed from 41697 to 42070 (+1%)
packages/core2-32-poky-linux/gawk/gawk-doc: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-doc: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-doc: PKGSIZE changed from 2206542 to 2338623 (+6%)
packages/core2-32-poky-linux/gawk/gawk-doc: FILELIST: added "/usr/share/info/gawk_general-program.png /usr/share/info/gawk_process-flow.png /usr/share/info/gawk_api-figure3.png /usr/share/info/gawk_api-figure1.png /usr/share/info/gawk_api-figure2.png /usr/share/info/gawk_array-elements.png /usr/share/info/gawk_statist.jpg"
packages/core2-32-poky-linux/gawk/gawk-gawkbug: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-gawkbug: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-bg: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-bg: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-bg: PKGSIZE changed from 123327 to 124398 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-ca: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-ca: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-da: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-da: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-de: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-de: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-de: PKGSIZE changed from 95421 to 96121 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-es: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-es: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-es: PKGSIZE changed from 93871 to 94596 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-fi: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-fi: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-fi: PKGSIZE changed from 56749 to 56651 (-0%)
packages/core2-32-poky-linux/gawk/gawk-locale-fr: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-fr: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-fr: PKGSIZE changed from 95624 to 96365 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-id: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-id: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-it: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-it: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-it: PKGSIZE changed from 91483 to 92033 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-ja: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-ja: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-ko: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-ko: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-ko: PKGSIZE changed from 98866 to 99705 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-ms: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-ms: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-nl: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-nl: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-nl: PKGSIZE changed from 69017 to 68931 (-0%)
packages/core2-32-poky-linux/gawk/gawk-locale-pl: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-pl: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-pl: PKGSIZE changed from 93249 to 93988 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-pt-br: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-pt-br: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-pt-br: PKGSIZE changed from 86832 to 86740 (-0%)
packages/core2-32-poky-linux/gawk/gawk-locale-pt: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-pt: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-pt: PKGSIZE changed from 85587 to 85495 (-0%)
packages/core2-32-poky-linux/gawk/gawk-locale-ro: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-ro: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-ro: PKGSIZE changed from 96499 to 97245 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-sr: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-sr: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-sr: PKGSIZE changed from 115676 to 115587 (-0%)
packages/core2-32-poky-linux/gawk/gawk-locale-sv: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-sv: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-sv: PKGSIZE changed from 91208 to 91921 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-vi: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-vi: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-vi: PKGSIZE changed from 64292 to 64194 (-0%)
packages/core2-32-poky-linux/gawk/gawk-locale-zh-cn: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-zh-cn: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-zh-cn: PKGSIZE changed from 82377 to 86163 (+5%)
packages/core2-32-poky-linux/gawk/gawk-ptest: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-ptest: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-ptest: PKGSIZE changed from 1378823 to 1381664 (+0%)
packages/core2-32-poky-linux/gawk/gawk-ptest: FILELIST: added "/usr/lib/gawk/ptest/test/elemnew2.awk /usr/lib/gawk/ptest/test/asortsymtab.ok /usr/lib/gawk/ptest/test/elemnew3.ok /usr/lib/gawk/ptest/test/fieldassign.ok /usr/lib/gawk/ptest/test/asortsymtab.awk /usr/lib/gawk/ptest/test/elemnew1.awk /usr/lib/gawk/ptest/test/fieldassign.awk /usr/lib/gawk/ptest/test/elemnew3.awk /usr/lib/gawk/ptest/test/fieldassign.in /usr/lib/gawk/ptest/test/elemnew2.ok /usr/lib/gawk/ptest/test/elemnew1.ok"
packages/core2-32-poky-linux/gawk/gawk-src: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-src: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-src: PKGSIZE changed from 2328480 to 2336061 (+0%)
packages/core2-32-poky-linux/gawk/gawk-staticdev: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-staticdev: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk: PKGSIZE changed from 1002389 to 1002400 (+0%)
packages/core2-32-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.2.1", added "/usr/bin/gawk-5.2.2"
packages/core2-32-poky-linux/gawk: SRC_URI changed from "https://ftp.gnu.org/gnu/gawk/gawk-5.2.1.tar.gz file://run-ptest" to "https://ftp.gnu.org/gnu/gawk/gawk-5.2.2.tar.gz file://run-ptest"
packages/core2-32-poky-linux/gawk: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk: PV changed from "5.2.1" to "5.2.2"

--===============0803964201297586431==--

