Return-Path: <tuanha@viosoft.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id EC9C37CB51
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 07:33:43 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id q206so13363078pgq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 23:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=viosoft-com.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=PYLpMaewvO5m5Q9IBPU2+0k9/ajarTcNQfs7+9UCaiI=;
	b=Ae5MX2rEzNuaxcziRA3akJHiwTF5EdfAVD0anSAa/6m6aGlUEGm5joF7AqJHp2ex+n
	WZSDyiZheSbY3sxqzr3XnCHSPoGzhx0Y/RpYoUbVBNtenODSVpkjcd0mVWAuE0Xkp32B
	rqhTcKODPCQq3OK2U8ZEHLIoPMBuwMT0EKlNOCK5sxM/Zj7Zy7/Z6Al2FV7B0ckc5SeF
	Tm9zDzmC6QSqh8zYdbKKTyPfvJvxgAmQNuoXljvZeroj+ZsCKNg3IX2U3AgvLVeyXpuf
	mKyCT89g6hCoP2SMKwxV2BUgzL8WGsNJa+JOmAZwDt+TzImt5K7vuCPdQZEH32pqPJUC
	hk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=PYLpMaewvO5m5Q9IBPU2+0k9/ajarTcNQfs7+9UCaiI=;
	b=bpGr0tHK52OnMl0+k5Gucos+bNZnN6Sct6sPiTeU0lNt5Vx9UC1DObU3z4rt6eoT3v
	TjUMbkeQtBRJBS6hL7i3zyjBYHT2lhs7j3IhsEwLPum93C/XAZ75XCf4JITWB+/hlQmQ
	RyIwJPBAqmIaiZ20nl/z+dPiwBSXHOy2QL2pPwGMkl+A8pUBvriv9tI0NvFvBMD2Vo5H
	vd0MdKVb5s3a6sXG1YtcrjmV0BTcaAorXPR8VFNV40nysX6A1+fhvUBcVKlfc7kXtLBs
	DAmBJd3D7601Xc+Bpe/G/sVAx9pOZgTE9CrOmYoU9Cl12pu/sYouiJkEvrZNThmDzQ7g
	TZfw==
X-Gm-Message-State: AHQUAuadgJsehz09Qtvx3eJ3ENzJ6FguIcl+Z0GuCriaRdFQi7mMYNx/
	KEnsADWSVTcj8edmjLsW2COR/QeMkhyxWw==
X-Google-Smtp-Source: AHgI3Ibndsfh8d5BpXqDYezA1fT9smbdEwfUZurBqjgYWzBKqhXm9BlR4Fi3IiZOuMkM3PogNavOWQ==
X-Received: by 2002:a63:5964:: with SMTP id j36mr33109277pgm.210.1550734424578;
	Wed, 20 Feb 2019 23:33:44 -0800 (PST)
Received: from [192.168.100.13] ([123.16.252.182])
	by smtp.gmail.com with ESMTPSA id
	s6sm17426966pgi.56.2019.02.20.23.33.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 23:33:43 -0800 (PST)
To: openembedded-core@lists.openembedded.org
From: Hoang Anh Tuan <tuanha@viosoft.com>
Message-ID: <f4138dfe-562a-b30d-89bd-cde546bfc762@viosoft.com>
Date: Thu, 21 Feb 2019 14:33:42 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 2/2] gtkwave: add version 3.3.98
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
X-List-Received-Date: Thu, 21 Feb 2019 07:33:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
---
  meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 19 
+++++++++++++++++++
  1 file changed, 19 insertions(+)
  create mode 100644 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb 
b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
new file mode 100644
index 0000000..6fd9392
--- /dev/null
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
@@ -0,0 +1,19 @@
+SUMMARY = "VCD (Value Change Dump) file waveform viewer"
+DESCRIPTION = "gtkwave is a viewer for VCD (Value Change Dump) files 
which are usually created by digital circuit simulators. (These files 
have no connection to video CDs!) "
+HOMEPAGE = "http://gtkwave.sourceforge.net/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
+
+SRC_URI = "http://gtkwave.sourceforge.net/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "eac3073ef381e0c09da33590296ca37f"
+SRC_URI[sha256sum] = 
"efa6bbbeb3bd54104425a69a2aa0d079bb5c3ecc1c420ba57dcaa1c97c5a22f6"
+
+inherit pkgconfig autotools gettext texinfo
+DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf 
glib-2.0"
+RDEPENDS_${PN} = "tk-lib"
+
+EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} 
--with-tk=${STAGING_BINDIR_CROSS}"
+
+FILES_${PN} = "${bindir} ${datadir}"
-- 
2.7.4


