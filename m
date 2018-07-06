Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 90D2478B4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 14:51:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id s14-v6so14766407wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 07:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PaQOs+W4YB1WkusaEHkjEUVBGatq3XB99q7RAnMfLGI=;
	b=ACVwf4VMh93vKthHa5KsYnm4LJmsoNM0kOvjGsQomFYebcqX18EnDRwKyjTLfn5kLW
	Nquc0f83mRlW8FhgFiZ532iNlQqTLJDPXtlaFB1oGZFNxGs5YJWQevj72oV6765KZ50n
	N+nxsAIhuIqH4jgKDjGppeACU9Ifl1a/4YBb7uheIi6e2AK9CJzlLZSKTKjAAGs4LdI8
	0tOqFmJSOm+dpEA2UeV90sB/jM3by6bStpdmJrh/F4zA2rLc79xjT0JqU+nkVdbllXlv
	O9SVBiNb/sNsRtueMQayOflUn4FayEz/X9nYA13M6qvehBZY/PO4m6ADZUTDC1Py1JXc
	tp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PaQOs+W4YB1WkusaEHkjEUVBGatq3XB99q7RAnMfLGI=;
	b=VHgBxL7VFVDPFE1m7TZxGwj+JjDeSFQj875YuDghx++8ly4kyPpUdkdeSm5xWabEFJ
	Pshyfc127xamYvfurBxiw13F4eWYJj8mfGxUY20Tw5JNzk1bCZmeYcBgPoyMFb6ZlgiN
	FOtmJs219Cb39KL/dJvQx6yT2GXYhJU15LBrET3MBz1zRemAcYBgBIZLZ0+Y0znTddLB
	JuCUHVHXbQHFdB6K6fL+vcVkxOIXTlP6HxMQehZlI3p9pTtwBazcjo7espW2d3bE6aF/
	6HX5/6dIVXrnCGE9ayCNzLa9cyECTQShoZP7wFUvDNssI1DH0TAv0RcFexh/uhDMheoD
	5yAQ==
X-Gm-Message-State: APt69E3wpK3DOquGC3pMwLAa+3zhLLWNfMeNTwvsOLjqWNh6DCVo3yUX
	D+Ttmty1naj1IyKFOOeeJJ6MBVTK
X-Google-Smtp-Source: AAOMgpdZD9xrUEER+8pjeG6tPeusZwOzjUac5KzShc5q3FX0pHfYiyzwlcyIr+K5URTAqJO7nHY14g==
X-Received: by 2002:a1c:a341:: with SMTP id m62-v6mr7621606wme.3.1530888680006;
	Fri, 06 Jul 2018 07:51:20 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	72-v6sm3321672wmh.0.2018.07.06.07.51.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 07:51:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 15:51:15 +0100
Message-Id: <20180706145116.30481-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] meson: send user to our wiki instead of Meson bug system
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
X-List-Received-Date: Fri, 06 Jul 2018 14:51:19 -0000

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


