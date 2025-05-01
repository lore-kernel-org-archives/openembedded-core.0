Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E21CC3ABA3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1789.1746113616102970307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UPWrn3Ub;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bHs6KFWb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101968c7b8291-a08b00fb-699b-416d-88c8-918a956f4063-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hxnrEo3cmcHarYsdFJRCFN6q3PejqS26QTpMuRci/sE=;
	b=UPWrn3UbpzgqfZckq29UnItZO0h/98Eq5xoK/TttMvG8kDAiDr2wxvBAjMmVXonP
	jmd21P/tCXWtVfMIR7Z1vwbua0KWXQbCKZgl/vWfy1mmQ6gTVkJBAeQEKfNaqqVnG8S
	6lMN4VZuvtIoEYvYBrzIlFo6imou/g4AUN18ggVs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hxnrEo3cmcHarYsdFJRCFN6q3PejqS26QTpMuRci/sE=;
	b=bHs6KFWb6Md1mK5wyRFCg1m4SXePyDqGt1feKVI7QX0QSruYlFLZ/t/0/6fp2Um1
	j7OEueRIQnoN+RbFwiWMC5iLzdZSqP59HO3B4x4IE5dmnFA633mChBb73/qP0nAAn53
	iRMBRkHJRxkbY6Iiz/S2SUT6nBLu317f5FS5RWiU=
Content-Type: multipart/mixed; boundary="===============3295152823123901997=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] swig: upgrading to 4.3.1 SUCCEEDED
Message-ID: <010101968c7b8291-a08b00fb-699b-416d-88c8-918a956f4063-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215841

--===============3295152823123901997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *swig* to *4.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-swig-upgrade-4.3.0-4.3.1.patch
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
From 239c58b723157cbcab65d60fa4e6a46b14ab7982 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 10:19:48 +0000
Subject: [PATCH] swig: upgrade 4.3.0 -> 4.3.1

---
 meta/recipes-devtools/swig/swig/determinism.patch           | 2 +-
 meta/recipes-devtools/swig/{swig_4.3.0.bb => swig_4.3.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.3.0.bb => swig_4.3.1.bb} (94%)

diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
index 4359281bbb..8e9a1569f4 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,4 +1,4 @@
-From 1cd6f0cc21fc977a710e8d30c3d2ebfee3c72dc0 Mon Sep 17 00:00:00 2001
+From 0ee1905594ffd1c5f8d187f3fe6b3ab749912049 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 00:11:10 +0000
 Subject: [PATCH] swig: Fix reproducibility issue
diff --git a/meta/recipes-devtools/swig/swig_4.3.0.bb b/meta/recipes-devtools/swig/swig_4.3.1.bb
similarity index 94%
rename from meta/recipes-devtools/swig/swig_4.3.0.bb
rename to meta/recipes-devtools/swig/swig_4.3.1.bb
index a31ca68444..dd979580a1 100644
--- a/meta/recipes-devtools/swig/swig_4.3.0.bb
+++ b/meta/recipes-devtools/swig/swig_4.3.1.bb
@@ -15,7 +15,7 @@ DEPENDS = "libpcre2 bison-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
             file://determinism.patch \
            "
-SRC_URI[sha256sum] = "f7203ef796f61af986c70c05816236cbd0d31b7aa9631e5ab53020ab7804aa9e"
+SRC_URI[sha256sum] = "44fc829f70f1e17d635a2b4d69acab38896699ecc24aa023e516e0eabbec61b8"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
 UPSTREAM_CHECK_REGEX = "swig-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============3295152823123901997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/swig: PV changed from "4.3.0" to "4.3.1"
