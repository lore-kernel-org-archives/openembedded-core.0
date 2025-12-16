Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18E7D5E377
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17388.1765872134050108079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=isY47lCL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=lJIhdMhM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262ed969-71b125e3-2373-4db0-badc-0913ed77b968-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Uv+DcXWrxu7AdQJMAFFqYWYjZM6/CfgQWk5fpoEkTyI=;
	b=isY47lCLMdUASjPff1FD8DT5kxrydK3GOuGDsSG3qvA2PIK29HjpRlJ8YKPCjLOd
	0bw8gCqBNRnZBTcKh1C4BvIta+Tm6qu0ulsLXRw0H5rbcKRvWs+6JXwvY5yaMy75Wsa
	3qayvTBYQrJny1D57wEwONTRaHvzn4/qk4xlLuLU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Uv+DcXWrxu7AdQJMAFFqYWYjZM6/CfgQWk5fpoEkTyI=;
	b=lJIhdMhMVn4TdB81DpcmYJV9LKhmZdPWYUuNjsoLMEt0aEh8VOnoMAc5evTL2MN7
	sDK5DGY5DIpDA6KBsefiRV0E4l46ysTWEHxgqsb/Is5zkFzcrlmjCMRmyHJm8WDH0EV
	/rTtkqyxHGKc1JJoKpuoSP6MNgb5STkAOlljCKeI=
Content-Type: multipart/mixed; boundary="===============1688531873343258215=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxkbcommon: upgrading to 1.13.1 SUCCEEDED
Message-ID: <0101019b262ed969-71b125e3-2373-4db0-badc-0913ed77b968-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227887

--===============1688531873343258215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxkbcommon* to *1.13.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxkbcommon-upgrade-1.11.0-1.13.1.patch
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
From f0b9346631ec2f5063a62165b2fc658016b51732 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 05:23:20 +0000
Subject: [PATCH] libxkbcommon: upgrade 1.11.0 -> 1.13.1

