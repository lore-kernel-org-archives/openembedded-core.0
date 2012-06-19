Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sh0Qu-0001GB-Ey
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 17:33:32 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 19 Jun 2012 08:22:47 -0700
Received: by wibhn6 with SMTP id hn6so2544039wib.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 08:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=iwQNGOgjJNagqZiqM69A74VApB+yycFDNTCoB2/UqXw=;
	b=eQBw+jT2hN3zz1Ger7F3/f/XYR4tql6KiK+yTMFxhAect48gdKesPDeZ2j5+TtKC6y
	fZ2eSe0cBUDpyxGQI/sZ96DgYw2K6RHaE6ElsRYPQyzf/n6O4yzKt7UJJ3ClJLax/0L2
	4aq/XuGG6qD4N4c+D/m/eyudgxpaKEHg63FXsixZ5LSoWvH7+glh+EP5PYMkVMJJh6/d
	AzSwLmNTLge8I1NiuS18f2AffQKUd7+NJJVubsDLwSNwpov2ljC6o7TVRNZGwyK7yugp
	UcfHCNBinhw5WJVSJ/jYtATDf48Fw7Y05yA3ep+qS8iQyeUl3G+3gsax/tNxoCpsUe18
	4uCQ==
Received: by 10.180.80.228 with SMTP id u4mr4353838wix.5.1340119365623;
	Tue, 19 Jun 2012 08:22:45 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q6sm33612651wiy.0.2012.06.19.08.22.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 08:22:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 16:22:29 +0100
Message-Id: <3dedba0929d96edf837a0a6091b7bc008959cabd.1340119197.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <b434d2456d62bc5ffcd1cc513b977d8eb0f0bdb2.1340119197.git.ross.burton@intel.com>
References: <b434d2456d62bc5ffcd1cc513b977d8eb0f0bdb2.1340119197.git.ross.burton@intel.com>
In-Reply-To: <cover.1340119197.git.ross.burton@intel.com>
References: <cover.1340119197.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmj92As/oQWceyPvxoIIipsnO+5x1tf8fHw5BNDHugzc5LV/gYWYdVNx0KTJHYaheY6UFEx
Subject: [PATCH 5/6] connman-gnome: clean up runtime dependencies
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
X-List-Received-Date: Tue, 19 Jun 2012 15:33:32 -0000

There is no need to recommend Python as it isn't used, and specifying the connman plugins should be done by the image.

Add a dependency on connman itself as otherwise connman-gnome doesn't do much.
---
 .../connman/connman-gnome_0.5.bb                   |   15 ++-------------
 1 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
index a4327f5..8a6878c 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 DEPENDS = "gtk+ dbus-glib"
 
-PR = "r11"
+PR = "r12"
 
 SRCREV = "42c652d123ea133d0a0930b96e8e39dbd0c597b5"
 SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git \
@@ -24,15 +24,4 @@ S = "${WORKDIR}/git"
 
 inherit autotools gtk-icon-cache
 
-RRECOMMENDS_${PN} = "python  \
-                     python-dbus \
-                     connman \
-                     connman-plugin-ethernet \
-                     connman-plugin-loopback \
-                     connman-plugin-udhcp \
-                     connman-plugin-wifi \
-                     connman-plugin-fake \
-                     connman-plugin-bluetooth \
-                     connman-plugin-dnsproxy \
-                     connman-plugin-ofono \
-                    "
+RDEPENDS_${PN} = "connman"
-- 
1.7.7.6



