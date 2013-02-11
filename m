Received: from mail-wg0-f54.google.com ([74.125.82.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U4w8D-0004od-Mk
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 17:21:27 +0100
Received: by mail-wg0-f54.google.com with SMTP id fm10so4992792wgb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 08:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=aFB6sxlfTv2g8D9ZyCPNuXiy9gI5BZF6RppK/idFO/A=;
	b=hq/+lvRVRhqHBUz6PtIoB2BBGbiFR9BCaYd4ik9Evz9+Kj0CXBKrMY8nlBDKx2VbAy
	OfabULb2MSPbbje7QJZ7ebyWEvLNWp9q3SRikKksQthTWNn9JCT0+nl9gUDCwfB9N0fb
	WtdcQFC+XpxH1Lqmc9bqqU8uvVIIpcgnslxrU6AcT+zwrXGb9VKrnsV/JI8meWkI2MCZ
	gKwfUKudU6sG1+Nye09Ol1TX6/pl4kJD7mKO8FpdJvjS9OFQLrQ7fDbt7I1LnmnAMII4
	kWtMFgQh8LmWQmRQIRSWlImlqJ84LXeN6eJ8mFvUh7WwA4nbaA3+41WkZu3UXncIZTI7
	31Zg==
X-Received: by 10.180.92.39 with SMTP id cj7mr6481009wib.19.1360598722681;
	Mon, 11 Feb 2013 08:05:22 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q13sm32487856wie.0.2013.02.11.08.05.21
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 08:05:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 16:03:08 +0000
Message-Id: <cover.1360598515.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlKE6F/Te2BuNxrS8gKo1kp4Mzx+67V4i0ciBmAb8x2pgUTtxGYkliVEX5uKrb8XURxr5CZ
Subject: [PATCH 0/3] Clean up fontconfig recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2013 16:21:27 -0000

Hi,

The fontconfig recipes were showing their age with lots of cruft and plain odd
constructs.  Distressingly the majority of them were from myself with no clear
commit logs.  Thus I was guilt-tripped into cleaning the fontconfig recipes up.

Ross

The following changes since commit 00a2411470b989ca80bc2a6de08d105bc400dae5:

  libiconv: Remove RPATH from binaries (2013-02-11 15:41:20 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/fontconfig

for you to fetch changes up to 27fe822aa3e7bfc8523f9a074c623ee0270cbefa:

  fontconfig: rename the patches directory (2013-02-11 16:00:58 +0000)

----------------------------------------------------------------
Ross Burton (3):
      fontconfig: remove unexplainable and broken build tweaking
      fontconfig: drop explicit -native recipe
      fontconfig: rename the patches directory

 ...Add-sysroot-option-to-fc-cache-and-fc-cat.patch |    0
 .../fontconfig-2.10.2/fix-pkgconfig.patch          |   15 -------
 .../fontconfig/fontconfig-native_2.10.2.bb         |   14 ------
 .../fontconfig/fontconfig_2.10.2.bb                |   47 ++------------------
 4 files changed, 4 insertions(+), 72 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.10.2 => files}/Add-sysroot-option-to-fc-cache-and-fc-cat.patch (100%)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig-2.10.2/fix-pkgconfig.patch
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig-native_2.10.2.bb

Ross Burton (3):
  fontconfig: remove unexplainable and broken build tweaking
  fontconfig: drop explicit -native recipe
  fontconfig: rename the patches directory

 ...Add-sysroot-option-to-fc-cache-and-fc-cat.patch |    0
 .../fontconfig-2.10.2/fix-pkgconfig.patch          |   15 -------
 .../fontconfig/fontconfig-native_2.10.2.bb         |   14 ------
 .../fontconfig/fontconfig_2.10.2.bb                |   47 ++------------------
 4 files changed, 4 insertions(+), 72 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.10.2 => files}/Add-sysroot-option-to-fc-cache-and-fc-cat.patch (100%)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig-2.10.2/fix-pkgconfig.patch
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig-native_2.10.2.bb

-- 
1.7.10.4



