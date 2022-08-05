Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD65C2BB45
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:37 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.3861.1659679409050065168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ss1zEzke;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101826c99ffa3-d6be96f4-c6d4-4db3-aaa0-7519baab201d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+8caF246J6TeVBerpRCCt/5N6OnbIJIv5nt56ZUr2CA=;
	b=Ss1zEzketWh9KFf43rECwWjs3v3AK0vOYXYiBx8FeaezcRk6oYAN8wFOSqlWc67Z
	0jw01Lflr7962pcD/PIBj55kKmbO14zZQLUowI191Wztgs2Xb5YTnCdHZNo8BYdCC1U
	wUawc2YwvAiJwHTrQarZlrrfOWDQs5qJ+fhzTqjQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+8caF246J6TeVBerpRCCt/5N6OnbIJIv5nt56ZUr2CA=;
	b=PfUuYgZbM7tnBuKYgmUK3tpflMaprn7D4IKmefdQJaM8Aa95x7PQPAhqDEoeAn9t
	vFrwgZvfeejL7cVU3v0o89ez9gE+Ca2MmGRWYKnKHKT8bRec0uSlZPg494xdc/LeHNr
	pB7CukX61CubG/uSgB1ekI9NzuHvd1R1sEQUmBeA=
Content-Type: multipart/mixed; boundary="===============0943709592384196076=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.4.2 SUCCEEDED
Message-ID: 
 <010101826c99ffa3-d6be96f4-c6d4-4db3-aaa0-7519baab201d-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168914

--===============0943709592384196076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysklogd* to *2.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.4.0-2.4.2.patch
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
--===============0943709592384196076==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.4.0-2.4.2.patch"

RnJvbSA5NTYzOWJmZjg1N2M1ZDkxNGI4ZWJmMGZhNjVlMGUwOGNmZjQyZWIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwMDozNDozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c2tsb2dkOiB1cGdyYWRlIDIuNC4wIC0+IDIuNC4yCgotLS0KIC4uLi9zeXNrbG9nZC97c3lza2xv
Z2RfMi40LjAuYmIgPT4gc3lza2xvZ2RfMi40LjIuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC97c3lza2xvZ2RfMi40LjAuYmIgPT4gc3lza2xvZ2RfMi40
LjIuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dk
L3N5c2tsb2dkXzIuNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2ts
b2dkXzIuNC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2tsb2dkXzIuNC4yLmJiCmluZGV4IDRlNmRhNzBlNGEu
Ljk0OGFjYmNmNTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9z
eXNrbG9nZF8yLjQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lz
a2xvZ2RfMi40LjIuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL3Ryb2dsb2JpdC9zeXNrbG9nZC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcwog
ICAgICAgICAgICBmaWxlOi8vc3lza2xvZ2QgXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICI3
ZGM0NzgzYWY4ZThlMGQyMDBkMzhhODdiNmE0YmM5YmJlYzVjZTkyIgorU1JDUkVWID0gIjc4NTA1
OTEzODg4YjcxYjJmYTJlODYxNjYzNmZjYzQzMGZmYTMwYmIiCiAKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKLS0gCjIuMzEuMQoK

--===============0943709592384196076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/sysklogd/sysklogd: FILELIST: removed "/usr/lib/libsyslog.so.0.0.0", added "/usr/lib/libsyslog.so.0.1.0"
Changes to packages/core2-32-poky-linux/sysklogd (sysroot):
  /usr/lib/libsyslog.so.0 changed symlink target from libsyslog.so.0.0.0 to libsyslog.so.0.1.0
  /usr/lib/libsyslog.so changed symlink target from libsyslog.so.0.0.0 to libsyslog.so.0.1.0
  /usr/lib/libsyslog.so.0.0.0 moved to /usr/lib/libsyslog.so.0.1.0

--===============0943709592384196076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysklogd: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/sysklogd: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 145164 to 150976 (+4%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: FILELIST: removed "/usr/lib/.debug/libsyslog.so.0.0.0", added "/usr/lib/.debug/libsyslog.so.0.1.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGSIZE changed from 9371 to 9564 (+2%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 86560 to 90432 (+4%)
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 143372 to 146736 (+2%)
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGSIZE changed from 87805 to 91941 (+5%)
packages/core2-32-poky-linux/sysklogd/sysklogd: FILELIST: removed "/usr/lib/libsyslog.so.0.0.0", added "/usr/lib/libsyslog.so.0.1.0"
packages/core2-32-poky-linux/sysklogd/sysklogd: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
Changes to packages/core2-32-poky-linux/sysklogd (sysroot):
  /usr/lib/libsyslog.so.0 changed symlink target from libsyslog.so.0.0.0 to libsyslog.so.0.1.0
  /usr/lib/libsyslog.so changed symlink target from libsyslog.so.0.0.0 to libsyslog.so.0.1.0
  /usr/lib/libsyslog.so.0.0.0 moved to /usr/lib/libsyslog.so.0.1.0

--===============0943709592384196076==--

