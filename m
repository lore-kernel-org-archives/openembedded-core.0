Return-Path: <vishal.bhoj@linaro.org>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 243C57862A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 12:58:49 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id x43so15233173wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=a5b0NAhhGBDaDUJ3uiQihRnWCK6HcOMVb0jsgkPqZKE=;
	b=I5x0klm4PtCj92noAnVEtK5hxITvV5gnnikpSg2TOcxL7Tiv2vjT7KY2q7y5Bm4pky
	eTrtYsN9V2KrVRkxaeJwjcvCpsuQr61hLb7uSp0WSQLxUn1EDW4o8I0rG6DDWnNNACMz
	U5OF6i7P7O5inM+KonnmKPwAJZrYyGgqaGiJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a5b0NAhhGBDaDUJ3uiQihRnWCK6HcOMVb0jsgkPqZKE=;
	b=q+McC1jYOuDYWBLxkC+RROSJrmWCFXDvuZMIA86sHKzugroi8U8oSswQNVSu++1Wxu
	VqAL5S406PRpvAON7R+eA5lb74o+i4RL+/VG8bC+ezGyXGmiYCvRfquNVkNez1+xRf9m
	IghRQAUlyTlPhupnKebQ/G+QFjAMOEb6bShqzeZqocWsQTR9+sxaIYG++kTguEolk5Ts
	dzCfwvYcFI07CwemCLbWp4aA9d9wm+vgUQr4KWaIlKY1LGf88Nm80fYshnOXfhP9uWmE
	BIwCTL6dkP4fs0JgSmHkwErEh1OtG9lOZY9TONFD+Si4qljLFOS4JD6XcN/tbv0mwxCX
	JmQA==
X-Gm-Message-State: AHYfb5isgqZZgkr4taSNIIdd784aeCjcuFWvi+7q5fTFjLSJKrGEpRl0
	Mma4zPlXEC1FCFUsvDErzA==
X-Received: by 10.223.153.11 with SMTP id x11mr1099124wrb.18.1502888330150;
	Wed, 16 Aug 2017 05:58:50 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	g72sm1280962wmc.31.2017.08.16.05.58.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Aug 2017 05:58:49 -0700 (PDT)
From: Vishal Bhoj <vishal.bhoj@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 13:57:56 +0100
Message-Id: <20170816125756.29809-1-vishal.bhoj@linaro.org>
X-Mailer: git-send-email 2.13.0
Cc: koen.kooi@linaro.org
Subject: [PATCH] cross-canadian.bbclass: add ilp32 support
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
X-List-Received-Date: Wed, 16 Aug 2017 12:58:50 -0000

Need to add ilp32 to known list of abi variants

Signed-off-by: Vishal Bhoj <vishal.bhoj@linaro.org>
---
 meta/classes/cross-canadian.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 8554e87521..69cbe901a6 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -38,7 +38,7 @@ python () {
     extralibcs = [""]
     if "musl" in d.getVar("BASECANADIANEXTRAOS"):
         extralibcs.append("musl")
-    for variant in ["", "spe", "x32", "eabi", "n32"]:
+    for variant in ["", "spe", "x32", "eabi", "n32", "ilp32"]:
         for libc in extralibcs:
             entry = "linux"
             if variant and libc:
-- 
2.13.0


