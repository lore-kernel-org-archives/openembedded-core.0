Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 44CE57F223
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 10:00:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45xwD62bgHz56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 12:00:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564394422;
	bh=ULdGnwr3I2aaNFMMxX5tXRE0MQ4bsdfhKsyfuSMvKKk=;
	h=From:To:Subject:Date:From;
	b=avdDLT40MwvaEWYAl29Q6Px8L07PPdK/8mY49NIMU24vt1rK4/4gif1ul5eenhcPA
	3YjXHtdoX+q1W4ACg/avhhvISoDtESs9s/xre9fjSz5qZX4DcCLTgAy5dBShG5UeDU
	/3JrJn8w194H+mXVRb79NT+8dz0gq/lV3Nh1rm9DqZF92B+VOBa/wsO/ftDDrnyqO0
	OvfT7MNoETkN+r1/VBDvnRQyxxl9wqu6dkoUuglNCZrPYcUtlSzpKg+dqcMw1+ohrZ
	GasAQA8QRBzQHgpioCMaGFsY4TvpYRbDtphK594NufXvBGfHy6Ev2c+vQOeBOL50P7
	zzeAwY67zQQ/lxNkTnTPEJ4hd8MV55QJiZmI2rR4GuYjlbjlqEkx5V9QsFN1O9A6LP
	kTju79oxRrIsO5oQ1EQP62gJa8XyxExTm7mQzsm3674s/RXMiR709i7XsCN1w01eLi
	vSGnRqcKv5S6GvhDwWZZ4EeZ7IdhhpQqboJlg/WFl8hUEjut1+qprZsH29zIWbRMh2
	kkNsF8BkcP2UdnEddkRTKihXwLrqPr+4YG5vzQfECnTawgRMSGtFfH6EKYlKd+Wr4w
	g0mKbfvHcyDQvO/WEmK71Pvmjjy89Pqmpw8RQg5qcszcVQXi8/GV7mlBqge2xgmPwB
	ZVqD+3h4IBwJpvsImNnXb23I=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2019 13:00:20 +0300
Message-Id: <20190729100020.10517-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bind: Remove RECIPE_NO_UPDATE_REASON and follow the ESV releases
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
X-List-Received-Date: Mon, 29 Jul 2019 10:00:24 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/bind/bind_9.11.5-P4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
index 1355841e6b..93c406f778 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
@@ -26,8 +26,8 @@ SRC_URI[md5sum] = "8ddab4b61fa4516fe404679c74e37960"
 SRC_URI[sha256sum] = "7e8c08192bcbaeb6e9f2391a70e67583b027b90e8c4bc1605da6eb126edde434"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
-RECIPE_NO_UPDATE_REASON = "9.11 is LTS 2021"
+# stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
+UPSTREAM_CHECK_REGEX = "(?P<pver>9.(11|16|20|24|28)(\.\d+)+(-P\d+)*)/"
 
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_script
 
-- 
2.17.1


