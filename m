Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id F02CB6C132
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 22:36:50 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id j20so10136128lfh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 15:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tGcPJpyZqYFf7W1BOKDAXdc/DsozKNsaqnTVFnvA93g=;
	b=JSreLzKn02zmAv6i7yqJzEZ3+e04+MUAoLr/MyAIEOT/Qc7lwR23BTnPzpfOkNiJze
	XIH/08aWh9Ujyr0VfaHGAaprVbigCurtNPDJ2dViCrL7Hj1mG63nbB9VC7Macy9khcz0
	STp2ZuE7Ekh1BJ4ej3fMGzA4rR+kz3P+9sIQSc3FV6s1iXaLjWOHBG/40ftXgYXhGFiQ
	+NYtRZ12szgn4wGuvW0a6Ffr9xSzNT7cmQJGp49xNLVQ8nEzkPdpUz9T5V36pDZqfwlc
	wS4ThwHKblTNkQ08oKvetzYc6Ht/w7thdUOHujOrFp5xlRhWktkYmSWyOkixHmWx/MnU
	2+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tGcPJpyZqYFf7W1BOKDAXdc/DsozKNsaqnTVFnvA93g=;
	b=GMIxMEZlNqcYuajuynTHWwDesHfkGVzKQ+2YwpUEanCJydtqkLiCNCYDAKmxJXv72V
	T8ae3s2Kl0qLXrLr0cHeEPsmdHdCayDrqjoKvZWfxwfwFdvcmGotc5Zd3OxKOpa3GP1s
	PhWqzvoWclKHl0tL/BppK0qc/7I3zQe7fyh0EvIzAxh6eKyaIg2EsZp89M9jdirg/p2H
	0Hog7IK4XfHeZ5LRm1/1O8JIHN33G7ctDOOKQqGSy9eS7aA+r0Vy/CzOW+HFCvaaQOu/
	2/ErUmhTDoMAOSfHRrNgGBam7lySDujRnrqxlX0qmfeUN3e28/3eAjyEgpDjQg0o/Q1b
	K82w==
X-Gm-Message-State: APjAAAVwKW8nWhdBZPIv941Sq1cq0j9pz2UuYgbx7WatdgJaS+Cmcg37
	BkG+FVhUwz2TH9k5PimXAjSBXglDHXE=
X-Google-Smtp-Source: APXvYqzz4+M7Y6eMN8T7XB3NZ9iIxFpaX2dzjswrp692U2nUgPERIX/IXBYzQJrG5LE31vtd8XQ8EQ==
X-Received: by 2002:ac2:5326:: with SMTP id f6mr11511631lfh.100.1555972611107; 
	Mon, 22 Apr 2019 15:36:51 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 7sm3467686lju.27.2019.04.22.15.36.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 15:36:50 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 00:36:48 +0200
Message-Id: <20190422223648.30507-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libnotify: update to 0.7.8
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
X-List-Received-Date: Mon, 22 Apr 2019 22:36:51 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libnotify/{libnotify_0.7.7.bb => libnotify_0.7.8.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.7.7.bb => libnotify_0.7.8.bb} (80%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.7.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
similarity index 80%
rename from meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
index 6c299bc175..82c137ca33 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
@@ -10,8 +10,8 @@ inherit gnomebase gtk-doc distro_features_check gobject-introspection
 # depends on gtk+3
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.md5sum] = "e9d911f6a22435e0b922f2fe71212b59"
-SRC_URI[archive.sha256sum] = "9cb4ce315b2655860c524d46b56010874214ec27e854086c1a1d0260137efc04"
+SRC_URI[archive.md5sum] = "babb4b07b5f21bef42a386d3d7019599"
+SRC_URI[archive.sha256sum] = "69209e0b663776a00c7b6c0e560302a8dbf66b2551d55616304f240bba66e18c"
 
 # there were times, we had two versions of libnotify (oe-core libnotify:0.6.x /
 # meta-gnome libnotify3: 0.7.x)
-- 
2.17.1


