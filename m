Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 882A378906
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 08:08:07 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l4so5253291pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NIE1NTEVb1gbaDIp1yPDxrfm6f5O7UaWGXm1EtWZDPU=;
	b=NWovuV5XrCDH9QQRZxr9KLHsqdfDrKiuxm2+3KJ6F+2PJ/UXYiOc/NicocHByn3ZW5
	EWm9vwcSRcgcGxomwUbKjYJ2vCKzK6082R22Doldbgh3syPmT5ZJzWwFwI7x5AgmPm9Q
	LkrQu/0zSCTbdducb3wCSUpGKyfQ31igL5EopHm151DPB1DTZTJC/E96fKUO320e6RYs
	5Ksf/iJ0SPGFh4NCLyr2I7n9NG/RBwXdTXhmenTMgVY0jhaguDe6z2HXrLC3xr8SSooy
	5CMWwT3UTND1A5eZcrwbLqYuUSrAyqbFOV0JIupz4nv4WR7G3r3Uj5PNxk4dePZ2jFE0
	6sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NIE1NTEVb1gbaDIp1yPDxrfm6f5O7UaWGXm1EtWZDPU=;
	b=bFqmxyJRUxHphuPaNnON0ynzjrfZ+inaNgGnEN+ci09rFzrLz+G1BmX1aV6qwGPh22
	BWcwZUYZ9nb3KQ0Ik56XQk1+N3J9Ei9wIH2xv/hSJrHsscJLRWJxE6cf96NtQniK7bnh
	N2YfafeRHtTjIn+ym5/cLshGC5GxNXsfVldtbK5fAEnfkRLToHZa9o3Pkz2lI+apvPrB
	R0QlbJIl4SCyPu+pXcA/xQdfn7RCiNeOQdclKRL8yECzb1uCeoZeTG4V2bSMjczoCnho
	2C+M6tCIp1LwLIDN2Slw3gl43jw67Iig2vnKOUEF4z4fjQBnrQcsZqLtxOu9YC/1et+F
	Wqow==
X-Gm-Message-State: AElRT7GEZcZTYtnC8O1iMneLUJ44JExcpvi0wZPjKlEtt1BRuHmeDCV5
	/g3uWAsrq9ImSyRD/4sDOTQkDg==
X-Google-Smtp-Source: AG47ELuxorI0ra2Bd7mtw7grZCDwngZfmW3w0++Asj/vjMFMA2Yg24NvuDPrJBV3LKqSq2tyMqgwog==
X-Received: by 10.98.237.12 with SMTP id u12mr4122944pfh.72.1520755688357;
	Sun, 11 Mar 2018 00:08:08 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	q6sm8968184pga.37.2018.03.11.00.08.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Mar 2018 00:08:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:07:55 -0800
Message-Id: <798c7597309d81799ca7e21934f3f31d5cf4c039.1520755515.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1520755515.git.raj.khem@gmail.com>
References: <cover.1520755515.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] tcmode-default.inc: Define QEMUVERSION and softly pin it
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
X-List-Received-Date: Sun, 11 Mar 2018 08:08:07 -0000

This provides ability to surgically override qemu for certain
machines which are provided by external layers.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 5c6681fb9d..7862edb633 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -28,6 +28,7 @@ BINUVERSION ?= "2.30%"
 GDBVERSION ?= "8.0%"
 GLIBCVERSION ?= "2.27%"
 LINUXLIBCVERSION ?= "4.15%"
+QEMUVERSION ?= "2.11%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
@@ -64,6 +65,10 @@ PREFERRED_VERSION_glibc-initial            ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-initial  ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
 
+
+PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
+PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
+PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
 # Setup suitable toolchain flags
 require conf/distro/include/as-needed.inc
 
-- 
2.16.2


