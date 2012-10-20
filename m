Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TPh3r-0002Zh-Ne
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Oct 2012 23:58:27 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so1118245wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2012 14:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=lJlcRZfX/gLlv3ZIU3lqktzdSLOWGVbWT8sNeWzlUW0=;
	b=INiIfPjP6EEJbCHsP88yh59NqCQ77ByXnxDPAR9qBGRET3bGuOYoBUhP9gbhX1C89A
	VxQ0/ac9gv9MImCTnuqeC16pUwNAQBhUXr+2OsT6Ky1qoFjhcY5CKNdx7Iqo2PFVEUKE
	KHfEuD5YK8nfzgrpBPDb9JzJOoO3GqedGDvrPWtZy4jz1Nq9THo6MwOVOfErC9Z1LnUV
	U4/IEQQX5svRrFiW9r+0wfJEQAD2rDre3vb0WhkTyoW5iZopRNBLYyyhbuptXcCctJAH
	UdoFjI8XZpgIwcyrBKMEjuj4Od+0s88//6/oBr2GhJtEsteQLv9DAVGztFrYa4NtTr5H
	X5KA==
Received: by 10.180.100.35 with SMTP id ev3mr27085980wib.7.1350769505321;
	Sat, 20 Oct 2012 14:45:05 -0700 (PDT)
Received: from localhost.localdomain (5-13-211-28.residential.rdsnet.ro.
	[5.13.211.28])
	by mx.google.com with ESMTPS id ei1sm11996502wid.7.2012.10.20.14.45.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 20 Oct 2012 14:45:04 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Oct 2012 00:44:54 +0300
Message-Id: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350769062.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1350769062.git.andrei@gherzan.ro>
References: <cover.1350769062.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQnRxsbmd2hjf0lWJyfgH27qgcarhcERtWiKlCb+ktq4Ow/pjmhnQtmTXj98o9qgUvqIR8Yu
Subject: [PATCH 1/4] opkg-utils: Add needed python modules as RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Oct 2012 21:58:27 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 92e6624..825c927 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
-RDEPENDS_${PN} = "python"
+RDEPENDS_${PN} = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "49cc783d8e0415059d126ae22c892988717ffda7"
 PV = "0.1.8+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
            "
-- 
1.7.9.5



