Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id ADFB461A3F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 16:16:04 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q9so6704098wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 08:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IFGdGBvtGLkn0ZSvLwvZfSs0e0iZzbm7MWcjd4JSpxs=;
	b=EM1MJaX2hv//jHGKkSnk0jT8YvouO7cGvbIRYvv81qM6MP3V8BosdWE1CV/GCD77B/
	rWtkofWVLOnMO9/M8RwN8sRunVbmXLK3C6FxVrQG8vRy+UOdQ83EUJqXItwPHcn+vwpq
	1optrp/io/6zo0jtfjBL+Xwl6hsQ0e9N7CVXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IFGdGBvtGLkn0ZSvLwvZfSs0e0iZzbm7MWcjd4JSpxs=;
	b=GGY3Z2AUk5y8BTNbfs0jU/wVARn+0q98kRkzMuzATLdeDDjldpBC59SdyMAyVVX3X4
	kX7u6a17r9NN6kI2hqenQkTcveGeVm+cuo39us3bi7dFEqkMuLrtRdrr1ANqcvjpg9tD
	g8K+F/C0qH1LXaheWFCTuPL6/z+Hn6XbBH0IFgxaiS6u/dc7MEpKwDdN12s0/C0CbuD2
	+yq8ZrwzwWXxik614AQ5EvKiW+Vl2kSJPJj/ExeF1dD8KC/ymrOlRx0kUxEr8rMCzhmr
	CVFIMmcLQuIZC1vAOEoEZXEXBIeBhaSa6EUpgMZxtn9VJAtZo0gd9B7nDc7XDz9s+Kae
	TIDg==
X-Gm-Message-State: APjAAAUBcM9MnEgDlsnknqJP0HGosb7YBoqS9beyKe5QSyKuuNYd5lXn
	B889YKrW0r0HZ+sMsKzF736RDq8dDr0=
X-Google-Smtp-Source: APXvYqwO8lhb8MzEexgtYcv/f4F1ZDv50pGtSfomZ9OkJeFyMomlsLzzXtgeeukAPZVzVVzM4Ev3Yw==
X-Received: by 2002:a1c:2b81:: with SMTP id r123mr2718507wmr.33.1582992964730; 
	Sat, 29 Feb 2020 08:16:04 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z14sm14656244wrg.76.2020.02.29.08.16.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 08:16:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 16:16:03 +0000
Message-Id: <20200229161603.495994-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] python3-scons: Fix license file collision
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
X-List-Received-Date: Sat, 29 Feb 2020 16:16:05 -0000
Content-Transfer-Encoding: 8bit

Downloading a file called "LICENSE" into DL_DIR is 'problematic' and collides with the
file from other versions of the recipe at best.

Rename it to something more specific to avoid collision problems.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-scons_3.1.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-scons_3.1.2.bb b/meta/recipes-devtools/python/python3-scons_3.1.2.bb
index aa7a2a8300d..ce117a92d4f 100644
--- a/meta/recipes-devtools/python/python3-scons_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-scons_3.1.2.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Software Construction tool (make/autotools replacement)"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=e14e1b33428df24a40a782ae142785d0"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-python3-scons-${PV};md5=e14e1b33428df24a40a782ae142785d0"
 
 # pypi package does not have a valid license file
-SRC_URI += "https://raw.githubusercontent.com/SCons/scons/${PV}/LICENSE;name=license"
+SRC_URI += "https://raw.githubusercontent.com/SCons/scons/${PV}/LICENSE;downloadfilename=LICENSE-python3-scons-${PV};name=license"
 
 SRC_URI[md5sum] = "f9c4ad06dcf1427be95472eaf380c81a"
 SRC_URI[sha256sum] = "8aaa483c303efeb678e6f7c776c8444a482f8ddc3ad891f8b6cdd35264da9a1f"
-- 
2.25.0


