Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFA6CA1017
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.89797.1756850188430836352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ybwdmt0R;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hL+LyWc3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101990c6e775a-a01c5047-0036-43ad-b757-202d68da65f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850190;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZaENBvkpK5EpoaByl/QY6L5W+b6m34AS8J5ca+cDSXs=;
	b=Ybwdmt0RhZBfAHmUwIZWmtW6RS+sqRzldgP7MEJidk2yj264t7fYR8Q+33Uq13JG
	Wt3aA5ZBg5KbTs0f1ckGrtxQzj1uJM0i/HvwvEnjs5ArxDyG9zvC8AYEHkTRmnUtRp/
	8WDpAjeKw1OfF5b9TyYJbTr6PN/bUhbx1D2u2mKg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850190;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZaENBvkpK5EpoaByl/QY6L5W+b6m34AS8J5ca+cDSXs=;
	b=hL+LyWc3wj0Cvp2AwexZ5gm+NmRUNHgZV1lBA8a8uh0W7xZXojXahM8Ef00aNF+F
	4pmcnGvUlw/hrz2j3TM4GGz6l3HJnz/oYqDfwEEEp2Yev+f+hFSekU2kpCxB6zysdoe
	NHAHdwJCg6kHslyuHQU7I7zc4P0AQ8we6H8d9XSo=
Content-Type: multipart/mixed; boundary="===============8155304041201717543=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-maturin: upgrading to 1.9.4 SUCCEEDED
Message-ID: <010101990c6e775a-a01c5047-0036-43ad-b757-202d68da65f0-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222782

--===============8155304041201717543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-maturin* to *1.9.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-maturin-upgrade-1.9.3-1.9.4.patch
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
From 7b2c3b5606244bd9789736f042d3ad2c20ed1b44 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 18:24:18 +0000
Subject: [PATCH] python3-maturin: upgrade 1.9.3 -> 1.9.4

