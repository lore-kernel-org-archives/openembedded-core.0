Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.8699.1596639022703519735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dFm/og9M;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id 17so2472740pfw.9
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pnocu2Y86SNa+Lh7mU3O//vbiFNgSPsMCprvn+KUihs=;
        b=dFm/og9M6rVUId1EuLYDjrwgx46jUVzm+yuprlW3NSoDK5D331MP3TKk0+dPkQqC9t
         1NEvT94pzoF5fvVvU6AjD/388B/yfr2sYLf8qJI2KK30wS1XPvRSf+OaeUaoXpUkxD9l
         OQGGiUKnbQQ9gV6ISbx7BTsevo4JRyZevTBOnNWWBZywaq6hPZDz3K8vnayJnKKz2DMz
         h3yJ5snmNEtD6PSMjCJr9dQAgBVfhN/vKL3ojD14DzulsPLzutoX7Q5wXM+JzlgIEVn+
         kdrHJ3ivR+nKb1FWyPGXrU0nVsYCjJ5ClNUp8lgjz/dgGWDIZjvUyT4cGBb/XJK2qwp/
         jSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pnocu2Y86SNa+Lh7mU3O//vbiFNgSPsMCprvn+KUihs=;
        b=ODVyBmRMqLe6lJX7IjszpDvnrzOXMhA/AuRlpHxu7FtcDiMhXQoewvk7Mp09aGvq6w
         DbBlgs2yZ3k+IBrJiTzr5XV7hvehlYIZHqX9iQTCCR/U3rERaKg8vZFdK1H4/AKu29SU
         z3agvvNP9j4HbWoOr14AafTrl/mS8ALpZTzASU2aedxVLBdHHknDkRqlviJ2J4fZCYOM
         Gmjk7GkUq57Dmb407e2FG05glJzChQHQcjd0FDJEKFkdzH6hHEoEkUAiw3UYUXzyHHML
         gNDOJFgd8lkbxS3ZehBAz2DikHgJe6diaimHwzXT/gkzMDvCm+zecB7uF3ONYpeFu+vX
         SbAg==
X-Gm-Message-State: AOAM532oB+/hQMOlbE+6ygb8XtTyd/4TNIcMmIhDuivOf8AsRgS0rcN7
	UXMq4AuSlBYvawPlRpFnMo8KDkGd8KU=
X-Google-Smtp-Source: ABdhPJzZMtslLA4fKbX9Ag7rZ7WFQARpr+XREszMQCe1btr+WyWsVRI+VOpi7quozyGXOcRm4I0JzQ==
X-Received: by 2002:a62:7b43:: with SMTP id w64mr3570382pfc.282.1596639021752;
        Wed, 05 Aug 2020 07:50:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d81sm3879721pfd.174.2020.08.05.07.50.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:50:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 08/11] gnutls: upgrade 3.6.13 -> 3.6.14
Date: Wed,  5 Aug 2020 04:49:31 -1000
Message-Id: <79b821161275cad5d9c54078e65293109184ad65.1596638643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596638643.git.steve@sakoman.com>
References: <cover.1596638643.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Security and bug fix release on the stable 3.6.x branch

Fixes CVE-2020-13777

Detailed list of changes at:

https://lists.gnupg.org/pipermail/gnutls-help/2020-June/004648.html

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd88c81804a4a52b9875f2244c9f35911539be96)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/{gnutls_3.6.13.bb => gnutls_3.6.14.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.13.bb => gnutls_3.6.14.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.13.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.13.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.14.bb
index f56d42a613..a285e5a1f1 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -21,8 +21,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "bb1fe696a11543433785b4fc70ca225f"
-SRC_URI[sha256sum] = "32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38"
+SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.17.1

