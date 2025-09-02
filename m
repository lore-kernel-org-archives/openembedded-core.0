Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157C2CA100E
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.89792.1756850184412947288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=q7yo7EHN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YH8rgsYL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101990c6e6671-171da46f-5917-44ff-a76b-9643c6d2e05b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850185;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nwuDTkPwpt0XtecgMm/IqP4p8GYDiY6mXIeD9ZB2EB8=;
	b=q7yo7EHN4iRxJ2/E5PhpIDlS9bUcythdaLaAPaxwXpzyuTR6LsOGrZ29K2bEcJr1
	JLsh2O/X79mI8hNRyFGqhMuBh2PwDWDenqhPq4mnWvyhnZL0Q6Ero6dinv/2/YciIGD
	UzFuBhuKBbEui/SjQQMjw96+4mYtQeE1eRp/c/gw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850185;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nwuDTkPwpt0XtecgMm/IqP4p8GYDiY6mXIeD9ZB2EB8=;
	b=YH8rgsYL1RJ8DVE4HXmj+zqyeURtqBiTZ1aLn8kzXhWN5H7K/63Ls54SY64Zdgs8
	UOnnUg8kwdooTxAkN5omJBh8lFkT8yirDUQlH0QUt9sVHGvgdO3BPOdNfHw+xflEyIe
	laR7FIAiCad93A+RkKyo7XzGB0M7m2S6qjp3MOlw=
Content-Type: multipart/mixed; boundary="===============8865137834181086442=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bindgen-cli: upgrading to 0.72.1 SUCCEEDED
Message-ID: <010101990c6e6671-171da46f-5917-44ff-a76b-9643c6d2e05b-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222762

--===============8865137834181086442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bindgen-cli* to *0.72.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bindgen-cli-upgrade-0.72.0-0.72.1.patch
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
From c678bf3ea3eb37a276a988e636ba7e9237b8ba4a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 17:19:29 +0000
Subject: [PATCH] bindgen-cli: upgrade 0.72.0 -> 0.72.1

