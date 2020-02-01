Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5851660619
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 10:58:50 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m10so10649095wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2020 02:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=c7m/4qLnodKnRCKPxhn40iSWGUWOKmuC6spepsGt4Gc=;
	b=eusdZI3hLpaiMKdPcrd86XtiFtDHYvfNYU91sOwg6fVrwamtaFJGqXWMQ27khZeBzn
	IAT2z3Xb3ZiGUTtt9G/ZF+9NLbJQCGA0RfGGg4K8B+cHFw92N0JX6Os6Fz+ldJSqcl3h
	upAHgc9iBrpmtgQ7LRGlDLbfX+T1x+3KHeUZdfQP2OAQr62/F0FkX+/GtkUb+bW4L0Wy
	/xI4opHtK3qTtQ0qD2DbECxXZ9HFKjJN7SaFMMTW8+qPPWQr2UypSgLOScQXApDyUyyU
	0Ajnf3GWy2u6AJLwJ9il/p+AOMx8pM+nnhIxX/uFe/4z0Unl/oplU6Pk6rZRHdCEkRXo
	buZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=c7m/4qLnodKnRCKPxhn40iSWGUWOKmuC6spepsGt4Gc=;
	b=s1YoVdvq+tOEM5BrQfQGE+9Bd48eFXKNbJW0OF74s4iQghkF09Nm9gbJe1u6H3oZ2x
	z4Oz0mHgv/csgbzqAS5354UmahDYOD2NGM8EVk/Y4e2uhKRr5Oh+dRbayEXy9TYDwebZ
	oY3GAZjlg+/3KXaC9hYjtoEjSgeKfYnBvLe/5BUYjH2jhc/51oaNA6oI6HBrC+EEPzSh
	mi8sxCPht1tUEsO33QpeDQY8ncQXBUow+iu0pI8ZSxcYXZbyK7cWSCyHXEBQ+wtCFKjb
	UVhxCqGE7nAGFHl5I3IixZpz+FBIW0k0IWJuTgNDhOBaFesm6urqI+r40YkMWq8ZzCQ5
	7YKg==
X-Gm-Message-State: APjAAAV5LyNR+q+2hXhZdl6xV7lBfLOAEbXen6wIaYmG5kbpqIgsQXw9
	WfFEaxBrePKH00PKqHzs2GSXmv54
X-Google-Smtp-Source: APXvYqw/Mu8vHXFi2A74BkJMshvEiMD+SYFkbr5x0Mc/pQXwwe24S6a9/QM7HI0abgpxA9GbcXdBbg==
X-Received: by 2002:a1c:5448:: with SMTP id p8mr18733239wmi.159.1580554730808; 
	Sat, 01 Feb 2020 02:58:50 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	r14sm13131358wrj.26.2020.02.01.02.58.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 01 Feb 2020 02:58:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Feb 2020 11:58:22 +0100
Message-Id: <20200201105823.16391-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] icu: update SRC_URI
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
X-List-Received-Date: Sat, 01 Feb 2020 10:58:50 -0000
Content-Transfer-Encoding: 8bit

New releases of ICU are published on github.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/icu/icu_64.2.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/icu/icu_64.2.bb b/meta/recipes-support/icu/icu_64.2.bb
index 10bac7aac08..44caa437bf7 100644
--- a/meta/recipes-support/icu/icu_64.2.bb
+++ b/meta/recipes-support/icu/icu_64.2.bb
@@ -6,13 +6,18 @@ def icu_download_version(d):
     pvsplit = d.getVar('PV').split('.')
     return pvsplit[0] + "_" + pvsplit[1]
 
+def icu_download_folder(d):
+    pvsplit = d.getVar('PV').split('.')
+    return pvsplit[0] + "-" + pvsplit[1]
+
 ICU_PV = "${@icu_download_version(d)}"
+ICU_FOLDER = "${@icu_download_folder(d)}"
 
 # http://errors.yoctoproject.org/Errors/Details/20486/
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV}-src.tgz"
+BASE_SRC_URI = "https://github.com/unicode-org/icu/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-src.tgz"
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
@@ -26,5 +31,5 @@ SRC_URI_append_class-target = "\
 SRC_URI[md5sum] = "a3d18213beec454e3cdec9a3116d6b05"
 SRC_URI[sha256sum] = "627d5d8478e6d96fc8c90fed4851239079a561a6a8b9e48b0892f24e82d31d6c"
 
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
+UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
+UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.25.0


