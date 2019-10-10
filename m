Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0DAD16D666
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 11:18:54 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id r3so7400196wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 04:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=29sIhOa0zJkn80Pt6uojnE5zJMdDD1PTMdi2SRhdUWY=;
	b=WTdt61qp04JN+7z/PAVD8ju72Ys9JdPvNC7X9C67lFViKIh+lpmbwKbdWNYfC+bN4q
	cs7RkWStwfFQz276CbFSFLtoqDSnkJ5u/MxMysNCz3AqYO9ub14Q4ZP9K2O6bjToxzKo
	zo87jifoJEULsjuhTCl45VR/HkwdIxh5X4nc6LBj8aoRsZ7kPS6QeAmcEfIuyReGNKwr
	MgJ0q70iZ3NgUNJ7tW+ChcfoReO25OcnDWDDLyL+pu+47HYPtwpZiZaAaYQdE5HCPbSG
	odxzXYVvJJt4M322M5+BZ0hPJvApso8EJy7reQuecNOu9d48bAr7FjQI3T7iSQUxqebN
	Ncow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=29sIhOa0zJkn80Pt6uojnE5zJMdDD1PTMdi2SRhdUWY=;
	b=LpPlFQhJNJXgoiKYbEvt0ZGAa8jdmGRFwrLMhhp/dLqG+cVelgq/BAnBdXT0Hq9GWp
	kZ/YnOE1+tI41LckCGS41NdxJe+3qqLtlZhe4zHQB6ipqc1GbQwO14GIa8ZJjoLrjFdg
	gwk7Koz8duiM2gFF2nsUSGqLORxN7qy1hV8JtW7hgwjgiVVc8PbWQHq70KaVWW1Yw9JA
	VulU0WrSOWmyyogAQ8jkUgx0pajZY8a2EbC60gbPymVkdfOVSpwuZpSmhmwxKRlsrFjr
	T/EO3aoPpkip+MCBd7AmAqnJ2s+rO6EyRVnrPayHBtcfgvICDz13N6vp0tm1ape7PQcd
	rWkA==
X-Gm-Message-State: APjAAAWbiAK/+awbp+ZqLOFnp8nCOXosF5PtkFucN0lqFhiUPpadWFhU
	mFI8OtK3heu2SwtpCc6r12xlmlxPqw8=
X-Google-Smtp-Source: APXvYqyMTA5UwU68syWzMlpO1I/QleJ//frjwFmtuXTh7axAirTeej1COxcYMBhIzAZV/1RIiRTgXg==
X-Received: by 2002:adf:9102:: with SMTP id j2mr7512396wrj.136.1570706335484; 
	Thu, 10 Oct 2019 04:18:55 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l13sm5831372wmj.25.2019.10.10.04.18.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 04:18:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:18:39 +0200
Message-Id: <20191010111848.3825-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/10] socat: turn hard readline dependency into an option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Oct 2019 11:18:55 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/socat/socat_1.7.3.3.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.3.bb b/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
index 067f7c64443..1dbbe5cd558 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-DEPENDS = "openssl readline"
+DEPENDS = "openssl"
 
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
@@ -39,9 +39,10 @@ TERMBITS_SHIFTS_powerpc64 = "sc_cv_sys_crdly_shift=12 \
                              sc_cv_sys_tabdly_shift=10 \
                              sc_cv_sys_csize_shift=8"
 
-PACKAGECONFIG_class-target ??= "tcp-wrappers"
-PACKAGECONFIG ??= ""
+PACKAGECONFIG_class-target ??= "tcp-wrappers readline"
+PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
+PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 
 do_install_prepend () {
     mkdir -p ${D}${bindir}
-- 
2.17.1


