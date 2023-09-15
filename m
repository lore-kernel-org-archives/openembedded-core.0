Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD39EED624
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 18:59:59 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.29462.1694804392450267413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LzICC2ju;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FOlWmR40;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a9a36b677-23fdb2cf-bfcb-4c37-83c5-48bae3614934-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804391;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PyScT683Qc3tQ9L2skoXHxAM8t5ovzYtgSosWKWiw2k=;
	b=LzICC2julVeGhq4TXw5QOsqyzLY93UOKAISCX94C+fi54cdy7tjAPbSrWErUht9Z
	E77qz2eXLLywplo9KHliNt95aTolRk7GOQaJ72qHCbOJu+iItnwoApGAxHBkKfXfE8B
	PDt6hafuqhqAEJUmDjYVWRcHBUw6y9sTAjwCBg3s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804391;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PyScT683Qc3tQ9L2skoXHxAM8t5ovzYtgSosWKWiw2k=;
	b=FOlWmR40FNlqbb+h0q0ePt+Oz077d4HBvrke0SeCQlnfI2mukX9jg1z4r13WC77v
	Em+OXHMCH6lfnzCADQI2CY4aRNqNJX4xlUlb0V2FwPa4kdrzhDS7+uICft9S+C4TDYP
	e6StpKiDk5NuALXsLvH4ZwqNLhVaTZumyLuqHnuQ=
Content-Type: multipart/mixed; boundary="===============7196970001993768462=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.5.0 SUCCEEDED
Message-ID: <0101018a9a36b677-23fdb2cf-bfcb-4c37-83c5-48bae3614934-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 18:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187684

--===============7196970001993768462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iproute2* to *6.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-6.4.0-6.5.0.patch
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
From 84b9a3f9b4f0241452bd1b6db6fdc58b3dee75a7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 06:52:20 +0000
Subject: [PATCH] iproute2: upgrade 6.4.0 -> 6.5.0

