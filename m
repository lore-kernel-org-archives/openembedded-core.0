Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6A12C78544
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 17:11:18 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id v15so8056128wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 09:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fnveXSPdOicxWS6CX+o/30ZuTPb/EhGaRudFdoFn7f0=;
	b=fX1/k/np9Q0Q9lXyovN4hcx9u824Ug4XLx7Jyw/czF+oJVT4XuuxY26snR/W88NEgx
	k2dM9z62s6sP+A9D0UGzWrAgDdO1JpxSLbGpIOrKq1h8AhdxGF//ILy6tXUwOEiAOZ+o
	kYSEkAUsMqbIDO04zP/PzanQhU1IkDLI3ilozkCnDS6678f8ZZ1vQpIAHJH3/WeM7ay7
	+MbBjbGqd93WygyvfFhiiX9xhHOI3XjFiymnX/ggEhBBIlmk1MxE8PImmeVIpphl+F+d
	4qtDemephzQOHIVh9pGJ2BdYuMZ3w+WQ82p/PMkGSL8wpcIsTfVXykVT84oVZG+I1Ape
	rMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fnveXSPdOicxWS6CX+o/30ZuTPb/EhGaRudFdoFn7f0=;
	b=DSKasbGJfs2JPWvQyjcunYbOW9dcZ4rVGIVnixSHT68roeVNiP/C4gexYYbIOrnTaU
	kLyh1Xp/NvARpcm1W6jCq/D+ISSTkp+t4Ab8ltceE9M7QzkAxd4516rETygU1dnGzITK
	d2KOfimDssglz8bjn/39CAuxnvOQxgO5ImRbzVYDt9n1OqtYWvAHJ0QECMrrIMKzDp8a
	ffjq+HLQ/kx/ZWOLpzacfs7/iRF7zpW1uAfqPTdTKBcF/UTIZYOFJkMQzY9aWvaxJJqR
	FqoyWAnsjkOyGok39d3FBX0EZJbNsz61VWcFbcFJkvve0fEThRXCEnncDzIyWfqYf0kf
	lJ5g==
X-Gm-Message-State: AKwxytebrEdgx3o8hQwyw2C10t7nLa9LGLSdZvb0dOYNbJF5UUKktr5W
	cM9TlzJTVEF4G6w9zl3uVhZz4WYn
X-Google-Smtp-Source: AH8x227KKZkAOfhvntImDmH90EtKhY/czHAb5fNE+/OJhVKfPG1pOmg4zNS224Px6MYTedJTRBp4xw==
X-Received: by 10.223.178.9 with SMTP id u9mr18591125wra.149.1517245879864;
	Mon, 29 Jan 2018 09:11:19 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e16sm11515244wre.5.2018.01.29.09.11.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 09:11:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 17:11:08 +0000
Message-Id: <20180129171111.14502-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180129171111.14502-1-ross.burton@intel.com>
References: <20180129171111.14502-1-ross.burton@intel.com>
Subject: [PATCH 2/5] bluez5: only depend on pygobject if its going to work
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
X-List-Received-Date: Mon, 29 Jan 2018 17:11:19 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index e78f174c5cb..2607a058228 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -55,7 +55,7 @@ S = "${WORKDIR}/bluez-${PV}"
 
 CVE_PRODUCT = "bluez"
 
-inherit autotools pkgconfig systemd update-rc.d distro_features_check ptest
+inherit autotools pkgconfig systemd update-rc.d distro_features_check ptest gobject-introspection-data
 
 EXTRA_OECONF = "\
   --enable-test \
@@ -129,7 +129,8 @@ def get_noinst_tools_paths (d, bb, tools):
 
 FILES_${PN}-noinst-tools = "${@get_noinst_tools_paths(d, bb, d.getVar('NOINST_TOOLS'))}"
 
-RDEPENDS_${PN}-testtools += "python3 python3-dbus python3-pygobject"
+RDEPENDS_${PN}-testtools += "python3 python3-dbus"
+RDEPENDS_${PN}-testtools += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-pygobject', '', d)}"
 
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'bluetooth.service', '', d)}"
 INITSCRIPT_PACKAGES = "${PN}"
-- 
2.11.0


