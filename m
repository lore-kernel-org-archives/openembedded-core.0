Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id EFF8E601F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 09:44:22 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id k71so14723804wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Aug 2017 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=HXcQPxbL8MMmB03bXHkLLYLdCHgHBu5+LxQkW2uKu14=;
	b=mbd++tIpb36duOtbOtzaKyG6omGVD6kuKklX16TbIWdbT/kTv4xw5lrcVZJ2PkQ2pP
	2vdMwoAfbfaHQY46AEv54C8Sl0nP4i7Apawxo7dQakmGFKdj+LEpenC/LY5eOohHJut5
	hev0/0GR022EuC9ayp71Fa4A2obIhKPCAN4Hk+YtW2lfv65hbRfDlZs5MgIqn+IPXnuA
	WoOklJkRPwD2WPsUwN0/8oeZS3iaFSxwFDyPQdiaBPKZZQNZoi/2HWscv5M3mz0+HS9n
	xxFSJ4LXFyl4xchOn0fpxXnElWrunC3SF8XfAyvTsjIHLhhz2jbpcQt/rOL+NASe2AfA
	Y1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HXcQPxbL8MMmB03bXHkLLYLdCHgHBu5+LxQkW2uKu14=;
	b=gsgrCf+4jHs9xZ9ig6qwkCgx78EqfIL6hQTvojxJdmiUMc6ioxc9av65pVhHetJrIJ
	EQ0NioJw9mrvXExkq6WMIOvQeOLAJk2ASNKe/vXdal+MvAxO+jyDcKKcyA5h7IkEBUdD
	AUoK6UviFV/lR4zEBkNDTJ8qAH1C+U3+IVXJsQQMvCKyMMzgkbrlVuH1BkcpDwkZqVXq
	R+yRaMmb5XLC53cqOEwYr5E6a8tKvL581M63Y60ilV7YC36Z4aeQTLyR4xeAGL35GNbF
	I5MWg0QZG7kCpEGOESN6RLJF6o4IslHOQQFoJHmLgvgtb2fOVcadhmY5kJBQuj9qBzBJ
	eGNA==
X-Gm-Message-State: AIVw113ntk5fZS4A0knnGjxY+YErlPDhGzobY/GbvvaLmBZGf1vQ9qBD
	OBf1D9OrJV5g7PdAL3U=
X-Received: by 10.223.173.135 with SMTP id w7mr1139267wrc.278.1501839863551;
	Fri, 04 Aug 2017 02:44:23 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	p140sm3486498wmb.28.2017.08.04.02.44.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 02:44:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 10:44:21 +0100
Message-Id: <20170804094421.13226-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] checkpkg_exceptions: add LLVM
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
X-List-Received-Date: Fri, 04 Aug 2017 09:44:23 -0000

The git mirror of LLVM doesn't have any tags we can track for release
announcements, so exclude llvm from the checkpkg test.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-selftest/files/distrodata/checkpkg_exceptions | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/files/distrodata/checkpkg_exceptions b/meta-selftest/files/distrodata/checkpkg_exceptions
index ff54cf0baed..d87a80de7a7 100644
--- a/meta-selftest/files/distrodata/checkpkg_exceptions
+++ b/meta-selftest/files/distrodata/checkpkg_exceptions
@@ -8,6 +8,7 @@ gst-player
 kmscube
 libxcalibrate
 linux-firmware
+llvm
 lsb
 mmc-utils
 ovmf
-- 
2.11.0


