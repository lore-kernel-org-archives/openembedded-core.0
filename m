Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7C0EFCBD4
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:57 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28969.1773582115168134704
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RKc3JM61;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=H4Ot3IqM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019cf1bb5cf3-a6658aea-1eb6-4385-a757-8170b962686e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=avbyIRwvN8G87UoPerromwPVzsE3hiGn8DEJodabs+c=;
	b=RKc3JM61xPLTbJ/c0qmqxBMl0v8vVwT30tWMgGHnBxG56n+ogzB8KwrvaZwbIKWp
	EliWjBUzwwu3t9vuN0CFIkHdhI3QeRk4uxGquWYD0UaRW0hP5s9AOjocfSrx+OgxtDq
	cZlV5pD57QQae8CsJP7yVvVHSsJnqIzKokbCyCiA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=avbyIRwvN8G87UoPerromwPVzsE3hiGn8DEJodabs+c=;
	b=H4Ot3IqMEHd3n375VENYpW0MsyQvqCg4yZToXruZrOWeKtVGNDcJzXivuj+y/QYe
	Ti3suyxfyKia3hO9Atfn0rA5VtKJiXU+SHMBkQhZi22aGN00OR7k/EeTPV9S0cIAHh3
	+m+3T2Hvm5A1PjTuDekMYLC0T1oFHKJWsNzeFom8=
Content-Type: multipart/mixed; boundary="===============0496910225421880799=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] seatd: upgrading to 0.9.3 SUCCEEDED
Message-ID: <0101019cf1bb5cf3-a6658aea-1eb6-4385-a757-8170b962686e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233135

--===============0496910225421880799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *seatd* to *0.9.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-seatd-upgrade-0.9.2-0.9.3.patch
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
From b3ac5d4b7a03adcdbd34c8eae84d1c7e4dc44d3c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 07:03:13 +0000
Subject: [PATCH] seatd: upgrade 0.9.2 -> 0.9.3

---
 meta/recipes-core/seatd/{seatd_0.9.2.bb => seatd_0.9.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/seatd/{seatd_0.9.2.bb => seatd_0.9.3.bb} (97%)

diff --git a/meta/recipes-core/seatd/seatd_0.9.2.bb b/meta/recipes-core/seatd/seatd_0.9.3.bb
similarity index 97%
rename from meta/recipes-core/seatd/seatd_0.9.2.bb
rename to meta/recipes-core/seatd/seatd_0.9.3.bb
index 9e1b50c087..d0802eee60 100644
--- a/meta/recipes-core/seatd/seatd_0.9.2.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "a3c56c324c3a84474cc1615d94ccd6a6255d0c10"
+SRCREV = "daa8196e10b180b8b0caeafa8e5f860eb1bd6706"
 
 inherit meson pkgconfig systemd update-rc.d useradd
 
-- 
2.47.1


--===============0496910225421880799==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-seatd-upgrade-0.9.2-0.9.3.patch"

RnJvbSBiM2FjNWQ0YjdhMDNhZGNkYmQzNGM4ZWFlODRkMWM3ZTRkYzQ0ZDNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDc6MDM6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
ZWF0ZDogdXBncmFkZSAwLjkuMiAtPiAwLjkuMwoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS9zZWF0
ZC97c2VhdGRfMC45LjIuYmIgPT4gc2VhdGRfMC45LjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
cmUvc2VhdGQve3NlYXRkXzAuOS4yLmJiID0+IHNlYXRkXzAuOS4zLmJifSAoOTclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOS4yLmJiIGIvbWV0YS9yZWNp
cGVzLWNvcmUvc2VhdGQvc2VhdGRfMC45LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC45LjIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOS4zLmJiCmluZGV4IDllMWI1MGMwODcuLmQw
ODAyZWVlNjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOS4y
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOS4zLmJiCkBAIC04LDcg
KzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03MTVhOTlkMmRk
NTUyZTYxODhlNzRkNGVkMjkxNGQ1YSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXQuc3IuaHQvfmtl
bm55bGV2aW5zZW4vc2VhdGQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCiAgICAgICAg
ICAgIGZpbGU6Ly9pbml0IgotU1JDUkVWID0gImEzYzU2YzMyNGMzYTg0NDc0Y2MxNjE1ZDk0Y2Nk
NmE2MjU1ZDBjMTAiCitTUkNSRVYgPSAiZGFhODE5NmUxMGIxODBiOGIwY2FlYWZhOGU1Zjg2MGVi
MWJkNjcwNiIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcgc3lzdGVtZCB1cGRhdGUtcmMuZCB1
c2VyYWRkCiAKLS0gCjIuNDcuMQoK

--===============0496910225421880799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/seatd: PKGV changed from 0.9.2 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/seatd: PV changed from "0.9.2" to "0.9.3"
packages/x86-64-v3-poky-linux/seatd/seatd-dbg: PKGV changed from 0.9.2 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/seatd/seatd-dbg: PV changed from "0.9.2" to "0.9.3"
packages/x86-64-v3-poky-linux/seatd/seatd-dbg: PKGSIZE changed from 364424 to 367768 (+1%)
packages/x86-64-v3-poky-linux/seatd/seatd-dev: PKGV changed from 0.9.2 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/seatd/seatd-dev: PV changed from "0.9.2" to "0.9.3"
packages/x86-64-v3-poky-linux/seatd/seatd-doc: PKGV changed from 0.9.2 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/seatd/seatd-doc: PV changed from "0.9.2" to "0.9.3"
packages/x86-64-v3-poky-linux/seatd/seatd-locale: PKGV changed from 0.9.2 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/seatd/seatd-locale: PV changed from "0.9.2" to "0.9.3"
packages/x86-64-v3-poky-linux/seatd/seatd-src: FILELIST: directory renamed /usr/src/debug/seatd/0.9.2/include -> /usr/src/debug/seatd/0.9.3/include, directory renamed /usr/src/debug/seatd/0.9.2/libseat -> /usr/src/debug/seatd/0.9.3/libseat, directory renamed /usr/src/debug/seatd/0.9.2/libseat/backend -> /usr/src/debug/seatd/0.9.3/libseat/backend, directory renamed /usr/src/debug/seatd/0.9.2/common -> /usr/src/debug/seatd/0.9.3/common, directory renamed /usr/src/debug/seatd/0.9.2/seatd-launch -> /usr/src/debug/seatd/0.9.3/seatd-launch, directory renamed /usr/src/debug/seatd/0.9.2/seatd -> /usr/src/debug/seatd/0.9.3/seatd
packages/x86-64-v3-poky-linux/seatd/seatd-src: PKGV changed from 0.9.2 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/seatd/seatd-src: PV changed from "0.9.2" to "0.9.3"
packages/x86-64-v3-poky-linux/seatd/seatd-src: PKGSIZE changed from 138672 to 139670 (+1%)
packages/x86-64-v3-poky-linux/seatd/seatd-staticdev: PKGV changed from 0.9.2 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/seatd/seatd-staticdev: PV changed from "0.9.2" to "0.9.3"
packages/x86-64-v3-poky-linux/seatd/seatd: PKGV changed from 0.9.2 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/seatd/seatd: PV changed from "0.9.2" to "0.9.3"
packages/x86-64-v3-poky-linux/seatd/seatd: PKGSIZE changed from 134816 to 138912 (+3%)

--===============0496910225421880799==--

