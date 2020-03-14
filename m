Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 25D3F6021C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 16:06:52 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id f15so5692145pjq.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y6yKUbs9FpCFrUElusR8y+PjgoLNP0FK3H58S6KsS0A=;
	b=Nd8Fofs/vz0RdpTe5rJwWdL4iOZhDK8pKVCtI/f5YZC6EQSeJ2eJb9AWAKfYHnn9KT
	4PuGjihPrfvREzVFurk2sjT2NToNDeQtEw1oSs/YvA3GSlx5nZ0JKAHw3x/n6KJ+OFRK
	Kx9dmSzsVfXseMv+mrPk2kCd/gP44Rsriw1bPHTMA+uzo/fPYy+Z6wX99sULXPgMKpkK
	TzY64IU94tPnRk6kerdGGT0ZLaZcDOJ+MkpSyRV4ajrh9DksV+IXSN+l3ixtwIYNYadg
	PYfYAe7tpuyvWY8vH5J21Zfr0LHc9uu3j5BnH8hcgkInLkug7aUIciXeL67pt7JVahKt
	I9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y6yKUbs9FpCFrUElusR8y+PjgoLNP0FK3H58S6KsS0A=;
	b=FYx5QGPS0iN526kPxcLN4pSsOqlCjt7p4GZDVmLN4F5HHuT6e6OeZvnce0uurkiQuR
	D6OWGeHjEV4lGHPnbZ1Vg1M8kwvIDwcl5VLAgnt0JrWXLJ6DrNc+pHPdF+CWqKj0sGsO
	lrp4MQ/NFLC6ibJHc2x3RMkDea/zUQEl/EhqT3l5q9NvV0duMFhY5tt7H54AKhI2tnlS
	48z8puWSObd1jQ4mIQDGxi4Qo5GlWzv2Caay/7YmQEC7RPpyaFLYZqwIAEfS6MWAhQuH
	05FyO6s+dYgMELqw67fBIBztJfvOcVCiwzPxcnI/WlzBVcbsNXHmDfzMKzrEkMBWjnek
	HnBg==
X-Gm-Message-State: ANhLgQ1vUpdyxIncjWyP/waNDzS5nGDr/Mig8YC6A/to6UsZZsJUCse/
	B+ehzjs4QiGJH3YSdVLSPosx18kfxs0=
X-Google-Smtp-Source: ADFU+vs3TPBH+Tlos0HdMROpDy1IHMe7wY+AtX2mQGRjC0Velfa2cofm5U1VIMd6K7yWrJEMBMxXig==
X-Received: by 2002:a17:90a:5d0a:: with SMTP id
	s10mr15761283pji.166.1584202013536; 
	Sat, 14 Mar 2020 09:06:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::af11])
	by smtp.gmail.com with ESMTPSA id
	x15sm17337695pfq.107.2020.03.14.09.06.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Mar 2020 09:06:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Mar 2020 09:07:06 -0700
Message-Id: <20200314160706.2796013-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] bison: Update to 3.5.3
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
X-List-Received-Date: Sat, 14 Mar 2020 16:06:53 -0000
Content-Transfer-Encoding: 8bit

bugfix release [1]

[1] https://lists.gnu.org/archive/html/bison-announce/2020-03/msg00000.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/bison/{bison_3.5.2.bb => bison_3.5.3.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/bison/{bison_3.5.2.bb => bison_3.5.3.bb} (90%)

diff --git a/meta/recipes-devtools/bison/bison_3.5.2.bb b/meta/recipes-devtools/bison/bison_3.5.3.bb
similarity index 90%
rename from meta/recipes-devtools/bison/bison_3.5.2.bb
rename to meta/recipes-devtools/bison/bison_3.5.3.bb
index b5b4a8ef76..09e4b18f9e 100644
--- a/meta/recipes-devtools/bison/bison_3.5.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.3.bb
@@ -13,13 +13,11 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://dont-depend-on-help2man.patch.patch \
            file://add-with-bisonlocaledir.patch \
 "
+SRC_URI[sha256sum] = "2bf85b5f88a5f2fa8069aed2a2dfc3a9f8d15a97e59c713e3906e5fdd982a7c4"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
 
-SRC_URI[md5sum] = "49fc2cf23e31e697d5072835e1662a97"
-SRC_URI[sha256sum] = "24e273db9eb6da8bbb6f0648284d0724a5cbd6268a163db402f961350a4e50dd"
-
 inherit autotools gettext texinfo
 
 # The automatic m4 path detection gets confused, so force the right value
-- 
2.25.1


