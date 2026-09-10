Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33CFC79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 10:35:00 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10815.1789036493298196540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 03:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZF+Srd4/;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so11499175e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 03:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789036491; x=1789641291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NlYxIGRiE+5ZL/Kz33lbJGCYAkrB47u/T1ES9L37rvo=;
        b=ZF+Srd4/ET8VyZV3vWYsW+cOJ8LjDRiHNDXx2Aa7QP+bWF9MHGX6/Xg5JKg1gr8pu8
         wN6sFRcDJzYQOqGRZKgfybAICdibm0YpFbnOcOZeEW+oMLfovQbd63y0iCqkF/9vVgUc
         YI55oiR4nT8TgBsLzn1+wvxsEe1wId292mwDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036491; x=1789641291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NlYxIGRiE+5ZL/Kz33lbJGCYAkrB47u/T1ES9L37rvo=;
        b=gp5o59Dyf4uKMU6fHmRmuEdQea1tU7gKtqXw5zlz6mOfxO/jw7vzraCmzDJZ5WyAX3
         6l0+7TtJQiV6Wh55mCUSiOiSGjaZ4TSSESiTJOHUnmTrdzOSav4RqRsgWBwG0ma3+mQb
         llPEHMfp5BzyZ74XSv8m0pLXVdl84/8P6ijBIwuncnzX0e8mvhHjA/ttQWk4TBD2VywV
         J50k/qOUx6Ohk2eq3/CY6Kxgn5GxD+xNww4Sdo/z9j/XuIjLWjJiUI0K2GRaRg0KDuRz
         osNsRsSg01v4sgxp/t2fdogxVwXF/yX3ft88Wb6hD9df0D8zFhasNCHFtuB2G5uKTxwl
         VU7A==
X-Gm-Message-State: AFuF++nItQ0q+oIDX+BEDx/V7KhDcWf+SrtcB5y9BQ91gy7iOUM8gxXQ
	n9cm5+FiqvD8duBfySyBm12NVqbrcybkoK+2jobvTw/G+IBbppx8oMUU33P+9tkahG/Jf7nDYz4
	LavEcgvk=
X-Gm-Gg: AYBFou3g6LP7a4SGKohS4HfAD0z2w1vxiXjNCx4MXnO2BtaPU/Zk31Qw4jVYzP+AIBQ
	9GN5P4hN7HpR3+Lqjx7SHIqakBlixYxMab1O/ejBT+2POZEVG/7WQNsEaXkiSQcg54aWWKDTQJX
	DkzmFacOguawFoZOsS3kGctB50iDmd1abQo8Ag7GBSfe9oF9AmaWPIlYNxe8lyHAjm6zQ/0zUrH
	u9WqR9Sg+06Q0dJdyJXQmECClTukCkXRH0Fp0kIkjaq/37/dlZkF4xIRS2l2DANN2XzlDNlwtpa
	/RrNP1aHyUjRtKWpZoO9MHE7/Z7uNegmWHcYFF9yB+93uAnDFRs95qz/5wfi181Ae97f1EhMQ2Y
	EvoZeKn/lXlUayoaLltPFT/e8CeSLVX0sd4HgV4w1rKhzuWK3FvmUBmPpo8qt/pcKgJlC+gaLGL
	rYZVOzA5+yRI4YBz3gcx/OMToBsHDFLC8rhRATyCAQSEyS+QAKmB67Sf48HvvnFTpqyJQ4btyoh
	Pn3OnQxyhrtHBVLRQsLzPUR04oF
X-Received: by 2002:a05:600c:3786:b0:49c:f13e:e50 with SMTP id 5b1f17b1804b1-49d26dc1012mr31488465e9.13.1789036491318;
        Thu, 10 Sep 2026 03:34:51 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:788a:18da:6c2a:9f16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf9490sm57395075e9.9.2026.09.10.03.34.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:34:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] xz: upgrade 5.8.3 -> 5.8.4
Date: Thu, 10 Sep 2026 11:34:44 +0100
Message-ID: <20260910103444.1413539-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910103444.1413539-1-richard.purdie@linuxfoundation.org>
References: <20260910103444.1413539-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 10:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245548

