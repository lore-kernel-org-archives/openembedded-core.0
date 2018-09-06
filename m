Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id B0ECA7907E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:50 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id f4-v6so8475281edq.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6Wdr6mHG7rl9kRJeT4YqK9t6vv6feRyHYQoh5B26Xfk=;
	b=Ao/whaHQvF9Op/076HY9cMoYktEF19gpNMLNFfBPXoYSu5yK65KS9o9CsS9hIPgppM
	61cMsu0CDKjGBgWYmov/5ooGLhNG7rYXnQfzCjBl74tAB3BViNBE+zHaIytYzyi9MuvR
	w+zmH415SVEvHvfkMu/cUZTIrpzVjbR3uioM8sAQukeCtMnP7jp3PsY7E6SZlOWmb/pj
	FAu9Sy8j5S83F9CVnRoL3CGojIuI7cZNw4g4cflQYfAmcniqmYhBMUc0UCzudC4Hu441
	fVS44Wx5MnuT+i3xpm7wMTZXnk1FJ3VWV+Eiw3Ybed5NjLacmomECoxKldHcGZv/S6i/
	V+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6Wdr6mHG7rl9kRJeT4YqK9t6vv6feRyHYQoh5B26Xfk=;
	b=On6fSQ/RpKct0PenYeJfqcn84Lh+chFXTQp2+JF3NVd6omLKmw5KpYSZFeEcnyPLcC
	5+O6gAQEW7trAvAO8yDKHvRaf1+89OpC1vugR2ypoe1RA2zoIvDDc64RTIpW2uZFDkVb
	QYUiIo3gA5EZkhRupJKL7GDye3vl6a7B2lARviEJVXwrnVo3tBZvnmm5oIH4TBLacAAI
	TvfkDzHqDM897Utb6DjSzTu/HWSk5lw6vAvKtLeZjzi2cjdRKqA9mzlbZ3t7d0TtniZM
	TZbDizaIMvrBsVdMmoVaJU2N4LFVVs+Uajf6mqslrJFp3I0lU39cm9JIktoexUec2zWS
	9vug==
X-Gm-Message-State: APzg51AnZh6g89oJKL8Vd4aLtjnGs7hJZWb+DUIHQhNcZCZ9jKRMSOfF
	Jkxtmsuu4zbxUpZ8/JLRidYOqupv00E=
X-Google-Smtp-Source: ANB0VdZFlT6LNTXU5alqtuGma8NQUK3CGci1ulLho9vY8zPgh5tYXRqvfDK4T3lo12p3opGlzb7f0g==
X-Received: by 2002:a50:e68c:: with SMTP id
	z12-v6mr2841533edm.275.1536229791358; 
	Thu, 06 Sep 2018 03:29:51 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:21 +0200
Message-Id: <1536229770-29600-12-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 12/21] cantarell-fonts: update to 0.0.25
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:50 -0000

See here for the "reconstruct" explanation:
https://gitlab.gnome.org/GNOME/cantarell-fonts/commit/e28a9096da43984212b5b4002b949bcb8c7527f9

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
index 9d8fb28..db480bd 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
@@ -10,10 +10,10 @@ SECTION = "fonts"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
 
-PV = "0.0.24"
+PV = "0.0.25"
 
-SRCREV = "07b6ea2cbbebfc360aa4668612a376be5e214eaa"
-SRC_URI = "git://gitlab.gnome.org/GNOME/cantarell-fonts;protocol=https;branch=master"
+SRCREV = "e28a9096da43984212b5b4002b949bcb8c7527f9"
+SRC_URI = "git://gitlab.gnome.org/GNOME/cantarell-fonts.git;protocol=https;branch=reconstruction-0.0.25"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!0\.13)(?!0\.10\.1)\d+\.\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


