Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 33DC97EB3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 13:25:07 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v14so6298737wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JPbBubj8ulWhewGHjRP4h6VyjoIloYC301tPmZsdppM=;
	b=tpTzraTXfroTHFGwtLlZTc5n0n9hPRY8jhba+TQlwcByXoIjG6xrtOqDov6XqQXRhG
	pkTTQJTqc0XCppbmtIYYNvdX55hCTjY4hqM9PosvsWMdolz9dYh9/CB+pi+YvKkUiRLD
	pT+kVEZvFN/yNFfzoqGaXAgJCvmifxp+Iid58CHH8binFM2XneC08I63QfhcqR1JRPeu
	KORZh+ykwT7f21f9SXUjvQwqH3jf7LcgQzrP2DtZ7dITZkZmcH1vBEZzxs7/zbH2NpTd
	FAzaZORY7eCGEroPSw5920mPZlEOrBRQsl1SnlFLrJs+e2ehj9vUKOXpNDAxJA+9DP5j
	fKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JPbBubj8ulWhewGHjRP4h6VyjoIloYC301tPmZsdppM=;
	b=NZPRAoI/L9cDv5f2CIDK0Uj6So70MkYWqA4B9cjG82i4AM67d6CslBpRrFFbb4OQiA
	jHz7V5B51vHDwqN0oUFe7RIX6GKFMvVIBwpPnUp30D2kvvfiYSIps9ndWR2/dPUcmjgq
	O8H6OLsAl1H7Mm3bteVrCNHNQNrRI5T5PwEPL6b0YaRh1hJMNtGltBfh7Os4NLVn32za
	6qsbJsY+dtHok9jPu/ytsDKNc0+V5NxgZXd+WRAB+oEUtBM/SpsxJAkGj6nJuJrlPdKY
	M/dRK5stmsyuQTgEL/JyLqQGdWpH/sh9tQQRXvpb1GEBrwOAkZUKE7Ef4rH4b9u7ED78
	R+5w==
X-Gm-Message-State: APjAAAUmMYx129zuKELaWIR0QJknKwd/7TjlJAB5f2I8mB3S7/8qc/3Y
	IwFFk9acuGzQSTGPOfUC+SGGBexN
X-Google-Smtp-Source: APXvYqw2cUuEWHW0Fg1gdEpbCFd991wbb6kam6tktkKv5NGGyJ5bpxYxlmeEFwXuC4PzkPQXKQTXPA==
X-Received: by 2002:adf:f28a:: with SMTP id k10mr8363166wro.343.1561728307767; 
	Fri, 28 Jun 2019 06:25:07 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id z6sm2158338wrw.2.2019.06.28.06.25.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jun 2019 06:25:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2019 15:24:53 +0200
Message-Id: <20190628132457.39465-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628132457.39465-1-alex.kanavin@gmail.com>
References: <20190628132457.39465-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/6] mobile-broadband-provider-info: upgrade 20190116 -> 20190618
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
X-List-Received-Date: Fri, 28 Jun 2019 13:25:07 -0000

The new version is using xsltproc utility

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mobile-broadband-provider-info_git.bb                   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 77adcebbae7..0b0bbab168e 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -3,11 +3,13 @@ HOMEPAGE = "http://live.gnome.org/NetworkManager/MobileBroadband/ServiceProvider
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
-SRCREV = "c7def60ba50d9cc30a90f69f89d7e82243501e86"
-PV = "20190116"
+SRCREV = "22b49d86fb7aded2c195a9d49e5924da696b3228"
+PV = "20190618"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https"
 S = "${WORKDIR}/git"
 
 inherit autotools
+
+DEPENDS += "libxslt-native"
-- 
2.17.1


