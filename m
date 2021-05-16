Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.11638.1621204375225072229
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a16+Hu03;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id z17so4457057wrq.7
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=N8H23e/kJkTQN+g5ab3gBdUpvK37ccD1xJYwAxWdBkc=;
        b=a16+Hu03oS2BMAb6Av9h1cgmum7j23utBQA07FWwIIM8WZGSzN9Z4F3ac0+7u3jGke
         EbNVl9+Ipq+R8eS+c3+9ltXVUjGwyNSh/HfdjbQ/wSusXyZUMmGG3ES6YEwG2hemgKlC
         PF1p4aXS9LiJVnAWesd08QwtH0i3uDrGXRUpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N8H23e/kJkTQN+g5ab3gBdUpvK37ccD1xJYwAxWdBkc=;
        b=mWjWMcM2QWAXg0fCqgNNeinEdQ0NGZsVv1B4a0zN01CWmyscZwNaPhJtfcF3hIhkIf
         2w55poYAgAT7fW0kS0YvfyJ49fbQ0bQQH9q6Ia+X+L4jRt6WDmVvmy8k76Z/yJwMZ8aF
         ZqUsBD/WE1g0gu/ywMKZ8z5NFkcCCalEzn4bwIjZ6eXHaDrFn8NVGGxQLta3wlHU0V+b
         whYTiySLk5DupyU/EyfOILFFC7DqYMmz32mZUcyyXJkPVgnK391ikjbwl2+dZ6BuenlU
         yhBO4FxVMbzs/muaY6x8dYfjCfEqg5HByoWCVYu/wyKW1OeP6QFUcZHLaXz6W99EswLh
         sEuQ==
X-Gm-Message-State: AOAM530fzcj4EBkhPKPrDTHaQyZzwnrznTlwIbBoI2fS5/ty/rs5ByxW
	0pOuVLan/fNOK5id6k4L9Y9c/TQOBgOI7A==
X-Google-Smtp-Source: ABdhPJxCwJF8OVe6yijRWX94mrIuGS/HO1cYAekVKS9xJeaxepaR83jz8v6kWj3F2JZZlkNZH6X9HA==
X-Received: by 2002:a5d:4ec8:: with SMTP id s8mr1675108wrv.181.1621204373791;
        Sun, 16 May 2021 15:32:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:53 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/27] btrfs-tools: upgrade 5.12 -> 5.12.1
Date: Sun, 16 May 2021 23:32:28 +0100
Message-Id: <20210516223247.2401235-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../btrfs-tools/{btrfs-tools_5.12.bb => btrfs-tools_5.12.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.12.bb => btrfs-tools_5.12.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
index 8a809427f5f..3fc959bf8e0 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
@@ -19,7 +19,7 @@ DEPENDS_append_class-target = " udev"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "b16b0a766f06138de2ee32d4d84b7110e469ff49"
+SRCREV = "96d77fcefdd3b9fd297b5aabbce6dc43e2315ee2"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.30.2

