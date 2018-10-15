Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 060B460402
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 18:13:06 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id x12-v6so22429517wru.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 11:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=07reqXxoOvfGD6p1n8KH3saTzajlkN5PIF7OcGdYrZ8=;
	b=JlZMnsGi5Ws9kqGfD6FJ8l+XkgKw4jDj8BIZKngo6MoaymmV3+JuF5Z9rvRh6t6VCg
	QWX0seGovcdUZhSnNMpglVLDSDbd4xfdzVNSDJnfAeEqxLkeBt1Bl0jmgo+NU0uA67R4
	Lp1OTANftppLAvTuBOgvelsX18yhp1YtU50Vy3n46FxFFQ9Qj2aV3vfg6FekZrV/sbRW
	Gokdx4FS63YaJkF0LDEpAvIlWKRlZtY9h5MvSa+At6AvESh0wqDNDATWtBS8CJBB/LOK
	EBRpoAEWdT8FoGRs1Fl6EoBuATMu097ZoYKNMlTQaloFMwevYNhDB/SpnZJBqRJj9d6l
	5DZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=07reqXxoOvfGD6p1n8KH3saTzajlkN5PIF7OcGdYrZ8=;
	b=jFi4/yaEnjLRhkknN915EN6t+E/HYo6kxTcrV5iQ82kxocNW1XmRTPfJ6wx4BT1ySp
	GBPUI0z+lbNzMoafOkANC0H/Hz1ucI7sKvyZj7U05u9PhboXiaW1YsQNiXpRVRaxOYHF
	xTshPm9N7BeN63xp9xNYm8jnfox8EkcYVQ1uovUGcUDEbccULeeVrkoSb9wKffYyMvLf
	NFGMNpt/DFwQowQqb9W+Q8i5GSw37LUB38/RmGhPnTBc5qdm10/CIubAApqJoSk+AXq6
	kwg8gLyMSsNFfgB+0hHVpV3MrJ1xoegzLTfNmze+OqiXZk5uE8N5ieQRmqfLgGi9yE2g
	42HQ==
X-Gm-Message-State: ABuFfog8MnduQ7Q1SoAJEXYoEzDl1AbxvwQxIszbjwvkjIz95m5SLSEc
	bd/OxxN1dlfNlLxeT0KIBhkAFspDf3Y=
X-Google-Smtp-Source: ACcGV61F72t91fzAzOAzltbX3zO5r1jMx1KY+Vs7DrGCXO0qyxf5qmiZl4v8V2QjJ3pWQ7MvuHXcmw==
X-Received: by 2002:adf:a201:: with SMTP id
	p1-v6mr15381797wra.89.1539627187297; 
	Mon, 15 Oct 2018 11:13:07 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t3-v6sm9551698wru.47.2018.10.15.11.13.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 11:13:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2018 19:13:02 +0100
Message-Id: <20181015181302.9865-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181015181302.9865-1-ross.burton@intel.com>
References: <20181015181302.9865-1-ross.burton@intel.com>
Subject: [PATCH 2/2] python: remove the PN package entirely
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
X-List-Received-Date: Mon, 15 Oct 2018 18:13:07 -0000

Nothing should be in this package, so remove it entirely to be sure nothing does
end up in there.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.6.bb | 4 ++--
 meta/recipes-devtools/python/python_2.7.15.bb | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 72478f8663d..2a4547694ae 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -215,6 +215,8 @@ py_package_preprocess () {
 	mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-config ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}
 }
 
+PACKAGES_remove = "${PN}"
+
 # manual dependency additions
 RPROVIDES_${PN}-modules = "${PN}"
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
@@ -249,8 +251,6 @@ RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "nativesdk"
 
-RPROVIDES_${PN} += "${PN}-modules"
-
 # We want bytecode precompiled .py files (.pyc's) by default
 # but the user may set it on their own conf
 INCLUDE_PYCS ?= "1"
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index d78400b6e61..b402ad6f1e7 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -152,6 +152,7 @@ py_package_preprocess () {
 	(cd ${PKGD}; python -m py_compile ./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py)
 }
 
+PACKAGES_remove = "${PN}"
 
 # manual dependency additions
 RPROVIDES_${PN}-core = "${PN}"
@@ -181,8 +182,6 @@ RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "nativesdk"
 
-RPROVIDES_${PN} += "${PN}-modules"
-
 # We want bytecode precompiled .py files (.pyc's) by default
 # but the user may set it on their own conf
 
-- 
2.11.0


