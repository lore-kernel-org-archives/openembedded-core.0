Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7079477BE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 19:49:19 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id c73so5789463pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 12:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZFB7Je/h4M+5/fOb3yD/MoPXtrbW+TCAPRqfOrTiLgE=;
	b=I1bsGaiFpAb0IZhWQLPq41PsU8wl1J5Sijld5ocknQHO8HfCwOP4EQy4Bbfsg8h1Ts
	TSWJdkCDV5FYToqWYHxOe++G8HV9wF2WR9w+l0kvT1N+YEW02PhRtf1ZNAsC13qSVnbI
	WghC/I0LYAMfXajYs0tDwgBixNamxRc5VEsvyPL1+KmeYkJFF+xdneEGyAWAf04FS+iv
	HVc/+1VTwkIFSu7drGZY/RqKwJb5j+VA42sbEEpfxo3Ye6Gw9y+8TezDPVvuPVqvWcS7
	eveS7NBpwcF4VJ2iNnv1AxVcVw1b+L0SId8FGE5uz4uxUNvlJY26iuS4y9THzaAj1E9K
	8QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZFB7Je/h4M+5/fOb3yD/MoPXtrbW+TCAPRqfOrTiLgE=;
	b=psVbz7KSZXM/Z9Gz5jxGMSPrzZUSWu5DrCfo45ZCzO5GnYTJtt+I3/ZIflrcCRX7pN
	QCO9F23LoqoJWxPUHWwT/fojQLeafg0/nzYWMWudtDGvPQRMgk/XvPmhWryLfRvY1+Wp
	djbzLPRcWiPuWNalKStNx1Vm5g/sRQqzAH4StKrc8RvIrCNkNSDWZKpCQpvBJ7qhBe27
	5mw8JAQiy6Dn9061nWHK9sVEzdI30uskdx/5+zXGNEY3/CZR+kWxfBokGipn0xVXzIWA
	1N/TCnbF4FpAorrV8CHUu6K7bCDOQb0rjqQXYXf0oavGwaA2J0oUlTU4Jqo6RT4ef1H/
	g+EA==
X-Gm-Message-State: AIVw1110NhZi/MK3M9TaChkaQrGI62lQqD7JLkpeQYm6xgKSPmQF5e95
	IRYt1WUgvizNou48
X-Received: by 10.99.104.3 with SMTP id d3mr14185228pgc.278.1499370560337;
	Thu, 06 Jul 2017 12:49:20 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	e124sm2347580pfc.76.2017.07.06.12.49.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Jul 2017 12:49:19 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 12:49:02 -0700
Message-Id: <1499370542-31845-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1499370542-31845-1-git-send-email-armccurdy@gmail.com>
References: <1499370542-31845-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] mirrors.bbclass: remove stale lsof ftp mirrors
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
X-List-Received-Date: Thu, 06 Jul 2017 19:49:19 -0000

Replace with an mapping for http://www.mirrorservice.org to align
with recent changes to SRC_URI in the lsof recipe and allow
non-current lsof tar files to be found in the /OLD subdirectory.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/mirrors.bbclass | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index de2c2b9..9b72473 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -30,16 +30,7 @@ ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/ \n \
 ftp://ftp.gnutls.org/gcrypt/gnutls ${GNUPG_MIRROR}/gnutls \n \
 http://ftp.info-zip.org/pub/infozip/src/ http://mirror.switch.ch/ftp/mirror/infozip/src/ \n \
 http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/ \n \
-ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/ \n \
-ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.tau.ac.il/pub/unix/admin/ \n \
-ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.cert.dfn.de/pub/tools/admin/lsof/ \n \
-ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.fu-berlin.de/pub/unix/tools/lsof/ \n \
-ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.kaizo.org/pub/lsof/ \n \
-ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.tu-darmstadt.de/pub/sysadmin/lsof/ \n \
-ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.tux.org/pub/sites/vic.cc.purdue.edu/tools/unix/lsof/ \n \
-ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/utils/admin-tools/lsof/ \n \
-ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/Mirror/lsof/ \n \
-ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
+http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/ http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/OLD/ \n \
 ${APACHE_MIRROR}  http://www.us.apache.org/dist \n \
 ${APACHE_MIRROR}  http://archive.apache.org/dist \n \
 http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n \
-- 
2.7.4


