Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC90C36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 21:55:12 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.8373.1742939703774672644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 14:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IfpnF5oE;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2239c066347so143411215ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 14:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742939702; x=1743544502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L5QDZq9w0zITjlxekJR9VrDYLRqvMogiRPQcM2gff18=;
        b=IfpnF5oEbXqhl0vEkI/voIEOX7wAFTklcjnj5Q58SYmQCFpm5MJvkdeDI1YT4ymTyD
         9SRzMKO400864YlS+nAGuZQq1/y9ebfIyiX081klm9YpapYcRZyAUbZFXSgAmbmydqfw
         5BM16Yx9dwzo7Ytvb5S58+XgSA0pqeKQgPsFJE3cJojGyHyBXfXE3inijaTSIB4b5bFA
         l07Tv2inXYNBbWkGJMvJv4Yq5xwJVuKl9QC5jG0H2KwvV91Du3M3b+lBkhqgzSg9TlHn
         5LmwzFzIB84x+vJI2xyXEchTtnnvfkDG5Li2noRPuhTB+dNRQq2VCo2rkylNDFG4APgr
         OChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742939702; x=1743544502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5QDZq9w0zITjlxekJR9VrDYLRqvMogiRPQcM2gff18=;
        b=kABDTaTlTAzlo1f03jMyQM5WGGLJgvBfnyhxXnfDQLJIZRQWgyQuBMxTmsezGI7phY
         3BfiAkPq9Aqasse9rBkkJnpNvZuvaYe6sR0c+2rjSA+JpWBUb6ujbl7hmQSE+br5wJqn
         Jb3RLlvzKlHjvkWPnSz4PHSGDU8qOQ0BhDwLl2RVnQcLYc9Z/YK2jrQgCpdKuXH4LN1v
         fbQ90C7TaryD12o4XAhZWd17MYHZCIhkfmv4iIsTB7EJ1qU39QWITxWYaamXv/6jyTUR
         Gc5g8MgCkPSOi/tH7fTYzgbnnskuTw+m1FTYLisQSmMexBt9EJHXvoV4Z+GuzuMjIz0Z
         /HtA==
X-Gm-Message-State: AOJu0Yzo/1NE/iLR60qzLo5Q8u/zuhjEjFC5wItWS4dsN8vN7UhiTnop
	bfLgpxaSH9L/6X+181zN/bs4t9IFBElaswgvDvFMYnOOw8Lx6eD9Mu/X/g==
X-Gm-Gg: ASbGnctvcEAEaw8Tcr7IgirlQY+F002uW6kkNPbsPA1lCPf+9tsRpo/RFGnWGdP1oC/
	nenE/ErBNlOPw0A26aHYadxpYyOPIEdVkQcNh5WLYCSoYYBJ7ZhjF2Ey5UGkMzwh4ED2bmUAHI5
	yfNK/0n8VkLLKQdfnZfSSSs0mieU3+v/gC4wRrz8TLkxSsKfA3oTT5Zmrdn7QdC9YyDdM/8kdTO
	UtGsEQNswBFEI49/KmT78UpFwPIWhQunVmMuV/FVB97+9oMn7ZsjxXPlJdP/CXamj/y05ZAzW6R
	2hUBkipKoZJp52NDpduJQHzGaM/05x0ZvJJ4hkDyEsvvlxrQTfB7BrHn7z44rFRn0xEq4J4=
X-Google-Smtp-Source: AGHT+IHaAmmlgIqpXhezJi3eDwOPWNlJq7/h93c5CMfBrv70c3C8rJZlrIUMCNkXrcTm4esahWRnXg==
X-Received: by 2002:a05:6a20:7f8e:b0:1f5:7d57:8309 with SMTP id adf61e73a8af0-1fe42fd12d9mr28194009637.21.1742939702358;
        Tue, 25 Mar 2025 14:55:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c1:da40:79cd:9ebb:d848:99b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fa97fdsm10717612b3a.26.2025.03.25.14.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 14:55:01 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [scarthgap][PATCH] linux-firmware: upgrade 20240909 -> 20250311
Date: Tue, 25 Mar 2025 18:54:44 -0300
Message-Id: <20250325215444.11125-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 21:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213622

From: Hiago De Franco <hiago.franco@toradex.com>

Update the linux-firmware recipe to the most recent upstream tag.

Since commit 515022675f81 ("make: separate installation and
de-duplication targets") in linux-firmware, 'install-nodedup' no longer
exists. Adapt the do_install function to accommodate these changes, as
done in the oe-core master branch.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 ...20240909.bb => linux-firmware_20250311.bb} | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240909.bb => linux-firmware_20250311.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
index 30c47d772088..2ba362ed3b33 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
@@ -154,7 +154,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "6ae5ffd807c84809977286ad0b37acdb"
+WHENCE_CHKSUM  = "886924eb733c4efcec21dff980795771"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -241,23 +241,35 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "943fbd19883cf8eadf89e0b22422549db056557b1ecd30a56400615971369671"
+SRC_URI[sha256sum] = "b1083a36f19aea46f661dcfd4cd462d13933dcb4e7f0dc809525552dd5c3541d"
 
 inherit allarch
 
 CLEANBROKEN = "1"
 
-# Use PACKAGECONFIG_CONFARGS to set the Makefile target
 PACKAGECONFIG ??= ""
-# Enabling dedup will turn duplicate firmware files into links
-PACKAGECONFIG[deduplicate] = "install,install-nodedup,rdfind-native"
+PACKAGECONFIG[deduplicate] = ",,rdfind-native"
+
+# Possible values are "xz" and "zst".
+FIRMWARE_COMPRESSION ?= ""
+
+def fw_compr_suffix(d):
+    compr = d.getVar('FIRMWARE_COMPRESSION')
+    if compr == '':
+        return ''
+    return '-' + compr
 
 do_compile() {
 	:
 }
 
 do_install() {
-        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' ${PACKAGECONFIG_CONFARGS}
+        sed -i 's:^./check_whence.py:#./check_whence.py:' ${S}/copy-firmware.sh
+
+        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install${@fw_compr_suffix(d)}
+        if [ "${@bb.utils.contains('PACKAGECONFIG', 'deduplicate', '1', '0', d)}" = "1" ]; then
+                oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' dedup
+        fi
         cp LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
 }
 
-- 
2.39.5


