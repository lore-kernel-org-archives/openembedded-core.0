Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.17668.1590940470815530204
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JrqSlE9J;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id l27so6907963ejc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rfhxDj/Vckp1taKGOwzdtXtfOTHxzGs8TslMGcAou3A=;
        b=JrqSlE9JX/mfk9irk3G5ZRWSbLmLYwefc0MaoS+uuoRejpeFzEhRkLDyY5RJ77f6V6
         R9a0i+rK5gz38dn/GgU6NsbPicGUG6Pvf2ZY7/ZNOXxWwZ955nDarQTW+MY+sgeX+MCN
         EEHlD1K7aqkvBkepej02JpsVLnoqxWu3E+LEsQTwiYE5y74BvAda4FnNPAxuUaziR628
         gJy0tsHVV555xY1cLe+TguwIH1rPDJJoG+eF5XyjVUo9XaVHSMp9VRKwdvi3HCMWJxog
         UZSydo3J4bUzXRa0x/nSEZQxboyWupwTp6w9Yo2EiKfagAJ++rqYfE9TlNL3VlGHpkaH
         VBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rfhxDj/Vckp1taKGOwzdtXtfOTHxzGs8TslMGcAou3A=;
        b=hiEFqLgdpR81FakhAsHxyTnRU6Y77A+mEDteDnOYLdrq9JtYxB7TpA4z16b28bXCEA
         GjiGtCmU+6toxGUD2ggiwlY8Oi6oyW7fTm2KOBlq6EK2irjWalFG4pdOrqjwTajEYLkV
         zdZQx/hIK55n67seFy16sYRv14nXsr9dPuaXzTuPeI61uXYbvpQqVhhcghm6XlO/lQhF
         vpagYpjO/pFSHKRBoEj/MGx5r3rSnY+8+dPcGR/jJ4yNpTjfEAoSKBEjNkfSOCDpEZNL
         AMHl3JkO/pn1bhSlNEbPL2CAOQHZOQ8WjS7bweOgeJ7M9Y/oDI7OEefxeQAruNJS+btm
         agZg==
X-Gm-Message-State: AOAM531wWnMwZc8baknrqd/rVh5Vroz3SJ4fp7Lgn5GwRVGmbOWtqRKM
	g+y2L9KwbEQuXFHqyexgcnuWDSfb
X-Google-Smtp-Source: ABdhPJz1dCefzOcACMiVUIEIekTrXjh8XC5I6vArSi5zCO+F9zLuEw2G5oQt2gpm6Hdi6QwLGJk0Lw==
X-Received: by 2002:a17:906:1a47:: with SMTP id j7mr6539662ejf.356.1590940469136;
        Sun, 31 May 2020 08:54:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 69/70] pulseaudio: exclude pre-releases from version checks
Date: Sun, 31 May 2020 17:52:53 +0200
Message-Id: <20200531155254.10283-69-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
index 601499b6da..b7a4a9b3c9 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            "
 SRC_URI[md5sum] = "e41d606f90254ed45c90520faf83d95c"
 SRC_URI[sha256sum] = "961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057"
+UPSTREAM_CHECK_REGEX = "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
 
 do_compile_prepend() {
     mkdir -p ${S}/libltdl
-- 
2.26.2

