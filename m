Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75D0D5E394
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17414.1765872163941707034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=q6H4iVJk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kwrGULYL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262ef3a8-b1f67606-b8c0-4cae-9142-d3f2f8c70713-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v+/9ZLeGk92wUSHMghVxQFqRpTYtPnz8/e7JJWX9k/M=;
	b=q6H4iVJkDh8BZbCXskXrsi/HwYoVUB/CWL5s7fhRr54pYrVkdUUTk3raiROeEE0t
	DTOlnj1fg+l5HVCDm4aE255ezpOvG1bSqnTT/n0HiDmEajofasgspjl0CKOSsyGmTjB
	RddQ/lQjosY61/WxYc9FE/Xu2VIeDX+drsFy2EtU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v+/9ZLeGk92wUSHMghVxQFqRpTYtPnz8/e7JJWX9k/M=;
	b=kwrGULYL9JyFb63+rd/zILEh1SNkXFcpP97nFyLMidTfbMfJ2L1fncC9OykPRbMZ
	qUarAn5dWT8rRzCd361BUsUC7wfTEoCSuJUAVX67Rz6MAUjztHq/LPUHt7KhupkSUWr
	b1HppFjubBpoAvc7//ahQ3BlD6lHt9ExtIS9AGeA=
Content-Type: multipart/mixed; boundary="===============4999792011131811506=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libnl: upgrading to 3.12.0 SUCCEEDED
Message-ID: <0101019b262ef3a8-b1f67606-b8c0-4cae-9142-d3f2f8c70713-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227918

--===============4999792011131811506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libnl* to *3.12.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnl-upgrade-3.11.0-3.12.0.patch
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
From c2ffdfebe73a830b9b6e120b069ebcf392eb97dc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 07:32:33 +0000
Subject: [PATCH] libnl: upgrade 3.11.0 -> 3.12.0

---
 .../0001-tests-cksuite-all-netns.c-disable-route_1.patch    | 6 +++---
 .../libnl/{libnl_3.11.0.bb => libnl_3.12.0.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libnl/{libnl_3.11.0.bb => libnl_3.12.0.bb} (96%)

diff --git a/meta/recipes-support/libnl/files/0001-tests-cksuite-all-netns.c-disable-route_1.patch b/meta/recipes-support/libnl/files/0001-tests-cksuite-all-netns.c-disable-route_1.patch
index cc5e3890a1..31ed6a03f1 100644
--- a/meta/recipes-support/libnl/files/0001-tests-cksuite-all-netns.c-disable-route_1.patch
+++ b/meta/recipes-support/libnl/files/0001-tests-cksuite-all-netns.c-disable-route_1.patch
@@ -1,4 +1,4 @@
-From 9e45c8809fc4e0aa1dd2ec2ac3e57352049f1b92 Mon Sep 17 00:00:00 2001
+From 4fc15346838cb6abfd2cc4e454b583e9ad143720 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 20 Aug 2024 19:01:59 +0200
 Subject: [PATCH] tests/cksuite-all-netns.c: disable route_1
@@ -17,10 +17,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/cksuite-all-netns.c b/tests/cksuite-all-netns.c
-index 5b9d3a5..b2fc46a 100644
+index ff6fd65..f083e65 100644
 --- a/tests/cksuite-all-netns.c
 +++ b/tests/cksuite-all-netns.c
-@@ -341,7 +341,7 @@ Suite *make_nl_netns_suite(void)
+@@ -342,7 +342,7 @@ Suite *make_nl_netns_suite(void)
  				  nltst_netns_fixture_teardown);
  	tcase_add_test(tc, cache_and_clone);
  	tcase_add_loop_test(tc, test_create_iface, 0, 17);
diff --git a/meta/recipes-support/libnl/libnl_3.11.0.bb b/meta/recipes-support/libnl/libnl_3.12.0.bb
similarity index 96%
rename from meta/recipes-support/libnl/libnl_3.11.0.bb
rename to meta/recipes-support/libnl/libnl_3.12.0.bb
index 26c87dbb1c..a68a80c0ae 100644
--- a/meta/recipes-support/libnl/libnl_3.11.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.12.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')}
            file://0001-tests-cksuite-all-netns.c-disable-route_1.patch \
            "
 
-SRC_URI[sha256sum] = "2a56e1edefa3e68a7c00879496736fdbf62fc94ed3232c0baba127ecfa76874d"
+SRC_URI[sha256sum] = "fc51ca7196f1a3f5fdf6ffd3864b50f4f9c02333be28be4eeca057e103c0dd18"
 
 GITHUB_BASE_URI = "https://github.com/thom311/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/libnl(?P<pver>.+)"
