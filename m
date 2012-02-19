Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RzCpb-0008Gi-Mp
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Feb 2012 20:53:59 +0100
Received: by eaal10 with SMTP id l10so1673066eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2012 11:45:42 -0800 (PST)
Received-SPF: pass (google.com: domain of andrei@gherzan.ro designates
	10.213.13.13 as permitted sender) client-ip=10.213.13.13; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrei@gherzan.ro
	designates 10.213.13.13 as permitted sender)
	smtp.mail=andrei@gherzan.ro
Received: from mr.google.com ([10.213.13.13])
	by 10.213.13.13 with SMTP id z13mr1634116ebz.146.1329680742800
	(num_hops = 1); Sun, 19 Feb 2012 11:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=mpvlxEdMznukWMLzjPCApXRAVNPHOXKo0VdLlowuka0=;
	b=TTWsfoG0NQAYOWAdiTfwYvKesB/zzAPfYI8p3b636gm9OQUylPrzXRgzYGM7lgodOe
	PmsnuAYY/yo6T+u+Sq8gP4uTFr3O8wWNcvl0xJUPUGI0CmnUE9G4ninIiwVtUmdoGDYB
	8S/r/phTEWdxuAnN1UnQ+HYWZD+e+orHgMA+Q=
MIME-Version: 1.0
Received: by 10.213.13.13 with SMTP id z13mr1292928ebz.146.1329680741766;
	Sun, 19 Feb 2012 11:45:41 -0800 (PST)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id o49sm68495820eeb.7.2012.02.19.11.45.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Feb 2012 11:45:41 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Feb 2012 21:45:34 +0200
Message-Id: <1329680734-10777-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQmOMti+QXYMp4KrddzKdEQm7ECXBUsIyzJv8Y7U9LvqURdjeNqQusirfdlcPXANXl6L64oE
Subject: [PATCH] e2fsprogs: e2initrd_helper was moved in libdir but not packaged correctly in FILES_libext2fs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Feb 2012 19:53:59 -0000

The new install path of e2initrd_helper is %{libdir}. FILES_libext2fs modified accordigly to
avoid QA warnings.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
index 2289211..793393e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
@@ -1,6 +1,6 @@
 require e2fsprogs.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://fallocate.patch \
             file://acinclude.m4"
@@ -54,7 +54,7 @@ FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
 FILES_libcomerr = "${base_libdir}/libcom_err.so.*"
 FILES_libss = "${base_libdir}/libss.so.*"
 FILES_libe2p = "${base_libdir}/libe2p.so.*"
-FILES_libext2fs = "${base_libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
+FILES_libext2fs = "${libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
 FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so"
 
 BBCLASSEXTEND = "native"
-- 
1.7.5.4



