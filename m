Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2999FCCF96E
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:15 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.5739.1693650554863721920
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MbUem8mf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=c2EkTjmu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018a55708d86-8bf34137-b3fb-4acd-a9d2-af67d5e9fb7a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=unDC/tgvJ3F5kUkWLC8JLG/3lSWvuXKJuvvU/eOpmWs=;
	b=MbUem8mfU5P9jLh6FdunXubcupQWbr20T+q+L7JHrscfqQSt/rexSp4yVuaVW0vC
	VdKoW+am76FkuGu9swsxAicZbOQfIBn3+EurQg1XYXYLW7285hgQXXuGiduyaieH+B0
	aRRm54fIEgk8HmP+MsmNgvGNXFwEsd6Ksx/G7iXc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=unDC/tgvJ3F5kUkWLC8JLG/3lSWvuXKJuvvU/eOpmWs=;
	b=c2EkTjmuPjuGn4FzlR5Q8m7RWViAymdKmUL7xXmKAzFhZBF3c8oMpBkxkLacuE4g
	9LNPUIwfuGv7VP3kURIn1O2+5TKSuIAx91Ek4wlrFqQ8UWax0MACiNKFPZSMCApbgB3
	IZRJe90EAXoNHJIVrxCbAbfZoO+VhJ6lrRVxXW6I=
Content-Type: multipart/mixed; boundary="===============5134387747132729499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.5.2 SUCCEEDED
Message-ID: <0101018a55708d86-8bf34137-b3fb-4acd-a9d2-af67d5e9fb7a-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187100

--===============5134387747132729499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysklogd* to *2.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.5.0-2.5.2.patch
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
From f89bdd8701a44007eae1d77df2a387740391b816 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 21:02:33 +0000
Subject: [PATCH] sysklogd: upgrade 2.5.0 -> 2.5.2

---
 .../sysklogd/{sysklogd_2.5.0.bb => sysklogd_2.5.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.5.0.bb => sysklogd_2.5.2.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
index 096bd376d7..c9c9055142 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "b6d1ae26671a85e6087c98ec8b630855fc52886a"
+SRCREV = "3332c550f1a68393daec5d64cd81f3b7674c0af5"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============5134387747132729499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysklogd: PV changed from "2.5.0" to "2.5.2"
packages/core2-32-poky-linux/sysklogd: PKGV changed from 2.5.0 [default] to 2.5.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.5.0" to "2.5.2"
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.5.0 [default] to 2.5.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 166136 to 165600 (-0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.5.0" to "2.5.2"
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.5.0 [default] to 2.5.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGSIZE changed from 9554 to 9557 (+0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.5.0" to "2.5.2"
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.5.0 [default] to 2.5.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 92563 to 93833 (+1%)
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.5.0" to "2.5.2"
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.5.0 [default] to 2.5.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PV changed from "2.5.0" to "2.5.2"
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.5.0 [default] to 2.5.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 145938 to 145808 (-0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.5.0" to "2.5.2"
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.5.0 [default] to 2.5.2 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd: PV changed from "2.5.0" to "2.5.2"
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGV changed from 2.5.0 [default] to 2.5.2 [default]

--===============5134387747132729499==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.5.0-2.5.2.patch"

RnJvbSBmODliZGQ4NzAxYTQ0MDA3ZWFlMWQ3N2RmMmEzODc3NDAzOTFiODE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAyMTowMjozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c2tsb2dkOiB1cGdyYWRlIDIuNS4wIC0+IDIuNS4yCgotLS0KIC4uLi9zeXNrbG9nZC97c3lza2xv
Z2RfMi41LjAuYmIgPT4gc3lza2xvZ2RfMi41LjIuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC97c3lza2xvZ2RfMi41LjAuYmIgPT4gc3lza2xvZ2RfMi41
LjIuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dk
L3N5c2tsb2dkXzIuNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2ts
b2dkXzIuNS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2tsb2dkXzIuNS4yLmJiCmluZGV4IDA5NmJkMzc2ZDcu
LmM5YzkwNTUxNDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9z
eXNrbG9nZF8yLjUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lz
a2xvZ2RfMi41LjIuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL3Ryb2dsb2JpdC9zeXNrbG9nZC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcwog
ICAgICAgICAgICBmaWxlOi8vc3lza2xvZ2QgXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJi
NmQxYWUyNjY3MWE4NWU2MDg3Yzk4ZWM4YjYzMDg1NWZjNTI4ODZhIgorU1JDUkVWID0gIjMzMzJj
NTUwZjFhNjgzOTNkYWVjNWQ2NGNkODFmM2I3Njc0YzBhZjUiCiAKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKLS0gCjIuMzkuMgoK

--===============5134387747132729499==--

