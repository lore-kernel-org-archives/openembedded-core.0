Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 164427F43E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 15:24:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j16so11493771wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MMHrB2j4Xiy1IWRTCKAE1DGs52/miKB6th9buvk3Z1A=;
	b=qdFXxCtRcMCCda60pucNlcxIplRldWQWdLLcVaomvajzUdHNQnaa++4SgS9qrUS1LT
	mRqnHFATZMHV19m3ValvmktSXMIZSQCvvnN1vMcKqpLMMtYl1qO5eFGVGiZDpe0JGExm
	HaU72hsFuYxmmXyY+5qL9v4jZAIEPDG26aqZmeu4riTfJbGPWqTXWRbPllyCymzxB30Z
	5j066yYSXveVvmz71X7uLSJ4xQCPKphB/3rsJy9TGvcwTd4iRZvhh9ZoesxJ3HQZ4/0D
	X+Epd7ncAIeeoJfRSKnkx3vCzfrExU2+YSiCJJX17Rg5kT1/UWnMat7vZ/yjT/ruvejL
	vy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MMHrB2j4Xiy1IWRTCKAE1DGs52/miKB6th9buvk3Z1A=;
	b=IGZMfEGQ59/VfdPZWBbvRWvH6U78tgLcrDPf0n1k66OB6GLAZacakjyETvdYpHU29m
	autALi8O1sVdk6q0GtHGw0yDXw6FZ5KmPZaJWAzQzsc8YLcg/g/mSn3ehtKjEJ/UoNky
	8oOOXBxIexu7u8JVvG+cYYsippZe6YMRT0X9iqu6MdwvL4GAU+2W3NpbYSsaCSfPpqq8
	HICr8x90dTnCaK+AYAgdk2U+f7+KOAKRMZhYvMOS2tlIRE24Vv5d/lFvD2fU6VKuq88e
	B4Jh5FEEqVQOHOFeDurrYPxSIwEcVr+23s+cXQajs9kZRS3/qsyOIesiOcuKvcFuiUm8
	+LqA==
X-Gm-Message-State: APjAAAWCVf1SfNUugu/p1qpOsCSQl7eUTyuTH50aAVfk+AqGR8O0mfEM
	9O/+9XUjuRc+wHJAtU7T7b4zSsuo
X-Google-Smtp-Source: APXvYqz8LuD7c74OADnvOsgfzWV1iaR8erlIjBesdZ8k/mUU/RDsgokrQpP7AkPr02c1ms9XzBAlVQ==
X-Received: by 2002:adf:e44d:: with SMTP id t13mr24534630wrm.240.1567351470377;
	Sun, 01 Sep 2019 08:24:30 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id c9sm9403598wrv.40.2019.09.01.08.24.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Sep 2019 08:24:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 17:24:24 +0200
Message-Id: <20190901152425.100061-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] default-providers.inc: set mesa as the provider for native(sdk) virtual/libgl
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
X-List-Received-Date: Sun, 01 Sep 2019 15:24:30 -0000

native/nativesdk libepoxy and libsdl2 require this to be set, when they
have the respective opengl features enabled.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/default-providers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 8f4d44d884c..ea88bd4876a 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -5,6 +5,8 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/egl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
+PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
-- 
2.17.1


