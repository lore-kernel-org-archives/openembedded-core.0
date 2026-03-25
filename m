Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C85A103A9B5
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:31:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19962.1774438295190881822
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QTP/Bven;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48704db565eso41213425e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438293; x=1775043093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W37jxDeKhJdnDMjkiIqawKbedRIk5n0T8eSpeZwjKyo=;
        b=QTP/Bven3AEAbUaiH7ISokqt6gzF+7/ZC5dvwYxoyPiaFhXO6Dx2fRQbXno6ftCDjF
         JaqenDOvSJA/woFnMG6lEUY6qygmYfgIkmaVkCECUBqZ8Ta9nFNRFOwPY4wz06egjUNz
         21V4aM51H4dP6ioQEGjncT9E3nbbGkKNHqis3ILwIyPTIYeabOxFeEDwgJdfQRsQNtL7
         BlElEyG8v2RVzHt5Qs4N6k+t06vvrEcURwc2/NSiNrVYmNs4yHCDjyKixBT+Yny7DnVV
         RrMe/QDQam5F1XvdkPXFOOM9F8h9vCNOYPJeDXJpfQMx4gv6Hjf94yV4KNXTpmn9Tu6O
         eavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438293; x=1775043093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W37jxDeKhJdnDMjkiIqawKbedRIk5n0T8eSpeZwjKyo=;
        b=JYMH4z4wlr3Y2tWfaFGmlys/8uWRR00nFVzIFI0R/Zt2NnH+Lbca96XZ8A9TzAwWK3
         VQLKIE4MZBpQ0HmgEMXPYDpWDR0viOID+cHelRaSmanK7Gk8EUrdCyUbtJR+weNBRN1+
         +J73Ksmjgf002usxQNMJzyV3DZIiFuFtBAB8QFZIXhKXk8f8sBML7rkjSOf8oThQPuGa
         BQ5/IiBOuBD34PV46s0uWr39j+2HrancJvTtoIDBEvddE+dG3rPkra2uW8xHEb6eoCCB
         b3m4addgWE5N9lYMQG0rzYXugJ7ZNhGSER/drljulY6IPrB5ozoBQeQMoOgwETelzCOl
         /i7A==
X-Gm-Message-State: AOJu0YyxocWNjXZwRv7n+sDrPyPBX6FwdjAblUYMgGlY9I/lClQzpAl/
	2seC1SpgpRACjadMruFl6HWRdAM7Vv11oIHRjp5vKtfujkcgog5D7AOFIAK2cQ==
X-Gm-Gg: ATEYQzxILgYbCy+z7vQv7FG25NHIOzKUY2EvBsDsGThJawrFozH038rFmTgUcZ29dhG
	Gmtbdc5uROpAL19j9V+ThVmPY3IVMtAz+QmuXJITAvk/2jWW8HeuMDtsB4DfySQfcUfC6z7KpN/
	uWC7IOahKP80I9dNNxLxMSPsZGD/hFxK0Vczl5YUCEf1LQaLK9avPt34azER0gBNZnOnl45c966
	lluRweDkkz80G9x7vg3BZRu8/OjO/Ybu6xYVgMv4NBwAN19Lr0sr/1wNU5c0q8z7pAk9OqT9bj/
	qrHXLffjYiNJQXZBBGsLgCVh2Ib4c9a7EgO3LZEZ6vwNknSfpdPed8f7ExfWBKvmt/bAPMJ5kOc
	cKjX+2BTvid33AoTbULz3hNC3XIF1kdHb+rrluRxrTvFASvjwmu5G3BzVCn0quXVBMczMdAcZxU
	ClD3BDa6WDSsZaiw==
X-Received: by 2002:a05:600c:45c4:b0:485:5981:1411 with SMTP id 5b1f17b1804b1-48716071b48mr44632345e9.23.1774438293217;
        Wed, 25 Mar 2026 04:31:33 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:31 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 04/14] python_pyo3.bbclass: Pass ABI flag and PYTHON_MAINVERSION
Date: Wed, 25 Mar 2026 12:24:14 +0100
Message-ID: <20260325113112.1163632-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233878

Setting the ABI flag correctly is necessary for modules using
python_maturin.bbclass and others based on pyo3.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python_pyo3.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_pyo3.bbclass b/meta/classes-recipe/python_pyo3.bbclass
index 7f5a00f584..c618d711ac 100644
--- a/meta/classes-recipe/python_pyo3.bbclass
+++ b/meta/classes-recipe/python_pyo3.bbclass
@@ -12,7 +12,8 @@
 inherit cargo python3-dir siteinfo
 
 export PYO3_CROSS = "1"
-export PYO3_CROSS_PYTHON_VERSION = "${PYTHON_BASEVERSION}"
+export PYO3_CROSS_PYTHON_VERSION = "${PYTHON_MAINVERSION}"
+export ABIFLAGS = "${PYTHON_ABI}"
 export PYO3_CROSS_LIB_DIR = "${STAGING_LIBDIR}"
 export CARGO_BUILD_TARGET = "${RUST_HOST_SYS}"
 export RUSTFLAGS
@@ -25,6 +26,7 @@ implementation=CPython
 version=${PYTHON_BASEVERSION}
 shared=true
 abi3=false
+abiflags=${PYTHON_ABI}
 lib_name=${PYTHON_DIR}
 lib_dir=${STAGING_LIBDIR}
 pointer_width=${SITEINFO_BITS}
-- 
2.53.0


