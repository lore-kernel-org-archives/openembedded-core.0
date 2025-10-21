Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD54CCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 17:00:56 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.18224.1761066045537103456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 10:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EfsqI29q;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-426fc536b5dso3260992f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 10:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761066043; x=1761670843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dfZaW6wk9ih9EYTXKaJNca1fTbXWf9xUxreXlab2NGM=;
        b=EfsqI29qSxmKdBz2uD4VUO0P0HFMMKVxnMyvNWK33yPl54l2UByZev0Dws8GEMeuav
         +eCbH9Zv/oNHruH/6CmZ1QQE3H5f2rEECCE5xLmujlCv1ijTyREvQStvwaoPNI9Z+hN7
         J6WQIuk+rP/1i2oAWVA62MzrFFcKHlKsKywIwHRt4pqgHCxFuFDnuPwPM+XtnwKdls+k
         OZK8u7iTTm+/yFzI+GxiK359wN7Zu7n2baKqJwKKe1qqpHliKlyZNRrALHjaZJ5Jxush
         o/nsCZXbyuouJwhsXYYek9PyaRK9QbiHp1RLPCJRUCflTrRm175Mx2xkf+7RB4BiAwzJ
         2JmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761066043; x=1761670843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfZaW6wk9ih9EYTXKaJNca1fTbXWf9xUxreXlab2NGM=;
        b=qBGvRVO6XnPz71JWmDal+p89n/cfOGKvdxNMMNd7IzTYEFCoT/aDmKK12yz1y5C8QM
         ZFhPCive2YMzMe/TVlGZZIa0DKWHhxnAqbDkMu1QzG01CgdgdDMgMW8CHHMkdGl8AaFx
         eaQX19nyP6f5Xzcxvu5UqOlAHQPA58wcMi3djpXMzwrPcYTsViCBIeudzU1+QJJU/e0t
         hhh5vSF6G0CpnKl5hNUP1hljUWA3+4ZPEM6bFimbiYEWN/w9Q7e+62fqljGUR9eqVIie
         vjfkTpItmPm9XZX7TwjYRv5cTMcCEzzF57TGs4ZVQWHuu1RMnG+cYE9YWKGHMGTpvDed
         ykdQ==
X-Gm-Message-State: AOJu0YzL6DyzwnQ6EHjezdHJCFa0Oe9smyLYr3T4Vg54t/7l1SGdqaBA
	K3QAjlSJBwu2Hs9jIL8r0qbEyvAhdF1dcy9K8mzhcUghl38S7xe583oujanPc5H1
X-Gm-Gg: ASbGncv4+AaD3HGZhbICS7Dg7g4QV2rlIAqCjAmB3EoYeMoDrS2bEtTAFV6ZW5mCdwD
	c74F+2pZnuIMDa087ORAnhscFzN9XTot3JO/T5WQ5yrQL6eqX/7yjHfdMu0sGw6IVX35K3P33kF
	MKnS6of9jbsuZwQn6gbf1CuHEB3Wln03kYhZvdsMcbKt0laCI9WR+syL21bRCbd3iwUUhvM807q
	xkCts6XWQNF6IJhcfXzf57NUBnLG9peLgI5ZH95zMyOkYgYEyB+V5fbrJidVaHfNO8VoC4R4Cq6
	ZVQ6haDrymiw2OYvIrhbnlAimnLdhx2gEP+96I5E3B6XbvInnBRmzCMkqbm+ryhpBErisMb88ql
	oTYVnbntvLjnns2GJC9gpwL0m6hkLpSz7BfEUrqUXUVBSNcW/Jy+Vz5oxxNd//KI2zcMH6UcZeA
	eSVncn
X-Google-Smtp-Source: AGHT+IEZT3tUhiV2x1xQ/J0CyRITdhnOHOigbzSPRtxNJBEaxlOxgT9poloYlX9JxizCUZy9N5TJzg==
X-Received: by 2002:a05:6000:4010:b0:425:8502:f8c3 with SMTP id ffacd0b85a97d-42704d7e9e0mr12111988f8f.1.1761066042908;
        Tue, 21 Oct 2025 10:00:42 -0700 (PDT)
Received: from fio ([185.228.162.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496b09bc4sm20943635e9.2.2025.10.21.10.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 10:00:42 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] spdx-common: load_spdx_license_data depends on the SPDX_LICENSES content
Date: Tue, 21 Oct 2025 17:59:37 +0100
Message-ID: <20251021165936.2184794-2-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 17:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225154

If we have changes on SPDX_LICENSES content we ended up building invalid sstate-cache archives.
The default value for the SPDX_LICENSES is the file meta/files/spdx-licenses.json but this file
don't use the bitbake fetcher and because of this their checksum is not validated.
So we need to add this file to the build dependency chain of the SPDX.

For example, currently we have bump from 3.24.0 to 3.27.0 on master-next for the file
meta/files/spdx-licenses.json. Since the file content is not taken into account, we end
up creating invalid sstate-cache artifacts on the autobuilder on master-next builds.
This created sstate-cache artifacts will also be available to master branch users
that are using the upstream sstate-cache mirror.

If someone is using the public mirror but still following the master branch
they will encounter something like the following error which this change aims to resolve.

| ERROR: initramfs-rootfs-image-1.0-r0 do_create_image_sbom_spdx: http://spdxdocs.org/openembedded-alias/by-doc-hash/57301e8063a8bf25308226271627db2b78675cda9f648c5c6c14a2b9c18f48dc/zlib/UNIHASH/license/3_27_0/Zlib not found in /work/build/tmp/deploy/spdx/3.0.1/armv8a/by-spdxid-hash/57/57301e8063a8bf25308226271627db2b78675cda9f648c5c6c14a2b9c18f48dc.spdx.json

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 meta/classes/spdx-common.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index ca0416d1c7..69ced76150 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -105,3 +105,4 @@ oe.spdx_common.collect_direct_deps[vardepsexclude] += "BB_TASKDEPDATA"
 oe.spdx_common.collect_direct_deps[vardeps] += "DEPENDS"
 oe.spdx_common.collect_package_providers[vardepsexclude] += "BB_TASKDEPDATA"
 oe.spdx_common.get_patched_src[vardepsexclude] += "STAGING_KERNEL_DIR"
+oe.spdx_common.load_spdx_license_data[file-checksums] += "${SPDX_LICENSES}:True"
-- 
2.51.1.dirty


