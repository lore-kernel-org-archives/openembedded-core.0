Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45121.1795622906106174531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:08:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=TA31J3Lm;
 spf=pass (domain: baylibre.com, ip: 209.85.219.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9213f004a14so72711146d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622905; x=1796227705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pHwppeE5zOJ93llqH1Anqi239K1rj3FqixxUTYdN+k8=;
        b=TA31J3LmwSZljR03EWOcczD74q0VFYJee6LIRvl5sRgEx/sDt7GmRT6Chu1LNV2a2c
         aC3tjQTJ1ULnnGvzWy3oKW86mhgwJV5kpauA0X95hMykFQaDnc2506gfao5oM2EUAQkm
         j8W8d3VLtchddMKN2ODdFFzAVCsjSoUZiabI7gy4JU5CWQ/L3+jr0vwWAF68qAA95oAj
         rduXMV4l028WEWeRjZOgnuO74Cw3JkY3nz9e9tR1ZSbXMBtQXj9ds7xb8hobe0+ozFz2
         nVsHjme2H2wCl1xNLm6ACIWoBKFJXma+/00vuwHYJCeFbSz6AtCSfB/m3XPD/Q/O2yty
         /u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622905; x=1796227705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pHwppeE5zOJ93llqH1Anqi239K1rj3FqixxUTYdN+k8=;
        b=Ss99EFaM0L1M3suHQp+3P2e2feKn8KSsz9x4jlQN1cwR7z98f7i4jF7hPpP9fYZZ7w
         KF99+uoM/UOUF4el3A0VJA6TSejfuqEMXUKkqS5dE4lE6pRFYzFf1gS1YWQsukp1UHBu
         htYsc7hN/rgXCEu0l8H7APLzN0L1RrDa5MQq/Y0TgRaLDG1nqetcbEf31auoh8c+PDAI
         Tk1viCMl0nu8vG08S2VpAwA6D5d4Xcvt5A6gFHJ3HnxCGsAn84zzn+mJYqE6KMansDFc
         F/CwpX5IIt//g4jMpL+d0mn6hiNDH69rl00sE1FIVawOKEOjpqkj7frwc1L9HWGErnRz
         at8A==
X-Gm-Message-State: APuU4Z/1sBnUI1/k2p+U2FhRYag1cfPUM/4Xtwbc65FutmeaKnQiwLEo
	XidvXxqbulmZgmPW0fLc++/tJHblkNAPLRNSvyc39FTSjxtPef11AYcDBlS1aci0+RDp7RsjVzp
	YxhX9
X-Gm-Gg: AZFdTZdVvS2uvoQihH3jhZC89grKQUZNKLBk6iWycOeoBKznLkdvWhdIjWlhN7R1spE
	plgOUXxnjt0ElUcwdcrJStMjSCUec5E4dVdD7sytEpxcSQrEKqDThljKVwddszY3GMk9+Hz466N
	WqPmseMPoJKm1qt0D2CF5QUe+VSwOHHt7PqxzBge6VC0TwNHoFtRPQl4nnRHRGnEE17AOQmwCY6
	ECxIabgO+Up2jMgHBfD1JL8vQac/Y0s5FKFNFIX2DoB6FfrY1ZQyhrMZcvzZpxBFeuKlI0AxVoV
	2MxngtjdFoSk8EcZq5PG3XR8OXTnj6SgEIeCAF0+YFyzCsIexVZaTpeob8yYve/Rc3ZO8rNP0U/
	EHF3dVWbsvW0saf13zeBpkuICdbcuv/yPI5kdnnvOIgvrNxpiZcbzkOM5bwLvcn84fwUEzPt1ou
	WW7QWgftCu5EOoNe6CwClsDziLXJq+nfNeYwLLwynhE77f0py9kzAhKSnXzTlAiHlP4QJQnyLwO
	cpI5SCbs7WasEffkuzqSmxSjm5MVbk7YC9vfokVbaHLteAGUagEFBe4k4EqZ6oGMg0yEzNDRPor
	r/v9rUUimC8Tq3EaPewrK01jqT7J1xhPYgpTZDAaZpLgGpMhKh04nN+l7Ie/LwBE3kJZwLy2sX1
	Bh0BPYREDJw==
X-Received: by 2002:ad4:5de5:0:b0:921:7f88:9afb with SMTP id 6a1803df08f44-9217f889d2amr22705406d6.43.1795622904664;
        Wed, 25 Nov 2026 08:08:24 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921787f6847sm25849466d6.30.2026.11.25.08.08.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:08:24 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/6 v2] hyperfine: add recipe
