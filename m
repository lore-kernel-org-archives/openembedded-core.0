Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9785E7317F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n205so11549854wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=uMrqINmIlPUrMwzK8wq346FORC5gCdUatKsJnI2aHrA=;
	b=dlZp0U8oT14lxWGXM02UyvENrmM5Jo4CVpozw3imzGShzmZutZHzSk+QTCy+G4CZQU
	ggDxzMJ4Hl5yM36pfNVv32hKaL9xdm4jcGeT2C64qSOsQpVkwQWBiipvgix8owaGiK7b
	HW5ZfwWCTAdt/5p9w35H8x0+F424BnBzkBeAQaGB9WdQhADmIW4KJQQlTiYwe7tDZXym
	BMDPjGropZby4aV9s1J6gfAZnR/m7WQ4yQekhnRiEzsuv/bh8UbG7n3b/L5sQrwHGNmY
	LJU3R4M04n0zS5js7YgcNmItOu7LBPwjRu1MEJCDdAtIpHrURwrgk9FYsfQ+wBNrOpkY
	oYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uMrqINmIlPUrMwzK8wq346FORC5gCdUatKsJnI2aHrA=;
	b=aXd5YqO+w+faOrBaIfulOLU/xMAT4shhaombdE1gmcgDM7eqPHnxaCeSPj6v7pv1nY
	o6H5VSHzP+6sltD3vtYBIb45Uv2tW+Itq1FRZg08yikPZmvKfhFxClqa7dfjZSy3igVU
	H6BjxdGb+ixp3OLzyw393s+FVtUqZ+bfKMbitZzBjYpM1q1uxL6gkwx5YXBOItXBsz9u
	pk+CMH+Ha12fMYTGNopsy6b7e5al8mxOh405NLuGuLl0ScfncF74k/Vq8VYlAV2eXe48
	uOHXR6gH7Ckam2W80x6W87DlcKyogzMxdQbhYMqZ5AcE1VuHmfeNsTCPVmlNrXsHJS/I
	zRog==
X-Gm-Message-State: AD7BkJLTR7F6n5z0gku/98eZQ4S372gslBk9+hZ7pTj09uVk/FjCBkbPsa1k5RJHl7jzZQ==
X-Received: by 10.28.184.148 with SMTP id i142mr14255213wmf.22.1457896496226; 
	Sun, 13 Mar 2016 12:14:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:54 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:15 +0100
Message-Id: <2d2e9a48d4767ece72e05ea7ddc43a80cb06a195.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 17/42] systemd-compat-units: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:55 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 0b8ff09..9ff3237 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -34,7 +34,7 @@ pkg_postinst_${PN} () {
 	fi
 
 	for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
-		if [ \( -e $i -o $i.sh \) -a ! \( -e $D${sysconfdir}/systemd/system/$i.service -o  -e $D${systemd_unitdir}/system/$i.service \) ] ; then
+		if [ \( -e $i -o $i.sh \) -a ! \( -e $D${sysconfdir}/systemd/system/$i.service -o  -e $D${systemd_system_unitdir}/$i.service \) ] ; then
 			echo -n "$i: " ; systemctl ${OPTS} mask $i.service
 		fi
 	done ; echo
-- 
2.7.1


