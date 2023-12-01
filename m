Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96776C25B68
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.22207.1701436492662545387
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PU9vuFBG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hhFGfHxA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018c258488bc-aa8e4164-9abd-483b-a5c8-a63be9decd01-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iIPLyRpP1pBj67qnhHr3mOzpPKAgci9oT1brd8TKOUE=;
	b=PU9vuFBGI6vwr58aSmZ+3nGMI2sEh1z+WUx5QMhTm1ryCqJE2S3vGFaC91ec8k06
	UbmTElIlOEdtdEV4iLvWq4X64fQGUh9OA8vGJZVXX1xiukb26HLll0q0MFKofnTjTIp
	PzAAP6jeAT+ZPRn42lBp00zWec/ofC05x/5d1b/A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iIPLyRpP1pBj67qnhHr3mOzpPKAgci9oT1brd8TKOUE=;
	b=hhFGfHxAn93W5+huJ0Wh9/ydKfnhH1rvjh+6iaOBFQ5bUc0fPaOjyAJp2V37wnbx
	CIka/h2AAqBKSrKiwXzcfGkA5ZaBu+JBgXqq0dbO9aFvqp35PsZave55JnR6W5+m6dk
	A8tbbCEYLdEwwBJkv+VKOZkZOeiB4vnZQE4bRfR4=
Content-Type: multipart/mixed; boundary="===============6487954595242585466=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.6 SUCCEEDED
Message-ID: <0101018c258488bc-aa8e4164-9abd-483b-a5c8-a63be9decd01-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191618

--===============6487954595242585466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *6.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.5-6.6.patch
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
From e66446c830f79850bc2a3b9b326b9a59016fa50c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 10:33:54 +0000
Subject: [PATCH] ethtool: upgrade 6.5 -> 6.6

