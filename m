Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABF17240E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 16:37:32 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so14650137wgh.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 08:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Kyu8twtqoTvBcK8I1NeMB0ITq0qaL5okr9GgoWRo7+c=;
	b=LhaSHWTe8jQxVAepqU2X7w6Z8y8iQtNb4PVXfe6gco3HhDyVLa6/NSpE9bt8MFcOa5
	LVmcQgJY1GPazB/t7XYg8hC4lMHSNI0N66chwxeuPsX2xX2VFftPfm0m4GBrQLri3Kgb
	ezbuLGmnyjwcNYAacW+jyHX0+OU/pUi6eTlCCqf49044UQ/qN7n9Pet+SoA6fDOJUpuj
	la8m66mGtSisWwrMrR7qg6zeVNhYAwKPY+EoRKcC/TRYv/HZFA9Nq33W4Brpl6joIqRE
	83H0zl6HRRU1tya9QuXjmXHUzAykVcA/2vi9YhY2mQ9R3CUafvJfC9Rc5p7dtKwxIb/t
	CMhg==
X-Gm-Message-State: ALoCoQnB3KUg+JG3wt4zytdv/de165TXeXyeoBhnnrJMsdaFehraGTmErh1KzLIQhUUAl7EQVHfc
X-Received: by 10.194.81.6 with SMTP id v6mr93506954wjx.39.1417451852797;
	Mon, 01 Dec 2014 08:37:32 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id l9sm1638863wic.21.2014.12.01.08.37.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 08:37:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Dec 2014 16:36:38 +0000
Message-Id: <1417451798-28112-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1417451798-28112-1-git-send-email-ross.burton@intel.com>
References: <1417451798-28112-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] python: remove spurious nativesdk dependency
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
X-List-Received-Date: Mon, 01 Dec 2014 16:37:32 -0000

There's no need to add a dependency on python-crypt_class-native to
nativesdk-openssl as the general dependency there is transformed appropriately.

Presumably this is cruft from back when SDK packages were suffixed instead of
prefixed, and there were mapping problems.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 7f13e22..9ded75b 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -163,7 +163,6 @@ RPROVIDES_${PN}-core = "${PN}"
 RRECOMMENDS_${PN}-core = "${PN}-readline"
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python-modules"
 RRECOMMENDS_${PN}-crypt = "openssl"
-RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
 
 # package libpython2
 PACKAGES =+ "lib${BPN}2"
-- 
1.7.10.4


