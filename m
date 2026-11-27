Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18133.1795794429523240521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:47:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Zgq7IIr/;
 spf=pass (domain: baylibre.com, ip: 209.85.128.52, mailfrom: ddrake@baylibre.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so28205745e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 07:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795794427; x=1796399227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cpcjv9HkuBUcJMrz37/WzrjJrvCTVzqb1HGdVjkuApc=;
        b=Zgq7IIr/68vXHTvQtq2ExDLfCddB6ANnB/vfzq0CQBOckGQY58pnvI0xzzYCzn0kNZ
         6GYYVN2nC/2QKcKELYR4VMW5E88u1jQpyA9Zv1jrU/Fuk/oBsRHxKBR1rWFoODlx2Sx1
         YrKyUfNHKIXkIzN08RKEpHZt8Ft0B9zovwZTpieunrpNyNrb1TZc/6DLNmStU0neyWjW
         6QkaJKm4FgM0wnRw1OinU5Z4O2QUT5dbej0gzCMTU37X+SF6V4zKAeZKR4rvMbnS+7Ka
         zMlPEAI/BeZpbCzS9Gv0FgcpcF/6BMx2DahP1o1uhYX1gF/UWsG/UT/XpteMxnlKeT96
         Y7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794427; x=1796399227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cpcjv9HkuBUcJMrz37/WzrjJrvCTVzqb1HGdVjkuApc=;
        b=RK9HLF5Jnz3peKIv/zOnuCpFkoOYVSZvGyh4HQtjIyH+eS7WGHt9AI9m4U/2XY8aIe
         EmwnUJQmgO8Uh3NQerkBqoNrQUeKQHiJTxyA2eWX4+ly8CrI1iaehVg9FuLrImiVMZCq
         wSPTUFSGjrJvbu2ZcRLuqvcDK+YRyxrR8d452QMRaIr9oZs3GaruSuMkQQ9ppWYyswXU
         M0Q5OX00dVAB8SLfw6m2m5qsEAwNzHFX1Q+S0ceUd0HZJjhWBucVOtMo8dubOG3jksSX
         EzsGI9psDGzAL0nsAwfdA4gHQ3WwR0iXjHbrhxwTiO6YnWRudSUNadHzJ5nN9lMcMXtY
         46jA==
X-Gm-Message-State: APuU4Z9Dw7saxDWUslT6pkDDb57rVImNBiJRDP7udQVLwLkAgvAGanb4
	DSVH8MGkyiR4q6/BODY3BqRBCNkcWLeg1L/8fZSwQzCioR3eGv0gpMKsneGCI6rFZAG46fbvU1V
	urjf4cK8=
X-Gm-Gg: AZFdTZfDj8XQRIzLOkuspkFwN1KPRxwIVe5SJMZxiLsnUHbcgFkxrjgZHVuB6NI7dCQ
	OAO3bYIbC6TbR+OD/hdva5utAtnrN9ihsPmQp1XWcsHM3GPyFGps/+89lk9MpmidCz+fL2BwlOW
	KyV4yJ8TT16lCNlKR8lM5OHKuGhXffWPY/bcp6f6uITo0/Bczzly4c2sZjNRFjaNAk5DqiJzZp7
	2Rma0C6m0rzU6pKacE6HI+sGli5nC0VlIm9vVKmJEO36xBb6Sa+aeQz2wmC304siHhERZgFYUha
	O8YUhEB0sIt9MIY8WpbEJzwkOnlr8twrY1SaWcHnUbxGsipKx4xumqBxgUQr54RhSef+uAUWw0w
	W3ID3cKSOLVvCGVca9rS9QG5jWT08pgpYw87tm9rAVR5bYhPF4QKU8ZGEhwcs8WhieddTOm5vRI
	zJaJn39IJBTr7fGKstYL2bhaWW8w1M2YYxC+667SHG/0K2Sl1+u70wR1XoFagtfJIaTi/w2rOV0
	HuIHo6LKWrD3yT2xFLpI1kbgPZ2nr/q37Z1EbZa/3eZ8NqYwpjr8zw19XnQToYVbd1JqyfERexf
	UHMGjDMDrcLyDhN0ewDNqdOBHQM=
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr525019445e9.6.1795794427490;
        Fri, 27 Nov 2026 07:47:07 -0800 (PST)
Return-Path: <ddrake@baylibre.com>
Received: from numbers ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm350261255e9.4.2026.11.27.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:47:07 -0800 (PST)
From: Daniel Drake <ddrake@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>,
	Daniel Drake <ddrake@baylibre.com>
Subject: [PATCH 0/2] mesa: upgrade 26.2.4 -> 26.3.1
Date: Fri, 27 Nov 2026 15:46:50 +0000
Message-ID: <20261127154652.253316-1-ddrake@baylibre.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 15:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251402
Content-Type: text/plain; charset="utf-8"

Upgrade to the latest release.

Mesa 26.3 Vulkan/Virtio builds now require the external venus-protocol
package which is included here as a new recipe.

There was also a failed AUH attempt from 2026-11-19 ("[AUH]
mesa-tools-native,mesa: upgrading to 26.3.1 FAILED"), the patch it got
stuck on can be dropped.

Tested on master (39019629a4) on FRDM-IMX93 board, Mesa ML/NPU
functionality continues to work.

Daniel Drake (2):
  venus-protocol: add recipe
  mesa: upgrade 26.2.4 -> 26.3.1

 meta/conf/distro/include/maintainers.inc      |  1 +
 ...uiltin_cpu_supports-for-avx2-detecti.patch | 55 -------------------
 ...gallivm-adapt-for-JITLink-in-LLVM-23.patch | 51 -----------------
 ...er-jay-jay_ir.h-do-not-used-typed-en.patch | 36 ------------
 meta/recipes-graphics/mesa/mesa.inc           | 12 ++--
 .../mesa/venus-protocol_1.1.3.bb              | 20 +++++++
 6 files changed, 27 insertions(+), 148 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
 create mode 100644 meta/recipes-graphics/mesa/venus-protocol_1.1.3.bb

-- 
2.56.1

