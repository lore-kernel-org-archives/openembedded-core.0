Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShJEz-0001ES-Ns
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 13:38:29 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Jun 2012 04:27:44 -0700
Received: by weyt11 with SMTP id t11so4823247wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 04:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=8zKWjj1tent7Oi/xufAG8URdFFq++sfV9ZfChgC8gcQ=;
	b=TgXR4J5Zg0iUHuAHjQoi/2Dz3KQ5ya+9VscSAR91zztWsNN+HHsjZL5cSH2eqVDAMf
	66nIsw1lMKYArC+34d1D3nFV3jHmXM2sSSJsP3ncY6ANYmlmBGEdSo8sUct4kEmqWUH4
	ZNiOIL39TWkQbxXedBp0h0K0YAvUOycfS1n47262ZURABYGBYdcR08r38yqb+Ty0KJrJ
	L/vdLqzMNZhPj6fhr6QmtqijTy2GlrIF3Sidgn0zy3+RQ3r4N11B99kzdXY+ootYzUiQ
	6dF27YWu1EmgcFYxl+MNbbl2K0fpeCfV/l3UPGN4LUfLX8aZwY79/JEbEWCvj5spmnHv
	KhWw==
Received: by 10.180.95.100 with SMTP id dj4mr11320129wib.17.1340191662326;
	Wed, 20 Jun 2012 04:27:42 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	fo7sm38528660wib.9.2012.06.20.04.27.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 04:27:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 12:27:23 +0100
Message-Id: <258d45605e9886e2e51ca71958cea65478e4bc39.1340191527.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <715f2b8f8d165641f28a3eceea55570491e2f9b5.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
	<715f2b8f8d165641f28a3eceea55570491e2f9b5.1340191527.git.ross.burton@intel.com>
In-Reply-To: <cover.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnG6/eec4Z+ZpTEOwGbZpLlaAIsbE5+2g8bOylAQkLwW0Zc9RNsQDgDmQsWz++S+xpgCoW/
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
X-List-Received-Date: Wed, 20 Jun 2012 11:38:30 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
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



