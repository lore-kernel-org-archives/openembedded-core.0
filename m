Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7226612D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 15:50:57 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id w144so29649416wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 07:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Q1+0jKEG9YEP6aNAk9qgGtPGozcDeYJBCGa8FcmTvMA=;
	b=uZCOsOpJz8hmvmRwJc+RGU2ja88RG6lVeJbnY/xhdxZHKz1TbKIgi5zOZdhCqVR1Wm
	gqv06oAwmztY2FKCIpkUGhWPSV5pYhpK4iYZHzPW6ukGOQrXhczbqNzE4QAz40KWs+G2
	voHWdBDU4nzKZOK/E9+qR43D0m4+0ooucqUpoqh4NRc8N+tuh7tg/6J4ZX3xvrEzSjGb
	hJ8r0EClW8EoJctPFpJlcHfo7EIryT0Zc6V6QWkQGlO8wwkB57aJb1737LM6N0seZqfY
	cGj6TCkDfqF/HfGzcPyb3v42vkgP2u1oTvqIaVLRo/V4JxANOQlKJCpGx/wWOcwFpg1y
	3aoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Q1+0jKEG9YEP6aNAk9qgGtPGozcDeYJBCGa8FcmTvMA=;
	b=BJoFpG3fLsbBWm4pG9ZVUQwConm2Vw5SKdYvzud2lucszNl0efkLU/DFNyjQZhR0ef
	tDmeGyTD/CwGvZHLkzJgCQP9ZfWdfutU+Q5kJzPXv9W73FOjDbdmie8+K0s9Y67TEA8S
	Lrz7A/BAtWKIAeq2SoNnKQfo4DUpAL3k/ID5ATL64SEHlkN59LrPlDQqHQQZO1f4G7ST
	0ZX5Lzq63izoVWUcvzij41WkT83EfFw72DEf+ZB9kwsIC5CpHlC01oLE3jQj9o8rh67V
	WH/WRGG5hagp/Fs7IdZ8fiv9hwS+5R015A6S06E6/uTEQgEyGCDsB8jG2rD0hO8ljJmS
	5j8Q==
X-Gm-Message-State: ALoCoQmVChHwkdv3A6rXz+lsuxUXBVLIc3QmIX6EF2dIwH2gbMIWFNYvvHAO072LZmJ8a+Vt99GvS/IPCMOAHz+cu7RIdU4LlQ==
X-Received: by 10.28.68.213 with SMTP id r204mr40795307wma.35.1449762658292;
	Thu, 10 Dec 2015 07:50:58 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	198sm13521177wmr.18.2015.12.10.07.50.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Dec 2015 07:50:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 15:50:52 +0000
Message-Id: <1449762652-24100-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] attr: add attr dependency to attr-ptest
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
X-List-Received-Date: Thu, 10 Dec 2015 15:51:00 -0000

If attr-ptest is explicitly installed it will fail as attr isn't a dependency.

[ YOCTO #8766 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/attr/attr.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 28c750f..6860978 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -34,6 +34,6 @@ do_install_ptest() {
 	sed -e 's|; @echo|; echo|' -i ${D}${PTEST_PATH}/test/Makefile
 }
 
-RDEPENDS_${PN}-ptest = "coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
+RDEPENDS_${PN}-ptest = "attr coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
 
-BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