---
 .../{python3-maturin_1.9.3.bb => python3-maturin_1.9.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.9.3.bb => python3-maturin_1.9.4.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin_1.9.3.bb b/meta/recipes-devtools/python/python3-maturin_1.9.4.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.9.3.bb
rename to meta/recipes-devtools/python/python3-maturin_1.9.4.bb
index eca474af66..f47c8061bb 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.9.3.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.9.4.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "267ac8d0471d1ee2320b8b2ee36f400a32cd2492d7becbd0d976bd3503c2f69b"
+SRC_URI[sha256sum] = "235163a0c99bc6f380fb8786c04fd14dcf6cd622ff295ea3de525015e6ac40cf"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.47.1


--===============8155304041201717543==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-maturin-upgrade-1.9.3-1.9.4.patch"

RnJvbSA3YjJjM2I1NjA2MjQ0YmQ5Nzg5NzM2ZjA0MmQzYWQyYzIwZWQxYjQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxODoyNDoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWF0dXJpbjogdXBncmFkZSAxLjkuMyAtPiAxLjkuNAoKLS0tCiAuLi4ve3B5dGhvbjMt
bWF0dXJpbl8xLjkuMy5iYiA9PiBweXRob24zLW1hdHVyaW5fMS45LjQuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1hdHVyaW5fMS45LjMuYmIgPT4g
cHl0aG9uMy1tYXR1cmluXzEuOS40LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuOS4zLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW5fMS45LjQuYmIKc2ltaWxhcml0eSBpbmRl
eCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1h
dHVyaW5fMS45LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1tYXR1cmluXzEuOS40LmJiCmluZGV4IGVjYTQ3NGFmNjYuLmY0N2M4MDYxYmIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuOS4z
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEu
OS40LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIk1JVCB8IEFwYWNoZS0yLjAiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9saWNlbnNlLWFwYWNoZTttZDU9MTgzNmVmYjJlYjc3OTk2
NjY5NmY0NzNlZTg1NDA1NDIgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGljZW5zZS1t
aXQ7bWQ1PTg1ZmQzYjY3MDY5Y2ZmNzg0ZDk4ZWJmYzdkNWMwNzk3IgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMjY3YWM4ZDA0NzFkMWVlMjMyMGI4YjJlZTM2ZjQwMGEzMmNkMjQ5MmQ3YmVjYmQw
ZDk3NmJkMzUwM2MyZjY5YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMzUxNjNhMGM5OWJjNmYz
ODBmYjg3ODZjMDRmZDE0ZGNmNmNkNjIyZmYyOTVlYTNkZTUyNTAxNWU2YWM0MGNmIgogCiBTID0g
IiR7VU5QQUNLRElSfS9tYXR1cmluLSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============8155304041201717543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-maturin: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.9.3.tar.gz;downloadfilename=maturin-1.9.3.tar.gz crate://crates.io/adler2/2.0.0 crate://crates.io/ahash/0.8.11 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.18 crate://crates.io/anstream/0.6.14 crate://crates.io/anstyle/1.0.7 crate://crates.io/anstyle-parse/0.2.4 crate://crates.io/anstyle-query/1.1.0 crate://crates.io/anstyle-wincon/3.0.3 crate://crates.io/anyhow/1.0.89 crate://crates.io/arbitrary/1.4.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/automod/1.0.14 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.5.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.8 crate://crates.io/bstr/1.10.0 crate://crates.io/bumpalo/3.16.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.9.0 crate://crates.io/bytesize/1.3.0 cra
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
 o/xattr/1.3.1 crate://crates.io/xwin/0.6.5 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.7.4 crate://crates.io/yoke-derive/0.7.5 crate://crates.io/zerocopy/0.7.35 crate://crates.io/zerocopy-derive/0.7.35 crate://crates.io/zerofrom/0.1.4 crate://crates.io/zerofrom-derive/0.1.5 crate://crates.io/zeroize/1.8.1 crate://crates.io/zerovec/0.10.4 crate://crates.io/zerovec-derive/0.10.3 crate://crates.io/zip/2.3.0 crate://crates.io/zopfli/0.8.1 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.9.4.tar.gz;downloadfilename=maturin-1.9.4.tar.gz crate://crates.io/adler2/2.0.0 crate://crates.io/ahash/0.8.11 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.18 crate://crates.io/anstream/0.6.14 crate://crates.io/anstyle/1.0.7 crate://crates.io/anstyle-parse/0.2.4 crate://crates.io/anstyle-query/1.1.0 crate://
 crates.io/anstyle-wincon/3.0.3 crate://crates.io/anyhow/1.0.89 crate://crates.io/arbitrary/1.4.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/automod/1.0.14 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.5.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.8 crate://crates.io/bstr/1.10.0 crate://crates.io/bumpalo/3.16.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.9.0 crate://crates.io/bytesize/1.3.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.1.9 crate://crates.io/cargo-config2/0.1.26 crate://crates.io/cargo-options/0.7.4 crate://crates.io/cargo-platform/0.1.8 crate://crates.io/cargo-xwin/0.18.6 crate://crates.io/cargo-zigbuild/0.20.0 crate://crates.io/cargo_metadata/0.19.0 crate://crates.io/cbindgen/0.29.0 crate://crates.io/cc/1.2.16 crate://crates.io/cfb/0.10.0 crate://crates.io/cfg-i
 f/1.0.0 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.9.3 crate://crates.io/clap/4.5.7 crate://crates.io/clap_builder/4.5.7 crate://crates.io/clap_complete/4.5.5 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.2 crate://crates.io/clap_derive/4.5.5 crate://crates.io/clap_lex/0.7.1 crate://crates.io/cli-table/0.4.7 crate://crates.io/colorchoice/1.0.1 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.8 crate://crates.io/content_inspector/0.2.4 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation-sys/0.8.6 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crc/3.2.1 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.4.2 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.5 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.20 crate://crates.io/crypto-common/0.1.6 crate://crates.io/data-encoding/2.6.0 crate://crates.io/
 deranged/0.3.11 crate://crates.io/derive_arbitrary/1.4.1 crate://crates.io/dialoguer/0.11.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/5.0.1 crate://crates.io/dirs-sys/0.4.1 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.9 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.17 crate://crates.io/either/1.13.0 crate://crates.io/encode_unicode/0.3.6 crate://crates.io/encoding_rs/0.8.34 crate://crates.io/equivalent/1.0.1 crate://crates.io/errno/0.3.9 crate://crates.io/expect-test/1.5.0 crate://crates.io/fastrand/2.1.0 crate://crates.io/fat-macho/0.4.9 crate://crates.io/filetime/0.2.23 crate://crates.io/flate2/1.0.33 crate://crates.io/fnv/1.0.7 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.1 crate://crates.io/fs-err/3.0.0 crate://crates.io/fs4/0.12.0 crate://crates.io/futures/0.3.30 crate://crates.io/futures-channel/0.3.31 crate://crates.io/f
 utures-core/0.3.31 crate://crates.io/futures-executor/0.3.30 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/getrandom/0.3.3 crate://crates.io/glob/0.3.1 crate://crates.io/globset/0.4.16 crate://crates.io/goblin/0.9.2 crate://crates.io/hashbrown/0.14.5 crate://crates.io/hashbrown/0.15.2 crate://crates.io/heck/0.5.0 crate://crates.io/home/0.5.9 crate://crates.io/humantime/2.1.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/1.5.0 crate://crates.io/icu_locid/1.5.0 crate://crates.io/icu_locid_transform/1.5.0 crate://crates.io/icu_locid_transform_data/1.5.0 crate://crates.io/icu_normalizer/1.5.0 crate://crates.io/icu_normalizer_data/1.5.0 crate://crates.io/icu_properties/1.5.1 crate://crates.io
 /icu_properties_data/1.5.0 crate://crates.io/icu_provider/1.5.0 crate://crates.io/icu_provider_macros/1.5.0 crate://crates.io/idna/1.0.3 crate://crates.io/idna_adapter/1.2.0 crate://crates.io/ignore/0.4.23 crate://crates.io/indexmap/2.6.0 crate://crates.io/indicatif/0.17.9 crate://crates.io/indoc/2.0.5 crate://crates.io/insta/1.43.1 crate://crates.io/is_terminal_polyfill/1.70.0 crate://crates.io/itertools/0.12.1 crate://crates.io/itertools/0.13.0 crate://crates.io/itoa/1.0.11 crate://crates.io/jobserver/0.1.33 crate://crates.io/js-sys/0.3.73 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.4.0 crate://crates.io/lddtree/0.3.7 crate://crates.io/libc/0.2.172 crate://crates.io/libmimalloc-sys/0.1.39 crate://crates.io/libredox/0.1.3 crate://crates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.4.14 crate://crates.io/litemap/0.7.3 crate://crates.io/lock_api/0.4.12 crate://crates.io/lockfree-object-pool/0.1.6 crate://crates.io/log/0.4.22 crate://crates.io/lzma-rs/
 0.3.0 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.5 crate://crates.io/mailparse/0.15.0 crate://crates.io/matchers/0.1.0 crate://crates.io/memchr/2.7.4 crate://crates.io/mimalloc/0.1.43 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.4 crate://crates.io/minijinja/2.5.0 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/miniz_oxide/0.8.0 crate://crates.io/msi/0.8.0 crate://crates.io/multipart/0.18.0 crate://crates.io/native-tls/0.2.12 crate://crates.io/nom/7.1.3 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.2.0 crate://crates.io/nu-ansi-term/0.46.0 crate://crates.io/num-conv/0.1.0 crate://crates.io/number_prefix/0.4.0 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.5 crate://crates.io/openssl-sys/0.9.107 crate://crates.io/option-ext/0.2.0 crate://crates.io/os_pipe/1.2.0 crate://crates.io/overload/0.1.1 crate://crates.io/pa
 rking_lot/0.12.3 crate://crates.io/parking_lot_core/0.9.10 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.1 crate://crates.io/pin-project-lite/0.2.15 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.30 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.0.5 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.17 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.1.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/psm/0.1.21 crate://crates.io/pyproject-toml/0.13.5 crate://crates.io/python-pkginfo/0.6.5 crate://crates.io/quote/1.0.37 crate://crates.io/quoted_printable/0.5.0 crate://crates.io/r-efi/5.2.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.10.0 crate://crates
 .io/rayon-core/1.12.1 crate://crates.io/redox_syscall/0.4.1 crate://crates.io/redox_syscall/0.5.1 crate://crates.io/redox_users/0.4.5 crate://crates.io/regex/1.11.1 crate://crates.io/regex-automata/0.1.10 crate://crates.io/regex-automata/0.4.9 crate://crates.io/regex-syntax/0.6.29 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.0.6 crate://crates.io/ring/0.17.13 crate://crates.io/rstest/0.22.0 crate://crates.io/rstest_macros/0.22.0 crate://crates.io/rustc-hash/2.0.0 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.6 crate://crates.io/rustix/0.38.41 crate://crates.io/rustls/0.23.19 crate://crates.io/rustls-pemfile/2.1.3 crate://crates.io/rustls-pki-types/1.10.0 crate://crates.io/rustls-webpki/0.102.8 crate://crates.io/rustversion/1.0.18 crate://crates.io/ryu/1.0.18 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.23 crate://crates.io/schemars/0.8.21 crate://crates.io/schemars_derive/0.
 8.21 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.12.0 crate://crates.io/scroll_derive/0.12.0 crate://crates.io/security-framework/2.11.0 crate://crates.io/security-framework-sys/2.11.0 crate://crates.io/semver/1.0.23 crate://crates.io/serde/1.0.217 crate://crates.io/serde_derive/1.0.217 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.135 crate://crates.io/serde_spanned/0.6.8 crate://crates.io/sha2/0.10.8 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/similar/2.5.0 crate://crates.io/slab/0.4.9 crate://crates.io/smallvec/1.13.2 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.16 crate://crates.io/snapbox-macros/0.3.10 crate://crates.io/socks/0.3.4 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/stacker/0.1.15 crate://crates.io/static_assertions/1.1.0 crate://crates.io/strsim/0.11.1 crate://crates.io/su
 btle/2.5.0 crate://crates.io/syn/2.0.90 crate://crates.io/synstructure/0.13.1 crate://crates.io/tar/0.4.43 crate://crates.io/target-lexicon/0.13.1 crate://crates.io/tempfile/3.11.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.3.0 crate://crates.io/textwrap/0.16.1 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.12 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.12 crate://crates.io/thread_local/1.1.8 crate://crates.io/time/0.3.36 crate://crates.io/time-core/0.1.2 crate://crates.io/time-macros/0.2.18 crate://crates.io/tinystr/0.7.6 crate://crates.io/toml/0.8.19 crate://crates.io/toml_datetime/0.6.8 crate://crates.io/toml_edit/0.21.1 crate://crates.io/toml_edit/0.22.22 crate://crates.io/tracing/0.1.41 crate://crates.io/tracing-attributes/0.1.28 crate://crates.io/tracing-core/0.1.33 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.19 crate://crates.io/
 trycmd/0.15.6 crate://crates.io/twox-hash/1.6.3 crate://crates.io/typenum/1.17.0 crate://crates.io/unicase/2.7.0 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.1.13 crate://crates.io/unicode-width/0.2.0 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/2.11.0 crate://crates.io/url/2.5.4 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf16_iter/1.0.5 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.8.0 crate://crates.io/valuable/0.1.0 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.1 crate://crates.io/version_check/0.9.4 crate://crates.io/versions/6.2.0 crate://crates.io/wait-timeout/0.2.0 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.2+wasi-0.2.4 crate://crates.io/wasm-bindgen/0.2.96 crate://crates.io/wasm
 -bindgen-backend/0.2.96 crate://crates.io/wasm-bindgen-macro/0.2.96 crate://crates.io/wasm-bindgen-macro-support/0.2.96 crate://crates.io/wasm-bindgen-shared/0.2.96 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-roots/0.26.2 crate://crates.io/which/7.0.0 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.8 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-sys/0.48.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.5 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.5 crate://crates.io/windows_aarch64_msvc/0.48.5 crate://crates.io/windows_aarch64_msvc/0.52.5 crate://crates.io/windows_i686_gnu/0.48.5 crate://crates.io/windows_i686_gnu/0.52.5 crate://crates.io/windows_i686_gnullvm/0.52.5 crate://crates.io/windows_i686_msvc/0.48.5 crate://crat
 es.io/windows_i686_msvc/0.52.5 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.5 crate://crates.io/windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gnullvm/0.52.5 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/windows_x86_64_msvc/0.52.5 crate://crates.io/winnow/0.5.40 crate://crates.io/winnow/0.6.20 crate://crates.io/winsafe/0.0.19 crate://crates.io/wit-bindgen-rt/0.39.0 crate://crates.io/write16/1.0.0 crate://crates.io/writeable/0.5.5 crate://crates.io/xattr/1.3.1 crate://crates.io/xwin/0.6.5 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.7.4 crate://crates.io/yoke-derive/0.7.5 crate://crates.io/zerocopy/0.7.35 crate://crates.io/zerocopy-derive/0.7.35 crate://crates.io/zerofrom/0.1.4 crate://crates.io/zerofrom-derive/0.1.5 crate://crates.io/zeroize/1.8.1 crate://crates.io/zerovec/0.10.4 crate://crates.io/zerovec-derive/0.10.3 crate://crates.io/zip/2.3.0 crate://crates.io/zopfli/0
 .8.1 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-maturin: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/python3-maturin: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PKGSIZE changed from 6390704 to 6396264 (+0%)
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dev: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dev: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-doc: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-doc: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-locale: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-locale: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-src: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-src: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-staticdev: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-staticdev: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PKGSIZE changed from 14748528 to 14757105 (+0%)
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PV changed from "1.9.3" to "1.9.4"
Changes to packages/x86-64-v3-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.13/site-packages/maturin-1.9.3.dist-info moved to /usr/lib/python3.13/site-packages/maturin-1.9.4.dist-info

--===============8155304041201717543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.13/site-packages/maturin-1.9.3.dist-info moved to /usr/lib/python3.13/site-packages/maturin-1.9.4.dist-info

--===============8155304041201717543==--

