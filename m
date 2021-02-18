Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.1506.1613614969467385492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 18:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fdnu7NkG;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id g20so409456plo.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 18:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OV0EoxbQYjpBHKZu0b6gQ6yVlHYztPdgpI94QptxGnQ=;
        b=fdnu7NkGppjs+i9E4QCGJaYrZYsJhDApt6dgNnI/QDuSaue3/ZAnh21NtjhHUL8RPF
         EDyvaz1EJ5s/OezzeVpZ6FVvKLb4qHNws0ctezZPMg9T/iO5TJttivRApwUQF4gSeeV+
         GNLSihLsfIKz8VmRE4PP9gG1nzQY6T2PMN1K60n2SagkI+Q5QOBqx1bfNoHU+jL4mwr2
         gzZpN6YtUaRE8CsOylLXfJzig2iTqSxfwuO+vux/nyqxdRtcFBBNPqbAgfoVh9tGIpqb
         dJFC+ndaEGCls7AkcZk4SAbVSkMVMgP8tc+Gdh92LpRIftqw2Ga5uonrS6VWYn+BYbfu
         uxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OV0EoxbQYjpBHKZu0b6gQ6yVlHYztPdgpI94QptxGnQ=;
        b=USDQVAU3Jz81D9g0gxk/IWeHfYYoVfloaI7uJThfVWehKWSaTzWwrgPn3/+Cfwmhkr
         rhhZa+subw2hH7mwtqBXj79BqmvpaiVWJT0sALiP4AJ/iGKaXuQ8YD7ocs7UJrIwcvAl
         +r2w+Lugd3Ir3GhzuCsKaybJJ0OMUbeQisOcOb6+2Npb7tuKiOoiJYvb2yCqSIS47jKB
         EoEKGTGW/+y6NpoECMZgiKiHLajQ45IQCH3hJU4nWwodVTyawSEDF/FaA2gcFwCLJ8OD
         9tyTxx0NM2Bre9dD99Cy3Ghl+3PwJLZofpO79y+0b87Ruy2vCkLRQ+IX9jPv2LXaXsLi
         gfIg==
X-Gm-Message-State: AOAM532yN9QRmrA/92UvnXPNTqH8AApjMp9ZLhEx3wxPzkfpy/VEar55
	XBmSN9Ih98zudaXlsfskeJ/Piw+6jHMKHA==
X-Google-Smtp-Source: ABdhPJyd6+n9pP1FnJfxHxy/WZ6xhTjIeaqdSlvE+pXCBWtgzZ5BZcax+tnTma+7lfm3+yp5teC5RQ==
X-Received: by 2002:a17:902:be06:b029:e3:7031:bef with SMTP id r6-20020a170902be06b02900e370310befmr1810944pls.19.1613614968764;
        Wed, 17 Feb 2021 18:22:48 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7db1:8052:decd:2a75])
        by smtp.gmail.com with ESMTPSA id n1sm3895783pfd.212.2021.02.17.18.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 18:22:48 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuste@mvista.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH] sudo: update to 1.8.32
Date: Wed, 17 Feb 2021 18:22:46 -0800
Message-Id: <20210218022246.6763-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuste@mvista.com>

Source: https://www.sudo.ws
MR: 108078, 108046, 108136
Type: Security Fix
Disposition: Backported from https://www.sudo.ws
ChangeID: 3d266a182918f7a7afe40bdee01b369171125358
Description:

The 1.8.x series is a stable release.
Bug fix only updates.

LIC_FILES_CHKSUM updated do to 2021 yr update

see https://www.sudo.ws/legacy.html
CVE-2021-23239
CVE-2021-23240
CVE-2021-3156

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/sudo/sudo.inc                           | 2 +-
 meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb} | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb} (92%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 5d27d469282..aeedfc1a23b 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=4d1b44b1576eea036d78b8cc961aa93d \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=07966675feaddba70cc812895b248230 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.8.31.bb b/meta/recipes-extended/sudo/sudo_1.8.32.bb
similarity index 92%
rename from meta/recipes-extended/sudo/sudo_1.8.31.bb
rename to meta/recipes-extended/sudo/sudo_1.8.32.bb
index 39d8817c32e..6787f43e1a9 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.31.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.32.bb
@@ -7,8 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "ce17ff6e72a70f8d5dabba8abf3cd2de"
-SRC_URI[sha256sum] = "7ea8d97a3cee4c844e0887ea7a1bd80eb54cc98fd77966776cb1a80653ad454f"
+SRC_URI[sha256sum] = "5ce3c18c5efbecd5437a0945f314f1822423eaf9a2d7eb7ecf80857bc32246c5"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.17.1

