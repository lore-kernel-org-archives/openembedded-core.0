Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id BEDC97DEA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:11:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b18so8029113wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+dB1dlYscQjhsAYOuCVXPLo7IQpT07Qu3Lj0QblzC40=;
	b=O4+rAzztZsR7eNL3DV5lKQIuaJLWTbQ7rsNUH6Z1UM5hhh5TWr8EUwA/GKc4GQ9ODD
	80o/JKrgfes8goro2I+/gFGcxOcKCJm2BOqFsNFshb86qeFJqSFy141No3YyeyndkYs0
	iqy2lGHr940f+MaDQsHrEQ4wSlO2XjgoMP6oiU7sV6+gi6yH9C5u6mXJ2yAeeONsRhI6
	y28YhFlx+Pn88vFCLvzJus8c51m43m37uLRagDtYZN3rMcdiqprJozFEdT9EgUwNuSZ8
	dODFPaoaAhMIOJXKqbP+mu31PkgGdQV3Uovmzjn9OdA/yItsxvDC69kwJ8E63mdd28mt
	5UuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+dB1dlYscQjhsAYOuCVXPLo7IQpT07Qu3Lj0QblzC40=;
	b=ZDOvprx2IybjtGqsZTixYAegPaSKnKiJRcShto4dE45lkWJ4JKimsKhv3LWQl1XT2x
	tOyMP/xktekIBN/LakzoHK/rFt1zkzJ5lbS4zqnIURlZHk5pw3dBEIJHlQ7uAUhnEFG3
	i/aQ2n7B85CVAkNIF1Cd0z+mxyY7Z2fFf/a/bDXMudD2Y1BO2F623crCmryMePxxSeRe
	dce+61c8mcVkET3udSLCXyEBiZSOHcf1CaJOjjNIJw6llBjMRl13/Krq1yTW2hBq+Xw2
	DEQ8QmpirTWr4TNbvfuHxPLQE/fmkQ57I4K1rBcaBDvdI1MbAFbfYWOeRlneaJc+HXx2
	PLKA==
X-Gm-Message-State: APjAAAUNwkz9lT7NYX+Q22C5b9J5JrwMv1t6XYFqyYYzpwwQmDs/nl3W
	P1Vu93LXxHl9jYBezARFATF+5EBm
X-Google-Smtp-Source: APXvYqwsiugmcfzCh9iKfITmDONbyyMEx2yainGcBir9Yceb7j0/oJ86HOIm2EtnFHXF1R7wY6SakA==
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr17031863wrn.108.1558116719279;
	Fri, 17 May 2019 11:11:59 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.11.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:11:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:16 +0200
Message-Id: <20190517181151.44001-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/37] libmodulemd: upgrade 2.2.3 -> 2.4.0
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
X-List-Received-Date: Fri, 17 May 2019 18:11:59 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 40715c06ee2..d7f486868b8 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -7,14 +7,14 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
            file://0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch \
            "
 
-PV = "2.2.3"
-SRCREV = "4c75c6f8b39ee57aebe8fd36ef84808e893048c0"
+PV = "2.4.0"
+SRCREV = "d0a3eda45e083e8fe8b329a2310a53abdbf1e4d6"
 
 S = "${WORKDIR}/git"
 
 inherit meson gobject-introspection
 
-EXTRA_OEMESON = "-Ddeveloper_build=false -Dbuild_api_v1=true -Dbuild_api_v2=false"
+EXTRA_OEMESON = "-Ddeveloper_build=false -Dbuild_api_v1=true -Dbuild_api_v2=true"
 
 DEPENDS += "glib-2.0 libyaml glib-2.0-native"
 
-- 
2.17.1


