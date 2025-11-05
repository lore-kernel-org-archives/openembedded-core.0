Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF09CD343B
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:35 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2357.1762384577815006049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=h+il5kg/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WAhquuk1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a564ea0a2-4c03080c-9895-45e1-b377-92056b3e7445-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384585;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iDrPRLbOOTfUFGLXtPkCewYN/TJ09mqQeBoabHbOZmE=;
	b=h+il5kg/uU/mFrfogBEjnFIQ8aDd85/A9MyfzLGgNgEvzWNPek+fi73EbsJ1GYX8
	4gxI+b715gnzCj/hQRBeYATu8+pgWXslUqKTQ/o2yuazGP0ASP4aPd1GNLEz4xxdZ1Y
	s76dJOwj5El2iZeWUBPylQfvQlv3TComr+xGs5F8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384585;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iDrPRLbOOTfUFGLXtPkCewYN/TJ09mqQeBoabHbOZmE=;
	b=WAhquuk1xhsNUMyUVUQZYQ4OQDgvuufR3lA83ZmQIloC3p63zMCaS4ySr3UpuQLw
	B089jn4fGdqBZPXjtNFnZHl/Ty2h6NxZUNlRYdKlfKsOWtmcHFjQKKNP6tbuP92ZMWU
	MPK1hXfniig4DvOlxxmxxql81yxRF9J9zQDtrCqE=
Content-Type: multipart/mixed; boundary="===============5742322912295143071=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-maturin: upgrading to 1.9.6 SUCCEEDED
Message-ID: <0101019a564ea0a2-4c03080c-9895-45e1-b377-92056b3e7445-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225831

--===============5742322912295143071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-maturin* to *1.9.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-maturin-upgrade-1.9.4-1.9.6.patch
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
From caee15b99d0823a48291631b801e6f3b3470de6f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 17:15:37 +0000
Subject: [PATCH] python3-maturin: upgrade 1.9.4 -> 1.9.6

---
 .../python/python3-maturin-crates.inc         | 42 +++++++++++++------
 ...urin_1.9.4.bb => python3-maturin_1.9.6.bb} |  2 +-
 2 files changed, 31 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.9.4.bb => python3-maturin_1.9.6.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 28551ff4ca..ab49a8e5ba 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -53,6 +53,7 @@ SRC_URI += " \
     crate://crates.io/colorchoice/1.0.1 \
     crate://crates.io/configparser/3.1.0 \
     crate://crates.io/console/0.15.8 \
+    crate://crates.io/console/0.16.0 \
     crate://crates.io/content_inspector/0.2.4 \
     crate://crates.io/core-foundation/0.9.4 \
     crate://crates.io/core-foundation-sys/0.8.6 \
@@ -79,6 +80,7 @@ SRC_URI += " \
     crate://crates.io/dyn-clone/1.0.17 \
     crate://crates.io/either/1.13.0 \
     crate://crates.io/encode_unicode/0.3.6 \
+    crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/encoding_rs/0.8.34 \
     crate://crates.io/equivalent/1.0.1 \
     crate://crates.io/errno/0.3.9 \
@@ -154,7 +156,7 @@ SRC_URI += " \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/lzxd/0.2.5 \
     crate://crates.io/mailparse/0.15.0 \
-    crate://crates.io/matchers/0.1.0 \
+    crate://crates.io/matchers/0.2.0 \
     crate://crates.io/memchr/2.7.4 \
     crate://crates.io/mimalloc/0.1.43 \
     crate://crates.io/mime/0.3.17 \
@@ -168,7 +170,7 @@ SRC_URI += " \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/normalize-line-endings/0.3.0 \
     crate://crates.io/normpath/1.2.0 \
-    crate://crates.io/nu-ansi-term/0.46.0 \
+    crate://crates.io/nu-ansi-term/0.50.1 \
     crate://crates.io/num-conv/0.1.0 \
     crate://crates.io/number_prefix/0.4.0 \
     crate://crates.io/once_cell/1.20.2 \
@@ -178,7 +180,6 @@ SRC_URI += " \
     crate://crates.io/openssl-sys/0.9.107 \
     crate://crates.io/option-ext/0.2.0 \
     crate://crates.io/os_pipe/1.2.0 \
-    crate://crates.io/overload/0.1.1 \
     crate://crates.io/parking_lot/0.12.3 \
     crate://crates.io/parking_lot_core/0.9.10 \
     crate://crates.io/paste/1.0.15 \
@@ -212,9 +213,7 @@ SRC_URI += " \
     crate://crates.io/redox_syscall/0.5.1 \
     crate://crates.io/redox_users/0.4.5 \
     crate://crates.io/regex/1.11.1 \
-    crate://crates.io/regex-automata/0.1.10 \
     crate://crates.io/regex-automata/0.4.9 \
-    crate://crates.io/regex-syntax/0.6.29 \
     crate://crates.io/regex-syntax/0.8.5 \
     crate://crates.io/relative-path/1.9.3 \
     crate://crates.io/rfc2047-decoder/1.0.6 \
@@ -289,7 +288,7 @@ SRC_URI += " \
     crate://crates.io/tracing-core/0.1.33 \
     crate://crates.io/tracing-log/0.2.0 \
     crate://crates.io/tracing-serde/0.2.0 \
-    crate://crates.io/tracing-subscriber/0.3.19 \
+    crate://crates.io/tracing-subscriber/0.3.20 \
     crate://crates.io/trycmd/0.15.6 \
     crate://crates.io/twox-hash/1.6.3 \
     crate://crates.io/typenum/1.17.0 \
@@ -332,23 +331,33 @@ SRC_URI += " \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
     crate://crates.io/windows-sys/0.48.0 \
     crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-targets/0.48.5 \
     crate://crates.io/windows-targets/0.52.5 \
+    crate://crates.io/windows-targets/0.53.2 \
     crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.53.0 \
     crate://crates.io/windows_aarch64_msvc/0.48.5 \
     crate://crates.io/windows_aarch64_msvc/0.52.5 \
+    crate://crates.io/windows_aarch64_msvc/0.53.0 \
     crate://crates.io/windows_i686_gnu/0.48.5 \
     crate://crates.io/windows_i686_gnu/0.52.5 \
+    crate://crates.io/windows_i686_gnu/0.53.0 \
     crate://crates.io/windows_i686_gnullvm/0.52.5 \
+    crate://crates.io/windows_i686_gnullvm/0.53.0 \
     crate://crates.io/windows_i686_msvc/0.48.5 \
     crate://crates.io/windows_i686_msvc/0.52.5 \
+    crate://crates.io/windows_i686_msvc/0.53.0 \
     crate://crates.io/windows_x86_64_gnu/0.48.5 \
     crate://crates.io/windows_x86_64_gnu/0.52.5 \
+    crate://crates.io/windows_x86_64_gnu/0.53.0 \
     crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
     crate://crates.io/windows_x86_64_gnullvm/0.52.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.53.0 \
     crate://crates.io/windows_x86_64_msvc/0.48.5 \
     crate://crates.io/windows_x86_64_msvc/0.52.5 \
+    crate://crates.io/windows_x86_64_msvc/0.53.0 \
     crate://crates.io/winnow/0.5.40 \
     crate://crates.io/winnow/0.6.20 \
     crate://crates.io/winsafe/0.0.19 \
@@ -426,6 +435,7 @@ SRC_URI[cli-table-0.4.7.sha256sum] = "adfbb116d9e2c4be7011360d0c0bee565712c11e96
 SRC_URI[colorchoice-1.0.1.sha256sum] = "0b6a852b24ab71dffc585bcb46eaf7959d175cb865a7152e35b348d1b2960422"
 SRC_URI[configparser-3.1.0.sha256sum] = "e57e3272f0190c3f1584272d613719ba5fc7df7f4942fe542e63d949cf3a649b"
 SRC_URI[console-0.15.8.sha256sum] = "0e1f83fc076bd6dd27517eacdf25fef6c4dfe5f1d7448bafaaf3a26f13b5e4eb"
+SRC_URI[console-0.16.0.sha256sum] = "2e09ced7ebbccb63b4c65413d821f2e00ce54c5ca4514ddc6b3c892fdbcbc69d"
 SRC_URI[content_inspector-0.2.4.sha256sum] = "b7bda66e858c683005a53a9a60c69a4aca7eeaa45d124526e389f7aec8e62f38"
 SRC_URI[core-foundation-0.9.4.sha256sum] = "91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f"
 SRC_URI[core-foundation-sys-0.8.6.sha256sum] = "06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f"
@@ -452,6 +462,7 @@ SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f
 SRC_URI[dyn-clone-1.0.17.sha256sum] = "0d6ef0072f8a535281e4876be788938b528e9a1d43900b82c2569af7da799125"
 SRC_URI[either-1.13.0.sha256sum] = "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
 SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
+SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[encoding_rs-0.8.34.sha256sum] = "b45de904aa0b010bce2ab45264d0631681847fa7b6f2eaa7dab7619943bc4f59"
 SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
 SRC_URI[errno-0.3.9.sha256sum] = "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba"
@@ -527,7 +538,7 @@ SRC_URI[lzma-rs-0.3.0.sha256sum] = "297e814c836ae64db86b36cf2a557ba54368d03f6afc
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[lzxd-0.2.5.sha256sum] = "5de7336a183103429ad66d11d56d8bdc9c4a2916f6b85a8f11e5b127bde12001"
 SRC_URI[mailparse-0.15.0.sha256sum] = "3da03d5980411a724e8aaf7b61a7b5e386ec55a7fb49ee3d0ff79efc7e5e7c7e"
-SRC_URI[matchers-0.1.0.sha256sum] = "8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558"
+SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
 SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
 SRC_URI[mimalloc-0.1.43.sha256sum] = "68914350ae34959d83f732418d51e2427a794055d0b9529f48259ac07af65633"
 SRC_URI[mime-0.3.17.sha256sum] = "6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a"
@@ -541,7 +552,7 @@ SRC_URI[native-tls-0.2.12.sha256sum] = "a8614eb2c83d59d1c8cc974dd3f920198647674a
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
 SRC_URI[normpath-1.2.0.sha256sum] = "5831952a9476f2fed74b77d74182fa5ddc4d21c72ec45a333b250e3ed0272804"
-SRC_URI[nu-ansi-term-0.46.0.sha256sum] = "77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84"
+SRC_URI[nu-ansi-term-0.50.1.sha256sum] = "d4a28e057d01f97e61255210fcff094d74ed0466038633e95017f5beb68e4399"
 SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
 SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
