Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82974C77B6C
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.145452.1671136354512042685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QrPWz38m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185177d1ea8-b3f97961-c4fd-4e9a-bd05-2676d8f8e179-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136354;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=HGTIcFPNUPB4wJ0mO9V1cvtiziPAy9iVZxrKKwFq7SU=;
	b=QrPWz38mp04r/SgYpSUewksoND1lBEVrsN8KNWZYssymboxqOaOAI2/3gHi+iX82
	P9HwOrnu0/DwI/EY0lMLXY1wW7TuSGEd9xVzm+1CJzcKQofi1AQUCXSH+51u9GgXLwg
	WmCZ7ICHsaDYPAMiqbeH1vVXpoiWgbNHQhiAUkzA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136354;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=HGTIcFPNUPB4wJ0mO9V1cvtiziPAy9iVZxrKKwFq7SU=;
	b=E3XTvruoyrK6qAdfF3mIrFAFw+1veEe/s80y/9VODjBaaYUxW+jqJBh9m7kZjh9U
	7vv60K5TqJUJQbe9LQ3c71UiRJlYmb4yuB3pjfbhRXfAcOUzDAQyXTHA2w1OpZ84hld
	r0QTNdLjIu7u0MsE3fWQmEKt1vBy1naev9+3OIAI=
Content-Type: multipart/mixed; boundary="===============1923795045041447014=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcre2: upgrading to 10.42 SUCCEEDED
Message-ID: <01010185177d1ea8-b3f97961-c4fd-4e9a-bd05-2676d8f8e179-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174719

