Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 78FDC7CAC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 21:09:39 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p15so2968279qkl.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 13:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=kUMxKYZoj+vvm82nla7jYAqaEwIoxuReYsIIUSPbfpU=;
	b=HSeilQv434cfDQS8Zpbh/d7w23Afz9Zq3xj5wt27DpLbHl6zgorTEyauVt2ijDKC4P
	KPprfKMjqWtmf9dtEGdpMEV0uc/S+Bv8wutlKoZgfA41PEC7hmPDXIya4gJQ0q/uxvUW
	099qTRTBuVcIjNYdMvpiO/9B86O81IOC+bYOmbimAvED8X7SHORbA42JcWYYLI5uJcBB
	QgoDQ3KFOty5xYltDf0UJ+OI99cKsI6Lk7QsWN4Xsm91fPSPp816pUHHgRRKVVmoCiPX
	Vo68DP06oUd873hW6/qla3h7TYwQFUsRxNYVy6wrgpWLGWnmDbvDXNZ+HKd7D+wtP72J
	DKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=kUMxKYZoj+vvm82nla7jYAqaEwIoxuReYsIIUSPbfpU=;
	b=dFmSz/iVOBLMDRHPGG36tAPQp7suqRbiuLL0iDfnHtgmjhW9gD8GEsueyYjSxHPblK
	OC78+cQmTHOHuJnyV+n94l+ANiu67/+Y/P/CQZ9XFqLNWyBaAv7Jex/GtksEMZFn4EfV
	MymMaBzi7VgWx3dMTP3j+T1pmPxyYvnNa1TZe8CPvghUNiYdMzopCx5+lbK8Uvwv53bK
	zlyAzK/v/uqWDdJyySHn+pKCqXkNWXRI5bkChLFUlsXpIQ6vzTi2B/wPX7QzLUGHEfPM
	ZfzoItQLunjKAS6lP4RP8Zl8f7+kP0/mRE/WZYgduqpgOBuaRsf39+jMCSaaT39DNLRZ
	ln4Q==
X-Gm-Message-State: AHQUAubMCKmHAtcuqB1UTq6FL61o1d5ormzzfbJU7T8yxN9O2VSMo5gv
	jTU9vRzEFy078ZClBSAzIL8xfvQym1fEgA==
X-Google-Smtp-Source: AHgI3IaU05vV/2bj91RxaKvTw8oUtVi+/HGZSDa5+8q0cpJqyAM+Cpidzngi7VKEUrR+x15in+XoBg==
X-Received: by 2002:a37:9201:: with SMTP id u1mr26980837qkd.258.1550696980271; 
	Wed, 20 Feb 2019 13:09:40 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	m42sm14486092qtb.63.2019.02.20.13.09.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 13:09:39 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 18:09:21 -0300
Message-Id: <20190220210921.26761-3-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220210921.26761-1-fabio.berton@ossystems.com.br>
References: <20190220210921.26761-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v4 3/3] mesa: Add opengl to native and nativesdk PACKAGECONFIG
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
X-List-Received-Date: Wed, 20 Feb 2019 21:09:39 -0000
Content-Transfer-Encoding: 8bit

Allow the use of opengl for native and nativesdk packages.

Based on https://patchwork.openembedded.org/patch/158748/

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c5f3e332fa..c4a827fa5c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -49,8 +49,8 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri egl"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri egl"
+PACKAGECONFIG_class-native ?= "gbm dri egl opengl"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl"
 
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
-- 
2.20.1


