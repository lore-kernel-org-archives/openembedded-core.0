Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id CBE9960144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 15:43:37 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so15866eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 07:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wyIg3npV/Mzp9tU7CyJ6+CfA3D0Ke7YyMdcFFBZimyg=;
	b=WgJ40MMC+27IYd/SoMDx7gvA2WC6B0vfMBHQr10LqXT7ZqQWoVja7+5nJI34gDnzeU
	sltxsjK5JWHjrCoef0t0L+LlNWt7TF9+p68X/7Txy8oYp6i0AsN4x9jlXsNti+rZ30Ty
	d8XXsoiXuCMvQ4UWo0WszuFKrh8uqXjmmdWyFCwJfaZANn6/rz9u8Pe1SIQMHMTLAQgU
	dZHNaEYBa/yDWc/VA2ethF0nBT824xYveTS2IimYgst++2XMN81n1OI9s04IO1K0gzBg
	VxPH/Nmlv4/Ky+C2DTbzzKcn2TCInze79of45J7YrOPmGhBaYif8tGmwQkMd+8fVWLSR
	Q75A==
X-Gm-Message-State: ALoCoQkc1tV3WbKwTQx0BVLCa9EZtwEmTuY0G08hxKVY77nyaiimzsywyVtd32GiHPF7upi24Eky
X-Received: by 10.194.189.138 with SMTP id gi10mr33200057wjc.86.1417535017203; 
	Tue, 02 Dec 2014 07:43:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id p1sm32402315wjy.22.2014.12.02.07.43.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Dec 2014 07:43:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 15:43:11 +0000
Message-Id: <1417534991-22035-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] weston: fix plugin location in FILES
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
X-List-Received-Date: Tue, 02 Dec 2014 15:43:43 -0000

The plugins are installed to ${libdir}/weston, not ${libexecdir}.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.6.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.6.0.bb b/meta/recipes-graphics/wayland/weston_1.6.0.bb
index efbbbe0..d30e48b 100644
--- a/meta/recipes-graphics/wayland/weston_1.6.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.6.0.bb
@@ -79,7 +79,7 @@ do_install_append() {
 
 PACKAGES += "${PN}-examples"
 
-FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${datadir}"
+FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libdir}/weston ${datadir}"
 FILES_${PN}-examples = "${bindir}/*"
 
 RDEPENDS_${PN} += "xkeyboard-config"
-- 
1.7.10.4


