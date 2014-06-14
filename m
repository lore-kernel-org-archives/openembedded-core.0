Return-Path: <sledz@dresearch-fe.de>
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id A273060438
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 06:24:21 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 086E2E012A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 08:24:21 +0200 (CEST)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by fensuse.internal.dresearch-fe.de (Postfix) with ESMTP id BB8A2700D50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 08:24:20 +0200 (CEST)
Resent-From: Steffen Sledz <sledz@dresearch-fe.de>
Resent-To: openembedded-core <openembedded-core@lists.openembedded.org>
Resent-Date: Mon, 16 Jun 2014 08:24:20 +0200
Resent-Message-ID: <539E8D94.7050905@dresearch-fe.de>
Resent-User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
Received: by 10.58.227.9 with SMTP id rw9csp34855vec;
	Sat, 14 Jun 2014 12:44:23 -0700 (PDT)
X-Received: by 10.180.106.1 with SMTP id gq1mr14586543wib.45.1402775062594;
	Sat, 14 Jun 2014 12:44:22 -0700 (PDT)
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTP id
	f16si12145764wjn.130.2014.06.14.12.44.22 for <sledz@dresearch-fe.de>;
	Sat, 14 Jun 2014 12:44:22 -0700 (PDT)
Received-SPF: none (google.com: sledz@dresearch-fe.de does not designate
	permitted sender hosts) client-ip=217.92.177.116; 
Authentication-Results: mx.google.com;
	spf=neutral (google.com: sledz@dresearch-fe.de does not designate
	permitted sender hosts) smtp.mail=sledz@dresearch-fe.de
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 657ECE0161;
	Sat, 14 Jun 2014 21:44:21 +0200 (CEST)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 3E46C700D38; Sat, 14 Jun 2014 21:44:19 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Jun 2014 21:44:09 +0200
Message-Id: <1402775049-3165-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][daisy][PATCH] live555: fix fetch problem
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
X-List-Received-Date: Mon, 16 Jun 2014 06:24:25 -0000

live.2013.04.30.tar.gz is no longer available at original live555 url
and the url of the FreeBSD mirror has changed according to[1].

[1] <http://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/README.txt>

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 meta-oe/recipes-multimedia/live555/live555.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index a36177d..0c8208a 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -7,13 +7,13 @@ HOMEPAGE = "http://live.com/"
 LICENSE = "LGPLv3"
 SECTION = "devel"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 URLV = "${@d.getVar('PV',1)[0:4]}.${@d.getVar('PV',1)[4:6]}.${@d.getVar('PV',1)[6:8]}"
 SRC_URI = "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
            file://config.linux-cross"
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
-MIRRORS += "http://www.live555.com/liveMedia/public/ http://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/ \n"
+MIRRORS += "http://www.live555.com/liveMedia/public/ http://distcache.FreeBSD.org/ports-distfiles/ \n"
 
 S = "${WORKDIR}/live"
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.9.3


