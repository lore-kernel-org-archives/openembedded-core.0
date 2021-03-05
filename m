Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.12800.1614955694266711794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=z3YW2Pnb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id w18so2211143pfu.9
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1tzQDP73m3jCZFwYZZKw7ZnHBQNYzN8TKE6Hvmc8KC8=;
        b=z3YW2PnblsnF+G4yDNGI9U2NzK2xJ70AC6bFy8KxQUZzCS8ihegZYqsvCk8Zbc1vgY
         czhv9mUZPSHHnagBvxzyF/7P50sTaViNfU0YQ8iqLovJvHv9GM4HyOSI0sKCzA5A1Y3O
         67/tEKT8NssrKWOmBH5MTxt6+9ZPAsj4IiRpkv56FEvYoCSKt9RxbSknak4lGphvrqvJ
         kFR1W2okNayD9tvDStWp5hAIds6YXd3ACQ0u67WPucRVLT0P530uCLVXb4IhayVQlyhb
         /chDusSHE35fZNh+dbfUluQVBKywL6RILMX5rl6iAY0g/LAFfxmfJcVXp5XyR6Y262hW
         AM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tzQDP73m3jCZFwYZZKw7ZnHBQNYzN8TKE6Hvmc8KC8=;
        b=mGObJTw/sGpRovG0r4hPsoECdcaifC3pgEPMJceTU82RiWZizAGubD4ib/GKWQDQXw
         2f2JPuIt+lzyqqzkv6AzqvMhudLb3STEWZG6JErdpFls52iYAT7pIRzMClPt8IGmipdv
         leGO5s6ER968QQKLgNhjhJOo0PcaPVkkMSfubO3buiHLEsS/uoc/ojDC1SxcBnQevrjk
         Q0dEMphzUygY3JGze7A+y63+5wX0SaJ/rZONPK43vfxaWRdc4PTM1k9samzNgHt2nq4K
         5q2CXy+eK7svPOGJX/k66UzqrgbVACgKDgf3oUwXXbn8h71y0CARUK0aASn5XRr9GkiI
         Fdxw==
X-Gm-Message-State: AOAM530tjRbgJdNBWf5LCJd02Jh9ZZ8XYmxnqiR0Di188pLYk56oU79Y
	gWbVc7iDjyTO9e5nMmL4teH28lqUcqs2FfgP
X-Google-Smtp-Source: ABdhPJwKnBqDzKXlDibv70HXJqsHHfJzR/lHo3XahpsihkJleMMdDCKTlHdSSvlEFIA4ZT51q4/wOQ==
X-Received: by 2002:a05:6a00:14d5:b029:1ec:c5e5:6041 with SMTP id w21-20020a056a0014d5b02901ecc5e56041mr8897314pfu.36.1614955693160;
        Fri, 05 Mar 2021 06:48:13 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.48.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:48:12 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/27] maintainers: Update email address for Victor
Date: Fri,  5 Mar 2021 04:46:23 -1000
Message-Id: <c3906ce966aeeb7e254e3fa40a90660aa54d9203.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b509fe1c5ff86a0397fa98d7bcd0199da32bf14)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ff962a3be9..3fb925cc2d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -661,9 +661,9 @@ RECIPE_MAINTAINER_pn-systemd-conf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-compat-units = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-systemtap = "Victor Kamensky <kamensky@cisco.com>"
-RECIPE_MAINTAINER_pn-systemtap-native = "Victor Kamensky <kamensky@cisco.com>"
-RECIPE_MAINTAINER_pn-systemtap-uprobes = "Victor Kamensky <kamensky@cisco.com>"
+RECIPE_MAINTAINER_pn-systemtap = "Victor Kamensky <victor.kamensky7@gmail.com>"
+RECIPE_MAINTAINER_pn-systemtap-native = "Victor Kamensky <victor.kamensky7@gmail.com>"
+RECIPE_MAINTAINER_pn-systemtap-uprobes = "Victor Kamensky <victor.kamensky7@gmail.com>"
 RECIPE_MAINTAINER_pn-sysvinit = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-sysvinit-inittab = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-taglib = "Anuj Mittal <anuj.mittal@intel.com>"
-- 
2.25.1

