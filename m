Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9306DECAAD4
	for <webhook@archiver.kernel.org>; Sat,  3 Sep 2022 17:46:10 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.5431.1662227162745250587
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 10:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bpUupFub;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id w139so4874860pfc.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 10:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=RcelbfBx0peE+uSw6veVa2PoTvV7oODydujY4WHFnFA=;
        b=bpUupFub4AXEDXGRLqoPUhAXSFTpP5p5mb4A1dduBVuBme6EaHx7BXeA1H4FOqk2Do
         WT9cd7iq35ahtMsZnvD+CDwU4sv3Jtetg3TCH+aSk9MQopGsNQTmsLS4+l6u6ExNKpDs
         4zClj/nBstRMlFqoeewWomxfUrJ2ZPZtenV60zGsewCuDWlsB0nsWigEx1/nsuIGeiRQ
         nsT5ddTcMpfhC3L5Fc4AudP3BuCOYX1Zf3av+/FQBXV+GohKHM12+UU20iIflHhUTqXJ
         a1yMNk/IUH1A5zfPuZ12dRq+KO/RPdTryLvLENxiv7UMeS1TlRzMtQq336/is1DQgMQ7
         OKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=RcelbfBx0peE+uSw6veVa2PoTvV7oODydujY4WHFnFA=;
        b=Zq8jsbiiIXzUxsCe1VLJHLlSDbWKzZJe9+DWVlhmUQP1Azen8L25KFqCcC09lAg15f
         71gDjRhLObJ3twlaEpvn1q6o+vtlXjOqbxRhUL72O7Jtw3KWy60F+1KmsucjeiXlqWTM
         NJTLJJv6R47EcRTTVEYCiGG1YnUtNF1Y6jA9hGab4wmXTQqCImE+KpsPZSWu8ibOfQlp
         idhwLSHd1+QQddST1Wqlw1WTZe0pC3IG8q7e92CDbcPXuz+f57AlyGHqevGR3ChXp4o1
         SX/ZxMc3jNyBatXWOxUW28keSjQX10AuX8UURlc0Rjf4WU8eyTnmOWQe132nvHY817/F
         eLdg==
X-Gm-Message-State: ACgBeo0OOESjqS3VbrZ0vl6ioyCamOgDw7DIoXedgZCv2EzectBuXG8i
	g8X6PYilvor3o5XfvtVS10vg7ICZPOGoYg==
X-Google-Smtp-Source: 
 AA6agR4dXzpuXbozHTtkxd4HgoaOsqRsbi5atadzHIoW6yLASsqwfB7X5UevQxBSV6j+oOe4gx6CbA==
X-Received: by 2002:a63:c1f:0:b0:41a:9b73:a89e with SMTP id
 b31-20020a630c1f000000b0041a9b73a89emr34614519pgl.342.1662227161598;
        Sat, 03 Sep 2022 10:46:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 d5-20020a17090a2a4500b001f260b1954bsm3618269pjg.13.2022.09.03.10.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Sep 2022 10:46:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-lxml: Add recipe
Date: Sat,  3 Sep 2022 10:45:58 -0700
Message-Id: <20220903174558.66575-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Sep 2022 17:46:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170270

Import this recipe from meta-python, as it is needed by many recipes
from different layers e.g. wireplumber from meta-multimedia,
opengl-es-cts and vulkan-cts in meta-oe, yelp-tools in meta-gnome to
name a few, the real issue is that newer vulkan-cts has added this
dependency which is in meta-oe, and meta-oe can not depend on
meta-python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-lxml_4.9.1.bb              | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-lxml_4.9.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3c80a3a617..fee4e52b10 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -626,6 +626,7 @@ RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfound
 RECIPE_MAINTAINER:pn-python3-jsonpointer = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-jsonschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-lxml = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-devtools/python/python3-lxml_4.9.1.bb b/meta/recipes-devtools/python/python3-lxml_4.9.1.bb
new file mode 100644
index 0000000000..92a30f7907
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-lxml_4.9.1.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
+DESCRIPTION = "lxml is a Pythonic, mature binding for the libxml2 and \
+libxslt libraries. It provides safe and convenient access to these \
+libraries using the ElementTree API. It extends the ElementTree API \
+significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
+C14N and much more."
+HOMEPAGE = "https://lxml.de/"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause & GPL-2.0-only & MIT & PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
+                    file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
+                    file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
+                    file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10 \
+                    file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b \
+                    file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53 \
+                    "
+
+DEPENDS += "libxml2 libxslt"
+
+SRC_URI[sha256sum] = "fe749b052bb7233fe5d072fcb549221a8cb1a16725c47c37e42b0b9cb3ff2c3f"
+
+SRC_URI += "${PYPI_SRC_URI}"
+inherit pkgconfig pypi setuptools3
+
+# {standard input}: Assembler messages:
+# {standard input}:1488805: Error: branch out of range
+DEBUG_OPTIMIZATION:remove:mips = " -Og"
+DEBUG_OPTIMIZATION:append:mips = " -O"
+BUILD_OPTIMIZATION:remove:mips = " -Og"
+BUILD_OPTIMIZATION:append:mips = " -O"
+
+DEBUG_OPTIMIZATION:remove:mipsel = " -Og"
+DEBUG_OPTIMIZATION:append:mipsel = " -O"
+BUILD_OPTIMIZATION:remove:mipsel = " -Og"
+BUILD_OPTIMIZATION:append:mipsel = " -O"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
+
+CLEANBROKEN = "1"
-- 
2.37.3


