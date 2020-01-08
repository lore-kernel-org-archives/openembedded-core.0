Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id AA2427FED6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:34 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id c14so3367762wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XaCQndSV/aj44NAW6+xQuhaVgVKPgS8z4PTUA8cpAjg=;
	b=SCQY970x+RBUN6d3GBauKIG1HQhHjbImFbVYahQ9r2+WEWzzszcbo+/OCWz6rBfi3e
	Rkax1Vz7u8EFef8KSs0EWBGM2ueygqdg7bMi5SdAyJ2n1ieKl/tCgQUmi9fByDEGTpHY
	n5WPDszTtWBxInkJUY2ZaVPkIQQhLJSi3g3HM+0HugE+0u4ov1XdPnErlS+/oAv/Nsqw
	NxQBiZXI80CYVjP5vgUIm0dETzaWZMKmDYf9fQoV1CA0R2wmOjMIiVpM+8qe6UDkjJuN
	kNne71ZOzxhn6tYFG1aZuUlwjYJPQqOGk07uG4Fppe5iTrgChR47Gpfqk/wPg2tYmNWh
	2FSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XaCQndSV/aj44NAW6+xQuhaVgVKPgS8z4PTUA8cpAjg=;
	b=P9bUzGOnZLNk6x6tz1MkxzqxG06WUIwuw5ofeLd8BoGwLdnNOZMIMD7f0NK2jzcbCC
	EGIW5NDjOno/Jt3S+NGOf9O5KHOv+SrqZ/36rCvYihccqqGZhiw9qDVNPt5T6tqyY7bt
	mj8t5UDUF90A9x1qduWdaVAHFWgVBXfNaFjJbA7KtLGIC8ZMfHtJPRpl5uEbOrlszZ0T
	aQNwZBHy7z/sBL/7/1YXhlOiMoCiZ6Y4ceIEH7FGQOQg3aFdUiaQrkqb1CBq3Z2311Uk
	E320W8i6syhTgr6c6pdqILbfDqLCYJiSxmSqo3lwyoOuYyEyD8NxP/49bo3a2ri16tEt
	3BKA==
X-Gm-Message-State: APjAAAXM5M4/Dl2gfUGEvdJNR9rLpVV2qtARU2AGAmb50dS+HB9pmymC
	6k9h7pG7L22uB7X1J0c189SvLsvpBs4=
X-Google-Smtp-Source: APXvYqyYQt0/2SXW9zXl8F6Ykph6BU5rD9WP5bHnDR6jAdUNp+YUCivy9yuyWrA8wL9NvabcH5Zdrg==
X-Received: by 2002:a05:6000:1288:: with SMTP id
	f8mr4634795wrx.66.1578490115229; 
	Wed, 08 Jan 2020 05:28:35 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:59 +0100
Message-Id: <20200108132759.95603-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 28/28] libmodule-build-perl: fix ptests
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:35 -0000

Particularly remove a broken detection of skipped tests
(which was marking tests that actually passed), and install
additional artefacts needed for testing.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/perl/libmodule-build-perl/run-ptest | 2 --
 meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl/run-ptest b/meta/recipes-devtools/perl/libmodule-build-perl/run-ptest
index 0d63d1513bc..d802781f9e6 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl/run-ptest
+++ b/meta/recipes-devtools/perl/libmodule-build-perl/run-ptest
@@ -6,8 +6,6 @@ for case in `find t -type f -name '*.t'`; do
     cat $case.output
     if [ $ret -ne 0 ]; then
         echo "FAIL: ${case%.t}"
-    elif grep -i 'SKIP' $case.output; then
-        echo "SKIP: ${case%.t}"
     else
         echo "PASS: ${case%.t}"
     fi
diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
index f759f862fb2..e3ba40d96c5 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
@@ -36,7 +36,10 @@ do_patch[postfuncs] += "do_patch_module_build"
 do_install_ptest() {
 	cp -r ${B}/inc ${D}${PTEST_PATH}
 	cp -r ${B}/blib ${D}${PTEST_PATH}
+	cp -r ${B}/_build ${D}${PTEST_PATH}
+	cp -r ${B}/lib ${D}${PTEST_PATH}
 	chown -R root:root ${D}${PTEST_PATH}
+	sed -i -e "s,'perl' => .*,'perl' => '/usr/bin/perl'\,,g" ${D}${PTEST_PATH}/_build/build_params
 }
 
 RDEPENDS_${PN} += " \
-- 
2.17.1


