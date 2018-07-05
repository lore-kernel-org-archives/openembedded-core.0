Return-Path: <freebendy@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6599378A52
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 11:39:35 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id m16-v6so1130502pls.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bnlNPbKE958nVVNfAWJExIiGmA6kxTFCxdR3iLRyIYg=;
	b=geBaGuYGglOb4VdSi4gvvv5JhOklwFtKtw4FjkO/ykCqPlH5K2TTWtITV0wt5XTmwd
	bXlyK/JplLXuQfv5g87Tse7W5MGV5xf1o7hm9Q+WrxjU0n/3HwilKuJ7K2sWmY9rvNWt
	sOyuOZbRjG1HPWEYnK4KNTHa5QN5YLCDkincUA8uX6t7WMHnFBZghxnk5uE9TgXQTChR
	bvg7s/RJY7xgR6cPG8eM9oHEzD9SEBtIY6+++sj2eZSbUDNIYhr3Hgsp1IC7Pg5kjk8P
	+2fjxiQ+tn1Omzo7aDQP5Z781nA2r0X3Ydp53m+5ueqJL0uTYtA1na4k6SMeKHVp1B/s
	6GbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bnlNPbKE958nVVNfAWJExIiGmA6kxTFCxdR3iLRyIYg=;
	b=jSccMjZn1FVcXSXEn1FegjRthk3Uf9KNfjUB5BmCeDy9kfo3HuwdUPDpNRJ+KAPTjP
	205SaZP/9lUh1hor++bYE+KhYM2N61mZWVCkg4m75g5XtGPdWsU51ozOo6Y+UAWKUWDw
	LYCrKHEmJ8fy8Ju7XxUHxvrKROFisFJfjnunr1jn/nmGW/eOT5LPtk3ATTyIEADF+UUg
	3TBdCAcPURqYKt793ikQwPfJ77ovKfVggrUWs+f9hiL8JbCmI5V7iS26BvBHUkv0MCxK
	UGb7i2Tw2d5xbpONV2Dzl+Su0fAZQPXLbkvDW+2LmqZOozi2Zg8VFgzuzAt9MBt9+280
	axyQ==
X-Gm-Message-State: APt69E0gTVrVuB2lrkdkl+15sjFEBLuYxYhZnWwrvQhKg6eIvYauiyZn
	K07vjaZ6F+qcSKRkaOkrTihkGT0=
X-Google-Smtp-Source: AAOMgpf0by+/gQxs+Nu//kp2YKS3XamncI43IB4loPMddI1+Bd0JptCWEYq4asWWi/ZHcPezBFFTog==
X-Received: by 2002:a17:902:8a87:: with SMTP id
	p7-v6mr5763771plo.281.1530790776297; 
	Thu, 05 Jul 2018 04:39:36 -0700 (PDT)
Received: from localhost.localdomain ([116.7.217.100])
	by smtp.gmail.com with ESMTPSA id
	v6-v6sm27313417pfa.28.2018.07.05.04.39.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 04:39:35 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2018 19:36:59 +0800
Message-Id: <20180705113659.4198-1-freebendy@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] curl: support mbedtls in PACKAGECONFIG
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
X-List-Received-Date: Thu, 05 Jul 2018 11:39:35 -0000

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta/recipes-support/curl/curl_7.60.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_7.60.0.bb b/meta/recipes-support/curl/curl_7.60.0.bb
index fe04fa63c9..50c90518d4 100644
--- a/meta/recipes-support/curl/curl_7.60.0.bb
+++ b/meta/recipes-support/curl/curl_7.60.0.bb
@@ -31,6 +31,7 @@ PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
 PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
 PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
+PACKAGECONFIG[mbedtls] = "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls"
 PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
 PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
 PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
-- 
2.11.0


