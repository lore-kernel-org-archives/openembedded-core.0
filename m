Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.7849.1603974614559911789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 05:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dO4au+gu;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id k3so3524741ejj.10
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 05:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ObSbFREmGZZyM6HQL50Flln1zeGExlpupH4ZRXLF+sI=;
        b=dO4au+guOAUB0HsvlhqbY6janKNE2Rx643WER4ZYyjGTm0Hjfgz21A95mvVe7Un46P
         L9FM+a1yRHKBfqNsTPyLnDHm1QgnCWiIC48j/+GfwncoYuna7WD9DA8ibc97FFKJylJz
         jdatfPdARE/vll8DN4c2TCLWAg1fzL+306Ty8966ymDm3yYyI8Xay+YCwL3UTPL5mwza
         qqGyMFPTXoE6//B9TprJ6a4c//NDmEqZ49WdxAB/gkLfdBvGrMHH/vvEb3t3TcZX5Ojq
         3if/AukZ8aLgXB/z8xx0mLs0wRvvZTgd+9KSY4RM0L0RFam2O9eS24knS1ZuzH1u006n
         9ojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ObSbFREmGZZyM6HQL50Flln1zeGExlpupH4ZRXLF+sI=;
        b=KdI7KTVg8Bj4Wphty2ch8a4eFuVHxozLJxUdbcHGJR6KmbikJf2qB5HKg/o/bpOwsG
         xHO4ii7DVnbE4OAKsoWNXlsIa870D/txq+mNREC63ezT+Tm7qjUKRivzxp12bSmAt27E
         jlQc1iKzlebBBVhhIo5SPzpjqvWh4aj3nVO3Jw3XBwX/oVrfToUMnfWvNvqMpsvF5v/e
         iyekJRe4HH4wmZy6DHCxCT6k8YNjN/WOBB37YKxrbCPMVbQy+fAK17l/r0ihvq9ZqQX0
         0bE5F57sb0gl2belA2YoroieYSRa/xTGnTLGCGhGqIa8yXA7nBM1a5FVZwkyKrVkvinT
         4/qQ==
X-Gm-Message-State: AOAM530yhEerqQKsloiCk/Z0NQ/vkNAmGvjnixn3FSVD8yOA9zL1Rwt1
	2G0v1SVUYnPRPM085fx6l3u+6sv7ptbemg==
X-Google-Smtp-Source: ABdhPJyuZy8uFKLXKzHeCH05LU9csCwSe2biySQkt2s+ODcPOGxURfv46zKqJz0ES6dLfUB5oHxdRA==
X-Received: by 2002:a17:906:76d5:: with SMTP id q21mr3953472ejn.415.1603974612830;
        Thu, 29 Oct 2020 05:30:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id l20sm1412229edr.56.2020.10.29.05.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 05:30:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/3] libhandy: move PV to file name
Date: Thu, 29 Oct 2020 13:29:59 +0100
Message-Id: <20201029123000.21044-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201029123000.21044-1-alex.kanavin@gmail.com>
References: <20201029123000.21044-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libhandy/{libhandy_git.bb => libhandy_1.0.0.bb}              | 1 -
 1 file changed, 1 deletion(-)
 rename meta/recipes-gnome/libhandy/{libhandy_git.bb => libhandy_1.0.0.bb} (97%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_git.bb b/meta/recipes-gnome/libhandy/libhandy_1.0.0.bb
similarity index 97%
rename from meta/recipes-gnome/libhandy/libhandy_git.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.0.0.bb
index 01b932a528..3cdbfc820f 100644
--- a/meta/recipes-gnome/libhandy/libhandy_git.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.0.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = "git://gitlab.gnome.org/GNOME/${BPN}.git;protocol=https"
 SRCREV = "94313c206258860b2428712e7ece1d02c5177857"
 S = "${WORKDIR}/git"
-PV = "1.0.0"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
-- 
2.29.0

