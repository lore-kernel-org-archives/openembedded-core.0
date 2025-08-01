Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42933CA0EE1
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.88631.1754057268575607682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cGOhZeDe;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qdp+zF1x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019865f5f132-1e098525-cf3b-4ce9-a454-c9335bbf4e3e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oTv6Wy2kJJT/aIbkUKh2vEpiqKzA/bMxTSL0ah6V8Qw=;
	b=cGOhZeDeWUppGByfz/p+JYPP5E4FEWZugAL9bSuiQj4AWVZyxfIgT3P69Mn9oneV
	o9k1539r44xuNPrlbIazAFAk/zemg+kMvFRWpWOwTCasw2/KW4cmSRYZmo3ZZ/FeecE
	bEZY2nIPDVhW4C26AtyvYhfE16q3tBLF6aeBPMt8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oTv6Wy2kJJT/aIbkUKh2vEpiqKzA/bMxTSL0ah6V8Qw=;
	b=qdp+zF1xqwe/GN8YXpSsYP4OZ2hRuo6zMCkKJT3ATOW+nrWQKzjKGwmDZwwB/2DH
	sczDEw5ybXHwVBJzJwJmQMBZRWJJSeup2ZqcLnlNj4vHPecQr1DAZiCauwIwt2AtsyV
	6xTzp+HwM9LyJl1ckl0sOoG96mJa5jQcCQzbxPy0=
Content-Type: multipart/mixed; boundary="===============4724198229801392332=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-maturin: upgrading to 1.9.2 SUCCEEDED
Message-ID: <0101019865f5f132-1e098525-cf3b-4ce9-a454-c9335bbf4e3e-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221281

--===============4724198229801392332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-maturin* to *1.9.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-maturin-upgrade-1.9.1-1.9.2.patch
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
From 120d9214fc8778a436a1d7963701b1ce10f830d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 09:49:48 +0000
Subject: [PATCH] python3-maturin: upgrade 1.9.1 -> 1.9.2

