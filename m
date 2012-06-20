Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShJEt-00019o-TP
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 13:38:24 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 20 Jun 2012 04:27:39 -0700
Received: by mail-wi0-f172.google.com with SMTP id hm11so1400216wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 04:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=FhoxZJ3+xdeiQHiQouZe2TczIDCdF50bWnkQt6014vk=;
	b=DmVmriItxp1mrdJ/hxd9n9LB33/4S1YnUxNdc2P/EjsbNKuhHvoSl/G/d3Obs5765J
	R2UiJ5jqOGUlAM7jKiXnA5OQCHVhijQ9CD0fZkWuizuy8/lfSYitNZeMg2bzNcFMt7av
	QPsuYuSNHUlYN2hGN2ygbXEdl4JQPgiTSjU8qASDOCfOJ0guvWYKwLhfEk7fOTTzJuWZ
	YDj9px9V6WouSBZ9WgDDCzQL0PFOBmkobPB28UxMStCZEcR8nXnPsDjSeve2QRUH/vls
	q4VEYK4MWZGyzHhaWLoa/I8OYBQSxfmiNn9iEqBsP7snNQx6okBtXjLcFGZupIP5VuO5
	UsYg==
Received: by 10.180.83.196 with SMTP id s4mr11327155wiy.15.1340191658860;
	Wed, 20 Jun 2012 04:27:38 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	fo7sm38528660wib.9.2012.06.20.04.27.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 04:27:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 12:27:21 +0100
Message-Id: <ce7942566942adf617bf2975290e76e7dde52f3c.1340191527.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <715f2b8f8d165641f28a3eceea55570491e2f9b5.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
	<715f2b8f8d165641f28a3eceea55570491e2f9b5.1340191527.git.ross.burton@intel.com>
In-Reply-To: <cover.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmKs+D+Z20Nu+U27jexW8OHiEh5QWwDVVSKW7BcXLOicNX3VnTDib7Okegb4THlBAVeP0cT
Subject: [PATCH 4/6] connman-gnome: fix build depends (Yocto #2556)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2012 11:38:24 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../connman/connman-gnome_0.5.bb                   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
index e2e8deb..a4327f5 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://properties/main.c;beginline=1;endline=20;md5=50c77c81871308b033ab7a1504626afb \
                     file://common/connman-dbus.c;beginline=1;endline=20;md5=de6b485c0e717a0236402d220187717a"
 
-DEPENDS = "gtk+ dbus"
+DEPENDS = "gtk+ dbus-glib"
 
-PR = "r10"
+PR = "r11"
 
 SRCREV = "42c652d123ea133d0a0930b96e8e39dbd0c597b5"
 SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git \
-- 
1.7.7.6