---
 .../0001-bridge-mdb.c-include-limits.h.patch  | 41 -------------------
 .../{iproute2_6.4.0.bb => iproute2_6.5.0.bb}  |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.4.0.bb => iproute2_6.5.0.bb} (95%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
deleted file mode 100644
index f9a0e35d83..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b13f04c0c685b6d2474aa7d97e191531f327bc45 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Thu, 20 Jul 2023 14:32:23 -0400
-Subject: [PATCH] bridge/mdb.c: include limits.h
-
-Upstream-Status: Submitted
-(https://lore.kernel.org/netdev/20230720203726.2316251-1-tgamblin@baylibre.com/)
-
-While building iproute2 6.4.0 with musl using Yocto Project, errors such
-as the following were encountered:
-
-| mdb.c: In function 'mdb_parse_vni':
-| mdb.c:666:47: error: 'ULONG_MAX' undeclared (first use in this function)
-|   666 |         if ((endptr && *endptr) || vni_num == ULONG_MAX)
-|       |                                               ^~~~~~~~~
-| mdb.c:666:47: note: 'ULONG_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?
-
-Include limits.h in bridge/mdb.c to fix this issue. This change is based
-on one in Alpine Linux, but the author there had no plans to submit:
-https://git.alpinelinux.org/aports/commit/main/iproute2/include.patch?id=bd46efb8a8da54948639cebcfa5b37bd608f1069
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- bridge/mdb.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/bridge/mdb.c b/bridge/mdb.c
-index fbb4f704..18793458 100644
---- a/bridge/mdb.c
-+++ b/bridge/mdb.c
-@@ -15,6 +15,7 @@
- #include <string.h>
- #include <arpa/inet.h>
- #include <netdb.h>
-+#include <limits.h>
- 
- #include "libnetlink.h"
- #include "utils.h"
--- 
-2.41.0
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
similarity index 95%
rename from meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
index 32e2f8176b..db46c8317a 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
@@ -13,10 +13,9 @@ DEPENDS = "flex-native bison-native iptables libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
-           file://0001-bridge-mdb.c-include-limits.h.patch \
            "
 
-SRC_URI[sha256sum] = "4c51b8decbc7e4da159ffb066f590cfb93dbf9af7ff86b1647ce42b7c179a272"
+SRC_URI[sha256sum] = "a70179085fa1b96d3c33b040c809b75e2b57563adc505a4ad05e2609df373463"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.39.2


--===============7196970001993768462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 6873636 to 6919632 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-dev: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dev: PKGSIZE changed from 1271 to 1287 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-dev: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-doc: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-doc: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-genl: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-genl: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PKGSIZE changed from 120364 to 124460 (+3%)
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ip: FILELIST: removed "/etc/iproute2/group /etc/iproute2/rt_realms /etc/iproute2/nl_protos /etc/iproute2/rt_protos /etc/iproute2/rt_dsfield /etc/iproute2/ematch_map /etc/iproute2/rt_tables /etc/iproute2/bpf_pinning /etc/iproute2/rt_scopes"
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGSIZE changed from 842884 to 841584 (-0%)
packages/core2-32-poky-linux/iproute2/iproute2-ip: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-locale: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-locale: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-routel: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-routel: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3641477 to 3650859 (+0%)
packages/core2-32-poky-linux/iproute2/iproute2-src: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-ss: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ss: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-tc: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tc: PKGSIZE changed from 710699 to 714795 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-tc: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2/iproute2: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2: FILELIST: added "/usr/lib/iproute2/rt_realms /usr/lib/iproute2/nl_protos /usr/lib/iproute2/rt_protos /usr/lib/iproute2/rt_scopes /usr/lib/iproute2/ematch_map /usr/lib/iproute2/rt_tables /usr/lib/iproute2/group /usr/lib/iproute2/bpf_pinning /usr/lib/iproute2/rt_dsfield"
packages/core2-32-poky-linux/iproute2/iproute2: PKGSIZE changed from 298136 to 299436 (+0%)
packages/core2-32-poky-linux/iproute2/iproute2: PV changed from "6.4.0" to "6.5.0"
packages/core2-32-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.4.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch file://0001-bridge-mdb.c-include-limits.h.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.5.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch"
packages/core2-32-poky-linux/iproute2: PKGV changed from 6.4.0 [default] to 6.5.0 [default]
packages/core2-32-poky-linux/iproute2: PV changed from "6.4.0" to "6.5.0"
Changes to packages/core2-32-poky-linux/iproute2 (sysroot):
  /usr/lib/iproute2 was added
  /usr/lib/iproute2/bpf_pinning was added
  /usr/lib/iproute2/ematch_map was added
  /usr/lib/iproute2/group was added
  /usr/lib/iproute2/nl_protos was added
  /usr/lib/iproute2/rt_dsfield was added
  /usr/lib/iproute2/rt_protos was added
  /usr/lib/iproute2/rt_realms was added
  /usr/lib/iproute2/rt_scopes was added
  /usr/lib/iproute2/rt_tables was added

--===============7196970001993768462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/iproute2/iproute2-ip: FILELIST: removed "/etc/iproute2/ematch_map /etc/iproute2/group /etc/iproute2/rt_tables /etc/iproute2/rt_realms /etc/iproute2/rt_protos /etc/iproute2/rt_dsfield /etc/iproute2/nl_protos /etc/iproute2/rt_scopes /etc/iproute2/bpf_pinning"
packages/core2-32-poky-linux/iproute2/iproute2: FILELIST: added "/usr/lib/iproute2/ematch_map /usr/lib/iproute2/rt_dsfield /usr/lib/iproute2/group /usr/lib/iproute2/rt_scopes /usr/lib/iproute2/rt_realms /usr/lib/iproute2/bpf_pinning /usr/lib/iproute2/nl_protos /usr/lib/iproute2/rt_tables /usr/lib/iproute2/rt_protos"
Changes to packages/core2-32-poky-linux/iproute2 (sysroot):
  /usr/lib/iproute2 was added
  /usr/lib/iproute2/bpf_pinning was added
  /usr/lib/iproute2/ematch_map was added
  /usr/lib/iproute2/group was added
  /usr/lib/iproute2/nl_protos was added
  /usr/lib/iproute2/rt_dsfield was added
  /usr/lib/iproute2/rt_protos was added
  /usr/lib/iproute2/rt_realms was added
  /usr/lib/iproute2/rt_scopes was added
  /usr/lib/iproute2/rt_tables was added

--===============7196970001993768462==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.4.0-6.5.0.patch"

RnJvbSA4NGI5YTNmOWI0ZjAyNDE0NTJiZDFiNmRiNmZkYzU4YjNkZWU3NWE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMDY6NTI6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
cHJvdXRlMjogdXBncmFkZSA2LjQuMCAtPiA2LjUuMAoKLS0tCiAuLi4vMDAwMS1icmlkZ2UtbWRi
LmMtaW5jbHVkZS1saW1pdHMuaC5wYXRjaCAgfCA0MSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e2lwcm91dGUyXzYuNC4wLmJiID0+IGlwcm91dGUyXzYuNS4wLmJifSAgfCAgMyArLQogMiBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNDMgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWJy
aWRnZS1tZGIuYy1pbmNsdWRlLWxpbWl0cy5oLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9pcHJvdXRlMi97aXByb3V0ZTJfNi40LjAuYmIgPT4gaXByb3V0ZTJfNi41LjAu
YmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRl
Mi9pcHJvdXRlMi8wMDAxLWJyaWRnZS1tZGIuYy1pbmNsdWRlLWxpbWl0cy5oLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWJyaWRnZS1tZGIu
Yy1pbmNsdWRlLWxpbWl0cy5oLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBm
OWEwZTM1ZDgzLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXBy
b3V0ZTIvaXByb3V0ZTIvMDAwMS1icmlkZ2UtbWRiLmMtaW5jbHVkZS1saW1pdHMuaC5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDQxICswLDAgQEAKLUZyb20gYjEzZjA0YzBjNjg1YjZkMjQ3NGFh
N2Q5N2UxOTE1MzFmMzI3YmM0NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFRyZXZv
ciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci1EYXRlOiBUaHUsIDIwIEp1bCAyMDIz
IDE0OjMyOjIzIC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0hdIGJyaWRnZS9tZGIuYzogaW5jbHVkZSBs
aW1pdHMuaAotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZAotKGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL25ldGRldi8yMDIzMDcyMDIwMzcyNi4yMzE2MjUxLTEtdGdhbWJsaW5AYmF5bGlicmUu
Y29tLykKLQotV2hpbGUgYnVpbGRpbmcgaXByb3V0ZTIgNi40LjAgd2l0aCBtdXNsIHVzaW5nIFlv
Y3RvIFByb2plY3QsIGVycm9ycyBzdWNoCi1hcyB0aGUgZm9sbG93aW5nIHdlcmUgZW5jb3VudGVy
ZWQ6Ci0KLXwgbWRiLmM6IEluIGZ1bmN0aW9uICdtZGJfcGFyc2Vfdm5pJzoKLXwgbWRiLmM6NjY2
OjQ3OiBlcnJvcjogJ1VMT05HX01BWCcgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVu
Y3Rpb24pCi18ICAgNjY2IHwgICAgICAgICBpZiAoKGVuZHB0ciAmJiAqZW5kcHRyKSB8fCB2bmlf
bnVtID09IFVMT05HX01BWCkKLXwgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+Ci18IG1kYi5jOjY2Njo0Nzogbm90ZTogJ1VMT05H
X01BWCcgaXMgZGVmaW5lZCBpbiBoZWFkZXIgJzxsaW1pdHMuaD4nOyBkaWQgeW91IGZvcmdldCB0
byAnI2luY2x1ZGUgPGxpbWl0cy5oPic/Ci0KLUluY2x1ZGUgbGltaXRzLmggaW4gYnJpZGdlL21k
Yi5jIHRvIGZpeCB0aGlzIGlzc3VlLiBUaGlzIGNoYW5nZSBpcyBiYXNlZAotb24gb25lIGluIEFs
cGluZSBMaW51eCwgYnV0IHRoZSBhdXRob3IgdGhlcmUgaGFkIG5vIHBsYW5zIHRvIHN1Ym1pdDoK
LWh0dHBzOi8vZ2l0LmFscGluZWxpbnV4Lm9yZy9hcG9ydHMvY29tbWl0L21haW4vaXByb3V0ZTIv
aW5jbHVkZS5wYXRjaD9pZD1iZDQ2ZWZiOGE4ZGE1NDk0ODYzOWNlYmNmYTViMzdiZDYwOGYxMDY5
Ci0KLVNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+
Ci0tLS0KLSBicmlkZ2UvbWRiLmMgfCAxICsKLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKLQotZGlmZiAtLWdpdCBhL2JyaWRnZS9tZGIuYyBiL2JyaWRnZS9tZGIuYwotaW5kZXggZmJi
NGY3MDQuLjE4NzkzNDU4IDEwMDY0NAotLS0tIGEvYnJpZGdlL21kYi5jCi0rKysgYi9icmlkZ2Uv
bWRiLmMKLUBAIC0xNSw2ICsxNSw3IEBACi0gI2luY2x1ZGUgPHN0cmluZy5oPgotICNpbmNsdWRl
IDxhcnBhL2luZXQuaD4KLSAjaW5jbHVkZSA8bmV0ZGIuaD4KLSsjaW5jbHVkZSA8bGltaXRzLmg+
Ci0gCi0gI2luY2x1ZGUgImxpYm5ldGxpbmsuaCIKLSAjaW5jbHVkZSAidXRpbHMuaCIKLS0tIAot
Mi40MS4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIv
aXByb3V0ZTJfNi40LjAuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lw
cm91dGUyXzYuNS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi40LjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi41LjAuYmIKaW5kZXgg
MzJlMmY4MTc2Yi4uZGI0NmM4MzE3YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuNS4wLmJiCkBAIC0xMywxMCArMTMsOSBAQCBERVBF
TkRTID0gImZsZXgtbmF0aXZlIGJpc29uLW5hdGl2ZSBpcHRhYmxlcyBsaWJjYXAiCiAKIFNSQ19V
UkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy9uZXQvJHtCUE59LyR7QlB9LnRh
ci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWxpYmMtY29tcGF0LmgtYWRkLW11c2wtd29y
a2Fyb3VuZC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWJyaWRnZS1tZGIuYy1pbmNs
dWRlLWxpbWl0cy5oLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNGM1MWI4ZGVjYmM3ZTRkYTE1OWZmYjA2NmY1OTBjZmI5M2RiZjlhZjdmZjg2YjE2NDdjZTQy
YjdjMTc5YTI3MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhNzAxNzkwODVmYTFiOTZkM2MzM2Iw
NDBjODA5Yjc1ZTJiNTc1NjNhZGM1MDVhNGFkMDVlMjYwOWRmMzczNDYzIgogCiBpbmhlcml0IHVw
ZGF0ZS1hbHRlcm5hdGl2ZXMgYmFzaC1jb21wbGV0aW9uIHBrZ2NvbmZpZwogCi0tIAoyLjM5LjIK
Cg==

--===============7196970001993768462==--

