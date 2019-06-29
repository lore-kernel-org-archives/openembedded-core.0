Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 34E8C7E98F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 18:23:46 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id r9so9056617ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 11:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=aHAe9J8GB/H1MhR6RvKiGCm5Z0aVr/H3Z/ZNeIESBzQ=;
	b=peSN50PyyjBJ/SuVeR4cecGDGwHOvC997OREjirppWverZZ8EFgvL0dHAZVjHfdrGA
	WxUHQooeQ4UTAF4LK34l8QjLiEZCxQA08KX5TkNTl1KYy3Uy4V1Ic3DMvJBGOq3WeDWd
	E50zJZRrjeHFwLPAIBwZyoC8IQM8KQ4/wsOHE6sCMBbNyF7sQVMCGGgwDCcGp6OoZtrx
	RrH4SXNLZrRyafGWRS9OzIqWiD6niSKOdST1aU0EgX6jyagvcAqAyVjSyOVhKjycz33O
	MZdb2zGcVi1de2p5xopJbEQ6M8MeTAwcudeCSNVmlVSol+2KpaTeIU+QKf48jJRZ0+o7
	dzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aHAe9J8GB/H1MhR6RvKiGCm5Z0aVr/H3Z/ZNeIESBzQ=;
	b=o/J14Bfrf/95NihHRcPPgLhG2obM/+VjpdEiZpEkL5svH48efoP+qQgfPYzo50NUAl
	bIi9oHUemYawutjLxsUcwaN9nnVbuNBuMFZzzux9/YyRhRkWmlZ+WbAhaPUAcPdDE4rG
	F/CMC2eoQ+cGj/tV8kgyRihl/d2vNcyUSfKg7mQnuLTeWiC4Hm+f3a7l6CScMb2ckB6Q
	9//v9+GVs1uG07tr4Aq4pR7JxIUe1vEEkpb9OlUuGzaG2zdMms8hfymlPXl7li5kPdJK
	NbCiOrxE6/FKPmsJioFaah9W1z63cssKS6WzJCOG/JiZsR2GsI0CvaJAkplOMms3rLaM
	SZLg==
X-Gm-Message-State: APjAAAVirna/1JhMlpQbSUwa5Xy1KXZHfcZWRSGRH21oMsAxZVATAzXn
	mYjtp8EzP65LhjrJfNorr08sXMf/Oro=
X-Google-Smtp-Source: APXvYqzEjTmt0J7VQoDyIpRy6Yz4/g+oU57SeajS/CVoxLYGDqgbwimPygIPM7jX8MNy083ZVS+7Jw==
X-Received: by 2002:a2e:89ca:: with SMTP id c10mr9554984ljk.106.1561832626573; 
	Sat, 29 Jun 2019 11:23:46 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id a17sm1629889lfk.0.2019.06.29.11.23.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 29 Jun 2019 11:23:46 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jun 2019 20:23:44 +0200
Message-Id: <20190629182344.27805-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] mobile-broadband-provider-info: update to 20190618
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
X-List-Received-Date: Sat, 29 Jun 2019 18:23:46 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 77adcebbae..90ed0d38d6 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://live.gnome.org/NetworkManager/MobileBroadband/ServiceProvider
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
-SRCREV = "c7def60ba50d9cc30a90f69f89d7e82243501e86"
-PV = "20190116"
+SRCREV = "22b49d86fb7aded2c195a9d49e5924da696b3228"
+PV = "20190618"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https"
-- 
2.17.1


