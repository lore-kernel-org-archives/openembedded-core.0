Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 48D3560556
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 06:00:16 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id r20so9519825wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=G2uzMYpfETFAnJk6Bpz1oxvU2JGrEFL2t44yLHaunZw=;
	b=kN2dAsSu7lPzELrZ0O2Xt/REHRDUCcOT2flUxXmi06PcevGd0h5WDpWvtoj2ETNWoX
	Iarj7L/VsAHfjX75fX1yQsRI6tbHgTiS1WPZdQ/lvTJkRzp/q/C24BIZ7NCtn5g0Eo8X
	WimL1x5rFfE/Dw9HAq8KMbEcAv9OwRL1nxmiiRntPJP7NfAvtgbw+/NVKk13m2NHY4kw
	RXwBL+mcRWDNJPGK9adMwgXlz/BDsgS4gAAkExGKp44PX4EIjVEhd+9+YdL/OVNVfvH6
	iZZ/GfVIqEe1QBr1WLgEIS7cIh30gidyohy06Gmjovc+sEDPjhfatGeOsR3sX9dPfZ6A
	RKuQ==
X-Received: by 10.180.7.196 with SMTP id l4mr3602779wia.44.1423807217170;
	Thu, 12 Feb 2015 22:00:17 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id u9sm8547638wjy.37.2015.02.12.22.00.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 22:00:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Feb 2015 06:59:54 +0100
Message-Id: <1423807195-7087-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] liberation-fonts: update to 1.07.4
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
X-List-Received-Date: Fri, 13 Feb 2015 06:00:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Chose 1.xx because V2.xx has missing Liberation Sans Narrow font due to
  licensing problems [1]
* A bit of a test for fontforge-native

[1] https://fedorahosted.org/liberation-fonts/

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...beration-fonts_1.04.bb => liberation-fonts_1.07.4.bb} | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/ttf-fonts/{liberation-fonts_1.04.bb => liberation-fonts_1.07.4.bb} (66%)

diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.07.4.bb
similarity index 66%
rename from meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
rename to meta/recipes-graphics/ttf-fonts/liberation-fonts_1.07.4.bb
index 89fa4b2..0f9a6c1 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.07.4.bb
@@ -7,31 +7,33 @@ BUGTRACKER = "https://bugzilla.redhat.com/"
 
 SECTION = "x11/fonts"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PE = "1"
 
 inherit fontcache
 
+DEPENDS += "fontforge-native"
+
 FONT_PACKAGES = "${PN}"
 
 SRC_URI = "https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-${PV}.tar.gz \
            file://30-liberation-aliases.conf"
 
-SRC_URI[md5sum] = "4846797ef0fc70b0cbaede2514677c58"
-SRC_URI[sha256sum] = "0e0d0957c85b758561a3d4aef4ebcd2c39959e5328429d96ae106249d83531a1"
+SRC_URI[md5sum] = "29e1482c6e568503138f7420597e635d"
+SRC_URI[sha256sum] = "ad98b7498dc2992f7f0868f79b65ce4a720a3acdb63ab3f1f1cb6881117a5406"
 
 do_install () {
 	install -d ${D}${datadir}/fonts/ttf/
-	for i in *.ttf; do
-		install -m 0644 $i ${D}${prefix}/share/fonts/ttf/${i}
+        cd ${S}/${BPN}-ttf-${PV}
+	for fontfile in *.ttf; do
+		install -m 0644 $fontfile ${D}${datadir}/fonts/ttf/$fontfile
 	done
 
 	install -d ${D}${sysconfdir}/fonts/conf.d/
 	install -m 0644 ${WORKDIR}/30-liberation-aliases.conf ${D}${sysconfdir}/fonts/conf.d/
 
 	install -d ${D}${prefix}/share/doc/${BPN}/
-	install -m 0644 License.txt ${D}${datadir}/doc/${BPN}/
+	install -m 0644 ${S}/License.txt ${D}${datadir}/doc/${BPN}/
 }
 
 PACKAGES = "${PN}"
-- 
1.9.3


