Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 270A07FE04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 17:34:21 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b6so4092595wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 09:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tWEtE+3/OG+vtM0w4TuGB41YES2W8N2gYX95DlQBfVw=;
	b=iWYUvWeMwZVGRintehrViKDa/ysbV44YBRdiVXSVQSxEDPd/Qj9NMkoJljwM4d0CBL
	09X/bEK++ok2AxMpX7kL4r8kxCdMHnZMFQTy5EgKAPUhMvIiwKT3oQ2YxAitmcYFfOsk
	8uYwdzpACwbHdQ5Nn98pPMqAOowzP5mMCm7xAVhPdn9aQ+/7LyrEuAH97yN4aj5mLEkA
	lbxLDkGrqGNAwCbcVE6jAmRhBz81QooHXXmPEb9yhBAlOxTM2Ae31nPsSeGTDpkUsibI
	Nt6ebJBAZOEREfKqIReuk9zeQyRBZqyBFWPthq8wmeINaIHcxNYoHlQk5KNI7rj7XHmM
	yvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tWEtE+3/OG+vtM0w4TuGB41YES2W8N2gYX95DlQBfVw=;
	b=cpD41/S75Y43cJy9ApbBy3cBu8wriOt8MNcDqpnqujmS79FLeYQq2M1+n/kqKv9hB2
	bYnUwWIjsAHEJhqA/HcHjFgAvb600inLb1xy5x/q/GismH9ajn5n65oCJ0AeUVJJfWjb
	zyrk1xdcLaghaq0DJmbUBZ7nnLbERrBVsH7VfK7WAitV5CPNZvH35Fkqk1I78H5hoh1s
	0OCsSdePwqkSxD9Aw70yn6MsTU5BAt1W57c3wphYpUNTeT8NA04fpRq0udv6MAG45CjH
	kpHyhViglHX7+XVylE1kcEkgqoa/cnzCsg0xvL6UQRlSX02l19lKK3QZJ8Y8tSZ4cYAz
	spNw==
X-Gm-Message-State: APjAAAUVarR8D1B+dmfZxKFiI0XoqFrt5lK6juycXAM/zNcofpRaqp9H
	OkSCIx3zsDGNlgNx6yBwwrgV/UPr
X-Google-Smtp-Source: APXvYqwoC8FW4I/9a/aklMG/oSgSQlKdlZHqlP31dn/aoHI+/pJxLyV5TLL8CgPjG7FJH8nwqU/COQ==
X-Received: by 2002:adf:a285:: with SMTP id s5mr19656681wra.118.1579800862479; 
	Thu, 23 Jan 2020 09:34:22 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	e18sm3774439wrr.95.2020.01.23.09.34.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 09:34:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 18:34:14 +0100
Message-Id: <20200123173416.112832-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123173416.112832-1-alex.kanavin@gmail.com>
References: <20200123173416.112832-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/5] default-distrovars.inc: add vfat to DISTRO_FEATURES
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
X-List-Received-Date: Thu, 23 Jan 2020 17:34:22 -0000

This is beneficial for parted ptests in particular, as
they expect vfat functionality to work.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 10d86cf7b17..433d4b6651d 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
+DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
-- 
2.17.1