---
 .../recipes-extended/ethtool/{ethtool_6.5.bb => ethtool_6.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.5.bb => ethtool_6.6.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool_6.5.bb b/meta/recipes-extended/ethtool/ethtool_6.6.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.5.bb
rename to meta/recipes-extended/ethtool/ethtool_6.6.bb
index ef925e16b9..ab824356c2 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.5.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "aed41ca58b3129126f18429172064d214191d7e7ef52c6e3f6b2ff7503706c03"
+SRC_URI[sha256sum] = "d4cdb4f7498781fb516e2b3d0eadab28691da3fd3e3445954e82d745de95fb96"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.39.2


--===============6487954595242585466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.5" to "6.6"
packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.5 [default] to 6.6 [default]
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PV changed from "6.5" to "6.6"
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 4442472 to 4444176 (+0%)
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.5 [default] to 6.6 [default]
packages/core2-64-poky-linux/ethtool/ethtool-dev: PV changed from "6.5" to "6.6"
packages/core2-64-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.5 [default] to 6.6 [default]
packages/core2-64-poky-linux/ethtool/ethtool-doc: PV changed from "6.5" to "6.6"
packages/core2-64-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 47992 to 47991 (-0%)
packages/core2-64-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.5 [default] to 6.6 [default]
packages/core2-64-poky-linux/ethtool/ethtool-locale: PV changed from "6.5" to "6.6"
packages/core2-64-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.5 [default] to 6.6 [default]
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PV changed from "6.5" to "6.6"
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1704299 to 1709290 (+0%)
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.5 [default] to 6.6 [default]
packages/core2-64-poky-linux/ethtool/ethtool-src: FILELIST: directory renamed /usr/src/debug/ethtool/6.5/uapi/linux/hdlc -> /usr/src/debug/ethtool/6.6/uapi/linux/hdlc, directory renamed /usr/src/debug/ethtool/6.5 -> /usr/src/debug/ethtool/6.6, directory renamed /usr/src/debug/ethtool/6.5/netlink -> /usr/src/debug/ethtool/6.6/netlink, removed "/usr/src/debug/ethtool/6.5/uapi/linux/ethtool_netlink.h /usr/src/debug/ethtool/6.5/uapi/linux/genetlink.h /usr/src/debug/ethtool/6.5/uapi/linux/rtnetlink.h /usr/src/debug/ethtool/6.5/uapi/linux/net_tstamp.h /usr/src/debug/ethtool/6.5/uapi/linux/if.h /usr/src/debug/ethtool/6.5/uapi/linux/ethtool.h /usr/src/debug/ethtool/6.5/uapi/linux/if_link.h /usr/src/debug/ethtool/6.5/uapi/linux/netlink.h", added "/usr/src/debug/ethtool/6.6/uapi/linux/ethtool_netlink.h /usr/src/debug/ethtool/6.6/uapi/linux/genetlink.h /usr/src/debug/ethtool/6.6/uapi/linux/rtnetlink.h /usr/src/debug/ethtool/6.6/uapi/linux/net_tstamp.h /usr/src/debug/ethtool/6.6/uapi/linux/if.h 
 /usr/src/debug/ethtool/6.6/uapi/linux/if_ether.h /usr/src/debug/ethtool/6.6/uapi/linux/ethtool.h /usr/src/debug/ethtool/6.6/uapi/linux/types.h /usr/src/debug/ethtool/6.6/uapi/linux/if_link.h /usr/src/debug/ethtool/6.6/uapi/linux/netlink.h"
packages/core2-64-poky-linux/ethtool/ethtool-src: PV changed from "6.5" to "6.6"
packages/core2-64-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1389110 to 1400368 (+1%)
packages/core2-64-poky-linux/ethtool/ethtool-src: PKGV changed from 6.5 [default] to 6.6 [default]
packages/core2-64-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.5" to "6.6"
packages/core2-64-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.5 [default] to 6.6 [default]
packages/core2-64-poky-linux/ethtool/ethtool: PV changed from "6.5" to "6.6"
packages/core2-64-poky-linux/ethtool/ethtool: PKGSIZE changed from 667216 to 671312 (+1%)
packages/core2-64-poky-linux/ethtool/ethtool: PKGV changed from 6.5 [default] to 6.6 [default]
packages/core2-64-poky-linux/ethtool: PV changed from "6.5" to "6.6"
packages/core2-64-poky-linux/ethtool: PKGV changed from 6.5 [default] to 6.6 [default]
packages/core2-64-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.5.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.6.tar.gz file://run-ptest file://avoid_parallel_tests.patch"

--===============6487954595242585466==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ethtool-upgrade-6.5-6.6.patch"

RnJvbSBlNjY0NDZjODMwZjc5ODUwYmMyYTNiOWIzMjZiOWE1OTAxNmZhNTBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAxMDozMzo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV0
aHRvb2w6IHVwZ3JhZGUgNi41IC0+IDYuNgoKLS0tCiAuLi4vcmVjaXBlcy1leHRlbmRlZC9ldGh0
b29sL3tldGh0b29sXzYuNS5iYiA9PiBldGh0b29sXzYuNi5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZXRodG9vbC97ZXRodG9vbF82LjUuYmIgPT4gZXRodG9vbF82LjYuYmJ9ICg5MyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjUu
YmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuNi5iYgpzaW1pbGFy
aXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9l
dGh0b29sXzYuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRo
dG9vbF82LjYuYmIKaW5kZXggZWY5MjVlMTZiOS4uYWI4MjQzNTZjMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjUuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjYuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JD
X1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L3NvZnR3YXJlL25ldHdvcmsvZXRodG9vbC9ldGh0
b29sLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9hdm9pZF9wYXJhbGxlbF90ZXN0
cy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFlZDQxY2E1
OGIzMTI5MTI2ZjE4NDI5MTcyMDY0ZDIxNDE5MWQ3ZTdlZjUyYzZlM2Y2YjJmZjc1MDM3MDZjMDMi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDRjZGI0Zjc0OTg3ODFmYjUxNmUyYjNkMGVhZGFiMjg2
OTFkYTNmZDNlMzQ0NTk1NGU4MmQ3NDVkZTk1ZmI5NiIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0g
Imh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvZXRodG9vbC8iCiAK
LS0gCjIuMzkuMgoK

--===============6487954595242585466==--

