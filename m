Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 314617FD03
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:24:01 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id m24so9517660wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YHM+b/0ceH+0nKvJ+SHNRj/CRSX7Zz2KWgzzVZXjyXk=;
	b=YUJ1ECu8WPxmaXgjsAznklb1eDpT2v7KE8KQT/HSDpz4voZhMuz8WNzQQ8Y0zaiTtW
	2F++gMzDf1vsLS3KGiMvD/MDWyFd57hhV/oqzbOAhbecIyMNPyOBuI35onMdlmeXtF1F
	bB3rQc0vSGKY0a1TbCstwudf3jnuO4djitfu109GfWFoZsEfNovU0o41P3+uyMVxDR+G
	YI4rrGQhc0+SFLb4JdP5hR2r0pFL4wBUQN4K3QtceMbkkSInFBwUQ/QydtGgSkkC9IpI
	NX06Pke4piD5Bh4dO/F61LC0ig22wGy9nSu6xXiembX2JSRKzPuR0A549PD/TFILBOYV
	n2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YHM+b/0ceH+0nKvJ+SHNRj/CRSX7Zz2KWgzzVZXjyXk=;
	b=rS9w1P2cl7//hciKZgUA0JxXkaLrkYYDJX+CLqHuaveQr0Zot7AP5/79QXfnUz2uld
	G+PH0kisNoEVIFBsn9WX7OJfkaAUAadrUzojFxny5Lmtlfyi3UMnUOI9aW46p5bZOymC
	JD9bwE+kLqVp/rFt1Pz9DLWnsq6uU9mzP1T4uvcHkEf02QkVJnHwY6xfcLCexWbs06D9
	INoURv6UgiE3Xex7zvD0tYAbT1dXOT2DFm7eNAqMa6RsZLjJ6Qwd559fTInLM8OXb1UF
	URxii6xzO7mgOrXHaQKI6X8mI6GDjldRiVYE6tApmd4djAUWi2FrAttMYQK8kMYjeR/M
	BfKQ==
X-Gm-Message-State: APjAAAUUoTIAbdXjqYhQNi4DyXsQJw5Vo0kVF8ZSqNOcQ6gnJgjUO7sm
	0rrZgHWPW54IlbHuIWvkWgF74HKMgu0=
X-Google-Smtp-Source: APXvYqz2lVA7B+qGRllq9AoeE3ssAoDFlTrQ0fCbPney/wFfzW2XvSNWcz7eTjbhaea9eihT+lpyPw==
X-Received: by 2002:a7b:cd0a:: with SMTP id f10mr18077686wmj.56.1576859041625; 
	Fri, 20 Dec 2019 08:24:01 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	w17sm10436356wrt.89.2019.12.20.08.24.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 08:24:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:23:47 +0100
Message-Id: <20191220162351.94498-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220162351.94498-1-alex.kanavin@gmail.com>
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/11] diffstat: update to 1.63
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
X-List-Received-Date: Fri, 20 Dec 2019 16:24:01 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...clocal.m4-add-missing-header-defines.patch | 24 +++++++++++++++++++
 .../{diffstat_1.62.bb => diffstat_1.63.bb}    |  7 +++---
 2 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/diffstat/diffstat/0001-aclocal.m4-add-missing-header-defines.patch
 rename meta/recipes-devtools/diffstat/{diffstat_1.62.bb => diffstat_1.63.bb} (77%)

diff --git a/meta/recipes-devtools/diffstat/diffstat/0001-aclocal.m4-add-missing-header-defines.patch b/meta/recipes-devtools/diffstat/diffstat/0001-aclocal.m4-add-missing-header-defines.patch
new file mode 100644
index 00000000000..5bd94d7de4a
--- /dev/null
+++ b/meta/recipes-devtools/diffstat/diffstat/0001-aclocal.m4-add-missing-header-defines.patch
@@ -0,0 +1,24 @@
+From 004bd80d2523f538467b5ada2623eb207b55dad7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Dec 2019 15:44:28 +0100
+Subject: [PATCH] aclocal.m4: add missing header defines
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ aclocal.m4 | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 3b19e82..c0c4acb 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -1927,3 +1927,8 @@ make an error
+ fi
+ fi # cf_cv_posix_visible
+ ])
++
++AC_DEFINE([HAVE_TCGETATTR], [], [Description])
++AC_DEFINE([HAVE_TCSETATTR], [], [Description])
++AC_DEFINE([HAVE_TERMIOS_H], [], [Description])
++
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.62.bb b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
similarity index 77%
rename from meta/recipes-devtools/diffstat/diffstat_1.62.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.63.bb
index 93d77797c95..ee0a7e7bd63 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.62.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
@@ -10,10 +10,11 @@ LIC_FILES_CHKSUM = "file://install-sh;endline=42;md5=b3549726c1022bee09c174c72a0
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
            file://avoid-check-user-break-cc.patch \
-"
+           file://0001-aclocal.m4-add-missing-header-defines.patch \
+           "
 
-SRC_URI[md5sum] = "91e106bb34cb097750db7ddc0ba1d8fc"
-SRC_URI[sha256sum] = "7f09183644ed77a156b15346bbad4e89c93543e140add9dab18747e30522591f"
+SRC_URI[md5sum] = "b9272ec8af6257103261ec3622692991"
+SRC_URI[sha256sum] = "7eddd53401b99b90bac3f7ebf23dd583d7d99c6106e67a4f1161b7a20110dc6f"
 
 S = "${WORKDIR}/diffstat-${PV}"
 
-- 
2.17.1


