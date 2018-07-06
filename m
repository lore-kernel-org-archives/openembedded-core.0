Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6948078A6F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 13:35:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h10-v6so4231831wre.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 06:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PaQOs+W4YB1WkusaEHkjEUVBGatq3XB99q7RAnMfLGI=;
	b=RmIIJFDOchr3bi7FnJl5yrWxKRbjs03ey7L26RIu2XcqIQquIKVHHcBXCA4zQLuwGx
	Q5/XQfVSI1BNqMitf7wd2vZAO1+s6E9Q5JOTUgoq/r2d+F1NmNFN73NHih1l+ekdDVEA
	LPrcla0mVeKWBg89WBAaD0mje2xa1WNB3xkOyIDyyPBELDmCne8jcLHR6whcCB2x3FhB
	+adVMZfNVqNciOkvudz9Hds8lKlN0w+WgX65r5dnYaXZDOPoqBZf7QhDi5fzBI8Agymt
	SIGa3naA3MlF27cVHHcdN70WA11QB9G/i2DIAO4mhG0lsitjfaH+kmH6hluSfAGHqSCc
	A1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PaQOs+W4YB1WkusaEHkjEUVBGatq3XB99q7RAnMfLGI=;
	b=TEpsB5mOZQGEoKfCWSq3DLkwXeqPCOZ2SUHAARuoCYmlbgj9STDs2F0SsUySBKW2tl
	due0Itkgo8Aq80Xc3CkzKIeX53v0IdbpXd5bx6uyoWpJLkaFs0WxAZZXpAYgVV+jJ/rJ
	RgKpx8izapkrBLFvPZCs32K7iIEnYSTpqo2BUxbSlwI4H35ORmyG/J+LxM830kwZbh/M
	SuzoWLcqZO9AMu9vK6uTC8JTfoWAPLIMSw0y9swhjW3+7DAHpR9Oo3aC+pb9/NMqt9qQ
	82D5skzXmKtZI4eEv5cNAmzr1AXkWPF8AQva+tkX8F67T3j1dhOeQK2JoG9tAkGw3ZKO
	dVxg==
X-Gm-Message-State: APt69E3Vl5WVRGUVMty/t+lxpbeNhv9SPsHV+2zo/afagmv6yeKmEJjl
	GUVd4ZKCfgGMEJBCCwZYoayN9+m4
X-Google-Smtp-Source: AAOMgpf662lDw5pdkMYBq09if/DSN4R2AlB2b+URioyj6XYh7UJSjlr9MNyIRlXEPQAtTxONtKG0GA==
X-Received: by 2002:adf:b0d0:: with SMTP id j16-v6mr7183805wra.3.1530884133460;
	Fri, 06 Jul 2018 06:35:33 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h8-v6sm6137355wmb.32.2018.07.06.06.35.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 06:35:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 14:35:30 +0100
Message-Id: <20180706133530.19524-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] meson: send user to our wiki instead of Meson bug system
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
X-List-Received-Date: Fri, 06 Jul 2018 13:35:33 -0000

If a CPU family isn't recognised the first step should be to verify the mapping.
Send the user to a wiki page explaining what to do, instead of directly to the
Meson bug tracker.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson/validate-cpu.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/validate-cpu.patch b/meta/recipes-devtools/meson/meson/validate-cpu.patch
index 8bdb204ab04..e7dad00d47c 100644
--- a/meta/recipes-devtools/meson/meson/validate-cpu.patch
+++ b/meta/recipes-devtools/meson/meson/validate-cpu.patch
@@ -100,7 +100,7 @@ index 091d92dc..67177c1f 100644
  
      if trial not in known_cpu_families:
 -        mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
-+        raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
++        raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % trial)
  
      return trial
  
@@ -109,7 +109,7 @@ index 091d92dc..67177c1f 100644
  
                  if entry == 'cpu_family' and res not in known_cpu_families:
 -                    mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % value)
-+                    raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % value)
++                    raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % value)
  
                  if self.ok_type(res):
                      self.config[s][entry] = res
-- 
2.11.0


