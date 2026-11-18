Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14384.1795013713320928801
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 06:55:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=woJy7zsp;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f8cdd30beso735866eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 06:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795013713; x=1795618513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rf4nVNo9uLbtN6BaAmpmlx+Dn7WyUGQytq3rLj8OhmM=;
        b=woJy7zspp1rOIs8KKIYZlg7hroO9ZuOPx8F1jhbHWZmYa/Y80VM+lv1WdjZxlpW7CM
         EZrPmeDpMtcON37PMQNt6boqflDdKMwoVF4CqFCAi6AqHhCrmoTXyzprDCOs0BSu2jpk
         8ITnn2qgSQj+X+sfKN4icjwA8tyeGuIhZuBpAQEU+JDHPJue4D4qSBvMbP54hDLf+5pu
         9V3Is7u1zkhAzohSBy/Fq8SkEDwhIOPc//AnukOOCuiJZx3+qmTkfrJ2MFOim09u9gOk
         zmJV0WlruvZko/op5R8Rk+khuTSCDaQz20Bty9XEOThzeDxLqfbmrXiOcn0BDa2T5oig
         xQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013713; x=1795618513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rf4nVNo9uLbtN6BaAmpmlx+Dn7WyUGQytq3rLj8OhmM=;
        b=Oghcs05agvimTu5rNleKxYg6lDNJEv/eBz9L/BmztH2r5A5tYXT9Mwy75CtB+iDELp
         5qFJal3qaCtynqNnHhRrVVYYP3iHvJQon4Z9SYHr0NSfNUwYXk/TTrH45hn66WWithwh
         MebjZNfvvRJqHT0qgf1++WL2lIA23G7+lG4kdrujZgszOjT1FqvXcvoSdT86lbTJAqGt
         d2789DIk5cb1jjafp02RZU2HT8pQy7NyJWtYBRnlU3t4FEGjcfx/Az9UKHDf1T8xj158
         fyrJPa0yUa1EFaWK5Rbtj+q5cAWizGMvZwc1gkjXHPGeDxVFKuOIVxy0QVh/HJpGI4nQ
         D4tg==
X-Gm-Message-State: APuU4Z8OUPBt5bxfBkbjQ5bufTeKGNz2beeWcG0NnUj6HKz4uktrWGgw
	xLCrG/bgZqY7b4EB5zt69d0xiKjuQEc7YHBxvXctY2F1oNfVAxiatOnD0o9b/unG
X-Gm-Gg: AZFdTZdgOs5cO7PNE5eRc0Utn4tDbmbs9rq+PAiyFK4q58z0dvce3A6A+VH8WquSTVM
	A8AeSnNq45Ty86GkhAH5B8TNQfQce5zrJDd2DUhO3pJqskj+ULYccLE6uT346ilUFGzKy0HND4v
	SybyB+TnOThjY6gqDWRj2dx68aOhYjAZAwAimhJNleq3S90TMf4UmHKbRZvLFtMRH3frjUdA51d
	g2nQnht2EPh/Z/+qkwS/0EKk8/cp+W5lF0W8BGBqvneIpyv4VLAFxc8vCfjVTTsUlT82cSHCf6R
	/tsTw/L0DhqrHaQxknHoONTYtlE14prEGgBOhCKd1njgzA82Fe5t5Sm5Toej8iDZTS+Vetx+ikq
	k2ygAH9IJW3emsYwaXq2fvT1BTQE1qslmea0jFIZEkPbZTrq76pkffDEPT0Fry2qziIY0qo1JGa
	Cbludrto1oUoAyFkfJyFhsyVLBAGQ1owLJ6exZxM3d8p5S7U/X2cRFqnDMTuYq05G24pz9Xmx/t
	AT80YnGxnvdxbpYmC2dYhBAJ4Bhm5Pa5Angw3RHFc5Ei1y+Z3mRcIhgCHYMwp/iV2+ofYF3zXas
	etWtSYlW8rHJZo7VK9m3xb9VklepgkK+B+ivzmPHGlUW1Ivde033SxCOCBBBNS35MEALS+U7HXT
	kidDroUx+7s6niacbE51QzqfNZHQ0R9XvtcRsxl8T3pRdCfg0W3L2t4i/GrhrWRSBeQ64PRoBOW
	E/l9Jb6d64jLyeWwlyjFLsz+I2s4OLaftAzyiu0xOEj91SaanUnIDUqew4tpgsksmWQ/bWUvDuM
	WaZx+9vSd32nb3L+sB95f+hC/Nrc3OjiqpzLY+0evwa1PoVrjL2o1mM1xGH2+XXSt3NZNTfBE0R
	JWxh
X-Received: by 2002:a05:693c:87c9:20b0:379:7251:9a1b with SMTP id 5a478bee46e88-38281218248mr2882538eec.21.1795013712435;
        Wed, 18 Nov 2026 06:55:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm8678804eec.6.2026.11.18.06.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:55:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 5/5] tiff: Pass --undefined-version to lld
Date: Wed, 18 Nov 2026 06:55:02 -0800
Message-ID: <20261118145502.3243739-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com>
References: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 14:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250555
Content-Type: text/plain; charset="utf-8"

configure's linker version script check links an empty program with a
script that assigns versions to an undefined symbol 'sym'. lld defaults
to --no-undefined-version and rejects it, so with ld-is-lld libtiff was
built without the LIBTIFF_4.* symbol versions, silently changing its
ABI.

libtiff.map is shared by all platforms and lists the Windows-only
TIFFOpenW and TIFFOpenWExt, so lld also fails the library link once
version scripts are used. Pass --undefined-version as GNU ld behaves,
which fixes both the configure probe and the link.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.7.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
index 8bc3a48657..1f6245f02d 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
@@ -25,6 +25,8 @@ CVE_STATUS[CVE-2026-4775] = "fixed-version: Fixed since 4.7.2, NVD tracks this a
 
 inherit autotools multilib_header
 
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
+
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
 
 PACKAGECONFIG ?= "cxx jpeg zlib lzma \
