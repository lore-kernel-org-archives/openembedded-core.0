Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47443C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:12 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.2282.1643826491728403929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YXE1XIJO;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id m4so205350ejb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wIGctXC0mumNmzG3FWnRoRMD+sDScHHnihR3MrtG5oE=;
        b=YXE1XIJOJKwGNNyiU8YTUgk33BtD5mpXNv9/48EEeMW0dUI3BLlJM1b5oqnnxn2Lwc
         bZP4VwkxcBKj8h4pyqR8AfJbFJfhHA53d3U5HAwFI5p7bmwoKA7hjAMlfpDYERMqttVo
         5yq7bUMuJeJyV28iASKWvomiE8QZN+cP+NompOcQ7i9exyHrgrWbmjW8OsTLmWHHuO9M
         6T6KLmjcb845WImEvWA7DmHl9JOElqx6Y0zJfLIfVBUNbAsgRzismHXrSK5dX7zBR3AF
         4yhjfwOMKPKI/BmEP+6kNvcnPeKUJY7scxcVqq8mrAoPd5FXui95SqFR4ZhdqTDfC4zY
         B3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wIGctXC0mumNmzG3FWnRoRMD+sDScHHnihR3MrtG5oE=;
        b=uUr0RD1xCu7NTiwFnaGNp5eMCliDWBtRijoAorUX8ZiL3+6g5MltE6s2Ri2XZCTK+O
         8RzrI+/tPHIprHgs3r6DsELwMLKcp2jfaRqD8iqoGlQM//0MhHDEYV54Q7nITx/4qj1g
         NssOABzVPhcwSTSuPpFZXSTk5looIEhkBFEKM5B/V0nmTyReOOMIn+reOh0c3P+D2wiJ
         4SmDn4865ghyVHWa45ZWP+G1ivEA/0SPpgZEqiBndvrjrZSLvQKWf6xXMbuwpC5BCvpb
         fi/NMZo2H4QO+G4FlOOVj096PGWTSm8ZADs8Beri7GTJLsytDM673ZDpVSyiP8VlI+pd
         tsbA==
X-Gm-Message-State: AOAM532FXuAjmMIEm39gdyp1pluo8Tlmag0kDJyOGusaqR7CKQnDaIzr
	TdVYYpIbJeNSjsIrGmCikOEVaCsGuLo=
X-Google-Smtp-Source: 
 ABdhPJzWNHQv+z6RSfVkYVs/8tNFex48Hk6CuFWyGTZIoCA2g/eFW373agXFKIov8p478biKtmL5hA==
X-Received: by 2002:a17:907:9493:: with SMTP id
 dm19mr25974674ejc.51.1643826490302;
        Wed, 02 Feb 2022 10:28:10 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/33] git: update 2.34.1 -> 2.35.1
Date: Wed,  2 Feb 2022 19:27:34 +0100
Message-Id: <20220202182758.919991-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161234

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/git/{git_2.34.1.bb => git_2.35.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.34.1.bb => git_2.35.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.34.1.bb b/meta/recipes-devtools/git/git_2.35.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.34.1.bb
rename to meta/recipes-devtools/git/git_2.35.1.bb
index 71ff6d444c..62017b98ef 100644
--- a/meta/recipes-devtools/git/git_2.34.1.bb
+++ b/meta/recipes-devtools/git/git_2.35.1.bb
@@ -148,4 +148,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "fc4eb5ecb9299db91cdd156c06cdeb41833f53adc5631ddf8c0cb13eaa2911c1"
+SRC_URI[tarball.sha256sum] = "9845a37dd01f9faaa7d8aa2078399d3aea91b43819a5efea6e2877b0af09bd43"
-- 
2.20.1


