Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5D9CCFA13
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:54 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15722.1777645547891219740
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NUAeIcql;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Snqc2F6m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019de3ee6d44-9eda7949-95eb-4962-9e87-134a51e312d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645547;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xDWfqw4HslWxzcMdqGv0aQnFCINUo4CVY4NUaD/XPwo=;
	b=NUAeIcql1tNB+Md/6vGwisBqkjdAA4+JcEz4iYTorM0acO8wI0Xntwc01+f8Fb8j
	4BcJ+Nyi2ja0sScrb35x+1yjyXqvO9KD1RIFUkd/OJvAkk/hZhSufM+B0MyHPZk8zXA
	GXWYZyknx0N4GxieXdrKLrMheMzAXVQClzxd8dpE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645547;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xDWfqw4HslWxzcMdqGv0aQnFCINUo4CVY4NUaD/XPwo=;
	b=Snqc2F6myymQDz9nKtcIkcRE9DFrym2CTb2a39QuAsU57eLSQnbq7WFNetlX1g9H
	/mz6xdAU4xaZDt++p/ygXbWc+7AI41GHw1E23sZ7jUuh796ZRhMfWNG5ewwuXKQeEpP
	Uosvu3cmr9MiZ0lFqHskvk/dArCkrCsylYN35tgE=
Content-Type: multipart/mixed; boundary="===============0073529806694059003=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libsolv: upgrading to 0.7.37 SUCCEEDED
Message-ID: <0101019de3ee6d44-9eda7949-95eb-4962-9e87-134a51e312d8-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236261

--===============0073529806694059003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsolv* to *0.7.37* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.36-0.7.37.patch
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
From b96d58b1fcabce833c4ed46dbee498f3eae75fce Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 10:22:39 +0000
Subject: [PATCH] libsolv: upgrade 0.7.36 -> 0.7.37

