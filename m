Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2FB6C67E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 13:40:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s11so12077671wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 05:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=zR0yK2GNG57aFsM08e/8yowQ/uMMgLkuti4DIe4wkdg=;
	b=ljVFrx/I8MeeDMHdnZAwPtm8+5TJIIfEYTsP44zly/YYU27cKA+bEqJaTHosXbqIZs
	G+C1GQ5zIx4N6n2zCHIGElw7ehLIDSsquV6pvyBsIevfU2SDg9Ds9TuShh0HdKh7r8BD
	GTwpJPv0UPF8FTtDr+Dc4mrwzzR19U/27lbtS4ez44xxSQPYUGJtZgqobkgkQRDODXbV
	7qYHKoA+qhFnZIHqvOTScrPK7JEqrsNsTpmpXbOUtAMwG7wOSY5GOQbGF2Vw8KClVDfG
	JEfg0ysYWOE/w49amFa6iGcnL31DHmgLxZ16Mtluj3oOJKGz2iNxHHeaCEbUju5j5AjV
	JXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zR0yK2GNG57aFsM08e/8yowQ/uMMgLkuti4DIe4wkdg=;
	b=KWnGiXr7aMRi/4agnRpAT8DPvLJ1K/s8h/CTKdil8iFN8qaHchDnw+KnBzZ5I+6fyd
	L2JgfKX1dqWy3z1hRPe5QG4WbHae0DFjjhyDDDZAv5y/xH1Un5PD9kEO++xbyoC+Lk1m
	8ZMkmO3SbSqJ15GR06p8nH26COKKfz3sD/KpR9GppzWELr0SBXe44WnsI9dF2eJiWUdF
	qHDQMMWmbBzYREV7v+CW62r4FU6kPsnLcXn34W+PykLF7W7XsNi/ZOScW54ltjf6irga
	2TLHcxVFqtXNIWin/cWQeFnO4+FaR42gNqjbHRgwZxrEyaXnkKJ7h4WcaOPskHGj+lc8
	actw==
X-Gm-Message-State: AA+aEWYmYgpHkGJpHUXGynxeFeoFoxdcOnu4OosZy8aj/cDnaM7dR110
	Oi4ql3LWLHbmtHlC/U7EUDroikAaiMY=
X-Google-Smtp-Source: AFSGD/XtjdZUOXQFGOAO9fhGavUUNTZf30x3GQGSo86CmFpnCHC775sD3z+7Y/4nkHrjzrxjHoZHRA==
X-Received: by 2002:a1c:b98e:: with SMTP id j136mr14558656wmf.9.1542980447757; 
	Fri, 23 Nov 2018 05:40:47 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j199sm15633490wmf.13.2018.11.23.05.40.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 05:40:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 13:40:44 +0000
Message-Id: <20181123134044.7577-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python: let more modules build in native
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
X-List-Received-Date: Fri, 23 Nov 2018 13:40:48 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-async.inc | 2 +-
 meta/recipes-devtools/python/python-git.inc   | 2 +-
 meta/recipes-devtools/python/python-gitdb.inc | 2 +-
 meta/recipes-devtools/python/python-smmap.inc | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-async.inc b/meta/recipes-devtools/python/python-async.inc
index 6664ab013c7..139bf2c51c7 100644
--- a/meta/recipes-devtools/python/python-async.inc
+++ b/meta/recipes-devtools/python/python-async.inc
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8
 
 RDEPENDS_${PN} += "${PYTHON_PN}-threading"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 7ccf1686fd1..f973e9f42c0 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -29,4 +29,4 @@ RDEPENDS_${PN} += " \
                    ${PYTHON_PN}-unixadmin \
                    git \
 "
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index 789ab959fd3..aeaf55e610b 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -21,4 +21,4 @@ RDEPENDS_${PN} += "${PYTHON_PN}-async \
                    ${PYTHON_PN}-shell \
                    ${PYTHON_PN}-smmap \
 "
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-smmap.inc b/meta/recipes-devtools/python/python-smmap.inc
index 55aa516e0af..c81474e922f 100644
--- a/meta/recipes-devtools/python/python-smmap.inc
+++ b/meta/recipes-devtools/python/python-smmap.inc
@@ -15,4 +15,4 @@ SRC_URI[sha256sum] = "0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c
 RDEPENDS_${PN} += "${PYTHON_PN}-codecs \
                    ${PYTHON_PN}-mmap \
 "
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


