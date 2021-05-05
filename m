Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.9856.1620227982076033212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Huhn0siG;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id u21so3417030ejo.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=csZ5ZPPfB5ziGkY4xl3bAMjyTsgG/hsikIgwVx3N+4I=;
        b=Huhn0siGqSVcqhco3R7VytwSm1hSWBgk89lZRcQeKD3MguxqyPz0I8SfuUYdfpQxEA
         vZ4Jt4ImKPaFqurxYDNsBBwXeUDUOWZwFpu6uJJmF21VOLrfyxJFC/UjlVaT9JxWihpp
         AG7TV1pE70fjiWk0aTb0gkrOIss9pGUfOgmlq97goRI0A+blwF4Yq/Rem4WB46IgwWGL
         EGA3I16d/pMu030vz3TDSUUl3PA4M/KG++T/6NVZJQ2kvene6y7qpAQSPp2exrmntyqe
         dlpCKajFnZoLUZqYZE0BVdTN4ssP4WVHTNg2YH3wU/OXyYjTrYVSld3VPGN1U2t7r37w
         bHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=csZ5ZPPfB5ziGkY4xl3bAMjyTsgG/hsikIgwVx3N+4I=;
        b=OyNUlXNhd8saKmOF9qvpQ2BurTaYLXT3/tDxhvWeHroas9rGh8LVeo1wEIAtgVUnL7
         LIzwPfZBG6NhxnH1Y3cjF5NS7MqjG2Cc1PirSkytTDKSWuNNYWiGECgQjyT1zAxmqCTW
         cpJ7PgIHG30L9RUpSjQbcGtjUGi7/uX4Xd2LEFxCWlijr3k6Lu2FGy1dWJtI/ElR+kcN
         PNQtNehu8pM6QrcYI3E9z7zqvljfbjYaccOU9j/kvlC5xE3tmw6gilOmVR4ERlCQ5OK8
         HR9SRdOhK46HDLX1muDH/J9ozTiRIEscCh+i0bDUO57oDerz1Poo1/+GhZw3G3NypsfC
         4dIQ==
X-Gm-Message-State: AOAM5322qwjV7wWwrHWW/wcmTdfuPuJ+eVRO80JIubl99wmd4H9iZpVN
	0Uk84z/4Eu0lBW58hU6Oi8t/BZNfQ6LwwQ==
X-Google-Smtp-Source: ABdhPJxi4xH+xKDVnH17qfP8RV6JEa7TaSe2cnxkJzEFp4qB3no16gymVvWzlrA0LEINw3KV3nzfKQ==
X-Received: by 2002:a17:906:11cc:: with SMTP id o12mr28243651eja.85.1620227975704;
        Wed, 05 May 2021 08:19:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 51/61] stress-ng: upgrade 0.12.05 -> 0.12.06
Date: Wed,  5 May 2021 17:18:40 +0200
Message-Id: <20210505151850.660512-51-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../stress-ng/{stress-ng_0.12.05.bb => stress-ng_0.12.06.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.05.bb => stress-ng_0.12.06.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.06.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.06.bb
index eb6bdb4a81..7e9135ad01 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.06.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "af7779aee38e6d94726ed7d5cf36384a64d50c86e42fff89c141d8609913f425"
+SRC_URI[sha256sum] = "75eb340266b1bbae944d8f9281af978bd5bc2c8085df97a098d5500d6f177296"
 
 DEPENDS = "coreutils-native"
 
-- 
2.31.1

