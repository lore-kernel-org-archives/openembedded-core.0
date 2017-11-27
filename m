Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 89BF278347
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 15:56:52 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id z184so18855620pgd.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 07:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=evJfdaWFKVBUf5iBcXi9Ob/bqQhh/z8pmBK4QFDGdRI=;
	b=lB5HujleVfdl3Kfingo0FLBuiHEtH/nWPoUbHLU6tDtFFI2F9KgdcP5XKFmx5gD1aR
	xjWoDEemzeJ99a4sg2sf3tUNfeEne/xD1m+sr+dDqfPbatGKRjSK0qCM3FWfKMOg6VTK
	cV4eRPBt/OpuFJDKypMTnGP2Vj/4UzKynAvhrbzCNezgsbiWUTVorZvFLNx7guNXOXVb
	qqO0UjjgOTA+cbzrhnFrKvbK/pht4rhAqYYQhAi+PQf1jUzetmk9tSENUC+pDAHRJKkW
	4MtIondOubxRcU90mBx9S3SLN3Jw+K9nH+iS0E8JGf8/nyVRQdplBpcy8BNh4DyGuU58
	DkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=evJfdaWFKVBUf5iBcXi9Ob/bqQhh/z8pmBK4QFDGdRI=;
	b=lnUWCTsd7RTUGnkYR+pPcWb905txt+qbXIYa02o4thm1kzDD5nrFDr1Ys3tr9pLph+
	z0XMEgzEhV0TbkN0Db4VP87o+BH+Zr1zgR4G5JC2cwWQI0Pgw0n9GcwfFGuDwUPwUEBl
	XwnbVEbzMAKJNCQQloqmQJnnxCTpjClkDEZe2MbxxZEsqkVFcc1JcJ/WElrEY/8F4cAf
	pbjY3mbSA9op7/sBfIGgMfzywdePOOxfbAnQBhxs8lQc2NM+GydYVZGA8I4TtF5wKp/s
	9W3SV8hN/Xg5+n2eRMhYECijdv9jRPOVHdqsc5bGSwUUPzNh7As7D9c3LG4y0iaYU8Vk
	GTgQ==
X-Gm-Message-State: AJaThX6BhD1jqq7ILmibSCaQkCWpgIg2JEkW/j5HFCvWeGz8g0KPI4Jl
	bJUxmypFpcQvHtup7bI6He9ewv0=
X-Google-Smtp-Source: AGs4zMZJQVDadz33cz/JkxJvpfKwak+tzJI1O3s66BYJ9hlXL92ghoit/9NR0+u7R2or0QjKBqpV4Q==
X-Received: by 10.101.72.1 with SMTP id h1mr28444449pgs.164.1511798213912;
	Mon, 27 Nov 2017 07:56:53 -0800 (PST)
Received: from pohly-desktop.fritz.box (p54BD51E2.dip0.t-ipconnect.de.
	[84.189.81.226]) by smtp.gmail.com with ESMTPSA id
	m87sm40889460pfi.88.2017.11.27.07.56.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Nov 2017 07:56:52 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 16:56:41 +0100
Message-Id: <66206185d88df02f17308fb6f183fa541bcaac7c.1511796276.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.34dd9130ccff96d177d10e8e7e414aa4ebbb71c2.1511796276.git-series.patrick.ohly@intel.com>
References: <cover.34dd9130ccff96d177d10e8e7e414aa4ebbb71c2.1511796276.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/2] connman.inc: do not check IMAGE_FEATURES
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
X-List-Received-Date: Mon, 27 Nov 2017 15:56:53 -0000

Recipes can't rely on IMAGE_FEATURES to determine whether the
resulting packages will be used in an image with read/write or
read-only rootfs because IMAGE_FEATURES is a per-image recipe
variable.

The connman.inc code checked IMAGE_FEATURES to determine whether
/var/run/connman needs to be created via tmpfiles.d when booting a
read-only rootfs. In my tests that is not necessary (anymore?),
something (connman itself?) creates the missing directory.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 6c8f405..2b03f9c 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -97,9 +97,6 @@ do_install_append() {
 
     # For read-only filesystem, do not create links during bootup
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        if ${@bb.utils.contains('IMAGE_FEATURES','read-only-rootfs','true','false',d)}; then
-            echo "d    /var/run/connman    - - - -" > ${D}${sysconfdir}/tmpfiles.d/connman_resolvconf.conf
-        fi
         ln -sf ../run/connman/resolv.conf ${D}${sysconfdir}/resolv-conf.connman
     fi
 }
-- 
git-series 0.9.1

