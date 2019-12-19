Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 270E27FE45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:25 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so5957789wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+aA8e37hAxI6pTWF630Hl7B2WR8dp4C4mfpbPLSDU9c=;
	b=Tlo+bE7VTiXAUkknyRNCBp4bJNHh1bzhmCQd142Zogj+OYLjMTcvpebXFsmbaBuLGZ
	zSpTHgYZjXQdIzjyLVO4JaFxXuzDw+vlvlLFb3HAwyuHRjey78Uip9Mb7a2ezhqjsX8J
	gqKhtFqM2Daxx9kHDcYK4s/wDxU9xNFu81vAZF0UXR1wi2IrFp1FFWQSycXKHg6YIrk0
	Y5/DCV4clBLl+/Ra6159M35bazbzfU7kZ6NFQwiTY7HTp60ZKaKOS49Knkeb2hutLZgn
	mpiHDJvhfECBD3AQUfGsyDMG/z/NyX88MDjtyF5xMbXxZdId9KiwsKJO4jWH9+lBcdEI
	MkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+aA8e37hAxI6pTWF630Hl7B2WR8dp4C4mfpbPLSDU9c=;
	b=MVzgL6xClRyTbo30u3zp4G1+qlWgQuCvkltHKXhcXeRCAWM4e19TmHIQk/nwwDjrn/
	INctgJDLwkw1v01EWIcxKDH8fnF+m1Q6iY+GazWVT/nr8jEiGwGttx2Xl3K/BqYfpHHX
	4vl2kW/imkwZ1++anXGu3851J8pYlhzvwTOtVvPJyqzMepkKVEAbwVWgJnPFR1wl/6gX
	IweZQ2OEGXVMzHj722FmUeuTkphm4Ro97OXB0p7YOmnJ6RvYGDkMOXHQhKna01k8m2sR
	c6/IaCWxhNH+8qa3cN9BsrBvLNPaO++ZPlWVWqu3DRAGQDZEagx2nzLME/lkBBm9xkjw
	F+hw==
X-Gm-Message-State: APjAAAUt6jcgeNoMpoN2gK3T8/xuNevdO6d/fG4dgXwKk/m9nGJYRl/+
	dxkEG4XA7iC+LOBNdV+6aJSTaYLXPME=
X-Google-Smtp-Source: APXvYqyHG7mT2gJsir4NVMiXy0vlpYAQ59CT9E/ifkN6G/FGsBYbJkaMflc78EdeNcj4GVPth/S9mw==
X-Received: by 2002:adf:f382:: with SMTP id m2mr9444689wro.163.1576761805402; 
	Thu, 19 Dec 2019 05:23:25 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:55 +0100
Message-Id: <20191219132301.80034-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/16] btrfs-tools: upgrade 5.3.1 -> 5.4
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:25 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_5.3.1.bb => btrfs-tools_5.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.3.1.bb => btrfs-tools_5.4.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.bb
index a44c0bc87af..86d88fbcbe5 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "f82e569b33c3c1cfd4f8f405085ff8d439a0a915"
+SRCREV = "d39ab9fafeb425d28fcaac645f7d663555fa654d"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.17.1


