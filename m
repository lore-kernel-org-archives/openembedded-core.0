Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U6LKH-0003CW-8f
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 14:27:44 +0100
Received: by mail-wg0-f46.google.com with SMTP id fg15so2708566wgb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 05:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=On5komXa8YEi6HgdK1gl7xIyNyEqI2UKr4WyNSQR3ds=;
	b=l8J/SUJdSf5L7UUctXYVBltFhZdSfzCt0Ho34nCVfDCnrp9S7WfhzKUgF7hhkLdiO1
	sO99r4wu1w1yD5ddgfwLXPHBGtnvSYdo+JWEpM3JhNm9LYqzsE8ve3OgES/oSAsxb70R
	vQ0ORKittFKCwGLMaaxy3SlMj3bTiSbFU+bWfsh27TKIb8/s5nweTwEvSsRRcd0k4awq
	YI/GOQdBeAOBoUYbPX7ResbYPDbKrUuvF/jyGon1uDX5asJQi6n5VsXgsc5H2+0qVgsS
	XFIveAB0iXgKzVkes/TqgybFZ9sXDxaap/5QoSuoyw55AyJkwaQWlCvWOGdcG/3kfP63
	AzUw==
X-Received: by 10.194.92.231 with SMTP id cp7mr4162187wjb.19.1360933897673;
	Fri, 15 Feb 2013 05:11:37 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j4sm2923857wiz.10.2013.02.15.05.11.35
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 05:11:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2013 13:09:17 +0000
Message-Id: <cover.1360933659.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkm8whZZcR9kSNrcymet9F/iACMy2RxwP4Z5YUTjlyrfrosyQkQogvRomKZm6L1tlGAxWlK
Subject: [PATCH V2 0/4] Allow xserver-xf86-config to ship no xorg.conf
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
X-List-Received-Date: Fri, 15 Feb 2013 13:27:47 -0000

Hi,

Same as V1, apart from changing package_deb to have the same check on conffiles
as package_ipk.

Ross

The following changes since commit 5a4ea383c3fc792cea87b834655eb013120fbb15:

  poky.conf: Add Ubuntu 12.04.2 to sanity tested distros (2013-02-14 23:18:00 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/xorg

for you to fetch changes up to 2ea6a8883fe2adfccd845bd94b10c5bf0b03bfe0:

  xserver-xf86-config: empty generic xorg.conf (2013-02-15 13:04:30 +0000)

----------------------------------------------------------------
Ross Burton (4):
      package_ipk: check CONFFILES exist before adding them to metadata
      package_deb: check CONFFILES exist before adding them to metadata
      xserver-xf86-config: don't ship empty xorg.conf
      xserver-xf86-config: empty generic xorg.conf

 meta/classes/package_deb.bbclass                   |    3 ++-
 meta/classes/package_ipk.bbclass                   |    3 ++-
 .../xorg-xserver/xserver-xf86-config/xorg.conf     |   26 --------------------
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |   10 +++++---
 4 files changed, 10 insertions(+), 32 deletions(-)

Ross Burton (4):
  package_ipk: check CONFFILES exist before adding them to metadata
  package_deb: check CONFFILES exist before adding them to metadata
  xserver-xf86-config: don't ship empty xorg.conf
  xserver-xf86-config: empty generic xorg.conf

 meta/classes/package_deb.bbclass                   |    3 ++-
 meta/classes/package_ipk.bbclass                   |    3 ++-
 .../xorg-xserver/xserver-xf86-config/xorg.conf     |   26 --------------------
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |   10 +++++---
 4 files changed, 10 insertions(+), 32 deletions(-)

-- 
1.7.10.4



