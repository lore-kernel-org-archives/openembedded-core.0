Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A9C117E417
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 10:34:59 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so5228172wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1AB8JZSwBP/Pjd7oZW/pXdaeWfOs+2gKO/RMqjBMLQo=;
	b=KW4biKvR2zPddbDWv078IRGvg4e//4u6GK2BFfroup5wHljmgO14fsD1SkT9L8gyHY
	CweHsvFWct3O1XjR9UhL0H/EIBbrmyT/zFbrMCQRpBOjiFzgf6xfZZAknHNu8kO2AKV+
	3zrB5fvyxovmTxrl1/7ZFffV8ilYvY/hFYIAonN/2XNcHhDAnT68vCXI22fUYQmV602g
	1XU05qvDQvuOgxPM9Rw4gQkeAP1QbvXNjEvA129jMmPB101Zy4UNeTL1W1cZiCWJC9M1
	nOP1iScP5hJZOmT9bn6LQJ6sdRe4g1yhCsvRStgp4uSNf+JcYIsnUS0KrY2r4Ui3oE9+
	L0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1AB8JZSwBP/Pjd7oZW/pXdaeWfOs+2gKO/RMqjBMLQo=;
	b=I06IgRSbVzCoHM29jX00kBtmzYCXUILGTT+GDeO2Q2Gl1JhNga9j0G7yZZu8gsdNrc
	ZGRXorAHz3R09lRbvl8fQWfg26JnLWtZIn6PX3oktqS3ACGx/cNDDk05uf7y+b1WS6BO
	fWW1dsubW/p+xdbspYoSRGyX0kGC6ceYA49ccTCHa8bZ1+05+HQECqIyGsXTocGlI3Ge
	+tJ+zytG33Ti54eS/l0GETBak8f7imSu7+LWBHmtvfInsI+ZgJo3Ph2CBzLv+oZz+JNJ
	fQ6PTYmr1RcPgpZ2rhPA1CNW9Ax6DE+HjxBppjONtZptn7Oxkcwp5XtBAC/nq6/GNVfS
	TRCw==
X-Gm-Message-State: APjAAAUAFOkgxZ13J+m+GBNVb/igyhnjk9ny/VdmyzTI+dMW2DE/X4fQ
	yKI6gTwqSyYFX9wyRZ7z3FO4mlogfTI=
X-Google-Smtp-Source: APXvYqwjFClv+9EXkNiqY+mBidWPfik5WXkqwvstqhEJ7Vp+4AtBDKwB5cegR0geFxj87/QRMwL8Fg==
X-Received: by 2002:a7b:c40e:: with SMTP id k14mr10735201wmi.114.1558607700448;
	Thu, 23 May 2019 03:35:00 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o8sm22794075wrx.50.2019.05.23.03.34.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 03:34:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 12:34:55 +0200
Message-Id: <20190523103455.93827-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] chkconfig: do not use unstable github archive tarballs
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
X-List-Received-Date: Thu, 23 May 2019 10:35:00 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 2f1f6c02640..788a37b6ed0 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -18,14 +18,13 @@ PR = "r7"
 
 S = "${WORKDIR}/${BPN}-${BPN}-${PV}"
 
-UPSTREAM_CHECK_URI = "https://github.com/fedora-sysv/${BPN}/releases"
-
-SRC_URI = "https://github.com/fedora-sysv/chkconfig/archive/chkconfig-${PV}.tar.gz \
+SRC_URI = "git://github.com/fedora-sysv/chkconfig.git \
            file://replace_caddr_t.patch \
           "
 
-SRC_URI[md5sum] = "3f51ac38a234be5278b3a2d9705eda5e"
-SRC_URI[sha256sum] = "bf1e81f0d7cc999b536c9fe7877abf584a4082fd03c9d2597b6f090966579b40"
+SRCREV = "3e0b3909ff6328d232b27b9c32f1a9309c6cd0a4"
+
+S = "${WORKDIR}/git"
 
 inherit gettext
 
-- 
2.17.1


