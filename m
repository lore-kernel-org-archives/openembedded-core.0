Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC78C7EE43
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.3713.1684186747962006618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HmGnOIE1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010188215a621c-134064f1-a61f-4dea-a26f-7c18c88f5d70-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hkqLHOxFldgj2O7U98cu5vLIZ3bsDAWl6YJztHYprN0=;
	b=HmGnOIE1oEhMDDPruSrJK0swJsHJiAQFuoS5LVgsXd/ENCf6JnIO4elmUJ1G0MGU
	DavzbRyU9fUPCRUVPst62R0O/m7jGfpXXh6wcs8Ff602lEh8FpyeTuQ/2bS3ssqhaQy
	yFc98iWZsq10hLeRwSgNi0gFVHeUgE4saeBXxhDg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hkqLHOxFldgj2O7U98cu5vLIZ3bsDAWl6YJztHYprN0=;
	b=jshKbiimj1uS66YUlNLnUZxO4sgGdEfRe+sPebmRNTXX9dzlBZYn94j0+Tdqb5O5
	txUu2Ci6xK3T9/p2woIfrqIExv3Q0Ltrrnujqu9SwglxgLM7mMzklv3UIbl3Bd9kMhi
	4SowGpsh64pGrlluyTQTuXNPR8OmwrxrjUeYw1p4=
Content-Type: multipart/mixed; boundary="===============0546005943666649548=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apr: upgrading to 1.7.4 SUCCEEDED
Message-ID: <01010188215a621c-134064f1-a61f-4dea-a26f-7c18c88f5d70-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181377

--===============0546005943666649548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *apr* to *1.7.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-apr-upgrade-1.7.3-1.7.4.patch
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
--===============0546005943666649548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/apr/apr-bin: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-bin: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-dbg: FILELIST: removed "/usr/lib/.debug/libapr-1.so.0.7.3", added "/usr/lib/.debug/libapr-1.so.0.7.4"
packages/core2-32-poky-linux/apr/apr-dbg: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-dbg: PKGSIZE changed from 1191572 to 1191520 (-0%)
packages/core2-32-poky-linux/apr/apr-dbg: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-dev: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-dev: PKGSIZE changed from 573258 to 573259 (+0%)
packages/core2-32-poky-linux/apr/apr-dev: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-doc: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-doc: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-locale: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-locale: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-ptest: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-ptest: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-src: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-src: PKGSIZE changed from 2024092 to 2023863 (-0%)
packages/core2-32-poky-linux/apr/apr-src: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-staticdev: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-staticdev: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr: FILELIST: removed "/usr/lib/libapr-1.so.0.7.3", added "/usr/lib/libapr-1.so.0.7.4"
packages/core2-32-poky-linux/apr/apr: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr: SRC_URI changed from "https://archive.apache.org/dist/apr/apr-1.7.3.tar.bz2 file://run-ptest file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch file://0004-Fix-packet-discards-HTTP-redirect.patch file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch file://libtoolize_check.patch file://0001-Add-option-to-disable-timed-dependant-tests.patch file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch" to "https://archive.apache.org/dist/apr/apr-1.7.4.tar.bz2 file://run-ptest file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch file://0004-Fix-packet-discards-HTTP-redirect.patch file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch file://libtoolize_check.patch file://0001-Add-option-to-disable-timed-dependant-tests.patch file://000
 1-configure-Remove-runtime-test-for-mmap-that-can-map-.patch"
packages/core2-32-poky-linux/apr: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
Changes to packages/core2-32-poky-linux/apr (sysroot):
  /usr/lib/libapr-1.so.0 changed symlink target from libapr-1.so.0.7.3 to libapr-1.so.0.7.4
  /usr/lib/libapr-1.so changed symlink target from libapr-1.so.0.7.3 to libapr-1.so.0.7.4
  /usr/lib/libapr-1.so.0.7.3 moved to /usr/lib/libapr-1.so.0.7.4

--===============0546005943666649548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/apr/apr: FILELIST: removed "/usr/lib/libapr-1.so.0.7.3", added "/usr/lib/libapr-1.so.0.7.4"
Changes to packages/core2-32-poky-linux/apr (sysroot):
  /usr/lib/libapr-1.so.0 changed symlink target from libapr-1.so.0.7.3 to libapr-1.so.0.7.4
  /usr/lib/libapr-1.so changed symlink target from libapr-1.so.0.7.3 to libapr-1.so.0.7.4
  /usr/lib/libapr-1.so.0.7.3 moved to /usr/lib/libapr-1.so.0.7.4

--===============0546005943666649548==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-apr-upgrade-1.7.3-1.7.4.patch"

RnJvbSAxYWZkZDE3YmI0MWQyNTBhMTAxZDEzMzljZGVlZjE0Zjg4MGRmM2ViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMjA6Mjg6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
cHI6IHVwZ3JhZGUgMS43LjMgLT4gMS43LjQKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBy
L3thcHJfMS43LjMuYmIgPT4gYXByXzEuNy40LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2Fwci97YXByXzEuNy4zLmJiID0+IGFwcl8xLjcuNC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIvYXByXzEuNy4zLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvYXByL2Fwcl8xLjcuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9hcHIvYXByXzEuNy4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9hcHIvYXByXzEuNy40LmJiCmluZGV4IDlhOTNmZTA5NjcuLmU1NzE0NjkzNDEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHJfMS43LjMuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwcl8xLjcuNC5iYgpAQCAtMjQsNyArMjQsNyBAQCBTUkNf
VVJJID0gIiR7QVBBQ0hFX01JUlJPUn0vYXByLyR7QlBOfS0ke1BWfS50YXIuYnoyIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtY29uZmlndXJlLVJlbW92ZS1ydW50aW1lLXRlc3QtZm9yLW1tYXAt
dGhhdC1jYW4tbWFwLS5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjQ1NWUyMThjMDYwYzQ3NGYyYzgzNDgxNjg3M2Y2ZWQ2OWMwY2YwZTRjZmVlNTQyODJjYzkz
ZThlOTg5ZWU1OWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmM2NDhkZTk4M2YzYTJhNmM5ZTc4
ZGVhMWYxODA2MzliZDJmYWQ2YzA2ZDU1NmQ0MzY3YTcwMWZlNWMzNTU3NyIKIAogaW5oZXJpdCBh
dXRvdG9vbHMtYnJva2Vuc2VwIGxpYl9wYWNrYWdlIGJpbmNvbmZpZyBtdWx0aWxpYl9oZWFkZXIg
cHRlc3QgbXVsdGlsaWJfc2NyaXB0CiAKLS0gCjIuMzkuMgoK

--===============0546005943666649548==--

