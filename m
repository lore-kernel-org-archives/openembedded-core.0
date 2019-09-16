Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6407EF4D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 19:24:34 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id x10so550629pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 12:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IJMo9/NMoC4l1xE8JbEcgWPyosi+hGi+e5QnZ9+Fj0A=;
	b=p+ngYo2ZO2PPzhpRBfBTvxZw89rtzrhjXtdMqSJ3GdICAmlrp6/4kRDf8wyLlQw4c0
	IrTJvzZ7dNb9mIDk4YIZsrhfFPwnRXil+zAXGUSwDXSXTqWfFONceBi/NM2G2q06GXgJ
	BKxVhEmrBCVos9ULt7OIMA1ybZbsnJl+MzaggCs16ju3pkF0Mahbvq/60NJD6I78FfOz
	XSehHITOOrQn/JYQn7XrRl0tgBxDB181A2n57GW+t9mbWdAfcOzAjcn2QBZOpC9kXGdV
	qyj61tEXicyZgRfkXM0x5NeQLOYl2BtZj2iutVA+9J0vDXlXFKc9ympxlv7t+JY3Z5Kz
	9VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IJMo9/NMoC4l1xE8JbEcgWPyosi+hGi+e5QnZ9+Fj0A=;
	b=kuun3tfjMSh8nUzwgKt2yfgpHMaLm9Fdypx1j1xR3Nf8qgfli8hta/13pCsAZtgY3G
	IYFygfsaIZuiNKYHtlUTSqlE4otV8cxFuQ9uVNzwIHIaid4D/FhlW0s4AhHx/Yf2sIJE
	7tprnPdFTFzB/td6811P69EjA296P8Prk2KR6MF8TzAfU38fiTrKPnqquMslZ451TT86
	fgV1DpZlUOpwPaXZ9T1yZs12MFkqn4BMH2B0zRe/4XA3k7weEcywsZ0eaECHXy8pkrtV
	BWzGj8yWDfAULeyALfEo8fMePVkyryoa1ed6Wm/lUUtFwFAbNxoUAkONkNjnzUILSVnj
	epjg==
X-Gm-Message-State: APjAAAUJ/lQBjV3I84Ir6Mio3CDzy42ePDJKxznWvNIb8Oq4SFCYkDP2
	PAgst7GTqhz6PXzAew4lxTAz8NE4
X-Google-Smtp-Source: APXvYqxagbPz2LB5Rd3To/l5GETSiKZ0fy752TJRdjTEOBSXyQsS7gApIY2wm5San4WapKU4RXu1hg==
X-Received: by 2002:aa7:8e08:: with SMTP id c8mr1002349pfr.238.1568661875012; 
	Mon, 16 Sep 2019 12:24:35 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id d7sm5490494pfr.7.2019.09.16.12.24.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Sep 2019 12:24:34 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 12:24:22 -0700
Message-Id: <20190916192429.27294-1-armccurdy@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/8] base-files: drop legacy empty file /etc/default/usbd
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
X-List-Received-Date: Mon, 16 Sep 2019 19:24:34 -0000
Content-Transfer-Encoding: 8bit

Doesn't seem to be referenced by anything in oe-core any more.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/base-files/base-files/usbd      | 0
 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 --
 2 files changed, 2 deletions(-)
 delete mode 100644 meta/recipes-core/base-files/base-files/usbd

diff --git a/meta/recipes-core/base-files/base-files/usbd b/meta/recipes-core/base-files/base-files/usbd
deleted file mode 100644
index e69de29bb2..0000000000
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 2b1f217ddb..94299431f6 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -20,7 +20,6 @@ SRC_URI = "file://rotation \
            file://fstab \
            file://issue.net \
            file://issue \
-           file://usbd \
            file://share/dot.bashrc \
            file://share/dot.profile \
            file://licenses/GPL-2 \
@@ -122,7 +121,6 @@ do_install () {
 	fi
 
 	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
-	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
 	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
 	sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}${sysconfdir}/profile
         sed -i 's#@BINDIR@#${bindir}#g' ${D}${sysconfdir}/profile
-- 
2.23.0


