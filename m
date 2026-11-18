Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14356.1795013711501103117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 06:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=v8T48vjf;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a315ed211so897382eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 06:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795013711; x=1795618511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48ZRfEwSvo4gm30XM6vG7bVShwnd1895FFMnvUJQDBQ=;
        b=v8T48vjfOHyKP8v4eLc/yG7a36rpK3sXYXRzBfyMLeMU2oQL60xVDNYCf/mZHM785P
         +XkhMj5hvKNJZ166cuK201XepnAUo4bri6l4l3V7gjYVUwYjz88HIuS7eVAv+JdGm/a7
         AlPGY9rQmeAbbNFK9ge98taSxh1bYJpt7naRMgVrBFBM50Zap5zl5f1XLvP5JwEl9imm
         2k1Nsk/pMKX/Bmqn9UJjRIBao6NRntafwoll4SCquGjR61UiAnlO22ALWc4NjaaBQkzk
         Z/amSgUB8ux+6aJVoWLaV8YpcjCTAD2misLwUpIM7EwluiIrgOFAAPLiiyUok2w0+WzE
         4sFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013711; x=1795618511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=48ZRfEwSvo4gm30XM6vG7bVShwnd1895FFMnvUJQDBQ=;
        b=m6kQwLnzKM4FeMq1P6bqkhUikZzYyquP5pWIEAeGx91rogO6P4sgCcuZY6nXsmI8EU
         r7/oBIENZCik/7ciD3nCae7YNvIwQEaS6hYBjbBdJR4indbmaJwRv9QkpEVyF+Wc/wJf
         7nhp24k29Q7r8n9eaMNdIj8Hb2sLS/84G/JT5Vk5LALimFjSbNMLA/n/DqlS4jvn1qu2
         pAfEq2i6gZVI//OlBSarACGev5RgcfmPq9QVIDnp8urCuIfP5ZdF1oCL6bhdfkhC+dqa
         dtfCEgUVj1cEqUMvgRkxKqvhS14muXamntYjTijO1lxguhNSy67kzJiB3jslNlCxBNEp
         yh+A==
X-Gm-Message-State: APuU4Z923jeYeVvQF+C+vNinOQPh/LyrlXNtDRSdudoye3Ln7nnyYDE1
	JzrE7NsoWIDuAC+O+ddJNYsyBTqFbOPMgMzGh4cNYYKF3tiUI1/oOeBJBzTzjL9O
X-Gm-Gg: AZFdTZcHAx/b27cMdGH+IkbbZQ5uhQC2zb5CMugoSCOWQkv2s+uk1xNoZj+7+JaLe2i
	kfKj8pxR3EMxap3HQQKQEAvwGulammYhELyB/KaNU+SKqnQQiBZw3bgVtuBQN/T/XB/72ZTVciU
	5+V3UhaBx/ePj/zOd72EpOPSXySyOcHeYy4yWV9/eBgUXZ76PkNAnPtdqbT64Fr+qVvcZ1I6KKA
	7Q89vUHSC1IzOsnhLMfgzawgeH+4JUmhEYFHiKcLlEMQgGyALOmj8u3DeTZfUSmhQW4ll9lc4dF
	xapl8QzrdKfAWIzzdsprzUnDCjp+5HuSR+OY/LhHjAbCgV9TPMp2H3NKv+t61ySgBG3DrW9v30Z
	I9Dd1SZx4zcrkmRdKhF8W4lreQ9ikd/ngsLIK2C4IRPV+2+/MKjvmDGErZxq946vhOC8X98t2Oh
	vtOdkxsEy/oG6seUW8FvFNzYo8lRUqmN9U7C7CQvxO4UN5ZRjYi18DmF7i7oq6WFdJHTRt+PrvD
	a2qY5jvzwhGbJ2Qt90uQrMTdcwcHFnDN1gu/fo6mTVrF08ZzZJOUZ8ssVkDwp2gWHkyHoc1tflN
	jbpIObqayPaCQX5rPf7gmfK3oGQgKkQMH+PiDn/c0Qh2ZpNkESYCwFk4kKjQLTHb4LtxLEhL051
	YguIDliKsYyDjQSJXF6z3RG9ZGVAuB6Zh60CEWHKkiYTONVg4qksdd2qEChZDbSgwmT835UD4Ib
	IQobAZdhMPoFleogtmRHVISL1Tfjdu1605e1S/sUo2wSkFsKtzxK6gLAdLGfj//1tCx0w4sKfjW
	bfmKT6T4vXsru6fAJf+36LV+H27bG87Cyiwf3eFp5TRW6RlSmzF0A8qQQGilaGbXXIDpWBBQBT5
	siek
X-Received: by 2002:a05:7301:fa87:b0:361:2a55:b94e with SMTP id 5a478bee46e88-3810f314582mr6937311eec.15.1795013709491;
        Wed, 18 Nov 2026 06:55:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm8678804eec.6.2026.11.18.06.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:55:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 3/5] nettle: Enable linker version script explicitly
Date: Wed, 18 Nov 2026 06:55:00 -0800
Message-ID: <20261118145502.3243739-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com>
References: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 14:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250553
Content-Type: text/plain; charset="utf-8"

configure's linker version script check links an empty program with a
script that assigns versions to an undefined symbol 'sym'. lld defaults to
--no-undefined-version and rejects it, so with ld-is-lld configure
decides version scripts are unsupported and the library is built without
any symbol versions, silently changing its ABI. Consumers linked earlier
against the versioned library then fail file-rdeps QA, e.g. openldap:

  libldap.so.2 requires libgnutls.so.30(GNUTLS_3_4)(64bit), but no
  providers found in RDEPENDS:openldap? [file-rdeps]

Every supported linker handles version scripts, so enable them
explicitly instead of relying on the broken probe.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-support/nettle/nettle_4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nettle/nettle_4.0.bb b/meta/recipes-support/nettle/nettle_4.0.bb
index 0e05804057..374433b976 100644
--- a/meta/recipes-support/nettle/nettle_4.0.bb
+++ b/meta/recipes-support/nettle/nettle_4.0.bb
@@ -27,7 +27,7 @@ UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools ptest multilib_header lib_package
 
-EXTRA_OECONF = "--disable-openssl"
+EXTRA_OECONF = "--disable-openssl --enable-ld-version-script"
 
 EXTRA_OECONF:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon",""," --disable-arm-neon --disable-fat",d)}"
 EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon",""," --disable-arm-neon --disable-fat",d)}"