Date: Wed, 25 Nov 2026 11:08:16 -0500
Message-ID: <20261125160821.3028875-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125160821.3028875-1-tgamblin@baylibre.com>
References: <20261125160821.3028875-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251206
Content-Type: text/plain; charset="utf-8"

hyperfine is a command-line tool for benchmarking commands across
multiple runs, written in Rust. It supports configuring the number of
runs, enabling 'warmups', parameterizing runs, and more, with reasonable
defaults (e.g.  running at least 10 passes of a command when the
'--runs' argument is not given).

More info at:

https://github.com/sharkdp/hyperfine

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../hyperfine/hyperfine-crates.inc            | 274 ++++++++++++++++++
 .../hyperfine/hyperfine_2.0.0.bb              |  17 ++
 3 files changed, 292 insertions(+)
 create mode 100644 meta/recipes-devtools/hyperfine/hyperfine-crates.inc
 create mode 100644 meta/recipes-devtools/hyperfine/hyperfine_2.0.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 62de04001e..3240290163 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -270,6 +270,7 @@ RECIPE_MAINTAINER:pn-help2man = "Kusuma Dirisala <kusuma.dirisala@windriver.com>
 RECIPE_MAINTAINER:pn-hicolor-icon-theme = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-hwdata = "Hiago De Franco <hfranco@baylibre.com>"
 RECIPE_MAINTAINER:pn-hwlatdetect = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-hyperfine = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-i2c-tools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-icon-naming-utils = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-icu = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/hyperfine/hyperfine-crates.inc b/meta/recipes-devtools/hyperfine/hyperfine-crates.inc
