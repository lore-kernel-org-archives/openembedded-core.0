Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id E9286737E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 15:00:16 +0000 (UTC)
Received: by wibbs8 with SMTP id bs8so819871wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 07:00:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Of00NNwbXCA8I2YYognybbiJLpipwsFFzNhQMXOzhlo=;
	b=CtX44mfBm+m0cJJe96mHjWAPcjMSJGPlfAL0suD8c6si8bTrWHg6HSBKIzizDtZqHb
	JeFhR+U1sCRYXA81QZ/K9NWE3bJgQoBwIs8ZNs11nPt5TSTZQqm5i8iC+gvguaYP/U4a
	X18vqn8ww3hHQ1FtNtu+3U0WwPO7XYX+HGTVOKAvehOY+KYK2MFN90yIpk9rpCCR0k83
	k1oUBaHpBrnwFdWWZNo5IyAcNFHcDnctcK8m5aBBOAVWrnVPyg+Gjt4OKvGJQUZG4TPx
	JpBUySyk6LFo0CZz5n7coc/rOhDQeXwKKi1amz5lKxRtjgrULNfdYhtmi9cRwPTUmURL
	KQWA==
X-Gm-Message-State: ALoCoQmJHMQ1aMR2hspdK7dF3suEbo7NZ4+zBcTCVHAhCpXng5hB9bwbPEBi3RmIP3QGfnmhXgQa
X-Received: by 10.180.171.35 with SMTP id ar3mr7598908wic.24.1425049217253;
	Fri, 27 Feb 2015 07:00:17 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id dt7sm3138905wib.19.2015.02.27.07.00.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 07:00:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 14:57:46 +0000
Message-Id: <1425049068-11139-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] systemd: add missing util-linux build-dependency
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
X-List-Received-Date: Fri, 27 Feb 2015 15:00:17 -0000

This dependency accidently disappeared in the 219 upgrade, so add it back.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_219.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index f45c5e1..800a495 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -19,7 +19,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
-- 
1.7.10.4


