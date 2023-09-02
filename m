Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3A2CCF98F
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:26 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5673.1693650552905516454
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PSEQAGKb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IJLMTIgw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a557092e1-d9779d3d-0c67-4c35-af20-ebf89021c685-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4DoELn+QzUeBHvJ1BjmG7LVybYdZYja5sk3wPhyhDs0=;
	b=PSEQAGKbUUNrqmLQpMyhUNiOb32W2Zzf7EMMCaB2mtEMw4rdzAW4NOSVtYX8iv6m
	iGlY7GKwD1JqeZQeJcWahh8rcE37LzcjmTKduGfBtgygHSpc+ZpxFDHNr8HqIw3d8Dx
	jk1vFW0GwpkIZlUe64tWTyktXoJePVcTyx/+/Ck0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4DoELn+QzUeBHvJ1BjmG7LVybYdZYja5sk3wPhyhDs0=;
	b=IJLMTIgwchkKyHYVv13mqxzudM1wED4T/UJ9nmetmD2N8PktWX1ACkOmpzOHDzDs
	b0jLmFMfLhvpzrYXvrnHr5UzOepxjbkvZDDucPef6HSZoiXMGxXl06jusWIgVft9dUn
	+FMIgAvcB2cL07MCTFF2s6wniWlSTZeNWNDf2j9I=
Content-Type: multipart/mixed; boundary="===============4329791208599691599=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-tools: upgrading to 2.13.11 SUCCEEDED
Message-ID: <0101018a557092e1-d9779d3d-0c67-4c35-af20-ebf89021c685-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187124

--===============4329791208599691599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-tools* to *2.13.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lttng-tools-upgrade-2.13.10-2.13.11.patch
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
From 09910d490630b5d5305604441df303d88ff3f298 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 2 Sep 2023 03:46:40 +0000
Subject: [PATCH] lttng-tools: upgrade 2.13.10 -> 2.13.11

---
 .../lttng/{lttng-tools_2.13.10.bb => lttng-tools_2.13.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.10.bb => lttng-tools_2.13.11.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.10.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.10.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
index 20e6375a9b..44415fbf2d 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.10.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
            "
 
-SRC_URI[sha256sum] = "e5d1095ec1322565f38f149346f71967496c281eacc51ec5c77994b850e7d335"
+SRC_URI[sha256sum] = "ac5baeef9fa690936b1ca01ecd1742da762c2c08511ff1b4e923938d94d0f979"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.39.2


--===============4329791208599691599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lttng-tools: SRC_URI changed from "https://lttng.org/files/lttng-tools/lttng-tools-2.13.10.tar.bz2 file://0001-tests-do-not-strip-a-helper-library.patch file://run-ptest file://lttng-sessiond.service file://disable-tests.patch file://0001-compat-Define-off64_t-as-off_t-on-linux.patch" to "https://lttng.org/files/lttng-tools/lttng-tools-2.13.11.tar.bz2 file://0001-tests-do-not-strip-a-helper-library.patch file://run-ptest file://lttng-sessiond.service file://disable-tests.patch file://0001-compat-Define-off64_t-as-off_t-on-linux.patch"
packages/core2-32-poky-linux/lttng-tools: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PKGSIZE changed from 47873856 to 47927524 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PKGSIZE changed from 300269 to 301014 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-locale: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-locale: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: FILELIST: added "/usr/lib/lttng-tools/ptest/tests/regression/tools/client/Makefile /usr/lib/lttng-tools/ptest/tests/regression/tools/client/test_bug1373_events_differ_only_by_loglevel"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PKGSIZE changed from 16587242 to 16615182 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PKGSIZE changed from 6105969 to 6109798 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-staticdev: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-staticdev: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PKGSIZE changed from 5688765 to 5692861 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PV changed from "2.13.10" to "2.13.11"

--===============4329791208599691599==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-tools-upgrade-2.13.10-2.13.11.patch"

RnJvbSAwOTkxMGQ0OTA2MzBiNWQ1MzA1NjA0NDQxZGYzMDNkODhmZjNmMjk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMiBTZXAgMjAyMyAwMzo0Njo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
dG5nLXRvb2xzOiB1cGdyYWRlIDIuMTMuMTAgLT4gMi4xMy4xMQoKLS0tCiAuLi4vbHR0bmcve2x0
dG5nLXRvb2xzXzIuMTMuMTAuYmIgPT4gbHR0bmctdG9vbHNfMi4xMy4xMS5iYn0gICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL3tsdHRuZy10b29sc18yLjEzLjEwLmJiID0+IGx0dG5n
LXRvb2xzXzIuMTMuMTEuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5l
bC9sdHRuZy9sdHRuZy10b29sc18yLjEzLjEwLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRu
Zy9sdHRuZy10b29sc18yLjEzLjExLmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctdG9vbHNfMi4xMy4xMC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy10b29sc18yLjEzLjExLmJiCmluZGV4
IDIwZTYzNzVhOWIuLjQ0NDE1ZmJmMmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwv
bHR0bmcvbHR0bmctdG9vbHNfMi4xMy4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0
dG5nL2x0dG5nLXRvb2xzXzIuMTMuMTEuYmIKQEAgLTM5LDcgKzM5LDcgQEAgU1JDX1VSSSA9ICJo
dHRwczovL2x0dG5nLm9yZy9maWxlcy9sdHRuZy10b29scy9sdHRuZy10b29scy0ke1BWfS50YXIu
YnoyIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtY29tcGF0LURlZmluZS1vZmY2NF90LWFzLW9m
Zl90LW9uLWxpbnV4LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZTVkMTA5NWVjMTMyMjU2NWYzOGYxNDkzNDZmNzE5Njc0OTZjMjgxZWFjYzUxZWM1Yzc3OTk0
Yjg1MGU3ZDMzNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhYzViYWVlZjlmYTY5MDkzNmIxY2Ew
MWVjZDE3NDJkYTc2MmMyYzA4NTExZmYxYjRlOTIzOTM4ZDk0ZDBmOTc5IgogCiBpbmhlcml0IGF1
dG90b29scyBwdGVzdCBwa2djb25maWcgdXNlcmFkZCBweXRob24zLWRpciBtYW5wYWdlcyBzeXN0
ZW1kCiAKLS0gCjIuMzkuMgoK

--===============4329791208599691599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: FILELIST: added "/usr/lib/lttng-tools/ptest/tests/regression/tools/client/test_bug1373_events_differ_only_by_loglevel /usr/lib/lttng-tools/ptest/tests/regression/tools/client/Makefile"

--===============4329791208599691599==--

