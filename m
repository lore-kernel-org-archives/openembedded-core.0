Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E7CBD754FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 12:49:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v131-v6so4886270wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 05:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kaMHaMh+SKFpQWBtXdD5jsz2hD4kU/qyjqKGsxoT5CE=;
	b=19uxbb2UYX2rbym6pEs4tBIvHHC89kuh5FT6e9LpzviZaaU+1z9UmubAYKdE0D5nIr
	Aikbyqv/DIWp8tz8F2S8v2OQ0MYugS62k/aaBwBJ0gPNAOsNwyKBWupg5JioExof1RfU
	xVjMrZiOdnPCkxk4+Sq9ScyZwhHXejJvgyyqMhQF6hcOLUOE1qLm6EbaECFR04sPUp2x
	PPD4BQCaytmoHEwTHlibiTQBDAP1Iv4VhU2xgoYaZDlR3itqfj8eXq4MZ057cd4MLjJN
	BmLcF/ExclDvUr94Dl5kjIzjbEsFMp6PkdWwgz0w/QgU0aXhUUm48RT74EAAgnshYj+s
	3ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kaMHaMh+SKFpQWBtXdD5jsz2hD4kU/qyjqKGsxoT5CE=;
	b=Zvyx0oqFmF1GpElKU7Lw/JFcll8NKcedTSgIqSonubzz8JFrMCIf667D8HCPGPuRAq
	6ds1ydACHdS9ThA3Sd6rfleT8eue+ml7aP2JzvIhF7bzWktQt4XvHjYt2aTRVWyHbird
	FNrFNf65FApQjtsOcaJyZzy0qvixxgvp3cV9pQ9oJ5r/k1lLdjq41rXU6o7oy0vpZPbN
	qLo8j7fqemFyfUDTKFNzZD6yOBDRUXBcZHEA3LtnICZMkvw9AIGc5GObO3xB2q7Q323G
	l4Uv7XbXwojHTgrFlpFrXHDmR8TV/qz6/TOdsf/HmtE/gSqwj0x6RHezfQ/OL2jpV3jc
	lUQw==
X-Gm-Message-State: APt69E3zLubjjiv8NCqpS5WNBtVXclN46Tm9rdDglLrQGGlxDwoMm+B6
	QX4D2kRpzWzbq4RaUtEeE5DCB4J/
X-Google-Smtp-Source: ADUXVKItF1Gog0c1iQGjkoHqjAsVQdL8woljbBjxkJjznVOGeJdOF1clRvsVZ6/KmQx17aqRvDTVhw==
X-Received: by 2002:a1c:d4d2:: with SMTP id
	l201-v6mr11057610wmg.98.1528202990347; 
	Tue, 05 Jun 2018 05:49:50 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l5-v6sm31056419wrn.92.2018.06.05.05.49.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jun 2018 05:49:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jun 2018 13:49:44 +0100
Message-Id: <20180605124945.15313-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180605124945.15313-1-ross.burton@intel.com>
References: <20180605124945.15313-1-ross.burton@intel.com>
Subject: [PATCH 2/3] local.conf.sample: update libsdl mentions to libsdl2
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
X-List-Received-Date: Tue, 05 Jun 2018 12:49:50 -0000

Qemu now builds with libsdl2, so update the local.conf.sample to reflect this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-poky/conf/local.conf.sample | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index aa8df40b87e..d28bf58a1e7 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -234,12 +234,12 @@ BB_DISKMON_DIRS ??= "\
 # Qemu configuration
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
-# seen. The two lines below enable the SDL backend too. By default libsdl-native will
+# seen. The two lines below enable the SDL backend too. By default libsdl2-native will
 # be built, if you want to use your host's libSDL instead of the minimal libsdl built
-# by libsdl-native then uncomment the ASSUME_PROVIDED line below.
+# by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
 PACKAGECONFIG_append_pn-qemu-native = " sdl"
 PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
-#ASSUME_PROVIDED += "libsdl-native"
+#ASSUME_PROVIDED += "libsdl2-native"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
-- 
2.11.0


