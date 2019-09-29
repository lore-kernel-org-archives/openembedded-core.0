Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 843607F273
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 20:14:05 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id q64so7240599ljb.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 13:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cNxlrlsCR8MCMXnywjCx8gu+Bz6KVMj7zOYky62jnig=;
	b=NV4W0A2It6m+IB6yhZMLzRGOoaAI0rDydyRs1WA/wuHKFVS1o6JidV1hVM5yjC3ZLw
	tBWw1y1mtOATidUOOUPMzequi9hCdjY+UMpDwoNxJxF1hMVh/61n9Whd7P9jIxUMrDrd
	upWU5tRm0viULzqCHk/zjF2f76pE/M42NsyAHfTbFldb9aUTU8NbYzr1HGJNpGp/E41O
	eUCAYym0EsA1FwlWRSMfUK4uq2EM2qaGMYbOa8Xi0y7Ei0b9nItrQB9bNOH/1r9tSelk
	9pF8AyNmNHcPDsCHZPYu9/iwz6hFopeZl7WLedFVhgjhIoJ5iXTJSw5UvUlKli4H9iNb
	uniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cNxlrlsCR8MCMXnywjCx8gu+Bz6KVMj7zOYky62jnig=;
	b=gO45VTe5jS9D5aAjX/PZCdy5E0zqbCA/t5/gejkqy/kYUIS5EdP07lFzJ2b/vcfvbt
	I9LJUUDOiIpnfp2JdjFESrqhD9dRN56y+5Sf6UIEedSuWEjIUr/+tXDviXDylVFNov2n
	NXrTQ/wfjtsy5q+3GqhH/0qK0Z4TbSuJjrCFWkkeNz2JhCXgERkPJ6CmnPE2GYmez6ln
	M2pqOzxuVznD2OYOSG+wFiMLZfQakFFAfzggBoLhJ1erl46S95QpFLK9C26JF/0gggLH
	R+AMU/Y/IH7avIXhfkKtKzMJxt4QGy8Jbm7DzCGLtgg0xlC02//T60LK/XF0apAVRha4
	KEQw==
X-Gm-Message-State: APjAAAW63iba2z1RLdbEevCgRrn7VBMqlM0B/lTCGebpF7vk55g4xYsJ
	XFC6w9zx5FiKJu+Teit/ZIHVGCA0
X-Google-Smtp-Source: APXvYqyksR5GEs2/ToccGDuCXg17rIKqaUre/0NdlH0Snb75ebBKI815s64kAnrPW7Z58aWwffiLZw==
X-Received: by 2002:a2e:924d:: with SMTP id v13mr9624534ljg.226.1569788045889; 
	Sun, 29 Sep 2019 13:14:05 -0700 (PDT)
Received: from localhost.localdomain ([94.25.228.87])
	by smtp.gmail.com with ESMTPSA id
	w77sm2414685lff.49.2019.09.29.13.14.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 13:14:04 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 23:13:58 +0300
Message-Id: <20190929201359.9837-4-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929201359.9837-1-dbaryshkov@gmail.com>
References: <20190929201359.9837-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 4/5] image-uefi.conf: define generic EFI_COMPATIBLE_HOST
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
X-List-Received-Date: Sun, 29 Sep 2019 20:14:05 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/conf/image-uefi.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/image-uefi.conf b/meta/conf/image-uefi.conf
index 669c16d42af4..19729c401dfa 100644
--- a/meta/conf/image-uefi.conf
+++ b/meta/conf/image-uefi.conf
@@ -16,3 +16,5 @@ EFI_ARCH_aarch64 = "aa64"
 EFI_ARCH_arm = "arm"
 
 EFI_BOOT_IMAGE ?= "boot${EFI_ARCH}.efi"
+
+EFI_COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64.*)-linux.*"
-- 
2.23.0


