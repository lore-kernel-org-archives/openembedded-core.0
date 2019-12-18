Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3084E7FF91
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q6so2524791wro.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=auahApo/+hRUfMzr5rZG6AjDp5mtSibwGoJhxRGuu4c=;
	b=Q89uRxBNfHBwj4bwdKQGScs9G2kloYOXulAiQ9mvTBMju8A/jor26gsDQK9fKhsNa1
	i5dXZlI5/bkYSxSHlr9atbxCSp/0PW4AGVI7QVeqVj1IXIP/yUW9Q0VP94GQ0GHxaYjO
	/ZtzLYa4uG1ZGJwUhB9wUG3BdvW3hnebWiPCcDmZGGiP6PTt4KcAdLhggX1IZOHKh/V1
	NAUjlDghnsaXb6qUTrCa13iUuoU1yui4oI1q3qUYrRSh4D8SJvp/0ZpKlCobLssTv2wA
	HMKu+CY4D1Hcv3llriVWeLiEZ76AOW/A0IcNzBFoygLgnouo/6wZZcot+t5SmBaI+wde
	Neww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=auahApo/+hRUfMzr5rZG6AjDp5mtSibwGoJhxRGuu4c=;
	b=nXgCz2IMMzpNRKxS+i5IChxpRV9I8mvvz/6TcXwQBrYd2e/zufymjfxhEH9nnahvbP
	MwWYZ7HqGz1v6WevCY63FXAYemvVbu3o8jR2r2uuO5T9WGOCLIfYTkMX26wyd19TovMU
	gKSzFjskzmK5uYZhgjrhT3gl0LtAcEfP3Ebdx3BlSYZTWiJwwvIjMQtwDTrD57uTTiiW
	nvsLQA71StKfkUoj77/Zuh+rEnxU+9Zqc6E3cmd0oNLdaUiAVKGQcjj8JjX+E/BN4WgK
	SLNnY1z+q5yChZMuwCyPksibaymxzJp5FO03ObN0TvhjHrA4Y51mC2LgWKOLzyOSb3VZ
	lDOQ==
X-Gm-Message-State: APjAAAUaUZI5x14ux72cDn860RL0X2RmndVIbrPWjE2DplAfZVipwD3S
	za1tmcykFgk+0DdWOMT9BraQ7MbCLBQ=
X-Google-Smtp-Source: APXvYqxJ1ToVDmJ4rtzUzIzwJMObZYgEEiUP3f4a5mYg63vCqoq0vS0u/xN9PPI0o0BUNpcHj8DcwQ==
X-Received: by 2002:a5d:4204:: with SMTP id n4mr3305438wrq.123.1576679902655; 
	Wed, 18 Dec 2019 06:38:22 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:55 +0100
Message-Id: <20191218143758.129308-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 22/25] debianutils: update to 4.9.1
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:23 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{debianutils_4.8.6.3.bb => debianutils_4.9.1.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.8.6.3.bb => debianutils_4.9.1.bb} (87%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.6.3.bb b/meta/recipes-support/debianutils/debianutils_4.9.1.bb
similarity index 87%
rename from meta/recipes-support/debianutils/debianutils_4.8.6.3.bb
rename to meta/recipes-support/debianutils/debianutils_4.9.1.bb
index a69d01e0f95..904c52780f4 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.6.3.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.9.1.bb
@@ -3,13 +3,13 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20190717T213444Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20191212T145612Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[md5sum] = "ca57cc6621275346d7d516ab0b5fa1f5"
-SRC_URI[sha256sum] = "2cc7de3afc6df1cf6d00af9938efac7ee8f739228e548e512ddc186b6a7be221"
+SRC_URI[md5sum] = "95633416680bfd249b7cb07d94137048"
+SRC_URI[sha256sum] = "af826685d9c56abfa873e84cd392539cd363cb0ba04a09d21187377e1b764091"
 
 inherit autotools update-alternatives
 
-- 
2.17.1