---
 .../{bindgen-cli_0.72.0.bb => bindgen-cli_0.72.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bindgen-cli/{bindgen-cli_0.72.0.bb => bindgen-cli_0.72.1.bb} (91%)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.0.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
similarity index 91%
rename from meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.0.bb
rename to meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
index b95faeabc0..2f3ec04e82 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.0.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0b9a98cb3dcdefcceb145324693fda9b"
 inherit rust cargo cargo-update-recipe-crates
 
 SRC_URI += "git://github.com/rust-lang/rust-bindgen.git;protocol=https;nobranch=1;tag=v${PV}"
-SRCREV = "d0e7d6b5b763e93dd38f9ece05230979ede95a0a"
+SRCREV = "d874de8d646d9b8a3e7ba2db2bcd52f2fba8f1f5"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============8865137834181086442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-dbg: PKGSIZE changed from 2903872 to 2900968 (-0%)
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-dbg: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-dbg: PV changed from "0.72.0" to "0.72.1"
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-dev: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-dev: PV changed from "0.72.0" to "0.72.1"
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-doc: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-doc: PV changed from "0.72.0" to "0.72.1"
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-locale: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-locale: PV changed from "0.72.0" to "0.72.1"
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-src: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-src: PV changed from "0.72.0" to "0.72.1"
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-staticdev: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli-staticdev: PV changed from "0.72.0" to "0.72.1"
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli: PKGSIZE changed from 7402152 to 7389864 (-0%)
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/x86-64-v3-poky-linux/bindgen-cli/bindgen-cli: PV changed from "0.72.0" to "0.72.1"
packages/x86-64-v3-poky-linux/bindgen-cli: SRC_URI changed from "git://github.com/rust-lang/rust-bindgen.git;protocol=https;nobranch=1;tag=v0.72.0 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/annotate-snippets/0.11.4 crate://crates.io/anstyle/1.0.10 crate://crates.io/autocfg/1.4.0 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.2.1 crate://crates.io/block/0.1.6 crate://crates.io/cc/1.2.2 crate://crates.io/cexpr/0.6.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/clang-sys/1.8.1 crate://crates.io/clap/4.1.4 crate://crates.io/clap_complete/4.2.0 crate://crates.io/clap_derive/4.1.0 crate://crates.io/clap_lex/0.3.1 crate://crates.io/either/1.13.0 crate://crates.io/env_logger/0.8.4 crate://crates.io/env_logger/0.10.0 crate://crates.io/errno/0.3.10 crate://crates.io/fastrand/1.9.0 crate://crates.io/getrandom/0.2.15 crate://crates.io/glob/0.3.1 crate://crates.io/heck/0.4.1 crate://crates.io/hermit-abi/0.3.9 crate://crates.io/hermit-abi/0.4.0 crate://crates.io/huma
 ntime/2.1.0 crate://crates.io/instant/0.1.12 crate://crates.io/io-lifetimes/1.0.11 crate://crates.io/is-terminal/0.4.13 crate://crates.io/itertools/0.13.0 crate://crates.io/libc/0.2.167 crate://crates.io/libloading/0.8.6 crate://crates.io/linux-raw-sys/0.3.8 crate://crates.io/log/0.4.22 crate://crates.io/malloc_buf/0.0.6 crate://crates.io/memchr/2.7.4 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/nom/7.1.3 crate://crates.io/objc/0.2.7 crate://crates.io/once_cell/1.20.2 crate://crates.io/os_str_bytes/6.4.1 crate://crates.io/owo-colors/4.1.0 crate://crates.io/prettyplease/0.2.25 crate://crates.io/proc-macro-error/1.0.4 crate://crates.io/proc-macro-error-attr/1.0.4 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/quickcheck/1.0.3 crate://crates.io/quote/1.0.37 crate://crates.io/rand/0.8.5 crate://crates.io/rand_core/0.6.4 crate://crates.io/redox_syscall/0.3.5 crate://crates.io/regex/1.11.1 crate://crates.io/regex-automata/0.4.9 crate://crates.io/regex-syntax/0.8.5 cra
 te://crates.io/rustc-hash/2.1.0 crate://crates.io/rustix/0.37.27 crate://crates.io/shlex/1.3.0 crate://crates.io/similar/2.6.0 crate://crates.io/strsim/0.10.0 crate://crates.io/syn/1.0.109 crate://crates.io/syn/2.0.90 crate://crates.io/tempfile/3.6.0 crate://crates.io/termcolor/1.2.0 crate://crates.io/unicode-ident/1.0.14 crate://crates.io/unicode-width/0.1.14 crate://crates.io/version_check/0.9.4 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.5 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-sys/0.48.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.48.5 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_
 i686_gnu/0.48.5 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.48.5 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/windows_x86_64_msvc/0.52.6" to "git://github.com/rust-lang/rust-bindgen.git;protocol=https;nobranch=1;tag=v0.72.1 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/annotate-snippets/0.11.4 crate://crates.io/anstyle/1.0.10 crate://crates.io/autocfg/1.4.0 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.2.1 crate://crates.io/block/0.1.6 crate://crates.io/cc/1.2.2 crate://crates.io/cexpr/0.6.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/clang-sys/1.8.1 crate://crates.io/clap/4.1.4 crate://crates.io/clap_complete/4.2.0 crate://crates.i
 o/clap_derive/4.1.0 crate://crates.io/clap_lex/0.3.1 crate://crates.io/either/1.13.0 crate://crates.io/env_logger/0.8.4 crate://crates.io/env_logger/0.10.0 crate://crates.io/errno/0.3.10 crate://crates.io/fastrand/1.9.0 crate://crates.io/getrandom/0.2.15 crate://crates.io/glob/0.3.1 crate://crates.io/heck/0.4.1 crate://crates.io/hermit-abi/0.3.9 crate://crates.io/hermit-abi/0.4.0 crate://crates.io/humantime/2.1.0 crate://crates.io/instant/0.1.12 crate://crates.io/io-lifetimes/1.0.11 crate://crates.io/is-terminal/0.4.13 crate://crates.io/itertools/0.13.0 crate://crates.io/libc/0.2.167 crate://crates.io/libloading/0.8.6 crate://crates.io/linux-raw-sys/0.3.8 crate://crates.io/log/0.4.22 crate://crates.io/malloc_buf/0.0.6 crate://crates.io/memchr/2.7.4 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/nom/7.1.3 crate://crates.io/objc/0.2.7 crate://crates.io/once_cell/1.20.2 crate://crates.io/os_str_bytes/6.4.1 crate://crates.io/owo-colors/4.1.0 crate://crates.io/prettyplease/0.2
 .25 crate://crates.io/proc-macro-error/1.0.4 crate://crates.io/proc-macro-error-attr/1.0.4 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/quickcheck/1.0.3 crate://crates.io/quote/1.0.37 crate://crates.io/rand/0.8.5 crate://crates.io/rand_core/0.6.4 crate://crates.io/redox_syscall/0.3.5 crate://crates.io/regex/1.11.1 crate://crates.io/regex-automata/0.4.9 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/rustc-hash/2.1.0 crate://crates.io/rustix/0.37.27 crate://crates.io/shlex/1.3.0 crate://crates.io/similar/2.6.0 crate://crates.io/strsim/0.10.0 crate://crates.io/syn/1.0.109 crate://crates.io/syn/2.0.90 crate://crates.io/tempfile/3.6.0 crate://crates.io/termcolor/1.2.0 crate://crates.io/unicode-ident/1.0.14 crate://crates.io/unicode-width/0.1.14 crate://crates.io/version_check/0.9.4 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.5 crate://crates.io/wi
 napi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-sys/0.48.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.48.5 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.48.5 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.48.5 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/windows_x86_64_msvc/0.52.6"
packages/x86-64-v3-poky-linux/bindgen-cli: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/x86-64-v3-poky-linux/bindgen-cli: PV changed from "0.72.0" to "0.72.1"

--===============8865137834181086442==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bindgen-cli-upgrade-0.72.0-0.72.1.patch"

RnJvbSBjNjc4YmYzZWEzZWIzN2EyNzZhOTg4ZTYzNmJhN2U5MjM3YjhiYTRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxNzoxOToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmRnZW4tY2xpOiB1cGdyYWRlIDAuNzIuMCAtPiAwLjcyLjEKCi0tLQogLi4uL3tiaW5kZ2VuLWNs
aV8wLjcyLjAuYmIgPT4gYmluZGdlbi1jbGlfMC43Mi4xLmJifSAgICAgICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2JpbmRnZW4tY2xpL3tiaW5kZ2VuLWNsaV8wLjcyLjAuYmIgPT4g
YmluZGdlbi1jbGlfMC43Mi4xLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9iaW5kZ2VuLWNsaS9iaW5kZ2VuLWNsaV8wLjcyLjAuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYmluZGdlbi1jbGkvYmluZGdlbi1jbGlfMC43Mi4xLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW5kZ2VuLWNsaS9iaW5k
Z2VuLWNsaV8wLjcyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW5kZ2Vu
LWNsaS9iaW5kZ2VuLWNsaV8wLjcyLjEuYmIKaW5kZXggYjk1ZmFlYWJjMC4uMmYzZWMwNGU4MiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbmRnZW4tY2xpL2JpbmRnZW4tY2xp
XzAuNzIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmluZGdlbi1jbGkvYmluZGdl
bi1jbGlfMC43Mi4xLmJiCkBAIC03LDcgKzcsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT0wYjlhOThjYjNkY2RlZmNjZWIxNDUzMjQ2OTNmZGE5YiIKIGluaGVyaXQg
cnVzdCBjYXJnbyBjYXJnby11cGRhdGUtcmVjaXBlLWNyYXRlcwogCiBTUkNfVVJJICs9ICJnaXQ6
Ly9naXRodWIuY29tL3J1c3QtbGFuZy9ydXN0LWJpbmRnZW4uZ2l0O3Byb3RvY29sPWh0dHBzO25v
YnJhbmNoPTE7dGFnPXYke1BWfSIKLVNSQ1JFViA9ICJkMGU3ZDZiNWI3NjNlOTNkZDM4ZjllY2Uw
NTIzMDk3OWVkZTk1YTBhIgorU1JDUkVWID0gImQ4NzRkZThkNjQ2ZDliOGEzZTdiYTJkYjJiY2Q1
MmYyZmJhOGYxZjUiCiAKIHJlcXVpcmUgJHtCUE59LWNyYXRlcy5pbmMKIAotLSAKMi40Ny4xCgo=

--===============8865137834181086442==--

