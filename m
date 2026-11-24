Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12520.1795501916127569844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=m0TpySJ+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KfpnKSw0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a20c40fcb8-2d69c731-1f46-45d2-aad5-bea232371eff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795501915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uhmVvwoooWUWnkHUD5yt3Q7YIgHtnQi2xyngEI+OgMM=;
	b=m0TpySJ+RGJJePxI/KIXiuGU7XbegHEZWzh/OMqac4jRAE0zPrkfaeiAU523lsgR
	Ns8aBz6YkWD87RCEL03DVPKYYmek9fsut6MqV1EUD+ELawABAi7vRsy2T9A51emP9pr
	7Cbx9IhcXGYn860ulwZeog5GE1fawuWhaf/wzLKs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795501915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uhmVvwoooWUWnkHUD5yt3Q7YIgHtnQi2xyngEI+OgMM=;
	b=KfpnKSw0eon+l8hb4bVNhpEtzAIzynFGjb9Uf3DJSqThxpqaF+4gtk5rG65cRemf
	9Et+SqmgDtq/Xh7VvfLtRy7JOUl0dPMV1+3KVsjsBsBSKcUj6lwhUjTxeBTYuUocqQs
	2oNud8oygW6N6JwEixG9+4q0Vp4Q7IJTpTSRspBc=
Content-Type: multipart/mixed; boundary="===============6144067878725102693=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Peyman Jahangirlou <peyman.jahangirlou@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmod: upgrading to 34.4 SUCCEEDED
Message-ID: <010101a20c40fcb8-2d69c731-1f46-45d2-aad5-bea232371eff-000000@us-west-2.amazonses.com>
Date: Tue, 24 Nov 2026 06:31:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.24-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250954

--===============6144067878725102693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kmod* to *34.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmod-upgrade-34.3-34.4.patch
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
From 77bf633f87fc123ba50755259d96fcc53a597a07 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 24 Nov 2026 06:25:26 +0000
Subject: [PATCH] kmod: upgrade 34.3 -> 34.4

