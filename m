Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8140B71DC7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 11:58:16 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id v77so34606694wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 03:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=g0pQg6qOnVo09H97znQk+Rk8857Wl5LOHsWn+CjX3X4=;
	b=qIbtVj53Px55A7KzolUe0RkQ8/K7fPjXCbN/SAJUwGAtEYcJTmL1WOU2Cxthraedve
	96Wk7Vmw9EBtNBJhZKBvOcDpo32gUsMXmYk0dMxibDrTfwklB09rv3gi2mFV1uF3DSuP
	KaOIp9X/aMU0V0fgmTP+kGEDPcJtt3UYGQTgtrRdA24a3F+/qaHKjQgzYx6jgiVErzrB
	ukgTDbUiiIKaK0qlpLISWDsxFH4YuflN3DmtO/3GyvCV2W0ne9GDHoT8wiVpNEJ2RFmG
	Kho8pLcCxEjsZIE0gYRkx9xmXmzrzPh1GMLIzv61ARODVQJHOJ06IS4xOym/b8wcMZ+w
	G8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=g0pQg6qOnVo09H97znQk+Rk8857Wl5LOHsWn+CjX3X4=;
	b=tktLeIfEafY1K9o2eTfhTVPR/qRJe5f8990ad+3hM5sKMKhrQruNfn8rqotV82G5p/
	9IPghlZS4zBgmvKGaZwJ0mO/1NWnCaMLHytDpof6qnPTNoJxJj8bQjv9fFzqbTyuSdUG
	O5X2IZ+OvdKawWov5pLQdjU46l9fxYXom+ES6iwwDDK6Nc+TYUNsH92rGVRMAJomiYEC
	HOPkjt7UTsoCc9SCLCjuBq5exfiBzE5QPGktj5B1kihmwneS/Z6VCOY0dp/rIMPxletq
	y5G2/5EObWqrUsvqDolHOAFdHQdCfG7sMW7HDagkPY5t01POm9Buh6DvNOa+efrXKzR6
	vTjg==
X-Gm-Message-State: AIkVDXLr6Oyphl+QK/o9MA1WETOo+1KrBqjJ7dtyg8blIpn4XtcNJB3FzTak4oyLj/qEikSw
X-Received: by 10.28.198.139 with SMTP id w133mr21804603wmf.80.1485950296170; 
	Wed, 01 Feb 2017 03:58:16 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o81sm29099002wmb.14.2017.02.01.03.58.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Feb 2017 03:58:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 11:58:13 +0000
Message-Id: <1485950293-1372-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] cups: add missing pkgconfig inherit
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
X-List-Received-Date: Wed, 01 Feb 2017 11:58:18 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 2ce9c7a..e69f178 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -16,7 +16,7 @@ LEAD_SONAME = "libcupsdriver.so"
 
 CLEANBROKEN = "1"
 
-inherit autotools-brokensep binconfig useradd systemd
+inherit autotools-brokensep binconfig useradd systemd pkgconfig
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system lpadmin"
-- 
2.8.1


