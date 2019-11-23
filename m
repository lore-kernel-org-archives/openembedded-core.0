Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6F50F7FCD9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:18:50 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 207so4950689pge.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tq5lGH/mq4qFGH4CHjk6pKTXSTRUUOAVPkoCtVxXiEo=;
	b=tG+S/EixaAbB29cgIKA/IWmNvo7HSaKWSz2yPp8dHnISpxT+2qa0tNuuNZV1o17zFB
	sq6V85bEbe7NnKzlRh6Fr2MorKCDyuKqTpUrglpGTj8doh4Lhsn+J/kCwHocd4vPP4RZ
	LHqGaLgOjgxrHU2P6AOILrcLu/fKzFEukmcxyjhIqxfgYqUzcHqCqM6UZkBmhNO4fJyz
	M6NTlmom27v0h0avTm+g+wp98hib///zP7jpnJk6zDg6wkEnngoBawS7l2PKdNqVJqdK
	ZyO8ab8Q2vL9yY05kHuARaiO/ndlrhbZ4Eukagp1W1i19+BLv5Siaygg/SPtJgVU7Rwd
	T6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tq5lGH/mq4qFGH4CHjk6pKTXSTRUUOAVPkoCtVxXiEo=;
	b=s5mEUwkkEnQZNiRrnSZZqvUpw8RUjlCjjvLlg5IMU1R4WT0QlTdlIvSc4pqw7d3Nl6
	0DuLx5LwBbqDQqhBq5rDe/tFezxlxtp1APiuZV3tQE8YBgkluYUfKQuAb2tPBWe+6LYB
	qpVAzstmHGQciTzJ8hDnlfjq5wbpQdNPV7pgcMiPCtNgpfWIdK/poYD5sJAKLLIDCP1c
	eJjYyi3ZmBfosnafm4NjSSElZuh73ClzeeJ9w5GHvIoxyTOw00M9kKIzZ9VEEqpdkH53
	ScJFYGBu+ZrcaSU+JwN2XU7YxmIpSi0+mUDP26HV+4rCGsnmGowZ6+debbGjKz39VELO
	gFbQ==
X-Gm-Message-State: APjAAAUoe9WPXcbH8AmZtB5M6uyf0cVB5rB1s5J6xka5MEEmx4hKaV1N
	Q5wmB0LK3O5JroTMO+iemgD3TXno
X-Google-Smtp-Source: APXvYqxBxTURduRHlvx+5HW4HCEQK+1Hn3YFDbN8QXdHGvtsb7DTWlsqqlLFKTkE9U3uLEjUEQmmIQ==
X-Received: by 2002:aa7:870c:: with SMTP id b12mr24409193pfo.30.1574525931395; 
	Sat, 23 Nov 2019 08:18:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id u7sm2647804pjx.19.2019.11.23.08.18.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:18:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:18:42 -0800
Message-Id: <1574525924-20765-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525924-20765-1-git-send-email-akuster808@gmail.com>
References: <1574525924-20765-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 5/7] oeqa/selftest/sstatetests: Ensure we don't use hashequiv for sstatesigs tests
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
X-List-Received-Date: Sat, 23 Nov 2019 16:18:50 -0000

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


