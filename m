Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 94C8378310
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 16:50:24 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id y15so525655wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=sXBxe2sD06ojmH3W/P456TLLdn0PQGidzVZ6k+8Mezk=;
	b=OGopvQHPYi2yUAXbcX9c5H1dTEQHH6BGq+aTFCDWBKS3cXPof61gYpEM+1iEak0zou
	wExji71zTyi+F/9MQt+SXjL6Pg4BaZIYE96Dge9GcxjLp/ln00aaciI79AasPSIjFH9O
	OQngrX9297lesXhpZb27pzaawb+258wUZGFxmeMneMQ1V1HOAlUABV8zObt3/HHNgyLK
	LNLTHpbMMsu3Czsk6BYf7767uztArJwDJNm2CzHd6nfWLRzh0Yqh4vTiGGafOgWAIWao
	1TbVGh0FBC6TMC8MCx7/s5LbmJpwK/qzkyYjpxh/YJjA0FtAu8yPZvOWi7HZ666AJCxH
	EuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sXBxe2sD06ojmH3W/P456TLLdn0PQGidzVZ6k+8Mezk=;
	b=YS7ZkDskGiH1OLOMRFaM2/kV1hlq/+T1kH/K/6YHAcUAZ7RbzNSgaOtExSyf1sMUzk
	gUIO4DmpNiIynM0m5LzM1GcYbPnO52cnIQjlnwDn50GEoUqYlptsuU4QRVjBREyZ+QLo
	02LKubSe7i+ZZS1odY/d4IPQS1WitOiRsBQj2MY+9fpzoHC7G860KJv10MoszjOD8bdk
	hTi4c+0wFBwIsLe7J7sDFVYwpcE7YZ8PlkPEl08IC+hBkoB29A5AEKGE30EbEn2Uzci0
	wDj8b0XiXvzcD2GdqrMCFbcLftg5bVr+329RVSpzI6ne0d99Zp86/lGiJ50ga2KFTVjD
	PwYQ==
X-Gm-Message-State: AHYfb5hKaJiSVKLiXzpGhd2/Fgo7Eog/jQySr4WEZM1IuwUclgUutN3Q
	W/XUtgzZs0N5GGCpxkg=
X-Google-Smtp-Source: ADKCNb5w1maKwHsH/m1/kd7HNe3nQR+1/Jskg/ZC6KXJl0808CIOeYCzMYILVkvv8h45SpGkDaUMgA==
X-Received: by 10.223.148.101 with SMTP id 92mr3278819wrq.182.1504198224843;
	Thu, 31 Aug 2017 09:50:24 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q186sm529933wmb.26.2017.08.31.09.50.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 09:50:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 17:50:20 +0100
Message-Id: <20170831165020.30129-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libsoup: upgrade to 2.58.2
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
X-List-Received-Date: Thu, 31 Aug 2017 16:50:25 -0000

This fixes CVE-2017-2885 (stack overflow with HTTP chunked encoding), no other
relevant changes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libsoup/{libsoup-2.4_2.58.1.bb => libsoup-2.4_2.58.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.58.1.bb => libsoup-2.4_2.58.2.bb} (89%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.58.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.58.2.bb
similarity index 89%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.58.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.58.2.bb
index 5b1273efec2..c9f95e538a2 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.58.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.58.2.bb
@@ -11,8 +11,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "91d7a6bf8785d31f4b154a7612e53e62"
-SRC_URI[sha256sum] = "62c669f557de745b7b20ba9d5b74d839c95e4c9cea1a5ab7f3da5531a1aeefb9"
+SRC_URI[md5sum] = "eb33adb459c2283efc5c7d09ccdbbcfc"
+SRC_URI[sha256sum] = "442300ca1b1bf8a3bbf2f788203287ff862542d4fc048f19a92a068a27d17b72"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.11.0


