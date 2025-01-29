Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A226C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 10:42:05 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.9745.1738147315803719196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 02:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T0DV39ZE;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43622267b2eso68089765e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 02:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738147313; x=1738752113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tpIXTQXRonZuHkJ4yqQaYGZdu8SSBlBjZUToc/upBwc=;
        b=T0DV39ZEyEIMUwDRxpHPdcMGs/Z0whwhgCyGwj7Yxv9jWzcSBsLsuwvhjEzkWVARv9
         /pqpoNR4IeOJfalDGzkZROFyUNdUGvga5QjyVMSqQ/S4/PqT2so+cgv6E+E5XcKABCSA
         opsdhNOkOF+TAOR1kJMpujdEYbmcMzkiuISSi05drIGB1tHJ2w8jq40vweVfaTxj47jo
         WlKd+iAjIyMkdlZ48jGPOIkWGDoFbSsXJFzsXj72ug68VXDkIPI8Y4O/Qp/v8BTlM6wL
         FMTimAI1TEyh4BVxqglW7FKO9FKDDpipVhMKyhpXdDWc2xSuUyyEvJ59Nytk30TSHU56
         g1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738147313; x=1738752113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpIXTQXRonZuHkJ4yqQaYGZdu8SSBlBjZUToc/upBwc=;
        b=YgniRujZYMr0DsvFJo3JxNP/O0QbfgIXfnC6ACLx4oKKa7PwoJBADx0xxqffZTBWJ7
         9Jk5P+yaVQOeG0YCoabxzYKi1bL2fi9r1KRaKYP9zUzew2ua50X/oAr1UiOEWQD1Y+Iy
         DW7BtEKPcD/gnzp8Dz6YBR1BYqhrpWTsAN31C1CiTyxZTtWGkK8xXNS6D4UfgmkQhQah
         gPBhjdt16ZiCJ3BBDS7aZfrT+9LhUHYe0/esbhc1RfdO4mPtoxm/8naWYbal0NsZMGpi
         Xemnt+84++qbCQMo0OH8cyEnPcGiJK9BhVVI0RCHCdJNPSShoubo613NaKEi/AVLxfa7
         AuBQ==
X-Gm-Message-State: AOJu0YxWIAoRWoqyEM1lgC1JKNUgNcLQksSMiRiaMXwCEgHl+T/My4ba
	sMfW4oZ6ZdnaEwayiWkVcSE6W3LRfatq2EoVYiFPLhlCAAIEnALR1JhiVQ==
X-Gm-Gg: ASbGncvGVbuf6En2OwNnVuwfs33FOGeYwAsmeyB9V9jrPPSBQot9VYPh+XE6l0S/LU2
	hMzXUe1GaiWqo6fOe2vBqBE8lU9ATmWpOJgjK7gEgV+GK5ruN8RiVvZPb3rkv8QoTVeyAWE6lYR
	xL0HyJSnKBxQFBO8hlVxBHz35lE6Mht9qXgJOitR6b9BPSb3qp0MPaAUqy1B7awG5aNnETavTdy
	nESl43HhC6RdR9rr0tVpowHvSKDUr4K0mRk6chtJeACsZg7r2rGtih0/tB+5L4NigHExtVsBaSL
	pWtV36ffhJzvhBu8BOR0Z4ygjkxJJ6aY1d5Sk+PPWt7iLA==
X-Google-Smtp-Source: AGHT+IE+URM/7WRtjpozwMeTq7sRkXzNjsoBW5Csv74F/un6ZMf6jyGWcekqP9S8IBI5rDIoVRoXbg==
X-Received: by 2002:adf:fb0f:0:b0:385:e1f5:476f with SMTP id ffacd0b85a97d-38c52097393mr1591957f8f.39.1738147312975;
        Wed, 29 Jan 2025 02:41:52 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bad16sm17060559f8f.68.2025.01.29.02.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 02:41:52 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v2 1/2] rpm-sequoia: New recipe for version 1.6.0
Date: Wed, 29 Jan 2025 11:41:49 +0100
Message-ID: <20250129104150.2391653-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210365

rpm 4.20 removed the built-in code to handle signed packages
and uses rpm-sequoia as a more feature complete library.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../rpm-sequoia/rpm-sequoia-crates.inc        | 460 ++++++++++++++++++
 .../rpm-sequoia/rpm-sequoia_1.6.0.bb          |  57 +++
 2 files changed, 517 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
