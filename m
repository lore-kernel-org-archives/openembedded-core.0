Return-Path: <alistair23@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id A3A856C0ED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 06:07:40 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g9so1199345plo.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 22:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xuLw/4pNkP9y1m9DQRobp/HpXCNy0lGTZbPMiPzAHTI=;
	b=iQSzsT1ejNy0tLuwwOk6ogcD4Vhn/OkIerGUqDlDf4l108MI16WdgfVJ4OIb/UEYwQ
	b/g+DupB5N0uW7FnGwpnqCr2y9GMliDj1Ti2+zescIdX/0X6qVrOWMkVUZ/aadh82hKO
	vz6XrthDulnlaW2b9SiiRRQJY+52EoHzbT9M+Nj2V5LxUoR92hkVhX1aDkm4eQNqIn30
	SH5RtcFmPuGIn0Mhb7IigrFav2xf9ZSW6T22v5ZJCG3pv5mx/i6qPxquan/TfGYZuqA1
	DYIL3dzHyf5U03RDOT6woB6EichGMJMrrSXdz38T84SqeR3Pc8DOsJVLfS9HT+4SBOyr
	RtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xuLw/4pNkP9y1m9DQRobp/HpXCNy0lGTZbPMiPzAHTI=;
	b=cLttg02sBLyMjKa+dz4E838Xm0WCwBsjSpYIPL77WmB1AJwK6ZGFTEY+/oLns9zWYQ
	1TNQdcTatyTNSNaCp6y2lsQRRHzpq6PargDKHW2zOV75y4aHWmu1sGTIt4tLtMJtUS1d
	EJAEQIxRp8NorwhVE8j5Uj5coGPt/cWVvQjjy+IZz3mG65GsVkAj1DMXmLslnu/RGade
	4nXfuWo3g98t3KhnpSdR0IhyCNbojFZ/8q1u12O/A78uTIeBwdhYYK7xhWgnGF8IMhoc
	ehZyh4s4ggmWOh5TuJNS5VCfIzHMrZSAo1QVxxPX/EJiap6IqRaLPue4QNHTxC8coLIP
	jJ1A==
X-Gm-Message-State: AHQUAuZvongVwBL+PuSgej+1Poy9g22dOBRHcdmbTLFmhA3z9tjpJJLX
	5F3bwy9vgWPDXNHptZa4szuqRQev
X-Google-Smtp-Source: AHgI3IaYrzN9LvYotHbgm9bvn6If7w9rw9UbJC05lf6uiV5aY4UKeN99PVWTukp0W0DDy5fsqaJXHQ==
X-Received: by 2002:a17:902:7590:: with SMTP id
	j16mr20240639pll.231.1549606061068; 
	Thu, 07 Feb 2019 22:07:41 -0800 (PST)
Received: from alistairs-fedora-xps14z.alistair23.me
	([2601:646:8e00:dca:3867:a4d:995f:259d])
	by smtp.gmail.com with ESMTPSA id a70sm1395398pfj.7.2019.02.07.22.07.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Feb 2019 22:07:40 -0800 (PST)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2019 22:07:33 -0800
Message-Id: <20190208060733.5096-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] mesa-lima: Add support for mesa for Mail-4xx GPUs
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
X-List-Received-Date: Fri, 08 Feb 2019 06:07:40 -0000
Content-Transfer-Encoding: 8bit

Add support for the open source reverse engineered drivers for the
Mali-4xx GPUs.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../recipes-graphics/mesa/mesa-lima_18.3.0.bb | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa-lima_18.3.0.bb

diff --git a/meta/recipes-graphics/mesa/mesa-lima_18.3.0.bb b/meta/recipes-graphics/mesa/mesa-lima_18.3.0.bb
new file mode 100644
index 0000000000..0f26ede2c4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-lima_18.3.0.bb
@@ -0,0 +1,23 @@
+require ${BPN}.inc
+
+BRANCH = "lima-18.3"
+SRCREV = "8e713e4781982c700bfc7b09279146189d525a86"
+SRC_URI = "git://gitlab.freedesktop.org/lima/mesa.git;branch=${BRANCH} \
+"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "python3-native python3-mako python3-mako-native gettext-native libdrm"
+DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'x11', 'xrandr', '', d)}"
+
+PACKAGECONFIG[sun4i] = ""
+GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'sun4i', ',lima,sun4i', '', d)}"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install_append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
+        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+    fi
+}
+
-- 
2.20.1


