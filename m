Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E9BC19F2F
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:02 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.42635.1738416055133515208
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=N2Go1dQ5;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GwiaaQzk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194c1abf686-35bfc07d-0702-47b5-b1e1-41f5832bf2a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dG0gAtYIlFpW/35e95kRk/TH//KK6KyIIiCOdjKJuao=;
	b=N2Go1dQ5p7IheFZdM1uRD9r/v8zVxrpWdco7Yyfi0m8fudvNeTLkQNzK3CThQTJt
	cq0DyCDI+ZTvzQnsew+Mo4BC5xRK8zNNcoEmbzGCN33TD6Wmh3mkH/+AvbPsBiS0N1g
	PjD/UXZWZKWgtbFlpI361Oyf7zpPZ3PWCwS2G/ZQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dG0gAtYIlFpW/35e95kRk/TH//KK6KyIIiCOdjKJuao=;
	b=GwiaaQzkut5LhV3B6SBBOX4NDrdSb5scRa//FBrRDxiHrmrK8CMZoU5YCjg0rl9V
	w/KRY3NGoJAvblbNVceMDOz4ljWCU+IEx3OAf+Yb+dAVPAdaByWiSvkcgkM6tKjgD+T
	UFN2gGjsGi2Nlit5gTk6mc51L1zVfKJ6PN2yQVrM=
Content-Type: multipart/mixed; boundary="===============5872360343334014239=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.7.0 SUCCEEDED
Message-ID: <01010194c1abf686-35bfc07d-0702-47b5-b1e1-41f5832bf2a2-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210563

--===============5872360343334014239==
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
From c2730be7260b0cc2e8908e3e56d156d155c2a5e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 10:23:40 +0000
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


--===============5872360343334014239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sysklogd: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 214944 to 239240 (+11%)
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: FILELIST: removed "/usr/lib/.debug/libsyslog.so.0.1.0", added "/usr/lib/.debug/libsyslog.so.0.2.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PKGSIZE changed from 9733 to 9858 (+1%)
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 97977 to 110465 (+13%)
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 150975 to 168340 (+12%)
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.6.2" to "2.7.0"
packages/core2-64-poky-linux/sysklogd/sysklogd: PKGSIZE changed from 98508 to 102716 (+4%)
packages/core2-64-poky-linux/sysklogd/sysklogd: FILELIST: removed "/usr/lib/libsyslog.so.0.1.0", added "/usr/lib/libsyslog.so.0.2.0"
packages/core2-64-poky-linux/sysklogd/sysklogd: PKGV changed from 2.6.2 [default] to 2.7.0 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd: PV changed from "2.6.2" to "2.7.0"
Changes to packages/core2-64-poky-linux/sysklogd (sysroot):
  /usr/lib/libsyslog.so.0 changed symlink target from libsyslog.so.0.1.0 to libsyslog.so.0.2.0
  /usr/lib/libsyslog.so changed symlink target from libsyslog.so.0.1.0 to libsyslog.so.0.2.0
  /usr/lib/libsyslog.so.0.1.0 moved to /usr/lib/libsyslog.so.0.2.0

--===============5872360343334014239==
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

--===============5872360343334014239==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.6.2-2.7.0.patch"

RnJvbSBjMjczMGJlNzI2MGIwY2MyZTg5MDhlM2U1NmQxNTZkMTU1YzJhNWU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMDoyMzo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c2tsb2dkOiB1cGdyYWRlIDIuNi4yIC0+IDIuNy4wCgotLS0KIC4uLi9zeXNrbG9nZC97c3lza2xv
Z2RfMi42LjIuYmIgPT4gc3lza2xvZ2RfMi43LjAuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC97c3lza2xvZ2RfMi42LjIuYmIgPT4gc3lza2xvZ2RfMi43
LjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dk
L3N5c2tsb2dkXzIuNi4yLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2ts
b2dkXzIuNy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjYuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2tsb2dkXzIuNy4wLmJiCmluZGV4IDdmMDY3MzhkMDAu
LmFmOGFiYjU2YjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9z
eXNrbG9nZF8yLjYuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lz
a2xvZ2RfMi43LjAuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL3Ryb2dsb2JpdC9zeXNrbG9nZC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcwog
ICAgICAgICAgICBmaWxlOi8vc3lza2xvZ2QgXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJj
MWY4ODQyODUzMzc4NzgxYzJmZGY2ZTcwMDcwYTk1NTM5YmE3ZDJlIgorU1JDUkVWID0gImI0NWVi
NDg3Yjk2OTM1YzcyZmM5OTdkODQwZjgyZWNmNjUwZWQ4YTUiCiAKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKLS0gCjIuNDQuMQoK

--===============5872360343334014239==--

