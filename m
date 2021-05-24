Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.20721.1621847649478368223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UR3ety2q;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id df21so31102718edb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vmNQBBJCJrudN/DGOjUaRne2WXKj/S+N/TLfR/FyVyE=;
        b=UR3ety2qoKHYY7T37pLJmnV+8oWUgWP8MOMvBFrgSuZwggE3eLCjqYlIXBOnuayoPL
         TdM2tWsJrjCzUU9byD8s0SrOSYsw0Nj5j+dAbsKZCIsD0h2taqGJj1FDpI3xz6g+HV6C
         z5sJ2eBwhW3xt9tdqTlY/WelFTvGhqlFoSZpVK16/6z0jVM42AdYvft9LGD5A4d4rT2o
         zxdHW9LNGZykHmGLAaDwPDsPMPneyY2QpKL5bHASsVEOAetUMJEqI7y2lXCHyEcS4Vlx
         cL8MwNDIWynL7Efnhdu+8kZmoXYs6tvltol8wpnYoY2wHknKH674I4Ckicc8MrpV8pA4
         bpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vmNQBBJCJrudN/DGOjUaRne2WXKj/S+N/TLfR/FyVyE=;
        b=Fk2P69JDEvcy54R+I/d3zMn+kNfkcHGWQwUA6MXARTKngSOkoiMbBLo4xGZYLl+LEB
         mDTwk8h0XE7I0BxWS1fxRiaBGBNmDjpHl1GyreB1LNwjOBtVdd6ZUM3hCNdQANxtWktC
         gpl0x36IL0g8rOa4v/xAq953BfzesZyiGfQQ3LGh0Ij6LUx5zRmqVWFdS8Hp4/WEF4iM
         qHIvJH52yNL0X+bvwTbsGzDJj9/pcn9CGSGyO3aVxmcAqcyju2QkASmjXaeyNlepF9ru
         A8qjuPxLMSxpJnqCJtge+Ae0bm1HkBRZkr4R1wv2EnpjAVXkwePpkFFiG5WSjeZBzKWq
         gu+Q==
X-Gm-Message-State: AOAM533JbMQDbQ33LaNWv4cirZEyeHPs+e7NpDLyLDujiYcqo1zFamuE
	50LkL45rjat+IkSO+w9YZjsOV+Pa+fw=
X-Google-Smtp-Source: ABdhPJzLEiZR3EHHagwjUNicOkoJtCVb4/isC1ZT92NguxqiS0dISvnNxKXhp0U2fVP35v9IFMlQGQ==
X-Received: by 2002:a50:fd13:: with SMTP id i19mr24774730eds.386.1621847648127;
        Mon, 24 May 2021 02:14:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/21] at: upgrade 3.2.1 -> 3.2.2
Date: Mon, 24 May 2021 11:13:33 +0200
Message-Id: <20210524091347.419253-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop a script in /usr/share as purpose is unclear
(nothing references it), and it pulls in bash without need.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/at/{at_3.2.1.bb => at_3.2.2.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/at/{at_3.2.1.bb => at_3.2.2.bb} (95%)

diff --git a/meta/recipes-extended/at/at_3.2.1.bb b/meta/recipes-extended/at/at_3.2.2.bb
similarity index 95%
rename from meta/recipes-extended/at/at_3.2.1.bb
rename to meta/recipes-extended/at/at_3.2.2.bb
index ae15df8662..5c2018774c 100644
--- a/meta/recipes-extended/at/at_3.2.1.bb
+++ b/meta/recipes-extended/at/at_3.2.2.bb
@@ -37,7 +37,7 @@ SRC_URI = "http://software.calhariz.com/at/${BPN}_${PV}.orig.tar.gz \
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
 
-SRC_URI[sha256sum] = "aabe6e5cb6dd19fe9fb25c2747492f2db38762b95ea41b86f949609c39fb55c4"
+SRC_URI[sha256sum] = "2211da14914fde1f9cc83592838fb6385a32fb11fcecb7816c77700df6559088"
 
 EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-daemon_username=root \
@@ -72,4 +72,5 @@ do_install () {
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
 		install -D -m 0644 ${WORKDIR}/${BP}/pam.conf ${D}${sysconfdir}/pam.d/atd
 	fi
+        rm -f ${D}${datadir}/at/batch-job
 }
-- 
2.31.1

