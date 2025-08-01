Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104F0CA0EF7
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:13 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.88803.1754057268190854943
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fZ1/Fh0Q;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Ou05OtH3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019865f62275-0bdd8ac8-18bc-4d42-ac5c-e43a1987dfec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057286;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=slmhjSdty3ztE/thUympmH7cYi7WTirTKT+06RECN7E=;
	b=fZ1/Fh0Q7wVpfWTj5R8hVoTOgRWW8tUEoTO4ntfJI6v4cM6XRTQ2U/P3LiYoo6i/
	ZqCzQvU+Zs6lFG43Hc8ygjlToQyNhc8ig9rcINjAjcShOvTGR0+24YRorCOJwZDElra
	UjLt5mjvwpWYr/rbQ3zQCv6pYZb8m+8cjMTnYY1s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057286;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=slmhjSdty3ztE/thUympmH7cYi7WTirTKT+06RECN7E=;
	b=Ou05OtH3vBwCg156LzRavCMQL59wF+XxnnWgOaDSVMSe03hOdN6mi1qJn7S1W1Pv
	FazU4wUO1vUwEQeKYnqjGwLNHVKRvyz27Mn3+OeMNW6BnQfXhLRp1cTJjimgbUB0wcX
	nRdM2UD4FGhGWEImaAe3Lwg0///BJN6voLSs6zGY=
Content-Type: multipart/mixed; boundary="===============0077377910913243687=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.29.0 SUCCEEDED
Message-ID: <0101019865f62275-0bdd8ac8-18bc-4d42-ac5c-e43a1987dfec-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221321

--===============0077377910913243687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.29.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.28.1-1.29.0.patch
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
From a396856b410c0d03111a49af6aa0ba2fc87da1b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 12:10:26 +0000
Subject: [PATCH] libinput: upgrade 1.28.1 -> 1.29.0

---
 .../wayland/{libinput_1.28.1.bb => libinput_1.29.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.28.1.bb => libinput_1.29.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.28.1.bb b/meta/recipes-graphics/wayland/libinput_1.29.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.28.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.29.0.bb
index 521a7f9a09..f38532a0c2 100644
--- a/meta/recipes-graphics/wayland/libinput_1.28.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.29.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "4f7b4ef0e4eb5d569df36be387579858eba349bb"
+SRCREV = "936cee224267a7d21c87c06203cd866c1572df20"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.47.1


--===============0077377910913243687==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.28.1-1.29.0.patch"

RnJvbSBhMzk2ODU2YjQxMGMwZDAzMTExYTQ5YWY2YWEwYmEyZmM4N2RhMWIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMjoxMDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmlucHV0OiB1cGdyYWRlIDEuMjguMSAtPiAxLjI5LjAKCi0tLQogLi4uL3dheWxhbmQve2xpYmlu
cHV0XzEuMjguMS5iYiA9PiBsaWJpbnB1dF8xLjI5LjAuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve2xpYmlucHV0XzEuMjguMS5iYiA9PiBsaWJpbnB1dF8x
LjI5LjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvbGliaW5wdXRfMS4yOC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGli
aW5wdXRfMS4yOS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjguMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGliaW5wdXRfMS4yOS4wLmJiCmluZGV4IDUyMWE3Zjlh
MDkuLmYzODUzMmEwYzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5k
L2xpYmlucHV0XzEuMjguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9s
aWJpbnB1dF8xLjI5LjAuYmIKQEAgLTE1LDcgKzE1LDcgQEAgREVQRU5EUyA9ICJsaWJldmRldiB1
ZGV2IG10ZGV2IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2xpYmlu
cHV0L2xpYmlucHV0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9JHtQVn0gXAog
ICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjRm
N2I0ZWYwZTRlYjVkNTY5ZGYzNmJlMzg3NTc5ODU4ZWJhMzQ5YmIiCitTUkNSRVYgPSAiOTM2Y2Vl
MjI0MjY3YTdkMjFjODdjMDYyMDNjZDg2NmMxNTcyZGYyMCIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVH
RVggPSAibGliaW5wdXQtKD9QPHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQrKSIKIAotLSAKMi40
Ny4xCgo=

--===============0077377910913243687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libinput: SRC_URI changed from "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=1.28.1 file://run-ptest" to "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=1.29.0 file://run-ptest"
packages/core2-64-poky-linux/libinput: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-bin: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-bin: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-dbg: FILELIST: added "/usr/libexec/libinput/.debug/libinput-debug-tablet-pad"
packages/core2-64-poky-linux/libinput/libinput-dbg: RRECOMMENDS: added "systemd-dbg"
packages/core2-64-poky-linux/libinput/libinput-dbg: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 7738000 to 8731992 (+13%)
packages/core2-64-poky-linux/libinput/libinput-dev: RDEPENDS: added "systemd-dev"
packages/core2-64-poky-linux/libinput/libinput-dev: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-dev: RRECOMMENDS: added "systemd-dev"
packages/core2-64-poky-linux/libinput/libinput-dev: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-dev: PKGSIZE changed from 228925 to 236020 (+3%)
packages/core2-64-poky-linux/libinput/libinput-doc: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-doc: FILELIST: added "/usr/share/man/man1/libinput-debug-tablet-pad.1"
packages/core2-64-poky-linux/libinput/libinput-doc: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-doc: PKGSIZE changed from 47709 to 49110 (+3%)
packages/core2-64-poky-linux/libinput/libinput-locale: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-locale: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-ptest: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1156022 to 1188614 (+3%)
packages/core2-64-poky-linux/libinput/libinput-src: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-src: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-staticdev: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput: RDEPENDS: added "libsystemd (['>= 257.6'])"
packages/core2-64-poky-linux/libinput/libinput: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput: FILELIST: added "/usr/libexec/libinput/libinput-debug-tablet-pad"
packages/core2-64-poky-linux/libinput/libinput: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput: PKGSIZE changed from 1437839 to 1645185 (+14%)

--===============0077377910913243687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libinput/libinput-dbg: RRECOMMENDS: added "systemd-dbg"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 7738000 to 8731992 (+13%)
packages/core2-64-poky-linux/libinput/libinput-dev: RRECOMMENDS: added "systemd-dev"
packages/core2-64-poky-linux/libinput/libinput-dev: RDEPENDS: added "systemd-dev"
packages/core2-64-poky-linux/libinput/libinput-doc: FILELIST: added "/usr/share/man/man1/libinput-debug-tablet-pad.1"
packages/core2-64-poky-linux/libinput/libinput: FILELIST: added "/usr/libexec/libinput/libinput-debug-tablet-pad"
packages/core2-64-poky-linux/libinput/libinput: RDEPENDS: added "libsystemd (['>= 257.6'])"
packages/core2-64-poky-linux/libinput/libinput: PKGSIZE changed from 1437839 to 1645185 (+14%)

--===============0077377910913243687==--

