Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web11.7587.1605782297346000612
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 02:38:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74A2D1478
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 02:38:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FDA63F718
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 02:38:17 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] gstreamer1.0-plugins-base: set CVE_PRODUCT
Date: Thu, 19 Nov 2020 10:38:13 +0000
Message-Id: <20201119103813.2726273-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119103813.2726273-1-ross.burton@arm.com>
References: <20201119103813.2726273-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There are CVEs with the 'gst-plugins-base' product, so set that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gstreamer/gstreamer1.0-plugins-base_1.18.1.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1=
.18.1.bb
index 8e3ff21c905..1b2bd4fe149 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.=
bb
@@ -90,3 +90,5 @@ def get_opengl_cmdline_list(switch_name, options, d):
         return '-D' + switch_name + '=3D' + ','.join(selected_options)
     else:
         return ''
+
+CVE_PRODUCT +=3D "gst-plugins-base"
--=20
2.25.1