---
 meta/recipes-kernel/kmod/{kmod_34.3.bb => kmod_34.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/kmod/{kmod_34.3.bb => kmod_34.4.bb} (97%)

diff --git a/meta/recipes-kernel/kmod/kmod_34.3.bb b/meta/recipes-kernel/kmod/kmod_34.4.bb
similarity index 97%
rename from meta/recipes-kernel/kmod/kmod_34.3.bb
rename to meta/recipes-kernel/kmod/kmod_34.4.bb
index 435ab4f47c..e4913a988f 100644
--- a/meta/recipes-kernel/kmod/kmod_34.3.bb
+++ b/meta/recipes-kernel/kmod/kmod_34.4.bb
@@ -18,7 +18,7 @@ inherit bash-completion gtk-doc manpages meson pkgconfig update-alternatives
 SRC_URI = "https://www.kernel.org/pub/linux/utils/kernel/${BPN}/${BP}.tar.xz \
            file://depmod-search.conf \
            "
-SRC_URI[sha256sum] = "985554de49c21a58abd68c6cda2251384e1e5bb08b3b14c7f02b51f4c90c2958"
+SRC_URI[sha256sum] = "4c7942dda4793d08f975270322db582c9701438afd4d76ed9e6e7cf4094cb967"
 
 EXTRA_OEMESON += "\
     -Ddistconfdir=${nonarch_base_libdir} \
-- 
2.47.1


--===============6144067878725102693==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kmod-upgrade-34.3-34.4.patch"

RnJvbSA3N2JmNjMzZjg3ZmMxMjNiYTUwNzU1MjU5ZDk2ZmNjNTNhNTk3YTA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjQgTm92IDIwMjYgMDY6MjU6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
bW9kOiB1cGdyYWRlIDM0LjMgLT4gMzQuNAoKLS0tCiBtZXRhL3JlY2lwZXMta2VybmVsL2ttb2Qv
e2ttb2RfMzQuMy5iYiA9PiBrbW9kXzM0LjQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9r
bW9kL3trbW9kXzM0LjMuYmIgPT4ga21vZF8zNC40LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kXzM0LjMuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVs
L2ttb2Qva21vZF8zNC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1rZXJuZWwva21vZC9rbW9kXzM0LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1r
ZXJuZWwva21vZC9rbW9kXzM0LjQuYmIKaW5kZXggNDM1YWI0ZjQ3Yy4uZTQ5MTNhOTg4ZiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL2ttb2RfMzQuMy5iYgorKysgYi9tZXRh
L3JlY2lwZXMta2VybmVsL2ttb2Qva21vZF8zNC40LmJiCkBAIC0xOCw3ICsxOCw3IEBAIGluaGVy
aXQgYmFzaC1jb21wbGV0aW9uIGd0ay1kb2MgbWFucGFnZXMgbWVzb24gcGtnY29uZmlnIHVwZGF0
ZS1hbHRlcm5hdGl2ZXMKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvbGlu
dXgvdXRpbHMva2VybmVsLyR7QlBOfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8v
ZGVwbW9kLXNlYXJjaC5jb25mIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
Ijk4NTU1NGRlNDljMjFhNThhYmQ2OGM2Y2RhMjI1MTM4NGUxZTViYjA4YjNiMTRjN2YwMmI1MWY0
YzkwYzI5NTgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGM3OTQyZGRhNDc5M2QwOGY5NzUyNzAz
MjJkYjU4MmM5NzAxNDM4YWZkNGQ3NmVkOWU2ZTdjZjQwOTRjYjk2NyIKIAogRVhUUkFfT0VNRVNP
TiArPSAiXAogICAgIC1EZGlzdGNvbmZkaXI9JHtub25hcmNoX2Jhc2VfbGliZGlyfSBcCi0tIAoy
LjQ3LjEKCg==

--===============6144067878725102693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/kmod/kmod-bash-completion: PKGV changed from 34.3 [default] to 34.4 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-bash-completion: PV changed from "34.3" to "34.4"
packages/x86-64-v3-poky-linux/kmod/kmod-dbg: PKGSIZE changed from 1065144 to 1065808 (+0%)
packages/x86-64-v3-poky-linux/kmod/kmod-dbg: PKGV changed from 34.3 [default] to 34.4 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-dbg: PV changed from "34.3" to "34.4"
packages/x86-64-v3-poky-linux/kmod/kmod-dev: PKGV changed from 34.3 [default] to 34.4 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-dev: PV changed from "34.3" to "34.4"
packages/x86-64-v3-poky-linux/kmod/kmod-doc: PKGV changed from 34.3 [default] to 34.4 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-doc: PV changed from "34.3" to "34.4"
packages/x86-64-v3-poky-linux/kmod/kmod-fish-completion: PKGV changed from 34.3 [default] to 34.4 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-fish-completion: PV changed from "34.3" to "34.4"
packages/x86-64-v3-poky-linux/kmod/kmod-locale: PKGV changed from 34.3 [default] to 34.4 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-locale: PV changed from "34.3" to "34.4"
packages/x86-64-v3-poky-linux/kmod/kmod-src: PKGSIZE changed from 405446 to 405847 (+0%)
packages/x86-64-v3-poky-linux/kmod/kmod-src: FILELIST: directory renamed /usr/src/debug/kmod/34.3/libkmod -> /usr/src/debug/kmod/34.4/libkmod, directory renamed /usr/src/debug/kmod/34.3/shared -> /usr/src/debug/kmod/34.4/shared, directory renamed /usr/src/debug/kmod/34.3/tools -> /usr/src/debug/kmod/34.4/tools
packages/x86-64-v3-poky-linux/kmod/kmod-src: PKGV changed from 34.3 [default] to 34.4 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-src: PV changed from "34.3" to "34.4"
packages/x86-64-v3-poky-linux/kmod/kmod-staticdev: PKGV changed from 34.3 [default] to 34.4 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-staticdev: PV changed from "34.3" to "34.4"
packages/x86-64-v3-poky-linux/kmod/kmod-zsh-completion: PKGV changed from 34.3 [default] to 34.4 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-zsh-completion: PV changed from "34.3" to "34.4"
packages/x86-64-v3-poky-linux/kmod/kmod: PKGV changed from 34.3 [default] to 34.4 [default]
packages/x86-64-v3-poky-linux/kmod/kmod: PV changed from "34.3" to "34.4"
packages/x86-64-v3-poky-linux/kmod: PKGV changed from 34.3 [default] to 34.4 [default]
packages/x86-64-v3-poky-linux/kmod: PV changed from "34.3" to "34.4"
packages/x86-64-v3-poky-linux/kmod: SRC_URI changed from "https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-34.3.tar.xz file://depmod-search.conf" to "https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-34.4.tar.xz file://depmod-search.conf"
packages/x86-64-v3-poky-linux/kmod/libkmod: PKGV changed from 34.3 [default] to 34.4 [default]
packages/x86-64-v3-poky-linux/kmod/libkmod: PV changed from "34.3" to "34.4"

--===============6144067878725102693==--
