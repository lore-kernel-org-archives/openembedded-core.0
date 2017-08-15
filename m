Return-Path: <net147@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1D97D784A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 12:08:14 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u185so1251287pgb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 05:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VPKvP+O8uoSIz6BvmvTjPjuZLE5WDLTUE+rFBM3NYdM=;
	b=qo++AYw+Fi9r302OVLf5T97NsgIYOr0kBenBUaZzvGUV3A91MCEnVJhrOOYEK9qSuY
	xHuAUpe/ENVB6rzG5QATcBa7K69WNQ5YFxeVoxoaWCHWzF7BAE7loeiZ2TNPVrPn+ww4
	ev2yka2lCkh3dY6FC65EMsSrYIRrGKsK1Z1unM+Eqo8ebCnasPVjB7jHn5G8qJhFU5CB
	ER+moD2H1WKmISqpCFkKNFAItzK2NnCNiqj75hBDQOwRH9VXg2Z37Yjog9YSlfEL/9Uy
	9Fk0xcLsQskYrWk+4sIthNj9Fs7FE6mriW3ZC9Q9StpDZXhB5HSLV69wBJfp1gYUEv4O
	uZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VPKvP+O8uoSIz6BvmvTjPjuZLE5WDLTUE+rFBM3NYdM=;
	b=i+aquFXsadDrmaexjeHAZu5OZt6wV/JqqmIHd8rwMhVw6FgYjBsMzwueMBtAMSXCv8
	U1LzVB6yvsFwCIxuPkFw3z6MrOQQ95mzVRydcTYq3fiyXYoAkmLcL6opeIF4s9rlksFo
	dIv80hM2T/z1GmAPgw/VN3lR5GLmmIwExX3GYrblxqZ/8ENrvuGxRxYURGR/JOlc6nb8
	UFsp9STi4CLOq9GW3r0Q51VdLGZHmC3XnVwac+AK5as9Akbjxn4Vaw3VOMp9atruS7Rv
	dCmllKCQBvqQ8PjgtzER8fbrxKZBJUrIWcLtA/QhwkzYjDeYE+5O32OPBNmMkRDVik3X
	rrUw==
X-Gm-Message-State: AHYfb5geZBvfCkpCDNiIo2N3OknQ02tjxmAIJM2e8PMhDBmfXZ69a+zN
	r3B+FtYCWxbOFw==
X-Received: by 10.99.149.6 with SMTP id p6mr26929716pgd.412.1502798896431;
	Tue, 15 Aug 2017 05:08:16 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	j26sm1666832pfj.69.2017.08.15.05.08.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 Aug 2017 05:08:15 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 22:09:35 +1000
Message-Id: <20170815120935.32675-1-net147@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] syslinux: Update HOMEPAGE
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
X-List-Received-Date: Tue, 15 Aug 2017 12:08:15 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.03.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
index 69bce1f8d7..f8b1094096 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Multi-purpose linux bootloader"
-HOMEPAGE = "http://syslinux.zytor.com/"
+HOMEPAGE = "http://www.syslinux.org/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://README;beginline=35;endline=41;md5=558f2c71cb1fb9ba511ccd4858e48e8a"
-- 
2.13.2


