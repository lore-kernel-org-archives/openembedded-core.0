Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44825C77B7F
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.30006.1675272855273188032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DRaC2kqs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101860e0b1b11-f3e9aa1a-8b3b-4764-aafc-96d5184010a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vuUpLxv6lqpiR6VYsb9c1KBcLDOun5T+iBj67kthGmI=;
	b=DRaC2kqsLqbsEfLs4P1Ri8Vz6ryh8OGwa+D9PFqv1skHsvMgaBw0XkTU83RhciG0
	XfU6DBFkHYoWCB5YnufrzunsYJ8wQOiEpwjg00liHp9ZIJz0hsdCEGi14I/W7lxdFv0
	957rSXZIS9z3G2BPvohDwFZcpyHLOEe1SXBKKbdY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vuUpLxv6lqpiR6VYsb9c1KBcLDOun5T+iBj67kthGmI=;
	b=O7zJZ/a2HluNwo/lq6c35ocN063Sdc2bs5mZmBBJ3DevVyt7TLeBC5MOa+Brm/rK
	xIS1qUksDGkBgpeI2iV5Y1elwxUw9t3JGko19+HYqwGaCK9UhiaPTlwjAQKmgjj0Dv/
	VjZM5uM9oHdx+Qzs+Bb885aNQUV/lBGWEFZcPZ2A=
Content-Type: multipart/mixed; boundary="===============1069771438752249784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtest-needs-perl: upgrading to 0.002010 SUCCEEDED
Message-ID: <010101860e0b1b11-f3e9aa1a-8b3b-4764-aafc-96d5184010a1-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176591

--===============1069771438752249784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libtest-needs-perl* to *0.002010* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtest-needs-perl-upgrade-0.002009-0.002010.patch
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
--===============1069771438752249784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libtest-needs-perl: SRC_URI changed from "https://cpan.metacpan.org/authors/id/H/HA/HAARG/Test-Needs-0.002009.tar.gz file://ptest-perl/run-ptest" to "https://cpan.metacpan.org/authors/id/H/HA/HAARG/Test-Needs-0.002010.tar.gz file://ptest-perl/run-ptest"
packages/core2-32-poky-linux/libtest-needs-perl: PKGV changed from 0.002009 [default] to 0.002010 [default]
packages/core2-32-poky-linux/libtest-needs-perl: PV changed from "0.002009" to "0.002010"
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-dbg: PKGV changed from 0.002009 [default] to 0.002010 [default]
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-dbg: PV changed from "0.002009" to "0.002010"
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-dev: PKGV changed from 0.002009 [default] to 0.002010 [default]
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-dev: PV changed from "0.002009" to "0.002010"
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-doc: PKGV changed from 0.002009 [default] to 0.002010 [default]
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-doc: PV changed from "0.002009" to "0.002010"
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-locale: PKGV changed from 0.002009 [default] to 0.002010 [default]
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-locale: PV changed from "0.002009" to "0.002010"
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-ptest: PKGV changed from 0.002009 [default] to 0.002010 [default]
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-ptest: FILELIST: removed "/usr/lib/libtest-needs-perl/ptest/t/basic.t", added "/usr/lib/libtest-needs-perl/ptest/t/standalone.t /usr/lib/libtest-needs-perl/ptest/t/test2.t /usr/lib/libtest-needs-perl/ptest/t/lib/TestAPI.pm /usr/lib/libtest-needs-perl/ptest/t/test-builder.t"
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-ptest: PV changed from "0.002009" to "0.002010"
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-ptest: PKGSIZE changed from 12081 to 12508 (+4%)
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-src: PKGV changed from 0.002009 [default] to 0.002010 [default]
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-src: PV changed from "0.002009" to "0.002010"
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-staticdev: PKGV changed from 0.002009 [default] to 0.002010 [default]
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-staticdev: PV changed from "0.002009" to "0.002010"
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl: PKGV changed from 0.002009 [default] to 0.002010 [default]
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl: PV changed from "0.002009" to "0.002010"
packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl: PKGSIZE changed from 8584 to 8632 (+1%)

--===============1069771438752249784==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtest-needs-perl-upgrade-0.002009-0.002010.patch"

RnJvbSA4ODRlMDg4YmJiODUxNmUzNzc1YWUxMTA4OTJkZGM3N2NhNWEwOTUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMTowNToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnRlc3QtbmVlZHMtcGVybDogdXBncmFkZSAwLjAwMjAwOSAtPiAwLjAwMjAxMAoKLS0tCiAuLi50
LW5lZWRzLXBlcmxfMC4wMDIwMDkuYmIgPT4gbGlidGVzdC1uZWVkcy1wZXJsXzAuMDAyMDEwLmJi
fSB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwve2xpYnRlc3QtbmVlZHMtcGVybF8w
LjAwMjAwOS5iYiA9PiBsaWJ0ZXN0LW5lZWRzLXBlcmxfMC4wMDIwMTAuYmJ9ICg4NiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC1uZWVkcy1wZXJsXzAu
MDAyMDA5LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC1uZWVkcy1wZXJs
XzAuMDAyMDEwLmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2xpYnRlc3QtbmVlZHMtcGVybF8wLjAwMjAwOS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC1uZWVkcy1wZXJsXzAuMDAyMDEwLmJi
CmluZGV4IDQzYTlhNmI3ZDMuLjc5YTA2MTcwZTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL2xpYnRlc3QtbmVlZHMtcGVybF8wLjAwMjAwOS5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LW5lZWRzLXBlcmxfMC4wMDIwMTAuYmIKQEAgLTE3
LDggKzE3LDcgQEAgREVQRU5EUyArPSAicGVybCIKIAogU1JDX1VSSSA9ICJodHRwczovL2NwYW4u
bWV0YWNwYW4ub3JnL2F1dGhvcnMvaWQvSC9IQS8ke0NQQU5fQVVUSE9SfS8ke0NQQU5fTkFNRX0t
JHtQVn0udGFyLmd6IgogCi1TUkNfVVJJW21kNXN1bV0gPSAiNTY0M2NkMzIzYWZiNzdkMjAzNjNh
Y2JhZjliMTJiY2MiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTcxYzIxMTkzYWQxNjE5NWRmNThi
MDZiMjY4Nzk4Nzk2YTM5MWIzOThjNDQzMjcxNzIxZDJjYzBmYjdjNGFjMyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI5MjNmZmRjNzhmY2JhOTY2MDk3NTNlNGJhZTI2YjBiYTAxODY4OTNkZTRhNjNj
ZDUyMzZlMDEyYzdjOTBlMjA4IgogCiBTID0gIiR7V09SS0RJUn0vJHtDUEFOX05BTUV9LSR7UFZ9
IgogCi0tIAoyLjM3LjMKCg==

--===============1069771438752249784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libtest-needs-perl/libtest-needs-perl-ptest: FILELIST: removed "/usr/lib/libtest-needs-perl/ptest/t/basic.t", added "/usr/lib/libtest-needs-perl/ptest/t/test-builder.t /usr/lib/libtest-needs-perl/ptest/t/test2.t /usr/lib/libtest-needs-perl/ptest/t/lib/TestAPI.pm /usr/lib/libtest-needs-perl/ptest/t/standalone.t"

--===============1069771438752249784==--

