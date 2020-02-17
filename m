Return-Path: <wallinux@gmail.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id B71E7608AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 13:34:16 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id y6so18904754lji.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 05:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jHy/d7JxWJZIlI70V9soRNciJI0UONg5WapFOBL1m3w=;
	b=Tk6cgx4W5cp6mpuTz+2i2+iNHA6TDdpEmV9KaJUDAkouLP0a+Zj9+HrvWg2JuyXt/u
	RQJvwa36tjVBs3GRNCC465RtxFLZsW1aqVrIU6mtw8kD+Tgp3jrRYKYMYs5FZRtksvTH
	GJJQ6mEm6i4hoN/JJu5YwPXIxiCEgmah9a9BOZZqYev1Bk7i39svUjaIVaSWqWM22XyL
	Z4Kbo422jDAdmF1+DE7o34hHPArfq1qDmT9DbxnMDFu2o6opY+4MGc0Y1vTz0fWXUIXj
	MC0rX/WUPA5+2zJk9g0ZkxkkDrotjeqGs/rUH5Z1cDh7VGZ4SDP8JimjuAFMFisyZ7Ce
	+Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jHy/d7JxWJZIlI70V9soRNciJI0UONg5WapFOBL1m3w=;
	b=L+Cn3WjG9p9ujsnI5/tQst4iJQenqMlcx7Kt1b9RmcNKgtH1LY1Z9y3SKX4tpfVv8p
	ZQ+4bGVzf9obI6A86pnRJLxrNKXCNzQyx9Yc4O75RDq+Vz7W80XAguFtq62wF1CYzHIC
	CCmCWCGkeqjKqBidgXp9nCiOmACFTPRvqbU4llAHoVWlf8SA3oCAm3BdJkD2zzCZ6PUI
	Y6hNaRKKbwaQx9OWdUsIbkXOwPD53KhqISfDRuSwmVZuUJITDshlF2Z5IJFFGFQr23vt
	u3eVviyMAMMMm6v5iPN2I/PxJA/ptvZoJsRuisrSG9sIVIf7u2c+Cr8gGRVJj4s+f9B1
	tS4A==
X-Gm-Message-State: APjAAAXfzvxZDM7VMD20zsUMFMT7DvdniMmEOgBFoDoJC7kotbP9880B
	9AJt4rhykOwbJTI4MYCtj9PlFnikNb8=
X-Google-Smtp-Source: APXvYqwq2EfVnHpcLxp6wfIErT2xF1zssO/67XYtexpOUmu8Uwr5ogln9FMBKAc36RfMLeSw8xGyuQ==
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr10092990ljg.166.1581946456717;
	Mon, 17 Feb 2020 05:34:16 -0800 (PST)
Received: from arn-awallin-linux-l5.corp.ad.wrs.com
	(h-155-4-243-131.NA.cust.bahnhof.se. [155.4.243.131])
	by smtp.gmail.com with ESMTPSA id y2sm458695ljm.28.2020.02.17.05.34.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 05:34:16 -0800 (PST)
From: Anders Wallin <wallinux@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2020 14:34:05 +0100
Message-Id: <20200217133405.9914-1-wallinux@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH v2] babeltrace: update to 1.5.8
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
X-List-Received-Date: Mon, 17 Feb 2020 13:34:17 -0000
Content-Transfer-Encoding: 8bit

updated HOMEPAGE to http://babeltrace.org/
updated LICENSE to include LGPLv2.1

Signed-off-by: Anders Wallin <wallinux@gmail.com>
---
 .../lttng/{babeltrace_1.5.7.bb => babeltrace_1.5.8.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.7.bb => babeltrace_1.5.8.bb} (84%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.7.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
similarity index 84%
rename from meta/recipes-kernel/lttng/babeltrace_1.5.7.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
index 05ef6d099c..b6b7653037 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.7.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Babeltrace - Trace Format Babel Tower"
 DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
-HOMEPAGE = "http://www.efficios.com/babeltrace/"
+HOMEPAGE = "http://babeltrace.org/"
 BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
-LICENSE = "MIT & GPLv2"
+LICENSE = "MIT & GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
 SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5"
-SRCREV = "d4014aeef4b89a4aaab1af42d7b0d143d62da0ff"
+SRCREV = "054a54ae10b01a271afc4f19496c041b10fb414c"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.25.0


