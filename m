Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE71C77B79
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.12304.1678895727691885703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cJfAzqum;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010186e5fbc0a2-db231ca4-a78b-420f-84ef-32e8c94f9c6b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZiaAUnD+HXpJ63sbPhx8VaAjhNctVbEWbNJocn+A1bE=;
	b=cJfAzqumtTY5qsuTMCdEK3ZKpj7dzfP8xGx1bAp2r6WveO4KnBYoX+DFRxk9fHGi
	bWC3d6WbYs1YWgyE5+FLVsxPjohKwtaeNMXhKY9+jGVE/rMrqXurF5eylpwaLyO8eJu
	FmSo1a7awctBgKAM+r0PcYNdgDIfxnkETWV0SqzA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZiaAUnD+HXpJ63sbPhx8VaAjhNctVbEWbNJocn+A1bE=;
	b=Ld0DgebD31Rup79EQ7W/X2ajRNFNlTAAKRDa62qpC8DNHd0Jnvuv55pVdg1fcTvV
	JRKVzAQ5FMexLlAcwUpht2ptclrbe6KbRQTO9mjPSf+bBwq6h7Q78A5D5leu9EHpOv7
	WkDM8ZzrHK+D42j6EMYHAq03GqV09Ubx5jOBaaCw=
Content-Type: multipart/mixed; boundary="===============0823857293793996232=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.50.14 SUCCEEDED
Message-ID: <01010186e5fbc0a2-db231ca4-a78b-420f-84ef-32e8c94f9c6b-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178621

--===============0823857293793996232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pango* to *1.50.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.50.13-1.50.14.patch
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
--===============0823857293793996232==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.50.13-1.50.14.patch"

RnJvbSBmNWQwN2JkNTc0YzE4ZjI5ZGZkNjk0Mzc2MDIwOTMwMjI0OGNiMTNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTE6NTQ6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
YW5nbzogdXBncmFkZSAxLjUwLjEzIC0+IDEuNTAuMTQKCi0tLQogLi4uL3BhbmdvL3twYW5nb18x
LjUwLjEzLmJiID0+IHBhbmdvXzEuNTAuMTQuYmJ9ICAgICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3twYW5nb18xLjUwLjEzLmJiID0+IHBhbmdvXzEuNTAuMTQu
YmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3Bhbmdv
XzEuNTAuMTMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41MC4xNC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGFuZ28vcGFuZ29fMS41MC4xMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Bh
bmdvL3BhbmdvXzEuNTAuMTQuYmIKaW5kZXggZTY3MzM2NmRjNy4uZWM3YTkxMzAwOSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTAuMTMuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTAuMTQuYmIKQEAgLTI0LDcgKzI0
LDcgQEAgU1JDX1VSSSArPSAiZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLVNraXAtcnVubmluZy10ZXN0LWxheW91dC10ZXN0LnBhdGNoIFwKICAgICAgICAgICAgIgog
Ci1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI1Y2RjZjZkNzYxZDI2YTNlYjk0MTJiNmNi
MDY5YjMyYmQxZDliMDdhYmYxMTYzMjExNjdkOTRjMjE4OTI5OWZkIgorU1JDX1VSSVthcmNoaXZl
LnNoYTI1NnN1bV0gPSAiMWQ2N2YyMDViZmMzMThjMjdhMjljZmRmYjY4Mjg1NjhkZjU2Njc5NWRm
MGNiNTFkMjE4OWNkZTdmMmQ1ODFlOCIKIAogREVQRU5EUyA9ICJnbGliLTIuMCBnbGliLTIuMC1u
YXRpdmUgZm9udGNvbmZpZyBmcmVldHlwZSB2aXJ0dWFsL2xpYmljb252IGNhaXJvIGhhcmZidXp6
IGZyaWJpZGkiCiAKLS0gCjIuMzkuMgoK

--===============0823857293793996232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.5000.13 /usr/lib/libpangocairo-1.0.so.0.5000.13 /usr/lib/libpangoft2-1.0.so.0.5000.13 /usr/lib/libpango-1.0.so.0.5000.13", added "/usr/lib/libpango-1.0.so.0.5000.14 /usr/lib/libpangoft2-1.0.so.0.5000.14 /usr/lib/libpangocairo-1.0.so.0.5000.14 /usr/lib/libpangoxft-1.0.so.0.5000.14"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5000.13 to libpango-1.0.so.0.5000.14
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5000.13 to libpangocairo-1.0.so.0.5000.14
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5000.13 to libpangoft2-1.0.so.0.5000.14
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5000.13 to libpangoxft-1.0.so.0.5000.14
  /usr/lib/libpango-1.0.so.0.5000.13 moved to /usr/lib/libpango-1.0.so.0.5000.14
  /usr/lib/libpangocairo-1.0.so.0.5000.13 moved to /usr/lib/libpangocairo-1.0.so.0.5000.14
  /usr/lib/libpangoft2-1.0.so.0.5000.13 moved to /usr/lib/libpangoft2-1.0.so.0.5000.14
  /usr/lib/libpangoxft-1.0.so.0.5000.13 moved to /usr/lib/libpangoxft-1.0.so.0.5000.14

