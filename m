Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sh0Qw-0001GF-4p
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 17:33:34 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Jun 2012 08:22:48 -0700
Received: by wibhn6 with SMTP id hn6so2544060wib.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 08:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=FDkHkV3srJBfp5XWRhYy8MSBXOmTVKN7z7BW6HJW/ec=;
	b=RvaGwh3qZ1rToyR8nNHarDjMK6p4riz6sVUt1fsxSgWh1qQ9rxbRpTWjFg2I+Lw1Gf
	Yq/vcy4ffKkX4A10OUvt3b7XM9KnFTiEiR4Q/32ZSkgRRbGa/RvSmzke7JT0arlrI7H9
	zwhj+ntow29IeSwiSlBYEi4m2eyPSTb1b1qgkTEw0YFW8PfmDXrcNhzLP3y4MvXu0Zq5
	F6PTzLCOQGNw8mpKErc0DxBphS3+qhV26wogMv1mP5//sQfq6cYF5bq/uwHDwDnjF1nj
	q2fdAifiEIlfbXg0vOsviXsgkbgJErdak14zxb9d0MdJH2koArm9m9mU82bffm7CIul1
	vGlw==
Received: by 10.216.218.220 with SMTP id k70mr10530641wep.165.1340119366960;
	Tue, 19 Jun 2012 08:22:46 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q6sm33612651wiy.0.2012.06.19.08.22.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 08:22:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 16:22:30 +0100
Message-Id: <e7769c0fc5db2ff24d20095e5e53fcd4e492af92.1340119197.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <b434d2456d62bc5ffcd1cc513b977d8eb0f0bdb2.1340119197.git.ross.burton@intel.com>
References: <b434d2456d62bc5ffcd1cc513b977d8eb0f0bdb2.1340119197.git.ross.burton@intel.com>
In-Reply-To: <cover.1340119197.git.ross.burton@intel.com>
References: <cover.1340119197.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlRaAMbIyVhNMWU79EetLcCXM62VnSXOObxOAumNL89Gc0PVGWy78q/u7MhgIT2bhx34tKc
Subject: [PATCH 6/6] connman-gnome: upgrade to 0.7, which works with connman 1.0
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
X-List-Received-Date: Tue, 19 Jun 2012 15:33:34 -0000

---
 .../{connman-gnome_0.5.bb => connman-gnome_0.7.bb} |   14 +++-----------
 1 files changed, 3 insertions(+), 11 deletions(-)
 rename meta/recipes-connectivity/connman/{connman-gnome_0.5.bb => connman-gnome_0.7.bb} (45%)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
similarity index 45%
rename from meta/recipes-connectivity/connman/connman-gnome_0.5.bb
rename to meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 8a6878c..6cceb2d 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -8,17 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 DEPENDS = "gtk+ dbus-glib"
 
-PR = "r12"
-
-SRCREV = "42c652d123ea133d0a0930b96e8e39dbd0c597b5"
-SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git \
-           file://0001-Monitor-the-Manager-s-State-property.patch \
-           file://0002-Update-for-ConnMan-0.79-API-changes.patch \
-           file://0003-Fix-setting-IPv4-configuration.patch \
-           file://0004-Handle-WiFi-authentication-using-an-agent.patch \
-           file://0005-Remove-all-handling-of-Passphrase-property.patch \
-           file://0006-Fix-status-descriptions-in-properties-tree.patch \
-           file://0007-connman-gnome-fix-segfault-due-to-unchecked-null-val.patch"
+# 0.7 tag
+SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
+SRC_URI = "git://github.com/connectivity/connman-gnome.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.7.6



