Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7E542771C0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 15:46:26 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id w123so85626193pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 07:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=dl0rJGILc7+z/w1hCzYfslPNiNOUYHX1CLOwF4igzHI=;
	b=ml7ZLZ1Zq40oAIAkLRA2Db1D0u35eq1mzrrOmhjboHrH8IYKw9F+R+aW7GhgZQpT1x
	p66O+irl6xp8GpZE+5KTwKmWKksvJ6qbI+Jnw6EqqusZhvyhVt0oeNap483b0vIkMzvn
	agSduK8vy/XGvQKAJjXWBqE0RV4QuQSeEVzQp9zS4cSND9LMIS2+40FxzFb7gsTtgeF2
	QWmLUjLNAE86ruupbW2wMIb3Pg/DNjnQCZgXSLza0EFO+6mdUqF6FEJPCFp4kkJKDrSj
	cDHbA6la/xdHoJu5ToqGFZGay7BpbCeB+5rpDO8mWKf1AbS/ytiO7RHr/9XCBdjZbutz
	4qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dl0rJGILc7+z/w1hCzYfslPNiNOUYHX1CLOwF4igzHI=;
	b=LjY7SQJpLXgj6icD1AloWQ6HsRQvqtxrKMzd4epZ9BJ20GyzeytCQPAqXfgIcs3/bf
	+oIw/w810HzaQ30bSxL8RYXbR0M5byXpmA5e17/+1+ST6q5e22kIlMWptm+hQzCpyQ4E
	BOGeNynIz9nA4qe+jiE26He0hhUab33OqirX4yJ1BC58lp2dbHFdV6+7whHBmBn11VeY
	ScGi1mlxDuUo/m1nodSZS2zlComPzHVRX3Jlg4JXNxCl+q/Eb4p3efi4snLzJ22V/3lu
	bihWsUTQE8GABtyxpmn/1uH+qnYvodJm4xt4doyqKyxa7JxLjnIa0n4q/v1RgPzAlEF0
	JGZA==
X-Gm-Message-State: AG10YOT9+5WfByKZLE3S+aAwlWnw6mjsw38NzNSOvy64pkLO15pcrky8fXzHpoQOIWMGUA==
X-Received: by 10.98.65.148 with SMTP id g20mr28604367pfd.21.1454773587059;
	Sat, 06 Feb 2016 07:46:27 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	s197sm32055878pfs.62.2016.02.06.07.46.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 07:46:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Feb 2016 07:46:13 -0800
Message-Id: <1454773573-6990-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH] lsscsi: Add new package
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
X-List-Received-Date: Sat, 06 Feb 2016 15:46:26 -0000

The lsscsi command lists information about SCSI devices in Linux

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-bsp/lsscsi/lsscsi_0.28.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-bsp/lsscsi/lsscsi_0.28.bb

diff --git a/meta/recipes-bsp/lsscsi/lsscsi_0.28.bb b/meta/recipes-bsp/lsscsi/lsscsi_0.28.bb
new file mode 100644
index 0000000..4b8cbaf
--- /dev/null
+++ b/meta/recipes-bsp/lsscsi/lsscsi_0.28.bb
@@ -0,0 +1,12 @@
+SUMMARY = "The lsscsi command lists information about SCSI devices in Linux"
+HOMEPAGE = "http://sg.danny.cz/scsi/lsscsi.html"
+LICENSE = "GPLv2"
+SECTION = "base"
+LIC_FILES_CHKSUM="file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
+
+SRC_URI[md5sum] = "4a39e3b09cd422e2cae3edbaf56b3176"
+SRC_URI[sha256sum] = "025d009a1af42bc5b2fca664c44c9ecdfd754356e4a44f5c6aced2420afadd50"
+
+inherit autotools
-- 
2.3.5


