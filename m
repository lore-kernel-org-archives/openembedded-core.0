Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 74F1E6CAC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 15:36:58 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id d13so918219wiw.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 07:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kfjac334u8TtlGLUcj1z4QlqQ/nGQx5D9AJYNZrb0zM=;
	b=HnJ/7IDc1rwYSDpFCSgAog63xFasAweSt9DrY3nGfDpFtT373IynFgI5/ADw+DL4sI
	L/b60uDgkuTFcpP5u501Y4VLOmgdBDz8tyzLIOUxlPf92l03PlWcGIVliPrJo+KPkvMX
	wYWVQ3aOeZ+YkHVcks3Ic2n9GnmN8iNUlRuI5aqBd6qoBBgNjqNsEQm4IYI4HrzmdkXC
	YArgvhSAp2cWKcNE8SeDJ5TyjE306p77eBmJKaigqnugL+I58p654Wf533rprB77yauh
	DBMRUwvF/uj/SKYTq+xA0TaBQmoy0EdLIOkmTxkJ1NfVs73gxPHlf6CCdbKIumsNSgen
	XEdQ==
X-Gm-Message-State: ALoCoQmkXNwUhqRIC42k9YL4+BzKL2ybWvGIj0AwLXjvyx9V22nZUEbCZK+rZEan2iBXO/NRccIb
X-Received: by 10.194.22.230 with SMTP id h6mr1959942wjf.86.1389627418606;
	Mon, 13 Jan 2014 07:36:58 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j3sm18405905wiy.3.2014.01.13.07.36.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jan 2014 07:36:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2014 15:36:50 +0000
Message-Id: <1389627413-7106-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389627413-7106-1-git-send-email-ross.burton@intel.com>
References: <1389627413-7106-1-git-send-email-ross.burton@intel.com>
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
X-List-Received-Date: Mon, 13 Jan 2014 15:36:58 -0000

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


