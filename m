Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713FCC54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:33 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.49256.1710951023935305458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vxYhd2IT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e00b1c2684so32539855ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951023; x=1711555823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZaZVuKTafYFgYtEyC1h8fM3f2zusb+hLkoG/kiDCWE=;
        b=vxYhd2IThuaFoUzHfHS2DcENetWS7aHvlwccE6rT85VmBAnvum5/nJmxCgrtdlQQR2
         wxAHVJ+H3vE4BtPgbrQ8UYZYQ2EzwyxwalgVZHZypQxKhao5xaL4ug6HQJV1IfI/Fnzq
         wt78an5fEKLm3E8Lno94wHfgplZnSbZk9DukKLh8VX6pUaMOf6GGGkZOb56n0HjrZxdT
         2fC+djtUUKY6TqcHLMLdW3sPQpLvn0mw4kherm9kQOQBbOMAJek1ipkCashJhvLVPDYy
         mQ0UJyP+frnI6PKE7Y9ykz2xmMf+KHrDZjnfgXqzqwNXF22DJRAsfcX+oDb/zL9eCedQ
         qfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951023; x=1711555823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZaZVuKTafYFgYtEyC1h8fM3f2zusb+hLkoG/kiDCWE=;
        b=uVQZDAVtYKLGfsUzl5sWElJtt861LXkqSUQkBpsXU17Naj20jSWR4ea4LaN6cOhq39
         k1MTRCvq0IBj8YwJune+iax8kjqyqvTZF99StPUSeA81u+jkCdApr6ubZgx9VTZ1FkDh
         nqk/upq7nJ2guXSuAODzam+XvWMxnzZ8GvZSg5LnVafdS7LkXwFygFVdmGjyvAZ2Madc
         cNsUx7sEdk3yWSvD5llKHPhj9tZBfP9a43FfkYUcvYXZHt/woW9nY6B/4V8rOKJxcBlv
         s0AUUUPfoJOx8ITwd+zp7MwVHafFyHfw00E/Oks73XEHKSEP//pEb+CdPbtBnZUv+raO
         PF4Q==
X-Gm-Message-State: AOJu0YwO8RPiF7ElLKy1pq3VWXwXgMcZ8KsnGryknNGvGGZwiVgCfDGS
	8k+a0sJJIsC+HgEW0dbqjo8msRiI4zYjaSEjNGWG8zz5ph9zLH8j54NowhVqTMXVsOR/qUlzYbU
	vlFU=
X-Google-Smtp-Source: AGHT+IHAYYlEJPNV3NQ4A8z9XcNAAJ18Qx3XiVzdmmi2Acx2hNS4Mznms8VhaUUHgTmbJZliv8LUTQ==
X-Received: by 2002:a17:903:186:b0:1dc:2120:2467 with SMTP id z6-20020a170903018600b001dc21202467mr22264895plg.44.1710951023257;
        Wed, 20 Mar 2024 09:10:23 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/15] cve-update-nvd2-native: Fix typo in comment
Date: Wed, 20 Mar 2024 06:09:42 -1000
Message-Id: <6f49c54a0ecc9d6e79816ce8dd7b65e5a8013df6.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197375

From: Yoann Congal <yoann.congal@smile.fr>

attmepts -> attempts

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc18aaeda8e810f9082a0ceac08e5e4275bbd0f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 69ba20a6cb..9b6e746add 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -26,7 +26,7 @@ NVDCVE_API_KEY ?= ""
 # Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
-# Number of attmepts for each http query to nvd server before giving up
+# Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
-- 
2.34.1


