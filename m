Return-Path: <oo.hehir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97569CCF2C1
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 11:24:22 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4571.1792236257309546163
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 04:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RPushiDD;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: oo.hehir@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso342285f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 04:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236255; x=1792841055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwkbk0+W5HODFRNGVT3xIfXQe8xUIbT8je0S8MrqmFo=;
        b=RPushiDDnL6CHxnd3iTd0TUa6OaQXAeUFFXJto08R9eHsZYlmEJyiKVsu3NOPOnSSt
         Dazi8nAsqvHKMyuityx1iLfpeNqU1UmwdKkWzNpp7yPr9iTgEwx44/RlujrQ4mAceW1X
         xV33u1Ge9dXl4pAqkWsEjcT7trfKPVnAgIbSRf0xTaTX9gQduJJHoGVIBph9XY1qBhe6
         zYaHEmwgIqP2JoxO+Il7Jo4RNYG2peQSDJIhLW55EvVM+GfXK7/u64gqNQ15akb8VEy0
         e/n6jHCnbV1P7WCDX0wxAwnUnhbEh71YP5I27h6ObvdCQOl57JsFIM4gdgt53DnvRtuZ
         JvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236255; x=1792841055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwkbk0+W5HODFRNGVT3xIfXQe8xUIbT8je0S8MrqmFo=;
        b=rT93nRr1Dshk35TNzYBViUSKJRuiU5avodQWz//tNIWb6aStOG+94y9GFDVqvwDUF9
         GjE1eEgeDYzZr++PcEc5Bok9YXXOZeu50++07x9+y4HbHSRlQLokKwU3G5rDlvIv2D+T
         dO/9QyjGm6mqalpAk/BbJAeddgA9fc46dm3ft6bktaJJ8JpES4zMvDRTDv6xUJGm8qiW
         VPgQA8f+rsI85Z65+CqgZ8DfvaONKHAgGV5lELbmFzIRINumiCR46lQSFfDw2GQzG6w8
         zx7fhu7TWjuWG68td1WQ1MrngHG2bS2dHRLue+lwW+FixA43zK3lnH1NuaRrhXB6UR/9
         7g9w==
X-Gm-Message-State: AFq9FYIcEJsLw8rGSLKpMUoCewRBm5nf1Bj3iuUI6Pyw0Daca/Ll3Mi0
	kusF8H6EPpDIp+3+XzN/Le0DMVvyzwYTKRc9aoDRmdg8Yg/OJM3mhqbT41/6Ow6R
X-Gm-Gg: AYBFou0PDzCJtVS+xzbtf2EMmXRzab267HDfWKu42HlOyeU3bJ+7mZheswWPSMs6ot2
	O5g8RfDNyTV9VAsUeN8M+0x16quNd7gu1bsxNFIR+q7gg8bNumQpAqv8AT688Uw4xlGiLk2xX3Q
	wmIBXCmDRjIlFFCFUAoEL2vRa5LhZ+eVwO1+f9j1SRAg8/2szPjl0U6gIEPlZ/Gv6rUdfW10zM0
	Og9VrHe7RojnE0ORGqH2ad7O0h5ngfmuWeJPPFaU9e9MfK6lO8yrTLPabbEz1gmmHd0sB+kdYYW
	fQQhoPq67KCyFQK02hLPUEuEhwlDbjsc/fmITDx84f6D+tZxbXErN/8u8qzms6GINRJ0asuT/Wb
	8tvE9XBLLoZsP+FUD4APTHD/PC6Q11tSs5hF9lqlNwWYTNIstL+p0v9YpjdDTA6VXemcvYQihUj
	+MuvsOpDDFR2EE2u8X+t6vVbN1MFjjBfGHDaDLwICK+spUujNXJNC03UOHBf8cdy/zWj90k9Yp4
	rYL
X-Received: by 2002:adf:e009:0:10b0:48c:7dac:8957 with SMTP id ffacd0b85a97d-48e07fa60a7mr3095160f8f.32.1792236255429;
        Sat, 17 Oct 2026 04:24:15 -0700 (PDT)
Received: from hp-z640.fritz.box ([109.77.135.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm9140287f8f.1.2026.10.17.04.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:24:13 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH v2 8/8] python3-numpy: call libm for ceil/floor/trunc on riscv64
Date: Sat, 17 Oct 2026 12:23:57 +0100
Message-ID: <20261017112358.77434-9-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017112358.77434-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
 <20261017112358.77434-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248087

numpy builds with -std=c11, so GCC 15 onwards expands ceil/floor/trunc
inline on riscv64, & its first scheduling pass moves the fcvt above the
|x| < 2^52 check. ceil(+-inf) & ceil(1e300) then raise FE_INVALID, & the
72 cases of test_unary_spurious_fpexception fail. Confirmed as
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=127908.

-fno-fp-int-builtin-inexact makes GCC call libm, which handles these
inputs correctly. python3-numpy-ptest on a VisionFive 2 (JH7110), with
2.5.3: 45770 pass, 0 fail. On qemuriscv64 with PTEST_RUNNER_TIMEOUT = "7200",
with 2.5.4: 45993 pass, 0 fail.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/recipes-devtools/python/python3-numpy_2.5.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.4.bb b/meta/recipes-devtools/python/python3-numpy_2.5.4.bb
index 93aa356db1..275c49690b 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.4.bb
@@ -26,6 +26,11 @@ PACKAGECONFIG[svml] = "-Ddisable-svml=false,-Ddisable-svml=true"
 # the overflow tests fail with compiler-rt on aarch64
 LDFLAGS:append:toolchain-clang:aarch64 = " -rtlib=libgcc -unwindlib=libgcc"
 
+# GCC 15+ inlines ceil/floor/trunc on riscv64 with the fcvt ahead of the range
+# check, so +-inf raises FE_INVALID; call libm instead. GCC PR 127908.
+CFLAGS:append:toolchain-gcc:riscv64 = " -fno-fp-int-builtin-inexact"
+CXXFLAGS:append:toolchain-gcc:riscv64 = " -fno-fp-int-builtin-inexact"
+
 # To ensure reproducibility, remove entries from __config__ which expose build
 # machine details, such as build paths, host paths, and hardware configuration.
 strip_build_info() {
-- 
2.43.0


