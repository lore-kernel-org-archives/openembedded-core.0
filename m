Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 29FF27CE79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 14:21:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id c13so9065994wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 06:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=L5KEsfiriW36KMzUWB2CH1IbHxYsVsRAr9OQGCu1T7k=;
	b=H5jlE4cpHBKZn/PBUrEqTQfxzqd3tOZS0DejlkHVmyew5GidUUX+IoZ2GLPYTmzc+1
	3NGkn71+FayAQpRWRpoZp33krIn7CB25axXrlw5cJaIuaapua7n6r70NEpUdAcQtzOkz
	v/X7bFU6iH8TwVNDJM8yX7NxT5GAcdIUNN6OekGKN+hQX2w8ux3VGPcm/FpPeqD6lZ9H
	aCq0fSezgXza/s9y9YG1PEUXNVjzoadf7Za/u4ByHFXX+GunNlXK/iH4xMm6+0I7WU1b
	bvaYoiBAvpQaonOPDsXSwZh645IcM8xaV8Ro0w9OpXaMv2n7uxyAaN9sFbcG6ujookrJ
	Zy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=L5KEsfiriW36KMzUWB2CH1IbHxYsVsRAr9OQGCu1T7k=;
	b=YwX9z9liED2vUzrIrb31z5yKV8zF2LVkRomPrjyTk/WimekQLDpQjBbcHsRQIAczGL
	VUq777Yt8dEbAe+ygRSqnITG2EyCyAeoM5Iq01dFHBwn3rnRmyBfsBmYxNPe9b8TVycG
	/H4MgG8FzqVR7zmnWSkrL3oaVddSvZeiwDjXH27eq1LmVU/KBhf0pPy+uFnmoBDK1to6
	4yyQNPr8odreRARN1WV//l4Kp2CGZB6VS85P43oepcPsfxOzybbaYlYR3isNGpc9z/+l
	n9WRDvWnBh5x4Fica7BR5dscEZL8ZrE3/DiqXWxylePcFSP6YaNKzimdEcRB2mhwqBjQ
	VU6w==
X-Gm-Message-State: APjAAAVWk7xP2sSu1dF5X0TxFmtXFshLW3QbW2atuw16pZGIsXFRJIjA
	5E/+3yvrCUUucBFJbvX6h5fViXqG1oI=
X-Google-Smtp-Source: APXvYqx8Vt78D6SG1fLwKDCxi9CkBzC0xV4xDNCN9vSRm0J5nK7OJCagssRMMB+uSWCQq/z99LEzzA==
X-Received: by 2002:a1c:6a18:: with SMTP id f24mr9355182wmc.115.1552054867506; 
	Fri, 08 Mar 2019 06:21:07 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id x24sm4131279wmi.5.2019.03.08.06.21.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 06:21:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2019 14:21:00 +0000
Message-Id: <20190308142101.10299-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190308142101.10299-1-ross.burton@intel.com>
References: <20190308142101.10299-1-ross.burton@intel.com>
Subject: [PATCH 2/3] gstreamer1.0-plugins-ugly: remove redundant libid3tag dependency
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
X-List-Received-Date: Fri, 08 Mar 2019 14:21:07 -0000

The use of this library was removed in 2012.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.4.bb
index c59ba1de51b..168e64d84cf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.4.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "ac02d837f166c35ff6ce0738e281680d0b90052cfb1f0255dcf6aaca5f
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-DEPENDS += "gstreamer1.0-plugins-base libid3tag"
+DEPENDS += "gstreamer1.0-plugins-base"
 
 inherit gettext
 
-- 
2.11.0


