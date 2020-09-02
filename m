Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.917.1599081248153399917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dzu3AK5V;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id c8so456774edv.5
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=in5/YhhXdtL+9zH0gk1bEpDgxUjhbY0PKvfu7e8ELUk=;
        b=dzu3AK5VXzfu5HspY117Rz5DaldFDj02YS7ARSncKMdpHLenZ97Q9moeKLWluvMkUq
         GoRApPNffx4fY4LvSSVezsCjHMp/bgXrjJiDy+Cg1junY+uApPG9/gIYz3XnO27o5wpU
         Kt1XTx5YIbqlm+MaLNsTd50u+YkKWkIvmLDf55a3MX8g+JR9fWzEy62fU8KE7153OFmH
         tAo/2GPALLTp4C6q73YtMZsky96OxlsIbv0rK6eklIFHVSeNoBKLwUUQ4BGsR+V+FWR1
         fHmnxn7etFeYSCbQAItQjr74PYRFYW7nWulwrZoBh63/t8RqtcXvLO2dt1pgvWd6NzsZ
         1pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=in5/YhhXdtL+9zH0gk1bEpDgxUjhbY0PKvfu7e8ELUk=;
        b=SfytFDSxExl/7pKQ4uBi32gUTQslxrew0u8wgvx1vbMVF5Obx2yK1HlICAIKzVRKLf
         m3LhRbPFHvy0utg9d65hnKqFCv6Nv9ktdjXOLL9yjpl2AusAK8GNI4xuWFM7J2jYo5um
         q5ztl5DQAuFnSVQvjzoHfxMj82Eh85xTSGW4r+ZFOy770kZaawbu0Wfgbh85B2PY2+i5
         EiRz25w3dN2MQU8cXEaYKmpQpTJEXmVJ+gDG6qvsMHT3Vo6egoVJkrE0wR+j8dXOUbl5
         CGjqr3cBjpFYk06aQ+nBE6oDY1ys7NJJcbKKluRGihOCb5naEYkVeICCqcWErFfMba+R
         gNMw==
X-Gm-Message-State: AOAM533CyuDmYn4zAJktnpDgJI5oNQYhMRaRCNLIX//icUV77xr6C/Ol
	5dG85rIFXQbaN/ze5wI5aY7WoJJEB+c=
X-Google-Smtp-Source: ABdhPJxW/TyovrA9KCVEzOqRWsf31lTJyyNLxyer+fPK1d2uWgrI7E4P55hR2i/U7mJcKqwLDhaEmg==
X-Received: by 2002:a05:6402:b1c:: with SMTP id bm28mr2096014edb.116.1599081246292;
        Wed, 02 Sep 2020 14:14:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/23] p11-kit: upgrade 0.23.20 -> 0.23.21
Date: Wed,  2 Sep 2020 23:13:19 +0200
Message-Id: <20200902211330.4853-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../p11-kit/{p11-kit_0.23.20.bb => p11-kit_0.23.21.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.20.bb => p11-kit_0.23.21.bb} (94%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
similarity index 94%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
index 4ba93f998a..b1fd2334b2 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
@@ -9,7 +9,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "git://github.com/p11-glue/p11-kit"
-SRCREV = "762cdaa2cd5c5ec09cc844f9a6bdc551c7f6c8ed"
+SRCREV = "fd8b56f3ee971f94dc6fc95411fc01e1c12153ab"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.28.0

