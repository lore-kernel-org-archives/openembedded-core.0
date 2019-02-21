Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id EE5B27CB21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:44 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id l5so28776921wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IwCywRVNWWwLRSyZS2hxXw98mIYcFLI9Ln5eVjoSPE4=;
	b=OFfqfsUssi+paQTbSZd/z5c9g2i2sRI5p3YvZ1esateNp8wfc5ed34KYfYhJutPzvs
	IK0eVXNLeBiyKSaTegixCFlFuFrUJ+3aStYdnA/gScFC0ryqDx11Nb9ojrSt/L8abU0d
	KzFbWFIB8SjBysKUuyOP8lqn2U4hdy3eATuOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IwCywRVNWWwLRSyZS2hxXw98mIYcFLI9Ln5eVjoSPE4=;
	b=fV0GKbraLJ3XRpHzb7V0HrFVDorAu1J/PdrDQjKMZE7zk2oiudzPNRBS6jCzoB39fn
	xX26rn2pZbSZkn7rMDClJV1mcwIa6JqQchtDtfmuQ2b6xEg0ekHWRDif4HcRqxMUheWP
	/NDOc1bjJ5N7/yX+DqZ1Ws3swPS/4a9rC3D5tVvyxSLhlMP9snHv+8te98I4chy+ghkU
	4px9vHFDblo3i0dfpg0ut6WaS/tB682YnsIoJ2CJgLQEJ6psZ/WVQ6UJgFyUVCfBpllT
	xle+EtZOGPuLz+x48lvm7FgoS+sXDupyyYWWt4doPAMQ7TzCnoGiomjacD6fpChK3Hlq
	6puA==
X-Gm-Message-State: AHQUAuaMhMHxlPNvSoeBYA+Pmsv3gpFJ+Iill9FhjzKLguAyMX5x87Fp
	sOe1sMnfR0SLx7VHqnKmDNCjFtfaPq8=
X-Google-Smtp-Source: AHgI3Iaabo5Pgea17ezxnhW8+ZJm7mfSBnJTIt961oaMgaZBy7SYHrxS1MMUdnRbZ7bXmhcBmr/AWw==
X-Received: by 2002:a1c:7510:: with SMTP id o16mr10254814wmc.38.1550752905333; 
	Thu, 21 Feb 2019 04:41:45 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:28 +0000
Message-Id: <20190221124130.25733-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 12/14] xf86-input-libinput: upgrade 0.28.1 -> 0.28.2
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:45 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...input-libinput_0.28.1.bb => xf86-input-libinput_0.28.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.28.1.bb => xf86-input-libinput_0.28.2.bb} (63%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.2.bb
similarity index 63%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.2.bb
index 0b77546d6f9..19123e06c91 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
 
 DEPENDS += "libinput"
 
-SRC_URI[md5sum] = "9d2fb3d6b452d568a275908b856de0e2"
-SRC_URI[sha256sum] = "9ada448e076c0078a84b48e5298fa8ce317565f9b342b74c20429214a707d98b"
+SRC_URI[md5sum] = "b7548bc1d7e82d189205794ff86307af"
+SRC_URI[sha256sum] = "b8b346962c6b62b8069928c29c0db83b6f544863bf2fc6830f324de841de2820"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.20.1


