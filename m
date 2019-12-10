Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E86F57FC8E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 12:08:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g206so2915597wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 04:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dWHwpisufCrkMqQwZAh4mT/O/VCIFdYV2G1n/WMr85c=;
	b=clQmlHAxJXtkVM2977bLjJP6y4PTANN3FPVDHhN8VIA09kJFtY9MLXx1z56l6iGZiM
	D7HgNuj8fdJXZC753cgzEzT1TIts9dTZ1cNdmbv3Oj+ThnhK6UaTVJJx84bE+CMixsvy
	oyM0eCQJr0N3YXltdznVWuF0c3M9OB9QKMroBpC5aodOEt5j+z4soJUyIqOoh8LkEUZP
	mi48dqYMoz3rziQJz4omGWfyTRky4Nu1ihN6PMUtZKSS9iryD+bp+TYvYTQSIxAz3ouY
	xKJFYM9IAjS6iiN0/qnfronS2840Ogny+pV0G7MQx8iviXcI19l8/IowC265Bp5cOCTL
	zpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dWHwpisufCrkMqQwZAh4mT/O/VCIFdYV2G1n/WMr85c=;
	b=MHlOwZejLaM98zOjTA907KC+sFolWaAm21BnBVHG/j1fzSTLhM6VbfFC+mS0O1FJqz
	3qDnFYoD3uriPuR59l1xFxxQ3V+wb1apva9FZmfUO6+71vd0saxVw+8V7yctJ/76X025
	ULL9sHrZPfR52K6Z+NHBj7+yur9X0IYu5NAgC1UKBTPRc0Ks5HNBuEaLCtnt8t+uuo8G
	DxH8hOGpg98nvDNKsTN23WhqK/SYUherAO3ITbOfYGLsgizT5ogCxYXaWD8D2piC/Hp6
	Gnw4FnYYivvgUnxLIqnvIMmBLwcnZOLOuChQOZc+gJLhTi384tZ6Nf4J8m/qyxeLz2Kj
	HzoA==
X-Gm-Message-State: APjAAAVNUIkeD/JwNcx/aNH4URvTTUFnZV6JziPdczaXOmbyzUPevOQZ
	GytAs4gWnuCsEmpxD5xsgTBNLVMB
X-Google-Smtp-Source: APXvYqyQrD7+EAsuiqNszXwVU7XReAHSrg21Zfda8N10KbGetAkbxAGAKR+W3k3KFLjEN27xibWOqA==
X-Received: by 2002:a1c:5f06:: with SMTP id t6mr4959299wmb.32.1575979713450;
	Tue, 10 Dec 2019 04:08:33 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	i81sm2869215wma.10.2019.12.10.04.08.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 04:08:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2019 13:08:31 +0100
Message-Id: <20191210120831.14919-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sed: add PACKAGECONFIG for selinux
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
X-List-Received-Date: Tue, 10 Dec 2019 12:08:33 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/sed/sed_4.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/sed/sed_4.7.bb b/meta/recipes-extended/sed/sed_4.7.bb
index 312f07f047..a285941dc4 100644
--- a/meta/recipes-extended/sed/sed_4.7.bb
+++ b/meta/recipes-extended/sed/sed_4.7.bb
@@ -13,6 +13,9 @@ SRC_URI[md5sum] = "777ddfd9d71dd06711fe91f0925e1573"
 SRC_URI[sha256sum] = "2885768cd0a29ff8d58a6280a270ff161f6a3deb5690b2be6c49f46d4c67bd6a"
 
 inherit autotools texinfo update-alternatives gettext ptest
+
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+
 RDEPENDS_${PN}-ptest += "make gawk perl perl-module-filehandle perl-module-file-compare perl-module-file-find perl-module-file-temp perl-module-file-stat"
 RRECOMMENDS_${PN}-ptest_append_libc-glibc = " locale-base-ru-ru locale-base-en-us locale-base-el-gr.iso-8859-7"
 
-- 
2.20.1


