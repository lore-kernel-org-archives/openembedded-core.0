Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.5237.1605279194920375572
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QsWyk/mf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id z3so7793225pfb.10
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xnU/Dtpo3k3OUsFgWt85SxV9PK8XDgh0ajHJ24zBb68=;
        b=QsWyk/mfHn/cbS0LdQHYYRey1T59c256ujcVncxNOZq7QO5daQLdmfmJ00Gp36Nerx
         Tp5JRryFDdhhUna8SiWt7a/gh2RJ+0VplGDgeyADj0Lln1siQAmNuQU+mqc+O0TMQ67+
         dYtkTAVswxRVT/C21R+Jzc8MBtVFYFeYulAHLZmvaqURZnOHPeWWO4sB9ld4rpxPQo0O
         aCqs/xtF+2A9oexoEEviFhLCKiok+du+OxgFc65yl2tkKlfTa77XfO5VCu/pVMAk6I2I
         b/QHFROwJBiYL+iw5rHic13fuR51iHztFwJ+UfW+WsotMRsMtrRzxY5CskXqmO+gAD3Q
         wnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xnU/Dtpo3k3OUsFgWt85SxV9PK8XDgh0ajHJ24zBb68=;
        b=OGcjMN9TCyXCGd0Wz1gmg3CMcx34Fy9tSTyCIH013U+SJqJZVN1lriYoiUvjLBM6mZ
         H06WvnBcuYIAjgIilurOdlFpuw2p80KHDeGCOXOglbE7BiIzRI5cOE45ZDHnYUvsULg5
         dIP6+GMWxhuEQ1KIu0RM1CBpb82Ag7kuqO2muzu/Dt49tA04dPYWxR17AS2DEFMo3HGs
         Sd7Kma6ZvszaeI9Sb2wM3jajL6Ply2vXOE4AYQHGhi6XG9qJe4PgP0anfVW6KTOGVdhY
         2BN2WKLa1uPnzqGYwhdx+4J7IaaXclld4pxDzJQKge1hYOBzyrzHpmXl7Y1lpiMa7w66
         jvDA==
X-Gm-Message-State: AOAM531aUNAMDhSNAqVvgvlFqfv1A+eJgAOYf0JELBMbV3wYYo00lQ+q
	CC+BRl3v65HyZGMgpFPslviSsABGy8cZbW/9
X-Google-Smtp-Source: ABdhPJyVOFrQc1yOprpCzFxFvxBKJAefCt/mSHXnr0Np9dYggh1XxACNk/BRhMHlZyZOWT5cWSSfOQ==
X-Received: by 2002:a65:6201:: with SMTP id d1mr2319550pgv.156.1605279194008;
        Fri, 13 Nov 2020 06:53:14 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.53.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:53:13 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/18] openssh: Upgrade 8.2p1 -> 8.3p1
Date: Fri, 13 Nov 2020 04:52:19 -1000
Message-Id: <40ba168dfbf638daf6eefd42e52876794fc7d11c.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Alex Kiernan <alex.kiernan@gmail.com>

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b8ec59302bd2fc1a78f4d828ba93b3ad64ab7f37)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/{openssh_8.2p1.bb => openssh_8.3p1.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_8.2p1.bb => openssh_8.3p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_8.2p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.3p1.bb
index 17138c0ad8..e007328704 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
@@ -25,8 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
-SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
+SRC_URI[sha256sum] = "f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2"
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.17.1

