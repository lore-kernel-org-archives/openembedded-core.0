Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4595D6BEA5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:01:57 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so348393eek.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=8xFr4Is4Cpzzxe+bnGGacNt0cuKKUzQM9i2tTa5MM1s=;
	b=XRiG7Q0DdSkvOemMFDxN4uloeaWdqUwcc5ZIP9pstniDOhzcmUwJBEXYty3/mo4QsY
	I/m0nUxZhijyVOuL/kapp7IqpMSCOph+D+F61IrOpc6wB50o5OWO81oPA32zlXpyyN2r
	F9Q2+ech5razc2zI12K7VmPUU0jhMAIBs48vxEZSi+mCcPAMANGIl5HveKPkknXSsCW/
	xsWuYHAN6I35FJqd1n1obhwoHyG5kVrM8pDKUS7kTyMQX3tV6rmHPmF+8PDj2QaaILd9
	Ip+0QE50RKNtq53QnFvdKLhKznegMTZ1vB0exe/PMjt3JRC7hf48Nm7X4GdPcATXDElP
	6n3Q==
X-Received: by 10.14.88.65 with SMTP id z41mr5371520eee.38.1377792117706;
	Thu, 29 Aug 2013 09:01:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm47231129eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:01:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:49 +0200
Message-Id: <4f13093d16aded6a7f7f8f0a6f8f311e7d2ecd32.1377792005.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 02/20] libunique: Add PACKAGECONFIG for dbus
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
X-List-Received-Date: Thu, 29 Aug 2013 16:01:57 -0000

* dbus-glib was missing in DEPENDS in order to enable dbus backend
  but because dbus was in DEPENDS lets enable this PACKAGECONFIG by
  default

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/libunique/libunique_1.1.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libunique/libunique_1.1.6.bb b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
index adb9525..31af658 100644
--- a/meta/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -12,7 +12,10 @@ SRC_URI[sha256sum] = "e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66c
 
 PR = "r7"
 
-DEPENDS = "glib-2.0 gtk+ dbus"
+DEPENDS = "glib-2.0 gtk+"
+
+PACKAGECONFIG ??= "dbus"
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-- 
1.8.3.2


