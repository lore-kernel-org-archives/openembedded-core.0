Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6AAD07FC39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:12 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id k20so1134406pll.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tq5lGH/mq4qFGH4CHjk6pKTXSTRUUOAVPkoCtVxXiEo=;
	b=mpMRCWWWVFhKbLQE1GhTRu6ZaLaRlxMVDIBFqjN22AhPzCjHdRGcgrdsrSN9FB0IW+
	Dt1xgrTnqexZae47SkA7AlD4oB3uDh1UQ4KtcXRwGSdGMfS4Nz5DEj7KJJxRDOw6X1Jj
	GueMqKKcQANJHWLD5ijCQ/Cpkwg9h3QP2mJOKanN9GiK9RP5tSJClCcVfdpwS4I7jFh3
	Fdo04mdkWhbYKmp474+St1Csx620zslFdcy74IWS0YbACw9Hg991YNRZj1ouVJmoyUuu
	GQp5zv+sMCAp/yywW99ocJ3ftN0QvG4TrqOqv3zWJQFw1kZblLrW/4RVmNf/m/a1Ghvs
	AEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tq5lGH/mq4qFGH4CHjk6pKTXSTRUUOAVPkoCtVxXiEo=;
	b=l2m2hr7DVBtxf8RY21Eeor7YWn+wRosljnX5e0TdsqQJckL/3REfQKBnrCimI0cbTv
	AWQTFWLCT1lBy7bw/InMtKITyRoNTLHVPkaS8szF86PqDTnosslFFkRY9aZFi/3e7Spl
	ryccD44vGnuihB1FuyVmldG99vME8nTgm0VDsuIvemW2dDIinYn4lTIlv9K4FBI1ySzb
	+IDMbbVj+6atKxvabPu7bvUwTXbi3op7kbEO3fJY8lGlHD9b4e/Eu2Lir0vDFrSuP0Lw
	ka17OBPMB+QPJp702hZP9+ykjke0uEoV9m9iuPmqpC/LolX321Pup3GZW2P+wnSe5CQa
	Qj+A==
X-Gm-Message-State: APjAAAXp4JINcrkSexqOmLJVfMapXx+epVSGxa/8q1nrpHZ8j2Gx5WC2
	F61Mcnh/m2ioJCiHtiEUuBjz/eS7
X-Google-Smtp-Source: APXvYqyRSW8bP/ROg/p4xK9c6CLo8ZbldCZcpKR3KQnXbFGH6DTNsLGBZYZMoA244epRF6Oaz9oGMQ==
X-Received: by 2002:a17:90a:5a84:: with SMTP id
	n4mr35293063pji.72.1574639473361; 
	Sun, 24 Nov 2019 15:51:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:37 -0800
Message-Id: <1d8512f550de8a77b0125d62f4c788062c92f20e.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 32/35] oeqa/selftest/sstatetests: Ensure we don't use hashequiv for sstatesigs tests
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:12 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 2867cb7..6757a0e 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -255,6 +255,7 @@ BUILD_ARCH = "x86_64"
 BUILD_OS = "linux"
 SDKMACHINE = "x86_64"
 PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         bitbake("core-image-sato -S none")
@@ -266,6 +267,7 @@ BUILD_ARCH = "i686"
 BUILD_OS = "linux"
 SDKMACHINE = "i686"
 PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         bitbake("core-image-sato -S none")
@@ -298,6 +300,7 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
 TCLIBCAPPEND = \"\"
 NATIVELSBSTRING = \"DistroA\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         bitbake("core-image-sato -S none")
@@ -305,6 +308,7 @@ NATIVELSBSTRING = \"DistroA\"
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 TCLIBCAPPEND = \"\"
 NATIVELSBSTRING = \"DistroB\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         bitbake("core-image-sato -S none")
@@ -332,11 +336,13 @@ NATIVELSBSTRING = \"DistroB\"
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
 TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86-64\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         configB = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 TCLIBCAPPEND = \"\"
 MACHINE = \"qemuarm\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         self.sstate_allarch_samesigs(configA, configB)
 
@@ -352,6 +358,7 @@ MACHINE = \"qemux86-64\"
 require conf/multilib.conf
 MULTILIBS = \"multilib:lib32\"
 DEFAULTTUNE_virtclass-multilib-lib32 = \"x86\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         configB = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
@@ -359,6 +366,7 @@ TCLIBCAPPEND = \"\"
 MACHINE = \"qemuarm\"
 require conf/multilib.conf
 MULTILIBS = \"\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         self.sstate_allarch_samesigs(configA, configB)
 
@@ -404,6 +412,7 @@ MACHINE = \"qemux86\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         bitbake("world meta-toolchain -S none")
@@ -414,6 +423,7 @@ MACHINE = \"qemux86copy\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         bitbake("world meta-toolchain -S none")
@@ -452,6 +462,7 @@ TIME = "111111"
 DATE = "20161111"
 INHERIT_remove = "buildstats-summary buildhistory uninative"
 http_proxy = ""
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         self.track_for_cleanup(self.topdir + "/download1")
@@ -468,6 +479,7 @@ DATE = "20161212"
 INHERIT_remove = "uninative"
 INHERIT += "buildstats-summary buildhistory"
 http_proxy = "http://example.com/"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         self.track_for_cleanup(self.topdir + "/download2")
-- 
2.7.4


