Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.36986.1622412541583827091
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V6rGDWyI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id l2so1456683wrw.6
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uLO2CdB8YFnCYt3ct6b6QSyhyh/ltKsM9oB62yRVSAU=;
        b=V6rGDWyIMPrElCh0KuiH9Hnt8SugklmeupkwKw3AlUkPLiDzVvuAk5dpvubjFp2n3V
         JlBunjFWR6JlpnOrKHwKZC++auMomx51ct1E/wJ8eV5Ve/vm8/rfGqiTy3BEJRPis7Tu
         03HJYvbb2vxraou2hbpV+gugNbwFr+rLvXFo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uLO2CdB8YFnCYt3ct6b6QSyhyh/ltKsM9oB62yRVSAU=;
        b=K60wTVFyrGQF1RRAuVBJiV3ShV53iqzxz2dkMHzHWXqTbohmnqLuB6kRUTAHU2+H+i
         uZS6zCPg6U2lXjiEKe0dPVja13khlA/cyRoHYS/sIhSAM+zPnwxyB+MaHZo72mpR+Oly
         NXLG2NrlcDa8zN5IWI36o0lB1FdRbAWD2T8Ow1GC9h9UgAcd2ULTKReXI5yMG3iAJeN0
         530yyS+q32+WTUCGDUDtLA48oSkssEVQ1mbePMLixNQTdxChBB5JpJyRQLKKyhgEUVX7
         yxfPtN8MB62y/1PFfKqQsyofDS2UBlno6GinVW4D2QZ5xDmDkg1q/cpUvkGKaBHtryNz
         uAiw==
X-Gm-Message-State: AOAM5338kBdCrFFdMN9LUkHUk+d/X8qY46UxpCFKMzzJw19z6GJvhSoA
	YFg1FiOCFdDgnmeryVhXoDmszEzXW3Rxlg==
X-Google-Smtp-Source: ABdhPJyRcEFHzlkeIO5GT73YPAuiP0F9siYxXuAh6tPNoualsGGU60hlbBJwnC8o8XgaZ9RSiZbhtQ==
X-Received: by 2002:adf:f54b:: with SMTP id j11mr18125443wrp.376.1622412540127;
        Sun, 30 May 2021 15:09:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.08.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:08:59 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/16] vte: upgrade 0.64.0 -> 0.64.1
Date: Sun, 30 May 2021 23:08:49 +0100
Message-Id: <20210530220856.2830501-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vte/{vte_0.64.0.bb => vte_0.64.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.64.0.bb => vte_0.64.1.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.64.0.bb b/meta/recipes-support/vte/vte_0.64.1.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.64.0.bb
rename to meta/recipes-support/vte/vte_0.64.1.bb
index fc7d3014a53..0401eaa0497 100644
--- a/meta/recipes-support/vte/vte_0.64.0.bb
+++ b/meta/recipes-support/vte/vte_0.64.1.bb
@@ -20,7 +20,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "c0c60b8dc343167437c86d984b0cf134df86034180ed70513f683006ada3ec41"
+SRC_URI[archive.sha256sum] = "12fb41a9ff8e03c5f1711b46560910a4b9b3102aec3e9e7609ceef4dfa98aa2a"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.30.2

