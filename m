Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id DE1756D545
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 21:50:26 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id j19so18106744lja.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 14:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SXEfdmoUT6jKKu6I8hnhpSrDcMhm4apSsau11+y22eI=;
	b=pw63RjSGu4MjPsRMzpXw8MuB62ODdGmRg7gQvBXqOyPIJLTAcimTb5dBQqzy+aoBTA
	Y4C5lJV7JpteogkKSDskTarXzt5guyP3jPX1APFArSnOhkizbFSJAn3yIUnl4ueTlduB
	P5AJnn3mJy2sbo1yKeaB1eN+aeEqtddNRE3OMGnmuPyBE0XliTFrDIBCwZ5g9+i7Jm52
	swe0/2WUM4+TNRNGI2lVOeOUR7DNfUCVHk9Qts6aPlm3aygPUYAZrfg/P7nyyyWdMxB7
	Zqilaf5ElXw3oavTba8XK2kE1+iX03NU/ubClMkK7x1pNe6TOPZDyvJpru0qQ/x7xI91
	01Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SXEfdmoUT6jKKu6I8hnhpSrDcMhm4apSsau11+y22eI=;
	b=nlvUHgy7yshVng/EZhTLiQhH7nFG8dAPrVR2FE3BPA8I0RosUPVSpIWNTuUnOiaEJS
	RIRpocgxpJ1DxDHnMVUJad1+InUHmTwrqWYSDUUCOF/H3weaGXXKEDsy/FztJanNcc6P
	frs47F19t2RIW0TBlsZ2mau8v4Tyh9lxxZgKKSOk61qSH8ZfoTAo+mDZ7cG1PPVcWENH
	qyokO8LrNKzMf20br5sPohVIhnT50TzDZjUiG3zTeaQmoaXuMjCeL/x12c5a4ntHD49F
	Sn7r2PJjHbcKNhczAtQP6zoHPLrQxUrU7OBeAwC3+CLTAygN/KI+K9eZSs0iCeFEMFrj
	TwlQ==
X-Gm-Message-State: APjAAAX/Cl3/UZRgwSD6/fDbA3UwlQlabkOUNDRr5MTYXUBp7KyAVahE
	tVLWcrdPpQg/bHPKFPXCtWojz5b93ig=
X-Google-Smtp-Source: APXvYqw/5LpduOW0zI3nxNS7nAYjEvv+Qpmy/Vspi2poFzKzQuxRBnLIRUCfAMJ7LZmELSfMszwM4w==
X-Received: by 2002:a2e:6e18:: with SMTP id j24mr7033959ljc.57.1571089826934; 
	Mon, 14 Oct 2019 14:50:26 -0700 (PDT)
Received: from localhost.localdomain ([188.162.65.242])
	by smtp.gmail.com with ESMTPSA id c3sm4418076lfi.32.2019.10.14.14.50.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 14:50:26 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2019 00:50:14 +0300
Message-Id: <20191014215014.9656-5-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014215014.9656-1-dbaryshkov@gmail.com>
References: <20191014215014.9656-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 5/5] image-uefi.conf: define generic EFI_COMPATIBLE_HOST
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
X-List-Received-Date: Mon, 14 Oct 2019 21:50:27 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/conf/image-uefi.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/image-uefi.conf b/meta/conf/image-uefi.conf
index 57fd18f02742..6173785d8327 100644
--- a/meta/conf/image-uefi.conf
+++ b/meta/conf/image-uefi.conf
@@ -13,3 +13,5 @@ EFI_FILES_PATH = "${EFI_PREFIX}${EFIDIR}"
 require conf/image-uefi.inc
 
 EFI_BOOT_IMAGE ?= "boot${EFI_ARCH}.efi"
+
+EFI_COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64.*)-linux.*"
-- 
2.23.0