-- 
2.47.1


--===============4999792011131811506==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnl-upgrade-3.11.0-3.12.0.patch"

RnJvbSBjMmZmZGZlYmU3M2E4MzBiOWI2ZTEyMGIwNjllYmNmMzkyZWI5N2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDc6MzI6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJubDogdXBncmFkZSAzLjExLjAgLT4gMy4xMi4wCgotLS0KIC4uLi8wMDAxLXRlc3RzLWNrc3Vp
dGUtYWxsLW5ldG5zLmMtZGlzYWJsZS1yb3V0ZV8xLnBhdGNoICAgIHwgNiArKystLS0KIC4uLi9s
aWJubC97bGlibmxfMy4xMS4wLmJiID0+IGxpYm5sXzMuMTIuMC5iYn0gICAgICAgICAgICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibmwve2xpYm5sXzMuMTEuMC5iYiA9PiBsaWJu
bF8zLjEyLjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
bmwvZmlsZXMvMDAwMS10ZXN0cy1ja3N1aXRlLWFsbC1uZXRucy5jLWRpc2FibGUtcm91dGVfMS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm5sL2ZpbGVzLzAwMDEtdGVzdHMtY2tzdWl0
ZS1hbGwtbmV0bnMuYy1kaXNhYmxlLXJvdXRlXzEucGF0Y2gKaW5kZXggY2M1ZTM4OTBhMS4uMzFl
ZDZhMDNmMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibmwvZmlsZXMvMDAw
MS10ZXN0cy1ja3N1aXRlLWFsbC1uZXRucy5jLWRpc2FibGUtcm91dGVfMS5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJubC9maWxlcy8wMDAxLXRlc3RzLWNrc3VpdGUtYWxsLW5l
dG5zLmMtZGlzYWJsZS1yb3V0ZV8xLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ZTQ1Yzg4
MDlmYzRlMGFhMWRkMmVjMmFjM2U1NzM1MjA0OWYxYjkyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA0ZmMxNTM0NjgzOGNiNmFiZmQyY2M0ZTQ1NGI1ODNlOWFkMTQzNzIwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25p
eC5kZT4KIERhdGU6IFR1ZSwgMjAgQXVnIDIwMjQgMTk6MDE6NTkgKzAyMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gdGVzdHMvY2tzdWl0ZS1hbGwtbmV0bnMuYzogZGlzYWJsZSByb3V0ZV8xCkBAIC0xNywx
MCArMTcsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRy
b25peC5kZT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IAogZGlmZiAtLWdpdCBhL3Rlc3RzL2Nrc3VpdGUtYWxsLW5ldG5zLmMgYi90ZXN0cy9ja3N1aXRl
LWFsbC1uZXRucy5jCi1pbmRleCA1YjlkM2E1Li5iMmZjNDZhIDEwMDY0NAoraW5kZXggZmY2ZmQ2
NS4uZjA4M2U2NSAxMDA2NDQKIC0tLSBhL3Rlc3RzL2Nrc3VpdGUtYWxsLW5ldG5zLmMKICsrKyBi
L3Rlc3RzL2Nrc3VpdGUtYWxsLW5ldG5zLmMKLUBAIC0zNDEsNyArMzQxLDcgQEAgU3VpdGUgKm1h
a2VfbmxfbmV0bnNfc3VpdGUodm9pZCkKK0BAIC0zNDIsNyArMzQyLDcgQEAgU3VpdGUgKm1ha2Vf
bmxfbmV0bnNfc3VpdGUodm9pZCkKICAJCQkJICBubHRzdF9uZXRuc19maXh0dXJlX3RlYXJkb3du
KTsKICAJdGNhc2VfYWRkX3Rlc3QodGMsIGNhY2hlX2FuZF9jbG9uZSk7CiAgCXRjYXNlX2FkZF9s
b29wX3Rlc3QodGMsIHRlc3RfY3JlYXRlX2lmYWNlLCAwLCAxNyk7CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJubC9saWJubF8zLjExLjAuYmIgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJubC9saWJubF8zLjEyLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibmwvbGlibmxfMy4xMS4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJubC9saWJubF8zLjEyLjAuYmIKaW5kZXggMjZjODdkYmIx
Yy4uYTY4YTgwYzBhZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibmwvbGli
bmxfMy4xMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm5sL2xpYm5sXzMuMTIu
MC5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3du
bG9hZC8ke0JQTn0ke0BkLmdldFZhcignUFYnKS5yZXBsYWNlKCcuJywnXycpfQogICAgICAgICAg
ICBmaWxlOi8vMDAwMS10ZXN0cy1ja3N1aXRlLWFsbC1uZXRucy5jLWRpc2FibGUtcm91dGVfMS5w
YXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJhNTZlMWVkZWZh
M2U2OGE3YzAwODc5NDk2NzM2ZmRiZjYyZmM5NGVkMzIzMmMwYmFiYTEyN2VjZmE3Njg3NGQiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZmM1MWNhNzE5NmYxYTNmNWZkZjZmZmQzODY0YjUwZjRmOWMw
MjMzM2JlMjhiZTRlZWNhMDU3ZTEwM2MwZGQxOCIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS90aG9tMzExLyR7QlBOfS9yZWxlYXNlcyIKIFVQU1RSRUFNX0NIRUNLX1JF
R0VYID0gInJlbGVhc2VzL3RhZy9saWJubCg/UDxwdmVyPi4rKSIKLS0gCjIuNDcuMQoK

