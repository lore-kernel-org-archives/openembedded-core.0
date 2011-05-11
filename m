Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QK2yV-0007ri-UT
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 08:32:48 +0200
Received: by mail-px0-f172.google.com with SMTP id 6so159437pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 23:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=cygWR7HIQm/GfismZ1ajIMVpwWti7XVP4YSJSWlU/AA=;
	b=hcsxxvqjYq+24JF9zltF1nUxuKLdrgsrQK7TggAh4Ss0fDyUxOWt3yUvraGmfZ73eh
	Ivi4ZB6/5gEMKYQcuP+PG9CkPxII5hKTNcCcBLQ0HniRdw+3exITzzVnOPCeDNO/xQs4
	gSmeXSHajsR2IWp1OtwFJEQxT/wRI1cpM+dl8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bk0G73/lTLeL0366BvgWI88oI+/g1IwoereQzOZxpDThFJ10Me6JPqF2lvtI8W/rBT
	EI8pb59GQGfxXyZGQBgAh0qjvfk4ZhpPr3U2H/oT/9rF0Son5B9umpCCBLu4P8ijk+Td
	YfxHZ3F9lcxkyG7wb8IexlzsUXAFuNVlnXQDo=
Received: by 10.68.22.1 with SMTP id z1mr13112922pbe.36.1305095403623;
	Tue, 10 May 2011 23:30:03 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q20sm5312348pbt.72.2011.05.10.23.30.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 23:30:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2011 23:29:59 -0700
Message-Id: <b04796a2532bb3f1533fe2dd5f101eab34098188.1305095232.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305095232.git.raj.khem@gmail.com>
References: <cover.1305095232.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] meta/conf/layer.conf: Remove packages/*bb from BBFILES
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
X-List-Received-Date: Wed, 11 May 2011 06:32:48 -0000

packages directory has been divided into recipes-*/ dirs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/layer.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 3f63c7d..ad95405 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -2,7 +2,7 @@ BBPATH ?= ""
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 # We have a packages directory, add to BBFILES
-BBFILES += "${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "normal"
 BBFILE_PATTERN_normal := "^${LAYERDIR}/"
-- 
1.7.4.1