@@ -551,7 +562,6 @@ SRC_URI[openssl-probe-0.1.5.sha256sum] = "ff011a302c396a5197692431fc1948019154af
 SRC_URI[openssl-sys-0.9.107.sha256sum] = "8288979acd84749c744a9014b4382d42b8f7b2592847b5afb2ed29e5d16ede07"
 SRC_URI[option-ext-0.2.0.sha256sum] = "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
 SRC_URI[os_pipe-1.2.0.sha256sum] = "29d73ba8daf8fac13b0501d1abeddcfe21ba7401ada61a819144b6c2a4f32209"
-SRC_URI[overload-0.1.1.sha256sum] = "b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39"
 SRC_URI[parking_lot-0.12.3.sha256sum] = "f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27"
 SRC_URI[parking_lot_core-0.9.10.sha256sum] = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
 SRC_URI[paste-1.0.15.sha256sum] = "57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a"
@@ -585,9 +595,7 @@ SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e
 SRC_URI[redox_syscall-0.5.1.sha256sum] = "469052894dcb553421e483e4209ee581a45100d31b4018de03e5a7ad86374a7e"
 SRC_URI[redox_users-0.4.5.sha256sum] = "bd283d9651eeda4b2a83a43c1c91b266c40fd76ecd39a50a8c630ae69dc72891"
 SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
-SRC_URI[regex-automata-0.1.10.sha256sum] = "6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132"
 SRC_URI[regex-automata-0.4.9.sha256sum] = "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
-SRC_URI[regex-syntax-0.6.29.sha256sum] = "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
 SRC_URI[relative-path-1.9.3.sha256sum] = "ba39f3699c378cd8970968dcbff9c43159ea4cfbd88d43c00b22f2ef10a435d2"
 SRC_URI[rfc2047-decoder-1.0.6.sha256sum] = "bc36545d1021456a751b573517cb52e8c339b2f662e6b2778ef629282678de29"
@@ -662,7 +670,7 @@ SRC_URI[tracing-attributes-0.1.28.sha256sum] = "395ae124c09f9e6918a2310af6038fba
 SRC_URI[tracing-core-0.1.33.sha256sum] = "e672c95779cf947c5311f83787af4fa8fffd12fb27e4993211a84bdfd9610f9c"
 SRC_URI[tracing-log-0.2.0.sha256sum] = "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
 SRC_URI[tracing-serde-0.2.0.sha256sum] = "704b1aeb7be0d0a84fc9828cae51dab5970fee5088f83d1dd7ee6f6246fc6ff1"
-SRC_URI[tracing-subscriber-0.3.19.sha256sum] = "e8189decb5ac0fa7bc8b96b7cb9b2701d60d48805aca84a238004d665fcc4008"
+SRC_URI[tracing-subscriber-0.3.20.sha256sum] = "2054a14f5307d601f88daf0553e1cbf472acc4f2c51afab632431cdcd72124d5"
 SRC_URI[trycmd-0.15.6.sha256sum] = "3e8673f1dc45acdff8e25a06cc62f8e529563e8acd84237ce83d5a28e2befa12"
 SRC_URI[twox-hash-1.6.3.sha256sum] = "97fee6b57c6a41524a810daee9286c02d7752c4253064d0b05472833a438f675"
 SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
@@ -705,23 +713,33 @@ SRC_URI[winapi-util-0.1.8.sha256sum] = "4d4cc384e1e73b93bafa6fb4f1df8c41695c8a91
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
 SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
 SRC_URI[windows-targets-0.52.5.sha256sum] = "6f0713a46559409d202e70e28227288446bf7841d3211583a4b53e3f6d96e7eb"
+SRC_URI[windows-targets-0.53.2.sha256sum] = "c66f69fcc9ce11da9966ddb31a40968cad001c5bedeb5c2b82ede4253ab48aef"
 SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
 SRC_URI[windows_aarch64_gnullvm-0.52.5.sha256sum] = "7088eed71e8b8dda258ecc8bac5fb1153c5cffaf2578fc8ff5d61e23578d3263"
+SRC_URI[windows_aarch64_gnullvm-0.53.0.sha256sum] = "86b8d5f90ddd19cb4a147a5fa63ca848db3df085e25fee3cc10b39b6eebae764"
 SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
 SRC_URI[windows_aarch64_msvc-0.52.5.sha256sum] = "9985fd1504e250c615ca5f281c3f7a6da76213ebd5ccc9561496568a2752afb6"
+SRC_URI[windows_aarch64_msvc-0.53.0.sha256sum] = "c7651a1f62a11b8cbd5e0d42526e55f2c99886c77e007179efff86c2b137e66c"
 SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
 SRC_URI[windows_i686_gnu-0.52.5.sha256sum] = "88ba073cf16d5372720ec942a8ccbf61626074c6d4dd2e745299726ce8b89670"
+SRC_URI[windows_i686_gnu-0.53.0.sha256sum] = "c1dc67659d35f387f5f6c479dc4e28f1d4bb90ddd1a5d3da2e5d97b42d6272c3"
 SRC_URI[windows_i686_gnullvm-0.52.5.sha256sum] = "87f4261229030a858f36b459e748ae97545d6f1ec60e5e0d6a3d32e0dc232ee9"
+SRC_URI[windows_i686_gnullvm-0.53.0.sha256sum] = "9ce6ccbdedbf6d6354471319e781c0dfef054c81fbc7cf83f338a4296c0cae11"
 SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
 SRC_URI[windows_i686_msvc-0.52.5.sha256sum] = "db3c2bf3d13d5b658be73463284eaf12830ac9a26a90c717b7f771dfe97487bf"
+SRC_URI[windows_i686_msvc-0.53.0.sha256sum] = "581fee95406bb13382d2f65cd4a908ca7b1e4c2f1917f143ba16efe98a589b5d"
 SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
 SRC_URI[windows_x86_64_gnu-0.52.5.sha256sum] = "4e4246f76bdeff09eb48875a0fd3e2af6aada79d409d33011886d3e1581517d9"
+SRC_URI[windows_x86_64_gnu-0.53.0.sha256sum] = "2e55b5ac9ea33f2fc1716d1742db15574fd6fc8dadc51caab1c16a3d3b4190ba"
 SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
 SRC_URI[windows_x86_64_gnullvm-0.52.5.sha256sum] = "852298e482cd67c356ddd9570386e2862b5673c85bd5f88df9ab6802b334c596"
+SRC_URI[windows_x86_64_gnullvm-0.53.0.sha256sum] = "0a6e035dd0599267ce1ee132e51c27dd29437f63325753051e71dd9e42406c57"
 SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
 SRC_URI[windows_x86_64_msvc-0.52.5.sha256sum] = "bec47e5bfd1bff0eeaf6d8b485cc1074891a197ab4225d504cb7a1ab88b02bf0"
+SRC_URI[windows_x86_64_msvc-0.53.0.sha256sum] = "271414315aff87387382ec3d271b52d7ae78726f5d44ac98b4f4030c91880486"
 SRC_URI[winnow-0.5.40.sha256sum] = "f593a95398737aeed53e489c785df13f3618e41dbcd6718c6addbf1395aa6876"
 SRC_URI[winnow-0.6.20.sha256sum] = "36c1fec1a2bb5866f07c25f68c26e565c4c200aebb96d7e55710c19d3e8ac49b"
 SRC_URI[winsafe-0.0.19.sha256sum] = "d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.9.4.bb b/meta/recipes-devtools/python/python3-maturin_1.9.6.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.9.4.bb
rename to meta/recipes-devtools/python/python3-maturin_1.9.6.bb
index f47c8061bb..8097c55032 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.9.4.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.9.6.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "235163a0c99bc6f380fb8786c04fd14dcf6cd622ff295ea3de525015e6ac40cf"
+SRC_URI[sha256sum] = "2c2ae37144811d365509889ed7220b0598487f1278c2441829c3abf56cc6324a"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.47.1


--===============5742322912295143071==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-maturin-upgrade-1.9.4-1.9.6.patch"