--===============4999792011131811506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libnl/libnl-ptest: PKGSIZE changed from 108782 to 239854 (+120%)

--===============4999792011131811506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libnl: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl: SRC_URI changed from "https://github.com/thom311/libnl/releases/download/libnl3_11_0/libnl-3.11.0.tar.gz file://run-ptest file://0001-tests-cksuite-all-netns.c-disable-route_1.patch" to "https://github.com/thom311/libnl/releases/download/libnl3_12_0/libnl-3.12.0.tar.gz file://run-ptest file://0001-tests-cksuite-all-netns.c-disable-route_1.patch"
packages/x86-64-v3-poky-linux/libnl: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-cli: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-cli: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-dbg: PKGSIZE changed from 4428824 to 4843232 (+9%)
packages/x86-64-v3-poky-linux/libnl/libnl-dbg: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-dbg: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-dev: PKGSIZE changed from 297016 to 302713 (+2%)
packages/x86-64-v3-poky-linux/libnl/libnl-dev: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-dev: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-doc: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-doc: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-genl: PKGSIZE changed from 31624 to 31592 (-0%)
packages/x86-64-v3-poky-linux/libnl/libnl-genl: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-genl: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-idiag: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-idiag: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-locale: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-locale: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-nf: PKGSIZE changed from 111926 to 111798 (-0%)
packages/x86-64-v3-poky-linux/libnl/libnl-nf: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-nf: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-ptest: PKGSIZE changed from 108782 to 239854 (+120%)
packages/x86-64-v3-poky-linux/libnl/libnl-ptest: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-ptest: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-route: PKGSIZE changed from 620433 to 644753 (+4%)
packages/x86-64-v3-poky-linux/libnl/libnl-route: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-route: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-src: PKGSIZE changed from 3021711 to 3155494 (+4%)
packages/x86-64-v3-poky-linux/libnl/libnl-src: FILELIST: directory renamed /usr/src/debug/libnl/3.11.0/include/linux-private/linux/tc_act -> /usr/src/debug/libnl/3.12.0/include/linux-private/linux/tc_act, directory renamed /usr/src/debug/libnl/3.11.0/src -> /usr/src/debug/libnl/3.12.0/src, directory renamed /usr/src/debug/libnl/3.11.0/include/netlink/idiag -> /usr/src/debug/libnl/3.12.0/include/netlink/idiag, directory renamed /usr/src/debug/libnl/3.11.0/include/netlink/route -> /usr/src/debug/libnl/3.12.0/include/netlink/route, directory renamed /usr/src/debug/libnl/3.11.0/include/nl-aux-xfrm -> /usr/src/debug/libnl/3.12.0/include/nl-aux-xfrm, directory renamed /usr/src/debug/libnl/3.11.0/include/netlink/route/qdisc -> /usr/src/debug/libnl/3.12.0/include/netlink/route/qdisc, directory renamed /usr/src/debug/libnl/3.11.0/include/linux-private/linux/can -> /usr/src/debug/libnl/3.12.0/include/linux-private/linux/can, directory renamed /usr/src/debug/libnl/3.11.0/include/netlink/route/c
 ls -> /usr/src/debug/libnl/3.12.0/include/netlink/route/cls, directory renamed /usr/src/debug/libnl/3.11.0/lib/cli/qdisc -> /usr/src/debug/libnl/3.12.0/lib/cli/qdisc, directory renamed /usr/src/debug/libnl/3.11.0/include/netlink/xfrm -> /usr/src/debug/libnl/3.12.0/include/netlink/xfrm, directory renamed /usr/src/debug/libnl/3.11.0/include/nl-priv-dynamic-route -> /usr/src/debug/libnl/3.12.0/include/nl-priv-dynamic-route, directory renamed /usr/src/debug/libnl/3.11.0/lib/genl -> /usr/src/debug/libnl/3.12.0/lib/genl, directory renamed /usr/src/debug/libnl/3.11.0/include/linux-private/linux -> /usr/src/debug/libnl/3.12.0/include/linux-private/linux, directory renamed /usr/src/debug/libnl/3.11.0/lib/route/cls/ematch -> /usr/src/debug/libnl/3.12.0/lib/route/cls/ematch, directory renamed /usr/src/debug/libnl/3.11.0/include/nl-aux-core -> /usr/src/debug/libnl/3.12.0/include/nl-aux-core, directory renamed /usr/src/debug/libnl/3.11.0/lib/netfilter -> /usr/src/debug/libnl/3.12.0/lib/netfilter
 , directory renamed /usr/src/debug/libnl/3.11.0/include/netlink/route/link -> /usr/src/debug/libnl/3.12.0/include/netlink/route/link, directory renamed /usr/src/debug/libnl/3.11.0/lib/route/act -> /usr/src/debug/libnl/3.12.0/lib/route/act, directory renamed /usr/src/debug/libnl/3.11.0/lib/route/cls -> /usr/src/debug/libnl/3.12.0/lib/route/cls, directory renamed /usr/src/debug/libnl/3.11.0/include/netlink/genl -> /usr/src/debug/libnl/3.12.0/include/netlink/genl, directory renamed /usr/src/debug/libnl/3.11.0/include/nl-priv-dynamic-core -> /usr/src/debug/libnl/3.12.0/include/nl-priv-dynamic-core, directory renamed /usr/src/debug/libnl/3.11.0/lib/route/link -> /usr/src/debug/libnl/3.12.0/lib/route/link, directory renamed /usr/src/debug/libnl/3.11.0/src/lib -> /usr/src/debug/libnl/3.12.0/src/lib, directory renamed /usr/src/debug/libnl/3.11.0/include/netlink/netfilter -> /usr/src/debug/libnl/3.12.0/include/netlink/netfilter, directory renamed /usr/src/debug/libnl/3.11.0/include/base -> /
 usr/src/debug/libnl/3.12.0/include/base, directory renamed /usr/src/debug/libnl/3.11.0/include/linux-private/linux/tc_ematch -> /usr/src/debug/libnl/3.12.0/include/linux-private/linux/tc_ematch, directory renamed /usr/src/debug/libnl/3.11.0/lib/idiag -> /usr/src/debug/libnl/3.12.0/lib/idiag, directory renamed /usr/src/debug/libnl/3.11.0/include/netlink/cli -> /usr/src/debug/libnl/3.12.0/include/netlink/cli, directory renamed /usr/src/debug/libnl/3.11.0/lib/route/qdisc -> /usr/src/debug/libnl/3.12.0/lib/route/qdisc, directory renamed /usr/src/debug/libnl/3.11.0/include/linux-private/linux/netfilter -> /usr/src/debug/libnl/3.12.0/include/linux-private/linux/netfilter, directory renamed /usr/src/debug/libnl/3.11.0/include/netlink/fib_lookup -> /usr/src/debug/libnl/3.12.0/include/netlink/fib_lookup, directory renamed /usr/src/debug/libnl/3.11.0/lib/xfrm -> /usr/src/debug/libnl/3.12.0/lib/xfrm, directory renamed /usr/src/debug/libnl/3.11.0/include/netlink -> /usr/src/debug/libnl/3.12.0/i
 nclude/netlink, directory renamed /usr/src/debug/libnl/3.11.0/lib/fib_lookup -> /usr/src/debug/libnl/3.12.0/lib/fib_lookup, directory renamed /usr/src/debug/libnl/3.11.0/include/nl-aux-route -> /usr/src/debug/libnl/3.12.0/include/nl-aux-route, directory renamed /usr/src/debug/libnl/3.11.0/lib/cli/cls -> /usr/src/debug/libnl/3.12.0/lib/cli/cls, directory renamed /usr/src/debug/libnl/3.11.0/include/netlink/route/cls/ematch -> /usr/src/debug/libnl/3.12.0/include/netlink/route/cls/ematch, directory renamed /usr/src/debug/libnl/3.11.0/include/nl-priv-static-route -> /usr/src/debug/libnl/3.12.0/include/nl-priv-static-route, removed "/usr/src/debug/libnl/3.11.0/lib/route/nh.c /usr/src/debug/libnl/3.11.0/lib/attr.c /usr/src/debug/libnl/3.11.0/lib/route/netconf.c /usr/src/debug/libnl/3.11.0/lib/route/tc.c /usr/src/debug/libnl/3.11.0/lib/socket.c /usr/src/debug/libnl/3.11.0/lib/route/pktloc_syntax.y /usr/src/debug/libnl/3.11.0/tests/cksuite-all-netns.c /usr/src/debug/libnl/3.11.0/tests/cksuit
 e-all-ematch-tree-clone.c /usr/src/debug/libnl/3.11.0/lib/route/act.c /usr/src/debug/libnl/3.11.0/lib/route/nexthop.c /usr/src/debug/libnl/3.11.0/lib/route/qdisc.c /usr/src/debug/libnl/3.11.0/lib/version.c /usr/src/debug/libnl/3.11.0/lib/route/pktloc_syntax.h /usr/src/debug/libnl/3.11.0/lib/route/route.c /usr/src/debug/libnl/3.11.0/lib/cache.c /usr/src/debug/libnl/3.11.0/lib/route/link.c /usr/src/debug/libnl/3.11.0/tests/check-all.c /usr/src/debug/libnl/3.11.0/lib/route/pktloc_syntax.c /usr/src/debug/libnl/3.11.0/lib/addr.c /usr/src/debug/libnl/3.11.0/lib/mpls.h /usr/src/debug/libnl/3.11.0/tests/cksuite-all-addr.c /usr/src/debug/libnl/3.11.0/lib/route/rule.c /usr/src/debug/libnl/3.11.0/lib/cache_mngt.c /usr/src/debug/libnl/3.11.0/lib/route/nl-route.h /usr/src/debug/libnl/3.11.0/lib/mpls.c /usr/src/debug/libnl/3.11.0/lib/object.c /usr/src/debug/libnl/3.11.0/lib/route/pktloc_grammar.l /usr/src/debug/libnl/3.11.0/tests/cksuite-all.h /usr/src/debug/libnl/3.11.0/lib/nl-core.h /usr/src/de
 bug/libnl/3.11.0/tests/nl-test-util.h /usr/src/debug/libnl/3.11.0/lib/route/pktloc_grammar.h /usr/src/debug/libnl/3.11.0/tests/cksuite-all-attr.c /usr/src/debug/libnl/3.11.0/lib/route/link-sriov.h /usr/src/debug/libnl/3.11.0/lib/route/addr.c /usr/src/debug/libnl/3.11.0/lib/handlers.c /usr/src/debug/libnl/3.11.0/lib/route/pktloc_grammar.c /usr/src/debug/libnl/3.11.0/tests/nl-test-util.c /usr/src/debug/libnl/3.11.0/lib/route/nh_encap_mpls.c /usr/src/debug/libnl/3.11.0/lib/route/route_obj.c /usr/src/debug/libnl/3.11.0/lib/route/classid.c /usr/src/debug/libnl/3.11.0/lib/route/neightbl.c /usr/src/debug/libnl/3.11.0/lib/route/neigh.c /usr/src/debug/libnl/3.11.0/lib/msg.c /usr/src/debug/libnl/3.11.0/lib/error.c /usr/src/debug/libnl/3.11.0/lib/data.c /usr/src/debug/libnl/3.11.0/lib/route/rtnl.c /usr/src/debug/libnl/3.11.0/lib/route/nexthop_encap.c /usr/src/debug/libnl/3.11.0/lib/hashtable.c /usr/src/debug/libnl/3.11.0/lib/nl.c /usr/src/debug/libnl/3.11.0/lib/cache_mngr.c /usr/src/debug/libn
 l/3.11.0/lib/route/cls.c /usr/src/debug/libnl/3.11.0/lib/hash.c /usr/src/debug/libnl/3.11.0/lib/utils.c /usr/src/debug/libnl/3.11.0/lib/route/class.c /usr/src/debug/libnl/3.11.0/lib/route/nexthop-encap.h /usr/src/debug/libnl/3.11.0/lib/route/mdb.c /usr/src/debug/libnl/3.11.0/lib/route/pktloc.c /usr/src/debug/libnl/3.11.0/lib/route/route_utils.c /usr/src/debug/libnl/3.11.0/lib/route/tc-api.h", added "/usr/src/debug/libnl/3.12.0/lib/route/nh_encap_ila.c /usr/src/debug/libnl/3.12.0/lib/route/nh_encap_ip.c /usr/src/debug/libnl/3.12.0/lib/hash.c /usr/src/debug/libnl/3.12.0/tests/cksuite-all-ematch-tree-clone.c /usr/src/debug/libnl/3.12.0/lib/route/pktloc_syntax.y /usr/src/debug/libnl/3.12.0/lib/cache_mngr.c /usr/src/debug/libnl/3.12.0/lib/route/rtnl.c /usr/src/debug/libnl/3.12.0/lib/route/pktloc_syntax.c /usr/src/debug/libnl/3.12.0/lib/route/pktloc.c /usr/src/debug/libnl/3.12.0/lib/route/link.c /usr/src/debug/libnl/3.12.0/lib/route/nl-route.h /usr/src/debug/libnl/3.12.0/lib/route/qdisc.c
  /usr/src/debug/libnl/3.12.0/lib/route/pktloc_syntax.h /usr/src/debug/libnl/3.12.0/lib/utils.c /usr/src/debug/libnl/3.12.0/lib/route/route_utils.c /usr/src/debug/libnl/3.12.0/tests/nl-test-util.h /usr/src/debug/libnl/3.12.0/lib/route/nexthop_encap.c /usr/src/debug/libnl/3.12.0/tests/cksuite-all-netns.c /usr/src/debug/libnl/3.12.0/tests/cksuite-link-ip6tnl.c /usr/src/debug/libnl/3.12.0/lib/cache_mngt.c /usr/src/debug/libnl/3.12.0/lib/route/route_obj.c /usr/src/debug/libnl/3.12.0/lib/route/nexthop-encap.h /usr/src/debug/libnl/3.12.0/tests/nl-test-util.c /usr/src/debug/libnl/3.12.0/lib/route/nh.c /usr/src/debug/libnl/3.12.0/lib/route/neigh.c /usr/src/debug/libnl/3.12.0/lib/route/tc.c /usr/src/debug/libnl/3.12.0/tests/cksuite-route-nexthop.c /usr/src/debug/libnl/3.12.0/lib/route/netconf.c /usr/src/debug/libnl/3.12.0/lib/route/link-sriov.h /usr/src/debug/libnl/3.12.0/tests/cksuite-all-addr.c /usr/src/debug/libnl/3.12.0/lib/addr.c /usr/src/debug/libnl/3.12.0/lib/msg.c /usr/src/debug/libnl
 /3.12.0/lib/route/rule.c /usr/src/debug/libnl/3.12.0/lib/route/neightbl.c /usr/src/debug/libnl/3.12.0/lib/route/addr.c /usr/src/debug/libnl/3.12.0/lib/error.c /usr/src/debug/libnl/3.12.0/lib/route/mdb.c /usr/src/debug/libnl/3.12.0/lib/cache.c /usr/src/debug/libnl/3.12.0/lib/object.c /usr/src/debug/libnl/3.12.0/lib/nl-core.h /usr/src/debug/libnl/3.12.0/lib/route/nh_encap_mpls.c /usr/src/debug/libnl/3.12.0/lib/route/class.c /usr/src/debug/libnl/3.12.0/tests/cksuite-all-attr.c /usr/src/debug/libnl/3.12.0/lib/route/cls.c /usr/src/debug/libnl/3.12.0/lib/hashtable-api.h /usr/src/debug/libnl/3.12.0/lib/route/tc-api.h /usr/src/debug/libnl/3.12.0/lib/hashtable.c /usr/src/debug/libnl/3.12.0/lib/version.c /usr/src/debug/libnl/3.12.0/lib/route/act.c /usr/src/debug/libnl/3.12.0/tests/cksuite-all.h /usr/src/debug/libnl/3.12.0/lib/route/nexthop.c /usr/src/debug/libnl/3.12.0/lib/data.c /usr/src/debug/libnl/3.12.0/lib/route/pktloc_grammar.l /usr/src/debug/libnl/3.12.0/lib/mpls.h /usr/src/debug/libnl
 /3.12.0/lib/route/pktloc_grammar.h /usr/src/debug/libnl/3.12.0/lib/mpls.c /usr/src/debug/libnl/3.12.0/lib/socket.c /usr/src/debug/libnl/3.12.0/lib/route/nh_encap_ip6.c /usr/src/debug/libnl/3.12.0/lib/route/pktloc_grammar.c /usr/src/debug/libnl/3.12.0/lib/route/classid.c /usr/src/debug/libnl/3.12.0/lib/attr.c /usr/src/debug/libnl/3.12.0/lib/handlers.c /usr/src/debug/libnl/3.12.0/lib/route/route.c /usr/src/debug/libnl/3.12.0/lib/nl.c /usr/src/debug/libnl/3.12.0/tests/cksuite-route-nh.c /usr/src/debug/libnl/3.12.0/tests/check-all.c"
