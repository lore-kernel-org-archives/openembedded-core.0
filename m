Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE587E6FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 10:51:38 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x4so13428010wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 03:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xJO0HGSgyUKAxosM/ejKZyPsLEKaSBYWFjw7ndSMa0c=;
	b=l+dfQ3xk6w/17CgA1uaatYDETJuiMWS143qZKxXAApejff+vc4bA98JVDx+GfuIM1P
	8dyqsXzjh471MN3izZU4P4g8K7E4uTq/gJZylBSXGU9FFJBgjYXBzDBzLzmJnzNMvMGq
	sxoN1rv8FtxXmduU+lMhX0Gkr2hgtbiro7yzVtK/fNX+fn47hDgrkRT1383PBtt6RqV9
	U6TnNs9NEEbGM/Dewfh9P1o1ZoWUJ8KlLDFSHq3jHhSJQOmKD8w3uP79zuCHU+6PCj/I
	JmrRgAEQoZXyLATc6fJiLP2xwb5iXWVrHx4MP4EsujpFvegCe4RwtiSEw4a6y+Ff0qcC
	JhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xJO0HGSgyUKAxosM/ejKZyPsLEKaSBYWFjw7ndSMa0c=;
	b=fkJi/gM3yGiSFyXJX5idd6Rqsgt3pesYz5Nm02G18rJDFEjrBcnuEFVbrfi7vpWXam
	U7OUV+8StYrwEiYpjkVT+zH1kvIzphINLgXzRDSZCF924agpYakpsy4quuoUlASI8b8Z
	YsuXC0CP6aKQEo3Nukx3lAdCyJxFnWfZhsyV0PiII1KVFmaeu4eLza1qyDptr12YoHll
	BoLGIzU01p9krO8wsrZi9EyVp9y7Uu49yAOR2i/KG5FwOfKkhhKkpMLF5AtvkH8eVazg
	BCVMapEMUxaIKITC7b+9Tvzi3QXyaZLy1hwFCZVOsI1i23NFem24KW1UX2oDOJVPpOKZ
	pbRw==
X-Gm-Message-State: APjAAAVRWJeZBAPEL7DksCdgw68Qy7IX66H3pNEdPFifgn7dZGJ33iuG
	D83DJvoR5V3+ZDPqVycmVYoTK5eA0Iw=
X-Google-Smtp-Source: APXvYqxNnBmHRkNMumrUlSyDUUZKJlzLGVnWJIUnh1Woehe3mnd4jM1VL0PH3byLzlMwPNSNxw3bbA==
X-Received: by 2002:adf:f544:: with SMTP id j4mr9412412wrp.150.1560855099135; 
	Tue, 18 Jun 2019 03:51:39 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r131sm1872339wmf.4.2019.06.18.03.51.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 03:51:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 11:51:36 +0100
Message-Id: <20190618105136.28510-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libsdl2: use binconfig-disabled
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
X-List-Received-Date: Tue, 18 Jun 2019 10:51:38 -0000

Just like libsdl, we can rip out the sdl2-config script from the sysroot as
pkg-config is preferrable.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
index bac91d37366..a0a0b1509a2 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
@@ -21,7 +21,9 @@ S = "${WORKDIR}/SDL2-${PV}"
 SRC_URI[md5sum] = "f2ecfba915c54f7200f504d8b48a5dfe"
 SRC_URI[sha256sum] = "255186dc676ecd0c1dbf10ec8a2cc5d6869b5079d8a38194c2aecdff54b324b1"
 
-inherit autotools lib_package binconfig pkgconfig
+inherit autotools lib_package binconfig-disabled pkgconfig
+
+BINCONFIG = "${bindir}/sdl2-config"
 
 CVE_PRODUCT = "simple_directmedia_layer sdl"
 
-- 
2.11.0