--===============0823857293793996232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pango: PKGV changed from 1.50.13 [default] to 1.50.14 [default]
packages/core2-32-poky-linux/pango: PV changed from "1.50.13" to "1.50.14"
packages/core2-32-poky-linux/pango: SRC_URI changed from "https://download.gnome.org/sources//pango/1.50/pango-1.50.13.tar.xz;name=archive file://run-ptest file://0001-Skip-running-test-layout-test.patch" to "https://download.gnome.org/sources//pango/1.50/pango-1.50.14.tar.xz;name=archive file://run-ptest file://0001-Skip-running-test-layout-test.patch"
packages/core2-32-poky-linux/pango/pango-dbg: PKGV changed from 1.50.13 [default] to 1.50.14 [default]
packages/core2-32-poky-linux/pango/pango-dbg: PV changed from "1.50.13" to "1.50.14"
packages/core2-32-poky-linux/pango/pango-dbg: PKGSIZE changed from 2390436 to 2390040 (-0%)
packages/core2-32-poky-linux/pango/pango-dbg: FILELIST: removed "/usr/lib/.debug/libpangoft2-1.0.so.0.5000.13 /usr/lib/.debug/libpangocairo-1.0.so.0.5000.13 /usr/lib/.debug/libpango-1.0.so.0.5000.13 /usr/lib/.debug/libpangoxft-1.0.so.0.5000.13", added "/usr/lib/.debug/libpangoxft-1.0.so.0.5000.14 /usr/lib/.debug/libpango-1.0.so.0.5000.14 /usr/lib/.debug/libpangocairo-1.0.so.0.5000.14 /usr/lib/.debug/libpangoft2-1.0.so.0.5000.14"
packages/core2-32-poky-linux/pango/pango-dev: PKGV changed from 1.50.13 [default] to 1.50.14 [default]
packages/core2-32-poky-linux/pango/pango-dev: PV changed from "1.50.13" to "1.50.14"
packages/core2-32-poky-linux/pango/pango-doc: PKGV changed from 1.50.13 [default] to 1.50.14 [default]
packages/core2-32-poky-linux/pango/pango-doc: PV changed from "1.50.13" to "1.50.14"
packages/core2-32-poky-linux/pango/pango-locale: PKGV changed from 1.50.13 [default] to 1.50.14 [default]
packages/core2-32-poky-linux/pango/pango-locale: PV changed from "1.50.13" to "1.50.14"
packages/core2-32-poky-linux/pango/pango-ptest: PKGV changed from 1.50.13 [default] to 1.50.14 [default]
packages/core2-32-poky-linux/pango/pango-ptest: PV changed from "1.50.13" to "1.50.14"
packages/core2-32-poky-linux/pango/pango-src: PKGV changed from 1.50.13 [default] to 1.50.14 [default]
packages/core2-32-poky-linux/pango/pango-src: PV changed from "1.50.13" to "1.50.14"
packages/core2-32-poky-linux/pango/pango-src: PKGSIZE changed from 2328087 to 2326959 (-0%)
packages/core2-32-poky-linux/pango/pango-staticdev: PKGV changed from 1.50.13 [default] to 1.50.14 [default]
packages/core2-32-poky-linux/pango/pango-staticdev: PV changed from "1.50.13" to "1.50.14"
packages/core2-32-poky-linux/pango/pango: PKGV changed from 1.50.13 [default] to 1.50.14 [default]
packages/core2-32-poky-linux/pango/pango: PV changed from "1.50.13" to "1.50.14"
packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.5000.13 /usr/lib/libpango-1.0.so.0.5000.13 /usr/lib/libpangoft2-1.0.so.0.5000.13 /usr/lib/libpangocairo-1.0.so.0.5000.13", added "/usr/lib/libpango-1.0.so.0.5000.14 /usr/lib/libpangocairo-1.0.so.0.5000.14 /usr/lib/libpangoft2-1.0.so.0.5000.14 /usr/lib/libpangoxft-1.0.so.0.5000.14"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5000.13 to libpango-1.0.so.0.5000.14
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5000.13 to libpangocairo-1.0.so.0.5000.14
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5000.13 to libpangoft2-1.0.so.0.5000.14
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5000.13 to libpangoxft-1.0.so.0.5000.14
  /usr/lib/libpango-1.0.so.0.5000.13 moved to /usr/lib/libpango-1.0.so.0.5000.14
  /usr/lib/libpangocairo-1.0.so.0.5000.13 moved to /usr/lib/libpangocairo-1.0.so.0.5000.14
  /usr/lib/libpangoft2-1.0.so.0.5000.13 moved to /usr/lib/libpangoft2-1.0.so.0.5000.14
  /usr/lib/libpangoxft-1.0.so.0.5000.13 moved to /usr/lib/libpangoxft-1.0.so.0.5000.14

--===============0823857293793996232==--