packages/core2-64-poky-linux/swig: SRC_URI changed from "https://downloads.sourceforge.net/swig/swig-4.3.0.tar.gz file://determinism.patch" to "https://downloads.sourceforge.net/swig/swig-4.3.1.tar.gz file://determinism.patch"
packages/core2-64-poky-linux/swig: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/core2-64-poky-linux/swig/swig-dbg: PKGSIZE changed from 10819480 to 10819904 (+0%)
packages/core2-64-poky-linux/swig/swig-dbg: PV changed from "4.3.0" to "4.3.1"
packages/core2-64-poky-linux/swig/swig-dbg: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/core2-64-poky-linux/swig/swig-dev: PV changed from "4.3.0" to "4.3.1"
packages/core2-64-poky-linux/swig/swig-dev: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/core2-64-poky-linux/swig/swig-doc: PV changed from "4.3.0" to "4.3.1"
packages/core2-64-poky-linux/swig/swig-doc: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/core2-64-poky-linux/swig/swig-locale: PV changed from "4.3.0" to "4.3.1"
packages/core2-64-poky-linux/swig/swig-locale: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/core2-64-poky-linux/swig/swig-src: PKGSIZE changed from 4227816 to 4227878 (+0%)
packages/core2-64-poky-linux/swig/swig-src: PV changed from "4.3.0" to "4.3.1"
packages/core2-64-poky-linux/swig/swig-src: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/core2-64-poky-linux/swig/swig-staticdev: PV changed from "4.3.0" to "4.3.1"
packages/core2-64-poky-linux/swig/swig-staticdev: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/core2-64-poky-linux/swig/swig: PKGSIZE changed from 5140184 to 5140271 (+0%)
packages/core2-64-poky-linux/swig/swig: PV changed from "4.3.0" to "4.3.1"
packages/core2-64-poky-linux/swig/swig: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
Changes to packages/core2-64-poky-linux/swig (sysroot):
  /usr/share/swig/4.3.0 moved to /usr/share/swig/4.3.1

--===============3295152823123901997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/swig (sysroot):
  /usr/share/swig/4.3.0 moved to /usr/share/swig/4.3.1

--===============3295152823123901997==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-swig-upgrade-4.3.0-4.3.1.patch"

RnJvbSAyMzljNThiNzIzMTU3Y2JjYWI2NWQ2MGZhNGU2YTQ2YjE0YWI3OTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMDoxOTo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN3
aWc6IHVwZ3JhZGUgNC4zLjAgLT4gNC4zLjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N3
aWcvc3dpZy9kZXRlcm1pbmlzbS5wYXRjaCAgICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvc3dpZy97c3dpZ180LjMuMC5iYiA9PiBzd2lnXzQuMy4xLmJifSB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3tzd2lnXzQuMy4wLmJiID0+IHN3aWdfNC4zLjEuYmJ9
ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N3aWcvc3dpZy9kZXRl
cm1pbmlzbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3N3aWcvZGV0ZXJtaW5p
c20ucGF0Y2gKaW5kZXggNDM1OTI4MWJiYi4uOGU5YTE1NjlmNCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3N3aWcvc3dpZy9kZXRlcm1pbmlzbS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvc3dpZy9zd2lnL2RldGVybWluaXNtLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAxY2Q2ZjBjYzIxZmM5NzdhNzEwZThkMzBjM2QyZWJmZWUzYzcyZGMwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZWUxOTA1NTk0ZmZkMWM1ZjhkMTg3ZjNmZTZiM2FiNzQ5
OTEyMDQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBNb24sIDEgTWFyIDIwMjEg
MDA6MTE6MTAgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gc3dpZzogRml4IHJlcHJvZHVjaWJpbGl0
eSBpc3N1ZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N3aWcvc3dpZ180LjMu
MC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3N3aWdfNC4zLjEuYmIKc2ltaWxhcml0
eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N3aWcvc3dpZ180
LjMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N3aWcvc3dpZ180LjMuMS5i
YgppbmRleCBhMzFjYTY4NDQ0Li5kZDk3OTU4MGExIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvc3dpZy9zd2lnXzQuMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9z
d2lnL3N3aWdfNC4zLjEuYmIKQEAgLTE1LDcgKzE1LDcgQEAgREVQRU5EUyA9ICJsaWJwY3JlMiBi
aXNvbi1uYXRpdmUiCiBTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS8ke0JQTn0vJHtC
UE59LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgICBmaWxlOi8vZGV0ZXJtaW5pc20ucGF0Y2gg
XAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjcyMDNlZjc5NmY2MWFmOTg2
YzcwYzA1ODE2MjM2Y2JkMGQzMWI3YWE5NjMxZTVhYjUzMDIwYWI3ODA0YWE5ZSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI0NGZjODI5ZjcwZjFlMTdkNjM1YTJiNGQ2OWFjYWIzODg5NjY5OWVjYzI0
YWEwMjNlNTE2ZTBlYWJiZWM2MWI4IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vc291
cmNlZm9yZ2UubmV0L3Byb2plY3RzL3N3aWcvZmlsZXMvc3dpZy8iCiBVUFNUUkVBTV9DSEVDS19S
RUdFWCA9ICJzd2lnLSg/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAotLSAKMi40Ny4xCgo=

--===============3295152823123901997==--