---
 .../{libxkbcommon_1.11.0.bb => libxkbcommon_1.13.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.11.0.bb => libxkbcommon_1.13.1.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
index c953058275..42e6458090 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
@@ -7,9 +7,9 @@ LICENSE = "MIT & MIT-open-group & HPND & HPND-sell-variant & X11"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-${PV}"
+SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=releases/v1.13;tag=xkbcommon-${PV}"
 
-SRCREV = "0f9cefb1fedb23433666fa5d9045e48ff030c006"
+SRCREV = "6f76d19db72b5d450e927b41e1e96cbe3252aba8"
 
 inherit meson pkgconfig bash-completion
 
-- 
2.47.1


--===============1688531873343258215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: PKGSIZE changed from 38994 to 51282 (+32%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: FILELIST: removed "/usr/lib/libxkbcommon-x11.so.0.11.0", added "/usr/lib/libxkbcommon-x11.so.0.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: FILELIST: removed "/usr/lib/libxkbcommon.so.0.11.0", added "/usr/lib/libxkbcommon.so.0.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: PKGSIZE changed from 38912 to 43008 (+11%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: FILELIST: removed "/usr/lib/libxkbregistry.so.0.11.0", added "/usr/lib/libxkbregistry.so.0.13.1"
Changes to packages/x86-64-v3-poky-linux/libxkbcommon (sysroot):
  /usr/lib/libxkbcommon.so.0 changed symlink target from libxkbcommon.so.0.11.0 to libxkbcommon.so.0.13.1
  /usr/lib/libxkbcommon-x11.so.0 changed symlink target from libxkbcommon-x11.so.0.11.0 to libxkbcommon-x11.so.0.13.1
  /usr/lib/libxkbregistry.so.0 changed symlink target from libxkbregistry.so.0.11.0 to libxkbregistry.so.0.13.1
  /usr/lib/libxkbcommon.so.0.11.0 moved to /usr/lib/libxkbcommon.so.0.13.1
  /usr/lib/libxkbcommon-x11.so.0.11.0 moved to /usr/lib/libxkbcommon-x11.so.0.13.1
  /usr/lib/libxkbregistry.so.0.11.0 moved to /usr/lib/libxkbregistry.so.0.13.1

--===============1688531873343258215==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxkbcommon-upgrade-1.11.0-1.13.1.patch"

RnJvbSBmMGI5MzQ2NjMxZWMyZjUwNjNhNjIxNjViMmZjNjU4MDE2YjUxNzMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDU6MjM6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4a2Jjb21tb246IHVwZ3JhZGUgMS4xMS4wIC0+IDEuMTMuMQoKLS0tCiAuLi4ve2xpYnhrYmNv
bW1vbl8xLjExLjAuYmIgPT4gbGlieGtiY29tbW9uXzEuMTMuMS5iYn0gICAgICAgIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi97bGlieGtiY29tbW9uXzEuMTEuMC5iYiA9
PiBsaWJ4a2Jjb21tb25fMS4xMy4xLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS4xMS4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNvbW1vbl8xLjEzLjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNv
bW1vbl8xLjExLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4a2Jjb21tb25fMS4xMy4xLmJiCmluZGV4IGM5NTMwNTgyNzUuLjQyZTY0NTgwOTAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS4xMS4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS4x
My4xLmJiCkBAIC03LDkgKzcsOSBAQCBMSUNFTlNFID0gIk1JVCAmIE1JVC1vcGVuLWdyb3VwICYg
SFBORCAmIEhQTkQtc2VsbC12YXJpYW50ICYgWDExIgogCiBERVBFTkRTID0gImZsZXgtbmF0aXZl
IGJpc29uLW5hdGl2ZSIKIAotU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3hrYmNvbW1vbi9s
aWJ4a2Jjb21tb247cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9eGtiY29tbW9uLSR7
UFZ9IgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3hrYmNvbW1vbi9saWJ4a2Jjb21tb247
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPXJlbGVhc2VzL3YxLjEzO3RhZz14a2Jjb21tb24tJHtQVn0i
CiAKLVNSQ1JFViA9ICIwZjljZWZiMWZlZGIyMzQzMzY2NmZhNWQ5MDQ1ZTQ4ZmYwMzBjMDA2Igor
U1JDUkVWID0gIjZmNzZkMTlkYjcyYjVkNDUwZTkyN2I0MWUxZTk2Y2JlMzI1MmFiYTgiCiAKIGlu
aGVyaXQgbWVzb24gcGtnY29uZmlnIGJhc2gtY29tcGxldGlvbgogCi0tIAoyLjQ3LjEKCg==

--===============1688531873343258215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxkbcommon: PV changed from "1.11.0" to "1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon: PKGV changed from 1.11.0 [default] to 1.13.1 [default]
packages/x86-64-v3-poky-linux/libxkbcommon: SRC_URI changed from "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-1.11.0" to "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=releases/v1.13;tag=xkbcommon-1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-bash-completion: PV changed from "1.11.0" to "1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-bash-completion: PKGV changed from 1.11.0 [default] to 1.13.1 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dbg: PV changed from "1.11.0" to "1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGV changed from 1.11.0 [default] to 1.13.1 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGSIZE changed from 2183904 to 2312144 (+6%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dbg: FILELIST: removed "/usr/lib/.debug/libxkbregistry.so.0.11.0 /usr/lib/.debug/libxkbcommon-x11.so.0.11.0 /usr/lib/.debug/libxkbcommon.so.0.11.0", added "/usr/lib/.debug/libxkbregistry.so.0.13.1 /usr/lib/.debug/libxkbcommon-x11.so.0.13.1 /usr/lib/.debug/libxkbcommon.so.0.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dev: PV changed from "1.11.0" to "1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dev: PKGV changed from 1.11.0 [default] to 1.13.1 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dev: PKGSIZE changed from 401197 to 411390 (+3%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-doc: PV changed from "1.11.0" to "1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-doc: PKGV changed from 1.11.0 [default] to 1.13.1 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-doc: PKGSIZE changed from 16083 to 16563 (+3%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-locale: PV changed from "1.11.0" to "1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-locale: PKGV changed from 1.11.0 [default] to 1.13.1 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-src: PV changed from "1.11.0" to "1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-src: PKGV changed from 1.11.0 [default] to 1.13.1 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-src: PKGSIZE changed from 1973924 to 2068294 (+5%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-src: FILELIST: directory renamed /usr/src/debug/libxkbcommon/1.11.0/tools -> /usr/src/debug/libxkbcommon/1.13.1/tools, directory renamed /usr/src/debug/libxkbcommon/1.11.0/src/xkbcomp -> /usr/src/debug/libxkbcommon/1.13.1/src/xkbcomp, directory renamed /usr/src/debug/libxkbcommon/1.11.0/xkbcli-interactive-wayland.p -> /usr/src/debug/libxkbcommon/1.13.1/xkbcli-interactive-wayland.p, directory renamed /usr/src/debug/libxkbcommon/1.11.0/src/compose -> /usr/src/debug/libxkbcommon/1.13.1/src/compose, directory renamed /usr/src/debug/libxkbcommon/1.11.0/src/x11 -> /usr/src/debug/libxkbcommon/1.13.1/src/x11, directory renamed /usr/src/debug/libxkbcommon/1.11.0/include/xkbcommon -> /usr/src/debug/libxkbcommon/1.13.1/include/xkbcommon, directory renamed /usr/src/debug/libxkbcommon/1.11.0/xkbcli-dump-keymap-wayland.p -> /usr/src/debug/libxkbcommon/1.13.1/xkbcli-dump-keymap-wayland.p, directory renamed /usr/src/debug/libxkbcommon/1.11.0/li
 bxkbcommon.so.0.11.0.p -> /usr/src/debug/libxkbcommon/1.13.1/libxkbcommon.so.0.13.1.p, removed "/usr/src/debug/libxkbcommon/1.11.0/src/utf8-decoding.h /usr/src/debug/libxkbcommon/1.11.0/src/scanner-utils.h /usr/src/debug/libxkbcommon/1.11.0/src/rmlvo.c /usr/src/debug/libxkbcommon/1.11.0/src/context.c /usr/src/debug/libxkbcommon/1.11.0/src/scanner-utils.c /usr/src/debug/libxkbcommon/1.11.0/src/utf8-decoding.c /usr/src/debug/libxkbcommon/1.11.0/src/context.h /usr/src/debug/libxkbcommon/1.11.0/src/rmlvo.h /usr/src/debug/libxkbcommon/1.11.0/src/keysym.h /usr/src/debug/libxkbcommon/1.11.0/src/utils-numbers.h /usr/src/debug/libxkbcommon/1.11.0/src/context-priv.c /usr/src/debug/libxkbcommon/1.11.0/src/darray.h /usr/src/debug/libxkbcommon/1.11.0/src/keysym.c /usr/src/debug/libxkbcommon/1.11.0/src/atom.c /usr/src/debug/libxkbcommon/1.11.0/src/keysym-utf.c /usr/src/debug/libxkbcommon/1.11.0/src/atom.h /usr/src/debug/libxkbcommon/1.11.0/src/keymap.h /usr/src/debug/libxkbcommon/1.11.0/src/util-
 list.c /usr/src/debug/libxkbcommon/1.11.0/src/utf8.h /usr/src/debug/libxkbcommon/1.11.0/src/keymap.c /usr/src/debug/libxkbcommon/1.11.0/src/utils-paths.h /usr/src/debug/libxkbcommon/1.11.0/src/utf8.c /usr/src/debug/libxkbcommon/1.11.0/src/utils-paths.c /usr/src/debug/libxkbcommon/1.11.0/src/util-list.h /usr/src/debug/libxkbcommon/1.11.0/src/text.c /usr/src/debug/libxkbcommon/1.11.0/src/keymap-formats.c /usr/src/debug/libxkbcommon/1.11.0/src/utils.h /usr/src/debug/libxkbcommon/1.11.0/src/text.h /usr/src/debug/libxkbcommon/1.11.0/src/ks_tables.h /usr/src/debug/libxkbcommon/1.11.0/src/keymap-formats.h /usr/src/debug/libxkbcommon/1.11.0/src/utils.c /usr/src/debug/libxkbcommon/1.11.0/src/util-mem.h /usr/src/debug/libxkbcommon/1.11.0/src/registry.c /usr/src/debug/libxkbcommon/1.11.0/src/keysym-case-mappings.c /usr/src/debug/libxkbcommon/1.11.0/src/messages-codes.h /usr/src/debug/libxkbcommon/1.11.0/src/keymap-priv.c /usr/src/debug/libxkbcommon/1.11.0/src/state.c", added "/usr/src/debug/li
 bxkbcommon/1.13.1/src/utf8-decoding.h /usr/src/debug/libxkbcommon/1.13.1/src/scanner-utils.h /usr/src/debug/libxkbcommon/1.13.1/src/rmlvo.c /usr/src/debug/libxkbcommon/1.13.1/src/context.c /usr/src/debug/libxkbcommon/1.13.1/src/scanner-utils.c /usr/src/debug/libxkbcommon/1.13.1/src/utf8-decoding.c /usr/src/debug/libxkbcommon/1.13.1/src/context.h /usr/src/debug/libxkbcommon/1.13.1/src/rmlvo.h /usr/src/debug/libxkbcommon/1.13.1/src/keysym.h /usr/src/debug/libxkbcommon/1.13.1/src/utils-numbers.h /usr/src/debug/libxkbcommon/1.13.1/src/context-priv.c /usr/src/debug/libxkbcommon/1.13.1/src/darray.h /usr/src/debug/libxkbcommon/1.13.1/src/keysym.c /usr/src/debug/libxkbcommon/1.13.1/src/atom.c /usr/src/debug/libxkbcommon/1.13.1/src/keysym-utf.c /usr/src/debug/libxkbcommon/1.13.1/src/atom.h /usr/src/debug/libxkbcommon/1.13.1/src/keymap-priv.c /usr/src/debug/libxkbcommon/1.13.1/src/keymap.h /usr/src/debug/libxkbcommon/1.13.1/src/util-list.c /usr/src/debug/libxkbcommon/1.13.1/src/utf8.h /usr/sr
 c/debug/libxkbcommon/1.13.1/src/keymap.c /usr/src/debug/libxkbcommon/1.13.1/src/utils-paths.h /usr/src/debug/libxkbcommon/1.13.1/src/utf8.c /usr/src/debug/libxkbcommon/1.13.1/src/utils-paths.c /usr/src/debug/libxkbcommon/1.13.1/src/util-list.h /usr/src/debug/libxkbcommon/1.13.1/src/text.c /usr/src/debug/libxkbcommon/1.13.1/src/keymap-formats.c /usr/src/debug/libxkbcommon/1.13.1/src/utils.h /usr/src/debug/libxkbcommon/1.13.1/src/text.h /usr/src/debug/libxkbcommon/1.13.1/src/ks_tables.h /usr/src/debug/libxkbcommon/1.13.1/src/keymap-formats.h /usr/src/debug/libxkbcommon/1.13.1/src/utils.c /usr/src/debug/libxkbcommon/1.13.1/src/keymap-compare.h /usr/src/debug/libxkbcommon/1.13.1/src/util-mem.h /usr/src/debug/libxkbcommon/1.13.1/src/registry.c /usr/src/debug/libxkbcommon/1.13.1/src/keysym-case-mappings.c /usr/src/debug/libxkbcommon/1.13.1/src/keymap-compare.c /usr/src/debug/libxkbcommon/1.13.1/src/messages-codes.h /usr/src/debug/libxkbcommon/1.13.1/src/state.c"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-staticdev: PV changed from "1.11.0" to "1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-staticdev: PKGV changed from 1.11.0 [default] to 1.13.1 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: PV changed from "1.11.0" to "1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: PKGV changed from 1.11.0 [default] to 1.13.1 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: PKGSIZE changed from 38994 to 51282 (+32%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: FILES: removed "/usr/lib/libxkbcommon-x11.so.0.11.0", added "/usr/lib/libxkbcommon-x11.so.0.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: FILELIST: removed "/usr/lib/libxkbcommon-x11.so.0.11.0", added "/usr/lib/libxkbcommon-x11.so.0.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: PV changed from "1.11.0" to "1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: PKGV changed from 1.11.0 [default] to 1.13.1 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: PKGSIZE changed from 370902 to 391382 (+6%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: FILES: removed "/usr/lib/libxkbcommon.so.0.11.0", added "/usr/lib/libxkbcommon.so.0.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: FILELIST: removed "/usr/lib/libxkbcommon.so.0.11.0", added "/usr/lib/libxkbcommon.so.0.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: PV changed from "1.11.0" to "1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: PKGV changed from 1.11.0 [default] to 1.13.1 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: PKGSIZE changed from 38912 to 43008 (+11%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: FILES: removed "/usr/lib/libxkbregistry.so.0.11.0", added "/usr/lib/libxkbregistry.so.0.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: FILELIST: removed "/usr/lib/libxkbregistry.so.0.11.0", added "/usr/lib/libxkbregistry.so.0.13.1"
Changes to packages/x86-64-v3-poky-linux/libxkbcommon (sysroot):
  /usr/lib/libxkbcommon.so.0 changed symlink target from libxkbcommon.so.0.11.0 to libxkbcommon.so.0.13.1
  /usr/lib/libxkbcommon-x11.so.0 changed symlink target from libxkbcommon-x11.so.0.11.0 to libxkbcommon-x11.so.0.13.1
  /usr/lib/libxkbregistry.so.0 changed symlink target from libxkbregistry.so.0.11.0 to libxkbregistry.so.0.13.1
  /usr/lib/libxkbcommon.so.0.11.0 moved to /usr/lib/libxkbcommon.so.0.13.1
  /usr/lib/libxkbcommon-x11.so.0.11.0 moved to /usr/lib/libxkbcommon-x11.so.0.13.1
  /usr/lib/libxkbregistry.so.0.11.0 moved to /usr/lib/libxkbregistry.so.0.13.1
packages/x86-64-v3-poky-linux/libxkbcommon/xkbcli: PV changed from "1.11.0" to "1.13.1"
packages/x86-64-v3-poky-linux/libxkbcommon/xkbcli: PKGV changed from 1.11.0 [default] to 1.13.1 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/xkbcli: PKGSIZE changed from 414704 to 414928 (+0%)

--===============1688531873343258215==--

