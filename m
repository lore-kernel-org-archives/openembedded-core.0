Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE92C54EF1
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.144512.1671136353105711785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NmX0bimj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010185177d1821-3d5233e2-4eba-44d2-a426-17208378c4f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I/kXZn1c0zQqZfjnQ5YCABmv+RrLg3J/naLE4A0XedA=;
	b=NmX0bimjwPZl+1bqwmTDouwnxEe2sj42Xwe0046XaUm5gVb+mtatLFZZo956Osu5
	6rAn8wrsFkCIRBUt+O9Ys4I3gI6iEnwCCSNBjEeCT9YD6lM2jvr0KWvx4vw58c6Bo+a
	ye/TCF0pXDjewIr8x1ps+gUVJ22gey5l1DgcWdes=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I/kXZn1c0zQqZfjnQ5YCABmv+RrLg3J/naLE4A0XedA=;
	b=V7SSa1jXZle7NtUvyol05x/N/CO9/8eSBEJGjUChOpliUcjNHtAS2fR1+PLG6OJR
	eg/JUd0UR6BYSCypNqX0m6vqs66mx/gPH/R6cemHdpn+yZFh2yYpJrx222Lv+JB40Zo
	1NwfY2GZR5uCVnhRanWdLgVeDsvPhXRqiwYfU5As=
Content-Type: multipart/mixed; boundary="===============7458526480177158574=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] psmisc: upgrading to 23.6 SUCCEEDED
Message-ID: <01010185177d1821-3d5233e2-4eba-44d2-a426-17208378c4f9-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174679

--===============7458526480177158574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *psmisc* to *23.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-psmisc-upgrade-23.5-23.6.patch
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
--===============7458526480177158574==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-psmisc-upgrade-23.5-23.6.patch"

RnJvbSBhYmRhMWQ4YWE0MjBkYzY1M2E3ZWM5YjAxNDdlNjI1MDM5MDRiMGExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTM6MTU6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
c21pc2M6IHVwZ3JhZGUgMjMuNSAtPiAyMy42CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9w
c21pc2Mve3BzbWlzY18yMy41LmJiID0+IHBzbWlzY18yMy42LmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9wc21pc2Mve3BzbWlzY18yMy41LmJiID0+IHBzbWlzY18yMy42LmJifSAoODUl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wc21pc2MvcHNtaXNjXzIzLjUu
YmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcHNtaXNjL3BzbWlzY18yMy42LmJiCnNpbWlsYXJp
dHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wc21pc2MvcHNt
aXNjXzIzLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wc21pc2MvcHNtaXNj
XzIzLjYuYmIKaW5kZXggMWMzOTBmMzYxNS4uMmU1NWFkMDBiZCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3BzbWlzYy9wc21pc2NfMjMuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvcHNtaXNjL3BzbWlzY18yMy42LmJiCkBAIC01LDUgKzUsNSBAQCBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0wNjM2ZTczZmYwMjE1ZThkNjcyZGM0YzMyYzMx
N2JiMyIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmNvbS9wc21pc2MvcHNtaXNjLmdpdDtwcm90
b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtVXNlLVVJ
TlRQVFJfTUFYLWluc3RlYWQtb2YtX19XT1JEU0laRS5wYXRjaCBcCiAgICAgICAgICAgICIKLVNS
Q1JFViA9ICIxNzM1M2YzZmRkZWY2YjM2MGJjNDdmNzgzNGYyY2QwMTFiZWEyYjg3IgorU1JDUkVW
ID0gIjMwOThlNjQxZGMxZGRiMjEwMTg2ZjUzNDY0MjU1NjcwYjQ4MDM3N2IiCiBTID0gIiR7V09S
S0RJUn0vZ2l0IgotLSAKMi4zNy4zCgo=

