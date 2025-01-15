Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9500BC02195
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.17800.1736936770951580473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=G3ebbNqT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=aLWSERPM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194697fda27-fe1a3a6c-67b5-4755-99c3-0c995fbbf877-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936774;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0E6l3XCPxWUn0p9qfc1o4v7B/se9z6azuBBxnIK+2hg=;
	b=G3ebbNqT/Ay8s0+KFOHqbsOzRWFOhzWRJVOriy3WEw6z3BjVer5jFEWnkMHcRtzJ
	62ssZdqvrlMXpCLb2KN2ZOOWIqfnl4fZVFkwI0g5/8uLNF65AKJx+p138NK9eBqNeku
	G6PXuHwQIMcI7GCRVH+C2wFMSFCyyMobkC3DPX+0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936774;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0E6l3XCPxWUn0p9qfc1o4v7B/se9z6azuBBxnIK+2hg=;
	b=aLWSERPM/3C0yxG0MoLRJ208xOxI6yiY9yUU5Zd6KglfVRGuxHgk0+oWm643SI9p
	hmSTp+a8WSC2MQIoS0OQM+YkDWVP+n9DfOS/CvCZbau15CQW+0nexOLIEaAbqFH3Nwb
	3JbrM/Ky5+DpX2K4UmhWr/PlZSEt6+c5vfVYZsv0=
Content-Type: multipart/mixed; boundary="===============3681199067268596673=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.7.0 SUCCEEDED
Message-ID: <01010194697fda27-fe1a3a6c-67b5-4755-99c3-0c995fbbf877-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209862

--===============3681199067268596673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysklogd* to *2.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.6.2-2.7.0.patch
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

-- >8 --
From 67eb5ae515bef05867174af9c8ad06572db0e4ef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 08:39:06 +0000
Subject: [PATCH] sysklogd: upgrade 2.6.2 -> 2.7.0

---
 .../sysklogd/{sysklogd_2.6.2.bb => sysklogd_2.7.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.6.2.bb => sysklogd_2.7.0.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.6.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.7.0.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.6.2.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.7.0.bb
index 7f06738d00..af8abb56b4 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.6.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.7.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "c1f8842853378781c2fdf6e70070a95539ba7d2e"
+SRCREV = "b45eb487b96935c72fc997d840f82ecf650ed8a5"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============3681199067268596673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sysklogd: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: FILELIST: removed "/usr/lib/.debug/libsyslog.so.0.1.0", added "/usr/lib/.debug/libsyslog.so.0.2.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 214944 to 239240 (+11%)
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PKGSIZE changed from 9733 to 9858 (+1%)
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 97977 to 110465 (+13%)
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 150975 to 168340 (+12%)
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd: FILELIST: removed "/usr/lib/libsyslog.so.0.1.0", added "/usr/lib/libsyslog.so.0.2.0"
packages/core2-64-poky-linux/sysklogd/sysklogd: PKGSIZE changed from 98508 to 102716 (+4%)
Changes to packages/core2-64-poky-linux/sysklogd (sysroot):
  /usr/lib/libsyslog.so.0 changed symlink target from libsyslog.so.0.1.0 to libsyslog.so.0.2.0
  /usr/lib/libsyslog.so changed symlink target from libsyslog.so.0.1.0 to libsyslog.so.0.2.0
  /usr/lib/libsyslog.so.0.1.0 moved to /usr/lib/libsyslog.so.0.2.0

--===============3681199067268596673==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.6.2-2.7.0.patch"

RnJvbSA2N2ViNWFlNTE1YmVmMDU4NjcxNzRhZjljOGFkMDY1NzJkYjBlNGVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDg6Mzk6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXNrbG9nZDogdXBncmFkZSAyLjYuMiAtPiAyLjcuMAoKLS0tCiAuLi4vc3lza2xvZ2Qve3N5c2ts
b2dkXzIuNi4yLmJiID0+IHN5c2tsb2dkXzIuNy4wLmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qve3N5c2tsb2dkXzIuNi4yLmJiID0+IHN5c2tsb2dkXzIu
Ny4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9n
ZC9zeXNrbG9nZF8yLjYuMi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNr
bG9nZF8yLjcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lza2xvZ2RfMi42LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjcuMC5iYgppbmRleCA3ZjA2NzM4ZDAw
Li5hZjhhYmI1NmI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qv
c3lza2xvZ2RfMi42LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5
c2tsb2dkXzIuNy4wLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS90cm9nbG9iaXQvc3lza2xvZ2QuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMK
ICAgICAgICAgICAgZmlsZTovL3N5c2tsb2dkIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAi
YzFmODg0Mjg1MzM3ODc4MWMyZmRmNmU3MDA3MGE5NTUzOWJhN2QyZSIKK1NSQ1JFViA9ICJiNDVl
YjQ4N2I5NjkzNWM3MmZjOTk3ZDg0MGY4MmVjZjY1MGVkOGE1IgogCiBTID0gIiR7V09SS0RJUn0v
Z2l0IgogCi0tIAoyLjQ0LjEKCg==

--===============3681199067268596673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 214944 to 239240 (+11%)
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 97977 to 110465 (+13%)
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 150975 to 168340 (+12%)
packages/core2-64-poky-linux/sysklogd/sysklogd: FILELIST: removed "/usr/lib/libsyslog.so.0.1.0", added "/usr/lib/libsyslog.so.0.2.0"
Changes to packages/core2-64-poky-linux/sysklogd (sysroot):
  /usr/lib/libsyslog.so.0 changed symlink target from libsyslog.so.0.1.0 to libsyslog.so.0.2.0
  /usr/lib/libsyslog.so changed symlink target from libsyslog.so.0.1.0 to libsyslog.so.0.2.0
  /usr/lib/libsyslog.so.0.1.0 moved to /usr/lib/libsyslog.so.0.2.0

--===============3681199067268596673==--

