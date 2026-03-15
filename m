Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28409F013DA
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28797.1773582114775226062
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Gb1moSNO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HV34hMSB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019cf1bb7405-60c94406-d487-42a3-8237-346e0a8a2f67-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582120;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y1DUhDdGJiHvLIWhQVLVf8/VJnvazTpf+80y8u0gF1c=;
	b=Gb1moSNO/MUhBrwxd9auanMXvXiuiKGfLuXbEwf0Mp1P4VseNEACjE5dubtSPhtj
	GhMBdUwBm5SiOGsxYVVquEU3AHN++BhEEAY6YcsIbt/xZgyzTDVeKxcp2ZLRUFpYgIk
	kpdvxiiQgp8ib0qRdxMEPdvIcBmzEb5YUaePivk4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582120;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y1DUhDdGJiHvLIWhQVLVf8/VJnvazTpf+80y8u0gF1c=;
	b=HV34hMSB9eE3gUHSvqWUocAI4HIyoCov9v/fQ19L0OFS49LfxqMExyLzCUriYlen
	ztry97ZxrWBs15LM3CQD/uuy/KwGACVlx9efnxM7WT67NPbMZzIYPHdSCD6pnmRay6z
	9+YLjnmOjhDR9KdlRFswy9RsrFoL1jsTc96yTH94=
Content-Type: multipart/mixed; boundary="===============7108576534416909834=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ethtool: upgrading to 6.19 SUCCEEDED
Message-ID: <0101019cf1bb7405-60c94406-d487-42a3-8237-346e0a8a2f67-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233156