--===============7458526480177158574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/psmisc/fuser-doc: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/fuser-doc: PKGSIZE changed from 7389 to 7585 (+3%)
packages/core2-32-poky-linux/psmisc/fuser-doc: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/fuser: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/fuser: PKGSIZE changed from 38812 to 42912 (+11%)
packages/core2-32-poky-linux/psmisc/fuser: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/killall-doc: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/killall-doc: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/killall: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/killall: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-dbg: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-dbg: PKGSIZE changed from 267984 to 273012 (+2%)
packages/core2-32-poky-linux/psmisc/psmisc-dbg: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-dev: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-dev: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-doc: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-doc: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-extras: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-extras: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-bg: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-bg: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-ca: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-ca: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-cs: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-cs: PKGSIZE changed from 18794 to 18820 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-cs: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-da: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-da: PKGSIZE changed from 14367 to 17817 (+24%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-da: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-de: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-de: PKGSIZE changed from 18984 to 19007 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-de: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-el: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-el: PKGSIZE changed from 20749 to 20518 (-1%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-el: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-eo: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-eo: PKGSIZE changed from 18017 to 17801 (-1%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-eo: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-es: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-es: PKGSIZE changed from 19163 to 19187 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-es: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-eu: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-eu: PKGSIZE changed from 8284 to 8021 (-3%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-eu: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-fi: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-fi: PKGSIZE changed from 12251 to 12015 (-2%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-fi: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-fr: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-fr: PKGSIZE changed from 19113 to 19132 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-fr: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-hr: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-hr: PKGSIZE changed from 18534 to 18551 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-hr: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-hu: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-hu: PKGSIZE changed from 11829 to 11580 (-2%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-hu: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-id: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-id: PKGSIZE changed from 18457 to 18493 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-id: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-it: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-it: PKGSIZE changed from 16019 to 15795 (-1%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-it: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-ja: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-ja: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-nb: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-nb: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-nl: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-nl: PKGSIZE changed from 18406 to 18155 (-1%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-nl: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-pl: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-pl: PKGSIZE changed from 18743 to 18770 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-pl: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt-br: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt-br: PKGSIZE changed from 18520 to 18305 (-1%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt-br: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt: PKGSIZE changed from 18376 to 18161 (-1%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-ro: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-ro: PKGSIZE changed from 19636 to 19666 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-ro: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-ru: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-ru: PKGSIZE changed from 23819 to 23507 (-1%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-ru: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-sr: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-sr: PKGSIZE changed from 22619 to 22645 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-sr: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-sv: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-sv: PKGSIZE changed from 17319 to 18355 (+6%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-sv: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-uk: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-uk: PKGSIZE changed from 23959 to 23962 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-uk: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-vi: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-vi: PKGSIZE changed from 20467 to 20219 (-1%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-vi: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-cn: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-cn: PKGSIZE changed from 17730 to 17755 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-cn: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-tw: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-tw: PKGSIZE changed from 18089 to 17868 (-1%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-tw: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-src: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-src: PKGSIZE changed from 174061 to 177702 (+2%)
packages/core2-32-poky-linux/psmisc/psmisc-src: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc-src: FILELIST: removed "/usr/src/debug/psmisc/23.5-r0/src/timeout.h /usr/src/debug/psmisc/23.5-r0/src/fuser.h /usr/src/debug/psmisc/23.5-r0/src/killall.c /usr/src/debug/psmisc/23.5-r0/src/prtstat.h /usr/src/debug/psmisc/23.5-r0/src/prtstat.c /usr/src/debug/psmisc/23.5-r0/src/fuser.c /usr/src/debug/psmisc/23.5-r0/src/pslog.c /usr/src/debug/psmisc/23.5-r0/src/peekfd.c /usr/src/debug/psmisc/23.5-r0/src/pstree.c /usr/src/debug/psmisc/23.5-r0/src/signals.h /usr/src/debug/psmisc/23.5-r0/src/signals.c", added "/usr/src/debug/psmisc/23.6-r0/src/statx.h /usr/src/debug/psmisc/23.6-r0/src/fuser.h /usr/src/debug/psmisc/23.6-r0/src/killall.c /usr/src/debug/psmisc/23.6-r0/src/prtstat.h /usr/src/debug/psmisc/23.6-r0/src/prtstat.c /usr/src/debug/psmisc/23.6-r0/src/fuser.c /usr/src/debug/psmisc/23.6-r0/src/pslog.c /usr/src/debug/psmisc/23.6-r0/src/peekfd.c /usr/src/debug/psmisc/23.6-r0/src/pstree.c /usr/src/debug/psmisc/23.6-r0/src/statx.c /usr/src/debug/psm
 isc/23.6-r0/src/signals.h /usr/src/debug/psmisc/23.6-r0/src/signals.c"
packages/core2-32-poky-linux/psmisc/psmisc-staticdev: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc-staticdev: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/psmisc: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/psmisc: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/pstree-doc: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/pstree-doc: PKGV changed from 23.5 [default] to 23.6 [default]
packages/core2-32-poky-linux/psmisc/pstree: PV changed from "23.5" to "23.6"
packages/core2-32-poky-linux/psmisc/pstree: PKGV changed from 23.5 [default] to 23.6 [default]

--===============7458526480177158574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/psmisc/fuser: PKGSIZE changed from 38812 to 42912 (+11%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-da: PKGSIZE changed from 14367 to 17817 (+24%)

--===============7458526480177158574==--

