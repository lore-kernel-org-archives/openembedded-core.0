Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2E560155
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:46:12 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id x14so3128211ljd.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 04:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7sTELl6qYzhKvydY4YZme1zlcVwBL7QpA91LsVfMBBs=;
	b=gCP7F+ZitFOJH7k95Eeld3m/R8rDXdVsLvXv40R7xBOLBvoonjlmmDdZzbLggheJaK
	m5xXsgkGE4jcpUYKyVp/Zma5puqRmSDF3AEU3KJ4OW2Q6+fA961/7Q8p7M4tFcmufYtr
	e4LyGugK1hzjtIFyiYARVprxGNLKpC/NMlxNimfAjfTRIR4PTkFDI298I2GYjpA1MrJW
	TOweJGkxY0tSJYKnLa2lZHP09wz8Aw2LxX9LO2pSRNYh0tUL603XxYAT6Hhdr1ZwS1AE
	hPLaMwL/8LJ1ZXwF7X3I0KNKaBot3yE6QGJiU8bRCDAFJzPo7OQ1sktBAEVKpAjYouK+
	wbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7sTELl6qYzhKvydY4YZme1zlcVwBL7QpA91LsVfMBBs=;
	b=a2J2nQZEkyH2u7ELLV/FrpcDIA9FXDG6MAMkw9o/N0PVnuu52u17qGax2c+iuqCT+4
	tNLv6EdI1phXkRizhUVlNV7mG9EkPvKzJuEm78ijg1OQ0EjQU9WQUleT2+BpKog16iuU
	3viEtxbJKyGKYw+Ng9bXiAtOu1WR59IgDxoI1rtliJrpW1CZ7yc4433tE2Cw0GMrMNHi
	9j0WVIWaLD74FEZYlDHZlWSh1Dx3ShgYqYIJMHIGmiDhcTUbOKbyWTV+kFscK2VmvS3D
	9rI5B+EeNxZXeFQog1c8s21mpCyJKyJbhu4aG/iIavmpbyxXj6NzHJOVFMdCo8Y07pHe
	cBQQ==
X-Gm-Message-State: APjAAAVCKtD0DrbrJg9VVr2JYJhQxmX5F5iWgLCr3+aoqghknzRNpJgv
	99OCYpilXKIDdifAt86s1EsPSc0z
X-Google-Smtp-Source: APXvYqy9W+pj/6JWFu/Ep8fASSrI04uy+mEEu+vKOKNIl9jxvAIshuzXNrjSvxmtuI+ttsWClsFXcA==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr32770127wrr.32.1580288889344; 
	Wed, 29 Jan 2020 01:08:09 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:18 +0100
Message-Id: <20200129090738.1398-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/24] speexdsp: fix upstream version check
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
X-List-Received-Date: Thu, 30 Jan 2020 12:46:13 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/speex/speexdsp_1.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb b/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb
index 2f934ebe3ab..63696467613 100644
--- a/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb
+++ b/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8"
 
 SRC_URI = "http://downloads.xiph.org/releases/speex/speexdsp-${PV}.tar.gz"
 
+UPSTREAM_CHECK_REGEX = "speexdsp-(?P<pver>\d+(\.\d+)+)\.tar"
+
 SRC_URI[md5sum] = "b722df341576dc185d897131321008fc"
 SRC_URI[sha256sum] = "682042fc6f9bee6294ec453f470dadc26c6ff29b9c9e9ad2ffc1f4312fd64771"
 
-- 
2.25.0