--===============1923795045041447014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpcre2* to *10.42* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcre2-upgrade-10.41-10.42.patch
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
--===============1923795045041447014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpcre2: SRC_URI changed from "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.41/pcre2-10.41.tar.bz2" to "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.bz2"
packages/core2-32-poky-linux/libpcre2: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-16.so.0.11.1", added "/usr/lib/libpcre2-16.so.0.11.2"
packages/core2-32-poky-linux/libpcre2/libpcre2-16: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/libpcre2-16: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-32.so.0.11.1", added "/usr/lib/libpcre2-32.so.0.11.2"
packages/core2-32-poky-linux/libpcre2/libpcre2-32: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/libpcre2-32: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-dbg: FILELIST: removed "/usr/lib/.debug/libpcre2-8.so.0.11.1 /usr/lib/.debug/libpcre2-16.so.0.11.1 /usr/lib/.debug/libpcre2-32.so.0.11.1 /usr/lib/.debug/libpcre2-posix.so.3.0.3", added "/usr/lib/.debug/libpcre2-posix.so.3.0.4 /usr/lib/.debug/libpcre2-8.so.0.11.2 /usr/lib/.debug/libpcre2-16.so.0.11.2 /usr/lib/.debug/libpcre2-32.so.0.11.2"
packages/core2-32-poky-linux/libpcre2/libpcre2-dbg: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/libpcre2-dbg: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-dbg: PKGSIZE changed from 2058132 to 2058824 (+0%)
packages/core2-32-poky-linux/libpcre2/libpcre2-dev: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/libpcre2-dev: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-dev: PKGSIZE changed from 55509 to 56038 (+1%)
packages/core2-32-poky-linux/libpcre2/libpcre2-doc: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/libpcre2-doc: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-doc: PKGSIZE changed from 2534577 to 2537659 (+0%)
packages/core2-32-poky-linux/libpcre2/libpcre2-locale: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/libpcre2-locale: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-src: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/libpcre2-src: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-src: PKGSIZE changed from 2577442 to 2577856 (+0%)
packages/core2-32-poky-linux/libpcre2/libpcre2-staticdev: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/libpcre2-staticdev: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-8.so.0.11.1 /usr/lib/libpcre2-posix.so.3.0.3", added "/usr/lib/libpcre2-8.so.0.11.2 /usr/lib/libpcre2-posix.so.3.0.4"
packages/core2-32-poky-linux/libpcre2/libpcre2: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/libpcre2: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/pcre2grep-doc: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/pcre2grep-doc: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/pcre2grep: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/pcre2grep: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/pcre2test-doc: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/pcre2test-doc: PKGV changed from 10.41 [default] to 10.42 [default]
packages/core2-32-poky-linux/libpcre2/pcre2test: PV changed from "10.41" to "10.42"
packages/core2-32-poky-linux/libpcre2/pcre2test: PKGV changed from 10.41 [default] to 10.42 [default]
Changes to packages/core2-32-poky-linux/libpcre2 (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.11.1 to libpcre2-16.so.0.11.2
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.11.1 to libpcre2-16.so.0.11.2
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.11.1 to libpcre2-32.so.0.11.2
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.11.1 to libpcre2-32.so.0.11.2
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.11.1 to libpcre2-8.so.0.11.2
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.11.1 to libpcre2-8.so.0.11.2
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.3 to libpcre2-posix.so.3.0.4
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.3 to libpcre2-posix.so.3.0.4
  /usr/lib/libpcre2-8.so.0.11.1 moved to /usr/lib/libpcre2-8.so.0.11.2
  /usr/lib/libpcre2-posix.so.3.0.3 moved to /usr/lib/libpcre2-posix.so.3.0.4
  /usr/lib/libpcre2-16.so.0.11.2 was added
  /usr/lib/libpcre2-32.so.0.11.2 was added
  /usr/lib/libpcre2-16.so.0.11.1 was removed
  /usr/lib/libpcre2-32.so.0.11.1 was removed
Changes to packages/x86_64-linux/libmpc-native (sysroot):
  /usr/lib/libmpc.so.3 changed symlink target from libmpc.so.3.3.0 to libmpc.so.3.2.1
  /usr/lib/libmpc.so changed symlink target from libmpc.so.3.3.0 to libmpc.so.3.2.1
  /usr/lib/libmpc.so.3.3.0 moved to /usr/lib/libmpc.so.3.2.1
Changes to packages/x86_64-linux/libpcre2-native (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.11.1 to libpcre2-16.so.0.11.2
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.11.1 to libpcre2-16.so.0.11.2
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.11.1 to libpcre2-32.so.0.11.2
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.11.1 to libpcre2-32.so.0.11.2
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.11.1 to libpcre2-8.so.0.11.2
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.11.1 to libpcre2-8.so.0.11.2
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.3 to libpcre2-posix.so.3.0.4
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.3 to libpcre2-posix.so.3.0.4
  /usr/lib/libpcre2-8.so.0.11.1 moved to /usr/lib/libpcre2-8.so.0.11.2
  /usr/lib/libpcre2-posix.so.3.0.3 moved to /usr/lib/libpcre2-posix.so.3.0.4
  /usr/lib/libpcre2-16.so.0.11.2 was added
  /usr/lib/libpcre2-32.so.0.11.2 was added
  /usr/lib/libpcre2-16.so.0.11.1 was removed
  /usr/lib/libpcre2-32.so.0.11.1 was removed

--===============1923795045041447014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-16.so.0.11.1", added "/usr/lib/libpcre2-16.so.0.11.2"
packages/core2-32-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-32.so.0.11.1", added "/usr/lib/libpcre2-32.so.0.11.2"
packages/core2-32-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-posix.so.3.0.3 /usr/lib/libpcre2-8.so.0.11.1", added "/usr/lib/libpcre2-posix.so.3.0.4 /usr/lib/libpcre2-8.so.0.11.2"
Changes to packages/core2-32-poky-linux/libpcre2 (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.11.1 to libpcre2-16.so.0.11.2
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.11.1 to libpcre2-16.so.0.11.2
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.11.1 to libpcre2-32.so.0.11.2
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.11.1 to libpcre2-32.so.0.11.2
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.11.1 to libpcre2-8.so.0.11.2
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.11.1 to libpcre2-8.so.0.11.2
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.3 to libpcre2-posix.so.3.0.4
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.3 to libpcre2-posix.so.3.0.4
  /usr/lib/libpcre2-8.so.0.11.1 moved to /usr/lib/libpcre2-8.so.0.11.2
  /usr/lib/libpcre2-posix.so.3.0.3 moved to /usr/lib/libpcre2-posix.so.3.0.4
  /usr/lib/libpcre2-16.so.0.11.2 was added
  /usr/lib/libpcre2-32.so.0.11.2 was added
  /usr/lib/libpcre2-16.so.0.11.1 was removed
  /usr/lib/libpcre2-32.so.0.11.1 was removed
Changes to packages/x86_64-linux/libmpc-native (sysroot):
  /usr/lib/libmpc.so.3 changed symlink target from libmpc.so.3.3.0 to libmpc.so.3.2.1
  /usr/lib/libmpc.so changed symlink target from libmpc.so.3.3.0 to libmpc.so.3.2.1
  /usr/lib/libmpc.so.3.3.0 moved to /usr/lib/libmpc.so.3.2.1
Changes to packages/x86_64-linux/libpcre2-native (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.11.1 to libpcre2-16.so.0.11.2
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.11.1 to libpcre2-16.so.0.11.2
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.11.1 to libpcre2-32.so.0.11.2
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.11.1 to libpcre2-32.so.0.11.2
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.11.1 to libpcre2-8.so.0.11.2
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.11.1 to libpcre2-8.so.0.11.2
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.3 to libpcre2-posix.so.3.0.4
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.3 to libpcre2-posix.so.3.0.4
  /usr/lib/libpcre2-8.so.0.11.1 moved to /usr/lib/libpcre2-8.so.0.11.2
  /usr/lib/libpcre2-posix.so.3.0.3 moved to /usr/lib/libpcre2-posix.so.3.0.4
  /usr/lib/libpcre2-16.so.0.11.2 was added
  /usr/lib/libpcre2-32.so.0.11.2 was added
  /usr/lib/libpcre2-16.so.0.11.1 was removed
  /usr/lib/libpcre2-32.so.0.11.1 was removed

--===============1923795045041447014==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpcre2-upgrade-10.41-10.42.patch"

RnJvbSA3Y2U2ZTZiMGYyODcyNDQzNWY1MDUyYjJiNDNiZjZjMTFjNWQ1Mzk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMjA6MTU6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwY3JlMjogdXBncmFkZSAxMC40MSAtPiAxMC40MgoKLS0tCiAuLi4vbGlicGNyZS97bGlicGNy
ZTJfMTAuNDEuYmIgPT4gbGlicGNyZTJfMTAuNDIuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJwY3JlL3tsaWJwY3JlMl8xMC40MS5iYiA9PiBsaWJwY3JlMl8xMC40
Mi5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwY3JlL2xp
YnBjcmUyXzEwLjQxLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicGNyZS9saWJwY3JlMl8x
MC40Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJwY3JlL2xpYnBjcmUyXzEwLjQxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJwY3JlL2xpYnBjcmUyXzEwLjQyLmJiCmluZGV4IDJhNTBkMDcxOTIuLmNkNjU0OTNj
NDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBjcmUvbGlicGNyZTJfMTAu
NDEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicGNyZS9saWJwY3JlMl8xMC40Mi5i
YgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9h
ZC9wY3JlMi0ke1BWfS9wY3JlMi0ke1BWfS50YXIuYnoyIgogR0lUSFVCX0JBU0VfVVJJID0gImh0
dHBzOi8vZ2l0aHViLmNvbS9QaGlsaXBIYXplbC9wY3JlMi9yZWxlYXNlcyIKIFVQU1RSRUFNX0NI
RUNLX1JFR0VYID0gInJlbGVhc2VzL3RhZy9wY3JlMi0oP1A8cHZlcj4uKykiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICIwZjc4Y2ViZDNlMjhlMzQ2NDc1ZmI5MmU5NWZlOTk5OTk0NWI0Y2JhYWQ1
ZjNiNDJhY2E0N2I4ODdmYjUzMzA4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhkMzZjZDhjYjZl
YTJhNGMyYmIzNThmZjY0MTFiMGM3ODg2MzNhMmE0NWRhYmJmMWFlYjRiNzAxZDFiNWU4NDAiCiAK
IENWRV9QUk9EVUNUID0gInBjcmUyIgogCi0tIAoyLjM3LjMKCg==

--===============1923795045041447014==--

