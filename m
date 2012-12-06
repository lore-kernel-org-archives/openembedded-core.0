Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tgajn-0006PQ-01
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 13:39:35 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 06 Dec 2012 04:25:07 -0800
Received: by mail-bk0-f69.google.com with SMTP id jg9so4959727bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 04:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=4bw9JR5oa77M8oPrRaobdluKsh5QrNk77JNPq6SjIDE=;
	b=k2/q/dIwsu3fwQGPJ2/+qSxX1P9HlF9NS7skO3IAsykM33RR5fVsMwdgsybunfkD6T
	r5gkvHU6ivpKY1OrYJw5SbXCIxemeemQAa09PtGLL4T0NXmcPvjVVKvSqK5+5wS9a724
	opo/8a8cnBA7wGDvACHuVtt1igIsiQq6CAT9IEujyXbAlelfVcGRxj52qvY5f+N1U4qb
	jpgiuw/3+xuEp2nJY7jWFwqY+mT2dRPpJQMqMRWx0cYSx/w1qgC8jFvLRfhYJuMz1DUP
	f1Xi87kR1LPkcbqYUgzdW+uO+BbMYW0K+X2rWvkvg9ewEG50qwRA62q5PeK0lgF6ltv4
	zxZg==
Received: by 10.180.109.132 with SMTP id hs4mr2372378wib.1.1354796705556;
	Thu, 06 Dec 2012 04:25:05 -0800 (PST)
Received: by 10.180.109.132 with SMTP id hs4mr2372351wib.1.1354796705275;
	Thu, 06 Dec 2012 04:25:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id w5sm10798645wiz.10.2012.12.06.04.25.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 04:25:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 12:23:26 +0000
Message-Id: <cover.1354796499.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQl7vJQwWq4p3i3BaZINus+y/U3dl+cMknouolgm/kCwGX1U5xGJzgzp4W1DaW8ZZ4BDmJwzcbOpMDpWXa78TnkzLSC1dn5UBjM4e7eSYeHD4AOCIBCUahEW6HFiKp927lCIden+doJuiROvc4mLsngFe854+Nv3/H76AyGiOAI4Hqav2XKYSUX8AUODvKOfjaL3n0+w
Subject: [PATCH 0/3] Mesa updates
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
X-List-Received-Date: Thu, 06 Dec 2012 12:39:35 -0000

I decided against the merging the libraries into mesa-dri, so the cleanup patch
is less intrusive.

Then bump the release to 8.0.5, and package a git snapshot of what will be 9.1.

Ross

The following changes since commit 600fde2acd1b889a4edbb2ac4661cbf562072db6:

  libxkbcommon: make the build do something (2012-12-04 20:52:02 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mesa

for you to fetch changes up to 98aea552ba80d099145992525eaed1f1eff93e22:

  mesa-dri: upgrade -git version to current master (2012-12-06 12:20:24 +0000)

----------------------------------------------------------------
Ross Burton (3):
      mesa: common packaging cleanup
      mesa: upgrade to 8.0.5
      mesa-dri: upgrade -git version to current master

 .../mesa/{mesa-8.0.4.inc => mesa-8.0.5.inc}        |    6 +--
 meta/recipes-graphics/mesa/mesa-common.inc         |   22 +++++---
 ...tive_8.0.4.bb => mesa-dri-glsl-native_8.0.5.bb} |    6 +--
 .../mesa/mesa-dri-glsl-native_git.bb               |   23 --------
 .../mesa/{mesa-dri_8.0.4.bb => mesa-dri_8.0.5.bb}  |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    2 +-
 meta/recipes-graphics/mesa/mesa-git.inc            |   17 ++----
 meta/recipes-graphics/mesa/mesa-git/uclibc.patch   |   57 --------------------
 8 files changed, 28 insertions(+), 107 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-8.0.4.inc => mesa-8.0.5.inc} (80%)
 rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_8.0.4.bb => mesa-dri-glsl-native_8.0.5.bb} (66%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb
 rename meta/recipes-graphics/mesa/{mesa-dri_8.0.4.bb => mesa-dri_8.0.5.bb} (78%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-git/uclibc.patch

Ross Burton (3):
  mesa: common packaging cleanup
  mesa: upgrade to 8.0.5
  mesa-dri: upgrade -git version to current master

 .../mesa/{mesa-8.0.4.inc => mesa-8.0.5.inc}        |    6 +--
 meta/recipes-graphics/mesa/mesa-common.inc         |   22 +++++---
 ...tive_8.0.4.bb => mesa-dri-glsl-native_8.0.5.bb} |    6 +--
 .../mesa/mesa-dri-glsl-native_git.bb               |   23 --------
 .../mesa/{mesa-dri_8.0.4.bb => mesa-dri_8.0.5.bb}  |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    2 +-
 meta/recipes-graphics/mesa/mesa-git.inc            |   17 ++----
 meta/recipes-graphics/mesa/mesa-git/uclibc.patch   |   57 --------------------
 8 files changed, 28 insertions(+), 107 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-8.0.4.inc => mesa-8.0.5.inc} (80%)
 rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_8.0.4.bb => mesa-dri-glsl-native_8.0.5.bb} (66%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb
 rename meta/recipes-graphics/mesa/{mesa-dri_8.0.4.bb => mesa-dri_8.0.5.bb} (78%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-git/uclibc.patch

-- 
1.7.10



