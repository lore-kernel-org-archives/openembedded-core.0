Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471EECD37B7
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:55 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15628.1777645547319756106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xJFsNOTr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lXk481pF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019de3ee6cbb-cbd9302c-5ddf-462e-b8f2-921f58ce61bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6qrM7WW9XvkmLlBno/lD3LVFh507pfVE5LuoxGd9ctA=;
	b=xJFsNOTrsiKerbaSwCj18TeQIyrvEcejW/Z3wrwvhcSHWJgpCtbuEPBEdKmQDOyl
	uYr553NsaGA9ilHiDcziyYzyerec8FSLUUVabs1kii+bRpW2hmlcv/kA12LN6KCKd2Z
	j0v2LxkC2XnfzuXRU8DHpL3j8cCM4jIMayhev2vQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6qrM7WW9XvkmLlBno/lD3LVFh507pfVE5LuoxGd9ctA=;
	b=lXk481pF4l39GUMc0ZmyGnAqxaLb8fefaJj1FkN1Jh3EevonLWmdb9qL7inTBYFp
	NC8XdQN+Tb80A2gZufiVDjHitsYblg6Fdzq05mwqVUNtbx2iId8k7rP26hMlSjHpgyp
	rU+O+X8VUssVmrabfapWhttVk/4B56BTmDAbMsM0=
Content-Type: multipart/mixed; boundary="===============1855567591685250110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ethtool: upgrading to 7.0 SUCCEEDED
Message-ID: <0101019de3ee6cbb-cbd9302c-5ddf-462e-b8f2-921f58ce61bc-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236258