5.8.4 (2026-09-09)

    IMPORTANT: This includes a fix for a security issue that affects all
    XZ Utils versions since 5.0.0. This and a few other fixes have also
    been committed to the old stable branches (v5.2, v5.4, and v5.6) in
    the xz Git repository. Those fixes are marked below. No new 5.2.x,
    5.4.x, or 5.6.x releases will be made.

    * liblzma:

        - lzma_alone_decoder(), lzma_lzip_decoder(),
          lzma_auto_decoder(), and lzma_microlzma_decoder(): Fix an
          invalid memory access after memory allocation has failed and
          the application reinitializes the existing decoder to decode
          a different file. This bug could at least result in a crash.
          This is tracked as GHSA-5qpq-xqfv-j9pg. CVE number is pending.
          (Also in v5.2, v5.4, and v5.6.)

        - lzma_stream_buffer_decode(): Fix wrong error code and,
          in debug builds, assertion failure. LZMA_BUF_ERROR could
          be returned with truncated inputs while LZMA_DATA_ERROR
          is the correct one in this function.
          (Also in v5.2, v5.4, and v5.6.)

        - Fix a performance issue in the typical use case of
          lzma_index_cat(). Internally liblzma calls it from
          lzma_file_info_decoder(), so that was affected too. The
          problem occurred if the input .xz file was created by
          concatenating a large number of .xz files. A crafted file
          could make "xz --list" very slow or effectively hang.
          Normal decompression doesn't use these functions and
          thus wasn't affected.
          (Also in v5.2, v5.4, and v5.6.)

        - Fix a theoretical integer overflow in lzma_index_cat().
          (Also in v5.2, v5.4, and v5.6.)

        - Fix bogus memory usage report in lzma_index_decoder() when
          the .xz Index is obviously invalid. A huge bogus value could
          cause an integer overflow in lzma_file_info_decoder()'s
          memory usage reporting due to a missing overflow check,
          making lzma_memused() report an incorrect tiny value. This
          bug didn't affect the memory usage limiter in these two
          decoders; only the reporting via lzma_memused() was affected.
          (Also in v5.2, v5.4, and v5.6.)

        - Fix a too low memory usage report in lzma_index_decoder()
          if lzma_memused() is called after a part of the Index has
          already been decoded. The typical use case is to call
          lzma_memused() immediately after LZMA_MEMLIMIT_ERROR,
          which did work correctly.

        - Fix copying of check type in lzma_index_dup(). Calling
          lzma_index_checks() on the duplicated lzma_index returned
          return garbage a result. lzma_index_dup() is rarely used;
          liblzma doesn't use it internally and xz itself doesn't use
          it either.
          (Also in v5.2, v5.4, and v5.6.)

        - lzma_file_info_decoder() and lzma_index_decoder(): Reject
          an obviously-invalid Number of Records field earlier.
          (Partially also in v5.2, v5.4, and v5.6.)

        - Fix a missing synchronization in the threaded .xz decoder. It
          could make lzma_get_progress() return incorrect progress info.
          (Also in v5.4 and v5.6.)

        - Detect certain kinds of corrupt inputs slightly earlier in
          the LZMA2 decoder.

        - ARM64 and LoongArch: Don't use aligned reads on unaligned
          buffers. This makes the code work on strict-align processors
          and fixes a sanitizer error in other cases. (Since 5.7.1alpha)

    * xz:

        - Fix a use-after-free when showing an error message if --files
          or --files0 was specified in the environment variables XZ_OPT
          or XZ_DEFAULTS.
          (Also in v5.2, v5.4, and v5.6.)

        - Fix a use-after-free bug when --verbose is used and
          standard error isn't a terminal. (Since 5.7.1alpha)

        - Make it an error if the totals in "xz --list" exceed the range
          of 64-bit integers.
          (Also in v5.2, v5.4, and v5.6.)

    * xz and xzdec on Linux:

        - Add support for Landlock ABI version 9.

        - Use fallback macros for Landlock ABI version 2, 3, and 5
          (but not 4) if <linux/landlock.h> is older than ABI version 5.
          This makes the binary slightly more protected if it is run on
          a kernel that supports newer ABIs than <linux/landlock.h>.

    * Scripts:

        - xzgrep: Fix handling of the ' char at the end of a command
          line option. For example, the following tricked xzgrep to
          run "id": xzgrep "-e'" "-e;id;'" somefile
          (Also in v5.2, v5.4, and v5.6.)

        - xzdiff: Use the C locale (LC_ALL=C) with "sed" and "expr"
          to ensure safe behavior with invalid multibyte sequences.
          An equivalent improvement was made in xzgrep in 5.2.6
          (2022-08-12), but it was forgotten from xzdiff.
          (Also in v5.2, v5.4, and v5.6.)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/xz/{xz_5.8.3.bb => xz_5.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.8.3.bb => xz_5.8.4.bb} (97%)

diff --git a/meta/recipes-extended/xz/xz_5.8.3.bb b/meta/recipes-extended/xz/xz_5.8.4.bb
similarity index 97%
rename from meta/recipes-extended/xz/xz_5.8.3.bb
rename to meta/recipes-extended/xz/xz_5.8.4.bb
index 0735696011f..cfb0574f0df 100644
--- a/meta/recipes-extended/xz/xz_5.8.3.bb
+++ b/meta/recipes-extended/xz/xz_5.8.4.bb
@@ -30,7 +30,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d38d562f6112174de93a9677682231b2 \
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815eec381c3d546b974a0"
+SRC_URI[sha256sum] = "0014c7886930454fe8bd4228665b51af55eeae560ea135c9c4cd33f55b2591d9"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 