packages/x86-64-v3-poky-linux/libnl/libnl-src: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-src: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-staticdev: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-staticdev: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl-xfrm: PKGSIZE changed from 93920 to 93880 (-0%)
packages/x86-64-v3-poky-linux/libnl/libnl-xfrm: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl-xfrm: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/x86-64-v3-poky-linux/libnl/libnl: PV changed from "3.11.0" to "3.12.0"
packages/x86-64-v3-poky-linux/libnl/libnl: PKGV changed from 3.11.0 [default] to 3.12.0 [default]

--===============4999792011131811506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-8f3e34141627b2a5fc6b6229d9026cad4adf851f"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:8f3e34141627b2a5fc6b6229d9026cad4adf851f"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 431 Local 408 Mirrors 0 Missed 23 Current 272 (94% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 274 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_deploy_setscene)
NOTE: Running setscene task 278 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 284 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 285 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 305 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_package_qa_setscene)
NOTE: Running setscene task 334 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 337 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 355 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 363 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-6.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 366 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 375 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 376 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_create_spdx_setscene)
NOTE: Running setscene task 405 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_package_qa_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 408 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 411 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.77-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 421 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 434 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.194-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 437 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 443 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 445 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 448 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 450 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 460 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 461 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 465 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 477 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 488 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 490 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 492 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 494 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 499 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 515 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 518 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 525 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 528 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 534 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 535 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 538 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 539 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.194-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_populate_sysroot_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 541 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 542 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 543 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 544 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 547 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 549 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 550 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 556 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 566 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 569 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 577 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 583 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 584 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 585 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 597 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 603 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libgpg-error/1.56/temp/log.do_packagedata_setscene.122215
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 610 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 618 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 620 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_package_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 634 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 641 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 642 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 645 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 646 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 652 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1056 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1108 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1149 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnl-1_3.12.0-r0: task do_fetch: Started
NOTE: Running setscene task 655 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 1288 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.17.0-r0: task do_fetch: Started
NOTE: Running task 1289 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1290 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1291 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.56-r0: task do_package_setscene: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_unpack: Started
NOTE: recipe iproute2-6.17.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnl-1_3.12.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1297 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1298 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe iproute2-6.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.12.0-r0: task do_patch: Started
NOTE: Running task 1300 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1302 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe iproute2-6.17.0-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_patch: Succeeded
NOTE: Running task 1313 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1314 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1315 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe iproute2-6.17.0-r0: task do_patch: Succeeded
NOTE: recipe libnl-1_3.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1317 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libgpg-error-1.56-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 660 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.12.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_populate_lic unihash changed to 9bf2cabafd30f9bba7f9048d390f006b84b98680f0a9c8f229958053adbca421
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_deploy_source_date_epoch unihash changed to c82b1341050bf5b7a2169d03073d856e32c3b87f29063993764881fe041f7241
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 669 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1323 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 685 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 701 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1662 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1748 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata)
NOTE: Running task 1806 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1865 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnl-1_3.12.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1911 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_configure)
NOTE: Running task 1912 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_configure)
NOTE: recipe libnl-1_3.12.0-r0: task do_configure: Started
NOTE: recipe iproute2-6.17.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata: Succeeded
NOTE: Running task 1926 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe iproute2-6.17.0-r0: task do_configure: Succeeded
NOTE: recipe iproute2-6.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1927 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 1928 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.17.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 2221e7ba6babcb8be8ec9116be520aceaa85c7f265f6b4eea2530ff84554515c to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '74f0b62e1823c6cb9199951d21403cf271015c537e7d227164460127f9df9fa3', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '2221e7ba6babcb8be8ec9116be520aceaa85c7f265f6b4eea2530ff84554515c'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 74f0b62e1823c6cb9199951d21403cf271015c537e7d227164460127f9df9fa3 -> 2221e7ba6babcb8be8ec9116be520aceaa85c7f265f6b4eea2530ff84554515c as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libnl-1_3.12.0-r0: task do_configure: Succeeded
NOTE: Running task 1938 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_configure_ptest_base)
NOTE: recipe libnl-1_3.12.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1939 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_compile)
NOTE: recipe libnl-1_3.12.0-r0: task do_compile: Started
NOTE: recipe iproute2-6.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_install)
NOTE: recipe iproute2-6.17.0-r0: task do_install: Started
NOTE: recipe iproute2-6.17.0-r0: task do_install: Succeeded
NOTE: Running task 1941 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_package)
NOTE: recipe iproute2-6.17.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_compile: Succeeded
NOTE: Running task 1943 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.12.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1944 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_install)
NOTE: recipe libnl-1_3.12.0-r0: task do_install: Started
NOTE: recipe iproute2-6.17.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_package unihash changed to 1d661644b91c0314bb0725a30c13ffe4500d3241b5a865b5be2eccec284b0d7e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_packagedata became valid
NOTE: Running setscene task 703 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1946 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_create_spdx)
NOTE: Running task 1947 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_package_write_ipk)
NOTE: Running task 1948 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_package_write_deb)
NOTE: Running task 1949 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_package_write_rpm)
NOTE: Running task 1950 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_package_qa)
NOTE: recipe iproute2-6.17.0-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.17.0-r0: task do_package_write_ipk: Started
NOTE: recipe iproute2-6.17.0-r0: task do_package_write_deb: Started
NOTE: recipe iproute2-6.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.17.0-r0: task do_package_qa: Started
NOTE: recipe iproute2-6.17.0-r0: task do_create_spdx: Succeeded
NOTE: recipe iproute2-6.17.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_package_write_ipk unihash changed to f9cf1e2df7da43506f780a30c9c0b53ab571db641e26df41eeeece322411bf68
NOTE: recipe iproute2-6.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_package_write_rpm unihash changed to a71001b86a794bab7d9a4481955e390c581bb493e025f72c775c4b5ce08de3c2
NOTE: recipe iproute2-6.17.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_package_qa unihash changed to e07aeebe69437c703ff79800eb7f126ecd5b0fe4e5bedcd3bce4cf611e3d6eeb
NOTE: recipe iproute2-6.17.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb:do_package_write_deb unihash changed to a26e9e5cd3432304de1342dded7c04ef350a35cb0ca474d952e2160a1cc2c286
NOTE: recipe libnl-1_3.12.0-r0: task do_install: Succeeded
NOTE: Running task 1951 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.12.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1952 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_package)
NOTE: Running task 1953 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_populate_sysroot unihash changed to 9db8da79af1e3dfa991e008fff9efa283efbfd033515f692fde7e4957fd8bec3
NOTE: Setscene tasks completed
NOTE: recipe libnl-1_3.12.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_package unihash changed to 3836811290ee902ec47d7fa497349772544f43dbadb99ac61dc0cd7c417d6b50
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_packagedata became valid
NOTE: Running setscene task 697 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 700 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 701 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_package_write_ipk_setscene)
NOTE: recipe libnl-1_3.12.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnl-1_3.12.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libnl-1_3.12.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 703 of 703 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_packagedata_setscene)
NOTE: recipe libnl-1_3.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1955 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_create_spdx)
NOTE: Running task 1959 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_package_qa)
NOTE: recipe libnl-1_3.12.0-r0: task do_create_spdx: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_package_qa: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1960 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_create_package_spdx)
NOTE: recipe libnl-1_3.12.0-r0: task do_create_package_spdx: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe libnl-1_3.12.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_package_qa unihash changed to f02dd3b69856d1c6db558c5f09c2d71f3ef80944300666a9d676e68bc824039e
NOTE: Running noexec task 1961 of 1961 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1961 tasks of which 1918 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 29 ERROR messages, returning a non-zero exit code.
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-src went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-dbg went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-ptest went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-staticdev went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-dev went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-doc went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-cs went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-da went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-de went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-eo went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-es went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-fr went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-hu went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-it went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-ja went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-nl went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-pl went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-pt went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-ro went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-ru went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-sr went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-sv went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-tr went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-uk went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-vi went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-zh-cn went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-zh-tw went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error went backwards which would break package feeds (from 0:1.58-r0 to 0:1.56-r0) [version-going-backwards]
ERROR: libgpg-error-1.56-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4999792011131811506==--

