Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4E50A7CBF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 15:19:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i16so2741260wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 07:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BL3ZUwp+yCDRRXvs3RiyshwawayNMNYQ91N4K+P3Lzk=;
	b=Uixgi5NxhVk71M030RWqcEJVq3csteBBBiO/p5iQfdxvkuoxKgbL2cuulNJNOgqhOE
	1EnICCs11vjaeDv4nVtJjiOX7qk41GiUBnJDYYWFIAjGDxpGaYyG8hHjDfwcT7RbbqzA
	njKSU+8giTQMX+u+XzvPNd/QPQHtT0hL0IagdAjvRIVaIXwUcCD1EsxYDNzJk97vAaDZ
	KAVrdRegzKujmtoo3KzIN99xlN3GvW/Nc9PZCSXc19MnisaCKPecg7bbhCxcwjFjb1PI
	kkvfIh5gc1sWyvtdGwB1AgIKXrfDSCNvlctB+hOSGZ9OLZfiwq200MhRgrqwDQy8Zm+6
	p89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BL3ZUwp+yCDRRXvs3RiyshwawayNMNYQ91N4K+P3Lzk=;
	b=dCRExAZnl8tMeT2ZGVGrsUCUgx8LGc2HZlLAFZljj9FYT+3TQmBa+2Pe8jFLYKbs8+
	xV2OJpldsfT325tCydnJ4JU3I5bYng3eJq3Fc3W5khddNUzJ/jtEjVq4GW5GlFk6wOl0
	DFU8hRUNDejMnPoCmCYGz8xgsp8V52ohlXBUkGmsEJ+1KOf3LahMKPF0N4nZMlWonKzu
	JFAGA81XiurQTmgdq+e5tm9AAZXgr1669VUo1+6ZT/Y3hwXCpxFuEWk2FyOXpDvcn9/Y
	3CFx/skUwYd7SNPRpRFdwaifNs06cVspwEj0nY3qcGY6GzYojg9CG2V8rgEy0ejLb7eI
	0Htg==
X-Gm-Message-State: AHQUAubwiSpQB02UjvHe/nHvZXjGgjnTAf6nGyjrbuq5W2+nVTcf6AWP
	WMdWHTKJMvyeJFyZikmpedjmyE6HKX8=
X-Google-Smtp-Source: AHgI3IZgZt1v2bks0Zpbd9/Bztfu0Ec4SZtXz+m/n3M4TQPczBVCB7HMxI8hD+z4/gJ9sjaoMtLkYw==
X-Received: by 2002:adf:f244:: with SMTP id b4mr3521435wrp.289.1550848755742; 
	Fri, 22 Feb 2019 07:19:15 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	p68sm1069848wmp.17.2019.02.22.07.19.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 07:19:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 16:19:07 +0100
Message-Id: <20190222151908.70732-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] util-linux: add the missing manpages PACKAGECONFIG
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
X-List-Received-Date: Fri, 22 Feb 2019 15:19:15 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index ea654e193af..e30e6331fd4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -105,6 +105,9 @@ EXTRA_OECONF = "\
 "
 
 PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+# inherit manpages requires this to be present, however util-linux does not have 
+# configuration options, and installs manpages always
+PACKAGECONFIG[manpages] = ""
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
 # Respect the systemd feature for uuidd
 PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-systemd --without-systemdsystemunitdir,systemd"
-- 
2.17.1


