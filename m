Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id E1B05785E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 22:18:33 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id y15so21301939lfd.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 15:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0uyYcFIg7aNAoTWUB2FyGYI/A9lE4vyOeyYARK2SXdU=;
	b=01kkqJL85mLNKgE0FvPj2IRaEPRa0+wt48Suv0FJhGihFlGxNP5uMU1X2A07FQsGlU
	ziLUNwN4z3K8rdlW8bati9JhA6iW3dLhIxqRcJR2W0PQlNYs55dney8FXQchMZUi9tBo
	4xfq1koJwUr3D/z6rkkTQW+F+jDw0ilVveFzb9gZKaYvmXikV8ry12WZT7ivK7OJoinJ
	jTnEwxtDr0vkgTBk8hVGy0wCUOleBi8UEQ5KI1BQ+PuK5ojsFGiEL+fNgFaGKpjtXp4n
	ajSzkTifKjgYuNTAG3rvlvIg35BtTCMzc90/D0oDKGm2A1EKxxpjxW88MZT7VXl7zQYc
	zg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0uyYcFIg7aNAoTWUB2FyGYI/A9lE4vyOeyYARK2SXdU=;
	b=RURPQBCS96Sg8ntcZQh62AS3ZUUMbssXtzEuqYSG3FX8W2Mb+uTHKbT8/d8Vt1K7sy
	wnfq6+vo0mStz1iT4GCmEKHBIoeYa9GhC5LgeiFXllRyWO5hZ+mOH/KvvHnUOJue+O+6
	zk2POQrllOewJI1ozu9Po80q1CIaOQVasDDSh9YChiGZVlTmZzweFYT3ZCKc2v+aVx7/
	dFcNwv16FyhgDZY5mxAB5Gsh978qfFvjiTAUWmj5MDLjxMECTPDs8832h+4FPsFTKDbn
	SrJ7zDCr4Mi+LofzeHXsGtYt7+zPFIDdwW7cJ61rtk/qQX8I0a1HuacjPNvhr/+l91rx
	beNw==
X-Gm-Message-State: AHYfb5hure1u1nMJtTCeURPNl5JbMXS1iEO4jOuzwu0NCjtbtsBa6xp8
	0bBvZwZpcwiDE468Mvo=
X-Received: by 10.25.24.105 with SMTP id o102mr6349389lfi.249.1502489913799;
	Fri, 11 Aug 2017 15:18:33 -0700 (PDT)
Received: from ubuntu.lan (c-7569e055.018-216-6762674.cust.bredbandsbolaget.se.
	[85.224.105.117])
	by smtp.gmail.com with ESMTPSA id 6sm265290lju.0.2017.08.11.15.18.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Aug 2017 15:18:33 -0700 (PDT)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
X-Google-Original-From: Oleksandr Kravchuk <hello@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 00:18:09 +0200
Message-Id: <1502489889-13867-1-git-send-email-hello@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.7.4
Cc: Oleksandr Kravchuk <hello@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] curl: upgradeto 7.54.0
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
X-List-Received-Date: Fri, 11 Aug 2017 22:18:34 -0000

Signed-off-by: Oleksandr Kravchuk <hello@oleksandr-kravchuk.com>
---
 meta/recipes-support/curl/{curl_7.53.1.bb => curl_7.54.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.53.1.bb => curl_7.54.0.bb} (94%)

diff --git a/meta/recipes-support/curl/curl_7.53.1.bb b/meta/recipes-support/curl/curl_7.54.0.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.53.1.bb
rename to meta/recipes-support/curl/curl_7.54.0.bb
index bc78ffb..ce5ca37 100644
--- a/meta/recipes-support/curl/curl_7.53.1.bb
+++ b/meta/recipes-support/curl/curl_7.54.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "fb1f03a142236840c1a77c035fa4c542"
-SRC_URI[sha256sum] = "1c7207c06d75e9136a944a2e0528337ce76f15b9ec9ae4bb30d703b59bf530e8"
+SRC_URI[md5sum] = "89bb7ba87384dfbf4f1a3f953da42458"
+SRC_URI[sha256sum] = "f50ebaf43c507fa7cc32be4b8108fa8bbd0f5022e90794388f3c7694a302ff06"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


