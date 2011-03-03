Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pv2Qi-0007vj-9I
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 07:54:32 +0100
Received: by yxn22 with SMTP id 22so268042yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 22:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=2OdWNXavES1LKy1FTiXv0BkuoXAmFQW+KptQUYf3lLw=;
	b=rX1Vo1xC4BXcfJ1Ynjct0uQXkS0da5Tq4ssEW3eXBWtXsJ+yHPPkgigLTehPzpCag1
	/D8NyPymCHCbtG+50nvvR2As/gXzanhBgO8AsngyFOSKt3uZvV8DcFElUmUuHkNZaNsK
	6N9TWQ58WKmaSZp+cvWsUdl4+5nwVDwTTKJ68=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Mie+i7k6lETi4ULTyODhzeQRSfDvcKCuBhHzpNXfsyRe4nJFP6uScMoNipx3/pdkB8
	zMI161t0rGPAmF7Rpp/Og4E/b5bNCSLx8sMiXe/bbxgvWJ9EN3bUhjsYSPbfC7GzT07C
	ZY2a/kidrBIrcF4p9RuC0nK3S4GK2bSXCKR/k=
Received: by 10.91.64.2 with SMTP id r2mr1384270agk.133.1299135183865;
	Wed, 02 Mar 2011 22:53:03 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g27sm595767yhc.8.2011.03.02.22.53.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 22:53:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 22:52:46 -0800
Message-Id: <1299135167-18330-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCHv3 5/6] poky-default.inc: Change LINUXLIBCVERSION "2.6.36" -> "2.6.37.2"
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
X-List-Received-Date: Thu, 03 Mar 2011 06:54:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/poky-default.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/poky-default.inc b/meta/conf/distro/include/poky-default.inc
index ef9f5cf..3ec5e1d 100644
--- a/meta/conf/distro/include/poky-default.inc
+++ b/meta/conf/distro/include/poky-default.inc
@@ -19,7 +19,7 @@ GCCVERSION ?= "4.5.1"
 SDKGCCVERSION ?= "4.5.1"
 BINUVERSION ?= "2.21"
 GLIBCVERSION ?= "2.10.1"
-LINUXLIBCVERSION ?= "2.6.36"
+LINUXLIBCVERSION ?= "2.6.37.2"
 
 # Temporary preferred version overrides for PPC
 PREFERRED_VERSION_u-boot-mkimage-native_powerpc ?= "2009.08"
-- 
1.7.4.1



