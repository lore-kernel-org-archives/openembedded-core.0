Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.857.1589820582660763972
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nzlBG8Y2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id 145so5202747pfw.13
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rjlHpEMLW+K0ArR82WDt+TbqdPg8Zjtw5NyHmSB/7co=;
        b=nzlBG8Y2RCTclVBxEH5Y5YpYrZhzdN0l1KWcDEtKrHqqP3DRDiaHsFdE9Le+eGZpmi
         un9xCN4XDfSLSqa3KrN0iSuJKJU9nsyjJiLU0qJ/jeyF0n2PVXAm+SDGtL8co/U2WhzE
         eQBnd01Iz54HydGVsFq3H72XFVb/3MOHyUYZ+go0XYr4how535zpKuRKXLW4GmrhF/QK
         SAl6pzwIv+pQ8sHv8nZtg1AgfGtglr6KtJ5KShTAhwPmYYeHbD9fNqMo1a45LwGZGU6U
         3RZ0+0v3ovf2T9ZWDiSQxrnh0uDJOHM0VLcEHVZT0guIFlc8vs3FR79c2QjqBJbdc4ah
         DDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rjlHpEMLW+K0ArR82WDt+TbqdPg8Zjtw5NyHmSB/7co=;
        b=nOe3JoppKkGF5bksxBZKQZXwFvPmsHvT3fNsfiGSuRJJIQJGqjKKauC6EARFIGvt3o
         mLbdWXm0B5KYyDvXJowUF8/byEV7VuCTlONWAWbFhO7GliATekcwM2M2NuRZE6HGacEP
         XyL8ZREpdB2KCXNZSyaEkRDCaSutseC1n0k4gEjngLSzqFRscLYkJbwbacLIEFb53cJD
         k/M42aht1q/VH2jYRXV8n6pYfynUbLQWzyOJ9E1WsPL70lS/fsif/wYdT1Mjl9WZTESB
         wx4bs5ucF7JRGoIs1zuoxFbXgbdkrhHu2+AAofoPs77d6LRwlI9LrYLJbecGUxB265LX
         e4/A==
X-Gm-Message-State: AOAM531h42fUHKzx6WB7FEAAW50r/It4PeYfzE3tiitCggGjs8p7RACb
	6+XQpFw08sbTbxv64LkzpRoL1GaZn+dNiQ==
X-Google-Smtp-Source: ABdhPJzkjZViOWxyuVKv8BY9SI0sMlBHwjexbfDQUHKW7t41p1jfMOaz7MhcfNQ8TRFmBtR+ft+7+w==
X-Received: by 2002:a65:6718:: with SMTP id u24mr15399256pgf.451.1589820581739;
        Mon, 18 May 2020 09:49:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/19] pypi.bbclass: use new pypi UPSTREAM_CHECK_URI
Date: Mon, 18 May 2020 06:48:34 -1000
Message-Id: <e5f3f961242d888f3f786af8f793bf1d247fdff0.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Tim Orling <timothy.t.orling@linux.intel.com>

Upstream https://pypi.python.org/pypi/${PYPI_PACKAGE}/
redirects to https://pypi.org/project/${PYPI_PACKAGE}/

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index ffa8aa3ff4..87b4c85fc0 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -22,5 +22,5 @@ SECTION = "devel/python"
 SRC_URI += "${PYPI_SRC_URI}"
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
-UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
+UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
 UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.17.1

