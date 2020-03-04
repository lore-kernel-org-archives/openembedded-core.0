Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 74D4A61858
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 14:55:28 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id f198so1827846qke.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=esYLS9KjL3YZ7eKU7RlYXYQYB9fuPpY842+E8J1ujHw=;
	b=dn0mAOnKue3W4ffLHMrxLyGbEdXvkopKhr9iZN93/FExTYCh8Hi31Vi2NEBwrM6OTv
	ec2wsr3ZHUNPWWzrN4+aVLEGiGiqCF3R5xADQy1jIo4mApIZb5C3qAw+fsRbiL73cWP3
	cZoMfoJ54hrFwUg8llAYO7LOl6uAK0Tf7mMN1JVNWOTct4Tm574DV+AsoqRUNGjAgJEk
	gN4YKQULFoUJg3G/znvr6LD6c2rAbMLQm1o9PimwzVpIEDWBKWfkRtRVyOFNa9EcihnG
	uGQ7i1fo3N4SpcmIT3GnRNeSndYP58zvuqy8V+628pjHYazV0WV9YEWBHWVVVeJ+JfS/
	1k1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=esYLS9KjL3YZ7eKU7RlYXYQYB9fuPpY842+E8J1ujHw=;
	b=gVRUu6lx549z+gc/9PzX2h9H8NsDbtWeU7EJeN/vfA1PneR51aKd1yQy/inML1+TBR
	t436sUWvL0QIZDcbvbgTOC07rbTiE4iyJ5EwXaUR/bsPWz3PUrJRCm4YJIj9ftvMQG1o
	JfX77ehx0wox7SzxrDaU/Smx2HGI08yD9CgcqL4wyf4e/lcKAxEPIPqHpTNdVXww2+vG
	CuOP/EG/ptg+Cb0m+I0hDAwH4vulNiYbcFGWqZltFqG7LnMrYt3f4o1nUAeHetw7dbNB
	Cl1H7xH7KMsDgKoqjeDtg638tYKh/HbcNMNA0t3UUxI//8TyomwM1fvBLCw0C5RMMFfF
	387Q==
X-Gm-Message-State: ANhLgQ0E05///PqkPVcRUrMBvYyNZI3xBSM7UyEJvHwEaKep3V76KpiK
	LD5fOa+xiAIV7XTxmRP3BmE=
X-Google-Smtp-Source: ADFU+vs4GN502IOCL7b7Y4L0STzShoYi7bBBFdptX7Fxu0UbU38LfXyomLNcaizzCEirD0eiC/jBiA==
X-Received: by 2002:a05:620a:20dc:: with SMTP id
	f28mr3359097qka.30.1583333729305; 
	Wed, 04 Mar 2020 06:55:29 -0800 (PST)
Received: from localhost.localdomain
	(CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.240.214]) by smtp.gmail.com with ESMTPSA id
	w83sm13455065qkb.83.2020.03.04.06.55.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 06:55:28 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  4 Mar 2020 09:55:22 -0500
Message-Id: <92e84d3da50438e84d3c2c6c9f33260426419e7d.1583333447.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1583333447.git.bruce.ashfield@gmail.com>
References: <cover.1583333447.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto: common-pc-drivers.cfg: add CONFIG_INPUT_UINPUT
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
X-List-Received-Date: Wed, 04 Mar 2020 14:55:28 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following configuration tweak:

[

   Author: Alexander Kanavin <alex.kanavin@gmail.com>
   Date:   Mon Feb 24 10:34:00 2020 +0100

       common-pc-drivers.cfg: add CONFIG_INPUT_UINPUT

       This will allow testing libinput in particular:
       https://www.kernel.org/doc/html/latest/input/uinput.html
       https://wayland.freedesktop.org/libinput/doc/latest/test-suite.html

       Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
       Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 37282b2e05..964d2fe674 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "e3a0470f1ebedce56d1c924f8ac8d3638f52304c"
-SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
+SRCREV_meta ?= "13a856e7e5df0d8f951bd4060ac441cf35925c9e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 463451fa35..47fcc98d93 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "f0aeaeffb8ba6d0c24f9f0212fd7a11866c918b8"
 SRCREV_machine ?= "f4d7dbafb103e4f782323017c239c548871c1567"
-SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
+SRCREV_meta ?= "13a856e7e5df0d8f951bd4060ac441cf35925c9e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 5dd7b68063..53d5652446 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "f4d7dbafb103e4f782323017c239c548871c1567"
 SRCREV_machine_qemux86-64 ?= "f4d7dbafb103e4f782323017c239c548871c1567"
 SRCREV_machine_qemumips64 ?= "fcbec8b4f0f2f24a31ce5c6e6439c69f7512fb31"
 SRCREV_machine ?= "f4d7dbafb103e4f782323017c239c548871c1567"
-SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
+SRCREV_meta ?= "13a856e7e5df0d8f951bd4060ac441cf35925c9e"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


