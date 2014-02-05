Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id CFC836D491
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 19:48:22 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id l18so629000wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2014 11:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FndWG+pY3WdatCEzs0lIEPgROBHHOTVDMh9qMX+FJ9g=;
	b=AEi7DtBi1oylTANewTq2LvuosC5RmffPvZvnX+bXwL9aXL3KzoZ7iusiVt4AVCzEEY
	AZXoRKecpVTYDMEm7XdvPqUPebImWURQtfMGRgDA6h5PN8ggnL16Ys6kVy1ylg8jxzJ0
	BlcfBbyTmiWMhRTyiIyxYq4VoUBhrNw67fn835tKNueGveb16XD+TgRBJkYf4ZCodYNH
	qs86j2GdcG/npu/z9RqLPdj1j2pW5sqXNgSBUUZa8MYKg9QCSgcRPJCoEZQ8Ez9hNg/W
	9f/cR7PittdaFiMMKarYt83MHBG4ljE63bsYTjVd2yDkxpgOd0uqX5ut+C1zZANh8d+q
	7new==
X-Gm-Message-State: ALoCoQkQtAALCG9CAj5SI0X17hFKz1C2lcs+iAy0X/evGAfC3RoIuHjSgMAYSVISsoJ/qj0HyGL6
X-Received: by 10.180.188.230 with SMTP id gd6mr3894873wic.15.1391629702925;
	Wed, 05 Feb 2014 11:48:22 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id q2sm63891093wjq.0.2014.02.05.11.48.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Feb 2014 11:48:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2014 19:48:19 +0000
Message-Id: <1391629699-2453-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] pcmanfm: apply a patch to the source, not a generated file
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
X-List-Received-Date: Wed, 05 Feb 2014 19:48:23 -0000

no-desktop.patch was applying to a generated file, not the true source, which
meant it may not appear to be applied in the resulting package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/pcmanfm/files/no-desktop.patch |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/pcmanfm/files/no-desktop.patch b/meta/recipes-sato/pcmanfm/files/no-desktop.patch
index cb4cae0..103d6d1 100644
--- a/meta/recipes-sato/pcmanfm/files/no-desktop.patch
+++ b/meta/recipes-sato/pcmanfm/files/no-desktop.patch
@@ -6,9 +6,9 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 diff --git a/data/pcmanfm-desktop-pref.desktop b/data/pcmanfm-desktop-pref.desktop
 index ccf8abb..3f6fc1c 100644
---- a/data/pcmanfm-desktop-pref.desktop
-+++ b/data/pcmanfm-desktop-pref.desktop
-@@ -97,3 +97,4 @@ Exec=pcmanfm --desktop-pref
+--- a/data/pcmanfm-desktop-pref.desktop.in
++++ b/data/pcmanfm-desktop-pref.desktop.in
+@@ -7,3 +7,4 @@ Exec=pcmanfm --desktop-pref
  StartupNotify=true
  Terminal=false
  NotShowIn=GNOME;XFCE;KDE;
-- 
1.7.10.4


