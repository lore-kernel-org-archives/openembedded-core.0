Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9D71A60991
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:25:34 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id hr14so232019wib.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=zZh+a7328nekjURK+zsA7K8tUCxg4QmIUPkeNcu1DMg=;
	b=G+IJGJtgeW4Nx5Wv6k5Bia0kkuKXHjkzZvTbpb221Rg6tUr5st0PvEv2PNI1lHAWzf
	MzwJ6uaAe81SoqXIjtV0Gy3Bx0CGNpWP8CWeE8j7ZvtdoxI/TJhwLtdeEjrs0TOJpNam
	etx2QFMW0CgMSEIlRxXtmkQGq+47f52Rt2ay6qmjXniVi4Wo7TryETrzDDhwwNVpOmnn
	Od+PAwJJ9cR8MF8uXHbBcfZXtNakQkWGwZMAiw9X7o7JaFx6kC7DLCydw2TyQ2QEKBbx
	Kmmp2ssjcoVURmW5YKnByl94hCu04dzUZcPNAlQ7nmtXMWiRqVmS2vOLwjCDHDKvYwqr
	KkBg==
X-Received: by 10.180.72.230 with SMTP id g6mr3335289wiv.8.1369920335274;
	Thu, 30 May 2013 06:25:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ca19sm38020385wib.3.2013.05.30.06.25.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:25:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:22:16 +0100
Message-Id: <1369920136-2815-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369920136-2815-1-git-send-email-ross.burton@intel.com>
References: <1369920136-2815-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmFfweE3OFGGYtflJzk3AULsek0lsDTJS7tu2S9LAepfmwVHPmkkknthPQ1k1y96ApwXNYB
Subject: [PATCH 2/2] clutter: remove documentation hacks
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
X-List-Received-Date: Thu, 30 May 2013 13:25:35 -0000

These sed lines disable the documentation and appear to be historical, building
works fine without them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index e1d3cf4..68cb22b 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -39,10 +39,6 @@ PACKAGECONFIG ??= "x11 glx"
 FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
 
 do_configure_prepend() {
-        # Fix up some weirdness in the docs
-        sed -i s:doc/reference/Makefile::g ${S}/configure.ac
-        sed -i s:doc::g ${S}/Makefile.am
-
 	# see https://bugzilla.gnome.org/show_bug.cgi?id=661128 for this
 	touch -t 200001010000 po/clutter-1.0.pot
 }
-- 
1.7.10.4


