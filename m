Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2F9C88CBA
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.3719.1684186749572778793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J6wakfqZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010188215a584b-fb2ced6a-bf31-452e-aa01-31666e8df236-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Cq7RaXRfBayK7fuyXUeF+Xmk+DOrOnRS9bTvzIADAas=;
	b=J6wakfqZvOYYJ6K53t2I6bjVUg4bYUKLDB3B/9E3PInh8M1DfMULO3FVakW6q8kj
	PN2osOPMdrPMz8wXxuzCsgzsg70siWCWd1r6gRi/g6c4OdJkAEEYcUMp1pyjHELSzw/
	hbQ658xenQfSrixsb8SRMVWgI9yNF69m8quDjp/s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Cq7RaXRfBayK7fuyXUeF+Xmk+DOrOnRS9bTvzIADAas=;
	b=Goyq7inLZI+qujmKNl5W8wJn/GsL97S9w1rukHcYeiHpZ5eev9TP8a4OTQT1IsJo
	5glY3GUp9B3YI0K0mXC5CW+sYuN452ZBaAuqVYfYYNWPVW7eHrbwKI1MbUz9y/KlRmH
	pgDCfBXAYDD3q6yrfGjxUJsSX2vv1O84WZ6lTnLI=
Content-Type: multipart/mixed; boundary="===============6301507092846605965=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.5.0 SUCCEEDED
Message-ID: <01010188215a584b-fb2ced6a-bf31-452e-aa01-31666e8df236-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181340

--===============6301507092846605965==
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
--===============6301507092846605965==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.4.4-2.5.0.patch"

RnJvbSBmNTc3YWZlMWUxMTM5MzIzYWFlN2VjNjMxOGI1ODRlNWVhMjY0MTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTQ6NTA6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXNrbG9nZDogdXBncmFkZSAyLjQuNCAtPiAyLjUuMAoKLS0tCiAuLi4vc3lza2xvZ2Qve3N5c2ts
b2dkXzIuNC40LmJiID0+IHN5c2tsb2dkXzIuNS4wLmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qve3N5c2tsb2dkXzIuNC40LmJiID0+IHN5c2tsb2dkXzIu
NS4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9n
ZC9zeXNrbG9nZF8yLjQuNC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNr
bG9nZF8yLjUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lza2xvZ2RfMi40LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjUuMC5iYgppbmRleCBhMTliNGY1OGVi
Li4wOTZiZDM3NmQ3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qv
c3lza2xvZ2RfMi40LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5
c2tsb2dkXzIuNS4wLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS90cm9nbG9iaXQvc3lza2xvZ2QuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMK
ICAgICAgICAgICAgZmlsZTovL3N5c2tsb2dkIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAi
NTFkNDcxNTQzY2U1OWVhY2U2ZGY2ZGEwZTQyNjU4OTExZjFmYjhjMCIKK1NSQ1JFViA9ICJiNmQx
YWUyNjY3MWE4NWU2MDg3Yzk4ZWM4YjYzMDg1NWZjNTI4ODZhIgogCiBTID0gIiR7V09SS0RJUn0v
Z2l0IgogCi0tIAoyLjM5LjIKCg==

--===============6301507092846605965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysklogd: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 151536 to 166348 (+10%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGSIZE changed from 9564 to 9554 (-0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 90965 to 92563 (+2%)
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 146769 to 149287 (+2%)
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.4.4 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd: PV changed from "2.4.4" to "2.5.0"
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGSIZE changed from 91877 to 91694 (-0%)
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGV changed from 2.4.4 [default] to 2.5.0 [default]

--===============6301507092846605965==--

