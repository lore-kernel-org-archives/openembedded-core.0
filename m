Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id A55487D265
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 23:47:49 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id w15so27802333wru.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 15:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1RRrUt5Af+lxqy0vDRAuYhd32Hv1smqoHU8WX/LKfoY=;
	b=ZRTGcayFnNq36Kyq4hJNC4QuBQ+OlFryULXQAs627Q6r7vjVKBz+mnqZjeGKlapY94
	PLM+BeaG81UcsW/HlACoMt8lw9M7YXVCieRnWR3JkZzQ2yO+m+I9XIl1ZvKRaPbbT4V3
	77c6axrES3nc0LjRmlsNQy7By9hldvaqA+LyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1RRrUt5Af+lxqy0vDRAuYhd32Hv1smqoHU8WX/LKfoY=;
	b=h0apUI8n4Gi7tYSBvIxSAlNqSl0Lg0FCSHW71DeuOpSDeMeac5Y8yAXFYL4fS2QwFK
	P8aUmF/2eLwxkCx7VnM0StJhS5IHnXVStEoIx1J/Ab0lDcWZdnBX9ZNwnB3icipxkRbX
	ODc7bjrkgI3bOSU3m5pC5V/QY2QMzAQW3dCPeixEfnSx1l7owclqtVBOGsm4jJNKwU5P
	DTSZhSV2AyuqfFgA3L6RqEsVVlPSheo2xc8Sm/xNgnfSBsk49C+CymGR+KF572Y1/QMm
	vLou885IWrcDFBv7Rv/E90Y30x1SqT6pwM/ZKboUsYVvqENfmMRsYGClGvqf8du+Xmpq
	zEOw==
X-Gm-Message-State: APjAAAVb3V9rQV0yBbmCzDRVr47OhHEscS/4QzuY1OM3nToCHWfaD5sF
	JiZnHm909XWGE/3I8AIilbcFPjroOn0=
X-Google-Smtp-Source: APXvYqymMhLANE47GLxW1oAL5W4LZdYRmzmJLkk8CuGBSGOyYh7ziWCzVaK3IVvZaBXCbBpo/qXoLA==
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr15195314wrm.107.1579477670162;
	Sun, 19 Jan 2020 15:47:50 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b16sm46941859wrj.23.2020.01.19.15.47.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 15:47:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2020 23:47:47 +0000
Message-Id: <20200119234747.3060-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200119234747.3060-1-richard.purdie@linuxfoundation.org>
References: <20200119234747.3060-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] epiphany: Add missing xgd-mime inherit
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
X-List-Received-Date: Sun, 19 Jan 2020 23:47:49 -0000
Content-Transfer-Encoding: 8bit

Resolves:
ARNING: epiphany-3.34.2-r0 do_package_qa: QA Issue: package contains desktop
file with key 'MimeType' but does not inhert mime-xdg: epiphany path
'/work/core2-32-poky-linux/epiphany/3.34.2-r0/packages-split/epiphany
/usr/share/applications/org.gnome.Epiphany.desktop' [mime-xdg]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/epiphany/epiphany_3.34.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.34.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.34.2.bb
index a196a217dcc..c6105b97066 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.34.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.34.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
 	   glib-2.0 glib-2.0-native json-glib libdazzle"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gsettings features_check upstream-version-is-even gettext
+inherit gnomebase gsettings features_check upstream-version-is-even gettext mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
-- 
2.20.1


