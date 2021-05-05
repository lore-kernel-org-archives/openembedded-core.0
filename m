Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.9844.1620227981972522986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BPF2/C6q;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id u13so2508246edd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qgiDMNK2Own1XNou818bw5/YJwZIU/Lvy7Du5g7TEWQ=;
        b=BPF2/C6qc4OMwiBLEb4aX55R906vu7U+Rifi176+ISgXks1+2eUcNP4AwE+HQ1Ux+B
         6uk5j5K5/F43CRa5KzJyK4RqC3VGEsR0bx/+f7UT+hYXsWe7APxLK63IXSTiDkkxtsoG
         9vZ94qhDPr952dK0no80VKO+aIXmFHAv3Lz4StSOh/1xtdISONRH4KlQEqp6sEXrxSZe
         T+FsgZRZzK9l1rZ1Tk8qvRan/s4NOh317wWGRDTXjOpi50TmkB0BLByIKixkwH3HQID/
         Nycgviv28/rNGrXG5rm1TZhbEgywAl9xfZiYpYeDawpzxMdXpqtmn0+hpwpCt+6TkRIn
         Fy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qgiDMNK2Own1XNou818bw5/YJwZIU/Lvy7Du5g7TEWQ=;
        b=ILwmUtNUP29zwt9MVGd+0sBarNBRWz0bt/Er+YLc9Z9jHecbOYdk3p29L6yH0QZTFj
         VHQ+ppTOeEZ4mqEPRFqxaYMPpJggCmP2ahqfB3+/mxqhtlSy07n/iS0VhkPxltCEApkT
         oC8oWa1dOW1vXVhmPmlSVwuH2e681itMY0hfJfYyX7hUanZw5wBOGF2oOGdOqZe/zbdb
         8gZ5g+UVMa2P7Z+Dc4q61H+YLqyv9u6CWZmHCztzsiOsdamZy9eaEeJ99pQlLH4xIAWq
         hhzbrtpXsiUGCgRiuSKkK0IjIK6ENfKbhlS8xS+0dQ+JkjX4YDMPak5c+vYcRdfY2RGf
         6cug==
X-Gm-Message-State: AOAM533INzx3eeM6qccoY5OtKFtiDvbrI+gaRPiGFY+MsOiWKjniX2DV
	eIMH+8K7R5E8+bSs/vZXKlaYVU3U6GBlfA==
X-Google-Smtp-Source: ABdhPJwY/N8rw+LLE3E3JeEHLQXDsNeDkHVB+usEv/fR9mzmBbPV76Xs/sD7/7GI0LJsTFWKIpBXVg==
X-Received: by 2002:a05:6402:416:: with SMTP id q22mr32843727edv.204.1620227980370;
        Wed, 05 May 2021 08:19:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 54/61] xkbcomp: upgrade 1.4.4 -> 1.4.5
Date: Wed,  5 May 2021 17:18:43 +0200
Message-Id: <20210505151850.660512-54-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-app/{xkbcomp_1.4.4.bb => xkbcomp_1.4.5.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.4.bb => xkbcomp_1.4.5.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb
index 44143a04ca..657ec7580d 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb
@@ -7,7 +7,7 @@ XKB keymap into one of several output formats. The most common use for \
 xkbcomp is to create a compiled keymap file (.xkm extension) which can \
 be read directly by XKB-capable X servers or utilities."
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=08436e4f4476964e2e2dd7e7e41e076a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=be5e191f04d3f2cd80aa83b928ba984c"
 
 DEPENDS += "libxkbfile"
 
@@ -15,4 +15,4 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF += "--disable-selective-werror"
 
-SRC_URI[sha256sum] = "59cce603a607a17722a0a1cf99010f4894e7812beb5d695abbc08474d59af27e"
+SRC_URI[sha256sum] = "6851086c4244b6fd0cc562880d8ff193fb2bbf1e141c73632e10731b31d4b05e"
-- 
2.31.1

