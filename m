Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.63697.1595877581809175768
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 12:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=0xacjDTF;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id r19so18459428ljn.12
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 12:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uJGoobgT76ak3Zn1F9zfREoKQP6NzsT9F/VC8tDXD6Q=;
        b=0xacjDTFoqJ+iF66RkLO4NfHQZzkFluFLmiVrNxBSD5GCXYnXyLuq2YswKomqXSd2c
         5jmCG+wvwp8ZU//nNySiYkmo3dCW8taGRy510MqEH7HymIXn4heNgqyMXlOKw61pwcpf
         TQAs3NqGx+Bq1L38txtVGr+IhkXpb6ctUAAJr0VH/yM3ti2fn5cdEfc1mWHAMT1BIizS
         X/GUOjYMHHagC2qrkn4T9dM7a5F8qx5ELsgpwMh/cIPa1RTvVxoyZp8Q7gXgqgvWxtNe
         G0bKdINko+u5XkWjgjJe0CxVM+6KjYEw6yLGx4xnpruwQjrJ4txxFDC6x5CFM9D55zmQ
         +EuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uJGoobgT76ak3Zn1F9zfREoKQP6NzsT9F/VC8tDXD6Q=;
        b=M5qpUtrceS21TSLMTS6+IU2B7mcP1r2pLEn56nvG94U0KdgIf6Nt9N1FqIGg7O9QPO
         LNNZHp8XWFRe8J7nYAUNv8ihfUvLsXfiq2J1hQEWLjBpIGY4eCD9CyhiIdP19n9L3RbV
         +wm79B913D7y7m1oQe0lglXg9Lb8ECcEAuZAE3iw1uqi7FF0A6hzvJDV4OH1So0EYR6N
         IHUvveHGo1u4H8bOfSkUno8ORQwnBOoSPHD50HzbbL37z799AzuGv5mmP9j0M4x3Voxd
         LCQ8uRbVpOzs7TcErSEiJCx2L+usZA66rqXQL/mOyLic1KU6l7u4SJx9Swszgr1faROY
         87ng==
X-Gm-Message-State: AOAM532ISz3LPYEdtjcJQ6ZbBbz0s9gsyimPf3ciUj5funafeCaGdIhP
	nF6MJsdj278lziuOimvuUpMlhiod4/Q=
X-Google-Smtp-Source: ABdhPJwch8LQjzBqt8XKm3b1YXaSgyKb13+8tbneOQtHBOhlwaylzHHbfH+qy90scdKpnr1AWN8djA==
X-Received: by 2002:a2e:87c2:: with SMTP id v2mr11021844ljj.78.1595877579326;
        Mon, 27 Jul 2020 12:19:39 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id 186sm3213430lfn.66.2020.07.27.12.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 12:19:38 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] git: update 2.28.0
Date: Mon, 27 Jul 2020 21:19:17 +0200
Message-Id: <20200727191917.2470300-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/git/{git_2.27.0.bb => git_2.28.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/git/{git_2.27.0.bb => git_2.28.0.bb} (51%)

diff --git a/meta/recipes-devtools/git/git_2.27.0.bb b/meta/recipes-devtools/git/git_2.28.0.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.27.0.bb
rename to meta/recipes-devtools/git/git_2.28.0.bb
index 8022659ad7..e90787d060 100644
--- a/meta/recipes-devtools/git/git_2.27.0.bb
+++ b/meta/recipes-devtools/git/git_2.28.0.bb
@@ -5,6 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "77ded85cbe42b1ffdc2578b460a1ef5d23bcbc6683eabcafbb0d394dffe2e787"
-SRC_URI[manpages.sha256sum] = "414e4b17133e54d846f6bfa2479f9757c50e16c013eb76167a492ae5409b8947"
-
+SRC_URI[tarball.sha256sum] = "f914c60a874d466c1e18467c864a910dd4ea22281ba6d4d58077cb0c3f115170"
+SRC_URI[manpages.sha256sum] = "3cfca28a88d5b8112ea42322b797a500a14d0acddea391aed0462aff1ab11bf7"
-- 
2.25.1

