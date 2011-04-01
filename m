Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W3H-0005Pe-5Y
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:33:39 +0200
Received: by iye7 with SMTP id 7so3387746iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=qEEC/dHKPdgTf8rFl8mIkVHL+QqIHyXrzOI5ij4SU3Y=;
	b=M4tcCT6javX4guzJsQOJ/Wqr8DaNycrP9OtL8toj70omh3vNW785vmsUN3aoDkwJQy
	akuHKW93Lal9Ih+dlytjPl8tmjTUfTYwRivEYnrgY68coFfRsK+nYQi1KSAjc5txMdh4
	AnvRoDrJwjb9m6MHNrPMB43ZEa7XVljrffwTw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wwWIllx2siJNL/iKSWgrEfweQzEEkB/YVWmVamJWF/di+FCveVLA+8IHlK3EOFaFxO
	W7VKGyKmCN8PQE8R5JCvNR2qD1DMMYq8IAXi1y1Qp7hr6ced131sRrDWqAmlcBl2g5hB
	cQthxLJwD3d8J1f1ZS+T8J2HBL+fdPMdhDTTY=
Received: by 10.42.130.198 with SMTP id w6mr27742ics.496.1301632154057;
	Thu, 31 Mar 2011 21:29:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c1sm1178980ibe.49.2011.03.31.21.29.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:05 -0700
Message-Id: <66720fa73fc69afbf4055ef8adb6255fedac6545.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 18/46] diffstat_1.54.bb: inherit gettext class instead of adding gettext to DEPENDS directly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2011 04:33:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/diffstat/diffstat_1.54.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.54.bb b/meta/recipes-devtools/diffstat/diffstat_1.54.bb
index fc505f9..6eda411 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.54.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.54.bb
@@ -5,7 +5,6 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 PRIORITY = "optional"
 SECTION = "devel"
-DEPENDS = "gettext"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://install-sh;endline=42;md5=b3549726c1022bee09c174c72a0ca4a5"
 PR = "r0"
@@ -17,7 +16,7 @@ SRC_URI[sha256sum] = "d8e67660ec85be597f8548ecdd088926639dac34ec7184aaf9d09c1e6e
 
 S = "${WORKDIR}/diffstat-${PV}"
 
-inherit autotools
+inherit autotools gettext
 
 do_configure () {
 	if [ ! -e acinclude.m4 ]; then
-- 
1.7.4.1



