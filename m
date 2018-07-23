Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6290775035
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 17:01:13 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id h3-v6so1802273wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 10:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=pYZE4/NZqJiMSqgwGfAPjfUNHu53ZZNoAHIOktily54=;
	b=jV0tHohKESjFO9N3ycIKayhptzo+IgDBszjQgm72StEdI/w1NUO3YhuY7zzVNxt065
	vA85vCvOc4Sop3tFFaqtfYHdDMnHwQcDz57Hwr76yo9KO2Z6l7bgRZVFkpkOVlJA7Ufx
	QbXD7tvBCDi8PReE7VuJbpUzpwCHN+QclCcLR+v47/5vzXd3RvxWQvhcawosOgfgMuNK
	R681xL2xq2nMVnz5oue+spX5fKrTmZfHFXng9v+zqT2h2SRYFt3+JT/MAEbJuU3BvbNB
	YVO6EUztk9VtRfayjECTaYblIJbXkFsXQt0kOERwhJH/WRhX5j3+vhPwcgYASNU5QbTf
	Q+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pYZE4/NZqJiMSqgwGfAPjfUNHu53ZZNoAHIOktily54=;
	b=raafwxjmyhU+ECFxF399lWP5yfHes787LwKREvgBTLX+7dsff27sXqUk81DLQ4u3Ye
	mL+q7zuhGseALx5yoTEl79rFt8TNiY/RQLZOTWWcPGq1HXpR6CQu6diXuQrjYcPtH6Eu
	aXCkWAcFb5s7Y8sOeZhy0qkSam+dRCkwIvClNJOGpl35S2TYlGnmUJTI7l3HeXAUNBaD
	78FU63DDSR+WgjrjhPDhbc+qnFM9iuKk67YJBOBY2FCoXMc9hWoavN4vPDv7eg7uZNQh
	vMDXuZEjy7fsiE6zS4OYIkmpfCtiafhMxmG0bZJWGOjvMYUC9y7kRoDMou0Xl74dgJx/
	05eA==
X-Gm-Message-State: AOUpUlG7dOK0JLypJCEl+uXds0vEJ4vjYvakChufXNKBgQYW8GmNXgHI
	xqFUKcRLNAxOy4dEzctAgGiIG1Av2pc=
X-Google-Smtp-Source: AAOMgpe8KA5xyeVU/uluwMYjK9HCL0J3Tj7VSSQkacGT4sLtEirE/Kdpca7hbqh/KEpl4oV/JlLesw==
X-Received: by 2002:a1c:15ce:: with SMTP id
	197-v6mr7470608wmv.99.1532365273834; 
	Mon, 23 Jul 2018 10:01:13 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w142-v6sm16516388wme.13.2018.07.23.10.01.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 10:01:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 18:01:11 +0100
Message-Id: <20180723170111.22412-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] packagegroup-core-full-cmdline: clean up system-services dependencies
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
X-List-Received-Date: Mon, 23 Jul 2018 17:01:13 -0000

The 'system services' packagegroup depends on a number of packages which are not
system services, so remove them from the list.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../packagegroups/packagegroup-core-full-cmdline.bb               | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index 1b938fb849c..e8616880248 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -133,16 +133,8 @@ RDEPENDS_packagegroup-core-full-cmdline-multiuser = "\
 
 RDEPENDS_packagegroup-core-full-cmdline-sys-services = "\
     at \
-    bzip2 \
     cronie \
-    dbus \
-    elfutils \
-    gzip \
-    less \
     logrotate \
     nfs-utils \
-    pciutils \
     rpcbind \
-    tcp-wrappers \
-    tzdata \
     "
-- 
2.11.0


