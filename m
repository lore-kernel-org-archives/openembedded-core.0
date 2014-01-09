Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 346076C731
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 17:14:11 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id t60so3017319wes.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 09:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iNSI4KyG6J0GqtgI0eDuwBgkWV4sniSS7QBaTNLaL/4=;
	b=Z5sICGE/p6uA4PrVFPFr5djJ17G1bLXMIP/F8gnTkVuue3Aa0BqCHve38jNhOVvAAZ
	cRZycO4OHNjb2VQZfR6Dk6AQ5ijs7NU8QGI1/pfhmDfAEsI+igXQL6VpnMY+cC5Mm0Dp
	fLKnrGD1ZhEza3UzJXvAvm9HB+zfqwX7D2jX3oDHFI3SGVmY2d3hVLxOcc5FvaxD2pwU
	z25BkK24Dpk9m9w4d2ANV5GdnYmWr1Ej8ILa68rWfk/Lmjmsg+vQCLeO5j7RxdOHIHVR
	hq2pmn9nwc5L+3zbNHIQeehr6Er7dudgDK4Uu6OyRnXZbce8dSymMn1rGnL9X+m6RGTt
	Mx/Q==
X-Gm-Message-State: ALoCoQlLs9tvj1DMfcK/WKAvgCDwuTd0jGqYb0bf+uATLGw2RmQpSz/xqFQMs3RNWLm87N+LNqaH
X-Received: by 10.194.241.228 with SMTP id wl4mr4128294wjc.2.1389287651843;
	Thu, 09 Jan 2014 09:14:11 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm8589634wij.7.2014.01.09.09.14.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 09:14:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2014 17:14:01 +0000
Message-Id: <1389287644-901-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389287644-901-1-git-send-email-ross.burton@intel.com>
References: <1389287644-901-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/5] python-mako: add (from meta-oe)
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
X-List-Received-Date: Thu, 09 Jan 2014 17:14:11 -0000

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


