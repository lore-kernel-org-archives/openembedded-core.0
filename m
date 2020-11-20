Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.661.1605893404383531487
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:30:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KK1pL84Q;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id f18so7843058pgi.8
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dnkMuYBCGeAIJNklaplMvQqJKpCascOO7nnVPG26KoQ=;
        b=KK1pL84QQa8lVP2djkZlU68fgjh8hy1dTGbe5RGDlySQ23UU9zlGB+M2wAV6M4KjiX
         ZWmel5UB+MHkEOt6r5OYVyb/4TartwzP1Zvub2KFq1OxN/LC6oRGZ+VX+I4qHe2sWM/m
         KIaiYGCJKCk1PcXYQOSlEzpOQ2vi8m2qkoz36+iJf9UlT1Ry+PPVsAqhlNzHK9cTzhyl
         3u47NUz54VKLm+KTtluXosg8ESb/70MN/+nqcGu1mvzm/6L2GVy6pMRqc2Ejbv5IRSe6
         MoGoRAts0ztQlVI8wop7ID10/agvMoOpP1xZh7yl68iH27SodPP5E72MuYSlb3Yy4Fy/
         kQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dnkMuYBCGeAIJNklaplMvQqJKpCascOO7nnVPG26KoQ=;
        b=nmuVqi0k1ICxVK71dJ9J8Q/Nc44nk62yDZPEMpCgFkyZ4t1KCIk091vpG3lPQGto7a
         XSMb3ufuCof9MMZ72XdKukFkJifvJKM1MZHOZnlk0vAALjJulG1rcZXAIHm5j01VPG0m
         LaI9rzhwKVbuVqAvGPGeV/Pdoen2EMkelwutsK9iPYRHZw3OlC/p2mwpOrgmnTIXmov1
         VQaBodmYX/5bRks+5GurELaCi0h8tM4vwR0A3b16nEgZleB/xtzh4STnkgK9+PoCaeCe
         HTzsVshvDyWqCaOQTuNHhmB7koZZjJtdmhHd91d+tyJd1iwlCJ6kdscITCg8JDkBtwd3
         T02g==
X-Gm-Message-State: AOAM530s4cLO1jQOLYJwGMSC1cBRjSCo0izc5fj1wNyUJAIVNQvWPmQ0
	plzPGm/J5Z4wgDaQBU1zXkCqbUiSkVySxg==
X-Google-Smtp-Source: ABdhPJzS739PN9Q3MbH6Wr3+p+ycMjAqWeot+u0S0NqOTVaxZafnljPw4tv6fq/mhl1qdpVPpdZ+Og==
X-Received: by 2002:a62:1d10:0:b029:163:deb3:5df2 with SMTP id d16-20020a621d100000b0290163deb35df2mr14890947pfd.68.1605893403497;
        Fri, 20 Nov 2020 09:30:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id x61sm4855684pjj.4.2020.11.20.09.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:30:02 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 7/8] maintainers: Add myself for new pytest related recipes
Date: Fri, 20 Nov 2020 09:29:49 -0800
Message-Id: <20201120172950.1619754-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172950.1619754-1-raj.khem@gmail.com>
References: <20201120172950.1619754-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5349aa3971..def8098b06 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -591,6 +591,7 @@ RECIPE_MAINTAINER_pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>
 RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-hypothesis = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
@@ -606,11 +607,13 @@ RECIPE_MAINTAINER_pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pytest = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-six = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-sortedcontainers = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.29.2

