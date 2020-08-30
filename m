Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.36648.1598811491108555348
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HrRcFtbo;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.43, mailfrom: steve@sakoman.com)
Received: by mail-io1-f43.google.com with SMTP id g14so3854846iom.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=184Fyujj+sbaSB9wnw6tSnTkAksZpPMVSju4ywGsyYU=;
        b=HrRcFtboBbDv6s3RkHCOG+bqJvjD1K9+O3M05rYykCmFj+biYSpkeFbXW/Udt0MtS8
         IWny6B25YGsRlHL/RCEVrqN0k6HDOlsDIKv+zjACmJBaRlGvJzdOkzzbWR4yyadv+dwV
         Jo1RyVduNuj2s2Thwotus/B3vvNlhxfVYDFPO+8xAeejrusS4NM7oBqS/rPGYsrKQgP/
         f/tl4bl583sviqs1kGSKPb8oQacuTpWCWk+09OOUgvs1MwVoVC0Gv/rVqP6eQFe5HMFB
         gqmfJiEF9KK8Nmd6usdfofOHwjiI93pG1Y2CQy4FYzZLDYv0VlEied3TrUsJOOffC/D5
         dWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=184Fyujj+sbaSB9wnw6tSnTkAksZpPMVSju4ywGsyYU=;
        b=FecpbQ7Zn6dsjBLbaogJR2qi8n38oR022ERRBvpBAYgJGWSWkD52BrpsGxBY/UHYen
         KuQ/nNCFnNVrML7N2q82fMcQaYNUXXuBUebbq11/KAZy2dmSJxa9svY6WgvVET71cOz2
         lG2dS9Dq3Myh6hwl9tCDMHEpdECttZiFStT6YohRdeVxEPpsnNL8QiBmreUW9ij3FBhm
         6ySr7kYHpImRPntbhPPSGcRJ6gzPPZBfMpOIktg3GqDmixKtJ/76hzz9fC4DiLCfXX0n
         TKGqBEDUTuqO4JWTc3V5Q+sDQwHCE2df1c5b60PIP9gm252Xxp4OUTOWlHDt3os/lNcm
         QaDg==
X-Gm-Message-State: AOAM530V07pt0sKfoMhzFogvX/YRktrpDnxgBq/cYXI1Isrv8QcN1O8B
	Oi9SjN1WeJlJVveBnpWMK6gj5gC9/EIc6WUcy9Y=
X-Google-Smtp-Source: ABdhPJxCbqR6sMEOtoXaljdPn5dhQTIzTdBZ93EqtVnqPbbDdYRJf3Ec8HV5XlUiSj+fn6D2jz208Q==
X-Received: by 2002:a5d:9ed3:: with SMTP id a19mr1247385ioe.28.1598811490088;
        Sun, 30 Aug 2020 11:18:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/25] package_tar.bbclass: Sync to the other package_* classes
Date: Sun, 30 Aug 2020 08:15:59 -1000
Message-Id: <2ac25329fd2efbfdcc2b97948cdcb3402ee497e0.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Mark Hatle <mark.hatle@kernel.crashing.org>

Sync up the anonymous python definition with the other package_*.bbclass
files.  This should make future maintenance easier, even though it has
no difference in behavior from what was there.

Additional, there was a missing deltask in the nopackages.bbclass related
to the package_tar which has been corrected.  This could cause problems on
native recipes when package_tar was enabled.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f87452942f6391a239b50e3f3f9fa100e74a78fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/nopackages.bbclass  | 1 +
 meta/classes/package_tar.bbclass | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbclass
index 559f5078bd..7a4f632d71 100644
--- a/meta/classes/nopackages.bbclass
+++ b/meta/classes/nopackages.bbclass
@@ -2,6 +2,7 @@ deltask do_package
 deltask do_package_write_rpm
 deltask do_package_write_ipk
 deltask do_package_write_deb
+deltask do_package_write_tar
 deltask do_package_qa
 deltask do_packagedata
 deltask do_package_setscene
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index ce3ab4c8e2..d6c1b306fc 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -57,10 +57,8 @@ python do_package_tar () {
 
 python () {
     if d.getVar('PACKAGES') != '':
-        deps = (d.getVarFlag('do_package_write_tar', 'depends') or "").split()
-        deps.append('tar-native:do_populate_sysroot')
-        deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        d.setVarFlag('do_package_write_tar', 'depends', " ".join(deps))
+        deps = ' tar-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
+        d.appendVarFlag('do_package_write_tar', 'depends', deps)
         d.setVarFlag('do_package_write_tar', 'fakeroot', "1")
 }
 
-- 
2.17.1

