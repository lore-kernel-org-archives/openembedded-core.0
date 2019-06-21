Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 24E3E6011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 09:55:44 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n9so5993627wru.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 02:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Nh4XeykKhdOokdDe81FMfcf0no95jVibEn1Fy3GIEMk=;
	b=XRjg1cn9OjrvitpdkFxVXFVk8CTmqnE8N24RoTzuocR5HqPy6Lr+zc+hNrSqA8O+Jd
	h7tVm7O05O8aWERfroZosnKgcwWIYO77cSJEl7aEIBM3lyAtxMAdaaijfTNdBlpaS6aJ
	yT0BnhqDPzoX97qWNLJ7jnbBP362YYn19/vBeshh3S5SpZ112DGiJJkdMr3CcV7f8TvU
	rSb5WcgilHL4pi140Ox6S9NTSIBoIW9a9UN0iIJRGcMfsdJZwnd62gWBkAmHR9BR9PRg
	05krO7X8By73BRFjhYIKOhhRJvQvPXM9o9BAuWloC0CkfaXX3Ecf9/BR/kKK/0APpHcq
	DgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Nh4XeykKhdOokdDe81FMfcf0no95jVibEn1Fy3GIEMk=;
	b=cfJs878v7l08vKhHuoQL3pgqsSMMJM9RstAr/H0OnAZ2tBLpKXO0fo2ohHSOg7S/oq
	FH0rb6IL7Ai2VzbFC7dl7mgaCddLN2abWqy0Y9DeNpC4R07ytIQcNzkyk4MCpzephw8Y
	TiXIpcHSV94oPFXv5EbvxI162e8jSl/028lIXnu0EGOQjGLeGaNTTrXYPpgaBz5SapN7
	nZxK9nZ0ZTS5qmuOe4g4kOnJ59OBst7ve03NLUbI3kwO76flCaJ3ycHErECkA/7ADNS2
	pUAohr2xo9GCsTRaqtTvTAxMNy4b3C6RXvN5HBjFPS2DxMegAZqAyVFUZ+Jo7QUCFThv
	pw7Q==
X-Gm-Message-State: APjAAAUNMGfQSPI3IH8uC8au+UXRM95gI3n5UqnwHMfi87uQg7u8caWQ
	CA2DoyF1+Dc0CzGxYHtn2IAWNCwd6SY=
X-Google-Smtp-Source: APXvYqyvp0KLUg7NwK5qQLP6JC513e4m/aGXOqGAJeiZ+KPc1E4yySms3EI5W7Yu2HD6bejd4BWOUQ==
X-Received: by 2002:a5d:628d:: with SMTP id k13mr13460683wru.317.1561110945639;
	Fri, 21 Jun 2019 02:55:45 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d5sm2064912wrc.17.2019.06.21.02.55.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Jun 2019 02:55:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2019 10:55:41 +0100
Message-Id: <20190621095541.1198-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190621095541.1198-1-ross.burton@intel.com>
References: <20190621095541.1198-1-ross.burton@intel.com>
Subject: [PATCH 2/2] default-providers: use pigz as gzip
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
X-List-Received-Date: Fri, 21 Jun 2019 09:55:45 -0000

As pigz is compatible with gzip but faster, prefer to use pigz.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 2be3378773c..1dac58c9d50 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -54,6 +54,8 @@ PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
 PREFERRED_PROVIDER_pkgconfig ?= "pkgconfig"
 PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconfig"
 PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconfig-native"
+
+PREFERRED_RPROVIDER_gzip ?= "pigz"
 PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
 
 PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
-- 
2.11.0


