Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7716B7FD59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:48:09 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i23so1302271pfo.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wBPtCQFJLYBJLrxH0Tup7p+DB9X6ml7dTcjPHJgXj38=;
	b=OpTUIWQoGYMZhCYaLWEIp4ToWdfeHAkMwRCz5+Mz/mnPnJhPg09/UAndNYKK1z4zDL
	oGvK3q0QdvV0DYF6wER7fMeWx5j04AZwQxxfnL3P9TdyRndUuaXI3YpMqDlThYn5skUe
	KwzdDq4708t4rH69xbk5/piXqZ0Ap+fQkLIfQoyyY7yHHvAVFrBi3hTHAKbRhUkcbtG+
	BLzBbnE85q5PZHLNhTPgxD95U0kfA9slYZHljEPbV/uKxn30dnvbAeKKrzrwDef18z/3
	jakSlJ0AFfr40NZIq6b2tEHMpRjs8j/88S4cfRZWc0v0wvUw6Bn+F35p85Vl5NzyGG/x
	2V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wBPtCQFJLYBJLrxH0Tup7p+DB9X6ml7dTcjPHJgXj38=;
	b=JCdw3b2k9wEisdXz6cs5kUecXR4VV2Y9GPLt6SgCvezKd00LpNFIaubdVD3WTYhNB7
	WpGP/zpVNnbB2fXCI9dk16ItSuxlkYSOtBMTC4KJMWKDBcQM4qax23Fr80ghyMcPIx58
	1yfFiJ3W5MPS+Lco8k1nzSrGg+AgWREORNipp6n+cMFVbtSPxEXmhcuBNQy9E2eM9gF6
	T4opZ9eaiXf5nv2ej69g7JHwNd6vjrtsKi4XwNUxmwKYFh8L7Q/i6onTq2QuYG/uf99x
	pu+Wp/K47ByrLUGTVvsH80nDfcSMn6qfVuuv2FIvX9LfA97+FX482GzKQDPdHGvAbLWg
	s5Tw==
X-Gm-Message-State: APjAAAUrScGAq9ZiPvOK7JsAYhET9l24vGrpaMY38bXHtU+EJApeUQqJ
	Yp7B3bpLf1/yL/22kisj8k7sUgbCGPU=
X-Google-Smtp-Source: APXvYqymlnwMZh5/7JxtHJzfFq0soXZeFLxVfxyOKSnjMTZVXd8LaJ44XLohmmUIzJBmzx+vnm5m1g==
X-Received: by 2002:a62:b418:: with SMTP id h24mr4034471pfn.192.1579880889909; 
	Fri, 24 Jan 2020 07:48:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id
	133sm6729608pfy.14.2020.01.24.07.48.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 07:48:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 07:48:05 -0800
Message-Id: <20200124154810.1760420-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/6] nmap: Use py3 in depends/rdepends
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
X-List-Received-Date: Fri, 24 Jan 2020 15:48:09 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-security/nmap/nmap_7.80.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
index 2ac600c782..96af17efdf 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
@@ -28,7 +28,7 @@ PACKAGECONFIG[libz] = "--with-libz=${STAGING_LIBDIR}/.., --without-libz, zlib, z
 #disable/enable packages
 PACKAGECONFIG[nping] = ",--without-nping,"
 PACKAGECONFIG[ncat] = ",--without-ncat,"
-PACKAGECONFIG[ndiff] = ",--without-ndiff,python"
+PACKAGECONFIG[ndiff] = ",--without-ndiff,python3"
 PACKAGECONFIG[update] = ",--without-nmap-update,"
 
 EXTRA_OECONF = "--with-libdnet=included --with-liblinear=included --without-subversion --with-liblua=included"
@@ -49,4 +49,4 @@ do_configure() {
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
 
-RDEPENDS_${PN} = "python"
+RDEPENDS_${PN} = "python3"
-- 
2.25.0


