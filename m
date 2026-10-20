Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1945.1792480406099102129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P6MtwQIq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QkFn/Gog;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a158286707-cc3b17eb-80e5-4116-8998-b352eb03362c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z/SJcl4+WwhkeMqmVZZG0BwNsPlO6vndGSNl1dowpCA=;
	b=P6MtwQIqFOn+gYUNdPCLTP95fqaZZUUouEutQn9oZAGcxNP5MmBb1ut6byGqB5/F
	OQMmC4yekl3kWR2qosEOuy3l92t3yiDlg6iz+b116qqSw91gBcTJtMvUgWR8GH60EOQ
	JAY7b60pzUU5KdcjZhTT9gPwrtdExC0v0DP66kjA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z/SJcl4+WwhkeMqmVZZG0BwNsPlO6vndGSNl1dowpCA=;
	b=QkFn/Gog9lkPBnhV0AwrnduDJaTGiIMw0XmvfYWkl56BAbNWht+62K2MsO1HCAdU
	kIEgV70lURK5Wtjm9FQk8gNFxkC4ixigB0nH/NzRuTKd2wfyK145GjGX7659bKfWN2c
	iTESKikH7KeMU23rnEycqhIfM6NETzyehyXI+h+M=
Content-Type: multipart/mixed; boundary="===============6390279535667899009=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 7.2 SUCCEEDED
Message-ID: <010101a158286707-cc3b17eb-80e5-4116-8998-b352eb03362c-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248231

--===============6390279535667899009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ethtool* to *7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-7.1-7.2.patch
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
From 50a5e38ddc18ac785a3be59e65fc1dc41e1921b8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 20 Oct 2026 07:04:42 +0000
Subject: [PATCH] ethtool: upgrade 7.1 -> 7.2

