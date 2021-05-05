Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.9823.1620227939852924415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FgMOxtGV;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id n25so2505216edr.5
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xXFwWaJ8y6XttxbwbWmeIYzyp8mm867XEQKvaAUjOKo=;
        b=FgMOxtGViFHoSKBCGGrxIwCKNEUYZPeOC1SteFRl9dRkVTtrYN6Gd1vkVYuYXfW5Vh
         vAyRwBOnAw9Ira9U/2UlxyAKh2en7LruOkIyVsdq5oU7XfZ6oFlZZOY66VRsCQefLSNG
         7tq8OJoKu2lLeMNKnoT4d0Hv/LxR5LCZYUJTNVe3ZI1hUzrMg0k2EX/h8VnEToa3m17T
         ckLU4LJrU6eCRgMonBjsO+y5kN46e9C12lq9HOOwCJJKJCMqQiv1IlqR579K/qtY10+G
         AWqOfi3Y54QCZ7PTM2LmxqKQJxpvEzOcZIWAMQiCg9Y1nlOz5fgKzvchcyQLIpqbDQtx
         YePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xXFwWaJ8y6XttxbwbWmeIYzyp8mm867XEQKvaAUjOKo=;
        b=nj3RU8HWZmlZ6GvsWAjOYARcOrA34YSJWyKFzDLH8dzveoXCKbK1vaboWOPsT49SvL
         DA08UAGjSeyM/4hgFh7yncbx9g2ypei5Oj6gEsH0whK0TYKd+46nmvbf8rV41FGJn0kL
         6dkHnNhADm4rOi7xX1vhoQfx6eY4trEp4Ek6CzJ1P1BpHjp2xPgeDH2I+7GkIwqGa3fT
         K73ukdVvNsWanHgtAGhU09OtlSI+fECwGe6vMcmWrmq2iCaZ+ExJKIq11PcMBuXM+xDP
         6wzKkUDj6V4XmdJAG1OsqoD0wE+b8S4RgUQYZWxtRRxtgREn+iCYoZucdajucSDBNNe1
         1D8A==
X-Gm-Message-State: AOAM5315rQkDCaozLqKksDZ52lnYvUHvBI8BvfmU1CiykUE4DTPCSG5x
	h0MjAuxLTNYqyJcMR3opsK8G5Vw8UOlyPg==
X-Google-Smtp-Source: ABdhPJzF0yKEWorxho37JFYRd6BY5y5TnZtndcOBwck8fZeDsQrPWha7PqYhzwpJYBdc5L4fSmu+Xw==
X-Received: by 2002:aa7:c34b:: with SMTP id j11mr33941997edr.188.1620227938483;
        Wed, 05 May 2021 08:18:58 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:18:57 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/61] vte: use tarballs again
Date: Wed,  5 May 2021 17:17:52 +0200
Message-Id: <20210505151850.660512-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/vte/vte_0.64.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-support/vte/vte_0.64.0.bb b/meta/recipes-support/vte/vte_0.64.0.bb
index a16dac7e67..fc7d3014a5 100644
--- a/meta/recipes-support/vte/vte_0.64.0.bb
+++ b/meta/recipes-support/vte/vte_0.64.0.bb
@@ -18,12 +18,9 @@ GIR_MESON_OPTION = 'gir'
 
 inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-introspection
 
-SRCREV = "2520d6b6785646ceb5f501f9c37a1a0307fa4486"
-SRC_URI = "git://gitlab.gnome.org/GNOME/vte.git;protocol=https;branch=vte-0-64"
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-
-S = "${WORKDIR}/git"
+SRC_URI[archive.sha256sum] = "c0c60b8dc343167437c86d984b0cf134df86034180ed70513f683006ada3ec41"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.31.1

