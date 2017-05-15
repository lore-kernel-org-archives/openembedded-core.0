Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 664E072F62
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 13:27:17 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id o5so42669920ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 06:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=PcVFIJcTj44K46bEG1Tao5JsHa0OW9lhw9LhQb9wBQA=;
	b=YUNA/QVx18JKbpv1VGLHYBMjFOWaJgcAUoUWsz/G6soxRk+OA9R46//NKeGYN2Tyhy
	ibDc3V+kXZbWoGxruRJJALVQIksnp53ex4Qov/MlpcFbk14l9NUbvwroqkK9Dv2YOMmB
	X7rNhvpsiwMW0mpBiFm6OmX00Oc3sx6EKBWlAoecl76mjBg9U3QsymTJdXtZdODaMvjC
	06zkOSVKvilXUziiwsoyPLsTsYCweX3qG9HpkiRaSssmTgxwJGOo3oJ1pn6ZhYwXJzXS
	oZzNWaxspTlXvCmFaYI5bIGfKXXV+O6UVmvaXWciNay9T1bZoWYX53MS4g5gg/Np8mdr
	cTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PcVFIJcTj44K46bEG1Tao5JsHa0OW9lhw9LhQb9wBQA=;
	b=JDoipSl60RtOGg9SQDSgdo2sa1QlbbjtfUtIsQfgNeEr/McOiuc1evg6xpeJXnTpa2
	LOx1AjBExk9Y8EGCIMP0Cc20BiefqpyKyKSNC7e/4rwN57qAsDrimRsEIDPI0/pKZAcO
	aVlRssk2yX4lNhHD5qgY1nhZsnncBLDkPtFRfMhwOILJ2YLSfFu3xDOntDNUvk9LOReh
	9MzwqGylqS/hzvQmb/5i46WF1mAMmCXgxoS2HrDHBxQAZtwDxqIzVyYVdQiNJkUl7Y4E
	oAzVlIbu1znzjkgBhZMNM/E8IqkXI5weAxsgErMx3zEk5xCFP/9+Xn7BMVRPO1cbXOAX
	7NJA==
X-Gm-Message-State: AODbwcDc6PHdV8Cgw5hn/zc586Mm58KWbxryxLxg3CKn4uooYm/WHsZa
	kJjGKX6PlhwGdW9C
X-Received: by 10.36.79.6 with SMTP id c6mr5588827itb.45.1494854839500;
	Mon, 15 May 2017 06:27:19 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F79A.dip0.t-ipconnect.de.
	[93.232.247.154])
	by smtp.gmail.com with ESMTPSA id c7sm4537765itc.14.2017.05.15.06.27.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 May 2017 06:27:18 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 15:27:00 +0200
Message-Id: <03d0eb17ea71592f55122e659da74d1a1a7d6572.1494854721.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
Subject: [RFC][PATCH 3/6] defaultsetup.conf: enable special "debug-build" DISTRO_FEATURES support
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
X-List-Received-Date: Mon, 15 May 2017 13:27:18 -0000

The changes introduced by build-mode.bbclass should be simple enough
that they can be enabled by default. Doing so helps establish
"debug-build" consistently in different distros.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/conf/distro/defaultsetup.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index ca2f917..fc7cee6 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -20,5 +20,5 @@ CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
 INHERIT_BLACKLIST = "blacklist"
-INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
+INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool build-mode"
 INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST}"
-- 
git-series 0.9.1

