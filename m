Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3B62877205
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 19:55:33 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id ho8so69506046pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 11:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=J+IbUMADF5jp3VvCAfznhLeBVuH2slvJ7pW+Klv5pPk=;
	b=fuU4r1SOSshLyUoBgzvd9zr+onfi45ju8cbdnIQmKrijxEPJ0dIkJwyXZPFlBNduEh
	9xBS2JA2a903FHkgp17kPcoYMJVQ//uSLv0JXvkVPdSTHwRhWZN2uUbkAEbtXdXco9Pt
	DDarb2qXajvIusQ4HZzE9jeXrjpR546WT3g/QuI6IWpJnUeXt8/ADFneQ5HloYVkQtPr
	E8JhBe4nZFKnaxGHxoGLN2KVwNCWOqK1tjlFPyLRStPZadgQY33gOq19whCo1Guf2Guy
	q5XWfoAasHRhL9+3prQoKJnP2xO0mJdT8WzUkVWB6MZwXjJNcAY2QcvKqpVAbw+0S7xT
	NW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=J+IbUMADF5jp3VvCAfznhLeBVuH2slvJ7pW+Klv5pPk=;
	b=mqZ66IpKvb4WEcFa8dIfPUMC5gL+k2oeRCAcJN0jEQQ9p1sZx6fL7zUcc8FgmpzYuE
	B0f0GP8mGZXmRJxnkaOvqDpyEN4t4d1jxQlKmnXajofV9KRrgeFnBsd+BwP5KE1pihF8
	Jm/dVsFZBvY/FjtRPeBTYw9n0FbNjIrZbAq0iXjg2yiI6FL4rN/oz1z4THW5N0Z/mXNV
	1mdukkgYYbeFe96vFbsZB7qRvPjNJPz0I47SmEdHFhgBs1a33NROMe8s9RzWJaa4Bi+5
	SapH6Y6Yobui9tuUlNYqdcDGMTtqrVySehwvBKu5L+2k4y7RcfINh+sSCFLHfD4kvSeC
	vAkQ==
X-Gm-Message-State: AG10YOS0MsTt3KWAhejYh/VFXtLSYTSDUeVZdH5BiHiXMIa2UjpKUiEW3F8FRtzGlGfjgg==
X-Received: by 10.66.144.37 with SMTP id sj5mr31919814pab.69.1454270134773;
	Sun, 31 Jan 2016 11:55:34 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	u69sm37694390pfa.61.2016.01.31.11.55.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 11:55:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Sun, 31 Jan 2016 11:55:30 -0800
Message-Id: <1454270130-11287-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro] glibc-locale: fix QA warning
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
X-List-Received-Date: Sun, 31 Jan 2016 19:55:36 -0000

From: Armin Kuster <akuster@mvista.com>

WARNING: QA Issue: glibc-locale: /glibc-binary-localedata-sd-in/usr/lib/locale/sd_IN/LC_CTYPE is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

fix type
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index df6d073..2352bd0 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -87,7 +87,7 @@ do_install () {
 	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
 		cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
 	fi
-	chown root.root -R ${D}
+	chown root:root -R ${D}
 	cp -fpPR ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
 }
 
-- 
2.3.5


