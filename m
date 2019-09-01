Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id D79216C226
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 09:39:54 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id j16so4024698ljg.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2zqMFln2nhx/ZPEyOTFDrWYskoRv/tT8Bip/nbqGVUI=;
	b=HWvauKvXEEdV/YIRHlgcda3po5Y5hKgOhydJAlakBB3zP4MjFjrTFaFYcWmxphGRrs
	AVe/nG0k3XRSsnY+1vmvO2nago3cpCvjY27nm92P9wYqaEXNt4AJXyQYlp1VasW+IxLY
	Ac4PBkuHUlT76uIJW2mz5mgmBqU4399cNlK1Tl9z0wQ+54YxDa2yZfTk21KznozwV5Dv
	3vf3U6uIooOUEqfP5f8G9pbHLir5vMDcUm8tXDUoEi7+bVjuET/DGwmibvvpuKiYiKbo
	bAulpmgRoYMwWL/qv6aL7y/l/VQvrelO0I/HLa2H+Gml/hg64B6yvCu90bimMVeKsQwx
	Aghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2zqMFln2nhx/ZPEyOTFDrWYskoRv/tT8Bip/nbqGVUI=;
	b=fkg3XdG1m5EgJ+aJ9OvQelc8pjOKZVQoyCLuUc+HeWnFWbHl3+L9hvDgwybFt+7ei7
	XcvrBZhrSOIjquX28tXU1/hjHUUwiVIX2UTj5JxurnUWQnoMwfalNJrnD3lEkrD01F+b
	w5QWl9S6rlALL+UrgvLU2SOxUP5jLrq7NkkPuNzVj0L3jCLfHGB9Qu15/Situf5BVDub
	lfnv3WAEwznMhNJV5j85bTFlhzubEngjcY/cfh2JMoTgIy/1RjLonpbaZDgDqOxQAc2k
	Wns5F8XZ4w98HBa2+tSnOXCckDT1DCEARp9bIjV23Oklv+cMxgvTMeHLFM1TEsjC6Uii
	9dPg==
X-Gm-Message-State: APjAAAUQYdpd20/bBugNIBZi0SGECRylMaR4USbXoFsZ3Y6XO2lwvxzV
	0yFk8LHNOQvkMthGyRwhhMMvRMxD
X-Google-Smtp-Source: APXvYqzfHoueueNTr/5fu5bacO4tCVRfr1ynHM8kLkiku8j1sTrYGQguRED7nhoki3ymwW4Uj8Vbgg==
X-Received: by 2002:a2e:2c09:: with SMTP id s9mr13346017ljs.222.1567330795157; 
	Sun, 01 Sep 2019 02:39:55 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id w1sm1926434lfe.67.2019.09.01.02.39.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Sep 2019 02:39:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 11:39:46 +0200
Message-Id: <20190901093947.95524-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] default-providers.inc: set mesa as the provider for native virtual/libgl
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
X-List-Received-Date: Sun, 01 Sep 2019 09:39:55 -0000

native libepoxy and libsdl2 require this to be set, when they
have the respective opengl features enabled.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 8f4d44d884c..189dd8fe400 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -5,6 +5,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/egl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
-- 
2.17.1


