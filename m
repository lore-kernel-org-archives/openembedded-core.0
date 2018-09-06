Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id B6E28795DF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:46 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id p52-v6so8434210eda.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ELavUxvo8WcI17v83FDxUCFePSXlI7Fnj3C2SMWWiII=;
	b=X/P2Pc1iEK6VJOigNShVdPUlu5lX6hYyZZkffcRcGT9HIYNw42fcWY7GHZqs73azPu
	lvV6AYya/pcu8m3T1IKajpiqFJ8zxDk1xHSR50L3C6ZS0QnQWBrkBa+KaiE8+9zuCsPS
	JAY9br/ZoOH37yOhWOjmLW63cVJp2hHYIa4axx/foyYEMaEKUAAGYrgSj5OeBSt7dfBU
	iTQ1bwX6ahyI+/YlFFfVyW3Jx1zjgJKWuW+Z4bFwujH4QUfc6LVL6zSzsCl1EzNuqakN
	ojYJGrk+FZMZdFCY6D2k1mOg7pps2M4nrEI/7X0v1q9NEEx7J/UeNIJixPXwi68/3KCS
	ykBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ELavUxvo8WcI17v83FDxUCFePSXlI7Fnj3C2SMWWiII=;
	b=JWkPY4L0hIAKOAkj4n+utZVMrKPqq4P6M13n054apSt41bOa0iqDaFy8bPTm5GWzNZ
	Uqd25TP5UtSIlRF7gLEAnOgX6FeAcq60oDOnkr+u8dri2dkpKpHrOa483pBCuBpovJtE
	uGvBSP/5PJ5UIJEIxv0y/C7XKc+N6nfVdF6SXwKlAtnEc+XEQjmscEwMXFEg0mP06n3C
	Ivg2Ujv8J9MS0BlqMdAnUR9c1K62E7jvlWfxTxzGUWtRBbeBSLY9IPPVb19FWPJVp984
	HW1wTvg4TSwoFcpVDCrpjRrdmsCeFyDyhhFpJaIoso2Im8+djaTYUraUL5juRbL20omv
	Oqug==
X-Gm-Message-State: APzg51AqiFJ5C+AabfwODEQkC2CFvrx11dNIpdIsGQS8Z+nmmpwbJdMK
	l9mLKBDrmXbNfDHpFdNBUGaQ+VmayD8=
X-Google-Smtp-Source: ANB0VdaKlx0zDm3JtgxzLq4XHPqJ9+cW5dDOY8GlTPJ/PfyYuTU6KjTvQu/nkWJSHqxPIGJ5LPJCNg==
X-Received: by 2002:a50:8cd7:: with SMTP id
	r23-v6mr2756052edr.240.1536229787291; 
	Thu, 06 Sep 2018 03:29:47 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:17 +0200
Message-Id: <1536229770-29600-8-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 08/21] babetrace: update to 1.5.6
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:47 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.5.5.bb | 20 --------------------
 meta/recipes-kernel/lttng/babeltrace_1.5.6.bb | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
 create mode 100644 meta/recipes-kernel/lttng/babeltrace_1.5.6.bb

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
deleted file mode 100644
index b247fb0..0000000
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Babeltrace - Trace Format Babel Tower"
-DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
-HOMEPAGE = "http://www.efficios.com/babeltrace/"
-BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
-LICENSE = "MIT & GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
-
-DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
-
-SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5"
-SRCREV = "d68a4daf85c73ab7d7070de0c98d0c170af4758e"
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-debug-info"
-
-ASNEEDED = ""
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.6.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
new file mode 100644
index 0000000..f5c31c4
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Babeltrace - Trace Format Babel Tower"
+DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
+HOMEPAGE = "http://www.efficios.com/babeltrace/"
+BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
+LICENSE = "MIT & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
+
+DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
+
+SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5"
+SRCREV = "4f10a4adabee5ca61c27ba399b3438505e0cd6de"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-debug-info"
+
+ASNEEDED = ""
-- 
2.7.4


