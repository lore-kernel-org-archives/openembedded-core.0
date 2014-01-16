Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 713ED6D899
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 17:59:42 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id u56so3495562wes.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 09:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cXWspMlGA2dv3HnBiMBvSfD7Ak8jr84AH7wiHziBMWg=;
	b=kCrN5qph4kTmRRQHTdtHsBTwXobcUSHJp1jSF6AfWS6QN0rojiCEkoGexeZnTKVmts
	sKcEerKfVGv9Bx4+yahCLi9BpyjBbz0XBOJbTv6OvjIwWdiG7HlsmVIRPet88EFjxl8J
	ERYNQj9TEpuSRtdKmOU51DdAMqwYiny19hYIkgwUNFjA1hhLZVGRXRTV7Dlq8e/ENS3w
	QSlZiBu7xfYxzwVBAFcUFYkrWt0JbleIbsArezVCAl9waopQ8UeNmJvlARBQFQ71f6If
	MpV0VQ0tflW/eRxzU94YmOVZFvA5rW2Qe9vTJXa19PhmE10AkXrAbfe9J/SsOlpDpOVA
	2Nkw==
X-Received: by 10.194.123.8 with SMTP id lw8mr9805639wjb.40.1389895182751;
	Thu, 16 Jan 2014 09:59:42 -0800 (PST)
Received: from netbook.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id ua8sm6926729wjc.4.2014.01.16.09.59.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jan 2014 09:59:42 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 17:59:25 +0000
Message-Id: <1389895166-2459-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <1389895166-2459-1-git-send-email-paul@paulbarker.me.uk>
References: <1389895166-2459-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH v2 2/3] default-providers: Change update-alternatives provider to opkg-utils
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
X-List-Received-Date: Thu, 16 Jan 2014 17:59:43 -0000

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


