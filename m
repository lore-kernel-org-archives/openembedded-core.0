Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7fa-00008M-3W
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:42:33 +0100
Received: by mail-da0-f48.google.com with SMTP id w4so928416dam.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=OrUpkt0rTZVEUhCzwjaDiMH1hHAqPGfxO2R8rEXb2fI=;
	b=eBQ3hF5LVklo4K0EmuTrQUMViSvlQf0Kofy3S4V8Ex+TRgq5xhO6TIml2qcR0FUd0u
	AYJPHboBJpSxEhbSJ11qyVNl+eDsCBSi34nDtmo1YS/yzojutzR7cKObv+Kw8skzo5Ud
	T06TtcRb8bsQsbgUme6Tx/4dTJFpuz3Y8S/ZsJ+0b1ExkijwqDjkJPnZJd6hwfF9yGUF
	dNu8WNVSFU8apele5hesNTl7Xuu6+HZPj5k4OTOhJ9Sw+q3tQLxhT9HKuq4srT7yuTiY
	Uoc0h4OocrciwpWTsEs7lpfNnXFJbn2t7Ht3uKlVRap8JALJmSeQ4vkkT5iUmvAxnHcx
	x2wA==
X-Received: by 10.68.137.202 with SMTP id qk10mr30650649pbb.189.1363026318869; 
	Mon, 11 Mar 2013 11:25:18 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.16
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:49 -0700
Message-Id: <228e005f888afff7bd97f015e321a62071c09307.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnZniwsDlMBCrCy7ngoy91n2LiyJ/MLdo+BYseC2Ol/SmOs4KF9tclu9VgUXro+G6hS142i
Subject: [PATCH 06/12] systemd-compat-units: add missing systemd-systemctl-native dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 18:42:43 -0000

This package has postinsts that run on the build host, but wasn't depending on
systemd-systemctl-native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index a7bfee3..19a1ea1 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 PR = "r18"
 
+DEPENDS = "systemd-systemctl-native"
+
 inherit allarch
 
 SRC_URI = "file://*.service"
-- 
1.7.10.4



