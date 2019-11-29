Return-Path: <jacopo.dallaglio@kynetics.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 776447F947
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 09:48:46 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u18so13489311wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 01:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dXsNqBtCbxYBFZ1L44OAyEF/uMnZc97KjpFfjPr6nug=;
	b=YDiNMYfgA1DRIFUR2N3q505Nm7CuM0Ayo0Km0/G9tXNOy28q2CkiuwA6tt48x/kVDz
	Z2/8/kP1yiJpOoe32fBhQ4esbAP/WdInYL/yk5umVmyYyw5I8AbVhVmDE+i+khkjvJno
	xhjIBEI7PoKRHwzQDK1vFr8GB8EC1JQ36wn4mFjx+QzS++55Xq1wfx4+kunaFmyg/EM/
	GwrSK9fOp0iCFX048tJr+msXeGLM2IMDeKOYhowoJWcLoI+WYLB9DNTGeHPB6kqrY7A6
	OLQzBVIKggtfLwD3OxkiBg5XUrV7hakWEeUsXKXNy9ZfgSaeEBuv/6ds87HEs44ul19r
	IR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dXsNqBtCbxYBFZ1L44OAyEF/uMnZc97KjpFfjPr6nug=;
	b=fI4GNvMAnHHVffw8kAcY9P2twec66tMo1mqF4Rx6Kzc8kcU5Txfc5BXwpIq/5cwXvs
	B18rmSj0fzytWg9x111Tb+3aUOLLW/uStfPQHwuH2Tqdx1v+X3GrThbYfttxlAvwJ6GA
	eeuSnZA8HbZjqHxXBrbh3Rc4+g7mJhXauDiJ2MryWuwSbjKDXUV6am1zeNEfH0BmEa9G
	kMqK9i94fom7tn9XsG3K7WgDjKcdEETu98c8x9fhLUlpmDTo2EIgJsBeV4vGLEqzpcxB
	HAccCCXK0xbb5JBvlh80YdK8iV+VAmCzjCE4l+mGZnsAQ9laiDQnttQdGpxSqvDZfopK
	x/oA==
X-Gm-Message-State: APjAAAX0BbLHifzQp92/j4Insbv9BqydRM3zfjgY8FNHY5SoicMZDdxg
	2x5v2f1E0W6nhNnrq9M80NJx+SMlyjrPHYMzsg==
X-Google-Smtp-Source: APXvYqxgNGEO/g6cVB+tfUA9FPJWEdGiygFNWoWpacrkQRRNukw85hSd2lvQpQJ0VpWdyvsSPmhS6w==
X-Received: by 2002:a1c:1dc9:: with SMTP id d192mr5150325wmd.92.1575020926882; 
	Fri, 29 Nov 2019 01:48:46 -0800 (PST)
Received: from ip-172-31-10-74.eu-west-1.compute.internal
	(ec2-34-245-99-139.eu-west-1.compute.amazonaws.com. [34.245.99.139])
	by smtp.gmail.com with ESMTPSA id
	c144sm12930360wmd.1.2019.11.29.01.48.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Nov 2019 01:48:46 -0800 (PST)
From: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Nov 2019 09:48:34 +0000
Message-Id: <1575020914-1566-2-git-send-email-jacopo.dallaglio@kynetics.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575020914-1566-1-git-send-email-jacopo.dallaglio@kynetics.com>
References: <1575020914-1566-1-git-send-email-jacopo.dallaglio@kynetics.com>
Cc: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
Subject: [meta-networking][PATCH 2/2] netplan: add recipe
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
X-List-Received-Date: Fri, 29 Nov 2019 09:48:46 -0000

Canonical's Netplan is a network configuration abstraction renderer written in
Python. It's compatible with NetworkManager and systemd-networkd.

Signed-off-by: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
---
 .../recipes-connectivity/netplan/netplan_0.98.bb   | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan_0.98.bb

diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
new file mode 100644
index 0000000..1251de3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
@@ -0,0 +1,55 @@
+SUMMARY = "The network configuration abstraction renderer"
+DESCRIPTION = "Netplan is a utility for easily configuring networking on a \
+linux system. You simply create a YAML description of the required network \
+interfaces and what each should be configured to do. From this description \
+Netplan will generate all the necessary configuration for your chosen renderer \
+tool."
+HOMEPAGE = "https://netplan.io"
+SECTION = "net/misc"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+S = "${WORKDIR}/git"
+SRCREV = "5d22e9d22c4a3724d27b80b0cd9b898ae8f59d2b"
+PV = "0.98+git${SRCPV}"
+
+SRC_URI = " \
+        git://github.com/CanonicalLtd/netplan.git \
+"
+
+DEPENDS = "glib-2.0 libyaml"
+RDEPENDS_${PN} = "python3 python3-core python3-pyyaml python3-netifaces python3-nose python3-coverage python3-pycodestyle python-pyflakes util-linux-libuuid"
+
+inherit pkgconfig systemd
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+EXTRA_OEMAKE = "generate netplan-dbus dbus/io.netplan.Netplan.service"
+
+do_install() {
+	install -d ${D}${sbindir} ${D}${base_libdir}/netplan ${D}${datadir}/netplan/netplan/cli/commands ${D}${sysconfdir}/netplan
+	install -m 755 ${S}/generate ${D}${base_libdir}/netplan/
+	install -m 644 ${S}/netplan/*.py ${D}${datadir}/netplan/netplan
+	install -m 644 ${S}/netplan/cli/*.py ${D}${datadir}/netplan/netplan/cli
+	install -m 644 ${S}/netplan/cli/commands/*.py ${D}${datadir}/netplan/netplan/cli/commands
+	install -m 755 ${S}/src/netplan.script ${D}${datadir}/netplan/
+	ln -srf ${D}${datadir}/netplan/netplan.script ${D}${sbindir}/netplan
+
+	install -d ${D}/${systemd_unitdir}/system ${D}${systemd_unitdir}/system-generators
+	install -m 644 ${S}/src/netplan-wpa@.service ${D}${systemd_unitdir}/system/
+	ln -srf ${D}/${base_libdir}/netplan/generate ${D}${systemd_unitdir}/system-generators
+
+	install -d ${D}${datadir}/dbus-1/system.d ${D}${datadir}/dbus-1/system-services
+	install -m 755 ${S}/netplan-dbus ${D}${base_libdir}/netplan
+	install -m 644 ${S}/dbus/io.netplan.Netplan.conf ${D}${datadir}/dbus-1/system.d
+	install -m 644 ${S}/dbus/io.netplan.Netplan.service ${D}${datadir}/dbus-1/system-services
+}
+
+SYSTEMD_SERVICE_${PN} = "netplan-wpa@.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+PACKAGES += "${PN}-dbus"
+
+FILES_${PN} = "${sbindir} ${base_libdir}/netplan/generate ${datadir}/netplan ${sysconfdir}/netplan ${systemd_unitdir}"
+FILES_${PN}-dbus = "${base_libdir}/netplan/netplan-dbus ${datadir}/dbus-1"
-- 
2.7.4


