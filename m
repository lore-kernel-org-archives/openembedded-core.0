Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F61DEEB574
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 23:58:05 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96318.1767225476569561676
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 15:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nOK1KM08;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bf5ac50827dso7141939a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 15:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767225476; x=1767830276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5xFecFjZHkKy3jsXf+3CUEY9hcqqFtMt2sff9b02I/Q=;
        b=nOK1KM08GigpUDMFVoDFMZd+8WH43oHCb5O+zY1cD6xvPAcZL+nvoM1ejck374FY/w
         mvsLPyVy/pkVV8fZzxE8tNqZgbK2PMEdx+3Wppz2Uhc2aQf1oRRYbkKhNbnfsqU4Abr3
         pjjjPDpgld9ZZA/CHA5l6WCi+h3kh7KOQo+0s4sUXRA5Df7Fv+GzdA6gBzSI2yImccvq
         2Nen71tCaPQAt+iv3XjdEB2Iv8QVHjsaX3X/tdcZ6YY/2G6Tv/wh8vxjxDpAGTKa4Q9S
         BkVRvdekBfotznJBgLhOwCXEg2YW4SoDKedQxw5wPaux4pQQ0/4pCZK+YzttneA4rtIM
         cLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767225476; x=1767830276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xFecFjZHkKy3jsXf+3CUEY9hcqqFtMt2sff9b02I/Q=;
        b=fIaVkZjyyoii6p6lMG+Re3OShJ+XxmTjIc/d/c1qIEZ8+dmobZdUQGf95BeTDA53rt
         4X7j1H1zA9K6vH1CGsDV3v/tfmM7g1DDmDusgCwRE4JfJ7RElNvu21yaHYUVD33vyZ9N
         eO6CnViYMm/WPDgt+05xu+A9hJgh32Tcogv//U32p/k4rSLch7Uree/3OXozO8oVe/U+
         CTJUock1cpjmCQ5L7TZoGWjKDh+YJ3X+Lf2VlqubsJWvOyizX5VDATv0T8K3nKysT9jc
         HKm8aSkwk5DIuadEoKy2h5UPBPG/IG4OASXZfJWj6KzcITie62kmzV5koJ6lYCm9LTld
         UfJA==
X-Gm-Message-State: AOJu0YxRFsmONvqA/DEjiP6RT21W4gdobENTQB5Bino758zhwnCbKDXd
	sMdyGMAH//NrA1VdmdRRhDEVrYiQZyuyZ4LOa8eeMbXe1gneyHh90FQ6w9nqAg==
X-Gm-Gg: AY/fxX775oxDNIv11Wu9zaiY58ZdXlhs9P81UP03bONclykPVBW+YrKRxFXKx81zJGX
	TqdLFF70tkwzXpCK3SYRDSVldbU+waWeCYtm8f40pdmeik+7XSvIXBM6K8qVKeTOqeQgP0me8nX
	0vFZMayiMkf5dwIzrMwneVlixBog8GVJp/sKa6D1YLFh/cltUShmpmV7Qs6p3R9LaqSGD6bYRyG
	Qv13IarzdO4p+9RzYQ/eACzD45WYPabuht1x1RBL6icVeobourGaF4Rdn6K35qATc3TK/IF2PDa
	o5sxcYHV6DVvR8c9zu/lA/s0iiJsfB+d+KRAZAphKXkLqSCf1DLWV8aZiQu5ePqKmmKfbaeOBVB
	KFprX4WIONXQSDPk3E3EFEKdFu8+Lp+hXcU9gzHkmUy2RKbWw0H7PiynO6bJ7N/KoPTU+qlMkje
	whmBR3st5HPMtzavHSeyzKgg2qBD3FG/1o9xJoO/OWkb/Ree3hbENmnMZHcFN+KXhPjfQF0vBU3
	PAMMI7ayGsN//LcbnJm5auDPsecCgeUq0z5eEIAng==
X-Google-Smtp-Source: AGHT+IGgIqR1+4CzRu5Qtz5JaCkpcPJJ94O5WlvS2c2k37TLNQ6R49+6LLOzo+11KArpOtjlnaJ/IA==
X-Received: by 2002:a05:7022:b906:b0:11b:c86b:386a with SMTP id a92af1059eb24-121722abe20mr25693200c88.5.1767225475562;
        Wed, 31 Dec 2025 15:57:55 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfc0esm138989737c88.2.2025.12.31.15.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 15:57:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libpcre2: Fix linking with LLD linker
Date: Wed, 31 Dec 2025 15:57:52 -0800
Message-ID: <20251231235752.1412954-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 23:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228751

version scripts are at odds with LLD at times and its strict about undefined symbols
even though they will be provided by c startup files.

Fixes
| riscv64-yoe-linux-ld.lld: error: version script assignment of 'local' to symbol '_fini' failed: symbol not defined
| riscv64-yoe-linux-ld.lld: error: version script assignment of 'local' to symbol '_init' failed: symbol not defined
| riscv64-yoe-linux-clang: error: linker command failed with exit code 1 (use -v to see invocation)
| make[1]: *** [Makefile:1948: libpcre2-32.la] Error 1
| make[1]: Leaving directory '/mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/libpcre2/10.47/build'

Signed-off-by: Khem Raj <raj.khem@gmail.com>

s
---
 meta/recipes-support/libpcre/libpcre2_10.47.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index 98e3c716d6..2ac249f05b 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -39,6 +39,7 @@ EXTRA_OECONF = "\
 "
 CFLAGS += "-D_REENTRANT"
 CXXFLAGS:append:powerpc = " -lstdc++"
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-Wl,--undefined-version', '', d)}"
 
 PACKAGES =+ "libpcre2-16 libpcre2-32 pcre2grep pcre2grep-doc pcre2test pcre2test-doc"
 