new file mode 100644
index 0000000000..983bdcaba9
--- /dev/null
+++ b/meta/recipes-devtools/hyperfine/hyperfine-crates.inc
@@ -0,0 +1,274 @@
+# Autogenerated with 'bitbake -c update_crates hyperfine'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/aho-corasick/1.1.5 \
+    crate://crates.io/anstream/1.0.0 \
+    crate://crates.io/anstyle/1.0.14 \
+    crate://crates.io/anstyle-parse/1.0.0 \
+    crate://crates.io/anstyle-query/1.1.5 \
+    crate://crates.io/anstyle-wincon/3.0.11 \
+    crate://crates.io/anyhow/1.0.104 \
+    crate://crates.io/approx/0.5.1 \
+    crate://crates.io/arrayvec/0.7.8 \
+    crate://crates.io/assert_cmd/2.2.2 \
+    crate://crates.io/autocfg/1.5.1 \
+    crate://crates.io/bitflags/2.13.2 \
+    crate://crates.io/borsh/1.8.1 \
+    crate://crates.io/borsh-derive/1.8.1 \
+    crate://crates.io/bstr/1.13.1 \
+    crate://crates.io/bumpalo/3.20.3 \
+    crate://crates.io/bytes/1.12.1 \
+    crate://crates.io/cfg-if/1.0.5 \
+    crate://crates.io/cfg_aliases/0.2.2 \
+    crate://crates.io/chacha20/0.10.2 \
+    crate://crates.io/clap/4.6.7 \
+    crate://crates.io/clap_builder/4.6.7 \
+    crate://crates.io/clap_complete/4.6.11 \
+    crate://crates.io/clap_lex/1.1.1 \
+    crate://crates.io/colorchoice/1.0.5 \
+    crate://crates.io/colored/3.1.1 \
+    crate://crates.io/console/0.15.11 \
+    crate://crates.io/console/0.16.6 \
+    crate://crates.io/cpufeatures/0.3.1 \
+    crate://crates.io/csv/1.4.0 \
+    crate://crates.io/csv-core/0.1.13 \
+    crate://crates.io/difflib/0.4.0 \
+    crate://crates.io/encode_unicode/1.0.0 \
+    crate://crates.io/equivalent/1.0.2 \
+    crate://crates.io/errno/0.3.14 \
+    crate://crates.io/fastrand/2.5.0 \
+    crate://crates.io/float-cmp/0.10.0 \
+    crate://crates.io/getrandom/0.2.17 \
+    crate://crates.io/getrandom/0.3.4 \
+    crate://crates.io/getrandom/0.4.3 \
+    crate://crates.io/hashbrown/0.17.1 \
+    crate://crates.io/humantime/2.4.0 \
+    crate://crates.io/indexmap/2.14.2 \
+    crate://crates.io/indicatif/0.17.4 \
+    crate://crates.io/insta/1.48.0 \
+    crate://crates.io/insta-cmd/0.7.0 \
+    crate://crates.io/instant/0.1.13 \
+    crate://crates.io/is_terminal_polyfill/1.70.2 \
+    crate://crates.io/itoa/1.0.18 \
+    crate://crates.io/libc/0.2.189 \
+    crate://crates.io/linux-raw-sys/0.12.1 \
+    crate://crates.io/memchr/2.8.3 \
+    crate://crates.io/nix/0.31.3 \
+    crate://crates.io/normalize-line-endings/0.3.0 \
+    crate://crates.io/num-traits/0.2.19 \
+    crate://crates.io/number_prefix/0.4.0 \
+    crate://crates.io/once_cell/1.21.4 \
+    crate://crates.io/once_cell_polyfill/1.70.2 \
+    crate://crates.io/perf-event-open-sys/6.0.0 \
+    crate://crates.io/platform-info/2.2.0 \
+    crate://crates.io/portable-atomic/1.15.0 \
+    crate://crates.io/ppv-lite86/0.2.21 \
+    crate://crates.io/predicates/3.1.4 \
+    crate://crates.io/predicates-core/1.0.10 \
+    crate://crates.io/predicates-tree/1.0.13 \
+    crate://crates.io/proc-macro-crate/3.5.0 \
+    crate://crates.io/proc-macro2/1.0.107 \
+    crate://crates.io/quote/1.0.47 \
+    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/r-efi/6.0.0 \
+    crate://crates.io/rand/0.8.8 \
+    crate://crates.io/rand/0.9.5 \
+    crate://crates.io/rand/0.10.3 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_chacha/0.9.0 \
+    crate://crates.io/rand_core/0.6.4 \
+    crate://crates.io/rand_core/0.9.5 \
+    crate://crates.io/rand_core/0.10.1 \
+    crate://crates.io/regex/1.13.1 \
+    crate://crates.io/regex-automata/0.4.18 \
+    crate://crates.io/regex-syntax/0.8.11 \
+    crate://crates.io/rust_decimal/1.43.0 \
+    crate://crates.io/rustix/1.1.5 \
+    crate://crates.io/rustversion/1.0.23 \
+    crate://crates.io/ryu/1.0.23 \
+    crate://crates.io/serde/1.0.229 \
+    crate://crates.io/serde_core/1.0.229 \
+    crate://crates.io/serde_derive/1.0.229 \
+    crate://crates.io/serde_json/1.0.151 \
+    crate://crates.io/shell-words/1.1.1 \
+    crate://crates.io/similar/2.7.0 \
+    crate://crates.io/strip-ansi-escapes/0.2.1 \
+    crate://crates.io/strsim/0.11.1 \
+    crate://crates.io/syn/2.0.119 \
+    crate://crates.io/syn/3.0.6 \
+    crate://crates.io/tempfile/3.27.0 \
+    crate://crates.io/terminal_size/0.4.4 \
+    crate://crates.io/termtree/0.5.1 \
+    crate://crates.io/thiserror/2.0.21 \
+    crate://crates.io/thiserror-impl/2.0.21 \
+    crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
+    crate://crates.io/toml_edit/0.25.15+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.3+spec-1.1.0 \
+    crate://crates.io/typenum/1.20.1 \
+    crate://crates.io/unicode-ident/1.0.26 \
+    crate://crates.io/unicode-width/0.1.14 \
+    crate://crates.io/unicode-width/0.2.2 \
+    crate://crates.io/uom/0.36.0 \
+    crate://crates.io/utf8parse/0.2.2 \
+    crate://crates.io/vte/0.14.1 \
+    crate://crates.io/wait-timeout/0.2.1 \
+    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
+    crate://crates.io/wasm-bindgen/0.2.129 \
+    crate://crates.io/wasm-bindgen-macro/0.2.129 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.129 \
+    crate://crates.io/wasm-bindgen-shared/0.2.129 \
+    crate://crates.io/windows-link/0.2.1 \
+    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-sys/0.61.2 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/winnow/1.0.4 \
+    crate://crates.io/wit-bindgen/0.57.1 \
+    crate://crates.io/zerocopy/0.8.58 \
+    crate://crates.io/zerocopy-derive/0.8.58 \
+    crate://crates.io/zmij/1.0.23 \
+"
+
+SRC_URI[aho-corasick-1.1.5.sha256sum] = "c982642fa9e8606056828ee9a8505737230110bb1099153c79efe865c59d12ba"
+SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
+SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
+SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
+SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
+SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
+SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
+SRC_URI[approx-0.5.1.sha256sum] = "cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6"
+SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
+SRC_URI[assert_cmd-2.2.2.sha256sum] = "2aa3a22042e45de04255c7bf3626e239f450200fd0493c1e382263544b20aea6"
+SRC_URI[autocfg-1.5.1.sha256sum] = "f2032f911046de80f0a198e0901378627c33f59ea0ac00e363d481118bd70a53"
+SRC_URI[bitflags-2.13.2.sha256sum] = "3ded4057c258ba199e2d26386d3af3780957ecaee6c4ef4041c6b4b8b97c0b06"
+SRC_URI[borsh-1.8.1.sha256sum] = "553c5d846a6ba5150c65e3b1b8ec073bcf1abc20f9b7220de384a4443ea4e20a"
+SRC_URI[borsh-derive-1.8.1.sha256sum] = "12cdfe656708a01f89b451a7d36466e6fe6c414de0aa18fc54f864f6f9ca9f56"
+SRC_URI[bstr-1.13.1.sha256sum] = "6bb31b46c14244e20ee9984b11bf5c992b91fb6939fea616e3512c8baecdbe5f"
+SRC_URI[bumpalo-3.20.3.sha256sum] = "72f5acc6cb2ba439de613abc23857ec3d78374d8ed5ac84e9d11336e87da8649"
+SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
+SRC_URI[cfg-if-1.0.5.sha256sum] = "4e7648175b45a9a48536d676f68d918270699102aa8dab5496df06904c914600"
+SRC_URI[cfg_aliases-0.2.2.sha256sum] = "f079e83a288787bcd14a6aea84cee5c87a67c5a3e660c30f557a3d24761b3527"
+SRC_URI[chacha20-0.10.2.sha256sum] = "65c35e4b699c7e15ccbe7ee35c005e4fc0a278d22238a2857e6ce2dadeda1b06"
+SRC_URI[clap-4.6.7.sha256sum] = "aa8876b300ab35ba921adea3dfd70157a46249b33f95c9084ae5709785478946"
+SRC_URI[clap_builder-4.6.7.sha256sum] = "ec0797fb7aeb1406c84efac526901f7ec3ead2124f946b494e72879d4b54704d"
+SRC_URI[clap_complete-4.6.11.sha256sum] = "037e2a1a92236d0aff7e845093f64661d6df4c02c9fcc61a60e9e1d736fa392f"
+SRC_URI[clap_lex-1.1.1.sha256sum] = "1c133bc6a41be0d194c306b5506d15e6feeea7b1d6604bd3f8310dfb2ca96486"
+SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
+SRC_URI[colored-3.1.1.sha256sum] = "faf9468729b8cbcea668e36183cb69d317348c2e08e994829fb56ebfdfbaac34"
+SRC_URI[console-0.15.11.sha256sum] = "054ccb5b10f9f2cbf51eb355ca1d05c2d279ce1804688d0db74b4733a5aeafd8"
+SRC_URI[console-0.16.6.sha256sum] = "e96a4956774c13c126a8b5af4daa79384f4d826534c95a02d76afb39e2ab64e3"
+SRC_URI[cpufeatures-0.3.1.sha256sum] = "5ca28b0ae3115b884660db4118d803791fd6756b6e88f39c0f3f7859060d7566"
+SRC_URI[csv-1.4.0.sha256sum] = "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4b50f76ce9827ae0c6e14f938"
+SRC_URI[csv-core-0.1.13.sha256sum] = "704a3c26996a80471189265814dbc2c257598b96b8a7feae2d31ace646bb9782"
+SRC_URI[difflib-0.4.0.sha256sum] = "6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8"
+SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
+SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
+SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
+SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
+SRC_URI[float-cmp-0.10.0.sha256sum] = "b09cf3155332e944990140d967ff5eceb70df778b34f77d8075db46e4704e6d8"
+SRC_URI[getrandom-0.2.17.sha256sum] = "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
+SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
+SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
+SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
+SRC_URI[humantime-2.4.0.sha256sum] = "15cdd26707701c53297e2fa6afb323d55fbc1d0810c3aec078ae3ef0424c3c15"
+SRC_URI[indexmap-2.14.2.sha256sum] = "cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855"
+SRC_URI[indicatif-0.17.4.sha256sum] = "db45317f37ef454e6519b6c3ed7d377e5f23346f0823f86e65ca36912d1d0ef8"
+SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f5e6b644fe7dd4ef6b82"
+SRC_URI[insta-cmd-0.7.0.sha256sum] = "bffdf4af1db390cf0401535d7c1303cd079a074d28d8473b026fdb6559c41403"
+SRC_URI[instant-0.1.13.sha256sum] = "e0242819d153cba4b4b05a5a8f2a7e9bbf97b6055b2a002b395c96b5ff3c0222"
+SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
+SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
+SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
+SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
+SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
+SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
+SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
+SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
+SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
+SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
+SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
+SRC_URI[perf-event-open-sys-6.0.0.sha256sum] = "a5f8d1487a4ffa23c80a1c355dd27235f9b66fb71ba0f261eb417e4fe8451347"
+SRC_URI[platform-info-2.2.0.sha256sum] = "ba7c3f5af00d3596a148cc80178ac690152b71c283d15a8bcea0cddfea759a36"
+SRC_URI[portable-atomic-1.15.0.sha256sum] = "05c8b63e8d9609db387f0324918f81d68fe27748f084ef092fb35954d0539a85"
+SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
+SRC_URI[predicates-3.1.4.sha256sum] = "ada8f2932f28a27ee7b70dd6c1c39ea0675c55a36879ab92f3a715eaa1e63cfe"
+SRC_URI[predicates-core-1.0.10.sha256sum] = "cad38746f3166b4031b1a0d39ad9f954dd291e7854fcc0eed52ee41a0b50d144"
+SRC_URI[predicates-tree-1.0.13.sha256sum] = "d0de1b847b39c8131db0467e9df1ff60e6d0562ab8e9a16e568ad0fdb372e2f2"
+SRC_URI[proc-macro-crate-3.5.0.sha256sum] = "e67ba7e9b2b56446f1d419b1d807906278ffa1a658a8a5d8a39dcb1f5a78614f"
+SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
+SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
+SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
+SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
+SRC_URI[rand-0.8.8.sha256sum] = "e058c7de0b26af77780c769414d6257830bb240f3c38477dbc2c16e5f54d6d4c"
+SRC_URI[rand-0.9.5.sha256sum] = "b9ef1d0d795eb7d84685bca4f72f3649f064e6641543d3a8c415898726a57b41"
+SRC_URI[rand-0.10.3.sha256sum] = "65c9fb96cbc91e3478eaae79a69fcd3f1ae4ad052e471fe6732fff548984b4af"
+SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
+SRC_URI[rand_chacha-0.9.0.sha256sum] = "d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb"
+SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
+SRC_URI[rand_core-0.9.5.sha256sum] = "76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c"
+SRC_URI[rand_core-0.10.1.sha256sum] = "63b8176103e19a2643978565ca18b50549f6101881c443590420e4dc998a3c69"
+SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
+SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2"
+SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
+SRC_URI[rust_decimal-1.43.0.sha256sum] = "7653272e75dcac41dc199fbea6f5797633994fafd339943c06c9af16bf29cd3a"
+SRC_URI[rustix-1.1.5.sha256sum] = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
+SRC_URI[rustversion-1.0.23.sha256sum] = "cf54715a573b99ac80df0bc206da022bcd442c974952c7b9720069370852e21f"
+SRC_URI[ryu-1.0.23.sha256sum] = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
+SRC_URI[serde-1.0.229.sha256sum] = "4148590afebada386688f18773da617792bf2ef03ffc1e4cbd2b1d45b023e0ba"
+SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
+SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
+SRC_URI[serde_json-1.0.151.sha256sum] = "c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14"
+SRC_URI[shell-words-1.1.1.sha256sum] = "dc6fe69c597f9c37bfeeeeeb33da3530379845f10be461a66d16d03eca2ded77"
+SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
+SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
+SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
+SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
+SRC_URI[syn-3.0.6.sha256sum] = "8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee"
+SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
+SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
+SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
+SRC_URI[thiserror-2.0.21.sha256sum] = "09e52cb86a36cede5cb101bf8908837b3e4c6e5e59fe7fd85c23fb56200d189e"
+SRC_URI[thiserror-impl-2.0.21.sha256sum] = "fe5197923287db20a58125f0bc85c062f7f2c892de97b18c356f9efb14b28524"
+SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
+SRC_URI[toml_edit-0.25.15+spec-1.1.0.sha256sum] = "1340ea94a5856333492c9064b02c778b191dd2c853778d9609debdcdfea3a614"
+SRC_URI[toml_parser-1.1.3+spec-1.1.0.sha256sum] = "1d38ac1cf9b95face32296c0a3ede1fdc270627c9d9c02a7274dd6d960dc4d56"
+SRC_URI[typenum-1.20.1.sha256sum] = "b6f5e870be6c3b371b77fe0ee0bafb859fa4964b4404c27de1d380043c4dda20"
+SRC_URI[unicode-ident-1.0.26.sha256sum] = "d245f478577f809a851594d02313b640fb437e0bb33866753cff937863096954"
+SRC_URI[unicode-width-0.1.14.sha256sum] = "7dd6e30e90baa6f72411720665d41d89b9a3d039dc45b8faea1ddd07f617f6af"
+SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
+SRC_URI[uom-0.36.0.sha256sum] = "ffd36e5350a65d112584053ee91843955826bf9e56ec0d1351214e01f6d7cd9c"
+SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
+SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
+SRC_URI[wait-timeout-0.2.1.sha256sum] = "09ac3b126d3914f9849036f826e054cbabdc8519970b8998ddaf3b5bd3c65f11"
+SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] = "b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487"
+SRC_URI[wasm-bindgen-0.2.129.sha256sum] = "9bb54f33acc68fd454578d9820b0bde1a1a3d17aa17bb7b6595806d02886d409"
+SRC_URI[wasm-bindgen-macro-0.2.129.sha256sum] = "2e29d0c35b16e224a7eeb5cd2d25e3e1968fbd65604117b44d3b789d00ee8535"
+SRC_URI[wasm-bindgen-macro-support-0.2.129.sha256sum] = "6f501a8bc3719dba86ef8ae4728879c08001bea749eb1333ac5b91e040e2a6b7"
+SRC_URI[wasm-bindgen-shared-0.2.129.sha256sum] = "23f0c9c52aa7cd7d77769a4cfe2a9adb1b331f489a41d912ce14513d5ab995c6"
+SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
+SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[winnow-1.0.4.sha256sum] = "23b97319f7b8343df12cc98938e5c3eb436064524c8d2b4e30a1d3a36eecdf81"
+SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
+SRC_URI[zerocopy-0.8.58.sha256sum] = "c17e8fafad82b542ff3717217ecdc736231b59e387768c9630123b4ce4d2db44"
+SRC_URI[zerocopy-derive-0.8.58.sha256sum] = "595f56e044df4f46a0c9a626f65c3d99eb8488f7e8a8baa12dd76326d9710bf2"
+SRC_URI[zmij-1.0.23.sha256sum] = "29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b"
diff --git a/meta/recipes-devtools/hyperfine/hyperfine_2.0.0.bb b/meta/recipes-devtools/hyperfine/hyperfine_2.0.0.bb
new file mode 100644
index 0000000000..3a81e1bf32
--- /dev/null
+++ b/meta/recipes-devtools/hyperfine/hyperfine_2.0.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "A command-line benchmarking tool"
+HOMEPAGE = "https://github.com/sharkdp/hyperfine"
+LICENSE = "Apache-2.0 OR MIT"
+LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=50c79cd7360537975dfbbd15f8d01a34 \
+                    file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+inherit cargo cargo-update-recipe-crates
+
+SRC_URI = "git://github.com/sharkdp/hyperfine.git;protocol=https;nobranch=1;tag=v${PV}"
+SRCREV = "b33755fe1fca8bcc1f182c773ca3ab040bfe517d"
+
+require ${BPN}-crates.inc
+
+# Upstream's release profile sets strip = true; let do_package do the stripping
+export CARGO_PROFILE_RELEASE_STRIP = "false"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.56.1

