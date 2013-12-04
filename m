Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8A9615B0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 15:35:51 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id n12so14404747wgh.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 07:35:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AOA8lv10OIizi9CrJNIetzxqMANpGMAg9bvvTkoXE58=;
	b=g8jIpoXdLkvhOGCwGGAYL3LwnMklYipyIGBtoEFBA8p+zdQbl09izogKW9MvqcQ6Uu
	Ikucov5LnC9t3xuriQ+VsUv02IxC8fqYoXDF/B5MfScRObJ+lNTGOc6dONL7R+s2nRnX
	CDnS7HGlAfdqav0Tkmdo4b3772kQogWx2SFEGv5io14ni/qITw4dz5aNIL04NsepsVCf
	B7tnclB+kv1SAiEOkbYoiOKMOlzdEyn/iUcwkVfKL8PgtgNSm4wh2ngcNyzCqpQxG8kV
	KHIAA1k9XwbtMnUvHnnL4agtlgj0bt5PcI9fGGxvJBfTEKYvrW7gZMoPN0rdl+x0Jw8j
	0ZBw==
X-Gm-Message-State: ALoCoQmaEhHVtLBwLL1W3kwmqG6kCuwBjn8eXF2HtF4sEliy4j4QN5PXp8oxoIIKeg960XKHDCUN
X-Received: by 10.194.11.38 with SMTP id n6mr64627541wjb.25.1386171351274;
	Wed, 04 Dec 2013 07:35:51 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f11sm7982684wic.4.2013.12.04.07.35.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 07:35:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 15:35:40 +0000
Message-Id: <1386171342-7213-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386171342-7213-1-git-send-email-ross.burton@intel.com>
References: <1386171342-7213-1-git-send-email-ross.burton@intel.com>
Cc: Upgrade Helper <uh@not.set>
Subject: [PATCH 3/5] freetype: upgrade to 2.5.1
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
X-List-Received-Date: Wed, 04 Dec 2013 15:35:52 -0000

From: Upgrade Helper <uh@not.set>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../freetype/{freetype_2.5.0.1.bb => freetype_2.5.1.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.5.0.1.bb => freetype_2.5.1.bb} (91%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.5.0.1.bb b/meta/recipes-graphics/freetype/freetype_2.5.1.bb
similarity index 91%
rename from meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.5.1.bb
index 0b69af9..8e59840 100644
--- a/meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.1.bb
@@ -16,8 +16,8 @@ SECTION = "libs"
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "c72e9010b1d986d556fc0b2b5fcbf31a"
-SRC_URI[sha256sum] = "57bce5b37989577aa8b4a588426839f6bf39bcc3869748cb18f6827df251f4e5"
+SRC_URI[md5sum] = "93eba7854094f46d7d98a9a2370af4d6"
+SRC_URI[sha256sum] = "d715faa92b37980280c857ce9d356fff4361c5a7bd9b5c3f867fc24f598d8f45"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.10.4


