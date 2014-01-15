Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8796AE73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:17:40 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id hr1so1593731wib.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 18:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cXWspMlGA2dv3HnBiMBvSfD7Ak8jr84AH7wiHziBMWg=;
	b=QEOGfgO9vgQGeViTqnQYu9+L3LV9JoWCl9FJURNttSM/PsbHRFwLFww6lEG4ZCAQpF
	icQXBjmcR0Pu4y+wPbERcYpXoXq50TUm3fZJ2CmIFdtMityEi9WTCE2s6dziL19/FySe
	flybWv7f4Wv7FJ0/xfh4OQD08Vsp6Lakp9EZJawdK9yzWrt7jhRXdm9ndldSOOae0xt8
	ScpTjPtsNZSLWqSXzDqVZbOJygtUUYc1CMJuJJzlTkZo4tGoTNatkn8N0tg3X5V7jQrl
	xWB1omWaw0ZVvjb8DmVy0WWI3NiPtr661NXOWwMdqh8sp960VId9G3NU/ebX2g7tA2po
	GYvQ==
X-Received: by 10.194.78.210 with SMTP id d18mr1415424wjx.27.1389752260771;
	Tue, 14 Jan 2014 18:17:40 -0800 (PST)
Received: from netbook.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id gd5sm26004632wic.0.2014.01.14.18.17.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jan 2014 18:17:40 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 02:17:25 +0000
Message-Id: <1389752246-4296-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
References: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 2/3] default-providers: Change update-alternatives provider to opkg-utils
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
X-List-Received-Date: Wed, 15 Jan 2014 02:17:40 -0000

This allows dependencies to be added to the opkg recipe without causing circular
dependency loops. As opkg-utils has minimal dependencies it is the best recipe
to provide update-alternatives.

This partially solves Yocto Project issue 4836. More work is still needed for a
complete solution.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/conf/distro/include/default-providers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index e2b0892..419ffcd 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -10,15 +10,15 @@ PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
-PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
-PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
+PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-utils"
+PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-utils-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
 PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
 
 #
 # Default virtual runtime providers
 #
-VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
+VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"
 VIRTUAL-RUNTIME_apm ?= "apm"
 VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
 
-- 
1.8.5.2