new file mode 100644
index 0000000000..e7d714c851
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
@@ -0,0 +1,460 @@
+# Autogenerated with 'bitbake -c update_crates rpm-sequoia'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/aead/0.5.2 \
+    crate://crates.io/aes/0.8.3 \
+    crate://crates.io/aes-gcm/0.10.3 \
+    crate://crates.io/aho-corasick/1.1.2 \
+    crate://crates.io/android-tzdata/0.1.1 \
+    crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/anstyle/1.0.4 \
+    crate://crates.io/anyhow/1.0.79 \
+    crate://crates.io/ascii-canvas/3.0.0 \
+    crate://crates.io/assert_cmd/2.0.13 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/base16ct/0.2.0 \
+    crate://crates.io/base64/0.21.7 \
+    crate://crates.io/base64ct/1.6.0 \
+    crate://crates.io/bindgen/0.68.1 \
+    crate://crates.io/bit-set/0.5.3 \
+    crate://crates.io/bit-vec/0.6.3 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.4.2 \
+    crate://crates.io/block-buffer/0.10.4 \
+    crate://crates.io/block-padding/0.3.3 \
+    crate://crates.io/blowfish/0.9.1 \
+    crate://crates.io/botan/0.10.7 \
+    crate://crates.io/botan-sys/0.10.5 \
+    crate://crates.io/bstr/1.9.0 \
+    crate://crates.io/buffered-reader/1.3.0 \
+    crate://crates.io/bumpalo/3.14.0 \
+    crate://crates.io/byteorder/1.5.0 \
+    crate://crates.io/camellia/0.1.0 \
+    crate://crates.io/cast5/0.11.1 \
+    crate://crates.io/cc/1.0.83 \
+    crate://crates.io/cdylib-link-lines/0.1.4 \
+    crate://crates.io/cexpr/0.6.0 \
+    crate://crates.io/cfb-mode/0.8.2 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.32 \
+    crate://crates.io/cipher/0.4.4 \
+    crate://crates.io/clang-sys/1.7.0 \
+    crate://crates.io/cmac/0.7.2 \
+    crate://crates.io/const-oid/0.9.6 \
+    crate://crates.io/core-foundation-sys/0.8.6 \
+    crate://crates.io/cpufeatures/0.2.12 \
+    crate://crates.io/crunchy/0.2.2 \
+    crate://crates.io/crypto-bigint/0.5.5 \
+    crate://crates.io/crypto-common/0.1.6 \
+    crate://crates.io/ctr/0.9.2 \
+    crate://crates.io/curve25519-dalek/4.1.1 \
+    crate://crates.io/curve25519-dalek-derive/0.1.1 \
+    crate://crates.io/dbl/0.3.2 \
+    crate://crates.io/der/0.7.8 \
+    crate://crates.io/des/0.8.1 \
+    crate://crates.io/diff/0.1.13 \
+    crate://crates.io/difflib/0.4.0 \
+    crate://crates.io/digest/0.10.7 \
+    crate://crates.io/dirs-next/2.0.0 \
+    crate://crates.io/dirs-sys-next/0.1.2 \
+    crate://crates.io/doc-comment/0.3.3 \
+    crate://crates.io/dsa/0.6.2 \
+    crate://crates.io/dyn-clone/1.0.16 \
+    crate://crates.io/eax/0.5.0 \
+    crate://crates.io/ecb/0.1.2 \
+    crate://crates.io/ecdsa/0.16.9 \
+    crate://crates.io/ed25519/2.2.3 \
+    crate://crates.io/ed25519-dalek/2.1.0 \
+    crate://crates.io/either/1.9.0 \
+    crate://crates.io/elliptic-curve/0.13.8 \
+    crate://crates.io/ena/0.14.2 \
+    crate://crates.io/equivalent/1.0.1 \
+    crate://crates.io/errno/0.3.8 \
+    crate://crates.io/fastrand/2.0.1 \
+    crate://crates.io/ff/0.13.0 \
+    crate://crates.io/fiat-crypto/0.2.5 \
+    crate://crates.io/fixedbitset/0.4.2 \
+    crate://crates.io/foreign-types/0.3.2 \
+    crate://crates.io/foreign-types-shared/0.1.1 \
+    crate://crates.io/generic-array/0.14.7 \
+    crate://crates.io/getrandom/0.2.12 \
+    crate://crates.io/ghash/0.5.0 \
+    crate://crates.io/glob/0.3.1 \
+    crate://crates.io/group/0.13.0 \
+    crate://crates.io/hashbrown/0.14.3 \
+    crate://crates.io/hermit-abi/0.3.4 \
+    crate://crates.io/hkdf/0.12.4 \
+    crate://crates.io/hmac/0.12.1 \
+    crate://crates.io/iana-time-zone/0.1.59 \
+    crate://crates.io/iana-time-zone-haiku/0.1.2 \
+    crate://crates.io/idea/0.5.1 \
+    crate://crates.io/idna/0.4.0 \
+    crate://crates.io/indexmap/2.1.0 \
+    crate://crates.io/inout/0.1.3 \
+    crate://crates.io/is-terminal/0.4.10 \
+    crate://crates.io/itertools/0.10.5 \
+    crate://crates.io/js-sys/0.3.67 \
+    crate://crates.io/lalrpop/0.20.0 \
+    crate://crates.io/lalrpop-util/0.20.0 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/lazycell/1.3.0 \
+    crate://crates.io/libc/0.2.152 \
+    crate://crates.io/libloading/0.8.1 \
+    crate://crates.io/libm/0.2.8 \
+    crate://crates.io/libredox/0.0.1 \
+    crate://crates.io/linux-raw-sys/0.4.13 \
+    crate://crates.io/lock_api/0.4.11 \
+    crate://crates.io/log/0.4.20 \
+    crate://crates.io/md-5/0.10.6 \
+    crate://crates.io/memchr/2.7.1 \
+    crate://crates.io/memsec/0.6.3 \
+    crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/nettle/7.3.0 \
+    crate://crates.io/nettle-sys/2.3.0 \
+    crate://crates.io/new_debug_unreachable/1.0.4 \
+    crate://crates.io/nom/7.1.3 \
+    crate://crates.io/num-bigint-dig/0.8.4 \
+    crate://crates.io/num-integer/0.1.45 \
+    crate://crates.io/num-iter/0.1.43 \
+    crate://crates.io/num-traits/0.2.17 \
+    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/opaque-debug/0.3.0 \
+    crate://crates.io/openssl/0.10.63 \
+    crate://crates.io/openssl-macros/0.1.1 \
+    crate://crates.io/openssl-sys/0.9.99 \
+    crate://crates.io/p256/0.13.2 \
+    crate://crates.io/parking_lot/0.12.1 \
+    crate://crates.io/parking_lot_core/0.9.9 \
+    crate://crates.io/peeking_take_while/0.1.2 \
+    crate://crates.io/pem-rfc7468/0.7.0 \
+    crate://crates.io/petgraph/0.6.4 \
+    crate://crates.io/phf_shared/0.10.0 \
+    crate://crates.io/pkcs1/0.7.5 \
+    crate://crates.io/pkcs8/0.10.2 \
+    crate://crates.io/pkg-config/0.3.29 \
+    crate://crates.io/platforms/3.3.0 \
+    crate://crates.io/polyval/0.6.1 \
+    crate://crates.io/ppv-lite86/0.2.17 \
+    crate://crates.io/precomputed-hash/0.1.1 \
+    crate://crates.io/predicates/3.1.0 \
+    crate://crates.io/predicates-core/1.0.6 \
+    crate://crates.io/predicates-tree/1.0.9 \
+    crate://crates.io/primeorder/0.13.6 \
+    crate://crates.io/proc-macro2/1.0.78 \
+    crate://crates.io/quote/1.0.35 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.4 \
+    crate://crates.io/redox_syscall/0.4.1 \
+    crate://crates.io/redox_users/0.4.4 \
+    crate://crates.io/regex/1.10.3 \
+    crate://crates.io/regex-automata/0.4.4 \
+    crate://crates.io/regex-syntax/0.7.5 \
+    crate://crates.io/regex-syntax/0.8.2 \
+    crate://crates.io/rfc6979/0.4.0 \
+    crate://crates.io/ripemd/0.1.3 \
+    crate://crates.io/rsa/0.9.6 \
+    crate://crates.io/rustc-hash/1.1.0 \
+    crate://crates.io/rustc_version/0.4.0 \
+    crate://crates.io/rustix/0.38.30 \
+    crate://crates.io/rustversion/1.0.14 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/sec1/0.7.3 \
+    crate://crates.io/semver/1.0.21 \
+    crate://crates.io/sequoia-openpgp/1.17.0 \
+    crate://crates.io/sequoia-policy-config/0.6.0 \
+    crate://crates.io/serde/1.0.195 \
+    crate://crates.io/serde_derive/1.0.195 \
+    crate://crates.io/sha1collisiondetection/0.3.3 \
+    crate://crates.io/sha2/0.10.8 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/signature/2.2.0 \
+    crate://crates.io/siphasher/0.3.11 \
+    crate://crates.io/smallvec/1.13.1 \
+    crate://crates.io/spin/0.5.2 \
+    crate://crates.io/spki/0.7.3 \
+    crate://crates.io/string_cache/0.8.7 \
+    crate://crates.io/subtle/2.5.0 \
+    crate://crates.io/syn/2.0.48 \
+    crate://crates.io/tempfile/3.9.0 \
+    crate://crates.io/term/0.7.0 \
+    crate://crates.io/termtree/0.4.1 \
+    crate://crates.io/thiserror/1.0.56 \
+    crate://crates.io/thiserror-impl/1.0.56 \
+    crate://crates.io/tiny-keccak/2.0.2 \
+    crate://crates.io/tinyvec/1.6.0 \
+    crate://crates.io/tinyvec_macros/0.1.1 \
+    crate://crates.io/toml/0.5.11 \
+    crate://crates.io/twofish/0.7.1 \
+    crate://crates.io/typenum/1.17.0 \
+    crate://crates.io/unicode-bidi/0.3.15 \
+    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/unicode-normalization/0.1.22 \
+    crate://crates.io/unicode-xid/0.2.4 \
+    crate://crates.io/universal-hash/0.5.1 \
+    crate://crates.io/vcpkg/0.2.15 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/wait-timeout/0.2.0 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasm-bindgen/0.2.90 \
+    crate://crates.io/wasm-bindgen-backend/0.2.90 \
+    crate://crates.io/wasm-bindgen-macro/0.2.90 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.90 \
+    crate://crates.io/wasm-bindgen-shared/0.2.90 \
+    crate://crates.io/win-crypto-ng/0.5.1 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-core/0.52.0 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows-targets/0.52.0 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.0 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.52.0 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.52.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.0 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.52.0 \
+    crate://crates.io/x25519-dalek/2.0.0 \
+    crate://crates.io/xxhash-rust/0.8.8 \
+    crate://crates.io/zeroize/1.7.0 \
+    crate://crates.io/zeroize_derive/1.4.2 \
+"
+
+SRC_URI[aead-0.5.2.sha256sum] = "d122413f284cf2d62fb1b7db97e02edb8cda96d769b16e443a4f6195e35662b0"
+SRC_URI[aes-0.8.3.sha256sum] = "ac1f845298e95f983ff1944b728ae08b8cebab80d684f0a832ed0fc74dfa27e2"
+SRC_URI[aes-gcm-0.10.3.sha256sum] = "831010a0f742e1209b3bcea8fab6a8e149051ba6099432c8cb2cc117dec3ead1"
+SRC_URI[aho-corasick-1.1.2.sha256sum] = "b2969dcb958b36655471fc61f7e416fa76033bdd4bfed0678d8fee1e2d07a1f0"
+SRC_URI[android-tzdata-0.1.1.sha256sum] = "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
+SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
+SRC_URI[anstyle-1.0.4.sha256sum] = "7079075b41f533b8c61d2a4d073c4676e1f8b249ff94a393b0595db304e0dd87"
+SRC_URI[anyhow-1.0.79.sha256sum] = "080e9890a082662b09c1ad45f567faeeb47f22b5fb23895fbe1e651e718e25ca"
+SRC_URI[ascii-canvas-3.0.0.sha256sum] = "8824ecca2e851cec16968d54a01dd372ef8f95b244fb84b84e70128be347c3c6"
+SRC_URI[assert_cmd-2.0.13.sha256sum] = "00ad3f3a942eee60335ab4342358c161ee296829e0d16ff42fc1d6cb07815467"
+SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[base16ct-0.2.0.sha256sum] = "4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf"
+SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
+SRC_URI[base64ct-1.6.0.sha256sum] = "8c3c1a368f70d6cf7302d78f8f7093da241fb8e8807c05cc9e51a125895a6d5b"
+SRC_URI[bindgen-0.68.1.sha256sum] = "726e4313eb6ec35d2730258ad4e15b547ee75d6afaa1361a922e78e59b7d8078"
+SRC_URI[bit-set-0.5.3.sha256sum] = "0700ddab506f33b20a03b13996eccd309a48e5ff77d0d95926aa0210fb4e95f1"
+SRC_URI[bit-vec-0.6.3.sha256sum] = "349f9b6a179ed607305526ca489b34ad0a41aed5f7980fa90eb03160b69598fb"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.4.2.sha256sum] = "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
+SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
+SRC_URI[block-padding-0.3.3.sha256sum] = "a8894febbff9f758034a5b8e12d87918f56dfc64a8e1fe757d65e29041538d93"
+SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
+SRC_URI[botan-0.10.7.sha256sum] = "350081af1a3c6883f8a1f863ac553bfe6922589aad60008a70947765ed57c53e"
+SRC_URI[botan-sys-0.10.5.sha256sum] = "9f49dde1b8ebd2996cc41c55c39f6ef8b54e38148d8973aeba0792b87b1621ca"
+SRC_URI[bstr-1.9.0.sha256sum] = "c48f0051a4b4c5e0b6d365cd04af53aeaa209e3cc15ec2cdb69e73cc87fbd0dc"
+SRC_URI[buffered-reader-1.3.0.sha256sum] = "2b9b0a25eb06e83579bc985d836e1e3b957a7201301b48538764d2b2e78090d4"
+SRC_URI[bumpalo-3.14.0.sha256sum] = "7f30e7476521f6f8af1a1c4c0b8cc94f0bee37d91763d0ca2665f299b6cd8aec"
+SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
+SRC_URI[camellia-0.1.0.sha256sum] = "3264e2574e9ef2b53ce6f536dea83a69ac0bc600b762d1523ff83fe07230ce30"
+SRC_URI[cast5-0.11.1.sha256sum] = "26b07d673db1ccf000e90f54b819db9e75a8348d6eb056e9b8ab53231b7a9911"
+SRC_URI[cc-1.0.83.sha256sum] = "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
+SRC_URI[cdylib-link-lines-0.1.4.sha256sum] = "a317db7ea5b455731e51d7f632762716fa5c0b1098dcaa6221e55e2386d170f2"
+SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
+SRC_URI[cfb-mode-0.8.2.sha256sum] = "738b8d467867f80a71351933f70461f5b56f24d5c93e0cf216e59229c968d330"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[chrono-0.4.32.sha256sum] = "41daef31d7a747c5c847246f36de49ced6f7403b4cdabc807a97b5cc184cda7a"
+SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
+SRC_URI[clang-sys-1.7.0.sha256sum] = "67523a3b4be3ce1989d607a828d036249522dd9c1c8de7f4dd2dae43a37369d1"
+SRC_URI[cmac-0.7.2.sha256sum] = "8543454e3c3f5126effff9cd44d562af4e31fb8ce1cc0d3dcd8f084515dbc1aa"
+SRC_URI[const-oid-0.9.6.sha256sum] = "c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8"
+SRC_URI[core-foundation-sys-0.8.6.sha256sum] = "06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f"
+SRC_URI[cpufeatures-0.2.12.sha256sum] = "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504"
+SRC_URI[crunchy-0.2.2.sha256sum] = "7a81dae078cea95a014a339291cec439d2f232ebe854a9d672b796c6afafa9b7"
+SRC_URI[crypto-bigint-0.5.5.sha256sum] = "0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76"
+SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
+SRC_URI[ctr-0.9.2.sha256sum] = "0369ee1ad671834580515889b80f2ea915f23b8be8d0daa4bbaf2ac5c7590835"
+SRC_URI[curve25519-dalek-4.1.1.sha256sum] = "e89b8c6a2e4b1f45971ad09761aafb85514a84744b67a95e32c3cc1352d1f65c"
+SRC_URI[curve25519-dalek-derive-0.1.1.sha256sum] = "f46882e17999c6cc590af592290432be3bce0428cb0d5f8b6715e4dc7b383eb3"
+SRC_URI[dbl-0.3.2.sha256sum] = "bd2735a791158376708f9347fe8faba9667589d82427ef3aed6794a8981de3d9"
+SRC_URI[der-0.7.8.sha256sum] = "fffa369a668c8af7dbf8b5e56c9f744fbd399949ed171606040001947de40b1c"
+SRC_URI[des-0.8.1.sha256sum] = "ffdd80ce8ce993de27e9f063a444a4d53ce8e8db4c1f00cc03af5ad5a9867a1e"
+SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
+SRC_URI[difflib-0.4.0.sha256sum] = "6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8"
+SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
+SRC_URI[dirs-next-2.0.0.sha256sum] = "b98cf8ebf19c3d1b223e151f99a4f9f0690dca41414773390fc824184ac833e1"
+SRC_URI[dirs-sys-next-0.1.2.sha256sum] = "4ebda144c4fe02d1f7ea1a7d9641b6fc6b580adcfa024ae48797ecdeb6825b4d"
+SRC_URI[doc-comment-0.3.3.sha256sum] = "fea41bba32d969b513997752735605054bc0dfa92b4c56bf1189f2e174be7a10"
+SRC_URI[dsa-0.6.2.sha256sum] = "d88afbb2443ba68ef8593de497e830b2e276434e1408f85cd760b1107b44ead0"
+SRC_URI[dyn-clone-1.0.16.sha256sum] = "545b22097d44f8a9581187cdf93de7a71e4722bf51200cfaba810865b49a495d"
+SRC_URI[eax-0.5.0.sha256sum] = "9954fabd903b82b9d7a68f65f97dc96dd9ad368e40ccc907a7c19d53e6bfac28"
+SRC_URI[ecb-0.1.2.sha256sum] = "1a8bfa975b1aec2145850fcaa1c6fe269a16578c44705a532ae3edc92b8881c7"
+SRC_URI[ecdsa-0.16.9.sha256sum] = "ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca"
+SRC_URI[ed25519-2.2.3.sha256sum] = "115531babc129696a58c64a4fef0a8bf9e9698629fb97e9e40767d235cfbcd53"
+SRC_URI[ed25519-dalek-2.1.0.sha256sum] = "1f628eaec48bfd21b865dc2950cfa014450c01d2fa2b69a86c2fd5844ec523c0"
+SRC_URI[either-1.9.0.sha256sum] = "a26ae43d7bcc3b814de94796a5e736d4029efb0ee900c12e2d54c993ad1a1e07"
+SRC_URI[elliptic-curve-0.13.8.sha256sum] = "b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47"
+SRC_URI[ena-0.14.2.sha256sum] = "c533630cf40e9caa44bd91aadc88a75d75a4c3a12b4cfde353cbed41daa1e1f1"
+SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
+SRC_URI[errno-0.3.8.sha256sum] = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245"
+SRC_URI[fastrand-2.0.1.sha256sum] = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
+SRC_URI[ff-0.13.0.sha256sum] = "ded41244b729663b1e574f1b4fb731469f69f79c17667b5d776b16cda0479449"
+SRC_URI[fiat-crypto-0.2.5.sha256sum] = "27573eac26f4dd11e2b1916c3fe1baa56407c83c71a773a8ba17ec0bca03b6b7"
+SRC_URI[fixedbitset-0.4.2.sha256sum] = "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
+SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
+SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
+SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
+SRC_URI[getrandom-0.2.12.sha256sum] = "190092ea657667030ac6a35e305e62fc4dd69fd98ac98631e5d3a2b1575a12b5"
+SRC_URI[ghash-0.5.0.sha256sum] = "d930750de5717d2dd0b8c0d42c076c0e884c81a73e6cab859bbd2339c71e3e40"
+SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
+SRC_URI[group-0.13.0.sha256sum] = "f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63"
+SRC_URI[hashbrown-0.14.3.sha256sum] = "290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604"
+SRC_URI[hermit-abi-0.3.4.sha256sum] = "5d3d0e0f38255e7fa3cf31335b3a56f05febd18025f4db5ef7a0cfb4f8da651f"
+SRC_URI[hkdf-0.12.4.sha256sum] = "7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7"
+SRC_URI[hmac-0.12.1.sha256sum] = "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
+SRC_URI[iana-time-zone-0.1.59.sha256sum] = "b6a67363e2aa4443928ce15e57ebae94fd8949958fd1223c4cfc0cd473ad7539"
+SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
+SRC_URI[idea-0.5.1.sha256sum] = "075557004419d7f2031b8bb7f44bb43e55a83ca7b63076a8fb8fe75753836477"
+SRC_URI[idna-0.4.0.sha256sum] = "7d20d6b07bfbc108882d88ed8e37d39636dcc260e15e30c45e6ba089610b917c"
+SRC_URI[indexmap-2.1.0.sha256sum] = "d530e1a18b1cb4c484e6e34556a0d948706958449fca0cab753d649f2bce3d1f"
+SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
+SRC_URI[is-terminal-0.4.10.sha256sum] = "0bad00257d07be169d870ab665980b06cdb366d792ad690bf2e76876dc503455"
+SRC_URI[itertools-0.10.5.sha256sum] = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
+SRC_URI[js-sys-0.3.67.sha256sum] = "9a1d36f1235bc969acba30b7f5990b864423a6068a10f7c90ae8f0112e3a59d1"
+SRC_URI[lalrpop-0.20.0.sha256sum] = "da4081d44f4611b66c6dd725e6de3169f9f63905421e8626fcb86b6a898998b8"
+SRC_URI[lalrpop-util-0.20.0.sha256sum] = "3f35c735096c0293d313e8f2a641627472b83d01b937177fe76e5e2708d31e0d"
+SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
+SRC_URI[lazycell-1.3.0.sha256sum] = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
+SRC_URI[libc-0.2.152.sha256sum] = "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
+SRC_URI[libloading-0.8.1.sha256sum] = "c571b676ddfc9a8c12f1f3d3085a7b163966a8fd8098a90640953ce5f6170161"
+SRC_URI[libm-0.2.8.sha256sum] = "4ec2a862134d2a7d32d7983ddcdd1c4923530833c9f2ea1a44fc5fa473989058"
+SRC_URI[libredox-0.0.1.sha256sum] = "85c833ca1e66078851dba29046874e38f08b2c883700aa29a03ddd3b23814ee8"
+SRC_URI[linux-raw-sys-0.4.13.sha256sum] = "01cda141df6706de531b6c46c3a33ecca755538219bd484262fa09410c13539c"
+SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
+SRC_URI[log-0.4.20.sha256sum] = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f"
+SRC_URI[md-5-0.10.6.sha256sum] = "d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf"
+SRC_URI[memchr-2.7.1.sha256sum] = "523dc4f511e55ab87b694dc30d0f820d60906ef06413f93d4d7a1385599cc149"
+SRC_URI[memsec-0.6.3.sha256sum] = "0fa0916b001582d253822171bd23f4a0229d32b9507fae236f5da8cad515ba7c"
+SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[nettle-7.3.0.sha256sum] = "b9fdccf3eae7b161910d2daa2f0155ca35041322e8fe5c5f1f2c9d0b12356336"
+SRC_URI[nettle-sys-2.3.0.sha256sum] = "b495053a10a19a80e3a26bf1212e92e29350797b5f5bdc58268c3f3f818e66ec"
+SRC_URI[new_debug_unreachable-1.0.4.sha256sum] = "e4a24736216ec316047a1fc4252e27dabb04218aa4a3f37c6e7ddbf1f9782b54"
+SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
+SRC_URI[num-bigint-dig-0.8.4.sha256sum] = "dc84195820f291c7697304f3cbdadd1cb7199c0efc917ff5eafd71225c136151"
+SRC_URI[num-integer-0.1.45.sha256sum] = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
+SRC_URI[num-iter-0.1.43.sha256sum] = "7d03e6c028c5dc5cac6e2dec0efda81fc887605bb3d884578bb6d6bf7514e252"
+SRC_URI[num-traits-0.2.17.sha256sum] = "39e3200413f237f41ab11ad6d161bc7239c84dcb631773ccd7de3dfe4b5c267c"
+SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
+SRC_URI[opaque-debug-0.3.0.sha256sum] = "624a8340c38c1b80fd549087862da4ba43e08858af025b236e509b6649fc13d5"
+SRC_URI[openssl-0.10.63.sha256sum] = "15c9d69dd87a29568d4d017cfe8ec518706046a05184e5aea92d0af890b803c8"
+SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
+SRC_URI[openssl-sys-0.9.99.sha256sum] = "22e1bf214306098e4832460f797824c05d25aacdf896f64a985fb0fd992454ae"
+SRC_URI[p256-0.13.2.sha256sum] = "c9863ad85fa8f4460f9c48cb909d38a0d689dba1f6f6988a5e3e0d31071bcd4b"
+SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
+SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
+SRC_URI[peeking_take_while-0.1.2.sha256sum] = "19b17cddbe7ec3f8bc800887bab5e717348c95ea2ca0b1bf0837fb964dc67099"
+SRC_URI[pem-rfc7468-0.7.0.sha256sum] = "88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412"
+SRC_URI[petgraph-0.6.4.sha256sum] = "e1d3afd2628e69da2be385eb6f2fd57c8ac7977ceeff6dc166ff1657b0e386a9"
+SRC_URI[phf_shared-0.10.0.sha256sum] = "b6796ad771acdc0123d2a88dc428b5e38ef24456743ddb1744ed628f9815c096"
+SRC_URI[pkcs1-0.7.5.sha256sum] = "c8ffb9f10fa047879315e6625af03c164b16962a5368d724ed16323b68ace47f"
+SRC_URI[pkcs8-0.10.2.sha256sum] = "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
+SRC_URI[pkg-config-0.3.29.sha256sum] = "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
+SRC_URI[platforms-3.3.0.sha256sum] = "626dec3cac7cc0e1577a2ec3fc496277ec2baa084bebad95bb6fdbfae235f84c"
+SRC_URI[polyval-0.6.1.sha256sum] = "d52cff9d1d4dee5fe6d03729099f4a310a41179e0a10dbf542039873f2e826fb"
+SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
+SRC_URI[precomputed-hash-0.1.1.sha256sum] = "925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c"
+SRC_URI[predicates-3.1.0.sha256sum] = "68b87bfd4605926cdfefc1c3b5f8fe560e3feca9d5552cf68c466d3d8236c7e8"
+SRC_URI[predicates-core-1.0.6.sha256sum] = "b794032607612e7abeb4db69adb4e33590fa6cf1149e95fd7cb00e634b92f174"
+SRC_URI[predicates-tree-1.0.9.sha256sum] = "368ba315fb8c5052ab692e68a0eefec6ec57b23a36959c14496f0b0df2c0cecf"
+SRC_URI[primeorder-0.13.6.sha256sum] = "353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6"
+SRC_URI[proc-macro2-1.0.78.sha256sum] = "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
+SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
+SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
+SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
+SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
+SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
+SRC_URI[redox_users-0.4.4.sha256sum] = "a18479200779601e498ada4e8c1e1f50e3ee19deb0259c25825a98b5603b2cb4"
+SRC_URI[regex-1.10.3.sha256sum] = "b62dbe01f0b06f9d8dc7d49e05a0785f153b00b2c227856282f671e0318c9b15"
+SRC_URI[regex-automata-0.4.4.sha256sum] = "3b7fa1134405e2ec9353fd416b17f8dacd46c473d7d3fd1cf202706a14eb792a"
+SRC_URI[regex-syntax-0.7.5.sha256sum] = "dbb5fb1acd8a1a18b3dd5be62d25485eb770e05afb408a9627d14d451bae12da"
+SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
+SRC_URI[rfc6979-0.4.0.sha256sum] = "f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2"
+SRC_URI[ripemd-0.1.3.sha256sum] = "bd124222d17ad93a644ed9d011a40f4fb64aa54275c08cc216524a9ea82fb09f"
+SRC_URI[rsa-0.9.6.sha256sum] = "5d0e5124fcb30e76a7e79bfee683a2746db83784b86289f6251b54b7950a0dfc"
+SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
+SRC_URI[rustc_version-0.4.0.sha256sum] = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
+SRC_URI[rustix-0.38.30.sha256sum] = "322394588aaf33c24007e8bb3238ee3e4c5c09c084ab32bc73890b99ff326bca"
+SRC_URI[rustversion-1.0.14.sha256sum] = "7ffc183a10b4478d04cbbbfc96d0873219d962dd5accaff2ffbd4ceb7df837f4"
+SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[sec1-0.7.3.sha256sum] = "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc"
+SRC_URI[semver-1.0.21.sha256sum] = "b97ed7a9823b74f99c7742f5336af7be5ecd3eeafcb1507d1fa93347b1d589b0"
+SRC_URI[sequoia-openpgp-1.17.0.sha256sum] = "2ea026cf8a70d331c742e3ad7e68fd405d0743ff86630fb4334a1bf8d0e194c7"
+SRC_URI[sequoia-policy-config-0.6.0.sha256sum] = "757d45d308f2bd9c0d6fdd640f320998ad24856bdf2890ddd28d3c3b85808274"
+SRC_URI[serde-1.0.195.sha256sum] = "63261df402c67811e9ac6def069e4786148c4563f4b50fd4bf30aa370d626b02"
+SRC_URI[serde_derive-1.0.195.sha256sum] = "46fe8f8603d81ba86327b23a2e9cdf49e1255fb94a4c5f297f6ee0547178ea2c"
+SRC_URI[sha1collisiondetection-0.3.3.sha256sum] = "f1d5c4be690002e8a5d7638b0b7323f03c268c7a919bd8af69ce963a4dc83220"
+SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
+SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[signature-2.2.0.sha256sum] = "77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de"
+SRC_URI[siphasher-0.3.11.sha256sum] = "38b58827f4464d87d377d175e90bf58eb00fd8716ff0a62f80356b5e61555d0d"
+SRC_URI[smallvec-1.13.1.sha256sum] = "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
+SRC_URI[spin-0.5.2.sha256sum] = "6e63cff320ae2c57904679ba7cb63280a3dc4613885beafb148ee7bf9aa9042d"
+SRC_URI[spki-0.7.3.sha256sum] = "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d"
+SRC_URI[string_cache-0.8.7.sha256sum] = "f91138e76242f575eb1d3b38b4f1362f10d3a43f47d182a5b359af488a02293b"
+SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
+SRC_URI[syn-2.0.48.sha256sum] = "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
+SRC_URI[tempfile-3.9.0.sha256sum] = "01ce4141aa927a6d1bd34a041795abd0db1cccba5d5f24b009f694bdf3a1f3fa"
+SRC_URI[term-0.7.0.sha256sum] = "c59df8ac95d96ff9bede18eb7300b0fda5e5d8d90960e76f8e14ae765eedbf1f"
+SRC_URI[termtree-0.4.1.sha256sum] = "3369f5ac52d5eb6ab48c6b4ffdc8efbcad6b89c765749064ba298f2c68a16a76"
+SRC_URI[thiserror-1.0.56.sha256sum] = "d54378c645627613241d077a3a79db965db602882668f9136ac42af9ecb730ad"
+SRC_URI[thiserror-impl-1.0.56.sha256sum] = "fa0faa943b50f3db30a20aa7e265dbc66076993efed8463e8de414e5d06d3471"
+SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
+SRC_URI[tinyvec-1.6.0.sha256sum] = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
+SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
+SRC_URI[toml-0.5.11.sha256sum] = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
+SRC_URI[twofish-0.7.1.sha256sum] = "a78e83a30223c757c3947cd144a31014ff04298d8719ae10d03c31c0448c8013"
+SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
+SRC_URI[unicode-bidi-0.3.15.sha256sum] = "08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fed8d75"
+SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+SRC_URI[unicode-normalization-0.1.22.sha256sum] = "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
+SRC_URI[unicode-xid-0.2.4.sha256sum] = "f962df74c8c05a667b5ee8bcf162993134c104e96440b663c8daa176dc772d8c"
+SRC_URI[universal-hash-0.5.1.sha256sum] = "fc1de2c688dc15305988b563c3854064043356019f97a4b46276fe734c4f07ea"
+SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
+SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
+SRC_URI[wait-timeout-0.2.0.sha256sum] = "9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6"
+SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[wasm-bindgen-0.2.90.sha256sum] = "b1223296a201415c7fad14792dbefaace9bd52b62d33453ade1c5b5f07555406"
+SRC_URI[wasm-bindgen-backend-0.2.90.sha256sum] = "fcdc935b63408d58a32f8cc9738a0bffd8f05cc7c002086c6ef20b7312ad9dcd"
+SRC_URI[wasm-bindgen-macro-0.2.90.sha256sum] = "3e4c238561b2d428924c49815533a8b9121c664599558a5d9ec51f8a1740a999"
+SRC_URI[wasm-bindgen-macro-support-0.2.90.sha256sum] = "bae1abb6806dc1ad9e560ed242107c0f6c84335f1749dd4e8ddb012ebd5e25a7"
+SRC_URI[wasm-bindgen-shared-0.2.90.sha256sum] = "4d91413b1c31d7539ba5ef2451af3f0b833a005eb27a631cec32bc0635a8602b"
+SRC_URI[win-crypto-ng-0.5.1.sha256sum] = "99abfb435a71e54ab2971d8d8c32f1a7e006cdbf527f71743b1d45b93517bb92"
+SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-core-0.52.0.sha256sum] = "33ab640c8d7e35bf8ba19b884ba838ceb4fba93a4e8c65a9059d08afcfc683d9"
+SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows-targets-0.52.0.sha256sum] = "8a18201040b24831fbb9e4eb208f8892e1f50a37feb53cc7ff887feb8f50e7cd"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_gnullvm-0.52.0.sha256sum] = "cb7764e35d4db8a7921e09562a0304bf2f93e0a51bfccee0bd0bb0b666b015ea"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_aarch64_msvc-0.52.0.sha256sum] = "bbaa0368d4f1d2aaefc55b6fcfee13f41544ddf36801e793edbbfd7d7df075ef"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_gnu-0.52.0.sha256sum] = "a28637cb1fa3560a16915793afb20081aba2c92ee8af57b4d5f28e4b3e7df313"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_i686_msvc-0.52.0.sha256sum] = "ffe5e8e31046ce6230cc7215707b816e339ff4d4d67c65dffa206fd0f7aa7b9a"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnu-0.52.0.sha256sum] = "3d6fa32db2bc4a2f5abeacf2b69f7992cd09dca97498da74a151a3132c26befd"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_gnullvm-0.52.0.sha256sum] = "1a657e1e9d3f514745a572a6846d3c7aa7dbe1658c056ed9c3344c4109a6949e"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[windows_x86_64_msvc-0.52.0.sha256sum] = "dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04"
+SRC_URI[x25519-dalek-2.0.0.sha256sum] = "fb66477291e7e8d2b0ff1bcb900bf29489a9692816d79874bea351e7a8b6de96"
+SRC_URI[xxhash-rust-0.8.8.sha256sum] = "53be06678ed9e83edb1745eb72efc0bbcd7b5c3c35711a860906aed827a13d61"
+SRC_URI[zeroize-1.7.0.sha256sum] = "525b4ec142c6b68a2d10f01f7bbf6755599ca3f81ea53b8431b7dd348f5fdb2d"
+SRC_URI[zeroize_derive-1.4.2.sha256sum] = "ce36e65b0d2999d2aafac989fb249189a141aee1f53c612c1f37d72631959f69"
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb
new file mode 100644
index 0000000000..b13d2028bc
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb
@@ -0,0 +1,57 @@
+SUMMARY = "An OpenPGP backend for rpm using Sequoia PGP"
+HOMEPAGE = "https://sequoia-pgp.org/"
+
+# The license line is taken verbatim from Fedora's specfile
+# with formatting differences for Yocto. (AND -> &, OR -> |)
+# https://kojipkgs.fedoraproject.org//packages/rust-rpm-sequoia/1.7.0/3.fc41/src/rust-rpm-sequoia-1.7.0-3.fc41.src.rpm
+LICENSE = "LGPL-2.0-or-later & Apache-2.0 & BSL-1.0 & MIT & Unicode-DFS-2016 & (Apache-2.0 | MIT) & (MIT | Apache-2.0 | Zlib) & (Unlicense | MIT)"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0ff5ff7747cf7d394079c6ae87f5f0c"
+
+DEPENDS = "openssl"
+
+inherit pkgconfig rust cargo cargo-update-recipe-crates
+
+SRC_URI = "git://github.com/rpm-software-management/rpm-sequoia.git;protocol=https;branch=main"
+
+SRCREV = "739a606da6ea1e836a415a1fd7899f36b7fd5a38"
+
+S = "${UNPACKDIR}/git"
+
+require ${BPN}-crates.inc
+
+CARGO_BUILD_FLAGS += "--no-default-features --features crypto-openssl"
+CARGO_INSTALL_LIBRARIES = "1"
+
+do_compile:prepend () {
+	# rpm-sequoia.pc is generated in the source directory
+	# but the target directory does not exist there.
+	mkdir -p ${S}/target/release
+
+	# From rpm-sequoia's README.md:
+	#
+	# We also set two environment variables when calling `cargo build`:
+	# * `PREFIX` is the prefix that will be used in the generated
+	#   `rpm-sequoia.pc` file. It defaults to `/usr/local`.
+	# * `LIBDIR` is the installed library path listed in the generated
+	#   metadata. It can be an absolute path or one based on `${prefix}`,
+	#   and defaults to `${prefix}/lib`.
+
+	export PREFIX="${prefix}"
+	export LIBDIR="${libdir}"
+}
+
+do_install:append () {
+	# Move the library to the correct location expected by rpm-sequoia.pc
+	mkdir -p ${D}${libdir}
+	mv ${D}${rustlibdir}/librpm_sequoia.so ${D}${libdir}/librpm_sequoia.so.1
+	ln -s librpm_sequoia.so.1 ${D}${libdir}/librpm_sequoia.so
+
+	rmdir -p --ignore-fail-on-non-empty ${D}${rustlibdir}
+
+	# rpm-sequoia does not install its pkgconfig file. Do it manually.
+	mkdir -p ${D}${libdir}/pkgconfig
+	install -m644 ${S}/target/release/rpm-sequoia.pc ${D}${libdir}/pkgconfig
+}
+
+BBCLASSEXTEND = "native"
-- 
2.48.1


