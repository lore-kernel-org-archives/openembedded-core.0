Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3137878866
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 21:23:09 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id a27so19220604qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 13:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2zBvlV+mFSijU24Ca8h33pZD09/VK6RKLenYq4ayLCE=;
	b=knkOfUAvdD1FFXltHWzKOEiRWdN/O7t9AzYEX/51kmiG7NKHncsw6GR6v2+pxVA5JN
	Oe/ctmVw+O54B6wwVWmFVOSTEEpi8njE5gEMSX4MQXE2IiAnIdBKyTPlPeL6JUCSg41/
	zsTlExbipUbDDVkKoPrYpajtDZPDRHTndToYgca7RW64wOB15Ed0aieMBFrqw1UoyCwd
	vr/ba+EU5cYVA2Ywkw5HBNrnj4h1gdv6pOpBSuNz1weuoImhIerWNaAfMtr1l+ZXit53
	lJ/aRBOeMkDnmOAUogn6r8Bmvp+h3FapCksvFJ3Tkncjx0fwiEI/xtyj0YiA1knmYvUO
	OofQ==
X-Gm-Message-State: AKwxytdav1hebE1yZiiDz2JCnKFzz4OB40tOEFDJWUEL+8Cca0PgpPsd
	w0kTWK67jRdv2Z5rt1XTSXaSJoZp
X-Google-Smtp-Source: AH8x226kD+ksmyo38lKdePMk7hxizHB9KrNw2W3uI4rZA1PMDmn30iIue3TG5DGpy5N/TH40sSi0jQ==
X-Received: by 10.237.50.197 with SMTP id z63mr48165488qtd.212.1517347390683; 
	Tue, 30 Jan 2018 13:23:10 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id l79sm167503qkh.1.2018.01.30.13.23.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jan 2018 13:23:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jan 2018 16:22:56 -0500
Message-Id: <1517347376-21882-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-pycairo: update to 1.15.6
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
X-List-Received-Date: Tue, 30 Jan 2018 21:23:10 -0000

Update to the latest stable release

Tested in qemux86-64 running core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pycairo_1.15.4.bb => python3-pycairo_1.15.6.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.15.4.bb => python3-pycairo_1.15.6.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.15.4.bb b/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pycairo_1.15.4.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
index a6c9e5a..5c3e1e6 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.15.4.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
@@ -13,8 +13,8 @@ DEPENDS = "cairo"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "89f04740078fb5f4e4dd92a0c4d3b537"
-SRC_URI[sha256sum] = "ee4c3068c048230e5ce74bb8994a024711129bde1af1d76e3276c7acd81c4357"
+SRC_URI[md5sum] = "3ff210c34e7b052590e15fd0fb147766"
+SRC_URI[sha256sum] = "ad150ea637860836b66705e0513b8e59494538f0b80497ad3462051368755016"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.7.4