--===============1855567591685250110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ethtool* to *7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.19-7.0.patch
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
From ddf615de20b4090f6df330c60a3fc052bc2aeda5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 10:19:32 +0000
Subject: [PATCH] ethtool: upgrade 6.19 -> 7.0

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.19.bb => ethtool_7.0.bb}             | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.19.bb => ethtool_7.0.bb} (94%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index c8e54663c8..dd64ef1a0b 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 63f7fd18fe8ede3bde7fa54ef22980b4815330ed Mon Sep 17 00:00:00 2001
+From 3f6c7d7d311bc3abac02b4a18da7c49850fc4de4 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index ebb978f..57b624b 100644
+index 06e2086..bca01e5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.19, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 7.0, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.19.bb b/meta/recipes-extended/ethtool/ethtool_7.0.bb
similarity index 94%
rename from meta/recipes-extended/ethtool/ethtool_6.19.bb
rename to meta/recipes-extended/ethtool/ethtool_7.0.bb
index 9ed94a901c..eb5b646701 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.19.bb
+++ b/meta/recipes-extended/ethtool/ethtool_7.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "1c1a2f9fc02670ab005fb3e5de16688852bd6cea7e15ebc6ec91d0278b00dd79"
+SRC_URI[sha256sum] = "1a17b13dba2aef3897bb66c6140d88dc19e807b7948de3773d37320daae5266c"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.47.1


--===============1855567591685250110==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ethtool-upgrade-6.19-7.0.patch"

RnJvbSBkZGY2MTVkZTIwYjQwOTBmNmRmMzMwYzYwYTNmYzA1MmJjMmFlZGE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMDoxOTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV0
aHRvb2w6IHVwZ3JhZGUgNi4xOSAtPiA3LjAKCi0tLQogLi4uL2V0aHRvb2wvZXRodG9vbC9hdm9p
ZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCAgICAgICAgICAgICAgfCA2ICsrKy0tLQogLi4uL2V0aHRv
b2wve2V0aHRvb2xfNi4xOS5iYiA9PiBldGh0b29sXzcuMC5iYn0gICAgICAgICAgICAgfCAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC97ZXRodG9vbF82LjE5LmJiID0+IGV0aHRv
b2xfNy4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0
b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4IGM4
ZTU0NjYzYzguLmRkNjRlZjFhMGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9l
dGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gNjNmN2ZkMThmZThlZGUzYmRlN2ZhNTRlZjIyOTgwYjQ4MTUz
MzBlZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2Y2YzdkN2QzMTFiYzNhYmFjMDJi
NGExOGRhN2M0OTg1MGZjNGRlNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1ZG9y
IEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogV2VkLCAyOCBNYXkgMjAxNCAx
ODo1OTo1NCArMDIwMAogU3ViamVjdDogW1BBVENIXSBldGh0b29sOiB1c2Ugc2VyaWFsLXRlc3Rz
IGNvbmZpZyBuZWVkZWQgYnkgcHRlc3QuCkBAIC0xNCwxMCArMTQsMTAgQEAgVXBzdHJlYW0tU3Rh
dHVzOiBJbmFwcHJvcHJpYXRlCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWlu
ZGV4IGViYjk3OGYuLjU3YjYyNGIgMTAwNjQ0CitpbmRleCAwNmUyMDg2Li5iY2EwMWU1IDEwMDY0
NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC0zLDcgKzMsNyBA
QCBBQ19JTklUKGV0aHRvb2wsIDYuMTksIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcpCitAQCAtMyw3
ICszLDcgQEAgQUNfSU5JVChldGh0b29sLCA3LjAsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcpCiAg
QUNfUFJFUkVRKDIuNTIpCiAgQUNfQ09ORklHX01BQ1JPX0RJUihbbTRdKQogIEFDX0NPTkZJR19T
UkNESVIoW2V0aHRvb2wuY10pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRo
dG9vbC9ldGh0b29sXzYuMTkuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0
b29sXzcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuMTkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNy4wLmJiCmluZGV4IDllZDk0YTkwMWMuLmViNWI2NDY3
MDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNi4x
OS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzcuMC5iYgpA
QCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vc29mdHdhcmUv
bmV0d29yay9ldGh0b29sL2V0aHRvb2wtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTov
L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiMWMxYTJmOWZjMDI2NzBhYjAwNWZiM2U1ZGUxNjY4ODg1MmJkNmNlYTdlMTVl
YmM2ZWM5MWQwMjc4YjAwZGQ3OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxYTE3YjEzZGJhMmFl
ZjM4OTdiYjY2YzYxNDBkODhkYzE5ZTgwN2I3OTQ4ZGUzNzczZDM3MzIwZGFhZTUyNjZjIgogCiBV
UFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvc29mdHdhcmUv
bmV0d29yay9ldGh0b29sLyIKIAotLSAKMi40Ny4xCgo=

--===============1855567591685250110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.19 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.19" to "7.0"
packages/x86-64-v3-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 8623568 to 8684904 (+1%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.19 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-dbg: PV changed from "6.19" to "7.0"
packages/x86-64-v3-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.19 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-dev: PV changed from "6.19" to "7.0"
packages/x86-64-v3-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 57355 to 59081 (+3%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.19 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-doc: PV changed from "6.19" to "7.0"
packages/x86-64-v3-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.19 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-locale: PV changed from "6.19" to "7.0"
packages/x86-64-v3-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 2415798 to 2449162 (+1%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.19 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-ptest: PV changed from "6.19" to "7.0"
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: FILELIST: directory renamed /usr/src/debug/ethtool/6.19 -> /usr/src/debug/ethtool/7.0, directory renamed /usr/src/debug/ethtool/6.19/uapi/linux -> /usr/src/debug/ethtool/7.0/uapi/linux, directory renamed /usr/src/debug/ethtool/6.19/uapi/linux/hdlc -> /usr/src/debug/ethtool/7.0/uapi/linux/hdlc, removed "/usr/src/debug/ethtool/6.19/netlink/pse-pd.c /usr/src/debug/ethtool/6.19/netlink/prettymsg.h /usr/src/debug/ethtool/6.19/netlink/prettymsg.c /usr/src/debug/ethtool/6.19/netlink/mm.c /usr/src/debug/ethtool/6.19/netlink/settings.c /usr/src/debug/ethtool/6.19/netlink/channels.c /usr/src/debug/ethtool/6.19/netlink/tsconfig.c /usr/src/debug/ethtool/6.19/netlink/desc-genlctrl.c /usr/src/debug/ethtool/6.19/netlink/ts.h /usr/src/debug/ethtool/6.19/netlink/privflags.c /usr/src/debug/ethtool/6.19/netlink/eee.c /usr/src/debug/ethtool/6.19/netlink/fec.c /usr/src/debug/ethtool/6.19/netlink/pause.c /usr/src/debug/ethtool/6.19/netlink/phy.c /usr/src/
 debug/ethtool/6.19/netlink/rss.c /usr/src/debug/ethtool/6.19/netlink/plca.c /usr/src/debug/ethtool/6.19/netlink/bitset.h /usr/src/debug/ethtool/6.19/netlink/strset.h /usr/src/debug/ethtool/6.19/netlink/nlsock.c /usr/src/debug/ethtool/6.19/netlink/bitset.c /usr/src/debug/ethtool/6.19/netlink/strset.c /usr/src/debug/ethtool/6.19/netlink/cable_test.c /usr/src/debug/ethtool/6.19/netlink/module.c /usr/src/debug/ethtool/6.19/netlink/nlsock.h /usr/src/debug/ethtool/6.19/netlink/desc-ethtool.c /usr/src/debug/ethtool/6.19/netlink/desc-rtnl.c /usr/src/debug/ethtool/6.19/netlink/permaddr.c /usr/src/debug/ethtool/6.19/netlink/parser.h /usr/src/debug/ethtool/6.19/netlink/rings.c /usr/src/debug/ethtool/6.19/netlink/features.c /usr/src/debug/ethtool/6.19/netlink/stats.c /usr/src/debug/ethtool/6.19/netlink/tsinfo.c /usr/src/debug/ethtool/6.19/netlink/parser.c /usr/src/debug/ethtool/6.19/netlink/msgbuff.h /usr/src/debug/ethtool/6.19/netlink/module-eeprom.c /usr/src/debug/ethtool/6.19/netlink/tunnels
 .c /usr/src/debug/ethtool/6.19/netlink/monitor.c /usr/src/debug/ethtool/6.19/netlink/msgbuff.c /usr/src/debug/ethtool/6.19/netlink/netlink.h /usr/src/debug/ethtool/6.19/netlink/extapi.h /usr/src/debug/ethtool/6.19/netlink/coalesce.c /usr/src/debug/ethtool/6.19/netlink/netlink.c", added "/usr/src/debug/ethtool/7.0/netlink/mse.c /usr/src/debug/ethtool/7.0/netlink/plca.c /usr/src/debug/ethtool/7.0/netlink/fec.c /usr/src/debug/ethtool/7.0/netlink/module-eeprom.c /usr/src/debug/ethtool/7.0/netlink/module.c /usr/src/debug/ethtool/7.0/netlink/pse-pd.c /usr/src/debug/ethtool/7.0/netlink/settings.c /usr/src/debug/ethtool/7.0/netlink/extapi.h /usr/src/debug/ethtool/7.0/netlink/desc-rtnl.c /usr/src/debug/ethtool/7.0/netlink/desc-ethtool.c /usr/src/debug/ethtool/7.0/netlink/nlsock.c /usr/src/debug/ethtool/7.0/netlink/ts.h /usr/src/debug/ethtool/7.0/netlink/pause.c /usr/src/debug/ethtool/7.0/netlink/rings.c /usr/src/debug/ethtool/7.0/netlink/coalesce.c /usr/src/debug/ethtool/7.0/netlink/permaddr
 .c /usr/src/debug/ethtool/7.0/netlink/nlsock.h /usr/src/debug/ethtool/7.0/netlink/stats.c /usr/src/debug/ethtool/7.0/netlink/desc-genlctrl.c /usr/src/debug/ethtool/7.0/netlink/tsconfig.c /usr/src/debug/ethtool/7.0/netlink/tsinfo.c /usr/src/debug/ethtool/7.0/netlink/netlink.c /usr/src/debug/ethtool/7.0/netlink/parser.h /usr/src/debug/ethtool/7.0/netlink/rss.c /usr/src/debug/ethtool/7.0/netlink/netlink.h /usr/src/debug/ethtool/7.0/netlink/monitor.c /usr/src/debug/ethtool/7.0/netlink/privflags.c /usr/src/debug/ethtool/7.0/netlink/cable_test.c /usr/src/debug/ethtool/7.0/netlink/parser.c /usr/src/debug/ethtool/7.0/netlink/features.c /usr/src/debug/ethtool/7.0/netlink/bitset.h /usr/src/debug/ethtool/7.0/netlink/msgbuff.h /usr/src/debug/ethtool/7.0/netlink/prettymsg.h /usr/src/debug/ethtool/7.0/netlink/strset.h /usr/src/debug/ethtool/7.0/netlink/tunnels.c /usr/src/debug/ethtool/7.0/netlink/msgbuff.c /usr/src/debug/ethtool/7.0/netlink/bitset.c /usr/src/debug/ethtool/7.0/netlink/prettymsg.c 
 /usr/src/debug/ethtool/7.0/netlink/strset.c /usr/src/debug/ethtool/7.0/netlink/phy.c /usr/src/debug/ethtool/7.0/netlink/channels.c /usr/src/debug/ethtool/7.0/netlink/eee.c /usr/src/debug/ethtool/7.0/netlink/mm.c"
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 2422239 to 2438448 (+1%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: PKGV changed from 6.19 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: PV changed from "6.19" to "7.0"
packages/x86-64-v3-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.19 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.19" to "7.0"
packages/x86-64-v3-poky-linux/ethtool/ethtool: PKGSIZE changed from 1007849 to 1024233 (+2%)
packages/x86-64-v3-poky-linux/ethtool/ethtool: PKGV changed from 6.19 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool: PV changed from "6.19" to "7.0"
packages/x86-64-v3-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.19.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-7.0.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/x86-64-v3-poky-linux/ethtool: PKGV changed from 6.19 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/ethtool: PV changed from "6.19" to "7.0"

--===============1855567591685250110==--

