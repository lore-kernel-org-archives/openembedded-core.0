Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 090C67F9C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjp4mqSz6w
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281278;
	bh=+TDQ5Cfn5/Gc3qJmxrM1jMQ81rkq78JUQsugVpTxDG4=;
	h=From:To:Subject:Date:From;
	b=GaeWY4g+jqmUA79/ugEGz0HDZPuL3oba3HIKtelRxeBR4xQ3fEKv3pKntcu8pkmot
	f/aDJzhKoNgR4Ct4K/snsi7hdGtGsSW2uZ95GB7ckZPHwUbzz7U519GCGdiyK+6QAg
	0ZPnpqc8Mwk6niAQSVSO5xxrfNcNk7aAZuEnrcS0C3kDNoz5ghZXQXA4kJ40Ne9tjd
	yS2pZHLj4sl+I2wR9Ea2mCZc4HIUhx730U7WZ30jLO2kB5X653d9vZaJoBFHsGSJDI
	gfutAhigBDa00XYXPD69B0+G3UPl5M0eT9Z9yRLeTi3kN1k64yDNiGj84fJQvoVLlU
	djF2uMdUxWT28XvRAky4STU8H8KItStZZZRK0EyOzF37uuAp9M4yE5XyBtM7v1E4zY
	UjzUM16ZUn+4yVBO2i0c9WoL1sO2mqa0Zn7lGd7zstrNLuIRIk3Djc4O7ribWpnPxj
	7wjiDlGTAlS+O/oGq/1mGhNDIOnQu63IYIjUGLaWoiNUa+4WQaUAOS8v6Nx/ijDlkM
	pwFK0KsQZWBfBT8gGbNIl0vuN7pSbNr26V0v4nGEipuVsZFAj4zdv5KYb3wlmTrBi7
	PG4xQwF9dIL7FHKh+YPXH+AMnov8xPHnFe9ZBDcDPXDpt+ZAt6SVJB4xKGxsSpffe0
	e7wRFe/25kdK8Beu4xk5lkHE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:24 +0200
Message-Id: <20200117171436.17131-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] bind: Whitelist CVE-2019-6470
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:38 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bind/bind_9.11.5-P4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
index 4fc0f19875..5d52b696c8 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
@@ -37,6 +37,10 @@ UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
 RECIPE_NO_UPDATE_REASON = "9.11 is LTS 2021"
 
+# BIND >= 9.11.2 need dhcpd >= 4.4.0,
+# don't report it here since dhcpd is already recent enough.
+CVE_CHECK_WHITELIST += "CVE-2019-6470"
+
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_script
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/bind9-config ${PN}:${bindir}/isc-config.sh"
-- 
2.17.1


