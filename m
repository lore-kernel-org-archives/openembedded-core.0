Return-Path: <wallinux@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 917AA6142F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 10:59:39 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id t23so11541516lfk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 02:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ehZggdp6uuoGzafVD9HCNHPqcSFji9/61qOi6iaisH4=;
	b=in7pKubPsEoPPwfModCizY1ug1pp7k0AP3+Eu08B0gT8JZYhWFd1J8b3FTeG4KS3zZ
	a5THrRxzjEUA6yvioZT/eDwRSvfWwHUZGozwXTTmKazqpTu7IJ0WUgG7EsNMSbVpp0SJ
	/dIisZATU4VaP/AtkLfblLqTWsAgmKdx0rbeSD6bDiPIS7H+jk2+dwLTiLhORHCh48f6
	G/Ax1jar7D7JaZLtHaMFWLlkYE193G28DPHhD0CDDqcqP1tY6lzlPJD1GOVR/2K2kof6
	4sMovn3dIL8KV8/qgOlJxzwuddnE/0f3dTmZQJzLf4UzH5jdAMps2+yFzYlQP6jVvRDz
	cw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ehZggdp6uuoGzafVD9HCNHPqcSFji9/61qOi6iaisH4=;
	b=GQxsUiGgXmbofyCA/KdG/GZI4GiiHByP6XMOmRNtywL6TuEO1+QNr2QZF8FP6dd+Fj
	KI0IlhJt7Y0RmBqZRCguRRiriif2g78WEt3qisU72cWhyU9CUoWCGvT2lfRPS0/Vvy3e
	hYd5lCDTdUlXpdSvPCaYvg8/bog2m9tYPcWn+ERE7plzorQqUy/1CF9AXYfxcpbZqodK
	kS6QsHGiVgJlVsYjSm6/wT8czJC18Ku9jmtm7Q6ukoWAqwmvlemAVfyUHV7uJdbGfMOw
	68qDMs3J6VPloPSaud1kbtFSfi1rV8AsH+D/b5AJWruiK/3aI8SDTHqZaFOO+3CyB+U0
	Mddg==
X-Gm-Message-State: APjAAAVZFf5SW75WxD/zR4E8zVGxoRuitJs8+ZMP8b2QPa6AFSgL4fMc
	YpsSyzTcY7jyJ+fHNYpcgZsoSPsf7vY=
X-Google-Smtp-Source: APXvYqxXJGBj3e/szod4Qyu+bfF/2/+7KjRnaHsmfPASC757yb4+6WEsuBtD3uvqCMt4lEFMbGkgUw==
X-Received: by 2002:a19:4855:: with SMTP id v82mr7369553lfa.197.1581937179685; 
	Mon, 17 Feb 2020 02:59:39 -0800 (PST)
Received: from arn-awallin-linux-l5.corp.ad.wrs.com
	(h-155-4-243-131.NA.cust.bahnhof.se. [155.4.243.131])
	by smtp.gmail.com with ESMTPSA id
	b190sm124950lfd.39.2020.02.17.02.59.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 02:59:39 -0800 (PST)
From: Anders Wallin <wallinux@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2020 11:59:30 +0100
Message-Id: <20200217105930.902-1-wallinux@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] babeltrace: update to 1.5.8
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
X-List-Received-Date: Mon, 17 Feb 2020 10:59:40 -0000
Content-Transfer-Encoding: 8bit

updated HOMEPAGE to http://babeltrace.org/
updated LICENSE to include LGPLv2.1

Signed-off-by: Anders Wallin <wallinux@gmail.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
new file mode 100644
index 0000000000..b6b7653037
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Babeltrace - Trace Format Babel Tower"
+DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
+HOMEPAGE = "http://babeltrace.org/"
+BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
+LICENSE = "MIT & GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
+
+DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
+
+SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5"
+SRCREV = "054a54ae10b01a271afc4f19496c041b10fb414c"
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
2.25.0


