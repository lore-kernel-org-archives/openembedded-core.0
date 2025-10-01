Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B45BCCF9F5
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:37 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.18107.1759325554691373816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YEQPI1+g;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=c856mWYR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101999ff98e74-c415e048-3f67-4b7a-a846-6572a7f2f8cb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DKvbVm8FQvormtv3Mr//L6dFGHZqBNjCbQZMUAmJVxA=;
	b=YEQPI1+gJAvd8d3OfqlZcLE294y38h6cD37BMxber5uEARRfJfdaUe2OGQbZuRLR
	s2Fx+sLi9G0//EPGY1vB0dxMyEK4Jj5YpimBJ8TN+mcUjKOlFDw8Fp2k1AQsE74viEZ
	O9KFEeQryyABRKE/CwNBli2I0mETP5vGhxFFp0rY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DKvbVm8FQvormtv3Mr//L6dFGHZqBNjCbQZMUAmJVxA=;
	b=c856mWYRA/3VrWvc95mzZtwhjt/hJfvIPW4GUdzdUC1Pl8ULnhIjuXtNYjb0K1Sq
	eEfp3FJKp88A8GnsfMtMMBTx5ckkAn4bz9LcumlCp9U10FWkXBq9uYcivrA9PoI2003
	/p4J5xUbu87kVy38IKoM9napWZUZbc085L9xmRFw=
Content-Type: multipart/mixed; boundary="===============6568827709240790197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libproxy: upgrading to 0.5.11 SUCCEEDED
Message-ID: <010101999ff98e74-c415e048-3f67-4b7a-a846-6572a7f2f8cb-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224299

--===============6568827709240790197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libproxy* to *0.5.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libproxy-upgrade-0.5.10-0.5.11.patch
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
From c99285862c5d52830e5047a65f0c9b3280a6af46 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 13:09:42 +0000
Subject: [PATCH] libproxy: upgrade 0.5.10 -> 0.5.11

---
 .../libproxy/{libproxy_0.5.10.bb => libproxy_0.5.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.10.bb => libproxy_0.5.11.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.10.bb b/meta/recipes-support/libproxy/libproxy_0.5.11.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.10.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.11.bb
index 21930ada00..1efa3cdc0e 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.10.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.11.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=${PV}"
-SRCREV = "7e4852f9658084c61a95973b8a1d720b1763437a"
+SRCREV = "3fd3a6e845c0386d91abc742453d0f29bf28c404"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
 GIDOCGEN_MESON_OPTION = 'docs'
-- 
2.47.1


--===============6568827709240790197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libproxy: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy: SRC_URI changed from "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=0.5.10" to "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: FILELIST: removed "/usr/lib/.debug/libproxy.so.0.5.10", added "/usr/lib/.debug/libproxy.so.0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dev: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-doc: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-locale: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-src: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-src: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.10", added "/usr/lib/libproxy.so.0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.5.10/modules", added "/usr/lib/libproxy/0.5.11/modules"
Changes to packages/x86-64-v3-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.10 to libproxy.so.0.5.11
  /usr/lib/libproxy.so.0.5.10 moved to /usr/lib/libproxy.so.0.5.11

--===============6568827709240790197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.5.10-0.5.11.patch"

RnJvbSBjOTkyODU4NjJjNWQ1MjgzMGU1MDQ3YTY1ZjBjOWIzMjgwYTZhZjQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMzowOTo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnByb3h5OiB1cGdyYWRlIDAuNS4xMCAtPiAwLjUuMTEKCi0tLQogLi4uL2xpYnByb3h5L3tsaWJw
cm94eV8wLjUuMTAuYmIgPT4gbGlicHJveHlfMC41LjExLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlicHJveHkve2xpYnByb3h5XzAuNS4xMC5iYiA9PiBsaWJwcm94eV8w
LjUuMTEuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJv
eHkvbGlicHJveHlfMC41LjEwLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGli
cHJveHlfMC41LjExLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYnByb3h5L2xpYnByb3h5XzAuNS4xMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGlicHJveHlfMC41LjExLmJiCmluZGV4IDIxOTMwYWRh
MDAuLjFlZmEzY2RjMGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5
L2xpYnByb3h5XzAuNS4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9s
aWJwcm94eV8wLjUuMTEuYmIKQEAgLTE0LDcgKzE0LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXAogREVQ
RU5EUyA9ICJnbGliLTIuMCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2xpYnByb3h5
L2xpYnByb3h5O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz0ke1BWfSIKLVNSQ1JFViA9
ICI3ZTQ4NTJmOTY1ODA4NGM2MWE5NTk3M2I4YTFkNzIwYjE3NjM0MzdhIgorU1JDUkVWID0gIjNm
ZDNhNmU4NDVjMDM4NmQ5MWFiYzc0MjQ1M2QwZjI5YmYyOGM0MDQiCiAKIGluaGVyaXQgbWVzb24g
cGtnY29uZmlnIGdvYmplY3QtaW50cm9zcGVjdGlvbiB2YWxhIGdpLWRvY2dlbgogR0lET0NHRU5f
TUVTT05fT1BUSU9OID0gJ2RvY3MnCi0tIAoyLjQ3LjEKCg==

--===============6568827709240790197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.10", added "/usr/lib/libproxy.so.0.5.11"
Changes to packages/x86-64-v3-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.10 to libproxy.so.0.5.11
  /usr/lib/libproxy.so.0.5.10 moved to /usr/lib/libproxy.so.0.5.11

--===============6568827709240790197==--

