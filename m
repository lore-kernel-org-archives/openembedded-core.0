Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A83047714F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 13:27:19 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l66so116887833wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 05:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uis9V3LXXfolxcwIkCg1weAlz1AnqpiH/ZOpEp0ZACA=;
	b=UYoy4ABau9uO+Mg4m9e9IUy59PMER15W1/KKJVlURRKDHn0igT7o4wgZdmINjs+Ma/
	a3daZkgWT40vMHjc9/wjUKvuolYXtRSpdeMcr1XhoJleU2oF7nnpKfXfseNO64wS2498
	v1TE0w15nShiL7naQoGXpFZ3kkggp+vLi4430/B6TpRpoFzCAQtg3A7kCIV79+aDML7t
	sTQ/h9bV+jUmZI5sJzDpkJVZPv49Ne9HiM32iDllEdqpLW+N6BrFc7hQsjSduA9/rDPx
	FrMV1JAWy9hMtx+CTuFgtcMjldq/I8Tbd0H3AMUuFU1UD5+Q/3B5S+/jcFcvmoL6WM/3
	rk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uis9V3LXXfolxcwIkCg1weAlz1AnqpiH/ZOpEp0ZACA=;
	b=KnOkKRyA/sCAIZ3iWXB8prVnMIzupK2oV1Wh6JGYW9aHcsCjhsaoYofqglX+7xVT+L
	B4+RWo4jUQ0xCzcdTaPbZzbvEtZ0WvVzarOWZv1+Sc55hqBrsiKOcYdgi/j65M+Ph0fC
	/knSGjjKPYkg0UXr0+Gf1lMwvopf9338K3I/NAWA7JzMBsSf78nx2g5W2I7BRB8hr/Vc
	1fokKXUBYBd/6Gyl30E8U3InIO37K/q0TXUGH7/s4GORAPfZQ7sM5qDrwv8qwCJH25UC
	mWWD7QSs9g9IgmyIVgjDZAqKxLGCYJzSxGpqVJOP7rPRewX54esJD0lxTwHElfvgj3En
	nA3g==
X-Gm-Message-State: AG10YOSnD+1M7yRxLlwNkobd8wjOkrIDS9JVmjDp5yvpC6QExE6eov/3+WJL98nxZN+ra/e3
X-Received: by 10.194.78.175 with SMTP id c15mr29088615wjx.16.1454419640112;
	Tue, 02 Feb 2016 05:27:20 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l67sm16433764wmf.11.2016.02.02.05.27.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 05:27:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 13:27:12 +0000
Message-Id: <1454419635-10822-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454419635-10822-1-git-send-email-ross.burton@intel.com>
References: <1454419635-10822-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/5] libnl: package the libnl-cli modules in libnl-cli
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
X-List-Received-Date: Tue, 02 Feb 2016 13:27:19 -0000

The libraries that get installed into $libdir/libnl/cli/ are not development
libraries for linking against but loadable modules for the libnl-cli component,
so move them to the right package.

(From OE-Core rev: 0b485870ccee4bc3ff8689b7f9c537260ce9d415)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libnl/libnl_3.2.25.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libnl/libnl_3.2.25.bb b/meta/recipes-support/libnl/libnl_3.2.25.bb
index 2d0b2e8..cabe841 100644
--- a/meta/recipes-support/libnl/libnl_3.2.25.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.25.bb
@@ -25,13 +25,12 @@ FILES_${PN} = "${libdir}/libnl-3.so.* \
                ${sysconfdir}"
 RREPLACES_${PN} = "libnl2"
 RCONFLICTS_${PN} = "libnl2"
-FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.so \
-                    ${libdir}/libnl/cli/*/*.la"
 FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
 
 PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl ${PN}-idiag"
 FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
-                     ${libdir}/libnl/cli/*/*.so.* \
+                     ${libdir}/libnl/cli/*/*.so \
+                     ${libdir}/libnl/cli/*/*.la \
                      ${sbindir}/nl-*"
 FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
 FILES_${PN}-idiag = "${libdir}/libnl-idiag-3.so.*"
-- 
2.6.4


