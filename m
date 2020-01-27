Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 373A77F82A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 14:19:13 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t14so7218816wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 06:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tWEtE+3/OG+vtM0w4TuGB41YES2W8N2gYX95DlQBfVw=;
	b=p7XCU2LsElAafT27K4WV9je34dGGJkU2k2Avu8ILJNBmJHks1E1skjFnhtNPYGVBXu
	fnkxQCflV67fndbDwqkdz0Rlg+amdaWBOxtX9c9cyWHnJ6P75y6XDDiIQY8NXuajnF6n
	eZ19pOcqQj9ebSrBqCl2199CDmyPEPnRlfjVq3vZnOVfULSFZE/TyO6vr2PKxtremY+/
	HCAeqM24otNl+Lllf+BYODqK4BeR2U2NXHXLsbMobQs1z9HJopbLTdp9g2yH1wO/OMW2
	zIZ9rFMqAwfRYInjREZbHkwAud18yu9At31gEahw5rzH0Iyd+hY3C55oHPHCt04n72cd
	3taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tWEtE+3/OG+vtM0w4TuGB41YES2W8N2gYX95DlQBfVw=;
	b=N4YWeVrVj5/xlePr6m86Md6GXGCW9OJPmMA928hjcvafFCjEbSaF0d2wX1uSWn1Ust
	25M9Uh+tYYj3844E9id5Wa8reRSvXDSipRsBo7ppRfUe5jLBoSoEJnHdyATu2sRTU7ZT
	3fiNoKuYcBvOkEpQan7CYM209JEGd0WBHOnrrGZ47/iriC4BwwGVjTOxLDcK0qBHmjhc
	3nK9JKdS4NGmsCmpvRAuqJM5HM5K5FMdj0OW4zEZW5SoSAfV3HycVcweuHxwseyFzGHu
	+RvzWhZ3ZcJ2qD9ppGF3a806V4ILMT/npkqdJXD3Ai4kl/2VEIQBcmA2nzqeJEbFaPlK
	3jdQ==
X-Gm-Message-State: APjAAAUXB/ZvJ732NiHSOC9Gqar4NJjaEAXYRj3GRyLbyhDE3m7eYVyd
	2hDSk+rk7eZSccYv39voGsHfY8rb
X-Google-Smtp-Source: APXvYqwMxI9G4x03wMeyW9bMENQsY1w+MCkrsP8Ei0QDF23QomwseIjdhusXpChqLTG9qsuOTgaGgQ==
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr6915518wmj.27.1580134753649; 
	Mon, 27 Jan 2020 06:19:13 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	n1sm20533930wrw.52.2020.01.27.06.19.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 06:19:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 15:19:01 +0100
Message-Id: <20200127141908.84922-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127141908.84922-1-alex.kanavin@gmail.com>
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/9] default-distrovars.inc: add vfat to DISTRO_FEATURES
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
X-List-Received-Date: Mon, 27 Jan 2020 14:19:13 -0000

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


