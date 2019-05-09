Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id F27A37DFF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 22:57:44 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id k8so3421867lja.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 15:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7YEZzmOMSRusHrR8E87yQASChv/QzoS3ldEaDbZnEEY=;
	b=OnOwX42O3IeneHKCazve7/O65myzNqX8VbwM1xW7bT1uC8Wo+pKtTHVwNu4aQb7Ay4
	B3NxQ9q8IqkE9PYdDLwgwKztc7+u+EzCk+Haujl3+p17jUkJ+zX358UmkDVheZRDwdgJ
	AOqSLixtYUeUrSz/w/8/ofZbHkYMi8PBzDF8Ktsvc81NUhgzvjuXo1QHiVYsRWyT3p7u
	H+nRhPfXnBjaHmh85CY5kP09BEM/s6//OFrWVTpJSFk8eiwPPhPfKqqCiu57TALFJD/J
	5j1LAOqJ+ABxaQLs6nLQZ4bFsT4MXw6FHL07gvyaXZJ9CEcQgoAO6w9SwCj2Rg77IdsU
	qRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7YEZzmOMSRusHrR8E87yQASChv/QzoS3ldEaDbZnEEY=;
	b=Atx6veSNxhAfjrhx/H8d7aMNhRJRPWJPbhr4Oq2pXF3Tf1Nmdkpi8Ow+4tjARmLJ3s
	ctCrWcTgC2w8LQ8juwy0eaeD86C72vIUo6Ig6JH4S9AoE0IgLl6oUpabBswlk7paHxK7
	2LbH3aSlT7BdsVpmdMh0aBha3lFy0kMY8YqmKHpAq/5mdzdh9t2koTyQ05AnJvRnKSxN
	19PVPJD6yAw2bZEdIt71SggMk7renjuPg/7Lh+PU1w5oys588YBVvBmHqiuj8vXFowP5
	4EApoEg5OjSIrYyyWfqhsDk2J0LSte5P243uip6byBhxfgdS9f3oEp6VN3dixn4G9E6v
	gN2A==
X-Gm-Message-State: APjAAAWWtB1o2GqWi4jBkMaNwGzngilbhWSHMIuvzDxV4czRshJnJSZy
	ZeBrSM2V5E3QMsYGDwGWHQZNvAbgIPk=
X-Google-Smtp-Source: APXvYqzRUwh48lmtxDTYTse2v7R+5nshRxqDJjt3pzHAK/8nB6zYh+LKhpKAx35N8ADJZQnv4Fq2Bw==
X-Received: by 2002:a2e:9ec6:: with SMTP id h6mr1527411ljk.169.1557442664850; 
	Thu, 09 May 2019 15:57:44 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id l14sm658625ljj.15.2019.05.09.15.57.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 15:57:43 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2019 00:57:39 +0200
Message-Id: <20190509225739.8626-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] bitbake.conf: fix XORG_MIRROR URL
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
X-List-Received-Date: Thu, 09 May 2019 22:57:45 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c13e4f3f71..4466f41d75 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -649,7 +649,7 @@ GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
 KERNELORG_MIRROR = "https://cdn.kernel.org/pub"
 SOURCEFORGE_MIRROR = "https://downloads.sourceforge.net"
 XLIBS_MIRROR = "https://xlibs.freedesktop.org/release"
-XORG_MIRROR = "http://xorg.freedesktop.org/releases"
+XORG_MIRROR = "https://www.x.org/releases/"
 SAVANNAH_GNU_MIRROR = "https://download.savannah.gnu.org/releases"
 SAVANNAH_NONGNU_MIRROR = "https://download.savannah.nongnu.org/releases"
 CPAN_MIRROR = "https://search.cpan.org/CPAN"
-- 
2.17.1


