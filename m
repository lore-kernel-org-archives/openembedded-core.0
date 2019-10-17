Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id DE87F7D40E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 11:29:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id o28so1918406wro.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 04:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IfZqPMMvRXLsd+ehGa0YnBlgLFpg8gl4HFcB+cdHJj8=;
	b=LigcxlGRRTXZwFHPgrMcyfpcbiHVcIn/uOPg1MCsQ2wXXJIhQmxyY8oa4SJI1j0Bc6
	v8lXnR49sIA2zz0ayBWAfP/0tU1m9N3PBBwl+MhdG00ajBR9om5t4K7lCFxbBz15yxvH
	6JO/IG9TZrzqN7JogXxHwkpHcWaK+SHzzF+vnos7/p9GV85IkH/7Lf2PHzsEL+e2RCJj
	pllubeLHj5Cy1l88uThk5cPsCcWx+SMqfxzp4u+NmSYkoBkXeru5Y0X4gnJ3e8h86o6k
	HSVLH+YUB+TcC8zWXv11NHDy/FjV+IvlKqq3ViTkFtNKWwUSX/Cm1/NKmitzkJamRdHI
	W79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IfZqPMMvRXLsd+ehGa0YnBlgLFpg8gl4HFcB+cdHJj8=;
	b=XSYExPIiSrYc9MQF60zmOjaAv44ipJGCU+X88yIDPNPGSjXJi4lepPkk/KxkCIvMAj
	b3kuHNjiEMZOxD7OuUUlxrJejSDVUYrmJNhWZQ+JOvSqojPxIdiBwOCvhs8kPIYXi0xx
	dTKc6A/nV6yfh4EcmqQRphKfP/wLKuXkI2sAf8U2HioQaEENfntfM0whniE19/n+T4t7
	9eripm/SKZZZ0AYt0EMI2dS31+qSPtaQmwI6tG3fC8gzwDq1CdNpe9XCIJullzqgnb35
	ZRa+jlPPN+1t7nDA3yJzRzSQ5Cq/j+C6Ve0EUqN9Jc/e8szG2lfy4fwp127NzbRh9pm9
	7jCA==
X-Gm-Message-State: APjAAAVjWBd2lQBvCNDxMDyA0At6aFBiRaNajUAc5eINJdKVustK1LC/
	Dtt9/og3eIbPruekxxxElnlGpEgFRL8=
X-Google-Smtp-Source: APXvYqzFO6VX7A6CxET3rzFm1AFfetRuybs15wtrfOdT/xL3JHiCjC6FZFyCs2ZGOYo0a/HDbqLEKQ==
X-Received: by 2002:adf:d846:: with SMTP id k6mr2670035wrl.178.1571311790912; 
	Thu, 17 Oct 2019 04:29:50 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r2sm1907514wrm.3.2019.10.17.04.29.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 04:29:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2019 12:29:42 +0100
Message-Id: <20191017112945.345-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] python3: alternative name is python3-config not python-config
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
X-List-Received-Date: Thu, 17 Oct 2019 11:29:51 -0000
Content-Transfer-Encoding: 8bit

With python3-config using the 'python-config' name, it's possible for
python-config to point at python3-config, which is obviously wrong.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.7.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index c8b63fee9d5..01230b0fec3 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -59,9 +59,9 @@ inherit autotools pkgconfig qemu ptest multilib_header update-alternatives
 
 MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
 
-ALTERNATIVE_${PN}-dev = "python-config"
-ALTERNATIVE_LINK_NAME[python-config] = "${bindir}/python${PYTHON_BINABI}-config"
-ALTERNATIVE_TARGET[python-config] = "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
+ALTERNATIVE_${PN}-dev = "python3-config"
+ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_BINABI}-config"
+ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
 
 
 DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
-- 
2.20.1


