Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.8232.1590074598577779040
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 08:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fbwHV21P;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id b15so7404178ilq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 08:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=NvyokGiOzFI77R+lzSCTsIelK4kYJ/SET7nuIfuRcOo=;
        b=fbwHV21PRBP1a8g+UHO6VVmAhlwvIA7A6u59i9eZDMJZbyfJH40N5SsML20gcezofv
         F7+CE2ZEWeXOdqbpU+8hybVt8nyW3mOxwBuMvav53I+4tls5DtSxey3aUvQZV5kJzTDS
         nEVHNmk1c4rnTZosyli+aT/fgOHcElvp1Wt1yxCc5U0DxgG8e8MHLXIViAlGRugm8W5A
         KCfP2Ixza/ZZCEJa6vM/eA2lkFVI6NgEIS+PEWCbZKWzgg/kKnDmNtKsb8gSlVAI8RmR
         /AZeT308hF0kg0q36YY7KZ9bPqq5nVEHJ6GoUQmqCBLYfYFbEwuxAKpJLZmju7SaP+JD
         oCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NvyokGiOzFI77R+lzSCTsIelK4kYJ/SET7nuIfuRcOo=;
        b=nkq4k0NJ//2x50DazRkzqlBOuKVjQWtsZw+qo3kw5NwBnotHBzjDAdglehz93+bgee
         VIiK2zz34vAHpfbJS64HGjqPv37lQ1Fzu9+LdhjT9d8Sy04+LwWwmcg+baiB5ivSvmd+
         MAJECtmXyyDF9nkOKXsmZM8pfPViC7b5t2X4aZ+MGOSWLP/49w7Bwv6cPDPNxDbslOoQ
         MDQL1fX4meq4SuHcWnkCGhf13TBC0BOHUET/xocU3M2bwz9KS9aBPd4rBCTs2kLC5XKn
         pvmmJzEuCliMUEhvi7F2lcUUnH0d5WqBjG+gd/ziLTWhCoWWMikkNwR4o9GPpMipRLAa
         TVmw==
X-Gm-Message-State: AOAM533TZCDkIQGFzyX5Dm2/qE/jrgYE/TzlUoT06KKGKlczFUhJsHnI
	DD9cm1fqrxyF0l2Zapj2itWP6xFHr+8=
X-Google-Smtp-Source: ABdhPJwfFVRYwaJXMw9I3BqW+ZF/KEUssNxzuR4r6JZKvGUP1gqtC5sI4rtCq09bTyZgG2WsphG06w==
X-Received: by 2002:a92:9e43:: with SMTP id q64mr8864396ili.136.1590074597771;
        Thu, 21 May 2020 08:23:17 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:dd2f:75de:f1b0:dc7a])
        by smtp.gmail.com with ESMTPSA id n27sm3150589ild.76.2020.05.21.08.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 08:23:16 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] diffoscope: upgrade 143 -> 144
Date: Thu, 21 May 2020 10:22:59 -0500
Message-Id: <20200521152259.25069-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../diffoscope/{diffoscope_143.bb => diffoscope_144.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/diffoscope/{diffoscope_143.bb => diffoscope_144.bb} (75%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_143.bb b/meta/recipes-support/diffoscope/diffoscope_144.bb
similarity index 75%
rename from meta/recipes-support/diffoscope/diffoscope_143.bb
rename to meta/recipes-support/diffoscope/diffoscope_144.bb
index 4ba3832d10..3a877cae15 100644
--- a/meta/recipes-support/diffoscope/diffoscope_143.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_144.bb
@@ -7,8 +7,8 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "a86cf8467a5dec99832d5c082928f937"
-SRC_URI[sha256sum] = "a1fb4dd97af92bb8ce275d1caf465971726919e28efe5f043bd3ea9afb50574a"
+SRC_URI[md5sum] = "4ee9d1a36086caa31ccbc6300ad31652"
+SRC_URI[sha256sum] = "9a45464b7b7184fa1ad2af9c52ebac8f00b3dd5dcf9e15dfc00c653c26fcc345"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.17.1