---
 .../{python3-maturin_1.9.1.bb => python3-maturin_1.9.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.9.1.bb => python3-maturin_1.9.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin_1.9.1.bb b/meta/recipes-devtools/python/python3-maturin_1.9.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.9.1.bb
rename to meta/recipes-devtools/python/python3-maturin_1.9.2.bb
index ce38e93136..84e74cc591 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.9.1.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.9.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "97b52fb19d20c1fdc70e4efdc05d79853a4c9c0051030c93a793cd5181dc4ccd"
+SRC_URI[sha256sum] = "8b534d3a8acb922fc7a01ec89c12ba950dccdc11b57457c1d4c2661ae24bf96d"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.47.1


--===============4724198229801392332==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-maturin-upgrade-1.9.1-1.9.2.patch"

RnJvbSAxMjBkOTIxNGZjODc3OGE0MzZhMWQ3OTYzNzAxYjFjZTEwZjgzMGQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwOTo0OTo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWF0dXJpbjogdXBncmFkZSAxLjkuMSAtPiAxLjkuMgoKLS0tCiAuLi4ve3B5dGhvbjMt
bWF0dXJpbl8xLjkuMS5iYiA9PiBweXRob24zLW1hdHVyaW5fMS45LjIuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1hdHVyaW5fMS45LjEuYmIgPT4g
cHl0aG9uMy1tYXR1cmluXzEuOS4yLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuOS4xLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW5fMS45LjIuYmIKc2ltaWxhcml0eSBpbmRl
eCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1h
dHVyaW5fMS45LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1tYXR1cmluXzEuOS4yLmJiCmluZGV4IGNlMzhlOTMxMzYuLjg0ZTc0Y2M1OTEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuOS4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEu
OS4yLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIk1JVCB8IEFwYWNoZS0yLjAiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9saWNlbnNlLWFwYWNoZTttZDU9MTgzNmVmYjJlYjc3OTk2
NjY5NmY0NzNlZTg1NDA1NDIgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGljZW5zZS1t
aXQ7bWQ1PTg1ZmQzYjY3MDY5Y2ZmNzg0ZDk4ZWJmYzdkNWMwNzk3IgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiOTdiNTJmYjE5ZDIwYzFmZGM3MGU0ZWZkYzA1ZDc5ODUzYTRjOWMwMDUxMDMwYzkz
YTc5M2NkNTE4MWRjNGNjZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4YjUzNGQzYThhY2I5MjJm
YzdhMDFlYzg5YzEyYmE5NTBkY2NkYzExYjU3NDU3YzFkNGMyNjYxYWUyNGJmOTZkIgogCiBTID0g
IiR7VU5QQUNLRElSfS9tYXR1cmluLSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============4724198229801392332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-maturin: PV changed from "1.9.1" to "1.9.2"
packages/core2-64-poky-linux/python3-maturin: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/core2-64-poky-linux/python3-maturin: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.9.1.tar.gz;downloadfilename=maturin-1.9.1.tar.gz crate://crates.io/adler2/2.0.0 crate://crates.io/ahash/0.8.11 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.18 crate://crates.io/anstream/0.6.14 crate://crates.io/anstyle/1.0.7 crate://crates.io/anstyle-parse/0.2.4 crate://crates.io/anstyle-query/1.1.0 crate://crates.io/anstyle-wincon/3.0.3 crate://crates.io/anyhow/1.0.89 crate://crates.io/arbitrary/1.4.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/automod/1.0.14 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.5.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.8 crate://crates.io/bstr/1.10.0 crate://crates.io/bumpalo/3.16.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.9.0 crate://crates.io/bytesize/1.3.0 crat
 e://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.1.9 crate://crates.io/cargo-config2/0.1.26 crate://crates.io/cargo-options/0.7.4 crate://crates.io/cargo-platform/0.1.8 crate://crates.io/cargo-xwin/0.18.6 crate://crates.io/cargo-zigbuild/0.20.0 crate://crates.io/cargo_metadata/0.19.0 crate://crates.io/cbindgen/0.29.0 crate://crates.io/cc/1.2.16 crate://crates.io/cfb/0.10.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.9.3 crate://crates.io/clap/4.5.7 crate://crates.io/clap_builder/4.5.7 crate://crates.io/clap_complete/4.5.5 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.2 crate://crates.io/clap_derive/4.5.5 crate://crates.io/clap_lex/0.7.1 crate://crates.io/cli-table/0.4.7 crate://crates.io/colorchoice/1.0.1 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.8 crate://crates.io/content_inspector/0.2.4 crate:
 //crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation-sys/0.8.6 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crc/3.2.1 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.4.2 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.5 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.20 crate://crates.io/crypto-common/0.1.6 crate://crates.io/data-encoding/2.6.0 crate://crates.io/deranged/0.3.11 crate://crates.io/derive_arbitrary/1.4.1 crate://crates.io/dialoguer/0.11.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/5.0.1 crate://crates.io/dirs-sys/0.4.1 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.9 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.17 crate://crates.io/either/1.13.0 crate://crates.io/encode_unicode/0.3.6 crate://crates.io/encoding_rs/0.8.34 crate://crates.io/equivalent/1.0.1 crate://crates.io/errno/0.3.9 c
 rate://crates.io/expect-test/1.5.0 crate://crates.io/fastrand/2.1.0 crate://crates.io/fat-macho/0.4.9 crate://crates.io/filetime/0.2.23 crate://crates.io/flate2/1.0.33 crate://crates.io/fnv/1.0.7 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.1 crate://crates.io/fs-err/3.0.0 crate://crates.io/fs4/0.12.0 crate://crates.io/futures/0.3.30 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-executor/0.3.30 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/getrandom/0.3.3 crate://crates.io/glob/0.3.1 crate://crates.io/globset/0.4.16 crate://crates.io/goblin/0.9.2 crate://crates.io/hashbrown/0.14.5 c
 rate://crates.io/hashbrown/0.15.2 crate://crates.io/heck/0.5.0 crate://crates.io/home/0.5.9 crate://crates.io/humantime/2.1.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/1.5.0 crate://crates.io/icu_locid/1.5.0 crate://crates.io/icu_locid_transform/1.5.0 crate://crates.io/icu_locid_transform_data/1.5.0 crate://crates.io/icu_normalizer/1.5.0 crate://crates.io/icu_normalizer_data/1.5.0 crate://crates.io/icu_properties/1.5.1 crate://crates.io/icu_properties_data/1.5.0 crate://crates.io/icu_provider/1.5.0 crate://crates.io/icu_provider_macros/1.5.0 crate://crates.io/idna/1.0.3 crate://crates.io/idna_adapter/1.2.0 crate://crates.io/ignore/0.4.23 crate://crates.io/indexmap/2.6.0 crate://crates.io/indicatif/0.17.9 crate://crates.io/indoc/2.0.5 crate://crates.io/insta/1.43.1 crate://crates.io/is_terminal_polyfill/1.70.0 crate://crates.io/itertools/0.12.1 crate://crates.io/itertools/0.13.0 crate://crates.io/itoa/1.0.11 crate://crates.io/jobserver/0.1.33 crate://c
 rates.io/js-sys/0.3.73 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.4.0 crate://crates.io/lddtree/0.3.7 crate://crates.io/libc/0.2.172 crate://crates.io/libmimalloc-sys/0.1.39 crate://crates.io/libredox/0.1.3 crate://crates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.4.14 crate://crates.io/litemap/0.7.3 crate://crates.io/lock_api/0.4.12 crate://crates.io/lockfree-object-pool/0.1.6 crate://crates.io/log/0.4.22 crate://crates.io/lzma-rs/0.3.0 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.5 crate://crates.io/mailparse/0.15.0 crate://crates.io/matchers/0.1.0 crate://crates.io/memchr/2.7.4 crate://crates.io/mimalloc/0.1.43 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.4 crate://crates.io/minijinja/2.5.0 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/miniz_oxide/0.8.0 crate://crates.io/msi/0.8.0 crate://crates.io/multipart/0.18.0 crate://crates.io/native-tls/0.2.12 crate://crates.io/nom/7.1.3 crate://crates.io/nor
 malize-line-endings/0.3.0 crate://crates.io/normpath/1.2.0 crate://crates.io/nu-ansi-term/0.46.0 crate://crates.io/num-conv/0.1.0 crate://crates.io/number_prefix/0.4.0 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.5 crate://crates.io/openssl-sys/0.9.107 crate://crates.io/option-ext/0.2.0 crate://crates.io/os_pipe/1.2.0 crate://crates.io/overload/0.1.1 crate://crates.io/parking_lot/0.12.3 crate://crates.io/parking_lot_core/0.9.10 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.1 crate://crates.io/pin-project-lite/0.2.15 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.30 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.0.5 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.17 cr
 ate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.1.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/psm/0.1.21 crate://crates.io/pyproject-toml/0.13.5 crate://crates.io/python-pkginfo/0.6.5 crate://crates.io/quote/1.0.37 crate://crates.io/quoted_printable/0.5.0 crate://crates.io/r-efi/5.2.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.10.0 crate://crates.io/rayon-core/1.12.1 crate://crates.io/redox_syscall/0.4.1 crate://crates.io/redox_syscall/0.5.1 crate://crates.io/redox_users/0.4.5 crate://crates.io/regex/1.11.1 crate://crates.io/regex-automata/0.1.10 crate://crates.io/regex-automata/0.4.9 crate://crates.io/regex-syntax/0.6.29 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.0.6 crate://crates.io/ring/0.17.13 crate://crates.io/rstest/0.22.0 crate://crates.io/rstest_macros/0.22.0 crate://crates.io/rustc-ha
 sh/2.0.0 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.6 crate://crates.io/rustix/0.38.41 crate://crates.io/rustls/0.23.19 crate://crates.io/rustls-pemfile/2.1.3 crate://crates.io/rustls-pki-types/1.10.0 crate://crates.io/rustls-webpki/0.102.8 crate://crates.io/rustversion/1.0.18 crate://crates.io/ryu/1.0.18 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.23 crate://crates.io/schemars/0.8.21 crate://crates.io/schemars_derive/0.8.21 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.12.0 crate://crates.io/scroll_derive/0.12.0 crate://crates.io/security-framework/2.11.0 crate://crates.io/security-framework-sys/2.11.0 crate://crates.io/semver/1.0.23 crate://crates.io/serde/1.0.217 crate://crates.io/serde_derive/1.0.217 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.135 crate://crates.io/serde_spanned/0.6.8 crate://crates.io/sha2/0.10.8 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words
 /1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/similar/2.5.0 crate://crates.io/slab/0.4.9 crate://crates.io/smallvec/1.13.2 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.16 crate://crates.io/snapbox-macros/0.3.10 crate://crates.io/socks/0.3.4 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/stacker/0.1.15 crate://crates.io/static_assertions/1.1.0 crate://crates.io/strsim/0.11.1 crate://crates.io/subtle/2.5.0 crate://crates.io/syn/2.0.90 crate://crates.io/synstructure/0.13.1 crate://crates.io/tar/0.4.43 crate://crates.io/target-lexicon/0.13.1 crate://crates.io/tempfile/3.11.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.3.0 crate://crates.io/textwrap/0.16.1 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.12 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.12 crate://crates.io/thread_local/1.1.8 crate://crates.io/time/0.3.36 crate://crates.io/tim
 e-core/0.1.2 crate://crates.io/time-macros/0.2.18 crate://crates.io/tinystr/0.7.6 crate://crates.io/toml/0.8.19 crate://crates.io/toml_datetime/0.6.8 crate://crates.io/toml_edit/0.21.1 crate://crates.io/toml_edit/0.22.22 crate://crates.io/tracing/0.1.41 crate://crates.io/tracing-attributes/0.1.28 crate://crates.io/tracing-core/0.1.33 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.19 crate://crates.io/trycmd/0.15.6 crate://crates.io/twox-hash/1.6.3 crate://crates.io/typenum/1.17.0 crate://crates.io/unicase/2.7.0 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.1.13 crate://crates.io/unicode-width/0.2.0 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/2.11.0 crate://crates.io/url/2.5.4 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf16_iter/1.0.5 crate://crates.io/utf8
 _iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.8.0 crate://crates.io/valuable/0.1.0 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.1 crate://crates.io/version_check/0.9.4 crate://crates.io/versions/6.2.0 crate://crates.io/wait-timeout/0.2.0 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.2+wasi-0.2.4 crate://crates.io/wasm-bindgen/0.2.96 crate://crates.io/wasm-bindgen-backend/0.2.96 crate://crates.io/wasm-bindgen-macro/0.2.96 crate://crates.io/wasm-bindgen-macro-support/0.2.96 crate://crates.io/wasm-bindgen-shared/0.2.96 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-roots/0.26.2 crate://crates.io/which/7.0.0 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.8 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-sys/0.48.0 crate://crates.io/wind
 ows-sys/0.52.0 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.5 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.5 crate://crates.io/windows_aarch64_msvc/0.48.5 crate://crates.io/windows_aarch64_msvc/0.52.5 crate://crates.io/windows_i686_gnu/0.48.5 crate://crates.io/windows_i686_gnu/0.52.5 crate://crates.io/windows_i686_gnullvm/0.52.5 crate://crates.io/windows_i686_msvc/0.48.5 crate://crates.io/windows_i686_msvc/0.52.5 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.5 crate://crates.io/windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gnullvm/0.52.5 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/windows_x86_64_msvc/0.52.5 crate://crates.io/winnow/0.5.40 crate://crates.io/winnow/0.6.20 crate://crates.io/winsafe/0.0.19 crate://crates.io/wit-bindgen-rt/0.39.0 crate://crates.io/write16/1.0.0 crate://crates.io/writeable/0.5.5 crate://crates.io
 /xattr/1.3.1 crate://crates.io/xwin/0.6.5 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.7.4 crate://crates.io/yoke-derive/0.7.5 crate://crates.io/zerocopy/0.7.35 crate://crates.io/zerocopy-derive/0.7.35 crate://crates.io/zerofrom/0.1.4 crate://crates.io/zerofrom-derive/0.1.5 crate://crates.io/zeroize/1.8.1 crate://crates.io/zerovec/0.10.4 crate://crates.io/zerovec-derive/0.10.3 crate://crates.io/zip/2.3.0 crate://crates.io/zopfli/0.8.1 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.9.2.tar.gz;downloadfilename=maturin-1.9.2.tar.gz crate://crates.io/adler2/2.0.0 crate://crates.io/ahash/0.8.11 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.18 crate://crates.io/anstream/0.6.14 crate://crates.io/anstyle/1.0.7 crate://crates.io/anstyle-parse/0.2.4 crate://crates.io/anstyle-query/1.1.0 crate://c
 rates.io/anstyle-wincon/3.0.3 crate://crates.io/anyhow/1.0.89 crate://crates.io/arbitrary/1.4.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/automod/1.0.14 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.5.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.8 crate://crates.io/bstr/1.10.0 crate://crates.io/bumpalo/3.16.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.9.0 crate://crates.io/bytesize/1.3.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.1.9 crate://crates.io/cargo-config2/0.1.26 crate://crates.io/cargo-options/0.7.4 crate://crates.io/cargo-platform/0.1.8 crate://crates.io/cargo-xwin/0.18.6 crate://crates.io/cargo-zigbuild/0.20.0 crate://crates.io/cargo_metadata/0.19.0 crate://crates.io/cbindgen/0.29.0 crate://crates.io/cc/1.2.16 crate://crates.io/cfb/0.10.0 crate://crates.io/cfg-if
 /1.0.0 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.9.3 crate://crates.io/clap/4.5.7 crate://crates.io/clap_builder/4.5.7 crate://crates.io/clap_complete/4.5.5 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.2 crate://crates.io/clap_derive/4.5.5 crate://crates.io/clap_lex/0.7.1 crate://crates.io/cli-table/0.4.7 crate://crates.io/colorchoice/1.0.1 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.8 crate://crates.io/content_inspector/0.2.4 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation-sys/0.8.6 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crc/3.2.1 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.4.2 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.5 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.20 crate://crates.io/crypto-common/0.1.6 crate://crates.io/data-encoding/2.6.0 crate://crates.io/d
 eranged/0.3.11 crate://crates.io/derive_arbitrary/1.4.1 crate://crates.io/dialoguer/0.11.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/5.0.1 crate://crates.io/dirs-sys/0.4.1 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.9 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.17 crate://crates.io/either/1.13.0 crate://crates.io/encode_unicode/0.3.6 crate://crates.io/encoding_rs/0.8.34 crate://crates.io/equivalent/1.0.1 crate://crates.io/errno/0.3.9 crate://crates.io/expect-test/1.5.0 crate://crates.io/fastrand/2.1.0 crate://crates.io/fat-macho/0.4.9 crate://crates.io/filetime/0.2.23 crate://crates.io/flate2/1.0.33 crate://crates.io/fnv/1.0.7 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.1 crate://crates.io/fs-err/3.0.0 crate://crates.io/fs4/0.12.0 crate://crates.io/futures/0.3.30 crate://crates.io/futures-channel/0.3.31 crate://crates.io/fu
 tures-core/0.3.31 crate://crates.io/futures-executor/0.3.30 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/getrandom/0.3.3 crate://crates.io/glob/0.3.1 crate://crates.io/globset/0.4.16 crate://crates.io/goblin/0.9.2 crate://crates.io/hashbrown/0.14.5 crate://crates.io/hashbrown/0.15.2 crate://crates.io/heck/0.5.0 crate://crates.io/home/0.5.9 crate://crates.io/humantime/2.1.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/1.5.0 crate://crates.io/icu_locid/1.5.0 crate://crates.io/icu_locid_transform/1.5.0 crate://crates.io/icu_locid_transform_data/1.5.0 crate://crates.io/icu_normalizer/1.5.0 crate://crates.io/icu_normalizer_data/1.5.0 crate://crates.io/icu_properties/1.5.1 crate://crates.io/
 icu_properties_data/1.5.0 crate://crates.io/icu_provider/1.5.0 crate://crates.io/icu_provider_macros/1.5.0 crate://crates.io/idna/1.0.3 crate://crates.io/idna_adapter/1.2.0 crate://crates.io/ignore/0.4.23 crate://crates.io/indexmap/2.6.0 crate://crates.io/indicatif/0.17.9 crate://crates.io/indoc/2.0.5 crate://crates.io/insta/1.43.1 crate://crates.io/is_terminal_polyfill/1.70.0 crate://crates.io/itertools/0.12.1 crate://crates.io/itertools/0.13.0 crate://crates.io/itoa/1.0.11 crate://crates.io/jobserver/0.1.33 crate://crates.io/js-sys/0.3.73 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.4.0 crate://crates.io/lddtree/0.3.7 crate://crates.io/libc/0.2.172 crate://crates.io/libmimalloc-sys/0.1.39 crate://crates.io/libredox/0.1.3 crate://crates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.4.14 crate://crates.io/litemap/0.7.3 crate://crates.io/lock_api/0.4.12 crate://crates.io/lockfree-object-pool/0.1.6 crate://crates.io/log/0.4.22 crate://crates.io/lzma-rs/0
 .3.0 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.5 crate://crates.io/mailparse/0.15.0 crate://crates.io/matchers/0.1.0 crate://crates.io/memchr/2.7.4 crate://crates.io/mimalloc/0.1.43 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.4 crate://crates.io/minijinja/2.5.0 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/miniz_oxide/0.8.0 crate://crates.io/msi/0.8.0 crate://crates.io/multipart/0.18.0 crate://crates.io/native-tls/0.2.12 crate://crates.io/nom/7.1.3 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.2.0 crate://crates.io/nu-ansi-term/0.46.0 crate://crates.io/num-conv/0.1.0 crate://crates.io/number_prefix/0.4.0 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.5 crate://crates.io/openssl-sys/0.9.107 crate://crates.io/option-ext/0.2.0 crate://crates.io/os_pipe/1.2.0 crate://crates.io/overload/0.1.1 crate://crates.io/par
 king_lot/0.12.3 crate://crates.io/parking_lot_core/0.9.10 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.1 crate://crates.io/pin-project-lite/0.2.15 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.30 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.0.5 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.17 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.1.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/psm/0.1.21 crate://crates.io/pyproject-toml/0.13.5 crate://crates.io/python-pkginfo/0.6.5 crate://crates.io/quote/1.0.37 crate://crates.io/quoted_printable/0.5.0 crate://crates.io/r-efi/5.2.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.10.0 crate://crates.
 io/rayon-core/1.12.1 crate://crates.io/redox_syscall/0.4.1 crate://crates.io/redox_syscall/0.5.1 crate://crates.io/redox_users/0.4.5 crate://crates.io/regex/1.11.1 crate://crates.io/regex-automata/0.1.10 crate://crates.io/regex-automata/0.4.9 crate://crates.io/regex-syntax/0.6.29 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.0.6 crate://crates.io/ring/0.17.13 crate://crates.io/rstest/0.22.0 crate://crates.io/rstest_macros/0.22.0 crate://crates.io/rustc-hash/2.0.0 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.6 crate://crates.io/rustix/0.38.41 crate://crates.io/rustls/0.23.19 crate://crates.io/rustls-pemfile/2.1.3 crate://crates.io/rustls-pki-types/1.10.0 crate://crates.io/rustls-webpki/0.102.8 crate://crates.io/rustversion/1.0.18 crate://crates.io/ryu/1.0.18 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.23 crate://crates.io/schemars/0.8.21 crate://crates.io/schemars_derive/0.8
 .21 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.12.0 crate://crates.io/scroll_derive/0.12.0 crate://crates.io/security-framework/2.11.0 crate://crates.io/security-framework-sys/2.11.0 crate://crates.io/semver/1.0.23 crate://crates.io/serde/1.0.217 crate://crates.io/serde_derive/1.0.217 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.135 crate://crates.io/serde_spanned/0.6.8 crate://crates.io/sha2/0.10.8 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/similar/2.5.0 crate://crates.io/slab/0.4.9 crate://crates.io/smallvec/1.13.2 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.16 crate://crates.io/snapbox-macros/0.3.10 crate://crates.io/socks/0.3.4 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/stacker/0.1.15 crate://crates.io/static_assertions/1.1.0 crate://crates.io/strsim/0.11.1 crate://crates.io/sub
 tle/2.5.0 crate://crates.io/syn/2.0.90 crate://crates.io/synstructure/0.13.1 crate://crates.io/tar/0.4.43 crate://crates.io/target-lexicon/0.13.1 crate://crates.io/tempfile/3.11.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.3.0 crate://crates.io/textwrap/0.16.1 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.12 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.12 crate://crates.io/thread_local/1.1.8 crate://crates.io/time/0.3.36 crate://crates.io/time-core/0.1.2 crate://crates.io/time-macros/0.2.18 crate://crates.io/tinystr/0.7.6 crate://crates.io/toml/0.8.19 crate://crates.io/toml_datetime/0.6.8 crate://crates.io/toml_edit/0.21.1 crate://crates.io/toml_edit/0.22.22 crate://crates.io/tracing/0.1.41 crate://crates.io/tracing-attributes/0.1.28 crate://crates.io/tracing-core/0.1.33 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.19 crate://crates.io/t
 rycmd/0.15.6 crate://crates.io/twox-hash/1.6.3 crate://crates.io/typenum/1.17.0 crate://crates.io/unicase/2.7.0 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.1.13 crate://crates.io/unicode-width/0.2.0 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/2.11.0 crate://crates.io/url/2.5.4 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf16_iter/1.0.5 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.8.0 crate://crates.io/valuable/0.1.0 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.1 crate://crates.io/version_check/0.9.4 crate://crates.io/versions/6.2.0 crate://crates.io/wait-timeout/0.2.0 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.2+wasi-0.2.4 crate://crates.io/wasm-bindgen/0.2.96 crate://crates.io/wasm-
 bindgen-backend/0.2.96 crate://crates.io/wasm-bindgen-macro/0.2.96 crate://crates.io/wasm-bindgen-macro-support/0.2.96 crate://crates.io/wasm-bindgen-shared/0.2.96 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-roots/0.26.2 crate://crates.io/which/7.0.0 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.8 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-sys/0.48.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.5 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.5 crate://crates.io/windows_aarch64_msvc/0.48.5 crate://crates.io/windows_aarch64_msvc/0.52.5 crate://crates.io/windows_i686_gnu/0.48.5 crate://crates.io/windows_i686_gnu/0.52.5 crate://crates.io/windows_i686_gnullvm/0.52.5 crate://crates.io/windows_i686_msvc/0.48.5 crate://crate
 s.io/windows_i686_msvc/0.52.5 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.5 crate://crates.io/windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gnullvm/0.52.5 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/windows_x86_64_msvc/0.52.5 crate://crates.io/winnow/0.5.40 crate://crates.io/winnow/0.6.20 crate://crates.io/winsafe/0.0.19 crate://crates.io/wit-bindgen-rt/0.39.0 crate://crates.io/write16/1.0.0 crate://crates.io/writeable/0.5.5 crate://crates.io/xattr/1.3.1 crate://crates.io/xwin/0.6.5 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.7.4 crate://crates.io/yoke-derive/0.7.5 crate://crates.io/zerocopy/0.7.35 crate://crates.io/zerocopy-derive/0.7.35 crate://crates.io/zerofrom/0.1.4 crate://crates.io/zerofrom-derive/0.1.5 crate://crates.io/zeroize/1.8.1 crate://crates.io/zerovec/0.10.4 crate://crates.io/zerovec-derive/0.10.3 crate://crates.io/zip/2.3.0 crate://crates.io/zopfli/0.
 8.1 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dbg: PV changed from "1.9.1" to "1.9.2"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dbg: PKGSIZE changed from 6424000 to 6447368 (+0%)
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dbg: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dev: PV changed from "1.9.1" to "1.9.2"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dev: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-doc: PV changed from "1.9.1" to "1.9.2"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-doc: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-locale: PV changed from "1.9.1" to "1.9.2"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-locale: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-src: PV changed from "1.9.1" to "1.9.2"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-src: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-staticdev: PV changed from "1.9.1" to "1.9.2"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-staticdev: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.13/site-packages/maturin-1.9.1.dist-info -> /usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info, added "/usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info/licenses/license-mit /usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info/licenses/license-apache"
packages/core2-64-poky-linux/python3-maturin/python3-maturin: PV changed from "1.9.1" to "1.9.2"
packages/core2-64-poky-linux/python3-maturin/python3-maturin: PKGSIZE changed from 14761182 to 14822320 (+0%)
packages/core2-64-poky-linux/python3-maturin/python3-maturin: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
Changes to packages/core2-64-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.13/site-packages/maturin-1.9.1.dist-info moved to /usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info
  /usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info/licenses/license-apache was added
  /usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info/licenses/license-mit was added

--===============4724198229801392332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.13/site-packages/maturin-1.9.1.dist-info -> /usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info, added "/usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info/licenses/license-mit /usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info/licenses/license-apache"
Changes to packages/core2-64-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.13/site-packages/maturin-1.9.1.dist-info moved to /usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info
  /usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info/licenses/license-apache was added
  /usr/lib/python3.13/site-packages/maturin-1.9.2.dist-info/licenses/license-mit was added

--===============4724198229801392332==--

