Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3E19E7C9CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:24 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t18so23019980wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zhdFmaJZmdmP6kX+XbgG49dVB9Civ7EjOQC9wJNUmMk=;
	b=PQH1NUElsFJ6qcEWRRcq263E+cnVq0WDuL8HRHK1bZJyYlnGV5hG1ot5us36iwxupj
	JOE11TO7f9+Aj5jE3uEI89zaCZIK9SD0cEpTJ+7I6vonH6ug24jxI5J1kEQFDIDfgVVC
	jwxqjJcY4IXURlqJYhSatQH4cXuM+AwgwkIoTU6Ngj1NsTmErMayIU0s34C/qpcwyBW9
	o08xuIT6TaS6brm4ZN36VygFMY06YrhqdEVhzob1Nu7X9ia2yNqJC7p3Ef2zhFSWXKyy
	Vm7/PjNjr1augLF6Aed7YIciYb5PZ5KOzfQKDGmQkdVX+kUaXEQfoJCpmBRk4Zia0sbf
	rQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zhdFmaJZmdmP6kX+XbgG49dVB9Civ7EjOQC9wJNUmMk=;
	b=Bph2Q1eoVwpOJN0ukPILN65fgV+yWmqRAWoEt72R5Y0W2B1C0D0zybiEGBjFrkE4CH
	cORkXaRMty3eeZdEjLegH+et7u9GHEPxlf/VETVD05I7hrcsALwUrYiyX+Z3PLGUSqb9
	t7qWr9e6tBuAju2e5ZPcD/rUrpD+CYfFEUSqCHVjV8UFSzkVmb8tty0elDmvM646rFNT
	FrXts/c6gdg+LdOI9jKjuClWeX8xhVaNDyTYvsTW7JkbjlQ5lrjNxTqEyyqGqcTBrZSG
	2YSh2xhokw7lxS70lMQgN07iXoJV9yCT96MHdQeCYnVnF6Ha3/fwDBqml2yGbdD86SUy
	s3Vw==
X-Gm-Message-State: AHQUAuYO5Rblev/jiaQfnh+hBKZeDe/cvg9pRaJvDYQBvkMq1czUVJAO
	FVA63g8Hoh7n3TASOz4yBkSUNTfr
X-Google-Smtp-Source: AHgI3IYMd8vobtYM6Kjm418/E5WHaUxLLtWJ6uPs3sntHWYoRNj4V5B/3b3dmNUoLvcqYfqCoNytIA==
X-Received: by 2002:adf:b646:: with SMTP id i6mr22327806wre.262.1550598444756; 
	Tue, 19 Feb 2019 09:47:24 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:46:56 +0100
Message-Id: <20190219174712.60694-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/20] epiphany: upgrade 3.30.2 -> 3.30.3
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:24 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.30.2.bb => epiphany_3.30.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.30.2.bb => epiphany_3.30.3.bb} (85%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.30.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
similarity index 85%
rename from meta/recipes-gnome/epiphany/epiphany_3.30.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
index 3dd699d4fe4..a64c82f48bf 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.30.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
@@ -13,8 +13,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "1b7c072880562c33f52a3347a94bfe6c"
-SRC_URI[archive.sha256sum] = "8c7ef1e51b9fa825a43a603265ce8b06cacc42229e9337c8611c357bc65a8104"
+SRC_URI[archive.md5sum] = "fd05702b1c9bcb6a0633de54c4a6ccd2"
+SRC_URI[archive.sha256sum] = "76cdb8db6af2da8c3371a73e2dfd5ba64867b5f1e65fa9621f35348a42ff0d17"
 
 EXTRA_OEMESON += " -Ddistributor_name=${DISTRO}"
 
-- 
2.17.1


