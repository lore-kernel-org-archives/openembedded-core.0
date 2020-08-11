Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.1456.1597170498307465878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 11:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aASPT+0h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id a15so12355550wrh.10
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 11:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JSq2Y3Pptvlq4LObYIKB/QprpXzCFa0N5SQAbprq0uA=;
        b=aASPT+0hfZvkw1z99JrCYu3GV7EPq2cV1fsrFFWrzXOUl7Woh91a+lDWgI+ts7y/ZN
         LuUQV1iK3jFJ53l27GzT9JKUg7gK8Ld2phBwdZo4wyxPPSEFbJxxUf3R3DINUZuMLtUh
         OzJ9eNgp58irwPXI2bLHa6MCStylPw3k7luso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JSq2Y3Pptvlq4LObYIKB/QprpXzCFa0N5SQAbprq0uA=;
        b=fRG4SOPzwskoKIg/rWqrxGGF2MgaZ1BRlyFOGTQjfsc6Zoe5HRs8vVYiMM9FSqws7b
         dfTPLILWRKzrxJC8sgMR8/DNWLj9DHduK2U2Otd8OZjC5sY+8htVvkocKibsDkTQkb3w
         s7upF8EReMjIkIBqBUytZ55O/O4FyADdaHRN/jLr+ZX2jv+ENtEzXVFdpv+7IKUEibWf
         i44b6+Q4E0GdZn/BL6D6BZxJryg7/z2XtTMV7ZaYSDGDa/7gOgjkBoSHCTQ9h+PWJING
         QvMX7kCv7EH2GC3vtzVx8tAOc0PZAHobZ6S6OYISSb1ACIYzNil1Is5xuVU8ErZhJi8S
         vgEA==
X-Gm-Message-State: AOAM530f4vxnsFJ+mIMmRFjCITUFsnm/MLzWAiy5iZjm9uE39EuH//vN
	EzMhWeQDAVo48mFQjkj+E404PSpjfubh9g==
X-Google-Smtp-Source: ABdhPJxQWbiUn8idL6MvVMRErV5dYPAH1ICRkuo/ArdHMolWiFR8eosaPa5N2LCkM/xem/2yEBDDBw==
X-Received: by 2002:adf:df85:: with SMTP id z5mr29522733wrl.267.1597170496577;
        Tue, 11 Aug 2020 11:28:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (b.1.8.7.e.c.7.c.b.7.0.b.c.1.9.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:291c:b07b:c7ce:781b])
        by smtp.gmail.com with ESMTPSA id x11sm27128781wrl.28.2020.08.11.11.28.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 11:28:16 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers: Update entries for Mark Hatle
Date: Tue, 11 Aug 2020 19:28:15 +0100
Message-Id: <20200811182815.887148-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

db/rpm/depmodwrapper-cross no longer have a maintainer, update his
address on prelink. I take pseudo since I'm doing the work there
in the absence of anyone else.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e8d42db12f0..3d29af40d68 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -135,14 +135,14 @@ RECIPE_MAINTAINER_pn-cups = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-curl = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-cve-update-db-native = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-cwautomacros = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER_pn-db = "Mark Hatle <mark.hatle@windriver.com>"
+RECIPE_MAINTAINER_pn-db = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus-glib = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus-test = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus-wait = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-debianutils = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dejagnu = "Nathan Rossi <nathan@nathanrossi.com>"
-RECIPE_MAINTAINER_pn-depmodwrapper-cross = "Mark Hatle <mark.hatle@windriver.com>"
+RECIPE_MAINTAINER_pn-depmodwrapper-cross = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-desktop-file-utils = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-dhcp = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-diffoscope = "Joshua Watt <JPEWhacker@gmail.com>"
@@ -567,9 +567,9 @@ RECIPE_MAINTAINER_pn-popt = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-powertop = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ppp = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-ppp-dialin = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-prelink = "Mark Hatle <mark.hatle@windriver.com>"
+RECIPE_MAINTAINER_pn-prelink = "Mark Hatle <mark.hatle@kernel.crashing.org>"
 RECIPE_MAINTAINER_pn-procps = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-pseudo = "Mark Hatle <mark.hatle@windriver.com>"
+RECIPE_MAINTAINER_pn-pseudo = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-psmisc = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-psplash = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-ptest-runner = "Ross Burton <ross.burton@arm.com>"
@@ -622,7 +622,7 @@ RECIPE_MAINTAINER_pn-rgb = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-rng-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-rpcsvc-proto = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-rpm = "Mark Hatle <mark.hatle@windriver.com>"
+RECIPE_MAINTAINER_pn-rpm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-rt-tests = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ruby = "Ross Burton <ross.burton@arm.com>"
-- 
2.25.1

