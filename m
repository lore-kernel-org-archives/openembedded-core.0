Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.504.1623703896525240239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 13:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d7jNEkLT;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id g8so18796683ejx.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 13:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/OMGUGIBfyGn4VFHZYpz67dG/Vpi5TAoGgiooz5zJkY=;
        b=d7jNEkLTK64D36a8CeSySgSOa6A5ox3qxoj8TSVyTpfJmYkg1tgPRZK8A6yMYXCGWH
         BJcPtijyFskLnqceQ1pUL7qafdKPVUi+y9fXODo0ZThKapBYhdY8TvQahChCf9MhQHnE
         PpvGC7AMzFDJfB98I640vkyd+dAWUSLCzyi4ClSc6mAQvOfOaUWgT6dZNDLxvdTXquJp
         mCUk5QTCgvxAkNJR87HS1pjeZHkPDJFbuOq7muiXQ6A6J9NV/xSY+hSWFTY5tUFblGtn
         Eifh6dCcxbWjbjmg8tIM1AXFQkpEGtAz5C4kMjLjFRDBOn+cBw5dvJxphDL2ABdxVk/z
         ltmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/OMGUGIBfyGn4VFHZYpz67dG/Vpi5TAoGgiooz5zJkY=;
        b=Ir9lxqbJ/sg8/mspO6RuNwl4P6WRRuQ5gp427xQcfTSgzOumQQn+mx6y8K1yjdlEEY
         tD6hjctcj3/tny1EcEqSdGEiFbQ2haDZUZmYNzz8a/byJsKjKG45xbk2PgH9CTDHRCOH
         NpkcpeIeU0FWUW/J06gO+XMoScj+Mieq8k1fQteazheSCYfoizZ5psoVCJdcaqTqvdBI
         eMOO6Wtw7bGSGUHG6VRIlpLUADV6LHdlCrB89s4tX4ElaSQAnOXh6ruBBOJLt0laKWeP
         zTH7WthwHsDqrFeCXsk0gyz9X0xmFEP34aTSdtCCHWecyxht3mfVAeqGIG15k76jKEkh
         idcQ==
X-Gm-Message-State: AOAM533qTk0MBpsfmiwtf1oxLMTvYGG3MFsMZwWiddb12zHaGutuFhkG
	zvRMLc6rdGyPtDqqhEG2uCrcIOi2ia3w2Q==
X-Google-Smtp-Source: ABdhPJx7g4e5F+/CjE8JOqkV8V3eAwsqhsGh2ZAsMzJyNlTzkVkPR7Jk9tjP/mQaiEE38osWupmULA==
X-Received: by 2002:a17:906:3181:: with SMTP id 1mr17432018ejy.36.1623703894853;
        Mon, 14 Jun 2021 13:51:34 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f10ae4125962954aa99f170.dip0.t-ipconnect.de. [2003:f0:7f10:ae41:2596:2954:aa99:f170])
        by smtp.gmail.com with ESMTPSA id s10sm8074357ejf.54.2021.06.14.13.51.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 13:51:33 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] libpcap: upgrade 1.10.0 -> 1.10.1
Date: Mon, 14 Jun 2021 22:51:22 +0200
Message-Id: <20210614205126.1680546-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Summary for 1.10.1 libpcap release
  Packet filtering:
    Fix "type XXX subtype YYY" giving a parse error
  Source code:
    Add PCAP_AVAILABLE_1_11.
  Building and testing:
    Rename struct bpf_aux_data to avoid NetBSD compile errors
    Squelch some compiler warnings
    Squelch some Bison warnings
    Fix cross-builds with older kernels lacking BPF_MOD and BPF_XOR
    Fix Bison detection for minor version 0.
    Fix parallel build with FreeBSD make.
    Get DLT_MATCHING_MAX right in gencode.c on NetBSD.
    Define timeradd() and timersub() if necessary.
    Fix Cygwin/MSYS target directories.
    Fix symlinking with DESTDIR.
    Fix generation of libpcap.pc with CMake when not building a shared
        library.
    Check for Arm64 as well as x86-64 when looking for packet.lib on
        Windows.
  Documentation:
    Refine Markdown in README.md.
    Improve the description of portrange in filters.
    README.linux.md isn't Markdown, rename it just README.linux.
  pcapng:
    Support reading version 1.2, which some writers produce, and which
        is the same as 1.0 (some new block types were added, but
        that's not sufficient reason to bump the minor version number,
        as code that understands those new block types can handle them
        in a 1.0 file)
  Linux:
    Drop support for text-mode USB captures, as we require a 2.6.27
        or later kernel (credit to Chaoyuan Peng for noting the
        sscanf vulnerabilities in the text-mode code that got me to
        realize that we didn't need this code any more)
    Bluetooth: fix non-blocking mode.
    Don't assume that all compilers used to build for Linux support
        the __atomic builtins
  Windows:
    ...
  rpcap:
    Clean up error checking and error messages for server address
        lookup.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libpcap/{libpcap_1.10.0.bb => libpcap_1.10.1.bb}        | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.0.bb => libpcap_1.10.1.bb} (88%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
similarity index 88%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
index 967eabcc13..f528595c94 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
@@ -10,10 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
                     file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
-           "
-SRC_URI[md5sum] = "8c12dc19dd7e0d02d2bb6596eb5a71c7"
-SRC_URI[sha256sum] = "8d12b42623eeefee872f123bd0dc85d535b00df4d42e865f993c40f7bfc92b1e"
+SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz"
+SRC_URI[sha256sum] = "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.31.1

