Return-Path: <mdurnev@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id EDAA36E7AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 06:28:57 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id jt11so6895501pbb.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 22:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zRVJL37GusGUaK5fITBIPNUlcllrAsZ88YoN2OJvK1A=;
	b=XYbKs8nZhjtbUebBYfsyLZXx42XwLRUBD6pki0DownG/RIvjSSnfX7qida9cRwfxuM
	AbpPgnQYTxD1DTNjTu0J2TKBzoFbCD94oxls6yk/iDmlwX4HlCtu/PvPE/WlVgdoUpCc
	rrSKKcE1e8j1MAuptEP3V3yYHY43WDMFWvHPd+kZn+0as1N+HquzJUxkoDX0kF7mJvnb
	67ZbSIyAdQFtp6VrNILCXvEClrNyGl4lA1wDMi5N9zoh8e4AQ8d9k93dutKj6GGYdkwr
	RbPhLwjFjxX+lR1OMw49yxv6DiIispQ15SowoaJ8F4wWaNNfVnEDU+Ugd/b/kirlx/VO
	H1FQ==
X-Received: by 10.66.181.70 with SMTP id du6mr35086331pac.122.1390890539265;
	Mon, 27 Jan 2014 22:28:59 -0800 (PST)
Received: from workstation.mgc.mentorg.com (86-102-16-90.xdsl.primorye.ru.
	[86.102.16.90]) by mx.google.com with ESMTPSA id
	yi8sm102688392pab.16.2014.01.27.22.28.56 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Jan 2014 22:28:58 -0800 (PST)
From: mdurnev@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 17:28:45 +1100
Message-Id: <1390890525-14160-1-git-send-email-Mikhail_Durnev@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] wpa-supplicant: Add dependency on openssl
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
X-List-Received-Date: Tue, 28 Jan 2014 06:28:58 -0000

From: Mikhail Durnev <Mikhail_Durnev@mentor.com>

Building of wpa-supplicant failed due to missing dependency on openssl:
crypto_openssl.c:10:30: fatal error: openssl/opensslv.h: No such file or directory

Signed-off-by: Mikhail Durnev <Mikhail_Durnev@mentor.com>
---
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index 9b722cb..f9c5ea7 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -6,7 +6,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
                     file://README;md5=5cb758942d25f6f61fd4ac388fd446fa \
                     file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=cba4fa09fa364da845ca546f21008909"
-DEPENDS = "gnutls dbus libnl"
+DEPENDS = "gnutls dbus libnl openssl"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
 inherit systemd
-- 
1.7.9.5


