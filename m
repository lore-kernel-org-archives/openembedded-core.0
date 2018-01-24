Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id A80577869E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 14:27:57 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id v15so4231486wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 06:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MeT9F01Y2xV49zuqH/z88BJkrDMRpW+uWce2gCHRHs4=;
	b=BpbWO0SE6koLIRw8jBYgm4vXjvhaNQWc57qruT2QwOjVBamAEJZYT7YOquUXdoUPSY
	xH1/oc9fTuzE/yhXGZ3ZajECPKFtIYlbcGFXGDF5Qj4kSYEE592LIA1qGqYA7+ZRRFwt
	wKlowiVwhyNkJ3v1DLPELIG8R+BDfiYcst9fgJLaWu7vwfvkHQSLal710M6OESQMfnCW
	7GIAniVfRbDSvYwyiwhYj5pKD07Hlslqcj9J/5IGP0aXUXLt/+eN33U08UbaANHcGAvR
	q7xkfSGxwVVEZRIYbVs7wjrt6J265jIv+YhjxJxo4Ud3rx7DMAXrbrSlpiPAMSX+CE3Y
	H8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MeT9F01Y2xV49zuqH/z88BJkrDMRpW+uWce2gCHRHs4=;
	b=R4y+MlSdNLob+IYNGN7JnQTzk1eq1Gngd0zRaRAA8wTlUl03NOFrgThy7/i+DBl8wm
	0PNYXjnewZZtIp2noxmVkrWIiYAweBs/lVpmT/BJu8z4DWGXtK34E7v2bvRBERq1m1Gf
	HDZJEHmfk5vQkSS7AmjPb3tilTJdCD7RfoctzgavVazrKxh2X+uM1YMPzet94RQvoE8I
	g+eifBD+PHHOLB6jFyT9/2Ee+PXJWkSVw465IQFbEfL6GJxlXk7SZRhtzbv1K34skvDi
	eXiA2+yw95yuBm+nLUDYEeNs8OmFihXj/N5taLMO224ozwKTWdXszLglYI1ilAA+lxF/
	ofCg==
X-Gm-Message-State: AKwxytemxK48xDZqqqwGUaisID2RnDQ0t0+ovWxtyyvnHorgy3DDO+Cu
	llBd4b2oz6eva4xSF3e60WXtNw==
X-Google-Smtp-Source: AH8x224u9QHB3jC1Slqojv2ubsbJrqgTUNJThDQRn+2Tm2/XeFbenTve1ZijmdzEFbj9H6G3NGNEbw==
X-Received: by 10.223.166.248 with SMTP id t111mr6255823wrc.248.1516804077990; 
	Wed, 24 Jan 2018 06:27:57 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	g60sm4833725wrd.92.2018.01.24.06.27.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Jan 2018 06:27:57 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jan 2018 15:27:49 +0100
Message-Id: <20180124142749.11330-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH] librsvg-gtk package: add gdk-pixbuf-bin RRECOMMENDS
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
X-List-Received-Date: Wed, 24 Jan 2018 14:27:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

librsvg-gtk installs /usr/share/thumbnailers/librsvg.thumbnailer which contains
TryExec and Exec for gdk-pixbuf-thumbnailer which is installed by
gdk-pixbuf-bin.

Fixes the following message in systemd-journal:

raspberrypi3 org.freedesktop.thumbnails.Thumbnailer1[494]: Registered thumbailer /usr/bin/gdk-pixbuf-thumbnailer -s %s %u %o
raspberrypi3 org.freedesktop.thumbnails.Thumbnailer1[494]: error: The metadata does not have a thumbnail property
raspberrypi3 org.freedesktop.thumbnails.Thumbnailer1[494]: error: The metadata does not have a thumbnail property

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.40.19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.19.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.19.bb
index 6aeeb6b5fd..fe00371e37 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.19.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.19.bb
@@ -40,5 +40,6 @@ FILES_rsvg = "${bindir}/rsvg* \
 	      ${datadir}/themes"
 FILES_librsvg-gtk = "${libdir}/gdk-pixbuf-2.0/*/*/*.so \
                      ${datadir}/thumbnailers/librsvg.thumbnailer"
+RRECOMMENDS_librsvg-gtk = "gdk-pixbuf-bin"
 
 PIXBUF_PACKAGES = "librsvg-gtk"
-- 
2.14.3


