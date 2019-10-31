Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3CAFA7F8CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:57:48 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t26so1326694wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bVpWeDgEkLa3/Us18HpSujFRq/0/5WjnMixUXEfCnjU=;
	b=OZ5E0koTcNiArMX3Ei8Qx4u5ae68KYwd+7gckh6YCPiWSwSwDv/x+RDjt/3sdHKDr7
	cX5YA2uPBbHzsMOFuQYvIxk/VZMSmeSZ61mgFM+bZH7PThgESZPpq059wogQfLgpzlG1
	2ETRk82B3jpcFKkj0jjLqfOC3C38KUNUL99nMSGDnoZEL+n8nLE56RE22hEYuvqYx4lI
	27pILXzQS8xg8G8PoKHth+6snO8YyZTjxXgXS46V0Q3O9jDoLsEOYXI17QwmWYwY9gG/
	PZwUpUuPWb8dN4meXOAsz0jKMFPcNuilR0MhDO5MtYNxN7K8IMU3C4gakq/EqsS090vP
	0LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bVpWeDgEkLa3/Us18HpSujFRq/0/5WjnMixUXEfCnjU=;
	b=YSae2kufnaOKaEMXgeRCOUzN7ksdc4NaCkiwylOzLxbbIPnR9VrARpX+dHWJKSh2F0
	+/5fL0Axr5CTHdAkf2XGvRbioTaKLN+8jNTDLwUTQqv1Ff9DvmbDmgw93D0FHgr5+TZr
	QJbZpFsFak3Wt/HmzxPWxoj/J2l7guD58HfU/ZJ5aAbhRWTjNel9qyB0P43+4Zm5N9+e
	yb9497/uU5fPqIkDNTEe7BUBpkSUWv6K+e5vzJpqpdH5oZLEnETy6RyVGIhMM6s17ebL
	OELrFeQl/YzYU2MEDmTRROlN3oTq5ofXPEwmi3JAAA6oLm6KqWgMqlW1R6WOx6Sq0YkS
	CVEQ==
X-Gm-Message-State: APjAAAX34+Hj0vc2oSycwiRDLWgGustBBjOfeRKWqkKXdV3HssIehnbn
	9RlZDgAmDrKnekY/ivrOfkM9mviC5JY=
X-Google-Smtp-Source: APXvYqyAaPZC0tEYrY55A38uS6lFFQKN0ZN2VyTySlQ7PbmaXw6UiTfVIUvbVNLbQ6RA8LHtrQk8cg==
X-Received: by 2002:a7b:cc01:: with SMTP id f1mr4800252wmh.113.1572519468823; 
	Thu, 31 Oct 2019 03:57:48 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f13sm3192113wrq.96.2019.10.31.03.57.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 03:57:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:57:35 +0000
Message-Id: <20191031105735.8141-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031105735.8141-1-ross.burton@intel.com>
References: <20191031105735.8141-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] git: cleanup man install
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
X-List-Received-Date: Thu, 31 Oct 2019 10:57:48 -0000
Content-Transfer-Encoding: 8bit

Prettify by using shell loops.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/git/git.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 67fc96b7aff..95ab397f6af 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -39,12 +39,12 @@ do_compile_prepend () {
 do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
 		template_dir=${datadir}/git-core/templates
-	install -d ${D}/${mandir}/man1
-	install -d ${D}/${mandir}/man5
-	install -d ${D}/${mandir}/man7
-	install -t ${D}/${mandir}/man1 ${WORKDIR}/man1/*
-	install -t ${D}/${mandir}/man5 ${WORKDIR}/man5/*
-	install -t ${D}/${mandir}/man7 ${WORKDIR}/man7/*
+
+	for section in man1 man5 man7; do
+		install -d ${D}/${mandir}/$section
+		install -t ${D}/${mandir}/$section ${WORKDIR}/$section/*
+	done
+
 	install -d ${D}/${datadir}/bash-completion/completions/
 	install -m 644 ${S}/contrib/completion/git-completion.bash ${D}/${datadir}/bash-completion/completions/git
 }
-- 
2.20.1


