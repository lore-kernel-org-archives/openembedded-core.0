Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E7128613D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 21:27:53 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a6so2264672wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 13:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3ZhjMgukdnQn3ClOAdv55tGdu0HA5rd20wsM+0MTDxs=;
	b=IFuhhWxEEBZ0iYAERSBLVKQlKfp5UJ9+FVyU1PBc84pafEHvk9B6F59+G8z9n8zzP5
	oet6LgrB4gywHVzYi4KoLh61Rgjaf9tTXqgMBWjhJ2EUFuzOoQbKFILMrf2lNOcgOMYD
	iG4XaB7aY0syEGG4lkZptVoYYR0TNdvHOjoiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3ZhjMgukdnQn3ClOAdv55tGdu0HA5rd20wsM+0MTDxs=;
	b=kaBNxxb7+RNj3BXWAAbPdZZDK/gaSOlzx+kztN8g7IRJTD/LKGqdDhyaH15xtlQ/Sc
	s9MEWpJyl3lBcM3OXAcuw0cuaea7tyEn7TYQTNJBoj+TL16LPWvqQy1vzKpf/eTh43GA
	lmmUVQSjwwyYLI6irQ7s8SPUYg6RtjlTk4MWg61uBlmeRw9XJmrYwBdidF6ND9VRIRZ3
	buB1X8avvjvULwHRZskpnii65W+LzrDRdMb1kERzPmQp1cmrxh0KrTxkl3dt63RTyDnZ
	PNoHFQ2f8vEQIGIkEOIXS6+4UULFtdMGKiJm0onb/xe62QILGNXtBsIn13t66dQV2fDP
	5X7g==
X-Gm-Message-State: APjAAAV651qszlBcZ5wn8Lmlu6xHDoHFtvJgs5u5k7/XE2SnstEp03lg
	y6AxdqkOb5LhBP2l2oqhyVcukSIYdSs=
X-Google-Smtp-Source: APXvYqzRkj2i+XSeycBIPxI27MujX5WMamFtJua6hwD3Guzd4hOFR5USdbv2agJZ/v6aNbWAu5Z5xg==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr12688494wmg.66.1582147674220; 
	Wed, 19 Feb 2020 13:27:54 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e16sm1329413wrs.73.2020.02.19.13.27.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 13:27:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 21:27:52 +0000
Message-Id: <20200219212752.135948-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] lttng-tools: upgrade 2.11.0 -> 2.11.2
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
X-List-Received-Date: Wed, 19 Feb 2020 21:27:54 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-tools_2.11.0.bb => lttng-tools_2.11.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.11.0.bb => lttng-tools_2.11.2.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb
index 9cb896314b8..36a19ec18d8 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb
@@ -36,8 +36,8 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-tests-regression-disable-the-tools-live-tests.patch \
            "
 
-SRC_URI[md5sum] = "e6c23244a36e2a09783d03a362eb63cb"
-SRC_URI[sha256sum] = "dce493c82db673c96049b5fad155a760fa449fab3d92467a69fcb0ddaf3f0fbc"
+SRC_URI[md5sum] = "68ed78f7fa4235477ea577e48b3cd245"
+SRC_URI[sha256sum] = "936477305b25f65c5dd22db9161287d30a309ce868b6180857b1fd1fb5e6a56b"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.25.0


