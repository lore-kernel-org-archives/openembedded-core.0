Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7587.1605782297346000612
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 02:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E13071396
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 02:38:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D7303F718
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 02:38:16 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] gstreamer1.0-rtsp-server: set CVE_PRODUCT
Date: Thu, 19 Nov 2020 10:38:12 +0000
Message-Id: <20201119103813.2726273-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119103813.2726273-1-ross.burton@arm.com>
References: <20201119103813.2726273-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There are CVEs with the 'gst-rtsp-server' product, so set that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gstreamer/gstreamer1.0-rtsp-server_1.18.1.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1=
.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.1=
8.1.bb
index 2f00de1e56d..30534c97827 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.1.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.1.b=
b
@@ -27,3 +27,5 @@ GIR_MESON_DISABLE_FLAG =3D "disabled"
=20
 # Starting with 1.8.0 gst-rtsp-server includes dependency-less plugins a=
s well
 require gstreamer1.0-plugins-packaging.inc
+
+CVE_PRODUCT +=3D "gst-rtsp-server"
--=20
2.25.1

