Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 02C1F7BF09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 13:49:47 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id c13so4474112wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 05:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=22sNIWBOygl5bLOIyfnxveOesXq3+3pqq41WoS6kDhM=;
	b=CvTReBv/xLdcfEFormFETyNMQwyJLkNOTki3ujlKwldCnhBMp+yNrTTiARq35dCHeP
	Wc9v9QBLuUMJsXpXqzouqqSse9nz+HYDtBHR3qBEMcozXRjRquX8QtHlOcyReMEYAKn5
	DsNLOReFBgigMs7nLK0X2Wxwev2fmOjK1RbZmpeByeRHLU68eLBD0pbLhSOLO1FVjiXR
	rpT8vkL9+oD955zs+e8kBw/zRvRaEUxp+CLl1ct7CoN+BFr0TqegZZyx9/wdu+MOHLbw
	p176+saIGUF+Iqk0U0JlQ2STqox2bE5ky7a1b86Xy4QUXlVh2obVGxx0Yl0Gcics22zW
	kihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=22sNIWBOygl5bLOIyfnxveOesXq3+3pqq41WoS6kDhM=;
	b=S7q5UBAy8ZXyql8Hakiuvc3vdaDlc2C64zwKqNzmYy5SVZfZfwlsBrqCe/AyhG9pLY
	11Fi06pTKNHcPMbG2Aa6js62eo9JuWZ3oY6GtkuPwDwRy2RDn1znVuto4Zhgeje+fbZP
	jeKILR0vDbnbacupt52fogmKCsjUp8zDr2b4R+7djh/6R3sWRRWZPw03fCeD5+2FlU4T
	WTSVXQ3xj2Ccp9iX4Lzm9A9mYa20IBXItHDLAall+naTx+uo5sj6itk2PWMmkpo9XgKa
	fQQMFYjihXmA50rpr9HBvIAP91uFXViR4L7ZCMMRJL72q3HMujqlUznNXHb+jYs84WQS
	ZXvQ==
X-Gm-Message-State: AHQUAua5QFiLtWwDPZhq7rBa8a2MaVNymBKRlWHfyXZcUkGsV3F431jd
	nf4EIshdZ9joghYPYR2tKwY0Pwot
X-Google-Smtp-Source: APXvYqyirAIHaYXdj6+X5pe2nIhhtYQeSJqdeD94C7YM/I2W41oLr3sHJOPU5Vk7yt09E32qhM/s+w==
X-Received: by 2002:a1c:7d8b:: with SMTP id y133mr2328494wmc.7.1551275388429; 
	Wed, 27 Feb 2019 05:49:48 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	62sm13610831wra.46.2019.02.27.05.49.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 05:49:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 14:49:39 +0100
Message-Id: <20190227134939.51320-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190227134939.51320-1-alex.kanavin@gmail.com>
References: <20190227134939.51320-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] local.conf.sample: adjust the qemu configuration to refer to qemu-system-native
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
X-List-Received-Date: Wed, 27 Feb 2019 13:49:48 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/local.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index 98ff5c23256..eee65b5875a 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -239,7 +239,7 @@ BB_DISKMON_DIRS ??= "\
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
 # seen. The two lines below enable the Gtk UI frontend.
-PACKAGECONFIG_append_pn-qemu-native = " gtk+"
+PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"
 PACKAGECONFIG_append_pn-nativesdk-qemu = " gtk+"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
-- 
2.17.1


