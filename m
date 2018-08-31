Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C4E0479567
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 13:41:38 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q8-v6so5411523wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Qv20HNO2zJE9GWMTqk6QvUQo+n8/HikKTqdJYVc/xvw=;
	b=K4/lDI78lOpzZelIvdg1eFOjVkhOblpSuxeEaexG/ZgWC1GoWi7mejp2KPki/vkUNG
	Ong0jko2W4xcDbEeYP6CzZZDVgUS7RrZcZuDTAXCC2lpXckw2UOQbUWGA7JDugk/5M5l
	FFfIcDopvbNsmuDWeTUxJAcZ7t0asMLVeF9E9QzClx2ap4rd3O4cNXE5ktA+Ly9wsEFN
	DaJW96wLDNtwLK8rG2gNl7C49xNjdfvTW5tmAOVbuXkSmev3Fd/rB9dLyzHdOULqzdU1
	zjTlE7Cs7Uq1wyXs3q30SzA5xiQSeOaQ2McbBHkviGgEf56cascq0/Tkl4N+6Vz1PAc1
	rmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Qv20HNO2zJE9GWMTqk6QvUQo+n8/HikKTqdJYVc/xvw=;
	b=Qyp1ddy1gYIRSkMTRe/CONegAxRBnQZeLnEwRz1JHCLdiIpscGbn5uI+UStk+rgj3X
	aDXBHCIu+/CkL/jhSdh8P1SsfiJU8WzDI0DzpfG8vKYzROf6jiZ3AROazoVaxR3kmuQf
	RfItbm8EGkRSTGtn0T1ugTwJsOPHoTVCdL2440/VLlCZdlC1T/5DfsYRCnBON0zmO8Fg
	PTezYVmjR4SyOvhbKvsNxJUTYnl97+4e8lyLnf1cNu68p7Jw/3bFDBxJjVBEPXfT10Ey
	8+5+rXF28lSuyl7/hSZnD+TSe/Uu/RGU2jg41N2w1ebAmJmRXEOXAwvgHAIhAeI4eMsu
	KbhA==
X-Gm-Message-State: APzg51B4vJkhgXABlNUvo0CPIPDMpZyv4DQQr4M58wVGFIJq2e7BlPZI
	UQbRJ0pSycsGoRWBWmVLkxH/YTAlHkU=
X-Google-Smtp-Source: ANB0VdaE4+/JbtK8FNgAUcJxzqbhGLpeJMp3UjTtNBtt3hwnigikEf9l+N4+p+OkEgZutI0o3ebhcA==
X-Received: by 2002:a1c:7305:: with SMTP id d5-v6mr4825900wmb.53.1535722898925;
	Fri, 31 Aug 2018 06:41:38 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h73-v6sm12602991wma.11.2018.08.31.06.41.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 06:41:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Aug 2018 14:41:35 +0100
Message-Id: <20180831134136.18889-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] fribidi: add (from meta-oe)
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
X-List-Received-Date: Fri, 31 Aug 2018 13:41:39 -0000

Originally this was fribidi 0.19.7 from meta-oe, with the following changes:

- Upgrade to latest release (1.0.5)
- Drop GLib and PCRE build-dependencies (removed upstream)
- License is *or newer*
- Upstream has moved to Github
- Remove the historical PROVIDES (patches for meta-oe sent)

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libfribidi/fribidi_1.0.5.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-support/libfribidi/fribidi_1.0.5.bb

diff --git a/meta/recipes-support/libfribidi/fribidi_1.0.5.bb b/meta/recipes-support/libfribidi/fribidi_1.0.5.bb
new file mode 100644
index 00000000000..303ccb71d0d
--- /dev/null
+++ b/meta/recipes-support/libfribidi/fribidi_1.0.5.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Free Implementation of the Unicode Bidirectional Algorithm"
+SECTION = "libs"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.bz2"
+SRC_URI[md5sum] = "0f97f65038545340316ec0f4bd53df0b"
+SRC_URI[sha256sum] = "6a64f2a687f5c4f203a46fa659f43dd43d1f8b845df8d723107e8a7e6158e4ce"
+
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+
+inherit autotools lib_package pkgconfig
+
+# TODO use Meson instead of autotools when
+# https://github.com/fribidi/fribidi/issues/87 is solved
+
+CVE_PRODUCT = "gnu_fribidi"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


