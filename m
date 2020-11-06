Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: VoTK3cwblllyrNq61AxufY1Rb7Np18bblhyUe3Eal07y3lCWla+ajTaVqfldx1QKaZVjWaKvgS
 BxHtReyhLKOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428866"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428866"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:46 -0800
IronPort-SDR: NTRw7A0RF4pnp9NP3/XH3hvKu7m4y1afOjx30/spaW8eFzqGIaqh6ktQsBA6Mcf3TPxeoUW0jd
 uF47RJei4DEQ==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321490060"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:45 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/22] gst-validate: Update 1.16.2 -> Update 1.16.3
Date: Fri,  6 Nov 2020 14:28:10 +0800
Message-Id: <88c3919e7cd46b16ec26fe4678bc2c59f7ceffb5.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

(From OE-Core rev: a153bd3eeffa40554884d3a50cf6f78b57416749)

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{gst-validate_1.16.2.bb => gst-validate_1.16.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.2.bb => gst-validate_1.16.3.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.3.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.16.3.bb
index 35492fe861..ef42abbdd7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "688f42c52d62e8c5e506df911553fb2c"
-SRC_URI[sha256sum] = "4861ccb9326200e74d98007e316b387d48dd49f072e0b78cb9d3303fdecfeeca"
+SRC_URI[md5sum] = "740a436f5b9bf17ea7de0e62c92ec264"
+SRC_URI[sha256sum] = "c2064e887324af6aa476ca669234936711f253b29042f617f1d9f2597c4bf92b"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.28.0