RnJvbSBjYWVlMTViOTlkMDgyM2E0ODI5MTYzMWI4MDFlNmYzYjM0NzBkZTZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNzoxNTozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWF0dXJpbjogdXBncmFkZSAxLjkuNCAtPiAxLjkuNgoKLS0tCiAuLi4vcHl0aG9uL3B5
dGhvbjMtbWF0dXJpbi1jcmF0ZXMuaW5jICAgICAgICAgfCA0MiArKysrKysrKysrKysrLS0tLS0t
CiAuLi51cmluXzEuOS40LmJiID0+IHB5dGhvbjMtbWF0dXJpbl8xLjkuNi5iYn0gfCAgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1hdHVyaW5fMS45LjQuYmIg
PT4gcHl0aG9uMy1tYXR1cmluXzEuOS42LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluLWNyYXRlcy5pbmMgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMuaW5jCmluZGV4IDI4
NTUxZmY0Y2EuLmFiNDlhOGU1YmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYXR1cmluLWNyYXRlcy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW4tY3JhdGVzLmluYwpAQCAtNTMsNiArNTMsNyBAQCBT
UkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvbG9yY2hvaWNlLzEuMC4xIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9jb25maWdwYXJzZXIvMy4xLjAgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2NvbnNvbGUvMC4xNS44IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9jb25zb2xl
LzAuMTYuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29udGVudF9pbnNwZWN0b3IvMC4yLjQg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvcmUtZm91bmRhdGlvbi8wLjkuNCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vY29yZS1mb3VuZGF0aW9uLXN5cy8wLjguNiBcCkBAIC03OSw2ICs4MCw3
IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZHluLWNsb25lLzEuMC4x
NyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZWl0aGVyLzEuMTMuMCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vZW5jb2RlX3VuaWNvZGUvMC4zLjYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Vu
Y29kZV91bmljb2RlLzEuMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9lbmNvZGluZ19ycy8w
LjguMzQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VxdWl2YWxlbnQvMS4wLjEgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2Vycm5vLzAuMy45IFwKQEAgLTE1NCw3ICsxNTYsNyBAQCBTUkNfVVJJ
ICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2x6bWEtc3lzLzAuMS4yMCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vbHp4ZC8wLjIuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWFpbHBh
cnNlLzAuMTUuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWF0Y2hlcnMvMC4xLjAgXAorICAg
IGNyYXRlOi8vY3JhdGVzLmlvL21hdGNoZXJzLzAuMi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9tZW1jaHIvMi43LjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21pbWFsbG9jLzAuMS40MyBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWltZS8wLjMuMTcgXApAQCAtMTY4LDcgKzE3MCw3IEBA
IFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbm9tLzcuMS4zIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9ub3JtYWxpemUtbGluZS1lbmRpbmdzLzAuMy4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9ub3JtcGF0aC8xLjIuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbnUt
YW5zaS10ZXJtLzAuNDYuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbnUtYW5zaS10ZXJtLzAu
NTAuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbnVtLWNvbnYvMC4xLjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL251bWJlcl9wcmVmaXgvMC40LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L29uY2VfY2VsbC8xLjIwLjIgXApAQCAtMTc4LDcgKzE4MCw2IEBAIFNSQ19VUkkgKz0gIiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC1zeXMvMC45LjEwNyBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vb3B0aW9uLWV4dC8wLjIuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3NfcGlw
ZS8xLjIuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3ZlcmxvYWQvMC4xLjEgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3BhcmtpbmdfbG90LzAuMTIuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcGFya2luZ19sb3RfY29yZS8wLjkuMTAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Bhc3Rl
LzEuMC4xNSBcCkBAIC0yMTIsOSArMjEzLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9yZWRveF9zeXNjYWxsLzAuNS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9y
ZWRveF91c2Vycy8wLjQuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVnZXgvMS4xMS4xIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdleC1hdXRvbWF0YS8wLjEuMTAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3JlZ2V4LWF1dG9tYXRhLzAuNC45IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5p
by9yZWdleC1zeW50YXgvMC42LjI5IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdleC1zeW50
YXgvMC44LjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlbGF0aXZlLXBhdGgvMS45LjMgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JmYzIwNDctZGVjb2Rlci8xLjAuNiBcCkBAIC0yODksNyAr
Mjg4LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLWNv
cmUvMC4xLjMzIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLWxvZy8wLjIuMCBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJhY2luZy1zZXJkZS8wLjIuMCBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdHJhY2luZy1zdWJzY3JpYmVyLzAuMy4xOSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdHJhY2luZy1zdWJzY3JpYmVyLzAuMy4yMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJ5
Y21kLzAuMTUuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHdveC1oYXNoLzEuNi4zIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby90eXBlbnVtLzEuMTcuMCBcCkBAIC0zMzIsMjMgKzMzMSwzMyBA
QCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmFwaS14ODZfNjQtcGMt
d2luZG93cy1nbnUvMC40LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3Mtc3lzLzAu
NDguMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93cy1zeXMvMC41Mi4wIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby93aW5kb3dzLXN5cy8wLjYwLjIgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dpbmRvd3MtdGFyZ2V0cy8wLjQ4LjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRv
d3MtdGFyZ2V0cy8wLjUyLjUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3MtdGFyZ2V0
cy8wLjUzLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfYWFyY2g2NF9nbnVsbHZt
LzAuNDguNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19hYXJjaDY0X2dudWxsdm0v
MC41Mi41IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2FhcmNoNjRfZ251bGx2bS8w
LjUzLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfYWFyY2g2NF9tc3ZjLzAuNDgu
NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19hYXJjaDY0X21zdmMvMC41Mi41IFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2FhcmNoNjRfbXN2Yy8wLjUzLjAgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4Nl9nbnUvMC40OC41IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby93aW5kb3dzX2k2ODZfZ251LzAuNTIuNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2luZG93c19pNjg2X2dudS8wLjUzLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRv
d3NfaTY4Nl9nbnVsbHZtLzAuNTIuNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19p
Njg2X2dudWxsdm0vMC41My4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZf
bXN2Yy8wLjQ4LjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4Nl9tc3ZjLzAu
NTIuNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X21zdmMvMC41My4wIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9nbnUvMC40OC41IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9nbnUvMC41Mi41IFwKKyAgICBjcmF0ZTov
L2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9nbnUvMC41My4wIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby93aW5kb3dzX3g4Nl82NF9nbnVsbHZtLzAuNDguNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2luZG93c194ODZfNjRfZ251bGx2bS8wLjUyLjUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3dpbmRvd3NfeDg2XzY0X2dudWxsdm0vMC41My4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93
aW5kb3dzX3g4Nl82NF9tc3ZjLzAuNDguNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93
c194ODZfNjRfbXN2Yy8wLjUyLjUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2
XzY0X21zdmMvMC41My4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5ub3cvMC41LjQwIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5ub3cvMC42LjIwIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby93aW5zYWZlLzAuMC4xOSBcCkBAIC00MjYsNiArNDM1LDcgQEAgU1JDX1VSSVtjbGktdGFi
bGUtMC40Ljcuc2hhMjU2c3VtXSA9ICJhZGZiYjExNmQ5ZTJjNGJlNzAxMTM2MGQwYzBiZWU1NjU3
MTJjMTFlOTYKIFNSQ19VUklbY29sb3JjaG9pY2UtMS4wLjEuc2hhMjU2c3VtXSA9ICIwYjZhODUy
YjI0YWI3MWRmZmM1ODViY2I0NmVhZjc5NTlkMTc1Y2I4NjVhNzE1MmUzNWIzNDhkMWIyOTYwNDIy
IgogU1JDX1VSSVtjb25maWdwYXJzZXItMy4xLjAuc2hhMjU2c3VtXSA9ICJlNTdlMzI3MmYwMTkw
YzNmMTU4NDI3MmQ2MTM3MTliYTVmYzdkZjdmNDk0MmZlNTQyZTYzZDk0OWNmM2E2NDliIgogU1JD
X1VSSVtjb25zb2xlLTAuMTUuOC5zaGEyNTZzdW1dID0gIjBlMWY4M2ZjMDc2YmQ2ZGQyNzUxN2Vh
Y2RmMjVmZWY2YzRkZmU1ZjFkNzQ0OGJhZmFhZjNhMjZmMTNiNWU0ZWIiCitTUkNfVVJJW2NvbnNv
bGUtMC4xNi4wLnNoYTI1NnN1bV0gPSAiMmUwOWNlZDdlYmJjY2I2M2I0YzY1NDEzZDgyMWYyZTAw
Y2U1NGM1Y2E0NTE0ZGRjNmIzYzg5MmZkYmNiYzY5ZCIKIFNSQ19VUklbY29udGVudF9pbnNwZWN0
b3ItMC4yLjQuc2hhMjU2c3VtXSA9ICJiN2JkYTY2ZTg1OGM2ODMwMDVhNTNhOWE2MGM2OWE0YWNh
N2VlYWE0NWQxMjQ1MjZlMzg5ZjdhZWM4ZTYyZjM4IgogU1JDX1VSSVtjb3JlLWZvdW5kYXRpb24t
MC45LjQuc2hhMjU2c3VtXSA9ICI5MWUxOTVlMDkxYTkzYzQ2ZjcxMDJlYzc4MThhMmFhMzk0ZTFl
MTc3MWMzYWI0ODI1OTYzZmEwM2U0NWFmYjhmIgogU1JDX1VSSVtjb3JlLWZvdW5kYXRpb24tc3lz
LTAuOC42LnNoYTI1NnN1bV0gPSAiMDZlYTJiOWJjOTJiZTNjMmJhYTkzMzRhMzIzZWJjYTJkNmYw
NzRmZjg1MmNkMWQ3YjExMDY0MDM1Y2QzODY4ZiIKQEAgLTQ1Miw2ICs0NjIsNyBAQCBTUkNfVVJJ
W2R1bmNlLTEuMC41LnNoYTI1NnN1bV0gPSAiOTI3NzM1MDRkNThjMDkzZjZkZTI0NTlhZjRhZjMz
ZmFhNTE4YzEzNDUxZWI4ZgogU1JDX1VSSVtkeW4tY2xvbmUtMS4wLjE3LnNoYTI1NnN1bV0gPSAi
MGQ2ZWYwMDcyZjhhNTM1MjgxZTQ4NzZiZTc4ODkzOGI1MjhlOWExZDQzOTAwYjgyYzI1NjlhZjdk
YTc5OTEyNSIKIFNSQ19VUklbZWl0aGVyLTEuMTMuMC5zaGEyNTZzdW1dID0gIjYwYjFhZjFjMjIw
ODU1YjZjZWFjMDI1ZDNmNmVjZGQyYjdjNDg5NGJmZTljZDliZGE0ZmJiNGJjN2MwZDRjZjAiCiBT
UkNfVVJJW2VuY29kZV91bmljb2RlLTAuMy42LnNoYTI1NnN1bV0gPSAiYTM1N2QyOGVkNDFhNTBm
OWM3NjVkYmZlNTZjYmMwNGE2NGU1M2U1ZmM1OGJhNzlmYmMzNGMxMGVmM2RmODMxZiIKK1NSQ19V
UklbZW5jb2RlX3VuaWNvZGUtMS4wLjAuc2hhMjU2c3VtXSA9ICIzNGFhNzM2NDZmZmIwMDZiOGY1
MTQ3ZjNkYzE4MmJkNGJjYjE5MDIyN2NlODYxZmM0YTQ4NDRiZjhlM2NiMmMwIgogU1JDX1VSSVtl
bmNvZGluZ19ycy0wLjguMzQuc2hhMjU2c3VtXSA9ICJiNDVkZTkwNGFhMGIwMTBiY2UyYWI0NTI2
NGQwNjMxNjgxODQ3ZmE3YjZmMmVhYTdkYWI3NjE5OTQzYmM0ZjU5IgogU1JDX1VSSVtlcXVpdmFs
ZW50LTEuMC4xLnNoYTI1NnN1bV0gPSAiNTQ0MzgwN2Q2ZGZmNjkzNzNkNDMzYWI5ZWY1Mzc4YWQ4
ZGY1MGNhNjI5OGNhZjE1ZGU2ZTUyZTI0YWFmNTRkNSIKIFNSQ19VUklbZXJybm8tMC4zLjkuc2hh
MjU2c3VtXSA9ICI1MzRjNWNmNjE5NGRmYWIzZGIzMjQyNzY1YzAzYmJlMjU3Y2Y5MmYyMmIzOGY2
YmMwYzU4ZDU5MTA4YTgyMGJhIgpAQCAtNTI3LDcgKzUzOCw3IEBAIFNSQ19VUklbbHptYS1ycy0w
LjMuMC5zaGEyNTZzdW1dID0gIjI5N2U4MTRjODM2YWU2NGRiODZiMzZjZjJhNTU3YmE1NDM2OGQw
M2Y2YWZjCiBTUkNfVVJJW2x6bWEtc3lzLTAuMS4yMC5zaGEyNTZzdW1dID0gIjVmZGEwNGFiMzc2
NGU2Y2RlNzhiOTk3NGVlYzRmNzc5YWNhYmE3YzRlODRiMzZlY2EzY2Y3N2M1ODFiODVkMjciCiBT
UkNfVVJJW2x6eGQtMC4yLjUuc2hhMjU2c3VtXSA9ICI1ZGU3MzM2YTE4MzEwMzQyOWFkNjZkMTFk
NTZkOGJkYzljNGEyOTE2ZjZiODVhOGYxMWU1YjEyN2JkZTEyMDAxIgogU1JDX1VSSVttYWlscGFy
c2UtMC4xNS4wLnNoYTI1NnN1bV0gPSAiM2RhMDNkNTk4MDQxMWE3MjRlOGFhZjdiNjFhN2I1ZTM4
NmVjNTVhN2ZiNDllZTNkMGZmNzllZmM3ZTVlN2M3ZSIKLVNSQ19VUklbbWF0Y2hlcnMtMC4xLjAu
c2hhMjU2c3VtXSA9ICI4MjYzMDc1YmI4NmM1YTFiMTQyN2I1YWU4NjJlODg4OTY1NmYxMjZlOWY3
N2M0ODQ0OTZlOGI0N2NmNWM1NTU4IgorU1JDX1VSSVttYXRjaGVycy0wLjIuMC5zaGEyNTZzdW1d
ID0gImQxNTI1YTJhMjhjN2Y0ZmEwZmM5OGJiOTFhZTc1NWQxZTJkMTUwNTA3OWUwNTUzOWUzNWJj
ODc2YjVkNjVhZTkiCiBTUkNfVVJJW21lbWNoci0yLjcuNC5zaGEyNTZzdW1dID0gIjc4Y2E5YWIx
YTBiYWJiMWU3ZDU2OTVlMzUzMDg4NjI4OWMxOGNmMmY4N2VjMTlhNTc1YTBhYmRjZTExMmUzYTMi
CiBTUkNfVVJJW21pbWFsbG9jLTAuMS40My5zaGEyNTZzdW1dID0gIjY4OTE0MzUwYWUzNDk1OWQ4
M2Y3MzI0MThkNTFlMjQyN2E3OTQwNTVkMGI5NTI5ZjQ4MjU5YWMwN2FmNjU2MzMiCiBTUkNfVVJJ
W21pbWUtMC4zLjE3LnNoYTI1NnN1bV0gPSAiNjg3N2JiNTE0MDgxZWUyYTdmZjVlZjlkZTMyODFm
MTRhNGRkNGJjZWFjNGMwOTM4ODA3NGE2YjVkZjhhMTM5YSIKQEAgLTU0MSw3ICs1NTIsNyBAQCBT
UkNfVVJJW25hdGl2ZS10bHMtMC4yLjEyLnNoYTI1NnN1bV0gPSAiYTg2MTRlYjJjODNkNTlkMWM4
Y2M5NzRkZDNmOTIwMTk4NjQ3Njc0YQogU1JDX1VSSVtub20tNy4xLjMuc2hhMjU2c3VtXSA9ICJk
MjczOTgzYzVhNjU3YTcwYTNlOGYyYTAxMzI5ODIyZjNiOGM4MTcyYjczODI2NDExYTU1NzUxZTQw
NGEwYTRhIgogU1JDX1VSSVtub3JtYWxpemUtbGluZS1lbmRpbmdzLTAuMy4wLnNoYTI1NnN1bV0g
PSAiNjE4MDdmNzc4MDJmZjMwOTc1ZTAxZjRmMDcxYzhiYTEwYzAyMjA1MmY5OGIzMjk0MTE5ZjNl
NjE1ZDEzZTViZSIKIFNSQ19VUklbbm9ybXBhdGgtMS4yLjAuc2hhMjU2c3VtXSA9ICI1ODMxOTUy
YTk0NzZmMmZlZDc0Yjc3ZDc0MTgyZmE1ZGRjNGQyMWM3MmVjNDVhMzMzYjI1MGUzZWQwMjcyODA0
IgotU1JDX1VSSVtudS1hbnNpLXRlcm0tMC40Ni4wLnNoYTI1NnN1bV0gPSAiNzdhODE2NTcyNmU4
MjM2MDY0ZGJiNDU0NTkyNDI2MDAzMDRiNDJhNWVhMjRlZTI5NDhlMThlMDIzYmY3YmE4NCIKK1NS
Q19VUklbbnUtYW5zaS10ZXJtLTAuNTAuMS5zaGEyNTZzdW1dID0gImQ0YTI4ZTA1N2QwMWY5N2U2
MTI1NTIxMGZjZmYwOTRkNzRlZDA0NjYwMzg2MzNlOTUwMTdmNWJlYjY4ZTQzOTkiCiBTUkNfVVJJ
W251bS1jb252LTAuMS4wLnNoYTI1NnN1bV0gPSAiNTFkNTE1ZDMyZmIxODJlZTM3Y2RhMmNjZGNi
OTI5NTBkNmEzYzI4OTNhYTI4MGU1NDA2NzFjMmNkMGYzYjFkOSIKIFNSQ19VUklbbnVtYmVyX3By
ZWZpeC0wLjQuMC5zaGEyNTZzdW1dID0gIjgzMGIyNDZhMGU1ZjIwYWY4NzE0MWIyNWMxNzNjZDFi
NjA5YmQ3Nzc5YTQ2MTdkNmVjNTgyYWJhZjkwODcwZjMiCiBTUkNfVVJJW29uY2VfY2VsbC0xLjIw
LjIuc2hhMjU2c3VtXSA9ICIxMjYxZmU3ZTMzYzczYjM1NGVhYjQzYjEyNzNhNTdjOGY5NjdkMDM5
MWU4MDM1M2U1MWY3NjRhYzAyY2Y2Nzc1IgpAQCAtNTUxLDcgKzU2Miw2IEBAIFNSQ19VUklbb3Bl
bnNzbC1wcm9iZS0wLjEuNS5zaGEyNTZzdW1dID0gImZmMDExYTMwMmMzOTZhNTE5NzY5MjQzMWZj
MTk0ODAxOTE1NGFmCiBTUkNfVVJJW29wZW5zc2wtc3lzLTAuOS4xMDcuc2hhMjU2c3VtXSA9ICI4
Mjg4OTc5YWNkODQ3NDljNzQ0YTkwMTRiNDM4MmQ0MmI4ZjdiMjU5Mjg0N2I1YWZiMmVkMjllNWQx
NmVkZTA3IgogU1JDX1VSSVtvcHRpb24tZXh0LTAuMi4wLnNoYTI1NnN1bV0gPSAiMDQ3NDRmNDll
YWU5OWFiNzhlMGQ1YzBiNjAzYWIyMThmNTE1ZWE4Y2ZlNWE0NTZkNzYyOWFkODgzYTNiNmU3ZCIK
IFNSQ19VUklbb3NfcGlwZS0xLjIuMC5zaGEyNTZzdW1dID0gIjI5ZDczYmE4ZGFmOGZhYzEzYjA1
MDFkMWFiZWRkY2ZlMjFiYTc0MDFhZGE2MWE4MTkxNDRiNmMyYTRmMzIyMDkiCi1TUkNfVVJJW292
ZXJsb2FkLTAuMS4xLnNoYTI1NnN1bV0gPSAiYjE1ODEzMTYzYzFkODMxYmY0YTEzYzM2MTBjMDVj
MGQwM2IzOWZlYjA3ZjdlMDlmYTIzNGRhYzliMTVhYWYzOSIKIFNSQ19VUklbcGFya2luZ19sb3Qt
MC4xMi4zLnNoYTI1NnN1bV0gPSAiZjFiZjE4MTgzY2Y1NGU4ZDYwNTk2NDdmYzMwNjM2NDZhMTgw
MWNmMzA4OTY5MzNlYzIzMTE2MjJjYzRiOWEyNyIKIFNSQ19VUklbcGFya2luZ19sb3RfY29yZS0w
LjkuMTAuc2hhMjU2c3VtXSA9ICIxZTQwMWY5NzdhYjM4NWM5ZTRlM2FiMzA2MjdkNmYyNmQwMGUy
YzczZWVmMzE3NDkzYzRlYzZkNDY4NzI2Y2Y4IgogU1JDX1VSSVtwYXN0ZS0xLjAuMTUuc2hhMjU2
c3VtXSA9ICI1N2MwZDdiNzRiNTYzYjQ5ZDM4ZGFlMDBhMGMzN2Q0ZDZkZTliNDMyMzgyYjI4OTJm
MDU3NGRkY2FlNzNmZDBhIgpAQCAtNTg1LDkgKzU5NSw3IEBAIFNSQ19VUklbcmVkb3hfc3lzY2Fs
bC0wLjQuMS5zaGEyNTZzdW1dID0gIjQ3MjJkNzY4ZWZmNDZiNzU5ODlkZDEzNGU1YzM1M2YwZDYy
OTZlCiBTUkNfVVJJW3JlZG94X3N5c2NhbGwtMC41LjEuc2hhMjU2c3VtXSA9ICI0NjkwNTI4OTRk
Y2I1NTM0MjFlNDgzZTQyMDllZTU4MWE0NTEwMGQzMWI0MDE4ZGUwM2U1YTdhZDg2Mzc0YTdlIgog
U1JDX1VSSVtyZWRveF91c2Vycy0wLjQuNS5zaGEyNTZzdW1dID0gImJkMjgzZDk2NTFlZWRhNGIy
YTgzYTQzYzFjOTFiMjY2YzQwZmQ3NmVjZDM5YTUwYThjNjMwYWU2OWRjNzI4OTEiCiBTUkNfVVJJ
W3JlZ2V4LTEuMTEuMS5zaGEyNTZzdW1dID0gImI1NDRlZjFiNGVhYzVkYzJkYjMzZWE2MzYwNmFl
OWZmY2ZhYzI2YzE0MTZhMjgwNmFlMGJmNWY1NmIyMDExOTEiCi1TUkNfVVJJW3JlZ2V4LWF1dG9t
YXRhLTAuMS4xMC5zaGEyNTZzdW1dID0gIjZjMjMwZDczZmI4ZDhjMWI5YzBiMzEzNWM1MTQyYThh
Y2VlM2EwNTU4ZmI4ZGI1Y2YxY2I2NWY4ZDc4NjIxMzIiCiBTUkNfVVJJW3JlZ2V4LWF1dG9tYXRh
LTAuNC45LnNoYTI1NnN1bV0gPSAiODA5ZThkYzYxZjZkZTczYjQ2Yzg1ZjRjOTY0ODYzMTBmZTMw
NGM0MzRjZmE0MzY2OWQ3YjQwZjcxMTE1MDkwOCIKLVNSQ19VUklbcmVnZXgtc3ludGF4LTAuNi4y
OS5zaGEyNTZzdW1dID0gImYxNjJjNmRkN2IwMDg5ODFlNGQ0MDIxMGFjYTIwYjRiZDBmOWI2MGNh
OTI3MTA2MWIwN2Y3ODUzNzcyMmYyZTEiCiBTUkNfVVJJW3JlZ2V4LXN5bnRheC0wLjguNS5zaGEy
NTZzdW1dID0gIjJiMTVjNDMxODZiZTY3YTRmZDYzYmVlNTBkMDMwM2FmZmZjZWYzODE0OTJlYmUy
YzVkODdmMzI0ZTFiODgxNWMiCiBTUkNfVVJJW3JlbGF0aXZlLXBhdGgtMS45LjMuc2hhMjU2c3Vt
XSA9ICJiYTM5ZjM2OTljMzc4Y2Q4OTcwOTY4ZGNiZmY5YzQzMTU5ZWE0Y2ZiZDg4ZDQzYzAwYjIy
ZjJlZjEwYTQzNWQyIgogU1JDX1VSSVtyZmMyMDQ3LWRlY29kZXItMS4wLjYuc2hhMjU2c3VtXSA9
ICJiYzM2NTQ1ZDEwMjE0NTZhNzUxYjU3MzUxN2NiNTJlOGMzMzliMmY2NjJlNmIyNzc4ZWY2Mjky
ODI2NzhkZTI5IgpAQCAtNjYyLDcgKzY3MCw3IEBAIFNSQ19VUklbdHJhY2luZy1hdHRyaWJ1dGVz
LTAuMS4yOC5zaGEyNTZzdW1dID0gIjM5NWFlMTI0YzA5ZjllNjkxOGEyMzEwYWY2MDM4ZmJhCiBT
UkNfVVJJW3RyYWNpbmctY29yZS0wLjEuMzMuc2hhMjU2c3VtXSA9ICJlNjcyYzk1Nzc5Y2Y5NDdj
NTMxMWY4Mzc4N2FmNGZhOGZmZmQxMmZiMjdlNDk5MzIxMWE4NGJkZmQ5NjEwZjljIgogU1JDX1VS
SVt0cmFjaW5nLWxvZy0wLjIuMC5zaGEyNTZzdW1dID0gImVlODU1ZjFmNDAwYmQwZTVjMDJkMTUw
YWU1ZGUzODQwMDM5YTNmNTRiMDI1MTU2NDA0ZTM0YzIzYzAzZjQ3YzMiCiBTUkNfVVJJW3RyYWNp
bmctc2VyZGUtMC4yLjAuc2hhMjU2c3VtXSA9ICI3MDRiMWFlYjdiZTBkMGE4NGZjOTgyOGNhZTUx
ZGFiNTk3MGZlZTUwODhmODNkMWRkN2VlNmY2MjQ2ZmM2ZmYxIgotU1JDX1VSSVt0cmFjaW5nLXN1
YnNjcmliZXItMC4zLjE5LnNoYTI1NnN1bV0gPSAiZTgxODlkZWNiNWFjMGZhN2JjOGI5NmI3Y2I5
YjI3MDFkNjBkNDg4MDVhY2E4NGEyMzgwMDRkNjY1ZmNjNDAwOCIKK1NSQ19VUklbdHJhY2luZy1z
dWJzY3JpYmVyLTAuMy4yMC5zaGEyNTZzdW1dID0gIjIwNTRhMTRmNTMwN2Q2MDFmODhkYWYwNTUz
ZTFjYmY0NzJhY2M0ZjJjNTFhZmFiNjMyNDMxY2RjZDcyMTI0ZDUiCiBTUkNfVVJJW3RyeWNtZC0w
LjE1LjYuc2hhMjU2c3VtXSA9ICIzZTg2NzNmMWRjNDVhY2RmZjhlMjVhMDZjYzYyZjhlNTI5NTYz
ZThhY2Q4NDIzN2NlODNkNWEyOGUyYmVmYTEyIgogU1JDX1VSSVt0d294LWhhc2gtMS42LjMuc2hh
MjU2c3VtXSA9ICI5N2ZlZTZiNTdjNmE0MTUyNGE4MTBkYWVlOTI4NmMwMmQ3NzUyYzQyNTMwNjRk
MGIwNTQ3MjgzM2E0MzhmNjc1IgogU1JDX1VSSVt0eXBlbnVtLTEuMTcuMC5zaGEyNTZzdW1dID0g
IjQyZmYwYmYwYzY2YjgyMzhjNmYzYjU3OGRmMzdkMGI3ODQ4ZTU1ZGY4NTc3YjNmNzRmOTJhNjlh
Y2NlZWI4MjUiCkBAIC03MDUsMjMgKzcxMywzMyBAQCBTUkNfVVJJW3dpbmFwaS11dGlsLTAuMS44
LnNoYTI1NnN1bV0gPSAiNGQ0Y2MzODRlMWU3M2I5M2JhZmE2ZmI0ZjFkZjhjNDE2OTVjOGE5MQog
U1JDX1VSSVt3aW5hcGkteDg2XzY0LXBjLXdpbmRvd3MtZ251LTAuNC4wLnNoYTI1NnN1bV0gPSAi
NzEyZTIyNzg0MWQwNTdjMWVlMWNkMmZiMjJmYTdlNWE1NDYxYWU4ZTQ4ZmEyY2E3OWVjNDJjZmMx
OTMxMTgzZiIKIFNSQ19VUklbd2luZG93cy1zeXMtMC40OC4wLnNoYTI1NnN1bV0gPSAiNjc3ZDI0
MThiZWM2NWUzMzM4ZWRiMDc2ZTgwNmJjMWVjMTU2OTNjNWQwMTA0NjgzZjJlZmU4NTdmNjEwNTZh
OSIKIFNSQ19VUklbd2luZG93cy1zeXMtMC41Mi4wLnNoYTI1NnN1bV0gPSAiMjgyYmU1ZjM2YThj
ZTc4MWZhZDhjOGFlMThmYTNmOWJlZmY1N2VjMWI1MmNiM2RlMDc4OTIwMTQyNWQ5YTMzZCIKK1NS
Q19VUklbd2luZG93cy1zeXMtMC42MC4yLnNoYTI1NnN1bV0gPSAiZjJmNTAwZTRkMjgyMzRmNzIw
NDA5OTBlYzlkMzllM2E2Yjk1MGY5ZjIyZDNkYmExODQxNmMzNTg4MjYxMmJjYiIKIFNSQ19VUklb
d2luZG93cy10YXJnZXRzLTAuNDguNS5zaGEyNTZzdW1dID0gIjlhMmZhNmUyMTU1ZDcyNDdiZTY4
YzA5NjQ1NjA4MzE0NWMxODNjYmJiYzI3NjQxNTBkZGE0NWE4NzE5Nzk0MGMiCiBTUkNfVVJJW3dp
bmRvd3MtdGFyZ2V0cy0wLjUyLjUuc2hhMjU2c3VtXSA9ICI2ZjA3MTNhNDY1NTk0MDlkMjAyZTcw
ZTI4MjI3Mjg4NDQ2YmY3ODQxZDMyMTE1ODNhNGI1M2UzZjZkOTZlN2ViIgorU1JDX1VSSVt3aW5k
b3dzLXRhcmdldHMtMC41My4yLnNoYTI1NnN1bV0gPSAiYzY2ZjY5ZmNjOWNlMTFkYTk5NjZkZGIz
MWE0MDk2OGNhZDAwMWM1YmVkZWI1YzJiODJlZGU0MjUzYWI0OGFlZiIKIFNSQ19VUklbd2luZG93
c19hYXJjaDY0X2dudWxsdm0tMC40OC41LnNoYTI1NnN1bV0gPSAiMmIzOGUzMmYwYWJjY2Y5OTg3
YTRlMzA3OWRmYjY3ZGNkNzk5ZmI2MTM2MWU1M2UyODgyYzNjYmFmMGQ5MDVkOCIKIFNSQ19VUklb
d2luZG93c19hYXJjaDY0X2dudWxsdm0tMC41Mi41LnNoYTI1NnN1bV0gPSAiNzA4OGVlZDcxZThi
OGRkYTI1OGVjYzhiYWM1ZmIxMTUzYzVjZmZhZjI1NzhmYzhmZjVkNjFlMjM1NzhkMzI2MyIKK1NS
Q19VUklbd2luZG93c19hYXJjaDY0X2dudWxsdm0tMC41My4wLnNoYTI1NnN1bV0gPSAiODZiOGQ1
ZjkwZGRkMTljYjRhMTQ3YTVmYTYzY2E4NDhkYjNkZjA4NWUyNWZlZTNjYzEwYjM5YjZlZWJhZTc2
NCIKIFNSQ19VUklbd2luZG93c19hYXJjaDY0X21zdmMtMC40OC41LnNoYTI1NnN1bV0gPSAiZGMz
NTMxMDk3MWYzYjJkYmJmM2YwNjkwYTIxOWY0MGUyZDlhZmNmNjRmOWFiN2NjMWJlNzIyOTM3YzI2
YjRiYyIKIFNSQ19VUklbd2luZG93c19hYXJjaDY0X21zdmMtMC41Mi41LnNoYTI1NnN1bV0gPSAi
OTk4NWZkMTUwNGUyNTBjNjE1Y2E1ZjI4MWMzZjdhNmRhNzYyMTNlYmQ1Y2NjOTU2MTQ5NjU2OGEy
NzUyYWZiNiIKK1NSQ19VUklbd2luZG93c19hYXJjaDY0X21zdmMtMC41My4wLnNoYTI1NnN1bV0g
PSAiYzc2NTFhMWY2MmExMWI4Y2JkNWUwZDQyNTI2ZTU1ZjJjOTk4ODZjNzdlMDA3MTc5ZWZmZjg2
YzJiMTM3ZTY2YyIKIFNSQ19VUklbd2luZG93c19pNjg2X2dudS0wLjQ4LjUuc2hhMjU2c3VtXSA9
ICJhNzU5MTVlN2RlZjYwYzk0ZGNlZjcyMjAwYjlhOGU1OGU1MDkxNzQ0OTYwZGE2NGVjNzM0YTZj
NmU5YjM3NDNlIgogU1JDX1VSSVt3aW5kb3dzX2k2ODZfZ251LTAuNTIuNS5zaGEyNTZzdW1dID0g
Ijg4YmEwNzNjZjE2ZDUzNzI3MjBlYzk0MmE4Y2NiZjYxNjI2MDc0YzZkNGRkMmU3NDUyOTk3MjZj
ZThiODk2NzAiCitTUkNfVVJJW3dpbmRvd3NfaTY4Nl9nbnUtMC41My4wLnNoYTI1NnN1bV0gPSAi
YzFkYzY3NjU5ZDM1ZjM4N2Y1ZjZjNDc5ZGM0ZTI4ZjFkNGJiOTBkZGQxYTVkM2RhMmU1ZDk3YjQy
ZDYyNzJjMyIKIFNSQ19VUklbd2luZG93c19pNjg2X2dudWxsdm0tMC41Mi41LnNoYTI1NnN1bV0g
PSAiODdmNDI2MTIyOTAzMGE4NThmMzZiNDU5ZTc0OGFlOTc1NDVkNmYxZWM2MGU1ZTBkNmEzZDMy
ZTBkYzIzMmVlOSIKK1NSQ19VUklbd2luZG93c19pNjg2X2dudWxsdm0tMC41My4wLnNoYTI1NnN1
bV0gPSAiOWNlNmNjYmRlZGJmNmQ2MzU0NDcxMzE5ZTc4MWMwZGZlZjA1NGM4MWZiYzdjZjgzZjMz
OGE0Mjk2YzBjYWUxMSIKIFNSQ19VUklbd2luZG93c19pNjg2X21zdmMtMC40OC41LnNoYTI1NnN1
bV0gPSAiOGY1NWMyMzNmNzBjNGIyN2Y2NmM1MjM1ODBmNzhmMTAwNGU4YjVhOGI2NTllMDVhNGVi
NDlkNDE2NmNjYTQwNiIKIFNSQ19VUklbd2luZG93c19pNjg2X21zdmMtMC41Mi41LnNoYTI1NnN1
bV0gPSAiZGIzYzJiZjNkMTNkNWI2NThiZTczNDYzMjg0ZWFmMTI4MzBhYzlhMjZhOTBjNzE3Yjdm
NzcxZGZlOTc0ODdiZiIKK1NSQ19VUklbd2luZG93c19pNjg2X21zdmMtMC41My4wLnNoYTI1NnN1
bV0gPSAiNTgxZmVlOTU0MDZiYjEzMzgyZDJmNjVjZDRhOTA4Y2E3YjFlNGMyZjE5MTdmMTQzYmEx
NmVmZTk4YTU4OWI1ZCIKIFNSQ19VUklbd2luZG93c194ODZfNjRfZ251LTAuNDguNS5zaGEyNTZz
dW1dID0gIjUzZDQwYWJkMjU4M2QyM2U0NzE4ZmRkZjFlYmVjODRkYmZmODM4MWMwN2NhZTY3ZmY3
NzY4YmJmMTljNjcxOGUiCiBTUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudS0wLjUyLjUuc2hhMjU2
c3VtXSA9ICI0ZTQyNDZmNzZiZGVmZjA5ZWI0ODg3NWEwZmQzZTJhZjZhYWRhNzlkNDA5ZDMzMDEx
ODg2ZDNlMTU4MTUxN2Q5IgorU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnUtMC41My4wLnNoYTI1
NnN1bV0gPSAiMmU1NWI1YWM5ZWEzM2YyZmMxNzE2ZDE3NDJkYjE1NTc0ZmQ2ZmM4ZGFkYzUxY2Fh
YjFjMTZhM2QzYjQxOTBiYSIKIFNSQ19VUklbd2luZG93c194ODZfNjRfZ251bGx2bS0wLjQ4LjUu
c2hhMjU2c3VtXSA9ICIwYjdiNTI3Njc4NjhhMjNkNWJhYjc2OGUzOTBkYzVmNWM1NTgyNWI2ZDMw
Yjg2Yzg0NGZmMmRjNzQxNDA0NGNjIgogU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnVsbHZtLTAu
NTIuNS5zaGEyNTZzdW1dID0gIjg1MjI5OGU0ODJjZDY3YzM1NmRkZDk1NzAzODZlMjg2MmI1Njcz
Yzg1YmQ1Zjg4ZGY5YWI2ODAyYjMzNGM1OTYiCitTUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudWxs
dm0tMC41My4wLnNoYTI1NnN1bV0gPSAiMGE2ZTAzNWRkMDU5OTI2N2NlMWVlMTMyZTUxYzI3ZGQy
OTQzN2Y2MzMyNTc1MzA1MWU3MWRkOWU0MjQwNmM1NyIKIFNSQ19VUklbd2luZG93c194ODZfNjRf
bXN2Yy0wLjQ4LjUuc2hhMjU2c3VtXSA9ICJlZDk0ZmNlNjE1NzFhNDAwNjg1MmI3Mzg5YTA2M2Fi
OTgzYzAyZWIxYmIzN2I0N2Y4MjcyY2U5MmQwNmQ5NTM4IgogU1JDX1VSSVt3aW5kb3dzX3g4Nl82
NF9tc3ZjLTAuNTIuNS5zaGEyNTZzdW1dID0gImJlYzQ3ZTViZmQxYmZmMGVlYWY2ZDhiNDg1Y2Mx
MDc0ODkxYTE5N2FiNDIyNWQ1MDRjYjdhMWFiODhiMDJiZjAiCitTUkNfVVJJW3dpbmRvd3NfeDg2
XzY0X21zdmMtMC41My4wLnNoYTI1NnN1bV0gPSAiMjcxNDE0MzE1YWZmODczODczODJlYzNkMjcx
YjUyZDdhZTc4NzI2ZjVkNDRhYzk4YjRmNDAzMGM5MTg4MDQ4NiIKIFNSQ19VUklbd2lubm93LTAu
NS40MC5zaGEyNTZzdW1dID0gImY1OTNhOTUzOTg3MzdhZWVkNTNlNDg5Yzc4NWRmMTNmMzYxOGU0
MWRiY2Q2NzE4YzZhZGRiZjEzOTVhYTY4NzYiCiBTUkNfVVJJW3dpbm5vdy0wLjYuMjAuc2hhMjU2
c3VtXSA9ICIzNmMxZmVjMWEyYmI1ODY2ZjA3YzI1ZjY4YzI2ZTU2NWM0YzIwMGFlYmI5NmQ3ZTU1
NzEwYzE5ZDNlOGFjNDliIgogU1JDX1VSSVt3aW5zYWZlLTAuMC4xOS5zaGEyNTZzdW1dID0gImQx
MzVkMTdhYjc3MDI1MmFkOTVlOWE4NzJkMzY1Y2YzMDkwZTNiZTg2NGEzNGFiNDZmNDg1NTU5OTNl
ZmM5MDQiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bWF0dXJpbl8xLjkuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
YXR1cmluXzEuOS42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuOS40LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbl8xLjkuNi5iYgppbmRl
eCBmNDdjODA2MWJiLi44MDk3YzU1MDMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbl8xLjkuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbl8xLjkuNi5iYgpAQCAtNSw3ICs1LDcgQEAgTElD
RU5TRSA9ICJNSVQgfCBBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vbGlj
ZW5zZS1hcGFjaGU7bWQ1PTE4MzZlZmIyZWI3Nzk5NjY2OTZmNDczZWU4NTQwNTQyIFwKICAgICAg
ICAgICAgICAgICAgICAgZmlsZTovL2xpY2Vuc2UtbWl0O21kNT04NWZkM2I2NzA2OWNmZjc4NGQ5
OGViZmM3ZDVjMDc5NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIzNTE2M2EwYzk5YmM2ZjM4
MGZiODc4NmMwNGZkMTRkY2Y2Y2Q2MjJmZjI5NWVhM2RlNTI1MDE1ZTZhYzQwY2YiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMmMyYWUzNzE0NDgxMWQzNjU1MDk4ODllZDcyMjBiMDU5ODQ4N2YxMjc4
YzI0NDE4MjljM2FiZjU2Y2M2MzI0YSIKIAogUyA9ICIke1VOUEFDS0RJUn0vbWF0dXJpbi0ke1BW
fSIKIAotLSAKMi40Ny4xCgo=

