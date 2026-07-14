Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204A3C44517
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:21 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1660.1784055859637981974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UEanwvEy;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6a377223171so1771065eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055859; x=1784660659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YcguJPta/omuBiVVpDFi9Yub8DnXbvMRzffU2mkxfk=;
        b=UEanwvEyJgBXXxyFymBQihQlHBY28zmNX/FUWsMy+43WRIabF5Ilob8Frr9IOhtbjm
         uM7m9nbBTi+RY8DMyo4ZXmT8knNnBSir5SGQVW0uJ4uRukn9iMoUnUFfOsBMMqRHIPlR
         iiTdkSDeHQMa0d0IbKsY/xRpPomVEdQ791SRixY0TUESPgVcXIpB9RS/UscW5O2K63z1
         oCBvHND/IRcQ+Oa5+13zJiDeIlRU45PkXmEG0+f7xBRe5mz3fpChn4Sx4qJUdOYnmCAt
         ThpxPi/h/vGJsaRq/a6KbDSeOC8sezUHUtN9enV4YfZDgjSgYS6BVjvlQAbZkRbhk6ub
         64IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055859; x=1784660659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3YcguJPta/omuBiVVpDFi9Yub8DnXbvMRzffU2mkxfk=;
        b=b7fvNewsKVaovFQw8VVl9v58qkUuLK4hsTTxuKfkXrUuK/t0tIYvv80wXUevSXqE51
         k9irWYY0SpcxQtpf50ZBxm9BILttKXBOHZxrX3eFgHZbcT0/52Ko77rj6bpRocGF7nyj
         5OipI7+JH7m4LOB9dmbA/N9Yf0jDK6VnC1g7NPSY5SRRsUucajMtU+zA2hKCpn0Dx7c/
         iAq1EhWSWLArfv0e5kzxPlLkwxgZcs5E77wg0Znom1LWe9iOM2+3lASRW5OohWKCFaMi
         iVXamtS2ZKEzSz18YhWs+T7MASFziD0d3HXtn/wZ9/NXCbXDiFa7bKBhs6u4e34FOzth
         Hhfg==
X-Gm-Message-State: AOJu0YxLESgbi5zqgdo+/aAPilUR9klfkkCG+qdct0ShGWtafWXzCNJH
	o9KqlI5dJaOvn0jZuIsmiyG33x+RPsgzpi5BxySSzQWxgB3JbLJ5zpecDnsadg==
X-Gm-Gg: AfdE7clIm+u0Qsjt0rMnYZIl7dqchx5WmBxIGUpjU0YM1JvGYT5zMqomU4i/SfZcI/Q
	TJ1sT7BitZJvCSF2I4MU1s9upb8k1bYCHNyGIalU+sW+p59Cm6H2Uuz9u9WwGBuppVe2IRNVhy0
	sjUI8GINUKzCgD0d12dtqiDV8IATzSK+XOtVXXXbF/LuvFrhrufRbFJDgXBvnj7lutfdjwedFAX
	5xxguI2At6/5wm/3ssbxRH7XwYnyD6oitjLFh3jpBnOEZcFHr+httBDmq16FQ9X+B9ll5+jw1Vk
	8VxCUtlsiJXGylvRxSuZHVXPiynYdtcLPFug/2fHR5UBOtf+RbR1m1m31h9WT5JERJU4WYP/QaS
	7y93go0rHgm4U+1t2rugUsWOQs2BQHfo5Ph7pGgDN8/OXqZQGFfHwVbmPWFPhxgwPLWmf5jyZAe
	KzBZz+4c49Zg==
X-Received: by 2002:a05:6820:1350:b0:6a3:c6f8:4c9d with SMTP id 006d021491bc7-6a3cba99caamr1950531eaf.68.1784055858839;
        Tue, 14 Jul 2026 12:04:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:18 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 13/22] libglvnd: Replace deprecated SPDX identifier
Date: Tue, 14 Jul 2026 12:31:23 -0600
Message-ID: <20260714190405.3328796-14-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240921

GPL-3.0-with-autoconf-exception is a deprecated license identifier.
Replace it with "GPL-3.0-or-later WITH Autoconf-exception-macro".

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
index c76763f811..e2cdd81b46 100644
--- a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
+++ b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "the GL Vendor-Neutral Dispatch library"
 DESCRIPTION = "libglvnd is a vendor-neutral dispatch layer for arbitrating \
 OpenGL API calls between multiple vendors."
 HOMEPAGE = "https://gitlab.freedesktop.org/glvnd/libglvnd"
-LICENSE = "MIT & BSD-1-Clause & BSD-3-Clause & GPL-3.0-with-autoconf-exception"
+LICENSE = "MIT AND BSD-1-Clause AND BSD-3-Clause AND GPL-3.0-or-later WITH Autoconf-exception-macro"
 LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efeb08e8c4"
 
 SRC_URI = "git://gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
-- 
2.54.0


