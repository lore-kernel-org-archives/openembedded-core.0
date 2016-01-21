Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id B38327666E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:54 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id a202so1559320oib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r2yqmBh+L3p2WCcGDFE8EYa+NoafIOpgQoJFDIM4q+U=;
	b=iEDnYKDs1W/0Kqi9EPjTdk82P+kn/T0ecbtYaVYTr9HsotGvfF99K3cdavJpnc1IQw
	grIRfgIDx/Vl9fPvs16XFjcnKWbPJL8ZyS0OQ+g1qvW8evYw8ubYLF/YiFUxIndnkYq/
	tJotPhPUXRuPnWtTgMKmzgtjQYE4F7o4mniHIvPpNErzPYZSnECo1PzW+vA+g0kks0n0
	YWc2V4jTyXLAQLcAdIWv8AFz6XqBYcHYAptyK4HKvt7/aSPHe9okPOEguqZ1hmiOt/p4
	qcm6Xvig5SUiQKGIsvCyjwGLxKa/cf4ESis5KM4JD7DY+et3AAelgJJzL3Yg4BSjT+rP
	zSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r2yqmBh+L3p2WCcGDFE8EYa+NoafIOpgQoJFDIM4q+U=;
	b=FWRoOFO3/id3CKlQJsl+6xJVmro68LxxJRsoRGAfwGVC6e1K8d11Mty8B36Z7RcxkX
	0i12cdXtHy/oKl/3PsiwY3mjs5Zh6A9NPd3tfSDqQHNamSgc5vAB32dObdgf+PIzwZTM
	z0Cncv23Ho8I57i6QTf+UWP33/OBiNiJVluPnmQMaacEGdtJQrpaas6e0yHh3EqE7aW0
	oOnRAPk4wJG1Zl0KX5eGYuhkZhOEEmbp6Kds7pOIrh5YD+X0UDGJHbTQVKn7gBHKpwKf
	Gxx42K9S/MKBn2iC6tkHxKg4D6LSuBjRBSxf+eSbF/w3ALCTWHW7qVXljDUyhhYX9EW3
	ZNZg==
X-Gm-Message-State: ALoCoQnfG1N9vGpTWhhctGmESEgdqrOX2/BE3vdxesGO0e/PYNKvnrKqSXMBd2jo+Y3R4vrRPXChOVG48IhlVN3xo7Fh+dqF7g==
X-Received: by 10.202.87.194 with SMTP id l185mr29743620oib.52.1453354674259; 
	Wed, 20 Jan 2016 21:37:54 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:53 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:43 -0800
Message-Id: <1453354610-19218-26-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 25/32] gstreamer1.0-plugins-ugly: update 1.6.2 -> 1.6.3
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:55 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...er1.0-plugins-ugly_1.6.2.bb => gstreamer1.0-plugins-ugly_1.6.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.6.2.bb => gstreamer1.0-plugins-ugly_1.6.3.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.3.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.3.bb
index 94241c0..7edfb81 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.3.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "0f0e30336e3155443cd5bfec5c215d56"
-SRC_URI[sha256sum] = "e7f1b6321c8667fabc0dedce3998a3c6e90ce9ce9dea7186d33dc4359f9e9845"
+SRC_URI[md5sum] = "dbd92afb3816cbfa90ab1f197144a2e2"
+SRC_URI[sha256sum] = "2fecf7b7c7882f8f62f1900048f4013f98c214fb3d3303d8d812245bb41fd064"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
-- 
1.9.1


