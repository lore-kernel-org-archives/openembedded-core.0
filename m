Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E60417D799
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 13:11:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44z0PQ6rNLz5l
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 15:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557234715;
	bh=/2jgOcv+pw2dNAhLBlmzssgjMELYzBdyNrGn7TIAr94=;
	h=From:To:Subject:Date:From;
	b=HsBok4496xP2vJvsku5lJZ+YwkhP4nN16KWeXkLpI2ZA2ZdyhLXSF1qpjKax9fXbW
	RVpzBQatBTJEy1AKD697CumU8BGyNpKlkTOMeLRvj7RiY125BjHyUtCCKFOdkwcubO
	569XUgmxwoS1y/udxNy+mCTzcMThApRksBgWU4E8G6yP9n0b7cLdwpX/MI9M6kc8jU
	L3bEwXQ/ei9C+DWFens+TkN2ZV3cGp0k2+zA18uMQpDankafA4VOTlB6nZtkKb7yOI
	tDVuWe8ehIcU33NR6X26jQhvhf5kr4uXaA+MsqhD1NgUipwtedH0+fBJRn68ntpTY/
	bQ5HD7G4M2BbNkLoPjvJaa70JETLv1F9G+tBbawh3qJNXZTTrBnvMpEMsOwGYaIISo
	6gklOgPh31IQWkNUujz03Kj5oQttXkWzRszFHN948SH9PIxv8NvosyzR3KTK08REo8
	sePB5IG0xN/3OANHPh8d1Qob2HPOOHAt/X+GHZlr2h97/QjjMVS5XCKdH91bmy5Fsw
	SWHYKHd/O1SJfXtTKX/wOk7sMxqPLQynaO/ZreC2oQoB42qJwdWT79lBi3IWljevCR
	e1bzVcOn7l5gFofj3PrX1x7/NW0Mh9gKOpNAir6Wsh08DAHRFelp5s42sPNyaYaK+H
	cbnIyn+AAQGds6mOgIBxVWtQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 16:11:47 +0300
Message-Id: <20190507131151.31070-8-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] sysstat: inherit upstream-version-is-even
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
X-List-Received-Date: Tue, 07 May 2019 13:11:54 -0000

Currently a development version is being used.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/sysstat/sysstat.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 0bc7e14d36..e7ddc02b71 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -15,7 +15,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 DEPENDS += "base-passwd"
 
 # autotools-brokensep as this package doesn't use automake
-inherit autotools-brokensep gettext systemd
+inherit autotools-brokensep gettext systemd upstream-version-is-even
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
-- 
2.17.1


