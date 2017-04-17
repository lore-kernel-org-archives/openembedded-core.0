Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id CF6BF60191
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 13:39:27 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d131so19396122qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 06:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UR1hjL0DybBpCUDTrsSfjFEyt2Ur+7Cj784P4GMMajo=;
	b=k4LWW9iF5Xqwh3O+dpRi7fp7OfX4zLPFQqjpuMQoPAkmmqJ187FI1suFtO1nkjpnHN
	Ut+CrK5HixvaZ5NPw+qBbUJ+dWmaRt8WgPsT75yfSkdiCE6xPs4MrRxg650HpwIaI2ob
	5B68hFcJOcSFKaVtn5/yeRzNc4f+RmkAycEs1rerKD7G9URYjwa7OGuwhKshwYDTO4zh
	wlzeNEnXODtDo0UPKZLt0lPwDPP83WaKHygZz8QNcZPerRj0P2SLJ4DRZszq1FE0/S9N
	D9mGrvlavpUQFEswYiTvAxC4pvwtMJH4XBkEG5y/rdtSgk/vtjCREcpzXUJkA5+Eub/r
	jRbw==
X-Gm-Message-State: AN3rC/5MJMvIVNEVd9lFvd9uLXKtXm3bt1qZ1Nj9eupZLKs1i+oDb2ep
	Lq6RTS57pN9g3FG2
X-Received: by 10.55.179.67 with SMTP id c64mr7188652qkf.218.1492436369012;
	Mon, 17 Apr 2017 06:39:29 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	r24sm7257707qkl.54.2017.04.17.06.39.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Apr 2017 06:39:28 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Apr 2017 09:38:52 -0400
Message-Id: <1492436338-32048-3-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
References: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv2 2/8] bluez5: remove libasound-module references
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
X-List-Received-Date: Mon, 17 Apr 2017 13:39:28 -0000

Cleanup references to libasound-module since this code has been
completly removed from Bluez.

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 11cf8fb..4244fc8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -79,14 +79,11 @@ do_install_append() {
         sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
 }
 
-ALLOW_EMPTY_libasound-module-bluez = "1"
-PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
+PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
 
-FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
 FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${systemd_unitdir}/ ${datadir}/dbus-1"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
-  ${libdir}/alsa-lib/*.la \
 "
 
 FILES_${PN}-obex = "${libexecdir}/bluetooth/obexd \
-- 
2.7.4


