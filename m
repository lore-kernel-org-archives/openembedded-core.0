Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id A12887E95B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 10:15:31 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id u28so4900391lfc.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 03:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cNxlrlsCR8MCMXnywjCx8gu+Bz6KVMj7zOYky62jnig=;
	b=Wy/jHcEBpD/GmStzXE5PAZx+YQYH/35C3Su4Ye70VVRv2kxxmk9yzOq3O2NH39WaED
	9L2+IV3dDMct48ONj88xWFZ6M4YJFUSnNOPrw+mZ6VGgBSndypTt3xoH5LkfMo2mvOwE
	+nEkg/x++GV7vDycekXv881Vyf9x2YGRDgYS3QmhoJ1G41MmePcD9wJjdHmMXh6jXoyZ
	+vHS9t2LZTYFPtqk/zqKavsTEU5mVh1y9/9ezknHvDBTr7onrymT7MtgVCCJtYr5n4OU
	fkitayyz2fSeX0pX3FmYJFKtkW1c47UF3Rd1GpVBAaJ3bvuRrqI6lT41n7sLPHVKpJVE
	Ck/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cNxlrlsCR8MCMXnywjCx8gu+Bz6KVMj7zOYky62jnig=;
	b=nCF2NOLpodYYqs6VMUmEMyq4t1b8UYsVVH+uDp741/bJfvrlh07iZyWcQG2AQZfl6V
	m3sVn4R7AAyWlmD4+jQ+0bNEnWrEEi0TV0G/eS1YgMkO4Z/sub23y6VjvGHEThFwqWFD
	727klMPCUwb0X11DiVTELxJrS5intloevWmcxyD1QpmyF0QQXrIcytJr7rxZK/pV+Bv9
	SKsXJf4Sdbn7ChXgKP4vDK1H7sKdTEqfaErmY/fk1mn5QyfyqjNL3EOAxz5ZKABC3D+t
	+hmTEVbf2KnwKL02CjVaI2huvFv9eL0JTohPY0d1PRuB/WjSpZgNoF5uXydkA+8VapGK
	zqeg==
X-Gm-Message-State: APjAAAWvbf5zQfUIFEhxLIMNXT/Ls14q8L1U9XsBCFDdrRnp81GIZs80
	U69F7Ok+n2kTajLBciRdu8dJKWud
X-Google-Smtp-Source: APXvYqymUusI09L05HJQnyH2wpRx3lxgILIshbqZ1GMmm/3gwf/RjnCauLbMb1wwbHq66DV9HO8/MA==
X-Received: by 2002:a19:ef17:: with SMTP id n23mr7766504lfh.109.1569752131984; 
	Sun, 29 Sep 2019 03:15:31 -0700 (PDT)
Received: from localhost.localdomain ([94.25.228.202])
	by smtp.gmail.com with ESMTPSA id
	d28sm2012918lfq.88.2019.09.29.03.15.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 03:15:31 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 13:15:25 +0300
Message-Id: <20190929101526.2061-4-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929101526.2061-1-dbaryshkov@gmail.com>
References: <20190929101526.2061-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 4/5] image-uefi.conf: define generic EFI_COMPATIBLE_HOST
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
X-List-Received-Date: Sun, 29 Sep 2019 10:15:32 -0000
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


