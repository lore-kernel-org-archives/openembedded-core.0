Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4AAF260667
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 11:05:54 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id p65so22476162wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 03:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Xu78SW1LjwZzWCoGh0/WqcVSPU8o/TISDQSJruCqVrI=;
	b=0yIIOT9R8fIremvQpxzl7ycZ5G8MlXGgzcLLoQUelztj8cVwYno/knEQ/2Jt9gbQmK
	d4sS2FoZcAjUWw791V/LlbUqBwcEVsH3P+0LPSgnIH6pCBcJiCRQ5kfvBqk76mGbDMUB
	bP49IAdsOsv6NVgVmTgnSWalUlF4aIpR/d4EjhgLgzc8ampi35eg3gOtTv2uYAyrzVYr
	fNry5YiEZNP8y1gEdZVK9Fagf4m43KiLMVqt6s+hizJhmimgIErBAmivK6Tw/rp6pCYq
	Gdx9Kjoc3mdS7ghLpRW9m0uzQkE1MNgYelnXxvMXIew6aolNTiIqOSBVrj+ntT9lIdGm
	8QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Xu78SW1LjwZzWCoGh0/WqcVSPU8o/TISDQSJruCqVrI=;
	b=mBwcmFAhsZKDsQVg5Ka4I85JldkpbfP8Y0cJwiH2JyFmY19u7eh+gocvIXUVM9qtCO
	smQ+Q56sMWmZeN1dALgQzS04enSBt48YPfIaR8rxmAzvLD2H9IaBToEKXvLTrJ7VsBkf
	eTQvck6JjmaZtXTpn/H2+Ic8KS7FCdqjH4amTAPE4Tj+EICYGC2ukbHYwH20kTHC/mqW
	jdPIpI3Slcuk9glB9/biBFa1HjV0Cm5Sfo4bwCjWRr28Qc1cDm/Lf3C9d5aBPTg8vqjt
	Ubwq/764mTQALeGr0TjencGtkANRpPNpO89lRaO0H9/hqMYf1r8xQYEMu/G7bHbJRXsi
	3C9g==
X-Gm-Message-State: AD7BkJJIZKJ6xfbhx77KwtGkkTs3GApLCdpVzPRVfKfVIR4mC63qPCtJpv5mE02ZU0LjgJEb
X-Received: by 10.28.96.197 with SMTP id u188mr19577526wmb.102.1457435154658; 
	Tue, 08 Mar 2016 03:05:54 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	ka4sm2359920wjc.47.2016.03.08.03.05.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Mar 2016 03:05:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 11:05:49 +0000
Message-Id: <1457435149-14411-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457435149-14411-1-git-send-email-ross.burton@intel.com>
References: <1457435149-14411-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] avahi-ui: add dbus to PACKAGECONFIG
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
X-List-Received-Date: Tue, 08 Mar 2016 11:05:55 -0000

Now that avahi has a dbus PACKAGECONFIG we need to ensure it's enabled as
otherwise the avahi-ui module won't build.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
index 7f5dfb3..3966b4c 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
@@ -9,7 +9,7 @@ require avahi.inc
 inherit python-dir pythonnative distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
-PACKAGECONFIG ??= "python"
+PACKAGECONFIG ??= "dbus python"
 PACKAGECONFIG[python] = "--enable-python,--disable-python,python-native python"
 
 SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
-- 
2.7.0


