Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id E50BA60B39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 16:34:08 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id e9so977539pjr.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 08:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LBpw5gle9+jLJihNRr8o3wTT1jGpwog4kUDp1Hb31Sc=;
	b=uBJdZGu4lyfT1rCgPtG5TNOGK9yVFEEuICt0tzNfx/6KHxbwO8BkmNBsihgsJBPnsf
	AwU9GWpc0Oh/yflCzVDMUQsl2494/0pWkm0yPjFem9xx223Pe5K0kDctbpBhxB39Dh5z
	ifZPrvhLg6Api4Bw1y6lpq15R4PaTWaAjnNPZveJJjQNdTwyZAGpDSUVX8WnWcF16hec
	BOhDXtepPP0eoVaiHdhyTe8DU5/iomcNY/NxvO4FCz1u6K6bepyZvyKxdtn/bQx/t+Lx
	nDdgRn5cfeqYiCGki7g5T/XlCAVWHL2bBIs59pvyhVwOQZ4FKQsurAFOqmdluAC8VLof
	uaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LBpw5gle9+jLJihNRr8o3wTT1jGpwog4kUDp1Hb31Sc=;
	b=Z1hUpxxt/jNakrrWpNOETI7HjSuGatKATLZ0+L0PTBnyOD3mHhkXA83g7cEzbSY4Ob
	wIIp305n87DATnh99pVLTZg8/MNSrvKHeyMJ7HMutjcrxBt6hSU+Htu91P8EPqqc4pH9
	BujZyYsjY1wXgrHCun1wVpxlDPSf2aUhnvhmGCfkMUUpZug56yU5IHUrEYGrW7ohg08C
	tRaQ9x3XBaK1Nbblol4Yt7xFof8JVc5R0cNr+xRA/MQ87o1gb1e9vSdu+i61gvWHMS1E
	GsyH+4kV/C3CGv2q8aifNHgi2aUccpRsCTSYZsRA18q8KpHMhWJi48eVP/kCYPdvkYI5
	F4Mw==
X-Gm-Message-State: APjAAAVYueQ/tRHlc+HrqEF+cq/1IAm6OEOqeu6o1KE8kszqeQNgCs8E
	fYIZK/8zG3nE4XQUedl+IAL03JfPwuQ=
X-Google-Smtp-Source: APXvYqy4srAM4IsN2rhJUoKf3VSluKUAo4igtartGyySCQDAuibQF7Rsl/170CgNMCghzkyquU7m0Q==
X-Received: by 2002:a17:902:9a4c:: with SMTP id
	x12mr35629873plv.297.1582302849170; 
	Fri, 21 Feb 2020 08:34:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	m128sm3378145pfm.183.2020.02.21.08.34.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 08:34:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 08:34:20 -0800
Message-Id: <20200221163420.2383120-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] musl: Update to final 1.2.0 release
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
X-List-Received-Date: Fri, 21 Feb 2020 16:34:09 -0000
Content-Transfer-Encoding: 8bit

Detailed log [1]
[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=a662220df547e5c2446518e74440a7d834f9ebe6..040c1d16b468c50c04fc94edff521f1637708328

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b6ec6fe9af..afc8446547 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,9 +4,9 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "a662220df547e5c2446518e74440a7d834f9ebe6"
+SRCREV = "040c1d16b468c50c04fc94edff521f1637708328"
 
-BASEVER = "1.1.24"
+BASEVER = "1.2.0"
 
 PV = "${BASEVER}+git${SRCPV}"
 
-- 
2.25.1


