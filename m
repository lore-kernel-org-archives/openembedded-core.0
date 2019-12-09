Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 183567F3BA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 11:58:57 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w15so15944253wru.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2019 03:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4CGHSAMp0x06O4fRYyu/xL1hv+Sz2NMTQfmFJw6Ufvg=;
	b=0a/1jpTwcHcp48yUvJ+91A36P+CkG7XL9xOsPuN3lCUuO9ET4PLNIMTPKYRDU/ubIP
	t2g65dY1WUc0hNG5FsT2g4QkrTUnEgi0aymHBQPc2Jax+sUlANHCImbf93Tnrywk8NvK
	B/xhOk7HsX+rFm3fYLOoTXHYw3tSlszMXYnWLWCXeRclcH/lXbLGDJt2jbXTk0uuPDF3
	QmznTJkOsH2sQ8M2EVvXnsZvwXp1N2/zvvWKxoorx7McGHGL4hzaluxj5Jn2/vQIXdy/
	qVJcOCFslk/Vl3FuulkDIGR8HxNd8xMTMIh35IB5I2O8BDJ8cSMZ6HH4iqZ1g1yetjzT
	h/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4CGHSAMp0x06O4fRYyu/xL1hv+Sz2NMTQfmFJw6Ufvg=;
	b=uBqL4dXX/bXwp7l9FmD23MnQDWiF/PULOqj1AUe6rgB/uB9wk9Q1twOmTTf0ulg0D0
	PV7QEuDDLCnwJKx1CxcqsTwcI8fedx4dExiV+aKZmOP53jX2slkEeZwgbOfMGJ2ueaXg
	V5rhqJy87apA/ZZVKluByy+Ao8/PeYSYKTzGzqupKAdG4OYn58HcQm8TOerEA5zSodGJ
	3Wz2+MurIGE1KX71PnGonU/vd6cB3Eh+a4J62EhIXy93yygeEv+YtoprAFj+yNDwzI7T
	myyWZpr3xgtLkZBYJBgeO9V1u1JVb8xFQGE8+jSKYeG7z2FIzSvpp0yYu/ZvTcT1yPBY
	x88A==
X-Gm-Message-State: APjAAAUF+QwgnbsoaFwSQAGtctNtSWvweRs2lhozcIwwfWJjkg990u/T
	N2X/e0iMiy/TlHvQ2tHEdoob/ySgYoo=
X-Google-Smtp-Source: APXvYqxsm6Z3LW9Z5avm4NWfA5+bvE6dRFDyXuhRXEgPZXOoTytKSDclAlfPlz1gLKoV8XvP7h5KOA==
X-Received: by 2002:adf:806e:: with SMTP id 101mr1845371wrk.300.1575892738424; 
	Mon, 09 Dec 2019 03:58:58 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x18sm26991801wrr.75.2019.12.09.03.58.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 03:58:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 11:58:55 +0000
Message-Id: <20191209115855.20887-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libcap-ng: add missing Upstream-Status tags
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
X-List-Received-Date: Mon, 09 Dec 2019 11:58:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-configure.ac-add-library-if-header-found.patch          | 1 +
 .../0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng/0001-configure.ac-add-library-if-header-found.patch b/meta/recipes-support/libcap-ng/libcap-ng/0001-configure.ac-add-library-if-header-found.patch
index 0fcb032f903..6b155ccea85 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng/0001-configure.ac-add-library-if-header-found.patch
+++ b/meta/recipes-support/libcap-ng/libcap-ng/0001-configure.ac-add-library-if-header-found.patch
@@ -8,6 +8,7 @@ If the pthread.h header is found, make sure library containing
 On some hosts (e.g. openSUSE 15.1) "-lpthread" needs to be explicitly added
 in order for the code to compile correctly.
 
+Upstream-Status: Submitted [https://github.com/stevegrubb/libcap-ng/pull/10]
 Signed-off-by: Trevor Woerner <twoerner@gmail.com>
 ---
  configure.ac | 4 +++-
diff --git a/meta/recipes-support/libcap-ng/libcap-ng/0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch b/meta/recipes-support/libcap-ng/libcap-ng/0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch
index 7eb950f159c..c68254ff3da 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng/0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch
+++ b/meta/recipes-support/libcap-ng/libcap-ng/0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch
@@ -3,6 +3,7 @@ From: Christopher Larson <chris_larson@mentor.com>
 Date: Tue, 26 Nov 2019 22:34:34 +0500
 Subject: [PATCH] Wrap pthread_atfork usage in HAVE_PTHREAD_H
 
+Upstream-Status: Pending
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 ---
  src/cap-ng.c | 2 ++
-- 
2.20.1


