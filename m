Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id E4A7B6B8FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 17:02:20 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id en1so5078052wid.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iNSI4KyG6J0GqtgI0eDuwBgkWV4sniSS7QBaTNLaL/4=;
	b=mwGEBM0adrhUQsomqc/GAdPiUPLRP8jPd5Rk8CTyI/1DmOOr6t2An1gcMT3xmVN6K0
	2b5tNMd5nBY8F2HDWnLVI3c875Y/kj0/3uSWER74ZooT3krYFf+FQMcwBxGWe1H6GoLZ
	tCutAYNIkrK+eP7L8omNxpFlcKyqhmU57KxDrPe4Yq8ZuapYFRdmRTVfcn0xeaCfHwOe
	yKF/xi/6izdtqWAWdlVq3572ecTfvvj4dXCv+f3TbjH/PsXlMCOPjyKnt60zu3m0F5q7
	1s7Z2M80l1o1loMmk/k8GXE1JbqGd7n66rrJH+wZI7r8IhxXwrgHn04S/RjCx5JyDash
	OtZQ==
X-Gm-Message-State: ALoCoQl1e8ILsy+7yVrcRoezigv0QRbOSsTMbf5oXs0Ot2oEpF6txCzsaEtHNrLG0+ZJPJOmfbyq
X-Received: by 10.180.73.196 with SMTP id n4mr3762169wiv.24.1389373336629;
	Fri, 10 Jan 2014 09:02:16 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id eh7sm3494947wic.2.2014.01.10.09.02.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jan 2014 09:02:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2014 17:02:06 +0000
Message-Id: <1389373329-21241-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389373329-21241-1-git-send-email-ross.burton@intel.com>
References: <1389373329-21241-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 2/5] python-mako: add (from meta-oe)
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
X-List-Received-Date: Fri, 10 Jan 2014 17:02:21 -0000

python-mako is needed for Piglit.  This recipe is taken directly from meta-oe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-mako_0.7.2.bb |   22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-mako_0.7.2.bb

diff --git a/meta/recipes-devtools/python/python-mako_0.7.2.bb b/meta/recipes-devtools/python/python-mako_0.7.2.bb
new file mode 100644
index 0000000..1d2bdd7
--- /dev/null
+++ b/meta/recipes-devtools/python/python-mako_0.7.2.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Templating library for Python"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=da8dd26ed9751ee0cfdf9df1a16bbb54"
+
+PR = "r2"
+
+SRC_URI = "http://www.makotemplates.org/downloads/Mako-${PV}.tar.gz"
+SRC_URI[md5sum] = "e3c0a677aa4216da9e89ef8fa76cbafb"
+SRC_URI[sha256sum] = "fe8698e845035586bd711a6748e4e40a208a58de276b9138026164700494b68f"
+
+S = "${WORKDIR}/Mako-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} = "python-threading \
+                  python-netclient \
+                  python-html \
+"
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4


