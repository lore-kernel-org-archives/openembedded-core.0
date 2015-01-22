Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9853665C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:39:31 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id w62so2843035wes.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=iNQaeMwgHDNAH9y0e32izbf551LwKTPvtftLNG5LWQU=;
	b=FXMLRCW8IYsvYEypIRlZFCPIGe9gTVNJj5wWCm0kFLWVcexnxgmrnYBJlqpWRN/six
	VV/b1Xps2hdkEFJHkBvqfJXy1wxhOWmZiy48WFTAUKqvowTfH6Essw/0WANoJWHV+/Bv
	sqijTsxoYDKITT8CxOXv0rgFvULrLbgfpCJ3tCGNsxIveJNv+myvz+SrwrY482UGAZoP
	I5gGrqq2i82LD8mKTgzyFgPaiJqGFjA9RGaFFs8Qy5Tt6aXxnEBw4YsJMKhFidO0/Zpq
	QroghJfEibZq9vYYy1ve70/EMFf5UNAk6xr1JcZvcS+54646GAJiHLK+aBnfreU2Ix4W
	R9oA==
X-Received: by 10.194.191.164 with SMTP id gz4mr4972176wjc.70.1421944772052;
	Thu, 22 Jan 2015 08:39:32 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ej10sm7147882wib.1.2015.01.22.08.39.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 08:39:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 17:39:30 +0100
Message-Id: <cover.1421943849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCHv4 0/4] libav-9
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
X-List-Received-Date: Thu, 22 Jan 2015 16:39:34 -0000

Changes since v3:
added LICENSE_FLAGS to libpostproc as requested by Ross.

The following changes since commit 0bcc01121e928d0be7a0550e500425852c63cf98:

  arch-mips.inc: Add the MIPS ABIEXTENSION to toolchain name (2015-01-21 14:28:43 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/libav
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/libav

Martin Jansa (4):
  gst-ffmpeg: add dependency on libpostproc
  libav: drop unused FFMPEG_LIBS and move libpostproc only to 0.8.11
  libav: drop older 0.8.* and use libav-9 by default
  libpostproc: import from meta-oe

 .../gstreamer/gst-ffmpeg_0.10.13.bb                |  5 +--
 meta/recipes-multimedia/libav/libav.inc            | 13 +++---
 .../0001-configure-enable-pic-for-AArch64.patch    | 23 -----------
 meta/recipes-multimedia/libav/libav_0.8.15.bb      | 18 ---------
 meta/recipes-multimedia/libav/libav_9.16.bb        |  9 -----
 meta/recipes-multimedia/libav/libpostproc_git.bb   | 46 ++++++++++++++++++++++
 6 files changed, 56 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
 delete mode 100644 meta/recipes-multimedia/libav/libav_0.8.15.bb
 create mode 100644 meta/recipes-multimedia/libav/libpostproc_git.bb

-- 
2.2.1


