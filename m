Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id E11986DA91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 15:19:47 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hq4so3843035wib.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 07:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=kfjac334u8TtlGLUcj1z4QlqQ/nGQx5D9AJYNZrb0zM=;
	b=ll+a2sBQazzqkGJS0FLafBTINOiWSMe6yQwYSl3a4v9Oi1J5VpCdgM5Ke8H6UWYWqm
	6HEgTyhZac8iRhWIANigfNKto4V101YvEq/rILdGn+DXw4sP0+JMMeTi5neHW9KFikT+
	tU+j/kqpNPGif0oPdJiNZJ9FK7ukharPmIw3B+fXcNcDGdDFDdOyOp6gNwrfCtxwf6Nr
	hVYO5LCdjRgft0rSeT3Mj919bEyScjN4qwByjG8Zx2f16mFaUsdkCqSYIegYDr2fPUzz
	Kgkntt+Zn341JB4npslofoR9mCx8KaMvmVsvCAF4fJWEwKqzx7QplsIMM1GrkAhQQibZ
	d8IQ==
X-Gm-Message-State: ALoCoQk7g1auAH02uHDB9MTXQ3S8d3Exdd1xR8DGygb5YlIl7A8iqP9SdQUUu0DizTxH7ZsenGe3
X-Received: by 10.194.82.105 with SMTP id h9mr6654395wjy.52.1389712783781;
	Tue, 14 Jan 2014 07:19:43 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm1923314wij.7.2014.01.14.07.19.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 07:19:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 15:19:27 +0000
Message-Id: <90303fce3f8475391436cb2193c4da591332aafb.1389712683.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
Subject: [PATCH][V3 2/7] python-mako: add (from meta-oe)
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
X-List-Received-Date: Tue, 14 Jan 2014 15:19:48 -0000

python-mako is needed for Piglit.  This recipe is taken from meta-oe, and
upgraded to the latest upstream version.

Checksums updated as the upstream LICENSE file contains the copyright dates.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-mako_0.9.1.bb |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-mako_0.9.1.bb

diff --git a/meta/recipes-devtools/python/python-mako_0.9.1.bb b/meta/recipes-devtools/python/python-mako_0.9.1.bb
new file mode 100644
index 0000000..84071c8
--- /dev/null
+++ b/meta/recipes-devtools/python/python-mako_0.9.1.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Templating library for Python"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=da2a9d126b93cab0996a8287dacc480b"
+
+SRC_URI = "https://pypi.python.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
+SRC_URI[md5sum] = "fe3f394ef714776d09ec6133923736a7"
+SRC_URI[sha256sum] = "ed74d72b720a97a51590dfa839f2048ceeb76cc80d1d9ea5731a5262384316ae"
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


