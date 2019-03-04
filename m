Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D0FF97C892
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 15:36:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t18so6051205wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 07:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h4Cotz79RFxLyUpgJ1emBo/wfR7GOCYWlDJFhb/cmu4=;
	b=lcvNRk/nza+cWh4PbGcfAiNcNHEumWiM85SOTPMqWRVcrJN+qMGSt09sfcEQ8MXWo3
	xW8as7fCNsHCfAqGDSL8gKNPbCvqlC7yxQ76zi0ZoPDib2g6NQXptp1uGaulYQ1l7W31
	dgke64y8MSAS22Zu/ymEphCdV3OwY4d4evXaa0Jn+jzHItC3eK4dSQznfs6kDBtK35d0
	Yrh65d8orJ+3eImTUn2AZZSt9eLSniEeUkMuM1OqHZh+bI4z1h/tyQcdTmVjH6FLKjmI
	5Wljk1Csz/0Ys1mx5mO0u3gGUBGxYH1uOIepfNORF+CxFV+cyo+EoFk0eCMJme4n7U0l
	UIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h4Cotz79RFxLyUpgJ1emBo/wfR7GOCYWlDJFhb/cmu4=;
	b=SrJ/bK9EAVZF9S/uIRiqfGeCyN4R+hbCHddIxmVk7pdS71PrTI+MfFkKd3/hvm4P06
	1q4N9poloc8l41p37yYT1UhwxqB05r5f8JCo5y0w6mWA71244moXnU0JDtEnmvgPou4v
	BMtC3pJwTrZB1YKjLaQNPvV9lFVIcixM5GfI7onx6C6Camj0XaUd1nUtAUsOlX+rL8IW
	pDyl/S9mtA+bCdjrrd9cWILuA+TZBAAyQUyGue6aFeWTmemRFyS+FeFVe4nVhdkyX+Py
	UgmCwBecWnB3uAd7Aq3e9agqxfsgEmM1WUsJkEObuMtfkTeWB6vrHzrLZCFKHGGFt57W
	ueKA==
X-Gm-Message-State: APjAAAVA2mUyJN/oh5lJnXTLwhtJcME8RdKGPyICyyTwqDMksJhQ5b1v
	5slTcAsgQT7dHgx/eETT6qzOIJEY
X-Google-Smtp-Source: APXvYqyI/qPyMg8ZsYccug70YEdVXG3aSUyijLoK13YptIBrZcFQMMTbQT7pHVF6jXxcaJ84j+AdrQ==
X-Received: by 2002:a5d:42c3:: with SMTP id t3mr12632136wrr.232.1551713816320; 
	Mon, 04 Mar 2019 07:36:56 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id s8sm5523414wrv.12.2019.03.04.07.36.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 07:36:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 16:36:45 +0100
Message-Id: <20190304153646.59135-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190304153646.59135-1-alex.kanavin@gmail.com>
References: <20190304153646.59135-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/6] local.conf.sample: enable gtk+ frontend in addition to sdl
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
X-List-Received-Date: Mon, 04 Mar 2019 15:36:56 -0000

As SDL was found to be buggy for virgl-based GL passthrough,
gtk+ is enabled to allow that use case.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/local.conf.sample | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index 9068e567dcd..2775e15d748 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -238,11 +238,12 @@ BB_DISKMON_DIRS ??= "\
 # Qemu configuration
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
-# seen. The two lines below enable the SDL backend too. By default libsdl2-native will
-# be built, if you want to use your host's libSDL instead of the minimal libsdl built
-# by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
-PACKAGECONFIG_append_pn-qemu-system-native = " sdl"
-PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
+# seen. The two lines below enable the SDL and Gtk UI frontends as well.
+#
+# By default libsdl2-native will be built, if you want to use your host's libSDL instead
+# of the minimal libsdl built by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
+PACKAGECONFIG_append_pn-qemu-system-native = " sdl gtk+"
+PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl gtk+"
 #ASSUME_PROVIDED += "libsdl2-native"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
-- 
2.17.1


