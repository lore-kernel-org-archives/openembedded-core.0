Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14383.1795013712278235258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 06:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TnRzlpWJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so1900228c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 06:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795013712; x=1795618512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBUAjkYRUtaYXUVz9+Jtu31zHGIpjOCXzdYBZJR2588=;
        b=TnRzlpWJ/eDLmmYeKlJ5sJzyg7NG9KxDGc9QkGzU8Y32IHa2QnbJTfSmzS4Wt4N0VK
         DkGLeqa1R34DV/MXOHv1JwPcn00OvzRzP1FJ8wsqROeP0/7bY5EflWHBK5L4QysOMoeV
         7v0kGqeq4m5ib8xlshN14JAve/IGPE98SHtT56PnQp1lwT8jHC3zfkYXHd+lfZDG3Elp
         qwmUSAH6NHkBLPTOhT5bHV6btjjJrDyFtdghs0SX62mYf1xOCUHEvDjrFYtqGygA4aGR
         nkyisK33PVW4QH5bjQRzTN8woOP7TRFGdXg/FAS5nB2Ndty/MTpAH+8FC0tOWwBGsRXm
         mvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013712; x=1795618512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBUAjkYRUtaYXUVz9+Jtu31zHGIpjOCXzdYBZJR2588=;
        b=WDpDhbrPazu7uYi4wmfRYaQJ17YyLdhSl0JsyiMgecNDrz0lmcCK9YdW0f+5yRZs+g
         cmRwf6Hpw7HN0mxlww4/7eRs/44FvvYpk9/GWNrSVhZTDqyMCjx93bM5qOUhpihNTFEy
         IKNXZiYRsrNYvHbEu6Y7C0oS1LegAPacoWlNDVmQjOaN6/epx/hBEkq+r5O5CmFvi2Tk
         bWLpTYcnpIbpTpQgNhK9JQeidJihBYgsBUtRZOCGs1/T/6tSlI2UPeOqvMZ9K+8AqiZL
         o/kLbAZZ8RzXBIvu32ueCLcfp13v6NfOy/yvCEaoxgbHbzwCKqTv4QQNfC92efMsIqYO
         SMOg==
X-Gm-Message-State: APuU4Z8O9S3KLZZv+Q5cpz4BiXJZqQX6v2qpBtAzq8AvLK+wm4p/u9EF
	gh5Oj10dwSD9TZHZy5YJMmupbgRIw5QKPn9zMmtM844+nABaHLn4WfkZCRJXlsN3
X-Gm-Gg: AYBFou3ARePdawS/2v8yNvz6qEKY3qiWnaVIu+yIKh74ZPT8NqxwtGagHIaJfDugjho
	iZMOlasbNDJdya6YVzfiEwvbHbKBmIOmkozHWw2BD+Xju6Id02oBN5wdYs5mLUVVLQp9tqRMvN1
	ofoRdBqBiKnqNCnJV8VgW6EIBXszfRmRBwJd+BpQ4LXXv9xWos5Z++QwEwYAM/YYkn8exdZbDkg
	UdOnF1Y72CXmKEaDUQoNV5t5jI/VEfzNsMePYSzPTrI8U7vl7WEYSKpWNu9ZIEHawjat39iItNT
	pJefYb/vzL4GZVmFCmKpQht8LMyBNV2PW8pHn8NrQoKaE684jT1GsnKJlMVeYLlOqIuMNCcE6zZ
	J9o+woohIMnm6L14t598S0HgfNOAdtnT4XPX7kF2GEzW0/og3Q18CeVd/mFa+Ajt0Y7S1ZUQoqL
	LfCoZ8C54Vfuxokv+I02ZRTuMa4P6+jtmA/PPNLHbZostP/p9lLv0t+Ccizwoqma9M0DiUSOYJm
	kIg83fjXt5VJCKmwnj63F2y/4bpvXk5BvW/UIMIw0BgAgGB7JwRxVyWv5aie3Ufazc641TsNyQi
	442ywWJJux7yAJ3urCfNh+G2+4CJ5IvLnHDxyDXqi4J4gSnN0zKWa1w6mPs/Kmtk98Ux8do5SQ8
	GCk3slh9zOwghN1TpSd9XKQLTJEzXgLXKHKTf3Mdspo1sTBlDJKB2xjn5UB/fP+Fzun1ZiT5LlM
	+vmgG+a3SCZ3VbLHkFRCtyQ6u/dgniD+CI8BownKSKuNsh30CgOlCk0r9agEqXBUduHMTAgyxmT
	RgdAcqmmQ85rNyuWGhm2es15IFPvpd2iXBzO7VaZ93p3OmGDTULRLKxTe1KJ0ESCmGCGvdfdIYo
	HJ10
X-Received: by 2002:a05:701a:c907:b0:1b2:3bdb:35cb with SMTP id a92af1059eb24-1b543cf58a7mr2553707c88.11.1795013711104;
        Wed, 18 Nov 2026 06:55:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm8678804eec.6.2026.11.18.06.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:55:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 4/5] gnutls: Pass --undefined-version to lld
Date: Wed, 18 Nov 2026 06:55:01 -0800
Message-ID: <20261118145502.3243739-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com>
References: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 14:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250554
Content-Type: text/plain; charset="utf-8"

configure's linker version script check links an empty program with a
script that assigns versions to an undefined symbol 'sym'. lld defaults
to --no-undefined-version and rejects it, so with ld-is-lld libgnutls
was built without any symbol versions. Consumers linked earlier against
the versioned library then fail file-rdeps QA, e.g. openldap:

  libldap.so.2 requires libgnutls.so.30(GNUTLS_3_4)(64bit), but no
  providers found in RDEPENDS:openldap? [file-rdeps]

libgnutls.map is static and also lists symbols that only exist with
optional features, e.g. the gnutls_pkcs11_* API without p11-kit, so lld
fails the library link once version scripts are used. Pass
--undefined-version as GNU ld behaves, which fixes both the configure
probe and the link, and restores the GNUTLS_* symbol versions.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.13.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.13.bb b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
index 88b6135bf1..706663c985 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -57,6 +57,8 @@ EXTRA_OECONF = " \
     --with-default-trust-store-file=${sysconfdir}/ssl/certs/ca-certificates.crt \
 "
 
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
+
 # Otherwise the tools try and use HOSTTOOLS_DIR/bash as a shell.
 export POSIX_SHELL = "${base_bindir}/sh"
 
