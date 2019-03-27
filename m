Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA4F7CDF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:09:28 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id p14so13536494ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 07:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mGsakqSCrSQIp9MG0BjPH8k0gTlWxO5e/pCyidfUf1s=;
	b=NQ7XZpCT49sTOh//pR8oDe2zMt7s3qZ5tSixm1Fue//TVkNlLKn/v6wcA27TA6a3I6
	cUETAJlNymrMI9r0ZMOJIfm0Wp1Ncq5C4M5M9OFUr8X3zDZZhTj9bh0E1eUYTuBKvouw
	0xdwNiPS+A3+V1Kn4NqH/G4NVwFRqvTVXwng4qCBfaRNSWDmVlTsAr7QTdY2mT8hqzrc
	Qpq2acLilkyYy86ZX7HOMgw6XVxbIJW0fyo6bwgjazrAofenbL/smYjk6r3qh75a2Hjg
	2/HbNu77aO1otwySat1neFQ/kg7M5h/+CuZIUK5DW/ctoJ6OTwfClWOu2470GenphKO8
	AaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mGsakqSCrSQIp9MG0BjPH8k0gTlWxO5e/pCyidfUf1s=;
	b=KcuY9gRw8Vt0aAQeQeF0lD3CThO6PMwgY8ZQJdLDM4v8oJ+0qKmoMIer1LIm1cdbOR
	PdWcDvKvRcKOHYjxi36Obii1gRJaJohNPQp4mvnO0Qe/3l8Cc/HS/xXdO9QYsFmUIhml
	doSGwciLjCFndHDygfSHoeOC42y/T/mb6bbadZ0in/9zRBaMDi/oERHQslSv/aajwblc
	F8bcYSElskjVkGLCu4zLsK4JHeitLWPXlWHh/bm3hbOMwiz63aNkmwkiOJ37bt18hsWh
	TBnUlySXOgOFZ0QBulOtoc0P5tjgiJSg++uyhspuBAFqs4LAG0r2ce8LEHShcKiMPN+/
	/JyQ==
X-Gm-Message-State: APjAAAUtV9Sm9Lhnuo0Xs6A1NB88Yl8rNYIiGObw1UigeIkbUzIyLfFn
	buukMq50bEa3JqAGbs04VxEND1bJ
X-Google-Smtp-Source: APXvYqwsGpCjIdY4lJyT3oDtEiD0dK6gQ8ihnJvcyhP4spPv444CUC0M0aXC26Y1/OrrBhElq5nFUQ==
X-Received: by 2002:a2e:500d:: with SMTP id e13mr20004643ljb.169.1553695769011;
	Wed, 27 Mar 2019 07:09:29 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 1sm4704382ljw.56.2019.03.27.07.09.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 07:09:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 15:09:16 +0100
Message-Id: <20190327140922.109867-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327140922.109867-1-alex.kanavin@gmail.com>
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/8] syslinux: fix upstream version check
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
X-List-Received-Date: Wed, 27 Mar 2019 14:09:29 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index a7fc21e2fc1..67e5d57d48e 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -26,6 +26,10 @@ SRC_URI = "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${PV}.tar.xz
 SRC_URI[md5sum] = "2b31c78f087f99179feb357da312d7ec"
 SRC_URI[sha256sum] = "4441a5d593f85bb6e8d578cf6653fb4ec30f9e8f4a2315a3d8f2d0a8b3fadf94"
 
+UPSTREAM_CHECK_URI = "https://www.zytor.com/pub/syslinux/"
+UPSTREAM_CHECK_REGEX = "syslinux-(?P<pver>.+)\.tar"
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 # Don't let the sanity checker trip on the 32 bit real mode BIOS binaries
 INSANE_SKIP_${PN}-misc = "arch"
-- 
2.17.1


