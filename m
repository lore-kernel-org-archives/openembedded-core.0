Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id C235F61514
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:01:09 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d9so9416045pgu.3
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CSOBNwxEFe5KT6EBRaL/DtkmfVC2kawVkQyKV7Ceu2Q=;
	b=QjvGfjO7LRWfvNJedkJq9C+X7yB04os/+sEOtlHvHr8WrIt//cjrq3W3pbW5cw+nn9
	Ec6wWoXHU8CCYIG9NcZ1Eibdumpn5i6zfS9ZdrrOj8YvTYxJgo6iuUmE+Gbz3iSCLaPl
	ppTOs55ROE1hkWY/05Dj/YDpCy+mDE0pukzlezoAu28PJFoyURnkecRkUQr6CL8+uWlH
	DIeuRvBT0q9ejSS1p9g6/Y/keFf1+ysPUXDSi+iWC+TtUCztrhC689l33XO043JXldht
	VUcr07YwVyl+a0IgeZXtE6KoJRmOldx5BE1eHjnfiH11n92cESmL2whaoVa8iEglJH+y
	/zQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CSOBNwxEFe5KT6EBRaL/DtkmfVC2kawVkQyKV7Ceu2Q=;
	b=BK6QFUhedtzu5UPpmpQoYYRkB3z8B6a/+iA4bsJYHyALChdWrN8uKME3A+evrnFvpf
	jae6zRGrmDbLQ5PWdZmglNl38V7PVWiRad0AKepvkgKBExiYyjPnxPfsDLjhwBrBhN1t
	FatH3FTT30VA3S+6rZLm9Vc7sznUSinJjw+zH0Xg0lvOIS6S6JZb2M3LVDtSDpA0Q0J1
	28mkrLD+bghizHjxQi90QI8+DjX57or3LMoCYJtB46a3060vIdjrx1rClOdlNTsFhg+b
	sh578hZc4iK/ZXPsvgmsTpk540Ii0nMD9Jj+1twtC8TETWWOYdragUhAPGYcsz5fem2M
	4fmg==
X-Gm-Message-State: APjAAAX7VX4O3cVnkNu+H3Ej+Yr32CzRyenLZrfAcmUiZXkmKXsGECPV
	mZkeAesxGyshbpQ5AG+eczRaYztO
X-Google-Smtp-Source: APXvYqx29lb66VwuI1JoHWZZMQ6CDzCwDl0SI+TKZqrd1nJdFJFGy6HAyX8naNB39XTLK7nP5H6H7A==
X-Received: by 2002:a63:504f:: with SMTP id q15mr18346668pgl.8.1581955270630; 
	Mon, 17 Feb 2020 08:01:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.01.09
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:01:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:51 -0800
Message-Id: <34428eca5f845293b648801bf61957afd249b315.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
Subject: [warrior 13/14] linux-firmware: Upgrade 20190618 -> 20190815
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
X-List-Received-Date: Mon, 17 Feb 2020 16:01:10 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

License-Update:
- WHENCE: New firmware files additions and version updates

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit b4c8f2f139d0eeb2ebef3dc5f8309486afdea3d4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{linux-firmware_20190618.bb => linux-firmware_20190815.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20190618.bb => linux-firmware_20190815.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
index 9afaad73f3..518638806f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
@@ -123,7 +123,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=55814698bbae7c7dd40c9fbde91af0a8 \
+                    file://WHENCE;md5=37a01e379219d1e06dbccfa90a8fc0ad \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -192,7 +192,7 @@ NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
 PE = "1"
 
-SRCREV = "0731d06eadc7d9c52e58f354727101813b8da6ea"
+SRCREV = "07b925b450bfb4cf3e141c612ec5b104658cd020"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
 
-- 
2.17.1


