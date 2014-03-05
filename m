Return-Path: <ajlennon@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 88E946C8BD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 09:17:17 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id n12so853290wgh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 01:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=7TUz6foJzg3XYkg61PGUosjThHznsw65vQiIHTz9tVs=;
	b=jl0V13MFTZWULtr9XjWFxvcHJ+UiAjbHLYKD433ZjSskTfdUHC7BuICBQcK4IZgzMw
	92G8Amw+9LIG146FZ0Y1fhSGegK6R1PP7E58sIRQRNj2No8tdPZeVTvbYOOYZiAe32F5
	8kp54nV/oA/1d0zuFJn+G7blb7pRDTNCrAa2Iv8KUDAFSb+iuj5zz2ExbFp5P2dYo+E+
	sJH1n16tZKq1gbrk9KwZXUFsZMTq1bqX8Ng9rNmYmABzMeMPnLzA4qg/0HdnRVHvJn9V
	FEEdvWi9LTI2cQeOCtsiWvBUJYM7rEv/ctlXa4s/vy0i8B8hVoHOE+3Da+qgrqZcBDpR
	3iSw==
X-Received: by 10.194.179.69 with SMTP id de5mr6946465wjc.4.1394011037657;
	Wed, 05 Mar 2014 01:17:17 -0800 (PST)
Received: from localhost.localdomain
	(cpc32-live22-2-0-cust59.17-2.cable.virginm.net. [82.36.253.60])
	by mx.google.com with ESMTPSA id uq2sm8714344wjc.5.2014.03.05.01.17.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Mar 2014 01:17:16 -0800 (PST)
Sender: Alex Lennon <ajlennon@gmail.com>
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 09:16:23 +0000
Message-Id: <ce88733ef0143e96e323aff0ac34909d43eda4bf.1394010806.git.ajlennon@dynamicdevices.co.uk>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1394010806.git.ajlennon@dynamicdevices.co.uk>
References: <cover.1394010806.git.ajlennon@dynamicdevices.co.uk>
Subject: [meta-oe] [PATCH 1/1] daq: Update from 2.0.1 to 2.0.2
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
X-List-Received-Date: Wed, 05 Mar 2014 09:17:21 -0000

daq-2.0.1.tar.gz is missing from SRC_URI location. Presumably replaced with 2.02.

Signed-off-by: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
---
 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb

diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
new file mode 100644
index 0000000..2675e2a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "The dump DAQ test the various inline mode features "
+HOMEPAGE = "http://www.snort.org"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
+
+PARALLEL_MAKE = ""
+
+DEPENDS = "libpcap libpcre "
+
+SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
+            file://disable-run-test-program-while-cross-compiling.patch "
+
+SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0"
+SRC_URI[sha256sum] = "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
+
+inherit autotools
-- 
1.7.9.5


