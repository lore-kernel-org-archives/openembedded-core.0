Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2036C129
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 20:14:04 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f5so7261886ljg.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 13:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kiAVVRIzWAm9si5a1MXXkHTuitgrHY9mEBcMvm6H4jA=;
	b=cz8SiRl9wB7H6uW7C9ugIhotEsIR0rBtqJSPiqEElHA8QP0+AXnMLThkVCVyr5ZILp
	k8SVRmcO2CCJFFEM+ry40yrd0psjRNPsDvMRfPS3UZ/nD1lLWrCNiwV9/181tW7wNTg2
	rUe+irdRQEuwU915cnlp/gOl6ykjVhovb8POGGZ/NyTrPQRUBp6fQAzef5Oj3Et4oq2q
	pK/bQaDfbELdqkCP/Yqd1MlOerAJJK89dQO2fPi+UuB7wMoDwdAM4jPXBRUdnGeSwIgJ
	iuTJ6U5qCtGj3TK1+z008eoDk1+OeShq+nE/pr8mOw9kOMxV4QDO4qCf5oRrowcbn5F4
	CF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kiAVVRIzWAm9si5a1MXXkHTuitgrHY9mEBcMvm6H4jA=;
	b=izZiNsFqT2F9eGqZRcP8ASTfM8QXjyjpSTmgoY9e7W8aMy7zozM8cPXxWOo13B1oOd
	eZfy71tWZeqRoavhodGgOMlQnrdHxgz+Sf/JysQMZN42n8xlUrjF/X6aqxnG7aIB7Fy7
	T3NMg5pwZIxk0cGG5LR61nRrU1G6tvd9zPw4krG1WY2HY6t3QmYUztphl7+aabT8Kwgr
	+8S0a6PGLM1kWe7JpOoucqmnkLmWIHfRebvJcZ4EKf6EwFZOqhc4LOL0zOkRPuUHHIti
	mNX0LP0LmhHZV17H01Zsdj/clhT1PXeE4f/3m+IWwa8Sqm36hbC11UcAJ8hs3quMgpzv
	7Vlw==
X-Gm-Message-State: APjAAAWeA3hTP/Ru+7+5tfRa4NDPzlb4WfOL64LsUQspBADPAPFEQFSd
	YLAkHcVUcm4/jYM0yUSxY3NqJASr
X-Google-Smtp-Source: APXvYqyGdCMW6DtPhCHtXgCpQQXYaytzO+TFPe1RZ35rsV4Ac76QHi6Rj+CWS0JY3gMY9DosZDs8dQ==
X-Received: by 2002:a2e:9798:: with SMTP id y24mr9847024lji.150.1569788044458; 
	Sun, 29 Sep 2019 13:14:04 -0700 (PDT)
Received: from localhost.localdomain ([94.25.228.87])
	by smtp.gmail.com with ESMTPSA id
	w77sm2414685lff.49.2019.09.29.13.14.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 13:14:03 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 23:13:57 +0300
Message-Id: <20190929201359.9837-3-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929201359.9837-1-dbaryshkov@gmail.com>
References: <20190929201359.9837-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 3/5] image-uefi.conf: define EFI_ARCH variable
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
X-List-Received-Date: Sun, 29 Sep 2019 20:14:04 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Define EFI_ARCH to suffix used by UEFI on the platform to name files.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/conf/image-uefi.conf | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/conf/image-uefi.conf b/meta/conf/image-uefi.conf
index aaeff12ccb80..669c16d42af4 100644
--- a/meta/conf/image-uefi.conf
+++ b/meta/conf/image-uefi.conf
@@ -9,8 +9,10 @@ EFI_PREFIX ?= "/boot"
 EFI_FILES_PATH = "${EFI_PREFIX}${EFIDIR}"
 
 # Determine name of bootloader image
-EFI_BOOT_IMAGE ?= "bootINVALID.efi"
-EFI_BOOT_IMAGE_x86-64 = "bootx64.efi"
-EFI_BOOT_IMAGE_x86 = "bootia32.efi"
-EFI_BOOT_IMAGE_aarch64 = "bootaa64.efi"
-EFI_BOOT_IMAGE_arm = "bootarm.efi"
+EFI_ARCH ?= "INVALID"
+EFI_ARCH_x86-64 = "x64"
+EFI_ARCH_x86 = "ia32"
+EFI_ARCH_aarch64 = "aa64"
+EFI_ARCH_arm = "arm"
+
+EFI_BOOT_IMAGE ?= "boot${EFI_ARCH}.efi"
-- 
2.23.0