Version 7.2 - Oct 19, 2026
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_7.1.bb => ethtool_7.2.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_7.1.bb => ethtool_7.2.bb} (94%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index aafc9ea715..e244850f06 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 7fbdc5cec5c5f2b89fd183543c3d35b5f7cc5530 Mon Sep 17 00:00:00 2001
+From ed7f83a6be18b659899fb3d60a04b91bf5abae77 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 71b998e..79eff82 100644
+index 0289eb7..30261ee 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 7.1, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 7.2, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_7.1.bb b/meta/recipes-extended/ethtool/ethtool_7.2.bb
similarity index 94%
rename from meta/recipes-extended/ethtool/ethtool_7.1.bb
rename to meta/recipes-extended/ethtool/ethtool_7.2.bb
index a24b64863d..0ae1ebff37 100644
--- a/meta/recipes-extended/ethtool/ethtool_7.1.bb
+++ b/meta/recipes-extended/ethtool/ethtool_7.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "21cc520ae5d881f01b0dcd6d26de4d52a64b24840bc2150daf778a235442e61d"
+SRC_URI[sha256sum] = "b2f2f1e94c3b6e35715d969185a0208d411586d88f49ccbad740063e51720f94"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.47.1


--===============6390279535667899009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ethtool/ethtool-bash-completion: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-bash-completion: PKGSIZE changed from 25264 to 25714 (+2%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-dbg: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/ethtool/ethtool-dbg: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 8725816 to 8741912 (+0%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-dev: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/ethtool/ethtool-dev: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-doc: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/ethtool/ethtool-doc: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 60597 to 61566 (+2%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-locale: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/ethtool/ethtool-locale: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-ptest: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/ethtool/ethtool-ptest: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 2475716 to 2484292 (+0%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: FILELIST: directory renamed /usr/src/debug/ethtool/7.1/uapi/linux -> /usr/src/debug/ethtool/7.2/uapi/linux, directory renamed /usr/src/debug/ethtool/7.1/netlink -> /usr/src/debug/ethtool/7.2/netlink, directory renamed /usr/src/debug/ethtool/7.1 -> /usr/src/debug/ethtool/7.2, directory renamed /usr/src/debug/ethtool/7.1/uapi/linux/hdlc -> /usr/src/debug/ethtool/7.2/uapi/linux/hdlc
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 2447118 to 2461734 (+1%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-staticdev: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/ethtool/ethtool: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool: PKGSIZE changed from 1036521 to 1040617 (+0%)
packages/x86-64-v3-poky-linux/ethtool: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-7.1.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-7.2.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/x86-64-v3-poky-linux/ethtool: PKGV changed from 7.1 [default] to 7.2 [default]

--===============6390279535667899009==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ethtool-upgrade-7.1-7.2.patch"

RnJvbSA1MGE1ZTM4ZGRjMThhYzc4NWEzYmU1OWU2NWZjMWRjNDFlMTkyMWI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjYgMDc6MDQ6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
dGh0b29sOiB1cGdyYWRlIDcuMSAtPiA3LjIKClZlcnNpb24gNy4yIC0gT2N0IDE5LCAyMDI2Ci0t
LQogLi4uL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCAgICAgICAg
ICAgICAgfCA2ICsrKy0tLQogLi4uL2V0aHRvb2wve2V0aHRvb2xfNy4xLmJiID0+IGV0aHRvb2xf
Ny4yLmJifSAgICAgICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9v
bC97ZXRodG9vbF83LjEuYmIgPT4gZXRodG9vbF83LjIuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0
cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFy
YWxsZWxfdGVzdHMucGF0Y2gKaW5kZXggYWFmYzllYTcxNS4uZTI0NDg1MGYwNiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90
ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sL2F2
b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ZmJkYzVjZWM1
YzVmMmI4OWZkMTgzNTQzYzNkMzViNWY3Y2M1NTMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBlZDdmODNhNmJlMThiNjU5ODk5ZmIzZDYwYTA0YjkxYmY1YWJhZTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogVHVkb3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+
CiBEYXRlOiBXZWQsIDI4IE1heSAyMDE0IDE4OjU5OjU0ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGV0aHRvb2w6IHVzZSBzZXJpYWwtdGVzdHMgY29uZmlnIG5lZWRlZCBieSBwdGVzdC4KQEAgLTE0
LDEwICsxNCwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUKICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZp
Z3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNzFiOTk4ZS4uNzllZmY4MiAxMDA2NDQKK2lu
ZGV4IDAyODllYjcuLjMwMjYxZWUgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2Nv
bmZpZ3VyZS5hYwotQEAgLTMsNyArMyw3IEBAIEFDX0lOSVQoZXRodG9vbCwgNy4xLCBuZXRkZXZA
dmdlci5rZXJuZWwub3JnKQorQEAgLTMsNyArMyw3IEBAIEFDX0lOSVQoZXRodG9vbCwgNy4yLCBu
ZXRkZXZAdmdlci5rZXJuZWwub3JnKQogIEFDX1BSRVJFUSgyLjUyKQogIEFDX0NPTkZJR19NQUNS
T19ESVIoW200XSkKICBBQ19DT05GSUdfU1JDRElSKFtldGh0b29sLmNdKQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF83LjEuYmIgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzcuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzcuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF83LjIuYmIKaW5k
ZXggYTI0YjY0ODYzZC4uMGFlMWViZmYzNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2V0aHRvb2wvZXRodG9vbF83LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0
aHRvb2wvZXRodG9vbF83LjIuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9ICIke0tFUk5F
TE9SR19NSVJST1J9L3NvZnR3YXJlL25ldHdvcmsvZXRodG9vbC9ldGh0b29sLSR7UFZ9LnRhci5n
eiBcCiAgICAgICAgICAgIGZpbGU6Ly9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBcCiAgICAg
ICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIxY2M1MjBhZTVkODgxZjAxYjBkY2Q2
ZDI2ZGU0ZDUyYTY0YjI0ODQwYmMyMTUwZGFmNzc4YTIzNTQ0MmU2MWQiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYjJmMmYxZTk0YzNiNmUzNTcxNWQ5NjkxODVhMDIwOGQ0MTE1ODZkODhmNDljY2Jh
ZDc0MDA2M2U1MTcyMGY5NCIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vd3d3Lmtl
cm5lbC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvZXRodG9vbC8iCiAKLS0gCjIuNDcuMQoK

--===============6390279535667899009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ethtool-changelog.txt"

Version 7.2 - Oct 19, 2026

--===============6390279535667899009==--