--===============5742322912295143071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.13/site-packages/maturin-1.9.4.dist-info moved to /usr/lib/python3.13/site-packages/maturin-1.9.6.dist-info

--===============5742322912295143071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-maturin: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/python3-maturin: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.9.4.tar.gz;downloadfilename=maturin-1.9.4.tar.gz crate://crates.io/adler2/2.0.0 crate://crates.io/ahash/0.8.11 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.18 crate://crates.io/anstream/0.6.14 crate://crates.io/anstyle/1.0.7 crate://crates.io/anstyle-parse/0.2.4 crate://crates.io/anstyle-query/1.1.0 crate://crates.io/anstyle-wincon/3.0.3 crate://crates.io/anyhow/1.0.89 crate://crates.io/arbitrary/1.4.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/automod/1.0.14 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.5.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.8 crate://crates.io/bstr/1.10.0 crate://crates.io/bumpalo/3.16.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.9.0 crate://crates.io/bytesize/1.3.0 cra
 te://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.1.9 crate://crates.io/cargo-config2/0.1.26 crate://crates.io/cargo-options/0.7.4 crate://crates.io/cargo-platform/0.1.8 crate://crates.io/cargo-xwin/0.18.6 crate://crates.io/cargo-zigbuild/0.20.0 crate://crates.io/cargo_metadata/0.19.0 crate://crates.io/cbindgen/0.29.0 crate://crates.io/cc/1.2.16 crate://crates.io/cfb/0.10.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.9.3 crate://crates.io/clap/4.5.7 crate://crates.io/clap_builder/4.5.7 crate://crates.io/clap_complete/4.5.5 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.2 crate://crates.io/clap_derive/4.5.5 crate://crates.io/clap_lex/0.7.1 crate://crates.io/cli-table/0.4.7 crate://crates.io/colorchoice/1.0.1 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.8 crate://crates.io/content_inspector/0.2.4 crate
 ://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation-sys/0.8.6 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crc/3.2.1 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.4.2 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.5 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.20 crate://crates.io/crypto-common/0.1.6 crate://crates.io/data-encoding/2.6.0 crate://crates.io/deranged/0.3.11 crate://crates.io/derive_arbitrary/1.4.1 crate://crates.io/dialoguer/0.11.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/5.0.1 crate://crates.io/dirs-sys/0.4.1 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.9 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.17 crate://crates.io/either/1.13.0 crate://crates.io/encode_unicode/0.3.6 crate://crates.io/encoding_rs/0.8.34 crate://crates.io/equivalent/1.0.1 crate://crates.io/errno/0.3.9 
 crate://crates.io/expect-test/1.5.0 crate://crates.io/fastrand/2.1.0 crate://crates.io/fat-macho/0.4.9 crate://crates.io/filetime/0.2.23 crate://crates.io/flate2/1.0.33 crate://crates.io/fnv/1.0.7 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.1 crate://crates.io/fs-err/3.0.0 crate://crates.io/fs4/0.12.0 crate://crates.io/futures/0.3.30 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-executor/0.3.30 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/getrandom/0.3.3 crate://crates.io/glob/0.3.1 crate://crates.io/globset/0.4.16 crate://crates.io/goblin/0.9.2 crate://crates.io/hashbrown/0.14.5 
 crate://crates.io/hashbrown/0.15.2 crate://crates.io/heck/0.5.0 crate://crates.io/home/0.5.9 crate://crates.io/humantime/2.1.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/1.5.0 crate://crates.io/icu_locid/1.5.0 crate://crates.io/icu_locid_transform/1.5.0 crate://crates.io/icu_locid_transform_data/1.5.0 crate://crates.io/icu_normalizer/1.5.0 crate://crates.io/icu_normalizer_data/1.5.0 crate://crates.io/icu_properties/1.5.1 crate://crates.io/icu_properties_data/1.5.0 crate://crates.io/icu_provider/1.5.0 crate://crates.io/icu_provider_macros/1.5.0 crate://crates.io/idna/1.0.3 crate://crates.io/idna_adapter/1.2.0 crate://crates.io/ignore/0.4.23 crate://crates.io/indexmap/2.6.0 crate://crates.io/indicatif/0.17.9 crate://crates.io/indoc/2.0.5 crate://crates.io/insta/1.43.1 crate://crates.io/is_terminal_polyfill/1.70.0 crate://crates.io/itertools/0.12.1 crate://crates.io/itertools/0.13.0 crate://crates.io/itoa/1.0.11 crate://crates.io/jobserver/0.1.33 crate://
 crates.io/js-sys/0.3.73 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.4.0 crate://crates.io/lddtree/0.3.7 crate://crates.io/libc/0.2.172 crate://crates.io/libmimalloc-sys/0.1.39 crate://crates.io/libredox/0.1.3 crate://crates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.4.14 crate://crates.io/litemap/0.7.3 crate://crates.io/lock_api/0.4.12 crate://crates.io/lockfree-object-pool/0.1.6 crate://crates.io/log/0.4.22 crate://crates.io/lzma-rs/0.3.0 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.5 crate://crates.io/mailparse/0.15.0 crate://crates.io/matchers/0.1.0 crate://crates.io/memchr/2.7.4 crate://crates.io/mimalloc/0.1.43 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.4 crate://crates.io/minijinja/2.5.0 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/miniz_oxide/0.8.0 crate://crates.io/msi/0.8.0 crate://crates.io/multipart/0.18.0 crate://crates.io/native-tls/0.2.12 crate://crates.io/nom/7.1.3 crate://crates.io/no
 rmalize-line-endings/0.3.0 crate://crates.io/normpath/1.2.0 crate://crates.io/nu-ansi-term/0.46.0 crate://crates.io/num-conv/0.1.0 crate://crates.io/number_prefix/0.4.0 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.5 crate://crates.io/openssl-sys/0.9.107 crate://crates.io/option-ext/0.2.0 crate://crates.io/os_pipe/1.2.0 crate://crates.io/overload/0.1.1 crate://crates.io/parking_lot/0.12.3 crate://crates.io/parking_lot_core/0.9.10 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.1 crate://crates.io/pin-project-lite/0.2.15 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.30 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.0.5 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.17 c
 rate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.1.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/psm/0.1.21 crate://crates.io/pyproject-toml/0.13.5 crate://crates.io/python-pkginfo/0.6.5 crate://crates.io/quote/1.0.37 crate://crates.io/quoted_printable/0.5.0 crate://crates.io/r-efi/5.2.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.10.0 crate://crates.io/rayon-core/1.12.1 crate://crates.io/redox_syscall/0.4.1 crate://crates.io/redox_syscall/0.5.1 crate://crates.io/redox_users/0.4.5 crate://crates.io/regex/1.11.1 crate://crates.io/regex-automata/0.1.10 crate://crates.io/regex-automata/0.4.9 crate://crates.io/regex-syntax/0.6.29 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.0.6 crate://crates.io/ring/0.17.13 crate://crates.io/rstest/0.22.0 crate://crates.io/rstest_macros/0.22.0 crate://crates.io/rustc-h
 ash/2.0.0 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.6 crate://crates.io/rustix/0.38.41 crate://crates.io/rustls/0.23.19 crate://crates.io/rustls-pemfile/2.1.3 crate://crates.io/rustls-pki-types/1.10.0 crate://crates.io/rustls-webpki/0.102.8 crate://crates.io/rustversion/1.0.18 crate://crates.io/ryu/1.0.18 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.23 crate://crates.io/schemars/0.8.21 crate://crates.io/schemars_derive/0.8.21 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.12.0 crate://crates.io/scroll_derive/0.12.0 crate://crates.io/security-framework/2.11.0 crate://crates.io/security-framework-sys/2.11.0 crate://crates.io/semver/1.0.23 crate://crates.io/serde/1.0.217 crate://crates.io/serde_derive/1.0.217 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.135 crate://crates.io/serde_spanned/0.6.8 crate://crates.io/sha2/0.10.8 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-word
 s/1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/similar/2.5.0 crate://crates.io/slab/0.4.9 crate://crates.io/smallvec/1.13.2 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.16 crate://crates.io/snapbox-macros/0.3.10 crate://crates.io/socks/0.3.4 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/stacker/0.1.15 crate://crates.io/static_assertions/1.1.0 crate://crates.io/strsim/0.11.1 crate://crates.io/subtle/2.5.0 crate://crates.io/syn/2.0.90 crate://crates.io/synstructure/0.13.1 crate://crates.io/tar/0.4.43 crate://crates.io/target-lexicon/0.13.1 crate://crates.io/tempfile/3.11.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.3.0 crate://crates.io/textwrap/0.16.1 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.12 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.12 crate://crates.io/thread_local/1.1.8 crate://crates.io/time/0.3.36 crate://crates.io/ti
 me-core/0.1.2 crate://crates.io/time-macros/0.2.18 crate://crates.io/tinystr/0.7.6 crate://crates.io/toml/0.8.19 crate://crates.io/toml_datetime/0.6.8 crate://crates.io/toml_edit/0.21.1 crate://crates.io/toml_edit/0.22.22 crate://crates.io/tracing/0.1.41 crate://crates.io/tracing-attributes/0.1.28 crate://crates.io/tracing-core/0.1.33 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.19 crate://crates.io/trycmd/0.15.6 crate://crates.io/twox-hash/1.6.3 crate://crates.io/typenum/1.17.0 crate://crates.io/unicase/2.7.0 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.1.13 crate://crates.io/unicode-width/0.2.0 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/2.11.0 crate://crates.io/url/2.5.4 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf16_iter/1.0.5 crate://crates.io/utf
 8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.8.0 crate://crates.io/valuable/0.1.0 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.1 crate://crates.io/version_check/0.9.4 crate://crates.io/versions/6.2.0 crate://crates.io/wait-timeout/0.2.0 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.2+wasi-0.2.4 crate://crates.io/wasm-bindgen/0.2.96 crate://crates.io/wasm-bindgen-backend/0.2.96 crate://crates.io/wasm-bindgen-macro/0.2.96 crate://crates.io/wasm-bindgen-macro-support/0.2.96 crate://crates.io/wasm-bindgen-shared/0.2.96 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-roots/0.26.2 crate://crates.io/which/7.0.0 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.8 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-sys/0.48.0 crate://crates.io/win
 dows-sys/0.52.0 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.5 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.5 crate://crates.io/windows_aarch64_msvc/0.48.5 crate://crates.io/windows_aarch64_msvc/0.52.5 crate://crates.io/windows_i686_gnu/0.48.5 crate://crates.io/windows_i686_gnu/0.52.5 crate://crates.io/windows_i686_gnullvm/0.52.5 crate://crates.io/windows_i686_msvc/0.48.5 crate://crates.io/windows_i686_msvc/0.52.5 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.5 crate://crates.io/windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gnullvm/0.52.5 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/windows_x86_64_msvc/0.52.5 crate://crates.io/winnow/0.5.40 crate://crates.io/winnow/0.6.20 crate://crates.io/winsafe/0.0.19 crate://crates.io/wit-bindgen-rt/0.39.0 crate://crates.io/write16/1.0.0 crate://crates.io/writeable/0.5.5 crate://crates.i
 o/xattr/1.3.1 crate://crates.io/xwin/0.6.5 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.7.4 crate://crates.io/yoke-derive/0.7.5 crate://crates.io/zerocopy/0.7.35 crate://crates.io/zerocopy-derive/0.7.35 crate://crates.io/zerofrom/0.1.4 crate://crates.io/zerofrom-derive/0.1.5 crate://crates.io/zeroize/1.8.1 crate://crates.io/zerovec/0.10.4 crate://crates.io/zerovec-derive/0.10.3 crate://crates.io/zip/2.3.0 crate://crates.io/zopfli/0.8.1 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.9.6.tar.gz;downloadfilename=maturin-1.9.6.tar.gz crate://crates.io/adler2/2.0.0 crate://crates.io/ahash/0.8.11 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.18 crate://crates.io/anstream/0.6.14 crate://crates.io/anstyle/1.0.7 crate://crates.io/anstyle-parse/0.2.4 crate://crates.io/anstyle-query/1.1.0 crate://
 crates.io/anstyle-wincon/3.0.3 crate://crates.io/anyhow/1.0.89 crate://crates.io/arbitrary/1.4.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/automod/1.0.14 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.5.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.8 crate://crates.io/bstr/1.10.0 crate://crates.io/bumpalo/3.16.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.9.0 crate://crates.io/bytesize/1.3.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.1.9 crate://crates.io/cargo-config2/0.1.26 crate://crates.io/cargo-options/0.7.4 crate://crates.io/cargo-platform/0.1.8 crate://crates.io/cargo-xwin/0.18.6 crate://crates.io/cargo-zigbuild/0.20.0 crate://crates.io/cargo_metadata/0.19.0 crate://crates.io/cbindgen/0.29.0 crate://crates.io/cc/1.2.16 crate://crates.io/cfb/0.10.0 crate://crates.io/cfg-i
 f/1.0.0 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.9.3 crate://crates.io/clap/4.5.7 crate://crates.io/clap_builder/4.5.7 crate://crates.io/clap_complete/4.5.5 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.2 crate://crates.io/clap_derive/4.5.5 crate://crates.io/clap_lex/0.7.1 crate://crates.io/cli-table/0.4.7 crate://crates.io/colorchoice/1.0.1 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.8 crate://crates.io/console/0.16.0 crate://crates.io/content_inspector/0.2.4 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation-sys/0.8.6 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crc/3.2.1 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.4.2 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.5 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.20 crate://crates.io/crypto-common/0.1.6 crate://crates.io/data-
 encoding/2.6.0 crate://crates.io/deranged/0.3.11 crate://crates.io/derive_arbitrary/1.4.1 crate://crates.io/dialoguer/0.11.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/5.0.1 crate://crates.io/dirs-sys/0.4.1 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.9 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.17 crate://crates.io/either/1.13.0 crate://crates.io/encode_unicode/0.3.6 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.34 crate://crates.io/equivalent/1.0.1 crate://crates.io/errno/0.3.9 crate://crates.io/expect-test/1.5.0 crate://crates.io/fastrand/2.1.0 crate://crates.io/fat-macho/0.4.9 crate://crates.io/filetime/0.2.23 crate://crates.io/flate2/1.0.33 crate://crates.io/fnv/1.0.7 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.1 crate://crates.io/fs-err/3.0.0 crate://crates.io/fs4/0.12.0 crate://crates.io/fut
 ures/0.3.30 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-executor/0.3.30 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/getrandom/0.3.3 crate://crates.io/glob/0.3.1 crate://crates.io/globset/0.4.16 crate://crates.io/goblin/0.9.2 crate://crates.io/hashbrown/0.14.5 crate://crates.io/hashbrown/0.15.2 crate://crates.io/heck/0.5.0 crate://crates.io/home/0.5.9 crate://crates.io/humantime/2.1.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/1.5.0 crate://crates.io/icu_locid/1.5.0 crate://crates.io/icu_locid_transform/1.5.0 crate://crates.io/icu_locid_transform_data/1.5.0 crate://crates.io/icu_normalizer/1.5.0 crate://crates.io/icu_normal
 izer_data/1.5.0 crate://crates.io/icu_properties/1.5.1 crate://crates.io/icu_properties_data/1.5.0 crate://crates.io/icu_provider/1.5.0 crate://crates.io/icu_provider_macros/1.5.0 crate://crates.io/idna/1.0.3 crate://crates.io/idna_adapter/1.2.0 crate://crates.io/ignore/0.4.23 crate://crates.io/indexmap/2.6.0 crate://crates.io/indicatif/0.17.9 crate://crates.io/indoc/2.0.5 crate://crates.io/insta/1.43.1 crate://crates.io/is_terminal_polyfill/1.70.0 crate://crates.io/itertools/0.12.1 crate://crates.io/itertools/0.13.0 crate://crates.io/itoa/1.0.11 crate://crates.io/jobserver/0.1.33 crate://crates.io/js-sys/0.3.73 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.4.0 crate://crates.io/lddtree/0.3.7 crate://crates.io/libc/0.2.172 crate://crates.io/libmimalloc-sys/0.1.39 crate://crates.io/libredox/0.1.3 crate://crates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.4.14 crate://crates.io/litemap/0.7.3 crate://crates.io/lock_api/0.4.12 crate://crates.io/lockfree-o
 bject-pool/0.1.6 crate://crates.io/log/0.4.22 crate://crates.io/lzma-rs/0.3.0 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.5 crate://crates.io/mailparse/0.15.0 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.7.4 crate://crates.io/mimalloc/0.1.43 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.4 crate://crates.io/minijinja/2.5.0 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/miniz_oxide/0.8.0 crate://crates.io/msi/0.8.0 crate://crates.io/multipart/0.18.0 crate://crates.io/native-tls/0.2.12 crate://crates.io/nom/7.1.3 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.2.0 crate://crates.io/nu-ansi-term/0.50.1 crate://crates.io/num-conv/0.1.0 crate://crates.io/number_prefix/0.4.0 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.5 crate://crates.io/openssl-sys/0.9.107 crate://crates.io/option-ext/0.2.0 crate://crate
 s.io/os_pipe/1.2.0 crate://crates.io/parking_lot/0.12.3 crate://crates.io/parking_lot_core/0.9.10 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.1 crate://crates.io/pin-project-lite/0.2.15 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.30 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.0.5 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.17 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.1.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/psm/0.1.21 crate://crates.io/pyproject-toml/0.13.5 crate://crates.io/python-pkginfo/0.6.5 crate://crates.io/quote/1.0.37 crate://crates.io/quoted_printable/0.5.0 crate://crates.io/r-efi/5.2.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_core/0.6.4 crate:
 //crates.io/rayon/1.10.0 crate://crates.io/rayon-core/1.12.1 crate://crates.io/redox_syscall/0.4.1 crate://crates.io/redox_syscall/0.5.1 crate://crates.io/redox_users/0.4.5 crate://crates.io/regex/1.11.1 crate://crates.io/regex-automata/0.4.9 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.0.6 crate://crates.io/ring/0.17.13 crate://crates.io/rstest/0.22.0 crate://crates.io/rstest_macros/0.22.0 crate://crates.io/rustc-hash/2.0.0 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.6 crate://crates.io/rustix/0.38.41 crate://crates.io/rustls/0.23.19 crate://crates.io/rustls-pemfile/2.1.3 crate://crates.io/rustls-pki-types/1.10.0 crate://crates.io/rustls-webpki/0.102.8 crate://crates.io/rustversion/1.0.18 crate://crates.io/ryu/1.0.18 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.23 crate://crates.io/schemars/0.8.21 crate://crates.io/schemars_derive/0.8.21 crate://crates.io/scopeguard/1.2.0
  crate://crates.io/scroll/0.12.0 crate://crates.io/scroll_derive/0.12.0 crate://crates.io/security-framework/2.11.0 crate://crates.io/security-framework-sys/2.11.0 crate://crates.io/semver/1.0.23 crate://crates.io/serde/1.0.217 crate://crates.io/serde_derive/1.0.217 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.135 crate://crates.io/serde_spanned/0.6.8 crate://crates.io/sha2/0.10.8 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/similar/2.5.0 crate://crates.io/slab/0.4.9 crate://crates.io/smallvec/1.13.2 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.16 crate://crates.io/snapbox-macros/0.3.10 crate://crates.io/socks/0.3.4 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/stacker/0.1.15 crate://crates.io/static_assertions/1.1.0 crate://crates.io/strsim/0.11.1 crate://crates.io/subtle/2.5.0 crate://crates.io/syn/2.0.90
  crate://crates.io/synstructure/0.13.1 crate://crates.io/tar/0.4.43 crate://crates.io/target-lexicon/0.13.1 crate://crates.io/tempfile/3.11.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.3.0 crate://crates.io/textwrap/0.16.1 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.12 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.12 crate://crates.io/thread_local/1.1.8 crate://crates.io/time/0.3.36 crate://crates.io/time-core/0.1.2 crate://crates.io/time-macros/0.2.18 crate://crates.io/tinystr/0.7.6 crate://crates.io/toml/0.8.19 crate://crates.io/toml_datetime/0.6.8 crate://crates.io/toml_edit/0.21.1 crate://crates.io/toml_edit/0.22.22 crate://crates.io/tracing/0.1.41 crate://crates.io/tracing-attributes/0.1.28 crate://crates.io/tracing-core/0.1.33 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.20 crate://crates.io/trycmd/0.15.6 crate://crates.io/twox-ha
 sh/1.6.3 crate://crates.io/typenum/1.17.0 crate://crates.io/unicase/2.7.0 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.1.13 crate://crates.io/unicode-width/0.2.0 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/2.11.0 crate://crates.io/url/2.5.4 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf16_iter/1.0.5 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.8.0 crate://crates.io/valuable/0.1.0 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.1 crate://crates.io/version_check/0.9.4 crate://crates.io/versions/6.2.0 crate://crates.io/wait-timeout/0.2.0 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.2+wasi-0.2.4 crate://crates.io/wasm-bindgen/0.2.96 crate://crates.io/wasm-bindgen-backend/0.2.96 crate://crates.
 io/wasm-bindgen-macro/0.2.96 crate://crates.io/wasm-bindgen-macro-support/0.2.96 crate://crates.io/wasm-bindgen-shared/0.2.96 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-roots/0.26.2 crate://crates.io/which/7.0.0 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.8 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-sys/0.48.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.5 crate://crates.io/windows-targets/0.53.2 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.5 crate://crates.io/windows_aarch64_gnullvm/0.53.0 crate://crates.io/windows_aarch64_msvc/0.48.5 crate://crates.io/windows_aarch64_msvc/0.52.5 crate://crates.io/windows_aarch64_msvc/0.53.0 crate://crates.io/windows_i686_gnu/0.48.5 crate://c
 rates.io/windows_i686_gnu/0.52.5 crate://crates.io/windows_i686_gnu/0.53.0 crate://crates.io/windows_i686_gnullvm/0.52.5 crate://crates.io/windows_i686_gnullvm/0.53.0 crate://crates.io/windows_i686_msvc/0.48.5 crate://crates.io/windows_i686_msvc/0.52.5 crate://crates.io/windows_i686_msvc/0.53.0 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.5 crate://crates.io/windows_x86_64_gnu/0.53.0 crate://crates.io/windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gnullvm/0.52.5 crate://crates.io/windows_x86_64_gnullvm/0.53.0 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/windows_x86_64_msvc/0.52.5 crate://crates.io/windows_x86_64_msvc/0.53.0 crate://crates.io/winnow/0.5.40 crate://crates.io/winnow/0.6.20 crate://crates.io/winsafe/0.0.19 crate://crates.io/wit-bindgen-rt/0.39.0 crate://crates.io/write16/1.0.0 crate://crates.io/writeable/0.5.5 crate://crates.io/xattr/1.3.1 crate://crates.io/xwin/0.6.5 crate://crates.io/xz2/0.1.7 
 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.7.4 crate://crates.io/yoke-derive/0.7.5 crate://crates.io/zerocopy/0.7.35 crate://crates.io/zerocopy-derive/0.7.35 crate://crates.io/zerofrom/0.1.4 crate://crates.io/zerofrom-derive/0.1.5 crate://crates.io/zeroize/1.8.1 crate://crates.io/zerovec/0.10.4 crate://crates.io/zerovec-derive/0.10.3 crate://crates.io/zip/2.3.0 crate://crates.io/zopfli/0.8.1 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-maturin: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PKGSIZE changed from 6374448 to 5804736 (-9%)
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dev: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dev: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-doc: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-doc: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-locale: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-locale: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-src: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-src: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-staticdev: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-staticdev: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PV changed from "1.9.4" to "1.9.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PKGSIZE changed from 14597617 to 13983105 (-4%)
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PKGV changed from 1.9.4 [default] to 1.9.6 [default]
Changes to packages/x86-64-v3-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.13/site-packages/maturin-1.9.4.dist-info moved to /usr/lib/python3.13/site-packages/maturin-1.9.6.dist-info

--===============5742322912295143071==--