---
 .../libsolv/0001-compress_buf-fix-musl-segfaults.patch       | 5 +----
 .../libsolv/{libsolv_0.7.36.bb => libsolv_0.7.37.bb}         | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.36.bb => libsolv_0.7.37.bb} (96%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch b/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
index cf87b3c4c6..c2734eb676 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
@@ -1,4 +1,4 @@
-From 23e2d4c5064ddb023ed1a9d364793dbe0d20717f Mon Sep 17 00:00:00 2001
+From 847fb663583fd01121313d1ec0e9ceab240c9143 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <adam.duskett@amarulasolutions.com>
 Date: Thu, 26 Mar 2026 12:11:42 +0100
 Subject: [PATCH] compress_buf: fix musl segfaults
@@ -39,6 +39,3 @@ index 77c7fcc7..470e4f34 100644
    unsigned int litofs = 0;
    memset(htab, -1, sizeof (htab));
    memset(hnext, -1, sizeof (hnext));
--- 
-2.53.0
-
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb b/meta/recipes-extended/libsolv/libsolv_0.7.37.bb
similarity index 96%
rename from meta/recipes-extended/libsolv/libsolv_0.7.36.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.37.bb
index 852e79c45e..1a95d1d11d 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.37.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;ta
            file://run-ptest \
 "
 
-SRCREV = "1e377699be108ec82bb798ec9c223d45d84a733c"
+SRCREV = "806c0513cd0799a37802f483710cfbdcc6d16b5f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============0073529806694059003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libsolv: PV changed from "0.7.36" to "0.7.37"
packages/x86-64-v3-poky-linux/libsolv: SRC_URI changed from "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=0.7.36 file://0001-compress_buf-fix-musl-segfaults.patch file://run-ptest" to "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=0.7.37 file://0001-compress_buf-fix-musl-segfaults.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libsolv: PKGV changed from 0.7.36 [default] to 0.7.37 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 3043256 to 3048160 (+0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.36" to "0.7.37"
packages/x86-64-v3-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.36 [default] to 0.7.37 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-dev: PKGSIZE changed from 130652 to 130844 (+0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.36" to "0.7.37"
packages/x86-64-v3-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.36 [default] to 0.7.37 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.36" to "0.7.37"
packages/x86-64-v3-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.36 [default] to 0.7.37 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.36" to "0.7.37"
packages/x86-64-v3-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.36 [default] to 0.7.37 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-ptest: PV changed from "0.7.36" to "0.7.37"
packages/x86-64-v3-poky-linux/libsolv/libsolv-ptest: PKGV changed from 0.7.36 [default] to 0.7.37 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1668803 to 1670982 (+0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: PV changed from "0.7.36" to "0.7.37"
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.36 [default] to 0.7.37 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: FILELIST: directory renamed /usr/src/debug/libsolv/0.7.36/ext -> /usr/src/debug/libsolv/0.7.37/ext, directory renamed /usr/src/debug/libsolv/0.7.36/tools -> /usr/src/debug/libsolv/0.7.37/tools, directory renamed /usr/src/debug/libsolv/0.7.36/src -> /usr/src/debug/libsolv/0.7.37/src
packages/x86-64-v3-poky-linux/libsolv/libsolv-staticdev: PKGSIZE changed from 4449140 to 4456156 (+0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.36" to "0.7.37"
packages/x86-64-v3-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.36 [default] to 0.7.37 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.36" to "0.7.37"
packages/x86-64-v3-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.36 [default] to 0.7.37 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv: PKGSIZE changed from 667648 to 671744 (+1%)
packages/x86-64-v3-poky-linux/libsolv/libsolv: PV changed from "0.7.36" to "0.7.37"
packages/x86-64-v3-poky-linux/libsolv/libsolv: PKGV changed from 0.7.36 [default] to 0.7.37 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolvext: PV changed from "0.7.36" to "0.7.37"
packages/x86-64-v3-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.36 [default] to 0.7.37 [default]

--===============0073529806694059003==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.36-0.7.37.patch"

RnJvbSBiOTZkNThiMWZjYWJjZTgzM2M0ZWQ0NmRiZWU0OThmM2VhZTc1ZmNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMDoyMjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNvbHY6IHVwZ3JhZGUgMC43LjM2IC0+IDAuNy4zNwoKLS0tCiAuLi4vbGlic29sdi8wMDAxLWNv
bXByZXNzX2J1Zi1maXgtbXVzbC1zZWdmYXVsdHMucGF0Y2ggICAgICAgfCA1ICstLS0tCiAuLi4v
bGlic29sdi97bGlic29sdl8wLjcuMzYuYmIgPT4gbGlic29sdl8wLjcuMzcuYmJ9ICAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi97bGlic29sdl8wLjcuMzYuYmIg
PT4gbGlic29sdl8wLjcuMzcuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYnNvbHYvbGlic29sdi8wMDAxLWNvbXByZXNzX2J1Zi1maXgtbXVzbC1zZWdmYXVs
dHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2LzAwMDEtY29t
cHJlc3NfYnVmLWZpeC1tdXNsLXNlZ2ZhdWx0cy5wYXRjaAppbmRleCBjZjg3YjNjNGM2Li5jMjcz
NGViNjc2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2
LzAwMDEtY29tcHJlc3NfYnVmLWZpeC1tdXNsLXNlZ2ZhdWx0cy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2LzAwMDEtY29tcHJlc3NfYnVmLWZpeC1tdXNs
LXNlZ2ZhdWx0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjNlMmQ0YzUwNjRkZGIwMjNl
ZDFhOWQzNjQ3OTNkYmUwZDIwNzE3ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODQ3
ZmI2NjM1ODNmZDAxMTIxMzEzZDFlYzBlOWNlYWIyNDBjOTE0MyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFkYW0gRHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgogRGF0ZTogVGh1LCAyNiBNYXIgMjAyNiAxMjoxMTo0MiArMDEwMAogU3ViamVjdDogW1BB
VENIXSBjb21wcmVzc19idWY6IGZpeCBtdXNsIHNlZ2ZhdWx0cwpAQCAtMzksNiArMzksMyBAQCBp
bmRleCA3N2M3ZmNjNy4uNDcwZTRmMzQgMTAwNjQ0CiAgICB1bnNpZ25lZCBpbnQgbGl0b2ZzID0g
MDsKICAgIG1lbXNldChodGFiLCAtMSwgc2l6ZW9mIChodGFiKSk7CiAgICBtZW1zZXQoaG5leHQs
IC0xLCBzaXplb2YgKGhuZXh0KSk7Ci0tLSAKLTIuNTMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zNi5iYiBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjM3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjM2LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zNy5i
YgppbmRleCA4NTJlNzljNDVlLi4xYTk1ZDFkMTFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zNy5iYgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vb3BlblNVU0UvbGlic29sdi5naXQ7YnJhbmNoPW1hc3Rlcjtw
cm90b2NvbD1odHRwczt0YQogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICIKIAotU1JD
UkVWID0gIjFlMzc3Njk5YmUxMDhlYzgyYmI3OThlYzljMjIzZDQ1ZDg0YTczM2MiCitTUkNSRVYg
PSAiODA2YzA1MTNjZDA3OTlhMzc4MDJmNDgzNzEwY2ZiZGNjNmQxNmI1ZiIKIAogVVBTVFJFQU1f
Q0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCi0tIAoyLjQ3LjEK
Cg==

--===============0073529806694059003==--

