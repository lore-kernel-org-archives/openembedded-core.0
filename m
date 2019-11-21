Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id BD77274769
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 15:29:41 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 8so4218284wmo.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 07:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=8HySAWsIyNobTKyxTJbJ/upAWWvGMJiii9WO36jSfKA=;
	b=pcYh6z3kQPSzL5xGHlJX69uYqNGMIjbWXwDuz+gdO7VGr4P3WBNJUKfmnL7ElGN4IP
	hTR8lZmT1Tt5dxs+zoc4ordLBZWeObmMo/0/rOyZs8/jLBD6T0NP+9RljzEWN/DQfYXo
	QScBuf8dnyUTAZrJY51MdNSE7dsU6/WorjNwmfpRubWNsj6Kqxn0xHzc5UEOapOUgOtR
	/qpu4N0LhcKh/yACtW+AqF0kiCj/RVxD7hsCDVeO7ErBpIyEQ7nuR9wEhRwg7RZerEtM
	RrQ+NuLN28KC4TvS57LmuafmCSNYv1vhKEawllCBhzQgxteu5Mk1R5qG/rs4DskRRfjB
	It8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=8HySAWsIyNobTKyxTJbJ/upAWWvGMJiii9WO36jSfKA=;
	b=bdqhRoS2wUIvupUKlifqiEXMsfkIDpxiEYRwTjvF7TH17SF312XwBfR1XdJo9r+F40
	8GiAMzEzMEjvAvgfa4OY0VK2iPWPwOl6pSPt4W/sWEe6wyh+MEBfp/X+/MH3bGKqunz+
	kuUANxso0JCl3tvT7EFCN/pDMoy3jshZUFjZJ8G0dTHEHmVwCLWuk8USEuEHJvtHlDxs
	lvY9ZcmOmX0jSEp+BRhhhEIDwmv/jO7kJSJN42Am0PVELKiOo3mj8IH6u2mjYQ8klwCc
	MsB83wRbSlzo/3esU3XkKujoWDQVXa/XGnOv9v3IykIljI3AgJpOUeCXXLsP31czHjZ4
	mZpQ==
X-Gm-Message-State: APjAAAUICb1k5l+2MaZghJ2rK5pqFfWDX+tFVqBTdDQPcgZEW7ilxBuR
	1aDhN8nlGyFlck0rHfRiTnXQkaXfIHp21g==
X-Google-Smtp-Source: APXvYqyBgSU8k9SKqwfJ84+txQgsrSL25hZh3DIhBFR6DgDWPzYR7zw91hJAPrxHyU1rcL2n++cCdQ==
X-Received: by 2002:a7b:cf26:: with SMTP id m6mr4285658wmg.17.1574350182117;
	Thu, 21 Nov 2019 07:29:42 -0800 (PST)
Received: from localhost.localdomain (bband-dyn50.95-103-53.t-com.sk.
	[95.103.53.50])
	by smtp.gmail.com with ESMTPSA id j2sm3600757wrt.61.2019.11.21.07.29.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Nov 2019 07:29:41 -0800 (PST)
Sender: Belisko Marek <marek.belisko@gmail.com>
From: Marek Belisko <marek.belisko@open-nandra.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 16:29:38 +0100
Message-Id: <1574350178-22957-1-git-send-email-marek.belisko@open-nandra.com>
X-Mailer: git-send-email 2.7.4
Cc: Jake Withecombe <jake@ruggednetworks.co.uk>,
	Marek Belisko <marek.belisko@open-nandra.com>
Subject: [meta-oe][PATCH] multimedia: janus-gateway: Added new recipe
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
X-List-Received-Date: Thu, 21 Nov 2019 15:29:42 -0000

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Jake Withecombe <jake@ruggednetworks.co.uk>
---
 .../janus-gateway/files/janus-gateway.service      | 14 +++++++
 .../janus-gateway/janus-gateway_0.7.4.bb           | 48 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
 create mode 100644 meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb

diff --git a/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service b/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
new file mode 100644
index 0000000..5b4d4f2
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Janus WebRTC Server
+After=network.target network-online.target
+Wants=network-online.target
+
+[Service]
+Type=simple
+ExecStart=/usr/bin/janus -o
+Restart=always
+RestartSec=60
+LimitNOFILE=65536
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb b/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
new file mode 100644
index 0000000..bca716f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
@@ -0,0 +1,48 @@
+DESCRIPTION = "Janus is an open source, general purpose, WebRTC server designed and developed by Meetecho"
+HOMEPAGE = "https://janus.conf.meetecho.com/"
+SECTION = "libs/multimedia"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c9e0a79f2244c2f79cda22ea5fed9135"
+
+SRC_URI = "https://github.com/meetecho/janus-gateway/archive/v${PV}.tar.gz \
+	   file://janus-gateway.service \
+"
+
+SRC_URI[md5sum] = "b068ac2b40ae800d83f471b8189bc87c"
+SRC_URI[sha256sum] = "01ddaf204203a1219dd46a5ce70b548bab75bc494c9ba05429f8fb1e786b2995"
+
+inherit autotools-brokensep pkgconfig systemd
+
+DEPENDS = "libsrtp jansson libconfig libnice openssl glib-2.0 gengetopt-native"
+
+PACKAGECONFIG ?= "rest_api rest"
+#PACKAGECONFIG[disablewarnings] = "--disable-warnings-as-errors,,"
+#PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,"
+#PACKAGECONFIG[inet6] = "--enable-inet6,--disable-inet6,"
+PACKAGECONFIG[rest_api] = "--enable-turn-rest-api,--disable-turn-rest-api,curl"
+PACKAGECONFIG[rest] = "--enable-rest,--disable-rest,libmicrohttpd"
+PACKAGECONFIG[unix_sockets] = "--enable-unix-sockets,--disable-unix-sockets,"
+PACKAGECONFIG[post_processing] = "--enable-post-processing,--disable-post-processing,"
+PACKAGECONFIG[plugin_echo] = "--enable-plugin-echotest,--disable-plugin-echotest,"
+PACKAGECONFIG[plugin_videocall] = "--enable-plugin-videocall,--disable-plugin-videocall,"
+PACKAGECONFIG[plugin_nosip] = "--enable-plugin-nosip,--disable-plugin-nosip,"
+PACKAGECONFIG[plugin_videoroom] = "--enable-plugin-videoroom,--disable-plugin-videoroom,"
+PACKAGECONFIG[plugin_voicemail] = "--enable-plugin-voicemail,--disable-plugin-voicemail,"
+PACKAGECONFIG[plugin_recordplay] = "--enable-plugin-recordplay,--disable-plugin-recordplay,"
+PACKAGECONFIG[plugin_textroom] = "--enable-plugin-textroom,--disable-plugin-textroom,"
+
+FILES_${PN}_append = " ${libdir}/janus/plugins/* ${libdir}/janus/transports/* ${libdir}/janus/events"
+FILES_${PN}-demo = "${datadir}/janus/*"
+
+PACKAGES_append = " ${PN}-demo"
+
+INSANE_SKIP_${PN} = "dev-so"
+
+SYSTEMD_SERVICE_${PN} = "janus-gateway.service"
+
+do_install_append() {
+	# Install the systemd service so we can kick start on boot
+	install -d ${D}${systemd_unitdir}/system
+	install -m 644 ${WORKDIR}/janus-gateway.service ${D}${systemd_unitdir}/system/
+}
-- 
2.7.4


