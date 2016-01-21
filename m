Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 10FAB7317D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:02 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id x5so2016797obg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uXEvjmzT8Uaram08KLW6a8FW4hoarU8xHOvz89EHE3k=;
	b=VHAWQpSgHr8+YN5SAoUkVwcc/yKphCghrewe/4G8XX4i23GVpUA6e/MNkQRMwAKLob
	KHW2soKGt3cPrwY01SSrieBGJ3Qt7XjxNTIN9fOiDWlgpQum1JOv1tZedC8ok5Ggg4za
	Hly5Y9PtSTAP1fgHhSwM+fJBRTpjd5BKQosnbpLzVFid9qY1pOiUBxzsYhlhEABp3f+r
	mXiwACDgTN+IMaUoIo82iodmT71YdxgY7wRT2HuqVsVb0d9cHKdynP1PPMtfGhaX1JW0
	KglV8ZwNP6vKLLskNg4N5RgBE/AQNx5WBu9s4QuZJwfTGTj5fDr9CjTe7adTe5K88SPX
	NXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uXEvjmzT8Uaram08KLW6a8FW4hoarU8xHOvz89EHE3k=;
	b=gxRICaHFKmTRjemYmOoMRUzt63xUvXieNKPXWCakWn4i5csB84o5TkZlfXUFQNV57R
	3QQgBg6uubp8bN3uySzns4/o5GvBamjOoaSEzfhRdk0X7+U4DZ3rlM92gCpb4x7iBkJY
	6fBBOGvdufQvCBMSWGQcFwX1KlHThfrwvrPnv024QwHnAY5bAap+3lx9wQQ3DF3MBYAE
	ujX2AMLcX7+DzvfmSFTEk/5VL29tEnZfSV7GHNaCOP0WSyMzJeHLjNxSx5Qssbsnea0e
	8cKA1G909GZw/qSGBfokXEJosDB93PJLvnEVFnBF/m39c7chVO+AuACZtLAyxEVVRWEd
	bb0w==
X-Gm-Message-State: ALoCoQmCJHzI/74diZxMHVUXJIKDjRcAHTjTexVCn7CEJZt2vT1vB5v6OMEY+miIqlGUcLtaZRjRr5L2mR5FZN1JVOtc/WlNhQ==
X-Received: by 10.182.153.6 with SMTP id vc6mr30745546obb.71.1453354623532;
	Wed, 20 Jan 2016 21:37:03 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:02 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:18 -0800
Message-Id: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 00/32] gstreamer1.0 cleanups + update git recipes to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:04 -0000

v2:
 - Improved commit messages
 - Drop bogus RDEPENDS on perl for plugins -apps packages
 - Apply gst-libav 1.6.x patches to 1.7.1
 - Update main recipes 1.6.2 -> 1.6.3

Andre McCurdy (32):
  gst-player: minor formatting improvements
  gst-plugins-package.inc: minor formatting improvements
  gstreamer1.0: minor formatting improvements
  gstreamer1.0-plugins.inc: minor formatting improvements
  gstreamer1.0-plugins-base: minor formatting improvements
  gstreamer1.0-plugins-good: minor formatting improvements
  gstreamer1.0-plugins-bad: minor formatting improvements
  gstreamer1.0-plugins-ugly: minor formatting improvements
  gstreamer1.0-libav: minor formatting improvements + update HOMEPAGE
  gstreamer1.0-omx: minor formatting improvements + update HOMEPAGE
  gstreamer1.0-rtsp-server.inc: minor formatting improvements
  gstreamer1.0.inc: add missing glib-2.0-native dependency
  gstreamer1.0-plugins.inc: add missing glib-2.0-native dependency
  gstreamer1.0-plugins.inc: convert GSTREAMER_1_0_DEBUG to a
    PACKAGECONFIG
  gstreamer1.0-plugins-good.inc: remove duplicate --disable-examples
  gstreamer1.0-plugins-bad.inc: don't set ${S} or apply version specific
    patch
  gstreamer1.0-plugins-bad.inc: update hls dependency gnutls -> nettle
  gstreamer1.0-plugins.inc: drop obsolete lib-link.m4 workaround
  gstreamer1.0-plugins.inc: don't set base SRC_URI via python
  gst-plugins-package.inc: drop perl RDEPEND for XXX-apps packages
  gstreamer1.0: update 1.6.2 -> 1.6.3
  gstreamer1.0-plugins-base: update 1.6.2 -> 1.6.3
  gstreamer1.0-plugins-good: update 1.6.2 -> 1.6.3
  gstreamer1.0-plugins-bad: update 1.6.2 -> 1.6.3
  gstreamer1.0-plugins-ugly: update 1.6.2 -> 1.6.3
  gstreamer1.0-libav: update 1.6.2 -> 1.6.3
  gstreamer1.0: update git recipe to 1.7.1
  gstreamer1.0-plugins-base: update git recipe to 1.7.1
  gstreamer1.0-plugins-good: update git recipe to 1.7.1
  gstreamer1.0-plugins-bad: update git recipe to 1.7.1
  gstreamer1.0-plugins-ugly: update git recipe to 1.7.1
  gstreamer1.0-libav: update git recipe to 1.7.1

 .../recipes-multimedia/gstreamer/gst-player_git.bb |  3 +-
 .../gstreamer/gst-plugins-package.inc              |  6 +-
 .../gstreamer/gstreamer1.0-libav.inc               | 17 +++--
 ...-libav_1.6.2.bb => gstreamer1.0-libav_1.6.3.bb} | 13 ++--
 .../gstreamer/gstreamer1.0-libav_git.bb            | 28 +++++---
 .../gstreamer/gstreamer1.0-omx.inc                 |  7 +-
 .../gstreamer/gstreamer1.0-omx_1.2.0.bb            |  1 -
 .../gstreamer/gstreamer1.0-omx_git.bb              |  7 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 74 ++++++++++------------
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    | 14 ----
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb    | 17 +++++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      | 43 +++++++++----
 .../gstreamer/gstreamer1.0-plugins-base.inc        | 26 ++++----
 ...make-gio_unix_2_0-dependency-configurable.patch | 47 ++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   | 17 -----
 .../gstreamer/gstreamer1.0-plugins-base_1.6.3.bb   | 18 ++++++
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     | 22 ++++---
 .../gstreamer/gstreamer1.0-plugins-good.inc        | 36 +++++------
 ...1.6.2.bb => gstreamer1.0-plugins-good_1.6.3.bb} | 10 ++-
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     | 18 ++++--
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        | 14 ++--
 .../gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb   | 10 ---
 .../gstreamer/gstreamer1.0-plugins-ugly_1.6.3.bb   | 13 ++++
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     | 20 ++++--
 .../gstreamer/gstreamer1.0-plugins.inc             | 41 +++---------
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |  4 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 29 +++++----
 ...gstreamer1.0_1.6.2.bb => gstreamer1.0_1.6.3.bb} |  6 +-
 .../gstreamer/gstreamer1.0_git.bb                  | 19 ++++--
 29 files changed, 329 insertions(+), 251 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.6.2.bb => gstreamer1.0-libav_1.6.3.bb} (81%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.6.2.bb => gstreamer1.0-plugins-good_1.6.3.bb} (54%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.3.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.6.2.bb => gstreamer1.0_1.6.3.bb} (72%)

-- 
1.9.1


