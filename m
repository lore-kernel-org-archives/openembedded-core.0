Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC237F897
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:38:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47731f2Gz6z8t
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572989894;
	bh=21l1aH//76AvsRT1E5PqqyqNSLU9tZnxsbNrA5lYiQI=;
	h=From:To:Subject:Date:From;
	b=FRpyxGuSWXjpcGxiS1Xgc6RvWpeJ9af9CNn0zM60wLo5mIZ1/hlbxtdoAyuaXY98I
	pahj1NE+xnnjCfs/V7ZcYZQBkjNGT+ZRreyrk5pI/V4tvdPuEdfiBS3NKJlROL6VIk
	3wwl+3J3koTA/OgXwMCc1T0+g4Rs6ub3DJH5alSYqE7NpdRajGPRnSGtZmENl7USh9
	bvpbe6lC4IkOnjYqeiFI7NNoWl43QnKS+KAtCEfx1eE9LrNoPhHF6/1XB8Cfljm0k1
	5GiqzzvvqjLYdDdNxpM3W+gACtwwpRJ1cugVdf/HKkO6ZzXR+ZV0to2O5ceQc3Vn3o
	Qn+hB4WvUa6pos433LxiVKWrLo/7T25DqnWQrlpMtFhrumE2bhJId68M9faTW22kXU
	IfdYyht9hw/RPa8uzuA9GEi98cw2VnQ2YecmYmTydW20PaItqGZTgkBeaXtJBpMqzV
	3ZSDoOkOGvqBUqsHM+njXUR2fa2zqM+iGtFxiO+gP4ZoSLgWa6zeku1GAEREupHHYw
	9Hl5HuJTuM4zp3/IQMk5DNoXpofNo5Ne1O4ZXw9NQQaaWAvUtmsZIGvZxA4lO3yzPa
	9cGONjh+68O36TSOjxkvUde7Wcc+h9FmMS9CVpTcvwm+T32dXgStvMs6EspmgHjuya
	IwQdXWnwYXfoJz7oTn/t6U0o=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:38:09 +0200
Message-Id: <20191105213813.27546-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH] libpam: set CVE_PRODUCT
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
X-List-Received-Date: Tue, 05 Nov 2019 21:38:15 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/pam/libpam_1.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.3.1.bb b/meta/recipes-extended/pam/libpam_1.3.1.bb
index 6b73f0a2fe..a2aa1ecd16 100644
--- a/meta/recipes-extended/pam/libpam_1.3.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.1.bb
@@ -163,3 +163,5 @@ CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-account"
 CONFFILES_${PN}-runtime += "${sysconfdir}/security/limits.conf"
 
 UPSTREAM_CHECK_URI = "https://github.com/linux-pam/linux-pam/releases"
+
+CVE_PRODUCT = "linux-pam"
-- 
2.17.1


