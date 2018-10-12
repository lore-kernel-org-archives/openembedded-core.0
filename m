Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0494A79BA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 11:55:07 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id 61-v6so13136462wrb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/WjYoRHtVSpRthKEQTijoVpdPMv0DhmLJ5rb0vrLozA=;
	b=j3WznbmWFgFQi+9dDWHB5qQGFQAc8ho0pKyYOpAafhyZQIz2+QU/CjyQBEnK73sJpF
	pS2ouC/vGpAAyEyzYSh4FyHVrFfOxG+5cjV8dY2A9YmSGHOZBrJA0JuSO0K3dgOjpsJr
	QZ7V55BeLoQMUFsNw3O5W8sji2J13t4JoiBx4pUgr5jmJVdngLNGPglCZt0VJO3qorV6
	EiTM6MXcstI0l7bfCxTsyJZNZVlQXpReGakLR3bPMN6pb4pqqXl1ccqgbZzZRgaE/8b4
	uGfLKMaA7dBiRwYmB6xOgs1t2qYGQ6GSF8QgCV3tq/isZNwOmBFDGwSXrozIEX4wL7sg
	Ncnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/WjYoRHtVSpRthKEQTijoVpdPMv0DhmLJ5rb0vrLozA=;
	b=kK0yY8pdNn0W40Q7ZPkSEtflnLzS811jw0NWaTRkb/Whs8h5lUfvTTMtyG3/15aWf9
	fSXNUWS0bcSk7WAc7vPUBSfrgMAXquvB9/H5IP/EdAFK0RE5R1OkAkXKClSoHzk+im7i
	6FUSkY0LH+wwXHheDidC4gNN42vYQaAVn1UV5JN9/4bNzq4uX12G8lU4pKLhmBU3/uqm
	eMkG+JyL0XrZ98VzYpWFxjPWGEjEV0gjijGOQWMrIOBFx8FgHJOaOv/abTk9KwqTmJ5r
	ZO0+yQTUN9phlTXeiQHvhJIIJW0ZXKuc9VwNaHXeYQySHZUEVwBunEwP91On49mR88TZ
	wusQ==
X-Gm-Message-State: ABuFfojmP5VBo51GMQO2zSkOuJCD052T/Y5WAgZVJV/SybOmQhuDzRaZ
	WfWjVohJdh+WYCXE9O7Vi3altSz7mPI=
X-Google-Smtp-Source: ACcGV60pBFZe4g057CLNAxvlARV9klhf3bTN8tmPR/vdezLu4KBGPRdoej7rkKuw/2kGIGbzkZkTpA==
X-Received: by 2002:a5d:6b92:: with SMTP id
	n18-v6mr4633249wrx.295.1539345307437; 
	Fri, 12 Oct 2018 04:55:07 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a205-v6sm1223160wmh.19.2018.10.12.04.55.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 04:55:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 12:55:01 +0100
Message-Id: <20181012115502.14205-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181012115502.14205-1-ross.burton@intel.com>
References: <20181012115502.14205-1-ross.burton@intel.com>
Subject: [PATCH 2/3] python: remove the PN package entirely
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
X-List-Received-Date: Fri, 12 Oct 2018 11:55:08 -0000

Nothing should be in this package, so remove it entirely to be sure nothing does
end up in there.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.6.bb | 4 ++--
 meta/recipes-devtools/python/python_2.7.15.bb | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 489baa294fd..95915447ab4 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -214,6 +214,8 @@ py_package_preprocess () {
 	mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-config ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}
 }
 
+PACKAGES_remove = "${PN}"
+
 # manual dependency additions
 RPROVIDES_${PN}-modules = "${PN}"
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
@@ -244,8 +246,6 @@ FILES_${PN}-man = "${datadir}/man"
 
 BBCLASSEXTEND = "nativesdk"
 
-RPROVIDES_${PN} += "${PN}-modules"
-
 # We want bytecode precompiled .py files (.pyc's) by default
 # but the user may set it on their own conf
 INCLUDE_PYCS ?= "1"
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index f30d3f4d25c..9bf6959a0c5 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -152,6 +152,7 @@ py_package_preprocess () {
 	(cd ${PKGD}; python -m py_compile ./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py)
 }
 
+PACKAGES_remove = "${PN}"
 
 # manual dependency additions
 RPROVIDES_${PN}-core = "${PN}"
@@ -199,8 +200,6 @@ RDEPENDS_${PN}-modules_remove = "${@bb.utils.contains('PACKAGECONFIG', 'bdb', ''
 
 BBCLASSEXTEND = "nativesdk"
 
-RPROVIDES_${PN} += "${PN}-modules"
-
 # We want bytecode precompiled .py files (.pyc's) by default
 # but the user may set it on their own conf
 
-- 
2.11.0


