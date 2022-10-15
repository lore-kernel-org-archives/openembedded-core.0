Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6819FC64E90
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.24540.1665871394580070695
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=E6JHyTaq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010183ddac3449-650c2be1-0cb5-44c4-90ba-82ac1f911bd9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=17KZpKg0XtBkXGVnk3HqxZa6tYE9HK+vVeIuln8M6uU=;
	b=E6JHyTaqWj7UJrWAqmBp8l0UcZp2e42nHM0y/ic8sUtejxGJRgRP4hSBVMEMIqo0
	M/bnzkCAbr02mYIXWIFtLtCiMIb7RzPIBr4s72gH2AM0CEucIHAGEwji1lK7oZ9981L
	MKieMSDfbCf62mDtW8T8xJwkjWOH0O4SgkxzqqdQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=17KZpKg0XtBkXGVnk3HqxZa6tYE9HK+vVeIuln8M6uU=;
	b=i7m/tWRUr9ekZtZh3TrkG6HMQMzBm0H6GsLFsRV5CWet1Uj+oFYg92v6aYO7nPtu
	Zdkfa2B58MVUP98EvBTBjaLmj/jDIN7jqKpRsPTRMRi3y8TlsxuMxoPYtMyBqCBI5LX
	umOUq//kvzDvoTKUkdSk+WEQfdH2gCmlP2qhF+N4=
Content-Type: multipart/mixed; boundary="===============0148022619985881893=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytz: upgrading to 2022.4 SUCCEEDED
Message-ID: <01010183ddac3449-650c2be1-0cb5-44c4-90ba-82ac1f911bd9-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171789

--===============0148022619985881893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytz* to *2022.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytz-upgrade-2022.2.1-2022.4.patch
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
--===============0148022619985881893==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytz-upgrade-2022.2.1-2022.4.patch"

RnJvbSAwNTE0NjNlZTFmYzgxYTIwZmVmYTBlZTVkMTIwYmMzMTdkNzM1NmRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTA6NTk6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dHo6IHVwZ3JhZGUgMjAyMi4yLjEgLT4gMjAyMi40CgotLS0KIC4uLi9weXRob24v
e3B5dGhvbjMtcHl0el8yMDIyLjIuMS5iYiA9PiBweXRob24zLXB5dHpfMjAyMi40LmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0el8yMDIyLjIuMS5iYiA9
PiBweXRob24zLXB5dHpfMjAyMi40LmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjIuMi4xLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyMi40LmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6
XzIwMjIuMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHl0el8yMDIyLjQuYmIKaW5kZXggYmI3YWVlZWMzNS4uMzMwMzE0ZjFiZCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyMi4yLjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyMi40LmJi
CkBAIC01LDcgKzUsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDtt
ZDU9MWE2N2ZjNDZjMWI1OTZjY2U1ZDIxMjA5YmJlNzU5OTkiCiAKIGluaGVyaXQgcHlwaSBzZXR1
cHRvb2xzMyBwdGVzdAogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2VhMjIxNDE3MjA0ZjJkMWEy
YWEwM2RkYWUzZTg2NzkyMTk3MWQwZDc2ZjE0ZDg3YWJiNDQxNDQxNWJiZGNmNSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI0OGNlNzk5ZDgzYjZmOGFhYjIwMjBlMzY5YjYyNzQ0NjY5NjYxOWU3OTY0
NTQxOTYxMGI5ZmFjZDkwOWIzMTc0IgogCiBSREVQRU5EUzoke1BOfTpjbGFzcy10YXJnZXQgKz0g
IlwKICAgICAke1BZVEhPTl9QTn0tZGF0ZXRpbWUgXAotLSAKMi4zMS4xCgo=

--===============0148022619985881893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info was added
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info/zip-safe was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info was removed
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/WHEEL was removed
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/zip-safe was removed

--===============0148022619985881893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytz: PKGV changed from 2022.2.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-pytz: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2022.2.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2022.4.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-pytz: PV changed from "2022.2.1" to "2022.4"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dbg: PKGV changed from 2022.2.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dbg: PV changed from "2022.2.1" to "2022.4"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dev: PKGV changed from 2022.2.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dev: PV changed from "2022.2.1" to "2022.4"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-doc: PKGV changed from 2022.2.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-doc: PV changed from "2022.2.1" to "2022.4"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-locale: PKGV changed from 2022.2.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-locale: PV changed from "2022.2.1" to "2022.4"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PKGSIZE changed from 59168 to 59166 (-0%)
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PKGV changed from 2022.2.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PV changed from "2022.2.1" to "2022.4"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-src: PKGV changed from 2022.2.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-src: PV changed from "2022.2.1" to "2022.4"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-staticdev: PKGV changed from 2022.2.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-staticdev: PV changed from "2022.2.1" to "2022.4"
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PKGSIZE changed from 1054609 to 1055107 (+0%)
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PKGV changed from 2022.2.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PV changed from "2022.2.1" to "2022.4"
Changes to packages/core2-32-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info was added
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/pytz-2022.4.dist-info/zip-safe was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info was removed
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/WHEEL was removed
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/zip-safe was removed

--===============0148022619985881893==--

