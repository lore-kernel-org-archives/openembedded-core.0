Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id BA0827D42D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 20:54:19 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id z1so3357679ljb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 13:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=RaveMAlw8hfurblxUX4osqdmVgEn1D+SAhZuUgRIK6U=;
	b=R81l/KfwH3JyTwuUoBB0X4VZZ9W9Wuq1gVqhrUpapBGOJeeyFnvnlwta1+FB+P7s8V
	b2X7xG437a1s2DMQ4Cx5qG8ckBA5Pe95QQAtCuNRRSk0X7h0ta0xGl/xVX1Tiz4q9B1P
	Z1UihTYzpfgSONo33EUYq/sYKH10j/NlhAuGr7NkRQyvnaHZ09qD9ZSMWPYr0RdBGl+G
	E7wBMz7BIjtvnlcnBbkM6lRZz3jBxHyzeTdvamrBAiLqsYdTR2WhLYFG0MINyK/xBJu0
	GfM1rvbfEKfjEz4D3mR9vXDFFG9pGsC7TgX95EX4Caf3ebzd41rJ39Ovn764bW1muYoc
	4EQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RaveMAlw8hfurblxUX4osqdmVgEn1D+SAhZuUgRIK6U=;
	b=YS/Ie3QEDnPnRim0bbbFzKxa/IgOrnOV2WMaP7bxxlSe5hod6DGXo87hs7DVDJRrdt
	bQ3CAuV5yKSKqBoQN57GanxDk0Uh0oBHpXJNMTTd1vybW8xs8mQGOtF1YhGobEmRywGf
	65zQb/CzO2cAF7Q6ryw7/xO1GzYPwG/m0xwWjUDdlF25vsy7Tcw+ZMPp9erqm/AU25y5
	Vf4W7mwj8H48TlSqDiIpm+lx3xhkn4QOUMiblxCil7PvVOHgBbPNlu6KTQfuaBME54lW
	KQEzhnJcHWwFmD1CQVuuW3vNnPuaMpUAionkFsFnngiv4nRr1FYXXraBKK5O6w0A8iWL
	vqrg==
X-Gm-Message-State: APjAAAVZ9Gay486L5z2NrTMGb9Zl0QEDt9C7d9r2Lk09iBGC8pDuUWi2
	5j8rvzWnTaJMe1w7QAm1oir/1AMunl4=
X-Google-Smtp-Source: APXvYqwt9cN5s1jz5w8SqM5VWRsP0pANyvjhMDmSkvGpPtpFBcF4/rhXW7Wc5pzFrN8BJUt6ygZoJA==
X-Received: by 2002:a2e:95c7:: with SMTP id y7mr6397364ljh.29.1557262459974;
	Tue, 07 May 2019 13:54:19 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id c7sm3890385lja.90.2019.05.07.13.54.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 13:54:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 22:54:16 +0200
Message-Id: <20190507205416.19119-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] mtools: update to 1.8.4
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
X-List-Received-Date: Tue, 07 May 2019 20:54:20 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../msmtp/{msmtp_1.8.3.bb => msmtp_1.8.4.bb}              | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.3.bb => msmtp_1.8.4.bb} (84%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.3.bb b/meta/recipes-extended/msmtp/msmtp_1.8.4.bb
similarity index 84%
rename from meta/recipes-extended/msmtp/msmtp_1.8.3.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.4.bb
index 9f28d6ac25..888c1bbb5a 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.3.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.4.bb
@@ -6,15 +6,13 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 DEPENDS = "zlib gnutls"
 
-#COPYING or Licence
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
-SRC_URI[md5sum] = "0c0be51e6872e818f78bd6924636327b"
-SRC_URI[sha256sum] = "3cb2eefd33d048f0f82de100ef39a494e44fd1485e376ead31f733d2f36b92b4"
+SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
+SRC_URI[md5sum] = "abfabb92f0461137f3c09cd16d98fc9b"
+SRC_URI[sha256sum] = "e5dd7fe95bc8e2f5eea3e4894ec9628252f30bd700a7fd1a568b10efa91129f7"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.17.1


