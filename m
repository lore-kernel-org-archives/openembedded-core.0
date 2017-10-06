Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B828F780B5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:18 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i124so7525659wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UjXKMXfDaOSEsw+dVYSuvHaawGa84fPAcR7vaDsGRKI=;
	b=Ftf0yO8XJjDbCyYB1ymoghz39COWs3vmBWqJIwszi8myDwgGvUz9eRShNTfK8hd/VP
	s+bTfUn2U/3D1FKD1pw7Ba13FpdnXSZfrnvB/+4MQ60VlbgSIncvQSLMTkYhoMLZeKOr
	Z7HpxVGp3uY4/9Ar9ZLiz1UlRobHl/YNLcaSEfox4vu7M2ranhYPYpasCtiOydCA0vi8
	yUeXdO9T0LNXZXP9W9YDXLRHdRSI4kGx5uPJVHHsUgBiNvgAUmiBo4+rcnv1G4MxWyUZ
	hOz58/dqDD51TjEB9xKXgeZAzGUOdMeFNSuDJfJXyWoAaZCssuhqZJgYC5B+cX/0/MZT
	Xfjw==
X-Gm-Message-State: AMCzsaXJ1SdNR3AjYxsq5njRNPQA2dSLh4fQsF9a5mh7o9vqELK3g8Ap
	FGVHwoSi92TYGY5f657bNTp2/JF6
X-Google-Smtp-Source: AOwi7QBmpYA74L+sEHfhWuIvZ53wMAYSAbfMVJFmen9obwxFt61AnIQwuiF+MpljhLxFzZg6OUo0dw==
X-Received: by 10.28.25.129 with SMTP id 123mr1557687wmz.17.1507291999282;
	Fri, 06 Oct 2017 05:13:19 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:18 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:50 +0100
Message-Id: <20171006121259.5817-9-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 08/17] debianutils: Add a native version (for run-parts)
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit 46985e66c193ad2aa9b575aeab5c78740bc5a4ed)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-support/debianutils/debianutils_4.8.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.1.bb b/meta/recipes-support/debianutils/debianutils_4.8.1.bb
index 54c345ea25..12c63ee1ea 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.1.bb
@@ -34,7 +34,7 @@ PACKAGES =+ "${PN}-run-parts"
 FILES_${PN}-run-parts = "${base_bindir}/run-parts.debianutils"
 
 RDEPENDS_${PN} += "${PN}-run-parts"
-
+RDEPENDS_${PN}_class-native = ""
 
 ALTERNATIVE_PRIORITY="30"
 ALTERNATIVE_${PN} = "add-shell installkernel remove-shell savelog tempfile which"
@@ -50,3 +50,5 @@ ALTERNATIVE_LINK_NAME[run-parts]="${base_bindir}/run-parts"
 ALTERNATIVE_LINK_NAME[savelog]="${bindir}/savelog"
 ALTERNATIVE_LINK_NAME[tempfile]="${base_bindir}/tempfile"
 ALTERNATIVE_LINK_NAME[which]="${bindir}/which"
+
+BBCLASSEXTEND = "native"
-- 
2.14.2


