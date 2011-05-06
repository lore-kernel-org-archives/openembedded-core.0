Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIDCi-0003du-5v
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 07:03:52 +0200
Received: by pwj9 with SMTP id 9so1331076pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2011 22:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=FSm3qbXketB3wjVIfB2PV4HM2oDH7FDFfDxVuojHtjc=;
	b=QKG+1LZg1UXgDNvSxPCHQGxqzC7gW7GUATtWpsvPONgTJCUTMacslSlJtn8DUWMG6e
	c2by/S4AxD/WKdJFaGJtbyIPrFbod9ZLTKTWRGN4bCoky+bJ9fIx1Pqw/S+IEhuMKWGf
	fSqenljrU+hZQisXC18JFAkAUKIBkSzZtRKBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=fmzz/SxxwBecTGythsXITHc2drpcfz53yGu1roUvbAh8fwr2pTdDCuTXySK30G2M5L
	213fUEkcHOYF1/0/mqztOqkt7XeaiwQx6YTgvLb0EBZilA+e02hRQMKRARGIsJq1XqXA
	dtsNaELQipaZ4ooSqeiIW48pxKottnsbTdk58=
Received: by 10.68.17.6 with SMTP id k6mr4105303pbd.191.1304658070400;
	Thu, 05 May 2011 22:01:10 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id e4sm1898287pbj.4.2011.05.05.22.01.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 May 2011 22:01:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu,  5 May 2011 22:00:53 -0700
Message-Id: <1304658053-15502-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] conf/layer.conf: Use .= to append to BBPATH and += for BBFILES
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
X-List-Received-Date: Fri, 06 May 2011 05:03:52 -0000

This helps bitbake in organising BBPATH and BBFILES with given
BBFILE_PRIORITY order

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/layer.conf |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 5287417..3f63c7d 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -1,9 +1,8 @@
 BBPATH ?= ""
 # We have a conf and classes directory, add to BBPATH
-BBPATH := "${BBPATH}:${LAYERDIR}"
-
+BBPATH .= ":${LAYERDIR}"
 # We have a packages directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
+BBFILES += "${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "normal"
 BBFILE_PATTERN_normal := "^${LAYERDIR}/"
-- 
1.7.4.1