--===============7108576534416909834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ethtool* to *6.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.15-6.19.patch
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
From 2da142c85c07cbfd9046f29cda7f5b0eded6cb26 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 09:06:43 +0000
Subject: [PATCH] ethtool: upgrade 6.15 -> 6.19

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.15.bb => ethtool_6.19.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.15.bb => ethtool_6.19.bb} (94%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 79232a6b00..2dc5256226 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 27757ce1a8956591d22e7f9dc8cef37e37be8e9f Mon Sep 17 00:00:00 2001
+From 46142457ca4e431fe431da6650cbcb684336dce7 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f5fdc8b..3eab387 100644
+index ebb978f..57b624b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.15, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.19, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.15.bb b/meta/recipes-extended/ethtool/ethtool_6.19.bb
similarity index 94%
rename from meta/recipes-extended/ethtool/ethtool_6.15.bb
rename to meta/recipes-extended/ethtool/ethtool_6.19.bb
index eb6b272d4a..9ed94a901c 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.15.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.19.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "5d21a75b54c5e617b8ac0fe161e2ef3a75ecdf569ab64831474882dd3ece6077"
+SRC_URI[sha256sum] = "1c1a2f9fc02670ab005fb3e5de16688852bd6cea7e15ebc6ec91d0278b00dd79"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.47.1


--===============7108576534416909834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.15 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.15" to "6.19"
packages/x86-64-v3-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.15 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-dbg: PV changed from "6.15" to "6.19"
packages/x86-64-v3-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 8517760 to 8623568 (+1%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.15 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-dev: PV changed from "6.15" to "6.19"
packages/x86-64-v3-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.15 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-doc: PV changed from "6.15" to "6.19"
packages/x86-64-v3-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 55905 to 57355 (+3%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.15 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-locale: PV changed from "6.15" to "6.19"
packages/x86-64-v3-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.15 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-ptest: PV changed from "6.15" to "6.19"
packages/x86-64-v3-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 2399199 to 2415798 (+1%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: PKGV changed from 6.15 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: FILELIST: directory renamed /usr/src/debug/ethtool/6.15/netlink -> /usr/src/debug/ethtool/6.19/netlink, directory renamed /usr/src/debug/ethtool/6.15/uapi/linux/hdlc -> /usr/src/debug/ethtool/6.19/uapi/linux/hdlc, directory renamed /usr/src/debug/ethtool/6.15/uapi/linux -> /usr/src/debug/ethtool/6.19/uapi/linux, removed "/usr/src/debug/ethtool/6.15/marvell.c /usr/src/debug/ethtool/6.15/test-cmdline.c /usr/src/debug/ethtool/6.15/de2104x.c /usr/src/debug/ethtool/6.15/common.h /usr/src/debug/ethtool/6.15/ethtool.c /usr/src/debug/ethtool/6.15/hibmcge.c /usr/src/debug/ethtool/6.15/pcnet32.c /usr/src/debug/ethtool/6.15/ixgbevf.c /usr/src/debug/ethtool/6.15/common.c /usr/src/debug/ethtool/6.15/realtek.c /usr/src/debug/ethtool/6.15/smsc911x.c /usr/src/debug/ethtool/6.15/json_print.h /usr/src/debug/ethtool/6.15/test-common.c /usr/src/debug/ethtool/6.15/dsa.c /usr/src/debug/ethtool/6.15/fec.c /usr/src/debug/ethtool/6.15/igb.c /usr/src/debug/et
 htool/6.15/ibm_emac.c /usr/src/debug/ethtool/6.15/igc.c /usr/src/debug/ethtool/6.15/sfc.c /usr/src/debug/ethtool/6.15/sfpdiag.c /usr/src/debug/ethtool/6.15/tg3.c /usr/src/debug/ethtool/6.15/tse.c /usr/src/debug/ethtool/6.15/module-common.c /usr/src/debug/ethtool/6.15/natsemi.c /usr/src/debug/ethtool/6.15/module-common.h /usr/src/debug/ethtool/6.15/qsfp.c /usr/src/debug/ethtool/6.15/fbnic.c /usr/src/debug/ethtool/6.15/et131x.c /usr/src/debug/ethtool/6.15/internal.h /usr/src/debug/ethtool/6.15/at76c50x-usb.c /usr/src/debug/ethtool/6.15/vmxnet3.c /usr/src/debug/ethtool/6.15/stmmac.c /usr/src/debug/ethtool/6.15/e1000.c /usr/src/debug/ethtool/6.15/amd8111e.c /usr/src/debug/ethtool/6.15/sff-common.c /usr/src/debug/ethtool/6.15/cmis.h /usr/src/debug/ethtool/6.15/list.h /usr/src/debug/ethtool/6.15/fsl_enetc.c /usr/src/debug/ethtool/6.15/vioc.c /usr/src/debug/ethtool/6.15/bnxt.c /usr/src/debug/ethtool/6.15/sff-common.h /usr/src/debug/ethtool/6.15/cmis.c /usr/src/debug/ethtool/6.15/cpsw.c /us
 r/src/debug/ethtool/6.15/e100.c /usr/src/debug/ethtool/6.15/fjes.c /usr/src/debug/ethtool/6.15/hns3.c /usr/src/debug/ethtool/6.15/ixgb.c /usr/src/debug/ethtool/6.15/lan743x.c /usr/src/debug/ethtool/6.15/json_writer.c /usr/src/debug/ethtool/6.15/json_print.c /usr/src/debug/ethtool/6.15/rxclass.c /usr/src/debug/ethtool/6.15/lan78xx.c /usr/src/debug/ethtool/6.15/sfpid.c /usr/src/debug/ethtool/6.15/fec_8xx.c /usr/src/debug/ethtool/6.15/ixgbe.c /usr/src/debug/ethtool/6.15/json_writer.h", added "/usr/src/debug/ethtool/6.19/marvell.c /usr/src/debug/ethtool/6.19/test-cmdline.c /usr/src/debug/ethtool/6.19/de2104x.c /usr/src/debug/ethtool/6.19/common.h /usr/src/debug/ethtool/6.19/ethtool.c /usr/src/debug/ethtool/6.19/hibmcge.c /usr/src/debug/ethtool/6.19/pcnet32.c /usr/src/debug/ethtool/6.19/am65-cpsw-nuss.c /usr/src/debug/ethtool/6.19/ixgbevf.c /usr/src/debug/ethtool/6.19/common.c /usr/src/debug/ethtool/6.19/realtek.c /usr/src/debug/ethtool/6.19/smsc911x.c /usr/src/debug/ethtool/6.19/json_pr
 int.h /usr/src/debug/ethtool/6.19/test-common.c /usr/src/debug/ethtool/6.19/dsa.c /usr/src/debug/ethtool/6.19/fec.c /usr/src/debug/ethtool/6.19/igb.c /usr/src/debug/ethtool/6.19/ibm_emac.c /usr/src/debug/ethtool/6.19/igc.c /usr/src/debug/ethtool/6.19/sfc.c /usr/src/debug/ethtool/6.19/sfpdiag.c /usr/src/debug/ethtool/6.19/tg3.c /usr/src/debug/ethtool/6.19/tse.c /usr/src/debug/ethtool/6.19/module-common.c /usr/src/debug/ethtool/6.19/natsemi.c /usr/src/debug/ethtool/6.19/module-common.h /usr/src/debug/ethtool/6.19/qsfp.c /usr/src/debug/ethtool/6.19/fbnic.c /usr/src/debug/ethtool/6.19/et131x.c /usr/src/debug/ethtool/6.19/internal.h /usr/src/debug/ethtool/6.19/at76c50x-usb.c /usr/src/debug/ethtool/6.19/vmxnet3.c /usr/src/debug/ethtool/6.19/stmmac.c /usr/src/debug/ethtool/6.19/e1000.c /usr/src/debug/ethtool/6.19/amd8111e.c /usr/src/debug/ethtool/6.19/sff-common.c /usr/src/debug/ethtool/6.19/cmis.h /usr/src/debug/ethtool/6.19/list.h /usr/src/debug/ethtool/6.19/fsl_enetc.c /usr/src/debug/et
 htool/6.19/vioc.c /usr/src/debug/ethtool/6.19/bnxt.c /usr/src/debug/ethtool/6.19/sff-common.h /usr/src/debug/ethtool/6.19/cmis.c /usr/src/debug/ethtool/6.19/cpsw.c /usr/src/debug/ethtool/6.19/e100.c /usr/src/debug/ethtool/6.19/fjes.c /usr/src/debug/ethtool/6.19/hns3.c /usr/src/debug/ethtool/6.19/ixgb.c /usr/src/debug/ethtool/6.19/lan743x.c /usr/src/debug/ethtool/6.19/json_writer.c /usr/src/debug/ethtool/6.19/json_print.c /usr/src/debug/ethtool/6.19/rxclass.c /usr/src/debug/ethtool/6.19/lan78xx.c /usr/src/debug/ethtool/6.19/sfpid.c /usr/src/debug/ethtool/6.19/fec_8xx.c /usr/src/debug/ethtool/6.19/ixgbe.c /usr/src/debug/ethtool/6.19/json_writer.h"
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: PV changed from "6.15" to "6.19"
packages/x86-64-v3-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 2392903 to 2422239 (+1%)
packages/x86-64-v3-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.15 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.15" to "6.19"
packages/x86-64-v3-poky-linux/ethtool/ethtool: PKGV changed from 6.15 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/ethtool/ethtool: PV changed from "6.15" to "6.19"
packages/x86-64-v3-poky-linux/ethtool/ethtool: PKGSIZE changed from 1003753 to 1007849 (+0%)
packages/x86-64-v3-poky-linux/ethtool: PKGV changed from 6.15 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.15.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.19.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/x86-64-v3-poky-linux/ethtool: PV changed from "6.15" to "6.19"

--===============7108576534416909834==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ethtool-upgrade-6.15-6.19.patch"

RnJvbSAyZGExNDJjODVjMDdjYmZkOTA0NmYyOWNkYTdmNWIwZWRlZDZjYjI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDk6MDY6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
dGh0b29sOiB1cGdyYWRlIDYuMTUgLT4gNi4xOQoKLS0tCiAuLi4vZXRodG9vbC9ldGh0b29sL2F2
b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoICAgICAgICAgICAgICB8IDYgKysrLS0tCiAuLi4vZXRo
dG9vbC97ZXRodG9vbF82LjE1LmJiID0+IGV0aHRvb2xfNi4xOS5iYn0gICAgICAgICAgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL3tldGh0b29sXzYuMTUuYmIgPT4gZXRo
dG9vbF82LjE5LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9l
dGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4
IDc5MjMyYTZiMDAuLjJkYzUyNTYyMjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjc3NTdjZTFhODk1NjU5MWQyMmU3ZjlkYzhjZWYzN2Uz
N2JlOGU5ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDYxNDI0NTdjYTRlNDMxZmU0
MzFkYTY2NTBjYmNiNjg0MzM2ZGNlNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1
ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogV2VkLCAyOCBNYXkgMjAx
NCAxODo1OTo1NCArMDIwMAogU3ViamVjdDogW1BBVENIXSBldGh0b29sOiB1c2Ugc2VyaWFsLXRl
c3RzIGNvbmZpZyBuZWVkZWQgYnkgcHRlc3QuCkBAIC0xNCwxMCArMTQsMTAgQEAgVXBzdHJlYW0t
U3RhdHVzOiBJbmFwcHJvcHJpYXRlCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMK
LWluZGV4IGY1ZmRjOGIuLjNlYWIzODcgMTAwNjQ0CitpbmRleCBlYmI5NzhmLi41N2I2MjRiIDEw
MDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC0zLDcgKzMs
NyBAQCBBQ19JTklUKGV0aHRvb2wsIDYuMTUsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcpCitAQCAt
Myw3ICszLDcgQEAgQUNfSU5JVChldGh0b29sLCA2LjE5LCBuZXRkZXZAdmdlci5rZXJuZWwub3Jn
KQogIEFDX1BSRVJFUSgyLjUyKQogIEFDX0NPTkZJR19NQUNST19ESVIoW200XSkKICBBQ19DT05G
SUdfU1JDRElSKFtldGh0b29sLmNdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2V0aHRvb2wvZXRodG9vbF82LjE1LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wv
ZXRodG9vbF82LjE5LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNi4xNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjE5LmJiCmluZGV4IGViNmIyNzJkNGEuLjll
ZDk0YTkwMWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRv
b2xfNi4xNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYu
MTkuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L3Nv
ZnR3YXJlL25ldHdvcmsvZXRodG9vbC9ldGh0b29sLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAg
IGZpbGU6Ly9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjVkMjFhNzViNTRjNWU2MTdiOGFjMGZlMTYxZTJlZjNhNzVlY2Rm
NTY5YWI2NDgzMTQ3NDg4MmRkM2VjZTYwNzciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWMxYTJm
OWZjMDI2NzBhYjAwNWZiM2U1ZGUxNjY4ODg1MmJkNmNlYTdlMTVlYmM2ZWM5MWQwMjc4YjAwZGQ3
OSIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL3Nv
ZnR3YXJlL25ldHdvcmsvZXRodG9vbC8iCiAKLS0gCjIuNDcuMQoK

--===============7108576534416909834==--

