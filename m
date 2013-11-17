Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD1F6DAC3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 13:52:24 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id c50so1412759eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 05:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FnDgecfZMsnn/pX4dJUEdPcguV8I5KCeURGHvMRBaKU=;
	b=J0Dm+mPDpNOk1zQ4Ksib2odkRgVyUOcIikLYp+Ez2nIj7MTzBA5WrdinhmVYeYlHvt
	2noEvwAQBrMVlRfovswFKNT45z44fU+wBOG//+WIDjaqa0IlmRTpFA6D+MxHS2MfTIzW
	GppC6+PQzpdBtQdA8E9E6I1+5ZiMeBgU4JTphlZ4VX3Cwn+nqMoQxVHL0eUVB7Vm97xp
	h0NUJyn1eXjqDrhTG6Ww5TrZXMtXEcTJotwBbfId3TobOq7WkO9j6Q3/vvzDQm53VMgv
	RIjossIHtvKaGVOewMlyEEp9S33tl/w7CU5m77/Dubnfwg0XqCMwOlgbnGwmqjADN/jg
	Z5xQ==
X-Received: by 10.14.216.136 with SMTP id g8mr668121eep.61.1384696345758;
	Sun, 17 Nov 2013 05:52:25 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id z1sm27449913eeo.14.2013.11.17.05.52.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Nov 2013 05:52:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Nov 2013 14:52:16 +0100
Message-Id: <1384696338-5390-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 5/7] ppp-dialin: Drop allarch
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
X-List-Received-Date: Sun, 17 Nov 2013 13:52:24 -0000

* depends on some TUNE_PKGARCH recipes:
  base-passwd, ppp_, shadow-sysroot, shadow

  Hash for dependent task base-passwd_3.5.26.bb.do_populate_sysroot changed from ff08f0198f5424a21ccb61957325ffdf to d9d962e2d8c0d591b916ed68aa826efe
  Hash for dependent task ppp_2.4.5.bb.do_populate_sysroot changed from 515251fb9d5196733f9b6ca0f6cc041b to 5cfb0b7b71f4440c3147da52c22234cc
  Hash for dependent task shadow-sysroot_4.1.4.3.bb.do_populate_sysroot changed from 3e5bddc578887636c1809e4cdf28c1c2 to 8f03231a1d4bb1aea6c4adce1febc1b4
  Hash for dependent task shadow_4.1.4.3.bb.do_populate_sysroot changed from 518f7edcba3545e5c60c3a13cef23169 to 7dbf1646de02a117bf0d573276b878c0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index d239c20..6aeda4c 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 SRC_URI = "file://host-peer \
            file://ppp-dialin"
 
-inherit allarch useradd
+inherit useradd
 
 do_install() {
 	install -d ${D}${sysconfdir}/ppp/peers
-- 
1.8.4.3


