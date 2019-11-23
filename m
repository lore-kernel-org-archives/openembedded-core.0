Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 564A47FCE4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:11:33 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id b10so4960485pgd.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I3G2AilM8uHCVkqUM/BXhNeto+nNXx/Eau9VewdRXfE=;
	b=MygBss3X39zZ+5LHPKSQ1b0SP2wKJlLeIWm4AXGgFhGwAlKiUWsPhm9N5infDa86jn
	gQ6w13Pskoezl46y2qchgapPGOh/UzwqYXMLa0Yd29mHPVudbnDKdMIACT2qj8jw3R5V
	VrFnhKGhHzlHfFOGk+XkWtgvAsoWxK8UumfslIZi3m1RdmpBs2KgIepxmeFaU8AQrP32
	Ae6QHY2a2jzeTa8WHBN5Ao+DvmRlfktZxMzLaQdZ+N6xy+HGz/UnekIuBFtqcgNG09/0
	QvAX2mWRoMSr0O99/cqWfDwWadzyW48x6Qxnvn944MIhJajia8aWg2OTECCA+/5xaX0n
	cAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I3G2AilM8uHCVkqUM/BXhNeto+nNXx/Eau9VewdRXfE=;
	b=SCmdpsfvtFHDCEbliFDwFm3QWi+NC/6kvTE3KKcAuOsZse6yOi5IWjdSP34JYpyOkW
	Srq/TnALUKdx+xw8q6LEchuIHgDVFbVkTXr9Tm1aTR88x7WJ84lBkODqIEkNTf3LIdEW
	cJyo1Vj8auQ5A80d6a7ZDHipkzLE96+Wx9S6uLRi0qgtTBmbJViMJV2uMdD/a5PshmTR
	xjk3dQwCGfcMOwHLHb6wplQTQR+NTZ7T5nk1iD0AaS9IPG+qER9cDPtdzEyKWsTZP7WQ
	fsxB0zP+t5WXWovb76+6uWTcr5GEUKX20Tj+wWS2T1y9k6RQF/dwpeW2GdTaH98tQpQe
	ncfA==
X-Gm-Message-State: APjAAAVU8pw5xLm1glW9XDE4zlIHYcVVdjDpjR9NoWrsLNh5vu/8krvv
	FZIUO+CXjshjKljw2nfO5EY1E3zA
X-Google-Smtp-Source: APXvYqySf2PVjOEpYwJ4VdRboBtPpJjv7rGSb0KmK5YdgJlONuLi05tPp+kfik/KsSUz9HLzKxihWg==
X-Received: by 2002:a63:d20f:: with SMTP id a15mr23053066pgg.268.1574525494154;
	Sat, 23 Nov 2019 08:11:34 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id
	199sm2091943pfz.186.2019.11.23.08.11.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:11:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:11:22 -0800
Message-Id: <1574525485-20450-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
References: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 08/11] gstreamer1.0-python: upgrade to version 1.16.1
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
X-List-Received-Date: Sat, 23 Nov 2019 16:11:33 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{gstreamer1.0-python_1.16.0.bb => gstreamer1.0-python_1.16.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.0.bb => gstreamer1.0-python_1.16.1.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
index 0f3aac1..52ed150 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
@@ -6,8 +6,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "877b2ed2aaffdb62e63f38ea9469b70f"
-SRC_URI[sha256sum] = "55dc7aaed1855565f9b9ef842d93e93bfc5cb2b376faef6af5b463e1774e2d38"
+SRC_URI[md5sum] = "499645fbd1790c5845c02a3998dccc1b"
+SRC_URI[sha256sum] = "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8df35b780bd8347489"
 
 DEPENDS = "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
-- 
2.7.4


