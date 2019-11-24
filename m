Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7196A7FCDC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:11 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id f9so5604146plr.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rimGlRafE8ivv54QwgBig6t10ko57CXjagQgN53FVHo=;
	b=uhy5mD1JSF+xtqDeajDziQd1d7IaTuPaEI1hG+hzZnG469OQ7+d9YhgD13ts579Za+
	j77BqoSgwOAFqPvLs1872nR56tB456qVLZqlexRi8pkm5EfPvnbvrMBFyqrX4QDv2Cn3
	GpEnz6pIVIutorzruatUH2TXnys8Jbe0y+ndKWFXvlUDFvl4qLJf8Kfaw5gfoLWpMUyH
	0CF6D8WiGhzKp3IGu9rBuzP5pAuEpXMvbBmi7mHXnYBIYaxcU58+ZJjs6skbdPKEnFGP
	OOUQkImGS5/+s9dTZL0E8wvPfZ2NEKP2JiRgxjQsExLvbZn+wyEpvHFQMVaNvJoG++hv
	Qrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rimGlRafE8ivv54QwgBig6t10ko57CXjagQgN53FVHo=;
	b=cpLjpEP193DYXPgHOcsrd6X6BnJ2ZM8Of3jU1bkfveGh9RQomAcIwy4/J4A9toycnP
	/4bYuBJuu9pgUHyz9cdl37aP1vhvfQrSaHIEt6vELMgxmCs7u54gEt3VyFTIOt+bT9ty
	Kj1LQYZ7JpvVmHoCH0Mg2AsCXIQl3LasPBxV7iR3aHE9qorgCV6bUq0pJ9rvVoioyFl3
	kIjYXlfK/vuMt2DUXiMmbkyROgBudHW7+rybyrx9BkhM9YLD0afdKWlWOLvMqiDLQmzx
	2bzZx+HOKOyBth7ExUNUWSlSdxjFA4BRd7XbM78qPu2wusPyqdDd07Or9LUil0SHaCqt
	H1dg==
X-Gm-Message-State: APjAAAVbDQfJcOG2GA6GHqT3DCQCHOh/xv+geJiY2Hp1Ooe8740wmli6
	QIt4EBVkZhi8saVAjSDtyi3D67GK
X-Google-Smtp-Source: APXvYqxp3b4YacutW2+ws0nekR3r87XmJt28Ki7PfAoNupKhbjH46jn7w5tn7qXVLItx9hBm6Ob8sg==
X-Received: by 2002:a17:90b:d93:: with SMTP id
	bg19mr34250700pjb.81.1574639472387; 
	Sun, 24 Nov 2019 15:51:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:36 -0800
Message-Id: <78afae458bd025e0853308bece9953946b708862.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 31/35] sanity: Add check for tar older than 1.28
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:11 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Older versions break opkg-build when reproducible builds are enabled.
Rather than trying to be selective based on which features are enabled,
lets just make this a minimum version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sanity.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 705062b..9d0c784 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -523,6 +523,7 @@ def check_wsl(d):
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
 # but earlier versions do not; this needs to work properly for sstate
+# Version 1.28 is needed so opkg-build works correctly when reproducibile builds are enabled
 def check_tar_version(sanity_data):
     from distutils.version import LooseVersion
     import subprocess
@@ -532,7 +533,9 @@ def check_tar_version(sanity_data):
         return "Unable to execute tar --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[3]
     if LooseVersion(version) < LooseVersion("1.24"):
-        return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar.\n"
+        return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar (1.28+).\n"
+    if LooseVersion(version) < LooseVersion("1.28"):
+        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the projects buildtools-tarball from our last release).\n"
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later
-- 
2.7.4


