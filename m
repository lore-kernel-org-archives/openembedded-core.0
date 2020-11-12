Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.7879.1605202100241232723
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 09:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=aJkm0/3M;
 spf=pass (domain: blade-group.com, ip: 209.85.128.51, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f51.google.com with SMTP id c16so6223321wmd.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 09:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eQp/6/2FXu6aayqxA6lPATB2LBv7BqAxsFVo/WpSKB4=;
        b=aJkm0/3Mw3xscajWi/WuBero3TH/Ck7V4lSpvlOkR51vDiF1X7EYWlJgbIkcgfAg1B
         XZUF5ljynlYErMhoQ3mz22NAxGCh3PjaB7dElT/obYN9l/X9Id07YY6z8i8xkhVbgb6U
         kNaDMfXFCJPcgh5b3JxgYpM99IfLP9DZEHGdwN2IfbQM3vyA92wD7MrIM2wChVCp0jtF
         cQFHeMZ8HzoS2C1QQdyy0biEsIZO+wsu8D1cx2m6FsOIiDz4Rim0QMCwBM/DviUc4z7x
         VHjTX5HmiWfGUYfmMHG1HMjMzQXv5SBKpJOYfC0m1hxn96YzeniRhYYUqgKIORQmdgf9
         5mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eQp/6/2FXu6aayqxA6lPATB2LBv7BqAxsFVo/WpSKB4=;
        b=d8AkxHfb2U0Hf+dZ+VK1lHzvcktHdFHrtGI9ppYm8sbzW/vq3Zkv+MRkpPDlizD4Qe
         TZ1rg5GhZrueysOukyYU8yZp98XL0g5KitNEKO+x3HcIjZ+SKjTs3/8kDwRWOR0riRD6
         wgUbRP6lViirGnlhefoV9Fm3nMwNq+gw1yynKBzR3/y+Gvd/BmBzubTPgjY36e/APS4t
         +DKo96a6P9mAkUROvf6+ogc5bT8k7F7CqkKNkfPXsHaidFhBhfKNSYx8Q5uK67Z0Lhno
         WLwaWuUxJ5ko6mGfKzyw/9HfEibY8xAIydRAhFeSG54O+33dy/8lRvO1H2jhuI8GO76w
         QajA==
X-Gm-Message-State: AOAM5318F893Qqvr5KpwSNHIUAkId6h1MLR4WPENzNzfrkWlPFwbLq9u
	pya2VPIEhwMcsmQ7P5Cp6rIu8XP0AoyFuw==
X-Google-Smtp-Source: ABdhPJwXHpHxnor6Wsde4CrEGtgXnSQM69Kboj2/82GUW2kcC3IoX4+dHPTgZsiGwnmryoYhpPGSFQ==
X-Received: by 2002:a7b:c2f7:: with SMTP id e23mr733646wmk.100.1605202098463;
        Thu, 12 Nov 2020 09:28:18 -0800 (PST)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id j15sm8198906wrm.62.2020.11.12.09.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 09:28:17 -0800 (PST)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2 3/5] systemtap: clarify the relation between exporter and python3-probes feature
Date: Thu, 12 Nov 2020 18:26:14 +0100
Message-Id: <20201112172616.784945-4-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201112172616.784945-1-yann@blade-group.com>
References: <20201112172616.784945-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 375e570454..89f550c859 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -27,15 +27,13 @@ PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,
 
 inherit autotools gettext pkgconfig distutils3-base systemd
 
+# exporter comes with python3-probes
 PACKAGES =+ "${PN}-exporter"
-
 FILES_${PN}-exporter = "${sysconfdir}/stap-exporter/* \
                         ${sysconfdir}/sysconfig/stap-exporter \
                         ${systemd_unitdir}/system/stap-exporter.service \
                         ${sbindir}/stap-exporter"
-
 RDEPENDS_${PN}-exporter = "${PN} python3-core python3-netclient"
-
 SYSTEMD_SERVICE_${PN}-exporter = "stap-exporter.service"
 
 PACKAGES =+ "${PN}-examples"
-- 
2.28.0

